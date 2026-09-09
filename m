Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B6348C7B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939278; cv=none; b=F3MueByT9TUROKKTdFCvb4/IAgHn73ouS1ZVYTp7vNDxRJseNrp7aOV9RqGTq3yY5anO6d6rWq/1MmCOt7Nit1tcu+pUz1vW9rB+DHsTc5EMz9dhRVwB0J0oZBauI6hlJk2lMAUbRBCDnmsyTNH7MW/+6iAc97KXBdbmjts7Wbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939278; c=relaxed/simple;
	bh=CczCbysowyp09bTB4RwlKpI0GONpEfI6a0e2p7j5C/I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZLvEPFjasKvIGhpRZIw2s91m+yK2Zesj0QM+XVTthqdaMCOaueyifohWtKI80ja3UyAJH2+e4bZ56NhQlsvzfTBQXHwKAw4yppFZTSKs9czicCmCBZRyZ9m379sbUgGLvToKwZ951fdtcy2HD4UVKDIoERB8xNBzlyRV3NpWdDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsev6Ua/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsev6Ua/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5351F00A3A;
	Wed,  9 Sep 2026 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939276;
	bh=YV6vJiHkxKjkEjy7Pkh7XDkO297AeAXSrU8Uen/TxIg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Nsev6Ua/o/ASiY9cpHKfyZ6CGMPHWj8KU6JZPyNZ7JiDJNts4cA7KvE5aSlqjlC+o
	 0JgBRBR6YDyw2dflhgWi12IGJ3JHCPSLrOFaW/fODdcYkxmuGG7R3hQDQSu30siTgy
	 vE1Kv1ZfLUd9ir1dhAGnN5lG/VTs/G0caDgdLjGRe7Kc6Sg5SdipjLtXo6Xyib9hlM
	 mg7Wcp1r+lhh/xYeznid0vj9++KZDYe8zRUFOY0rtj6rIe2ciUW2j+M0GC3kusA4h+
	 w2/mazZFV0ARdc4zeMI+/oZJfBkX+f9oSjpgVIuH17b+4TFISefVKJc3zqMUcgov/L
	 PP+uL1FuGbQIA==
Message-ID: <823eac07-808f-4b8e-a289-538ace853e12@kernel.org>
Date: Wed, 9 Sep 2026 15:34:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 06/14] f2fs: prepare mmap write faults for
 large folios
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
References: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
 <20260907073434.2349510-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260907073434.2349510-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 15:34, Nanzhe Zhao wrote:
> On Thu, 27 Aug 2026 20:36:02 +0800, Chao Yu wrote:
>> We only need to call f2fs_get_block_locked() for vmf->page?
>>
>> Hi Barry, could you please help to confirm this? Only vmf->page contain dirty
>> data, rather than whole large folio contain dirty data?
> 
> Thanks for the review. Here is the write-fault path on current
> mainline (mm/memory.c):
> 
> do_pte_missing()                          memory.c:4561
>   -> do_fault()                           memory.c:5964
>     -> do_shared_fault()                  memory.c:5914
>       -> __do_fault() -> filemap_fault()  : fault in folio (may be 16KB)
>       -> do_page_mkwrite(vmf, folio)      : page_mkwrite ONCE per folio (memory.c:5936)
>          -> vma->vm_ops->page_mkwrite(vmf)  memory.c:3684
>       -> finish_fault()                   memory.c:5617
>          -> set_pte_range()               memory.c:5558
>             if (write)
>                 entry = maybe_mkwrite(pte_mkdirty(entry), vma);   memory.c:5575
>             set_ptes(vma->vm_mm, addr, vmf->pte, entry, nr);      memory.c:5586
> 
> So page_mkwrite is entered once per folio, and afterwards the PTEs of
> all subpages are installed writable in one go - writes to other
> subpages of the same folio will not fault again. That is why
> f2fs_vm_page_mkwrite() preallocates/marks dirty_len rather than
> handling vmf->page only.
> 
> I'll add a comment in f2fs_vm_page_mkwrite() in the next version to
> make the point clear.

I see, we'd better limit the upper boundary of folio order in order to avoid
large write amplification, since even user only write 4k page via mmap, it will
dirty entire large folio, IIUC.

To Jaegeuk, Daeho, any comments?

Thanks,

> 
> Thanks,
> Nanzhe


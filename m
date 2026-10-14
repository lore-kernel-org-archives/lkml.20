Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4A1FC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940792; cv=none; b=Ex/+z63XNuvf5uoSyqD3e81i4YIbxHCf1JDhCmk3e5/vQ7v9QX+9wUSQkQgPR9Yy3BzFlxMHYzjidkkUCCNJ8m1gyhYsMQl0ewNJtRSMkVQvjW6QuioZ9qaH2fKQBOrLSiHZfGeq3TjW5TZKvs3NdQu7uUZld6dp1TWXYCQkeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940792; c=relaxed/simple;
	bh=uKEiXlmq5ATKPM4pE1jKGdzXBVEwefcC8mf+cgMSdNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wi3U7JNYqDR8WXDvjixJmte+4oDgH1OXfuizSE5JtXBJf+6nWTNW55mDyQWVySvqI8Awsk1zBaCMqnXbTrwAaKYT6PZQZcUdhRqAcPIGqFMr7k2+dMVdpaRK8e4ZmZznuUHY7iAg0u7BrWk4SF6mEThqqwO/tKG/3G9LA7FVabw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axqRTcth; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axqRTcth"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C01F0089C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791940789;
	bh=sTFnLkCen9/6tzOrBdCgyQ9as8kY4cnmUDt0qBvLmP0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=axqRTcthPpeC7QKvvpE8mBKy8CfCeVGBwvvEAjFwTER3ptCoGin5KsnFJeb4nxqAD
	 VA/jtrAj1g35l87khO2bKYZG7fE4efqlxc/MFDsf6oSgCHEIaeqixXdLxx4CUo5C+b
	 /ICv9XNb8Lu4EgNA2mLMxlrNDszsqNwOsFfaj8Y0UxrXJ/3udadLoigxOGHk9NbKkU
	 Asa9ycJK7XV7PO6ne5nGxwuvTI2sVCcSPN5uSKvUSUrBcuozTguMj706DS0lRUUvKe
	 yk7TClqBtbYgiMdecbGihVXYdUAJeQdLfSFqXqIX9IUr0XwEgEvwsmXlU28n4wfQ84
	 wfGh0ys6cMYYg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so575859566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBys0rpvB/DM2TzlRruJxzydp8WBrSud10dSVqGi1qtQ6XQiOwrWY6c+gFDl+jDb4RPyNZss2oiBFLW57co=@vger.kernel.org
X-Gm-Message-State: AFq9FYL89FqU8JrYHnejrXkhPjonUn+2ZGbEfztfANhQxNTMokM6GIxA
	0+h6INxoA7XNiolEGhAXG7/JhFEsUXho4ZUxzZf2hpQ4gDUfRz3Ro6Iv6m1t9280zBYNcYM5GvX
	g3QibOL8PJnmZf5YSYv9OeQURsC5ChRE=
X-Received: by 2002:a17:907:7ba2:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c31aa069fe2mr1430110066b.25.1791940788324; Tue, 13 Oct 2026
 18:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013033837.2748258-1-chizhiling@163.com> <20261013033837.2748258-5-chizhiling@163.com>
In-Reply-To: <20261013033837.2748258-5-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 10:19:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-+whfZ9_Zrgi0awH2tPxuVLW2O7=6e-w5JcBNBMRrSbw@mail.gmail.com>
X-Gm-Features: AclHuK9Wog_2R4bWoV4X6ex5BpRklCTmkxut23N-DpuBH2V81iFcKTYG_OiOe2k
Message-ID: <CAKYAXd-+whfZ9_Zrgi0awH2tPxuVLW2O7=6e-w5JcBNBMRrSbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] exfat: drop i_rwsem from exfat_page_mkwrite
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -969,8 +969,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>         loff_t new_valid_size, mmap_valid_size, fault_page_start;
>         bool dirty = false;
>
> -       if (!inode_trylock(inode))
> -               return VM_FAULT_RETRY;
exfat_page_mkwrite() reads the file size before iomap_page_mkwrite()
locks the page. Because inode_trylock was removed, another thread can
grow the file in between. exfat_cont_expand() does not take
invalidate_lock, so the shared lock does not stop it.

mmap write fault                              ftruncate/fallocate
Snapshot i_size = 1000
new_valid_size = 1000
dirty = false
                                              Extend i_size to 3000
                                              valid_size stays 1000
iomap_page_mkwrite() locks folio
Checks the current i_size (3000) and succeeds
dirty is still false, so VDL is not advanced

MM makes the page writable
Store at offset 2000, no new page_mkwrite()

The data at offset 2000 is beyond valid_size, so it can later be read
as zero. Could you check and fix this race?

+       sb_start_pagefault(inode->i_sb);
+       file_update_time(vmf->vma->vm_file);
+       filemap_invalidate_lock_shared(inode->i_mapping);

With i_size = 12 KB and valid_size = 0, DIO write to [0, 4 KiB  can
race with an mmap write fault at offset 8 KB. The fault zeroes and
dirties the gap [0, 8 KiB), then advances valid_size.

DIO write [0,4 KiB)                         mmap fault at 8 KiB
Starts writing data
                                             Reads the gap as zero
                                             Dirties pages 0 and 1
                                             Advances valid_size
Completes
Post-DIO invalidation cannot remove
the dirty page
Writeback can overwrite DIO data with zeros

Removing  inode_trylock()  from exfat_page_mkwrite() can introduce
several racy issues. Could you check that the affected paths are
properly synchronized?

Thanks.

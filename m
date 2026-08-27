Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB442B742
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823121; cv=pass; b=mXb2Bv96yXi8e0AaCnMiRVwlpoRiddTqv58CJ9HQ08D+qugGoea6p7GpxednSwEneJDEx26SChcFLiUqlwAENLKZ4DKamkY1YsZgwqsqUzKnriHRv/8ekrEr/g2+buTz+0nCJ5Mi+u9Lb1qoRJfb93XCsQbdiaabHAukTPmUoAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823121; c=relaxed/simple;
	bh=DiKezu3kxUMpOPlgjGkQvb9T0n90JHLS78j+3MVsolQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WoqxnpGdkNaRlilX9Crt8G5lYmb1Kqr8/19hukjMlpWR31ndVudAg73U46syfERBxCRPiMe9Bu0RdXnBRh3JCiZ7jAXTiM3IRMsnzZMNGFaN06hGTEblsGs12DhQDd0vpr93EymOh+ifqWBzxkzg/OndmIhraq0MfJsOAtoYooQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXGTaEfL; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXGTaEfL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2530cabcf4so200483366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787823110; cv=none;
        d=google.com; s=arc-20260327;
        b=MRvSbwP/ZsuTQi5tM+flS4BlKH8kZ0FMyWK8B3dqsW0c6Chb9OdXo+BXFd6HR6QFUx
         7KxXPyDizWJwZTlKsd/s7Q9EldoEHxigSgFN+Gwrh1PvFbvd6h627Lwid2P7t4jrMf8+
         JDeAZ5rES6dhlyK3wpnw1vhoquzeFA7NXN3pjCefMBEEUraPnsEiwHdVJY/b+P+djGry
         sXMwvATOKctYz046Rb6BQmchiytL8hIs8apMh9Cp6gUt37VScX8VTuxJyzBqSIc6BkHE
         cuK2CBdFuaPvaKeCuu8FvPeAOM0q6oxIerUYk3DQPY46lP/BwGlhJ+zsDXAcJjskZ4Sx
         h1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pR6mczGLZ4oTQtEIp92SfLVnhaH6TJA1RsH9sfmiLc=;
        fh=LIqPIKg+TVw4nhhEZA8jYTp5/P1AhUVW7JYDhlmsRVE=;
        b=CFI1nNvAwoeuvgvMGsVZ/XfAY8bjMC5PzfKhCcv5YVTSUahQcU0aWYg39PEdq/27Xl
         G3PqTAykm4+FsMiJF2xfMsBbEpP8mlmGt9Szfu91bUKAFOWjYVG+PprlzjIfuDOlVNg9
         f8C9sQG+Svrjl4+3PyrpYx2yWb/uucQ01i3FXd8CXuTUhNcjSQ9G8wiFGpifowSwUNQh
         gm659OSiAJBO9alPW/7ukn7NmQDBLrXur1cz6V3+sfDiMhQIaD9YAOyWLxahUARvMqS5
         5YT3bjOOiMa3BgQn8qmYf5KPvmNdDlRK+TyF4V7CUdquPZ1swViGDNbQrjuHTcJyi3XQ
         xo6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787823110; x=1788427910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pR6mczGLZ4oTQtEIp92SfLVnhaH6TJA1RsH9sfmiLc=;
        b=UXGTaEfLtTxtgNOj2NvZXRGYKcWkK7NQ4PBzffnzk5Kfi8KrJPp+qfw7i2qKW6D/0U
         k2V5LSr+do5O6L2xQb2K3Hvfv7v+dma9yxI2pStF08pDHPNkPSt9Xo2NRFxINf/CJRj2
         9XpYXz8K0UFgkef6b1TzbYd2d6DY8CUCuDq14tzluiwHznyGxoto1Ef3yOZ+8dNtzuPF
         HeRCYZS66yf5u5yN7pl12Zfbri7YrIsp+NyrWwWYZc4Czi/4Ow4zR5qW1o+aj1Z7r/3G
         8YpYNneJ06nZvnnAh343nXyoHlogk5bdQYftPRiOOhnbdDvvWa8TIPKmTXo/KaaURUl1
         3Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823110; x=1788427910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pR6mczGLZ4oTQtEIp92SfLVnhaH6TJA1RsH9sfmiLc=;
        b=qcWP9jCTtg3rQPaLQMRAYhSQxCDIOuzenElBXZqerpSTq4mtyVs/RoTZrpFFLZ0KJ4
         EAtJJyj4Wp4KeYVaFBWEDrmVQQYZpBaRrfVF2P495OsATH6JZyg8j9+jJshhYxI/sqjx
         oiWmP04Ty4XLVzGsBd2hZMgB8g5+4bdaEdCIdBY2w5IpO9r4mW+JU1uu0OInCgiQJmnG
         aoCTMQecVwP63d2sf5Ulxod09Y+ks1tbCxH59MSR5DiKMeFXvIIC2WlUIdPep0zD43Cw
         1ccSiUIEF2/ku+h0mbUfFxu2tMzJrYglaJuROCA/Ku8hasDJTtWWwbXghyMdLs4WHP6+
         t+MQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdhU31kGn22+6wCA8Ng+K054/RYJutACps8t5iHogGtZXJ8xpFSjWyuBICfSfW35spN0Sl+zuqfuUyuC0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGk0sCqg1tB2m0442fNjlmBm6xaqJ1EnfZaSttOiqXAYlvWbpw
	tPwjZYomasgweKSHGeOjjWhWksrQTC+U8HWReslJ3Os/CuPtEF542BNkrA+3NKnEoUnnYVFiT5Y
	xTbYZ+Td4R/ALrSjp9GtwvmVqVjEoimw=
X-Gm-Gg: AR+sD12UvHiKVkA+pqhiXQaXxWjteNuvnZgDfrYtZSrQj5nz/AR+zlQ3iwAizJVySrW
	tTKKw4dckLvVx8noL7s3Deg9p/TF2WifVBs28yatkWXKyhjcno7UfA8bebeIeDu9FdAVtwv0wyp
	sQRy5bAv/hbklHW7vhvMP7VtYCX8hvraNbXjVPn/SRXzeCwTYmJAP4D8fhckYJX3YjhNMr77Dl9
	dIJRnD95jReBrtMJabl2zXbLAmTb2Bg6o1ZalI6dJ37kfA4RpuoeiS2A83ZWluZug40ATsPQ81w
	Aoyx5+/yGjNQcj15XD+4uYbKQ1+WIhp7eIHBgBzWvAMObgXzUXh15bLiF5MQEMfQoeuybSiojAj
	bMYU=
X-Received: by 2002:a17:907:3c90:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c250bb126d0mr1498631566b.10.1787823109975; Thu, 27 Aug 2026
 02:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com> <CAGsJ_4x7ukyX1nUikuZd6fWtCdAJyfH8zJt+yRPByU7pZ8PPag@mail.gmail.com>
In-Reply-To: <CAGsJ_4x7ukyX1nUikuZd6fWtCdAJyfH8zJt+yRPByU7pZ8PPag@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 17:31:13 +0800
X-Gm-Features: AcwNN1UpyH7xDqcTAweobdT93tBwprOXaRt-X3XUo75tnaXlcJA4RQT7BJzDyEA
Message-ID: <CAMgjq7Ab93eu0JzbGmyZaLC7SKMpNa9oLXwL6hn8CBoP0McW_w@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] mm/huge_memory: fix rejection of swap cache
 folios with a mapping
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:46=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > A folio in the swap cache cannot be split if it has a mapping (shmem).
> > The split code does a defensive check for this in
> > __folio_freeze_and_split_unmapped, after the folio ref has been frozen
> > and the NR_SHMEM_THPS/NR_FILE_THPS counters have been decremented. It
> > rejects the split and returns -EINVAL without unfreezing the folio or
> > restoring the counters. That error path is buggy: if it is ever taken,
> > it leaves the folio frozen and stuck, skews the counters, and fires
> > the VM_WARN_ON_ONCE_FOLIO for a state that is actually legitimate.
> >
> > Check for this case up front in folio_check_splittable and return
> > -EBUSY before any state is modified, so the split routine always backs
> > out cleanly.
> >
> > Also fix a bracket style issue that checkpatch.pl keeps complaining
> > about.
> >
> > Fixes: 00527733d0dc ("mm/huge_memory: add two new (not yet used) functi=
ons for folio_split()")
> > Fixes: 714b056c8321 ("mm/huge_memory: convert VM_BUG* to VM_WARN* in __=
folio_split")
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
>
> LGTM,
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks for the review!

> [...]
> >
> > -               if (folio_test_swapcache(folio)) {
> > -                       if (mapping) {
> > -                               VM_WARN_ON_ONCE_FOLIO(mapping, folio);
> > -                               return -EINVAL;
>
> BTW, I=E2=80=99m really curious whether you=E2=80=99ve ever encountered t=
his warning?
>

Nope, found by reading the code. It's possible in theory, the race
window is super short so maybe no one observed it, or observed it but
hard to debug it (a random frozen folio). Anyway we should just fix
it.

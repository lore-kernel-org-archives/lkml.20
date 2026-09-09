Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39905A0ABB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988995; cv=pass; b=VIVMcfHoYa9GhnHlxBw7gwvAHCnN9Yknm6lmvO2BMIj5lRVkXlWO7CAnqH0pmt9vn0HJqCSBCIz02VXzvGfmf8/2dVPmkfFAryMRZXYYBprkaAdeUGVTHTb3VARqpWmpoQqYwrhOQF8mGwBxdVSJ2BXea8XwtSY0LEVomYT+jZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988995; c=relaxed/simple;
	bh=h7zYYo5YeDBVZX9y6NajHfbSqAbB9CBbbp6r1C8F68g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCaEjWVHo/UmR2XUXVhrwUh0lL69NTBMMw0nTbJvZQcMFcf/ZQGYGeGkp3j/w4ILUSsuB7XhIygj8YwHUA6iMvJ7O5eAyk5D8531geDCZe1Eqs17+wI2FyI+zQJ3xcvernnNcPzp7ulrZ6Z0RuPIOynaQUJiocgmdKFO1xT4V+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaAvBY9F; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaAvBY9F"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so219272e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788988990; cv=none;
        d=google.com; s=arc-20260327;
        b=haUaAqS/8u6EDlzafg6eHitSC5aJkoHFEz2b1o6uZGD2UyHrZKF10lzGS94e/+bYO/
         3mMWwkbu2UUmSK5hg0SbI7wubragX6L2oTbY3WLfY+x3/OKIUf8PqgHNp5xXFNDqkBCk
         h/aFuga7AT/NVoj4H5WUmSV5NH+cVf7yqheldubsivYjM8qvpAS2Ws6V8H+Jgi9yHPTt
         kfyPiqyZ256z2F5rlWKVudPujIW1R1FUn9GrLwA84UgXmPsXSjP13MVa/+osxxTFujhE
         5XqyZJTVsE+1A8HzPkm1j4feZEViufMg/RUDnKDdP54OUH5kxZ7vD0jhhic2WAcNK9Lu
         Xvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=US8zWj9mKFEyBh21kpnWF7MhWmXE0I2q79W2pu8+6M8=;
        fh=xy4Zflt8Z9VQIJ09uwTmthckGL+lLVzlU1Cggd15cSY=;
        b=haJT/1B7s2o2PtI05s+R+IX9/+i+y8BDv2Tn1QkkSFr4TyPbSxCE0PY8C5mXyMQk6M
         9ACe4iqK/ZVeNQzs9iJb9S8G50C39lVRlbHH3kY7x5wm3g+zJo8GmP9XnKDpoMwP1IvI
         dK39j+JVrEX0RtDvGugv7g1RuoR0MeDCW7D3MYRDeBq9UUz8TNjo5F/RlG5LWC9Tg4yO
         c4x91lrrVXFYvMr4r7EyYp+asUguS4OckvbLoZD8uhEm2y/35hZmZlYws+iyIYzpGMK6
         PdHoC5+9NcwiNi/gas6Sd7hfbbNS4dZGzKSa2v5oaKHV0yPKzGxYtxTeHEe36F3WHO9V
         ZB1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988990; x=1789593790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=US8zWj9mKFEyBh21kpnWF7MhWmXE0I2q79W2pu8+6M8=;
        b=BaAvBY9FeUE/Bde05AkPJVcm3VzqyE1Ki1w5Y4+37jxQeEENYGkjD5bDbw2RgCq8nh
         wLRXkkWOgHRe4dfyg4JlfTNupqmDqx2vkOD/lxqSx+ry/eT12g5YZPWy0d7e2gYwHgO8
         QFUGExRZVtEX+hpekyWTe7gME8V1HIRlsdF78sHVuHUfqeaXQcHckfaKTSo5tKx8nwFo
         NxPJbWM54JrbFUISRNFGCzoBNScWeZWqxmxHj0gIsMhwIcYsoW3O4lTLXPGolk7Bbp2X
         vdMqvFQzLzX09K3zt5PndLBPBOhtfKZ0kRCqrmU0mv3PEPeZFGAmPvqEl0NZnYsBVf+e
         r8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988990; x=1789593790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US8zWj9mKFEyBh21kpnWF7MhWmXE0I2q79W2pu8+6M8=;
        b=tV/0MrviEVh/kMNnYMTlIyqcLE63VY06YQhof2OlllqnckQC2OZcnuQ/EXDX91/TQx
         9UYvLw7KeVvjEFB2USgrOEKjf8HCP7TtNYI0NapyNgv5C86JW+ARPDg9Ax7MboGw9k34
         qO6COBfwL3ciwRx1Y603npUZtSgnBdLGH0hmQw591QV8dEwgIthkcRKqQQ3vqyVGQRqF
         MtjaN15i/OiMehzRimnQws+6tq5MzYA1yOEO2FTEiH75xe41D/T6IHqco9sLqcUiUOI3
         Gnc7hsGMexPE6oyVIIHhiLzk6cQd90oxruLiGFzCTuy8/c9WtDzkOuVaDFdrhLrXtohO
         z+yw==
X-Forwarded-Encrypted: i=1; AKwUvBzRaR/cziB+aIdrdSZsaSG5PpbIFyW6M/kEHOXZqRuSDx2jTCRoNNBH2hzcodKezMRhFmp/2uZBqkVGjDA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKLbOYSzKAIppIB4o4GRUzRzR2QmtZzDAvWUKwBS4t4XyzbXhv
	IjTa6iBojyOliye7jiXsHNqfjNe/hyL3ZuQBu5aAUwkMnxBys5QYOvsbgWmPoXOKbIV0/Sp0iUW
	SjD13evSx7ZEHMTl9ZJ6RdvkbckvoL7o=
X-Gm-Gg: AYBFou2wVGj8p1ppdvkmoemkV4zfRaVRqdJc6Jld8ByxYSbQHsCswh9ydA6T7MM/qhf
	BwjX6mV5tvPsQHDx5VqqmDZmHk9srUZFGaemiTEDvHL7w8AGi1B1M0YD16eAUbtP+c7BLAAq4mQ
	4wkYdSK7zmNLchLFl2DgYN5VL/csqgvDWrvew+A0n+6sSA82EDpxmutuC+4MswyC6THN6kAMEPX
	qEigdiQU8iZt0ZM3oT9SEVLjKO31mulRmMzgZXKP944U5DR3uCwXv3cDY/dtjq6b15w08eUPz2V
	Q6yHiV89Zjx2lULtOsb2alA89JOm/f28DUyrISMbHH9v9gwFpkx2BeBOntxcrYB1LQs15p3ACX5
	gJp4ar1/IVHaUYafhmAhvU5u3uKsLcFFB+FgviwwE2B6n
X-Received: by 2002:a05:6512:15a1:b0:5ae:ba27:ee63 with SMTP id
 2adb3069b0e04-5b616ede852mr6358407e87.7.1788988990244; Wed, 09 Sep 2026
 14:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
 <20260907073434.2349510-1-zhaonanzhe@xiaomi.com> <823eac07-808f-4b8e-a289-538ace853e12@kernel.org>
In-Reply-To: <823eac07-808f-4b8e-a289-538ace853e12@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 14:22:56 -0700
X-Gm-Features: AcwNN1X0kWA6yWGZIATCJuPe5tnvFy9mHoLYQ3LXaMSsN-0tKkm2wMGCt11s7rA
Message-ID: <CACOAw_yyCJO+r+N18YfDJie2zLDKGQa4nD8s=w=gb+NK+mX2yA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 06/14] f2fs: prepare mmap write faults for
 large folios
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <nzzhao.sigma@gmail.com>, Barry Song <baohua@kernel.org>, 
	Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Pengfei Li <lipengfei28@xiaomi.com>, 
	Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:37=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 9/7/26 15:34, Nanzhe Zhao wrote:
> > On Thu, 27 Aug 2026 20:36:02 +0800, Chao Yu wrote:
> >> We only need to call f2fs_get_block_locked() for vmf->page?
> >>
> >> Hi Barry, could you please help to confirm this? Only vmf->page contai=
n dirty
> >> data, rather than whole large folio contain dirty data?
> >
> > Thanks for the review. Here is the write-fault path on current
> > mainline (mm/memory.c):
> >
> > do_pte_missing()                          memory.c:4561
> >   -> do_fault()                           memory.c:5964
> >     -> do_shared_fault()                  memory.c:5914
> >       -> __do_fault() -> filemap_fault()  : fault in folio (may be 16KB=
)
> >       -> do_page_mkwrite(vmf, folio)      : page_mkwrite ONCE per folio=
 (memory.c:5936)
> >          -> vma->vm_ops->page_mkwrite(vmf)  memory.c:3684
> >       -> finish_fault()                   memory.c:5617
> >          -> set_pte_range()               memory.c:5558
> >             if (write)
> >                 entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);   mem=
ory.c:5575
> >             set_ptes(vma->vm_mm, addr, vmf->pte, entry, nr);      memor=
y.c:5586
> >
> > So page_mkwrite is entered once per folio, and afterwards the PTEs of
> > all subpages are installed writable in one go - writes to other
> > subpages of the same folio will not fault again. That is why
> > f2fs_vm_page_mkwrite() preallocates/marks dirty_len rather than
> > handling vmf->page only.
> >
> > I'll add a comment in f2fs_vm_page_mkwrite() in the next version to
> > make the point clear.
>
> I see, we'd better limit the upper boundary of folio order in order to av=
oid
> large write amplification, since even user only write 4k page via mmap, i=
t will
> dirty entire large folio, IIUC.
>
> To Jaegeuk, Daeho, any comments?
>

Hi Chao, Nanzhe,

I agree with Chao. The write amplification caused by batch-installing
writable PTEs in finish_fault() is indeed severe for flash storage - a
single 4KB store can easily amplify to 64KB (16x) or 2MB (512x) of
disk writes.

Here is my suggestion for our short-term and long-term plan:

Short-term:

Clamp max folio order: Restrict the maximum folio order for writable
files. This caps the worst-case write amplification while still
preserving batching and ContPTE benefits.
Selective split_folio(): If we want to allow higher orders (e.g. >
16KB) for pure buffered I/O, we can conditionally call split_folio()
in f2fs_vm_page_mkwrite() to fall back to order-0 upon shared mmap
write faults.
Long-term: The fundamental solution belongs in mm. I think the CPU MMU
already tracks dirty states per-PTE.
Once the ongoing mm proposals for PTE dirty harvesting land in
mainline, F2FS can simply query which subpages were actually dirtied
at writeback time rather than prematurely dirtying the whole folio in
page_mkwrite().

Until mm gains subpage dirty tracking for mmap, clamping the folio
order (and optionally splitting high orders on write fault) is the
most practical way forward.

Thanks,
Daeho

> Thanks,
>
> >
> > Thanks,
> > Nanzhe
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

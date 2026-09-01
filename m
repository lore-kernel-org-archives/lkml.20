Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6FE29DB8F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270856; cv=pass; b=S9FQkimC8b5L5KtOfhVTwij/s82esyFkkiGm2CzIVSKwFU3BU5ORHt9DH1VnzoGzm3qPxk5eVUVb3ARWMbldz4ZRE3PIFke6ggsjc25SBdN6roAeImD1J3zjkZ4NqyMmEGtKi6aoipsrmjWO9pFamCIGZUsemjLCFHFu+boT5OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270856; c=relaxed/simple;
	bh=nklgLPfJRHctBtbtLaS9gMySV66Qnszrm+swoA1Ytd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlRNZsUsc6zsi1aCl/rIM4WmAruOsYqwhG25mc3ESNiX1dS9ceI8+D806b7MJRZwhI90WSUkcMddXA0ZKhviLkylsCIhRm1lXO2Cms4aSlcZpagvp/BW45QpxFmATjTjrV5KsEszH6JomemOyoVvh4OpXgRoe9RZVHp31E82ilo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUZmm32G; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUZmm32G"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso481633a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788270853; cv=none;
        d=google.com; s=arc-20260327;
        b=DPrxTwYElR2V0qX/0W4+/w2GVhb1Ml6/D9ol40yr+jAvqkOApsAR0mQ0m/cmi28Tc8
         w3AZCfga+lxJ1TF/gdGpBVE5E7Z91VidBeu0H75QjbuxMUZeJslrSTaLz42pJ6QBbXV3
         kjCiV3+4tf5tWjiEIoivm00UlPOppSJbBIbPctEfIey/NNW2+ft11zsnJyyOqkekWCd5
         kdu8xfR7GDZlJUWeJAwk58nFZCHHxpN/yflRcV2UelAzgssa97wv0NGPJdnfdoeIAEAY
         F8EJ6ip0shYnzh300I1RHVcuxIZ8AgZnkZKkGbLoxab077mp8JZ9pIzmbC17jfKnLzhb
         nR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ulo3g+NwIm1JGOdXuJA1Xyyl2IN9ayh+l8FSH/4IwHg=;
        fh=VWFKQKCeE4ljnxdsD89KyYgM+mmmjkLsDjwunk9w0wQ=;
        b=qlEFyS3XY1NwGoi3ynzfRP7td6Z3nVfN9UduxAAE7QOXGv0P3C8Xq4nEIuG3Z1X3ej
         4/8YABPczvkjQSlxBy4tBlUOy4Yyy8vWTvsOhQ8yxNjc/ieHFiiVBuAIOPpWJy8xckdz
         fXgbM/AvBnz8em1U/k4ikPHOolqLi/mCoPZCRfjztNFNEWFKXYx2bY9WSAWnYSJcDWlf
         91a/PyQxUVsIgKY+hm6M0LgPGBDc1Ln0UTUTzUAkZGqQGkHbMUEDN1lkC2sysww6QB/O
         LwS6Yfp+7Cy7nvXJfMz7Cjf798gWUaFL0vG4VrU3o8S+nWVNXiXN1iaDNMh/+lS835ZO
         gpYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270853; x=1788875653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ulo3g+NwIm1JGOdXuJA1Xyyl2IN9ayh+l8FSH/4IwHg=;
        b=dUZmm32GvIJmVibW6RTHMDt51Oh/sjjEhS9LbxUYupJsdFXQ6Axihm1XBvz20G+ATZ
         tsHh7QkGl0WZwR6un6DBWoo2IXP6/q0ay3i3OliUQekHlOyGXr/rnp5ysdHsqlc43I0P
         LZGzxds7MkGTdZiM4TRCrq6+UuMh4U6fHrhP7ZQJXWq+djy9PVdhGykBtTrFKH58bOyy
         xlC6O8PfQilk/eaiK1rYlmuFkj0MdSD0Pxdctw3UEjMctkDnEkiLNAEwb6V2SiVO+mWU
         jodTa5xvRQjnAU7bpWElPdjArES50UujDYEW54ug62MiADRhFifAqp5uycsZsEg0NLhi
         cgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270853; x=1788875653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ulo3g+NwIm1JGOdXuJA1Xyyl2IN9ayh+l8FSH/4IwHg=;
        b=KDA04uEor9bQUhba5KpCwG9Xl+E8/1tQOUQW/QVwrQ50tqEP+wnshwhsbOks54CStN
         Cm3h7zd0Po99grlZgRQSjwygTQQWr/ZJtGuiSM1YmBXKBUgtjGl9Z7wyfniv9PtXuVT1
         U7ceMxzAg1aZXCG94hX1pm3zIsPfz+IRMRi9KM9Os8vQxbtUymF53r66hcmo2cn39Bwb
         L0dXFm6itY5mrC6N5uFMAWF9YhK5yqwFw9nf/WdymEKoFrYrYvkzm4ak83mcRDjdFm8j
         1lwtbc0HDA7Wf1k4kE0jIQ0Jyg+fWE5wq9qmeO7yXZx8Axvs7WskbuU/a9jd/gpSz9bM
         Lcqg==
X-Forwarded-Encrypted: i=1; AKwUvBx3wxjg1zqjNUwIk8odg0x8FbItbjaiHvA2KMBbHs2gzeQLGTM92atBMowmpjnuXdqWw0GtbTlLKNcMnAA=@vger.kernel.org
X-Gm-Message-State: AFuF++k4woUIGNy7boO1ARYo+cBg+x5VeyGuXGCUhYCnyKZeC2URj4ja
	WNNjbG0RistmvllH5a96HEKh0DOwdFfyc1keuyRKnsrWXlO3zsud9NS4pOm0NLx+F1bYRFwFOmg
	JsFLIBDFzAb3cyXakzI+0TwrMTr4Wl0k=
X-Gm-Gg: AYBFou0G2SKaTENp+eF4T7bGzQNUD0aRwALDUlNEtUPq21nYOkCyzIYVXo72nI4HUwu
	TuiMMb/+RJ6UgRYqt3eps2lCLetqLY+SJrHVTI9kEuLGM4yzEf6evMSDG/L9mn3apnDowGtIV/B
	EFb81+EXGZjYvUEi8ByUS42vzJUInLKny6X22YHHCQtWnQHfB8vaukMLNA7cFqYYsMjPid5H6lf
	apJ/C5QliCoWgse7rWtIzmrO+a5m1oHoDmRUGAINE6y4YebELGKpH9OInuGoZWGdyMwBNN/l/4n
	blwGdAOgGZUAa0cbfn5c6IszRcaozwZ0uJ6SDN5XTGwilPEua4VGmQ3VjMv+MXOpnadJZCp4TF3
	k4Q==
X-Received: by 2002:a05:6402:2753:b0:6a1:c908:1701 with SMTP id
 4fb4d7f45d1cf-6a663b0cebfmr5071769a12.13.1788270853073; Tue, 01 Sep 2026
 06:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830120742.20950-1-linmag7@gmail.com> <20260830120742.20950-6-linmag7@gmail.com>
 <20260830181926.GB173328@ravnborg.org>
In-Reply-To: <20260830181926.GB173328@ravnborg.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 1 Sep 2026 15:54:01 +0200
X-Gm-Features: AcwNN1Ujzqq8uSBYZYR26NfQu3bI-0Yzhq3DaXzDvavXmWNc0ExNRc2BNZ1AaXk
Message-ID: <CA+=Fv5TV6YAeLriGHxQQ6Sv4PrMFYYDk=n2v92kpg8srb1tSHw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] sparc32: move early memory setup to setup_arch
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com, 
	linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,


Thanks for taking the time to review this, I've put together a v3 to addres=
s
your feedback, will post it after some more polishing.

On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wro=
te:

>
> We have several >> PAGE_SHIFT and << PAGE_SHIFT.
>
> It would be more readable to use the corresponding:
> PHYS_PFN() and PFN_PHYS().

I agree this makes sense.

>>  #define PFN(x)           ((x) >> PAGE_SHIFT)
>A cleanup for another day is replacing  PFN() with the standard PFN_DOWN()

I'll make a note of this, maybe we come back to it later than.


> > -extern unsigned long last_valid_pfn;
> > +extern unsigned long max_low_pfn;
> This is already declared in memblock.h:
>
> $ git grep max_low_pfn
> include/linux/memblock.h:extern unsigned long max_low_pfn;
>
>

This is the better solution, thanks


> > +     for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn,
> > +                            NULL) {
> No need to break this up, we are not above 80 columns.
>

Yes, I'll fix this.

> > +     min_low_pfn =3D PFN_DOWN(memblock_start_of_DRAM());
> > +     pfn_base =3D phys_base >> PAGE_SHIFT;
> > +     max_low_pfn =3D PFN_DOWN(memblock_end_of_DRAM());
> > +     highend_pfn =3D max_low_pfn;
> highend_pfn is only used to set max_zone_pfn[ZONE_HIGHMEM].
> It would be simpler to just use max_low_pfn and get rid of
> highend_pfn.
>
>
> This part should also set max_pfn.
>

Well spotted, that makes sense.

> > -     if (max_low_pfn > pfn_base + (SRMMU_MAXMEM >> PAGE_SHIFT)) {
> > -             highstart_pfn =3D pfn_base + (SRMMU_MAXMEM >> PAGE_SHIFT)=
;
> > -             max_low_pfn =3D calc_max_low_pfn();
> > -             high_pages =3D calc_highpages();
> > -             printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
> > -                 high_pages >> (20 - PAGE_SHIFT));
> > -     }
> All the above are not needed as the kernel already print HIGHMEM, and
> this patch removes it - good.
> Maybe tell so in the commit message?

Yes. will fix this.

Magnus

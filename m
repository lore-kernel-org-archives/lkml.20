Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C38485CD8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995204; cv=pass; b=L3mfY+isUu2Rz5Y9qKkFkU54lxosaXhXbUqmnWh18y8vk1K3s5wvzP0Q5/2LisMeQKBFPLXYbk/SqGzbO+lwDmAE5zDZqd0bByYUdLK7fDKWtrQooTjpk5HU/i/+8+4VuVomziqPbCjf/5X2LErsptpH3ZSa8mjp/cAqqjtbvrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995204; c=relaxed/simple;
	bh=PXA3kKi7Ee0Zay0UBDPdPvhhxpS6LS3uNwKL28OZOJo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzgb9e+dle5bY5XyZt9shRjcJdKB6FzL9YylfX3hll9zTwaUFgj9aGAwak60ZxBv5228InrFFQu6GJlcFcpOn4R6JOn9KxAMdE0cyViQcKzy2Xpbl6d2pDXOZVwf2YBR6cJOpTHxTTn5njR18MbM5MvGIrlsyzSMO9o4xJBbfmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/GEuVUA; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/GEuVUA"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cd4631090so4403766d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995196; cv=none;
        d=google.com; s=arc-20260327;
        b=opaLwNe/46sKOcCMAxzRFUc0Fg2EHatqae+Mgw+7H3GAotZy0EOR/E/JRBe4xQE2+7
         /RhJL8JEe/mmt3kNDiP3aOHsLgZiPZZ1PooO7BFDr/kjXBOxxvkoyO+vYEWXGFB6eztH
         CosjK2xbYQH5xdQ72A8MBoIo8B/CNuMNR6FwDb8R+jKnfJ+YrB4u75HkIwAXZKW7G2/5
         /F3O9QG4pbuQatdvkQsuyPzsQUDXWqhbBn3SdXldkEGmEFPttCTq+TEkwVoVuc0pa0Ro
         s0fFP7yG+b8m2h73AUWOns4Mo88sE8Dc93oOhOLCcHKJQn2Y+29xX9pbtRdz3PTbhXxH
         Dhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6a2nFlX8sSERnHuhM1FnkE0uqEMFgM8nC5+cN37xiVE=;
        fh=1q3Koz4qF/V7MjQI5042Ae10kKc95enF8hHspLy0plE=;
        b=GQwTrVgkQTGFBNVi3yDwtl3rmPpyFkNEq72YQgf2fFLY+ZLl+HHwyQAdNhxWeHmxqm
         37u5WMrxS/Ka0S3Yt2Rd8lyBejf7UyyHM8CugRWrY/Ierheq6cgw9PfCmRHQEJOv1iXV
         svGRX3QOMXXgntJMIa0iPF2yl2d/VNYOXEgtAeo5XiKArDMXHgna+jSet2uRJ7dBHBsN
         x10LRY0VPtf0oU0GqyG5LXq4HxT92eokzibhH8C3Qsw/Ms97GqccX6iNCTq5exIwoaca
         5tyFAoi3OZGP+nq8TOBx6sUA4GdaOU70Wg6zPcKEZ9/pifW/ehx2GQ/Ta+9hE7s1RCq5
         ztDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788995196; x=1789599996; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a2nFlX8sSERnHuhM1FnkE0uqEMFgM8nC5+cN37xiVE=;
        b=r/GEuVUAJ1TarwZb5GzWSDbacd43dpFp2R5hAvpZ40Avc+qpOvbZNj1fIueV2bME41
         bHA/4XrWvfSnnkbFJwS/7sEfyxlPskdrGky3IT6t9T36wRciBWef1bb/y2MvAmfGf8pX
         +b5YhFtCVydNWI0CJNr1LuAcS2oJuRdRKU1ToUsT9zT/v2Vzr6INVHmgUQQKpzrXPolt
         Fys0VPNzPxusy0fvncTW+i0knMHb5BS66MyCeJ5vgkqgbDhGwdwMWqJuOcxxfTHiIpVO
         4Y+R+ot26mq9XrGldrQVHWzlCpghsZ8X2hDkgXmZIDfP0xwjSf325bfVlu8yza1beXoW
         +g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995196; x=1789599996;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a2nFlX8sSERnHuhM1FnkE0uqEMFgM8nC5+cN37xiVE=;
        b=qwe1OprKvlqlzKXM4yYVACBh4dDst2k2k67Ja1V3vvH/D1ch915O+0389MzqnK/644
         XbpNj5PuwxxYtgQYpsoKjUBZu0dV5PZ/aXIvkVRvGzKK7MQBqUR7jB0lCpReCWeiLr9j
         R/h+HI+JLhgmlpBkC15pTK+rHGmCMiV2RuG/jy9uwVpRi4HILsAq3sA/JlF53cYme1v6
         kdlI4qZiqlQstAVitbiOSCOj81r7uW4u1RXqKYItBEQnI+2x7uww9UPKspqKSt7sjWd8
         QAH4KzDy6mivrPxm8qR6D+qxfd17RKJB6HWaW/F3DE+NDqM8ih1qNNxJL3Zw/SbMciNK
         CYHg==
X-Forwarded-Encrypted: i=1; AKwUvBx56Kv3elzyt5tgygK3ZZWHi8vSx03ZcAnT/iLi9LPVwAQyzHyJt8egL6zlo4v1bcnyaHhG/iItcR4PlUg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+iy+EOWMV57FBSSYoy4ETgUGP0HJJb8MpWUxY/6dxYRyZfm1c
	fjxyQLz9Otlis7hkzB24LCALsZRehPsFGEgs4toe9dYWycZwvX2U2Qo+6mXv9PebRJ86mMgsqth
	ATn130q9W2rB0HPt8rONp1EKczzpCXSHFh+JxGZAS
X-Gm-Gg: AYBFou0g/R3EDIamlyn6v9WVTVsqmZ+t164N6xar1Q2YO5nQ5LJC8xoj/XlGrCaE2d+
	mQMoiZkTfJ44MeETl+yJ2Hu58c96zO+0OZ0BeJiBL91pth68KXPkMCN6oy90WHTHCXF8M6tksHk
	O4pcxDOpzV4LdxZKyJiWVgvdZdXbVZg49lwIhNIGMGA7qzEVJALH63RJZDaapzpv5/U3YIH1hdI
	8yeAQ+ga+VBD2Av+XHc/37XM/EYlo6io5oA9WRZRIpPZfIavjj7JMZVivgq4Ne7YvsaT5E2cZt1
	t9ZLr2i7rH12ER6TaNMP8pEiNDDkPwpHFdP639f9Xnb5zwRzZ2c32NtkuUPJlDBdIypl1WBp1c6
	c42aQcNfPbVMOgcMD1aRwm/VJ8xPJkVjLMDtDbkoV
X-Received: by 2002:a05:6214:4002:b0:910:3923:cc74 with SMTP id
 6a1803df08f44-912029a8b04mr22676616d6.29.1788995194918; Wed, 09 Sep 2026
 16:06:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:06:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:06:34 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260904004342.3162959-5-seanjc@google.com>
References: <20260904004342.3162959-1-seanjc@google.com> <20260904004342.3162959-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 16:06:34 -0700
X-Gm-Features: AcwNN1VviVuN_OjkC5re9vfGxQgnvDMtDDCsUCi2bL8B0gLdA6pRCDS1jYp_JNo
Message-ID: <CAEvNRgHx8OJ4vJboy_zzwnLQA53AFKt-ehyeZRfYnvv9riMcoQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] KVM: guest_memfd: Drop superfluous WRITE_ONCE()
 when binding a memslot
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Drop the superfluous WRITE_ONCE() when setting a memslot's guest_memfd file
> during initial binding, as the memslot *must* be inactive and unreachable.
> The superfluous WRITE_ONCE() was added by commit 67b43038ce14 ("KVM:
> guest_memfd: Remove RCU-protected attribute from slot->gmem.file") to
> maintain rough "parity" with the existing rcu_assign_pointer(), not
> realizing that the only reason rcu_assign_pointer() was used was to make
> sparse and other checkers happy.
>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/guest_memfd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 0b48e9a775aa..6c8df67382fc 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -653,7 +653,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
>  	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
>  	 */
> -	WRITE_ONCE(slot->gmem.file, file);
> +	slot->gmem.file = file;
>  	slot->gmem.pgoff = start;
>  	if (kvm_gmem_supports_mmap(inode))
>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> --
> 2.55.0.979.g7e5102b832-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

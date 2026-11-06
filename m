Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793943996;
	b=b6XJ4n5VaqG91SkrW3+TUYBbG5ot6yUQKTEVp0gxBdKl2r92WppDR18S1uXzy/lW5f07
	 CoJyZWJXPPG29vkdmIR/U9zSUOt9C/9O3RVebg8mC1QI4UDxDOLDwKn5IysYfRbWUKCp+
	 zJ2FxVLg1udU5iCGWjhsiYEq2O3NtXAAHG8dI75vUN1C0ThPwFo6znrwjz1n754DVA+3E
	 zIZ+LpA4/RfdOFWaOdnPqXocwuQaplqy3uwClOY1BExUDrhDIOLbnkjxw85z9xHMebgqn
	 V67EI4Rve9U2whvwojqUT9SyrRaberWAruFqqNBCgtdFKhM9gu02nK7US9+wGGE3w2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h95Wd8dgSYHxbfC6z+Nx/Ypr0Yw5ONkFOsz25MwqqRU=;
	b=uPMrvXMtIGDJ2rk12SrNshqT9WMmrM/LGL4ovcOwfc70SrIfNBBNI4FlCZP/FDmrOQ1M
	 jbEkhMYGRlKjbpFdKD5mYrYfIwgEKwgz2+r072zroeZ067vJQgHIEbeI8vme8VHdRzEsk
	 JAg6+sYaw3r1/2Z65+OVh+6DbgHId+9AQdUShrZjl3FCJdfBwzcQa+YBLgb6i11IdQ8jy
	 vuqIFOJ2Sxq/oows1WlvIV1t7pEULE5yd9GceCL+n16MeCuWt1OLjgOGy/DEAVrST+5qQ
	 0ffZzgjrymiijzc32f6p/cAsHEHipjDKiThH470mW6j3LC823VRVj9FPnylc0AjtwSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSOafBdF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127B606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8127B606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSOafBdF
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2188a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793943995; cv=none;
        d=google.com; s=arc-20260327;
        b=Appzg2wZswEDWvPiWZBOxGvuYzN10PoTVzYXCYrNq1jICJc1EIKUBfNCbemDysAng3
         CQxBqolM2zDdl8e8huGY3Zu5uUbwc6xXJU99/J+xUK5jnwIC+hVTzbJZsbyzez+Zoc2W
         fvK6Mjoos2IYWVxwkYHNqgL6+PFYvpXOaGZ3Ngmob2AY/iKpqPgP/PyFLl3/G5resAlW
         RBvXtDKSF53tDsCDtBvrsza5mYARP4jkHuzII1ty93hR59ofWM6qBcz8d1cbMFiu65kC
         zquojRfTtES2cdzjANW1OHJSEK1X5wyrcRM8xTPUxWnmaweru1vsuWH6GzrQWB/5Y2Bu
         TsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h95Wd8dgSYHxbfC6z+Nx/Ypr0Yw5ONkFOsz25MwqqRU=;
        fh=yuAD5zuqG1KL8eJMYK9geLbOBuLuZ7l0a+up7FNwxj0=;
        b=IH0z++Meu1lljZkse9+QmuRY3E6D/M/dJ4UvW/NSybakGgZG68UnBG4DmKW7pfY7R+
         9iEbi/d6NtpOanLlzGW9gETDqLJvJYVNYDatLPLAy/XQpGKvD42DUYTDDFdwR0Lp94P3
         lr/3DTfH4WN+gBonmjCsTBONv42OetX+YLF6209oTz0jJ5maTyI243GA72P293XuN/oL
         R35zsEUborzkBCBCrAW+iybUy7+uWDEHeCQre9tToL+cQlurr1yKaueNZC9tkcKItiIo
         +DKk2rkMfC8UXOjU60SGomfzpYIo2y3KU8q8TMG5z4VmERiNJREMvDKZGlxcY7SyDJj4
         EXgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793943995; x=1794548795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h95Wd8dgSYHxbfC6z+Nx/Ypr0Yw5ONkFOsz25MwqqRU=;
        b=oSOafBdFlYCxZieg83Tnl7OAlhMtpFGmON/Kfb90GFk2V5J92jwS3i3zR3TyAOXnoZ
         TMIj12V7vL9ZGl1R3Jt8DSXQj7B+mp7BkqdH6OohIic/e/rhLX9flqtj4XdVzJuOLuc4
         WQCc/dQuDIQhVQYfIOGRLiQu5Orp6IJBaa4RfnqJRTcZM0JVujp7LTrZxXFxVUPmlmJc
         U6tf91WmrLGeyLmcIibR9K+X82Hh27c4RXyC4vGRe7LTarfWpy+/vxf6G9yTVUt5NV5r
         5yjY3uQ+5SrhVnIiR7NVzuwgBb4zJfow+tZvbC53R1xiwJ0gikWceHpVEpSbDMMR/hZd
         YZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943995; x=1794548795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h95Wd8dgSYHxbfC6z+Nx/Ypr0Yw5ONkFOsz25MwqqRU=;
        b=ejwmebequh40pLhm7txG/14TDM08aYIMLMbnUtpl46/v8SbAfALAheVUVRK/fRLM7n
         oCT7dyy5xnC8Z5gjEf3oZ/LAe7fhjUrlZJvROuZlj8qxH8bnabCX0dVkLf9oxByEBukm
         5e5/QHsjjN4cgHJs0Z2myzVZ5jdI+R/Zql40Voiv6IX0eU+7iFKUSSBesegRJchRko9J
         ktWh7MqhAA44PknCtQDbpC2aW86HKzzRNMz++oXCpdQfIVqpDqWggGPiPwC6A9BDOZOS
         0+BBYHLov68q9jHkr+Hmw7Y18Z+tsENhqNbQTJ7m70fWTkjGtXW7+tsuYlZrHoE2GlTf
         dXJQ==
X-Forwarded-Encrypted: i=1; AKwUvByXKxJ8lzAelHcHWurtUj4MMabv6i64cmJMEab8AY4K9uf65yv4UVGnEwDG9YNKCqcV+DqfMUbazJn9Q1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ONDardtd+em19jgkOkTM10hHFSk62j9Zun3mUDsWj0bUU5oc8
	z+D6gKxeQC1deqgPzonb4nWRu/0yglbhSvt9kmU2OeWR3WaIBtrHfLuR08/Gppz/fcXeCZSlwW+
	bdl9ZC6uyb446AdkjDZGnG7rvP/X3uSsfp6cN4Jgy
X-Gm-Gg: AYBFou1wnJZr1pABzMbijy8KKVtdAKWYUiaOuORmDlQRm1rKS9HQdfwkDwR+zHCcx+l
	9D0V36u8Cu4WKWuPbke9pCOYfFFKsk/0vRPJJfGBwDQRllpAWGy4layjfXTCWQ9eo/McmyWzGz0
	IsKzdKycIvEQXc5qPVA6iiYAbsYRqu690JOPHfjeZnppKtHTIsf7mHRnHNFpI4aQiZRJJLobZpk
	Cm7wTrrc7bSRnHR8TeXjxk1V2SpggNzn536vH6fesFMU7b4vMnzfTC6hM3KVYETbixTLVFg+MNQ
	OUlrYGwknOXbWwUvG8PvIwMuNRiNBeOaHQU0ZLaHfXJn0liJGI8j8QMWThR9fTWXfQuqE7E0rB4
	HTX48uuaU0yKJguz7J45stgIJXlc4GRC/jrz4R8gne1MdXLnZ8cytyOUfOCHLoMqiXjW/UtTURY
	Er6DiA849TYCFeTm/nW9TBmQ6w
X-Received: by 2002:a05:6402:438c:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b6ddd37ddbmr21027a12.3.1793943994556; Thu, 05 Nov 2026
 21:46:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com>
 <20260930210750.1487547-4-chang.seok.bae@intel.com> <CALMp9eT1Wza=7s53Pu7ODcBRkYSbpv4A_y58xJNEhQeaJ6r1Rg@mail.gmail.com>
 <24be20bc-4089-4cf9-899b-8da1b2ee2825@intel.com>
In-Reply-To: <24be20bc-4089-4cf9-899b-8da1b2ee2825@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:46:21 -0800
X-Gm-Features: AclHuK86lBRoZvTHN2sTI_Cm6pPHXjUf-3uNzUP0x-2uebhLI0WlIb7-oz89UGs
Message-ID: <CALMp9eQOkFJrzN_ws-CKLj5BaDhXgLbHGDF9g6t8_gNTQvsU2A@mail.gmail.com>
Subject: Re: [PATCH v8 03/20] KVM: x86: Support APX state for XSAVE ABI
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:33=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.c=
om> wrote:
>
> On 11/5/26 16:13, Jim Mattson wrote:
> > On Wed, Sep 30, 2026 at 4:02=E2=80=AFPM Chang S. Bae <chang.seok.bae@in=
tel.com> wrote:
> >>
> >
> >> +static int kvm_copy_uabi_to_vcpu_regs(struct kvm_vcpu *vcpu, void *bu=
f, u64 supported_xcr0)
> >> +{
> >> +       union fpregs_state *xstate =3D (union fpregs_state *)buf;
> >> +
> >> +       if (!(xstate->xsave.header.xfeatures & XFEATURE_MASK_APX))
> >> +               return 0;
> >> +
> >> +       if (!(supported_xcr0 & XFEATURE_MASK_APX))
> >> +               return -EINVAL;
> >
> > Sashiko is right that this early return leaves stale values in R16-R31 =
when
> > XSTATE_BV[19] is 0.
> >
> > In your reply to Sashiko, you wrote:
> >
> >    This matches the existing XSAVE uABI semantics. XSTATE_BV specifies
> >    which state components are being updated. If userspace wants to zero
> >    the APX state, it must include the APX bit in XSTATE_BV; omitting th=
e
> >    bit means "leave this component unchanged", just like the generic
> >    XSAVE copy path.
> >
> > That is not how XRSTOR or KVM_SET_XSAVE works. In the XSAVE architectur=
e,
> > XSTATE_BV[i] =3D 0 indicates that state component i is in its initial
> > configuration (typically zeros), not that it should be left unchanged. =
In
> > copy_uabi_to_xstate(), clearing bit i in xsave->header.xfeatures
>
> But copy_uabi_to_xstate() does not overwrite XSTATE_BV. Instead,
>
>         /*
>          * Add back in the features that came in from userspace:
>          */
>         xsave->header.xfeatures |=3D hdr.xfeatures;
>
> This means that even if userspace clears a bit, the bit in the kernel
> XSAVE buffer remains set if it was already set. Consequently, clearing
> XSTATE_BV[i] in the userspace buffer does not necessarily reset the
> state component.

Look at the lines immediately preceding the ones you quoted in
copy_uabi_to_xstate():

    /*
     * The state that came in from userspace was user-state only.
     * Mask all the user states out of 'xfeatures':
     */
    xsave->header.xfeatures &=3D XFEATURE_MASK_SUPERVISOR_ALL;

    /*
     * Add back in the features that came in from userspace:
     */
    xsave->header.xfeatures |=3D hdr.xfeatures;

All user-state bits in xsave->header.xfeatures are cleared before
hdr.xfeatures is ORed in. If userspace clears bit i for any user state
component in hdr.xfeatures, bit i in xsave->header.xfeatures is cleared,
and the component is reset to its initial state.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793943078;
	b=kPQFio4dz9kiVANDhpQBMHERxWxEGuu/SkQjBmcKYfHL8xpAxWo+R4kN9glxu8gfI5va
	 xHhzHrK1izKRHH+oCJ1txHXTN6imaqjHt5VWIz8ryoK9myR2p5O20WYPXVJD2HGxH7jAj
	 vf82Owzl9kk7ZaZAMkD+BF3PCwkkJHwI5+NCi2jmpRjCVjULwTLFK9gSZmajx/aAiLlBA
	 DenhD3UZSNyjv1cOuCLjA5kS8iXvaRywGj8kM1NunbzMPwpNTKimszU/Aeclhsr+kbToL
	 apQv7UC6U32BkZlzzGFKOfRRW3GWgmVfj5dlvjKcGeRAACjboE90fH6wMXMpQ7Xe9FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fzfTGzPrNRGAcFjD94LRWoBBCVsFTkInc3NXv4RHT6Q=;
	b=dQ7meReJJdjLXxDoU/QKgQdMzB7Duzecib1PPVbXkNG1ZM6687gDyKgqPqdXMpmmLW8g
	 6EGXufzFX7xhTY7UR7TbmB8tElV1O7S1u9wI22fsfdFufFE9jamtb2GKBO4gz8MkvzNyC
	 Lck52J/wKveHycj/CQqSbz1sagiIq2jaTLNb6+5ekVRKZzuphcdQqxfhdism/49S/CAIW
	 79hAKIBuftQm3vy6I2lyFoDunI+9SVNQNMG4FT9S2NgLLuxypLBprHMKPgBqPPJBH3pTj
	 1NAbK/lkDqP1Murs5cMCxpI2nqZkG+dQUvQyjlAqTZlH82mpzwX+rOi+UxUi3GOIz2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nOHyOW4e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF9606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nOHyOW4e
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso2077a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793943076; cv=none;
        d=google.com; s=arc-20260327;
        b=o/8DYBb30eyBbmSICKd3mBJ8g5nBLQ+kdQ2ncr2/6ZaBMbfb8wlsBf4tGzOXVAglUa
         HwKTm5b8UvcYxUxzNb6YWlvkAlch7Z4aRw10PnKcoSc7RNj8/ERppHxPKjL+xuAu34sl
         /AYif0k6CqS/qDW+Bfj8RwXQUT6C7cUUD/DEwmXsiOdTqI/iEvzLdWLm3D09RmnJApaH
         d7xnrYmnuRvFIkPnnJrgin9Mixr1EQOGwDGMj7OjiBAsK3+R1yRx61MRDTrFQorQ0wav
         JJsVf+4+O+3uFRDllP8Giy7gKZ66yqbzb5czCn2YAWuvu/FspZsTdRphC6vNLke4GGmg
         21rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fzfTGzPrNRGAcFjD94LRWoBBCVsFTkInc3NXv4RHT6Q=;
        fh=qC3equFvg3AGAvPwi7OQJU/kQTh7r4B6MA1SisUbf6M=;
        b=aj9QRGHpCWZCg1ZKnVoNAaeEr6bBqVbYyX4EjgaN1S6RBo/QQvxmoW+R18TUfz9Y8L
         aVVbsOIRSozEEHDvhXoXmAsWyafsc34wIG/CZVSfM6g6DQ7s/hnWW6AeOcV1qV0cMJe5
         +MmpCA6CvGmWl4Q2z6Dj7pOhvJmJj+Vgzg0vDIiV1jfidesJXRorcZglZva77iEKXOSy
         o04wLeK96KD0oY4oCgmQvJfOG7MKSu1uQ62KxQN8zxWFcfaN8+8XqB/bPxbGW8Vs6Ay1
         OZfo1kGXvTnaiBjhEQX1Qpo29Qk2fyW0bmgIgrcB+LzKeQ/OstwYzsZB+MJJ5tE3RXB6
         nM5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793943076; x=1794547876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzfTGzPrNRGAcFjD94LRWoBBCVsFTkInc3NXv4RHT6Q=;
        b=nOHyOW4eilzQUjweHtdZoqa3L4evOLihPWeJ/jbooTuK+9eiqIKicgfHFFIrUF/SwJ
         puPhEAgDcUnUjyVN6CddjQ/H++Obuu321SDUJ/Qg6IF0FwrSdLypyfbgjRmCC+QiUw6F
         LT0p98eRjdBwN1r0nfIuv2DlFv0yJ1Kxd5UoQLiy4hshmRNuq+C+xEZyn2ZB/aquQRFl
         rZaJikW+I8igR7sx5rpY3et1FapVm9bEiaI6dMFtZHOL1qp6Z2xM1oDrLFgiRR7qbR9v
         VB4dPScpf8HEqamt0sBhEAKobNzqKE29RFIZ/D289J4UsA5HZAAeLuuR4BOSKofm7TjN
         pbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943076; x=1794547876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzfTGzPrNRGAcFjD94LRWoBBCVsFTkInc3NXv4RHT6Q=;
        b=WVSjynYjsLaXwc0IMIQldhyjTdGuPcN8ACSErCchaYIRpief1Yox3EsI92gjJM0Gcy
         Tm9DJl8OC5Gx5BqeH97HwEaggrJlGZ9sPSSekYiuLXZgzLLV1OsF1mtSXV01x7D46w8c
         4pf+PBXkeE1JueyF7nXk+lPkqvXDiCV4u79a+7yBFpPH72A0WO4MtZXoQUWHy0iOTZ8a
         /MfG9DeEsAsYIuWKZUyrOYmFeDauRlYdq6iRACmpn+EV95rKTfIvFMvQOV7uGIFnEwHK
         8s9VBrJBXAWCWM7qClbdJgZVO8qmfn5P8JQ+tYqzpKn4ECqCauSvE6IBac8Zxwp58Seh
         xEeA==
X-Forwarded-Encrypted: i=1; AKwUvBxsbR9U6XbypNwSdphxayOtwP/iaxgsKiuuyafOUFIZtYWDDMSP2FHsux457ot0cRsYDU6HAMJPgxVrbHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L7DaW41/xtVfZ90TQ0NpyuVRgKO2VOhX9aExkRjoC0F3rUCwV
	vHWF9foZFLrYkH1eOtDsUVuvwUdGWYHxkxPdnEOcrhcjKFdNSuN78nmVN9f19g/UsOj97RGqt99
	8nU2IrybXj4Rs2ULISAoMsePaXVCi3VJuYUAIEPGk
X-Gm-Gg: AYBFou1P+Go4xL461rhJSNuo1Rq4utZMM8t7MrMhdEPfgsYBfRL2r8QWAiVHjebS67h
	s52xWiTuslhRf+1EJ201OrytoTVhOJ+nfVr4HQgXgwKm9zR2efiXGNVvQOZZjlDxs0GtAZ2k6VA
	ndoTrrtAtEf5Gq89EViuE838Ei4Dbh7EIL+lUhBpd7pdZI05iVdJECOJacW3N5AXvwDc1ab+hYY
	EZYxnWhyobWsM7adlOXrzfKT547w8wBb/Qb2Chyv6P76ngK8k0bhT3Jef9knr3DMfTcaqvX0xSF
	iUGQNV/DLt4TWQic8LsgBW+GG8/0LuXldovmvo3eb2AsVW0tOG2o4ce2mV0FY9cYCz8ycvALiFy
	xVJz/dAJOd/Hf7yG0SESsh48G0oQvujpsNoF3HOQJrYOL7FheZFmnC1aFCkj1lI4f7mj601L6/j
	aBphmz1Zc5/p8tQREEWSVs3Yh0
X-Received: by 2002:aa7:d14e:0:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b6e7992f9cmr5378a12.14.1793943075854; Thu, 05 Nov 2026
 21:31:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-20-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-20-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:31:03 -0800
X-Gm-Features: AclHuK_4ZgaZlELwLWkVgY6tOe7DDAFE30KwSfP5ql7kytff2mRaro17GdlkHwg
Message-ID: <CALMp9eQvzZpcL6fnJcpqV_95S=3ka_xVpBMyhjV6KBsokFrkuQ@mail.gmail.com>
Subject: Re: [PATCH v8 19/20] KVM: x86: selftests: Add APX state and ABI test
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:07=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Test APX-specific behavior and ABI interactions as these are unique
> comparing to other state components:
>
>   * EGPR state is saved on VM entry assembly (unlike other components).
>   * The saved state is retained even if the guest disables APX.
>   * EGPR state is exposed via the XSAVE ABI while not stored in the
>     kernel XSAVE buffer.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../selftests/kvm/include/x86/processor.h     | 120 +++++++++++
>  tools/testing/selftests/kvm/x86/apx_test.c    | 191 ++++++++++++++++++
>  3 files changed, 312 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/x86/apx_test.c
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/sel=
ftests/kvm/Makefile.kvm
> index 96bab7002d39..2bd5c77047a8 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -166,6 +166,7 @@ TEST_GEN_PROGS_x86 +=3D rseq_test
>  TEST_GEN_PROGS_x86 +=3D steal_time
>  TEST_GEN_PROGS_x86 +=3D system_counter_offset_test
>  TEST_GEN_PROGS_x86 +=3D pre_fault_memory_test
> +TEST_GEN_PROGS_x86 +=3D x86/apx_test

Nit: please group x86/apx_test with the other x86/ tests above (e.g. next
to x86/amx_test), rather than after the common tests.

[ ... ]

> +static inline void xstatebv_set(void *xsave, uint64_t mask)
> +{
> +       *(uint64_t *)(xsave + XSAVE_HDR_OFFSET) |=3D mask;

Nit: u64.

[ ... ]

> +               case UCALL_SYNC: {
> +                       stage =3D uc.args[1];
> +                       vcpu_xsave2_get(vcpu, xsave);
> +                       if (stage =3D=3D USERSPACE_UPDATE) {
> +                               write_xsave_egprs(xsave, stage);
> +                       } else {
> +                               TEST_ASSERT(validate_xsave_egprs(xsave, s=
tage),
> +                                           "EGPR state mismatch in users=
pace XSAVE buffer");
> +                       }
> +                       vcpu_xsave_set(vcpu, xsave);

vcpu_xsave_set() should only be called when stage =3D=3D USERSPACE_UPDATE.
Calling it unconditionally on every UCALL_SYNC overwrites the vCPU's XSAVE
state from userspace during GUEST_UPDATE and GUEST_APXOFF, which defeats
the purpose of verifying that KVM preserves the guest's EGPRs across
VM-exit/VM-entry and across XCR0.APX transitions on its own.

Also, please add a stage where userspace clears XFEATURE_MASK_APX in
XSTATE_BV (while leaving non-zero values in the XSAVE APX payload) and
calls vcpu_xsave_set(), then verifies that R16-R31 have been reset to 0 in
the guest (per patch 3).

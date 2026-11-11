Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794415879;
	b=dMIXNoh4F1NV17oLfFSDpu41/2iRVuGFi29P4XPpeti32Ff99hqx3coXuj/b1TuOcMrs
	 f2tB/HkdvDNhFlLqJWnI9Eh2MiDPoPynhR72U5Ef14VbLo6usG8ajoIhRTLuj7sukWOfG
	 93ZmPEpjtjMbVUfJqr5ciOIoehASDuDOIuayi5JrTFFmFOHUfoUyZVXZS+xv5YmNC5Bor
	 4VkqVb8IHYgT5PxxwLMsFi2nCIysosEuru2yeykaqqLaGaS7fVBozQ4YyPp/wEr0uzNlD
	 DI2zzXLvCNYaRI9CmLjpCfPUdJ3g/PCQN/lbJX0CjxN4aSWEV9LlRjSLRoDNMJULljg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
	b=DrAQYoDaaFTg8bM2yhOtEnWHsr2i9oj2u5Hq5VZYeiBQ+hkFtp6/kO0bRBDmFDTFtUXM
	 HR/gpN2kdmhQrgQ22VvQg4NVEggyTt25lAhbikYreT5n64OTVG2kKOha36LsuFoOeOd2x
	 fs++54L/KbEY5HDvbxvFWJqSmBh6AyxXFHl8d4u/wJ8/taWMCSur9sQo2fa2F+5E/3ehh
	 5/BC781b7upiVJQY84Mg4VlQB1ZSlIpe2EZJN7eoNaG3XfGoXM90CVdqmpvUhNo2rRnY3
	 IMvqlTWak/pAQKmspwKQTB2LGkuklf+GWcLjLD18+RdsIyhJpX+z+sykla/98blngKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNcy4ztK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNcy4ztK
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3edaso15656f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794415877; cv=none;
        d=google.com; s=arc-20260327;
        b=XzhjBXUbqo8URSAllX59Ax2QfnQ6WOLxybQzbB69O1R/9TL96m0OdcCiX48hB4D9sm
         BGKdidESoqEpb9oqKF6Wu1MmhnoxmWYl22pCyurV3OqBiq4kc+FSt+gK3CY/Lgbd1ZCS
         B3im1iSc6Vbw9HKVr6b0Ut8JnPwza1582Y57JymKAhsTN2At6iFAMhfhxfRbV5m2V7rq
         Pp358VC+ncbClarOwkt9T0/J/5tNQXjp3fNxdKhaW2yTstG/knwH83uGFrdUeweZQx6p
         ZukVc/SnB+Oah3Od3xlu7GUPadn+mR3s5te/f8W0tbtt5q4bIaij7ZJIbay1tnatUP22
         efgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        fh=keCgj2atV79/zM77p6ZRECDaEN5PULtjWFG8ua8BVwg=;
        b=Iyo17m1XntrG9dDUfpteATNljgrCDDJpRb5ZXTh2VmE7j0B3UsLGOEgiNDkxg3Cqrd
         tUlBlHN89IUrqdLmy/Y1xZtlJbLzOUytFELQZalbUToMGQHlnwlDagYx7aLR7aRiMwTc
         QEAFT2BrU01iM0v5CnJhkmMvdsgIuAnbvjsMhYlQ8CdDo+6lAD0+EQxtV6R/McaImA2n
         POEGTpahLUZO0QrsNxffCrQjCBAplQ6oMN+6+HlHt5/8x7ZbcCt5rU89PRExoJ/sDJdn
         w/w9eT+a7XkwuRW7g8G/v92qeZfwv/Ki7plI2dyRvmqiXKLymRFh2YUvU/v+ifemiGRf
         w9jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415877; x=1795020677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=cNcy4ztKBBCUP4HFE1W66/wJVb/byaYeDzPGmQXPqeKDWSiq2ysIkoZqhwEi/WMKEh
         U4IJbdbK+FPBZV5Bp+0ExleKbkGD274FcBQNx4ablD5DGTFeh9wxe1vyNraKYUmfycl4
         9j58gMzjadYeuEVrQTyhAeY1nMOLcWo+MxaSTsK6ZRd6/IaTWlOoCJhmaF71X8N+Ft3s
         mtpf84Oo0QrSBWUPrNSkeg2SL6+ZzZyBg56Cy8ylvtLnezp9yFlY+7f08x7nz0EGFFmm
         i6C4yaAoUPUU3lAohEp7pixrq/3bN/oYRHeiYeuGpxYw37iccNIDVOBGxKsZVHnw7jpV
         /SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415877; x=1795020677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=r06xQxo/P2EtSsPAnQ/xeAQvR4E7+jtUscgjHR/LzpgnwQYBGtbLRpVRYmKtT8KbTa
         nY6Y7DO0aFcvwszDfp9h1/Qes62Tm6wu03oQBMsjwzEZ+BqM9Wv8yNYa3SkS8YIeA2Ne
         LA1rKF6B9uJS8xy2GY702ZAjR1AHBWqeBqv8UNiLYLKjjMx0PMB5R3qnZVQJHxRA0OB6
         kEi/DjpLbO8isnexQ9GIbXogN53p3ZOAEITqrp1RskZVzXGrEnSv2iV5Dbj6EaeqpHb9
         K0lNVIuplB6RxXJt49bezaMvx5rdMv8Gj0UE3dLVZlVROs77FITjyDW2tG8BiwcHqmsu
         C/lA==
X-Forwarded-Encrypted: i=1; AL+hErFH6xKVZ19WpeKVs6OfV7XjeeWOXSguxKHMGlU6zJvAv3FaUIjJQdACDRn3GNp+265ZXi+UDkwyevBmxFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A6gn6Yn1jkse+LBfhICgmkz1q0S9MLIGsaDxG2Yd4DkyFjHpL
	JNj0zEuvAaYPnd6NharBLXBAdJ30DZoMdsxV5JTwl/IkDQBamFnMHiSPhivabHJz1mV+UhpTdqc
	QI22kbH97XkfIRdQMDbWiOAKtDeMLCaxYPCsjTjU+
X-Gm-Gg: AYBFou2T15896VVZT4b5yjIj54CmsFhqoDXyNHPkHkmRhnuTQdHRaOrryUFHRom9anx
	OuvOvHn2c1YV6cemT9+31Qb1bvAglpIlVJ+BdWkZB2flWiQ5QWRLUXhRiFKsB+76g6iUPhXtFwj
	AgfelFvMfEsiNF2waG43SHpt/1Rqpu1coeZkrsGCComOSsvdVdg9tAznTtu2Po7YvfIJ4ZqFKJV
	Tr5OpCfLfzYqgJDx4vuSf0A7CsC9Lc2P4K5eiYzrKrowLRXE9VAEabaxzG2mrc4OiB3MpacAvdy
	aCnVBV+4wV3OSqcraph4pkv9XgiJJuGFD47/ZjWMzWRrZjz0++yNTKnYvU7HjIlpm6LsdqgcPB5
	i/8SDA7CvH6UowzqSZTcFW/V30sauS1QZqmTV65jGcS4EV1epndTzxWiaN5Fq6d6BqMp2kzeV7+
	PPKTKJn3rpj9/a/vkAHgxbq3RRmN9X+dB7hTJ7I28D04ZYSsRFVhqiAHjPYwlOwtN0+8NK5mwXo
	QGd1TUt4lwUtEFi2WPDhGT5qWrJFgejt71xGg==
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id
 ffacd0b85a97d-49b01cf341fmr22869f8f.13.1794415876621; Wed, 11 Nov 2026
 08:51:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 08:51:05 -0800
X-Gm-Features: AclHuK8l5K2eY2r26mTBewSe8bSK1J1SDnVW3Q9OiGp7cZxgZU2dOMsZVOmiB-k
Message-ID: <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>, Jordan Abrahams-Whitehead <ajordanr@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> '-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
> section. This flag is supported by all supported versions of clang, so
> convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
> depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
like the kernel does not use it; AFAIK, no one has ever tried.  Even
-Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
have to update this kconfig check (the linker flag is only supported
by LLD).  Even if the result doesn't boot, it's perhaps worth doing
builds with BOTH to see what kind of savings are possible at the
limit.

> ---
>  scripts/Kconfig.toolchain | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 666d44cc6ba8..570c5a31016c 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -164,7 +164,8 @@ config CC_OPT_ZERO_INIT_PADDING_BITS
>         def_string "$(cc-option-str,-fzero-init-padding-bits=3Dall)"
>
>  config CC_OPT_NO_ADDRSIG
> -       def_string "$(cc-option-str,-fno-addrsig)"
> +       # supported in clang, not needed for gcc
> +       def_string "-fno-addrsig" if CC_IS_CLANG
>
>  config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
>         def_string "$(cc-option-str,-fdiagnostics-show-context=3D2)"
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792465505;
	b=wTEnUBcKRtdsCmcAL6RqSnYAvn1HocN0ArYDNL9YHwz/anZG+o3KqoJiOxvO/l4VSZ1o
	 eYa5RgTZGLQnDLSgJCfASdonRF+rqKWk9QNN0J/PiSPOdSFdEVyYbqM3ScTkTgppU71nN
	 9+VExZHtXpIcOK+zpqbfaoisF2R1V+1eeyrvpnDM7DfAbNcdCL3VkW3Ty4pNzLtzxH96q
	 3TtF7wCc4OQjfcabii44ppn/iTuGK3qUCeegpl7n/qA+h3JxXStCfx/hIKTIP+AtjO6UN
	 M9BExaaZ9SqGKgvZwcl0R8/8mqgoW/CNZvXrb76M59hEiYj7LS2xIdDSRU+neTtpF4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
	b=pr4ObhLFYlbbsdRsM8gLZdhQM/1CsD0wMHwy4UG6UrAn3osrBwO6reQW19nFV1oDabRc
	 aKHIcAK8XeFvn0KcAS8iZ6XKr9bl9DP8EyJpLtunw+etMS74DaEyis+TF5NOE9jy5e09Q
	 HhHUcSIfxrpYwcbKKhHG26Gz8gufFPUzLFYFnvsQ0RoOtcFQZYlFJHXuh72BldM8f5IqJ
	 X1Mo7NVUYqkNchDt9pUghXz2lk8T0lFxF1b9rw5sz+W3vW+vV3VsyphSxyJHRHqD/GA8b
	 TfftwrL48Zgwfd/rGFC8nfdMOlfqEk9iNQsLiOBiC8Uz3hNpEPZRKQhUijq4cflnVmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h7moPNSn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F061606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F061606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h7moPNSn
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3189434a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792465503; cv=none;
        d=google.com; s=arc-20260327;
        b=E8cDBjHIJpWk1tT5uqY+L2Nd8hdsPiFI+tqboatCJWMMHNIGtzf87TsfAZldbxjerC
         pbh7Pn8f4YsYfzNdU1BC9x3Iy5jna9eo74fUwK00O0eWP1uz6m3V4+5FPgLtiViOmWLM
         +iVDrLF1xpvUcMonztxNY/piwEOE/kdeqeVJY+nJrt3eZqXWn40drdoCepmikQdXNKcp
         iJMZUyfF9H8cIpw7pTWsbSJ9wnWltgBa0mg6qh6/OQTj948Hs+4jnFZsoJuG574tiAdu
         6AlW/bJK/ZmqgqHV8+AJ47P7YrxFtl/yUgH6cyKIFN9PA8gtaIm928MpAmsi7rwlA3T6
         UyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        fh=dfAi5vI2sdmAeyXLbolPkvV/RJkvTms+dswP9B1mfjM=;
        b=lhTwz8lh1NTAvF8H/qEjgHdcPkkF8c5em/224T9eE1c1PyDfl9SLgY8mTiqA8Y9PEj
         CB1Tx0VMTkTjbPONIupNCOstsMKES3CkTo3Q4X9NzYXjx6b3a4WiX66r4DgG+1x0GIzx
         MlA/L2UgY8T2ked+TjuE9FFhyrg3Pi5hsIs9UaQmBzZlz495k8IOJL0oahKQVxMOVRAW
         HsurxsDFi58nzTXWd+e2/aI73PukqSSQMLLRCYBe11dHFKCXbrO8wtgcET+JXPh27F+Z
         TCF7uxzI3fvUuiK4gbUMSHYypg5Dl+VPuLuRbXSy8eX4R3vLvUfvMJG6t88gWkdWov3A
         sQeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465503; x=1793070303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        b=h7moPNSnvgqzlAPA2mDstTFoHp1b5uJFIZsa2GNsW44JlJMCaR2FmgLHy4RCdUsX+/
         wr5mramF7Be8DhAcgQa2Z6ci7pNp/rMHBDDHHSpSXAozEGSfOtKn45XHAGAt8KRuFHna
         E9DTaWupC72H9aBdYk50VuLlVBDc1VYlTnE88ANIyFxlgG5NDgj2R85HfF0JCrPpvgzY
         ko13WBuvwXIYfkDxnhwgIhCEu6fHYVFgoXy53pu+Q2VUcWpyB5Q8peWymumrM6OxJaEq
         Aagr8xyBx6Ld4b/HM8yHLQu1qORZUzxCru7Xbv8iCljPnJXIGd/yTkXK0XeCpeHnhHCC
         wVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465503; x=1793070303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        b=YClsZvR5r50SH+rlS5w3NrRWyxcCwONu/EjrpT/dqmxAW6BQjXr1+ttPySwESyvcfe
         jrycpfwFmgNyYQwIVWJb+lk7OG5CVqrezpMcqJA9kBdbrzCYfZwWZOhURyEs7Rhd6KzZ
         xWYP+ehWfowhLYPGhBvSU0/9GrPu1CqaN3Eem/RsPXr6QKCw0crQhkcF4SAQUhJb9Zty
         MyrVzyi3JQmQq8Pd4R8CxeWeUhn1ItLmThi2dak9N+iCvTQ5C8hEgph2cMQNZ5wBG0/M
         WC60hpY5zxJWSeNIeDLSp/xiwoHIrJvS2C11ix+okyTtikpim9ruK5y1E9FxU3Dsx2Jk
         FV8A==
X-Forwarded-Encrypted: i=1; AKwUvBx4PnP39cg87y623uviYI9I0GXz+/nLGolPXtigRIus5ubIhJa2L8yF/xq00oT7vyEi9A1zFOz5Y052mT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkigfPtP6OHWi+eBEWNjPPSpMG88nV9+znEL8b/kC7uA9h3Ur2
	IoZGLYeDGwEV0LhtW7iE50HvNQvZqB9/ej0jJw66uFHXCNk4piCweEq7IdqTMYtlK5N667Zf1tj
	2mn3SLibU2atwI2lryFRNkgRkvAD6lME=
X-Gm-Gg: AYBFou3bWZaZuPkgPfZUP/+hjX6YWQgvKmNxMPmVMRC5our01DRqNDtzrdtosIFPwFX
	4q/PYPgHQicViTu0fA9Z7xw/sgGwQpyfrQ0V3p1OJYNz0a+pHEZIHlxRjRTyBg4Rz06zho1zK6X
	25JyK/1xZHqbdstxkXXFO5nHNJT0LTh+4/uY2aJqPEuOJl0W133KqOpzq333RObyhyrUwWG5fZY
	Y8LkfKMfefSSnGLOK9GB84WzNsy3UCiqIJ4APlKqRkfHENYdMHPdZ3nRIbvVHCh94eiTNkZTMV7
	z9O4R2SVJGjVRKTA4wZ6RG3q+I1Cj+UFPmRbw1OR5ImwJHWfXiR7PooNIZDPRicUk0ACR1q64x2
	tq7Oh3A/s6aTl3h2c8zetXq1DrR0czqwht7saAvg1rVSpksYvmzRK0EY6m6pJBXV22xTvG+fHMe
	cq5LIVeTtzaIBsoPWPHk4qoQYIS4e7uxtdXdS2li50+x1842yidduBvJ4sxQyZdlKeLA==
X-Received: by 2002:a05:6402:21cb:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b3c422964amr3480579a12.25.1792465503448; Mon, 19 Oct 2026
 20:05:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003238.2823758-1-sashal@kernel.org> <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
 <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local> <atbBFRU1Wm94oYB7@laps> <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
In-Reply-To: <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 19 Oct 2026 20:04:52 -0700
X-Gm-Features: AclHuK9e_i8qFJodJE6sjcdTqZ_dJSB7D7Wbc2TXtNWdPBYiwFRcpycwZQBv_MQ
Message-ID: <CAKxU2N-+q18FoNV-MLZd=dLrpUoJWEVVUV=E9ESwS4Kt-dquAQ@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Borislav Petkov <bp@alien8.de>
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 6:29=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Oct 19, 2026 at 09:17:09PM -0400, Sasha Levin wrote:
> > I'm not stopping you from dropping it :)
>
> I'd love to.
>
> > Any objection to just taking Rosen's? Maybe with the tags I had on mine=
 to make
> > tracking easier?
>
> Thanks, that's nice of you.
>
> I'd like to use a trimmed version of your commit message because it expla=
ins
> the big picture better as to why we need this in the first place.
Feel free.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

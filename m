Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553682;
	b=IMjJz6YimYr000oxXW74BiaQ1GFosRRi3aCM68l5DKOeXXh5a/dXvG7cs/Aa2dpkCoZG
	 LWQw0GZSaTdtDqxf9n1a6VS2B9uBsfliDfEJb+QSrojIjGaC65VDuvtF+JsKesQZWiIk0
	 trUN5AVcPMYTqkfQUmnDy697ZAjd6r8VcsSvDfbPX1+nDV8/VA2Pupv5iwiwLu8645f+P
	 7pkaC39Fcxf3SwS6ALWOOZb8CV3Ai68ZwLZJcH/ERZnpEJX7RhwLLQ+pIK1Whksgd+3cN
	 EpKLywtn/89MBgK4baLKAEOMjTo02n4BoAoVKkltPp+5l7Lwp2HMnHnNWNiTofwsdfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553682;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=AT6od9KC3HZrq+GHLVccl6j8hnG03xX1ET6eFEtFE/A=;
	b=sj4+2lESW9Slt6iEXoRPrtFlobLqANzjc87WNoWv1kKIGfhVi48DDPy+tYN/dOqB+hr7
	 nS+0E3KCbtaqqZ5eCVp5AGRDKvKsGLMtvDH8DJqWBX9RG0aieQ4c4lDFCBEbUwgeRU2rZ
	 jalSSwEcspafjgeRUkou8xrvPF0aEMb2LXDHHoVEUGL4mVRHR3rokUfW6R7ZczE6bR66a
	 t454lFSRimJXXb6UCGALG8Upw6/jOXfgFxfeYZvOpveIkMNFuAYIxHqYf/5jvgxfixrSq
	 e+0wDASHDSAYKEc8XgMVWaeuBoVdvI24xhMAui7ZC+Tbu8u7d3Zqz1EnDE2GicpOdQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gAj8hYLH;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1FF606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gAj8hYLH
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e8fe8e343fso1462275ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553680; x=1793158480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AT6od9KC3HZrq+GHLVccl6j8hnG03xX1ET6eFEtFE/A=;
        b=KkyYt1C826DYntVJQDA3Bzf4It72w0pdLB2ezbnwa43ek+XlZ18MSL+xlKCASnxlBw
         L5zyml90r2i1SsVWwWwq9iJ2rdnJ+cRCi8zwHINbBVgZcPkaM//LzrOWUNzzcIHfQYPo
         J/aA119F9siZch/Zax4/8xgh+D29rdvtUJ6f3B1HgQF4zPHPku6sOZiAX3Dynt2x/BK8
         qsTDqU8NWFjnzMdi02erwY7A0H/tRZOq3qaO//1/HQ0pFGA5EVAb69UfzIYkJfxIaics
         3va891+Evc+4EdBZuTUXjz3BJvgyM5XYJSOZHa0Yln9U74kt0tA9WgP5yOwsIbGMftOb
         M8Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxnSiLfolERC42dAtRSTobd8fmJxQ1bO8tFW+KYNExjdxxtlWNGrWfVPwUbEKkT7SkDX3jl7Br92D9sJtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0iRLCDZVnQwxzAXVAOcQPB4eV3a7Tb2rf3V5Mv6X8HrXkCPjR
	sSy0QPM8QhhczD0EMxeMEwflbKt/hUyTUPfImQsqAyW4kNGgwuSOtyNbVZ2QqivKc2jY6DCCdmd
	ZF8MAiXJn3R2LXLqxmtHOmeyYw3uIOv1GX4lKbdoVioNV7tFGzeTYRdkc1X9dDaEdkUaQvPdn6K
	6Gf+ojgO0xeAPpEAZgcHbul9o8SCd2RDwQC7kEHXG5abagqCHmmZzLKo+76nehjhaB36XDmqzTZ
	ojs0zMsN+PA6ePX
X-Gm-Gg: AYBFou2W+c/VMmlFul+WIyfMuWsAoAHIT8A61z3XNG2WW7qughoadXJUWk+Lykj8YI3
	ZEFOn3xrZw5fc2vQ6tLRw7OsnvV/+hs//f0tHN2DbMR2Y8AfmVA3wP9Ko/acKhwHBjABV1a9/Lx
	Mg+1RPyIZ9SX+x5KTtWaCQ0G0aRsu1UhoQxRdjpHa2iS7A2TGC65HMs4bAoKNWXubk3v36vlxFU
	xxJHOr0wes526DcEBHfjCH3ZG2DB5xZztCqoqtio9HVmUtdGYNHUvdKvi4N8qwTA4gdW4UTiYur
	0w9R8squJ81q6WE4JqldG9JkydaZ+H0GbQEOvaHhzO82ckRc5JFhOYcJ/dOP/dNape8ZV0JL+Dz
	0Zgx/TTXISH1a0Oezma5Z2gC4Ny5aHfH6kIveLF72OZMiOo1EXcdl+tQX4lRDLBitOPdZlh1vCy
	idSk/ur2o5flXKRRRulwYVLl7y7h1BJh6M
X-Received: by 2002:a17:90b:17cd:b0:3ac:7613:1ec3 with SMTP id 98e67ed59e1d1-3ad86ef29b3mr575654a91.37.1792553680378;
        Tue, 20 Oct 2026 20:34:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad82359de0sm1043396a91.5.2026.10.20.20.34.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:34:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab32495d61so1280631fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792553678; x=1793158478; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AT6od9KC3HZrq+GHLVccl6j8hnG03xX1ET6eFEtFE/A=;
        b=gAj8hYLHY8QjUNofPcMYyE9pxyMY0kjF86Vuuqki9OZrLN8Osehw+ovd0vpfzwcOgP
         pHh8LUXflxMo9fQYCrj4N8iiDVLiS2AQx5bhGnicjscFMEaENeqiXdC+awRR53xUz7JM
         dVFfvycYqOtmc7a+TmAFrheSlxOLVkP3EVgO0=
X-Forwarded-Encrypted: i=1; AKwUvByZ2+yWIIndgBg5mX8l/nWWgTf0KawtzW9KCivHc176w5bgp2nmHAk0qQVpx7ILw5SnMeYynHJgc5Xov9s=@vger.kernel.org
X-Received: by 2002:a05:651c:a0c8:10b0:3ab:3b73:4560 with SMTP id 38308e7fff4ca-3ac4416514amr1399541fa.11.1792553678368;
        Tue, 20 Oct 2026 20:34:38 -0700 (PDT)
X-Received: by 2002:a05:651c:a0c8:10b0:3ab:3b73:4560 with SMTP id
 38308e7fff4ca-3ac4416514amr1399461fa.11.1792553677861; Tue, 20 Oct 2026
 20:34:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
In-Reply-To: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 20 Oct 2026 23:34:23 -0400
X-Gm-Features: AclHuK8ENfLisiIT_GEK1qalO15UCXsiYROrnCL-RUbBf_6CSo_GUxqkuPipUvI
Message-ID: <CABQX2QMNetg9iYRRsQmeM3+1tnC94ccWM=450wMZL_sUbqAJtA@mail.gmail.com>
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
To: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000041f3f1065e516dde"

--00000000000041f3f1065e516dde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:07=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> The high-bandwidth hypercall helpers push %ebp before loading the in6
> operand into it. On i386 without frame pointers, both GCC and Clang can
> address the memory-constrained operand relative to %esp. The push then
> moves the stack and the helpers load the wrong value.
>
> Typical i386 configurations use the frame-pointer unwinder and happen to
> address the operand through %ebp. However, UNWINDER_GUESS is available
> with EXPERT and permits the affected frame-pointer-disabled configuration=
.
> vmwgfx is also available on i386 and calls both helpers.
>
> Stage in6 through %eax before changing either stack register, then save
> %ebp and copy the staged value into it. Load the VMware magic immediately
> before the string I/O instruction. Mark %eax early-clobber so it cannot
> also provide in6 or an address register for it. Use the same sequence on
> x86-64, where the full-width register preserves in6.
>
> Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
> Cc: stable@vger.kernel.org # 6.11+
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

Hi, Boris.

Gentle ping on this one. It's a stable fix for the i386 high-bandwidth
hypercalls (vmwgfx uses them), Maaz reviewed it, and it still applies
cleanly to v7.3. The hypercall cleanup series I'm about to post moves
this assembly out of line and is based on it, so it would help to know
whether it's queued or needs changes.

z

--00000000000041f3f1065e516dde
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEILp+
YS8IS4ny6z8YupvsGjeu4GQJnu7XOoFoKwZuI4WxMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyMTAzMzQzOFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAQIOyY9umz0jGduAk7yJ7nOmFjrQb8Op/UZN/9r
hgzl7KxRjd7M4hScN0XEoKJn4oJMfHdkGYc+07w9Io+UVVBkds18D4q7jOm/Ngym/BcKKjSgGv1z
K1oIjZu1fcxIT2vJu17I5BYZcIXOMKL4bGs0EHAeAqdZPcciPq3vBD+2IpydG42u0n6sPD6mj8uH
UMt6JbMLKivRZp/zEepKBPCripnp1ZGJwfsXG+8ya3/BgpzI7a1D6OEhtjklL0vAURHbNxwNCzGn
Xro66AxXm5VK6KDDI+cegVCsd1foc2UYXb2Q5szyZtlnVaDG8vYy5oOVFzvMrYd4nASpHDkCwyE=
--00000000000041f3f1065e516dde--

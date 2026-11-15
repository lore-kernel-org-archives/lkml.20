Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794724271;
	b=jwZGEBYtvcUsW8rBmtw+TtI1gBCngOHliP/GRyQz78WNw6w1ey6Keif1+mSBxXGBoDE6
	 3q/xPzTTHZxL5Kwp58/wz5TCzeFrXy7BeZe1VqxTClBn8oZrXm6fXEyilgbDGxHWU1vvJ
	 fsz0DvyIEq61+aF7TjA4lmp8Szta3RJLqOPPLap5x/iqtAm2TV+3/Zv7gFQVHcz7+niLj
	 hyAZOFwXAv6jPcl/Tp/doIBPVqdnrSz4ntvBFqbKwbedjVq4nfG+Xlic98XsgoZaUv/in
	 P+PuZ+4Z/qC8UnYIosRwiLirPP+2UP9YwbYyM8QfPZ5J9xrqeKLtec1L1ciJEot+RGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794724271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=TRLI9Td+RNJwtBm4+tKQD4CjycAG9GxlD246x0jzIC8=;
	b=db6hTvF3hrOk+gYU20xS3WIvFdEYdNbJ4noWOZ666SkLABNgItvBbWlmFauYYiuJ2kdj
	 sx3qm45Y55/M2tCItywAwxFvDEBvmdiQcMFTjCXTNO8yBEk/DnHYl9t33/Ef9C/37InNG
	 8jFK/AW66Oh4B1DjMT0nTX9Q/r96qO/hX3CdkZhCdmq0l6xRDxbANrEZhiN76RI+f3N5Q
	 QbDjT9Bmm366RaDdSuI1gt2FLvHNA1ybYB5tEzc4KOCbLIE+McYY+xdiaqYgvS1Rd9jow
	 ssXoKWxETiD3+79S6u+cKIYDZTC0WHTiwtEqy8HBbNj3i8FjZAvx1nxnAMJx0HNaiQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlBeN1S8;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77469606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77469606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlBeN1S8
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso3891615a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794724270; cv=none;
        d=google.com; s=arc-20260327;
        b=aupK7bE9tizmBFCklQN37KMRiFr7uOEBZsEK33eRNw4YNPp7CJryO57NGunGHm7vPO
         fd2HSv3yp/mDgJMjwNqbJWEXrX8N1ILokMGJ+pq34qZstUQ/7ce/kVWngr9gg5bCOunc
         OKXAnIA+cT1oJyg4oKaEpI0+np4zPKAyGyOC9teK6MXeEzmMfCQaVd8N/U7sIc0NBOZc
         vMrYwKPimxFzY89q7afMlF4ipB4py22v6c6Fecvd/B3ev1JrRK++tRPYVEFE1g/v+Cvc
         jnYScVGhEzr8jd6aJ+O8DTn7+iqDoaR4WYilf1J0u8coYwbTAXuagREfFhIE3xgsp5i6
         qFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=TRLI9Td+RNJwtBm4+tKQD4CjycAG9GxlD246x0jzIC8=;
        fh=MbGqyrmaC3pVLZulv/HzyO35Kx68J0BAxNvAGrCS7LY=;
        b=e7crMlxyzWSDXRI1tZeC4/KPNqzi6HIuz+x33narc1KV6H8QboJhDPLPRhfselRa4k
         E/M1ul1U7JA9GJA39HAiKrqyibGU869AeTlKbNfGU7n40a4iKusZzZs/LWXNcjvTz6xK
         oV4O8vdXoCuK9MZ8jNk8jmXNOW14297DJ4MixpAEzzCb0QrOTafcYY+CLPYpl0srj7jg
         Si2kZWQpojZmiU5QxwCLBbFUQ4z3P45N2QdsU1DQlOVRyxOmCLIMRjNS6yZfyCGdPUEZ
         XRsralQRcCgS2g5/qdNxf56MBrnI2u1Y4dM/+JmUMshgUiEPB73m2rOBx1He8viLMrIk
         WLUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794724270; x=1795329070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRLI9Td+RNJwtBm4+tKQD4CjycAG9GxlD246x0jzIC8=;
        b=BlBeN1S8rxcZ8yHOolgoiuyhMXqgdxn5IUTUR4vu1neep3YC6Nrms9TuiacukJbDIQ
         4Ao4jHPx5XOu8x8KY+n6o0tRgK7B6wZsW5Qg0DB297HV/i28F0+navu+6k3y7W1HJWYE
         ABZCpHvPcq7YmTMebkJ4CpyDq4tOMsoMXWuuZOxglaIOOAHTf9eukAMlvJUSxiG72Z1c
         +XtZ7g47yej1b9xctL3w7HLwQ/NamA4ZkgEzIZD8jL8IRrRnzt2RbghrfhSruHET0Qor
         TfYIl01uqJ0xc8a+lEjf7htkqSHScjFhOMVIjqI0Ls3uEAjetq2v9mDw5WJ7XZ20vU4r
         RX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794724270; x=1795329070;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRLI9Td+RNJwtBm4+tKQD4CjycAG9GxlD246x0jzIC8=;
        b=GlKUfww4pAwe8BS2s5v3+s9F6iWhsXY2+7ykyRhO9oPrMOp3VQXM6WxWMLpq9Kn8HN
         sePvWJLhI2deBhlbfly3t/KuBYygjCm1VewD0CGQFJs+bf8N91n9Z/eGjIb/pkP+7kHs
         AwbdA9u3ccgXrcBLBatggi/BHoyTDwGYRIBpROb2nudW52KTOQTERlNg9VfFj6lP10nu
         rtmfVdQcumJ8LiH+nMVl9wU+HW+kiOZGErFwSXwWJSv7t44mwPy7llwj423bXNfipk4D
         0YnXfrvJRHYbIrZLRIrVr8BkzIR7koCQZCDkUu16yV3+gxzFuwKv2IdlGYfQpJfiMnU2
         OM+Q==
X-Forwarded-Encrypted: i=1; AL+hErG4eCGwxPn+YPQoF/c/dJ27FMbTu3gGp7xi3BA6m0a7B9egKKNir7wtbTnq7dU0yC0T8p6Vek+kfRSgFPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z898t4ypq9ZiMK9Ya7oGX3cKx1MtAMf8qbvckkhXziMRbeBIONK
	BD3zSMM1Y0rkIjbtzHgZnuhlbG7T7HfTsffD2aNLYcoBQ7J1wDmA+N6P3hl+FZ4eVPjRyP0XxhA
	WKFSh+u0vhy+MhcGY2qUJe8SbQpoX/84=
X-Gm-Gg: AYBFou3Xo5Ld+tIMn7R+j0GuBFMs/U1200kOwR48rX8rqM5h1RC3hQvbrS9pP1u5Xkf
	lqIxMrAoyg14tGl5BweDAFiFMboZH+1rLRpPomS1oNypdE0xlIkgUZ86bBj4LMwROyE1r2haEmS
	RgeWCn//s5CDQ/6DusFUmKSlRNcgtXB3tOOmINf5IUc6q/yo7CG2fZzr/78QEdg51yX/19UP5F2
	x1nXhyU51i4oOMzOU6qFFCmPS+a/BOUBPov2FqOV4YrLr//FminbJi5ln+rkvtTJ1qwQAwsC48+
	5TCzh6x4Jr6fBoXpHAh6fqBkY79cRpZmD8mhxNCwp70eqpjzoK2INkG3FB4qB/1YqK6jNcRtgah
	uLsJrUnB6KdANDA46diOJJIqMX20BcSfqYPvrvhC7S5BN0UvnDjug9cuX+8/fQaOSUlWwST9EVH
	Qk380t1e7FYIF6tbcDUKnwKGX/HJDwr/G1j9J8Y4/qTwrpVNJWv5lI1hA=
X-Received: by 2002:a05:6402:4404:b0:6b7:82cf:f69e with SMTP id
 4fb4d7f45d1cf-6b7c08b4c7emr4946620a12.2.1794724269570; Sat, 14 Nov 2026
 22:31:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Sat, 14 Nov 2026 22:30:57 -0800
X-Gm-Features: AclHuK_unVTggCaoPUML0eK717T84qUSQdruqbjfPhZrS0xnHYClig_DE2lhj_Y
Message-ID: <CAKSQd8XsZg7VooNs+MK2=YWOvXii8oOC6ULmbusubAk0aQxAYA@mail.gmail.com>
Subject: Re: Turning on DOITM at last
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-crypto@vger.kernel.org, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Continuing this summer's thread...

  https://lore.kernel.org/lkml/14962fdf-66e9-4b64-a37e-0e697c875cc0@citrix.com/

The DOITM U/S spec arrived, as mentioned on the gcc-patches list.

  https://gcc.gnu.org/pipermail/gcc-patches/2026-November/738803.html

  https://www.intel.com.br/content/www/br/pt/content-details/932747/user-doitm-and-sup-doitm-extensions-architecture-specification.html

In section 3.1.3 it proposes two changes to the published DOIT list.

  https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/resources/data-operand-independent-timing-instructions.html

Namely, for shift/rotate and for rep stosb.

How is this not problematic? Will Intel do the required SW work? How?

And what good is a DOIT list... when it then changes under one's feet?

(Other insanity: the naming prefix/suffix mess and the cpl1/cpl2 mess.)

--
C.

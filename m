Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441E3F44D0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339021; cv=pass; b=QWInGiP2NOmUHMgt2de4bE7ISA1tzgt3uhPZ1TP2QDZmQ9hG5AYz4bgsx5sqas8ZAZfMb4xP28t1vpAICbSwoM+4uEcYZ/aInEiyguFvSVYWX1QVJXSrifR/ad4wlixi3dBIOwY58JDhEx6MzL8FoFtf2z8QsCFEJ1jTKBNkNCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339021; c=relaxed/simple;
	bh=sLw53KeXCRX5ku9tFSnggMWYgw3NaH4bhGi+ilx4QqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwP4y6XKh7GF/dP1C97CeObC+yafZ6h2QDRQvB+FC2GMO0rjIiDEK1FSgxvrfqOoFjqBzmbT+lsUEqRxmSna1MB5egNjjdiIMr/BhTxvBmO2TEXUv4Ln/YRHeBTbyJdcmnT8NgqhKiomzajPVeb6z3H0D7VckR66+Nbah4cK9ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTP3lM7Z; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTP3lM7Z"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so1179579a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339018; cv=none;
        d=google.com; s=arc-20260327;
        b=dxuThdtBHa5+JBokUrZV9GOziT/H/Di7Hn22v5lvBoJXwKKWj/nWgVgSb1EgejBNkA
         QiZbGsaMUMVRHIsnUKSMPoj0FUIXdWBPVl26fplbi2mX91IBlPKv7op+cNjCFrLzXG+J
         tVFMFy6mo92YE3khM8UIZZYY1NOtDZ8cGizMg2FjBFgAZCH4SLFcaycoCzlIQyy/8/cV
         kr2Hnkxiuv9fTPGZLStUyZzRqtCj0t4NJ84oALLHH3uzxrkNJPh1ebacx6uKyIq2bPq1
         SALonv6HVHDdvD6L4XPoWDyomXftwlQ8RcCxzO6W7igStvC2FFquOvzC/eXRN7tmBd34
         0tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        fh=DLqq/Ysq/o+f1vLRSE2MfTZ+6ac0mR3WmjFWHjlSzbo=;
        b=dHgaH7drwQ5bgp0z5vqXVEHJtCfjgYTmzdrtKIVFEoXKFRQQwpKc/BYWeZ4+OVAcWf
         4og60h/bJzBfogEuVT8Gm27cvolZiMQcnhBzcyDOb/YfkBmQMHdzghPEMmzmJkU0l5Iq
         RI0RWypFaZWTmQd6Ux6quBPjWJHKfNfzQzUsWQhMcNY+zdJ8zXgkpWkyUNP7KJQHSlab
         Oy8sU/TUGqshidMBam5RjrevIy6gGSGslbmFIChJwc3RF5STcKxamdFX5ZhU4lnT6/yf
         7JtkLr1Vo2xquxitcbRvXqSF0vHS3c3ssDHie/Vmk4tv4v2VKefAbzFFAFK2Mq5DLZfh
         74EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788339018; x=1788943818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        b=PTP3lM7Zy3Pdw9Dtw60cg8YUdvEMRBzcRWRxdbbRm3nNwk0yMWHw/hXVZ5XXMpElXO
         vRf9FyhlEQ6NlBq4qJjf9IhlzWl7ZmhdHR+4W+sjaU1/5IWbo+re150A01WUKdGPFIZc
         isdDN7ExBL/nihXfYcV3hR89GBXjp2O0C4fjkxpYg3f2PjgAMxmsBsJ7FTmhiyBvX0FQ
         dgT780i9nBbxmmnPOZC9MZxGD5HWTd3RxF+ks9gbbP2Bf8HuEZkHy/kH1YSux/zBeM7/
         vSkma0bioZqcnpJbSdTC1xGvBzbOu7GJyCvCwBni9HrLHS58552jIU+EP6ySRo/Zu/i9
         NBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339018; x=1788943818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        b=ZrukIdHK+dEIm7WFvb8DZDNQxYwvHQAted3+9OMcEYiAlFBLhR9nceM3XG7o38EFrp
         euQh7cSBcdV7ezcdgqjBLf1KMa/ulkSmk9FpKmavXu1gzAxa2vX+Qc9mOG0CFyQffz33
         +230xGE69vIx4X5w0Pg1oM0q7/NHtpj/JqnR/g6236M+cGA1I9BSv19M3ZTGedlOQoyP
         8ix/Rnr1P2Nt94xVl98QvG83WkJB64ktzsJAu6wx4tH8Vmz31QKUzCYZrQczNDgnKdkf
         kH5IGwMwfqq+j3s/j0zZ3a3zfMvAoJKa53rugRj/hZ162AlBQhCTjrAJjvcray7BJDc4
         QR5A==
X-Forwarded-Encrypted: i=1; AKwUvBz3vQzK6E0GWKrtT/E32qr7Bab6JJ8ehCYGLKae5sXjYQ7uo1FEc/sfpRg1uSBTbidCITniuV44nl4VzHs=@vger.kernel.org
X-Gm-Message-State: AFuF++k/NReptyRN+4ld2se4YLAdT/cHHz7nEUw6RSDJx7xiLJQJ++wu
	GvaNW6c2MEViUg4vN+/QmSvQWp1RomjCOKBfVnknbvutPEjB+gFhA6k/PjJGxYgAjhM2zVeM+DT
	FN5dKxfUGkDW2cx/L0X38UMu7DowXEmo=
X-Gm-Gg: AYBFou17k3I13Fm5iU3o7eHpgyY/9LhZpwQXFXKDeaSDHXUB7zTzAXWQvsKRh8EnODR
	YajlT+zVa19kyZDUZXIsvLkfDqobrQdegVWRzWricZiLK7rso282QQtyaZIjnmFm3NjUc3GJWN2
	QCgtFdWLuDy5cAN3bCGXgtPulS8JA1qoDxAjknGaDk2g8QL2jt49fVEZKB6tGChvuNSQli1GJMw
	rzkre5D9VeoYbrBY18nGTQseS7yst5GKGOFy0HtOXRpSBlkA0aOJ3Ch+kRlkT1K/Lu1hOBYvB7y
	oClKtch4HUTMGHyH5jGGYmjEU7vAX+5MjNvkulorrerMrnZSD4gEyAqbHsgNprXOtoPvwwCdGhr
	bPWiAOEA3SPBBorQApUDeL3O2MrKQA7c=
X-Received: by 2002:a05:6402:388d:b0:6a6:32fa:1e9b with SMTP id
 4fb4d7f45d1cf-6a682b00f79mr2064313a12.19.1788339017543; Wed, 02 Sep 2026
 01:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <526219643312193e0705586965703d16a6d4b60e.1788277742.git.mattst88@gmail.com>
In-Reply-To: <526219643312193e0705586965703d16a6d4b60e.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 10:50:05 +0200
X-Gm-Features: AcwNN1UfsVzHiYRlk45W9f-ig8jXrEui6eEwmgDU4LEI15AEUnxVGQlmXTsgTvw
Message-ID: <CA+=Fv5Svs9qgBZXwjbH4qFBod5DFf3UYo3FG0=ps1NTVimB11g@mail.gmail.com>
Subject: Re: [PATCH 09/24] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>

I tested this on an AlphaServer ES40 with
CONFIG_ARCH_SUPPORTS_INT128=3Dy. The kernel built and booted
successfully, and the bits KUnit suite passed, including
genmask_u128_test:

  # bits-test: pass:6 fail:0 skip:0 total:6
  ok 1 bits-test

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

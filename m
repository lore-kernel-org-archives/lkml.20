Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29483A168B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522371; cv=pass; b=G4WzC6w5WRKkoIhe0c9FbQGUyMLLskd75putUoMm6R6/7vfbp+aDJqu3Z9ysKAtMF3AGf6gzK7HA4anONgYDqjw5Nv1FN8ETJPKXFdmaQIx3kGY14px7SFUZAPvY0bStifKuiACVI/NHu2IXZl/HaSuguYlzvj8uw46H+SqEXl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522371; c=relaxed/simple;
	bh=CLEH35XDmiCTcy4TwWz+bK3Tk5dXuZwQrYMswqmAf0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+VaTJipgIRYnQ/VOg05uwgV2N2U+Mw7+vpP4t5Au/g4w3HUCYegf0glKiCXGxdXevzWf7acewU7souquKWqZEJWL2+sNI/UNFgp522vkFWYq/MMc9SQnKxw18nDwgTzwfm8xNYqMEN028JgChhuiCU++bs5YerHgjwodu3X/uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X68XKz3G; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X68XKz3G"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67694513f2fso3667314d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791522368; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2B8KYkx5NSFjU/RAdlEkDoHQjoBHwD42hdDF7SuslceIUN7F2bHqpAr2U/lOXaBaS
         hAFg3+vjdoAi5I8+pkvYs8SQ/BaGbsYZJR7JgiW2bH00BQzmI+eRc5Hr2A+oQSRU1Jzs
         IocnRJIxcEvG5HJD5Kr1P5juU4+MGqCFIvX4bu5qPrrfgZuAbH9mJty8IdvDtkq8Qm6h
         EKNAOSAf+YHgXDjJmFban7fFZ0yKV3izMvL7rSIKg4njWG/f8/hNNuN4rR8Pjt+3RmL6
         HuzbEQnCBftSZihLBI2CFBXbPsMr0SA00DpzkelbjdZdJtddcLAHiTE5LCzjd8iZlU3I
         I3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CLEH35XDmiCTcy4TwWz+bK3Tk5dXuZwQrYMswqmAf0Q=;
        fh=905fnJOafbXd0gmfOz+xv1p8qRD5ppBpnIei826V5ZY=;
        b=oJ2tjJenOpl25FaZc+htmG9eOP3sycYV5TSj3woJVpkW5KnNfoVRdmPGR1HL9nEksk
         KoLZQwAnN42xShDcnvqNadz0n/wT1ECLps4zwPABjlzdvwTsVOw2mnnWJXUCo49xbO58
         iHJPBNOQvkHtJgmvq80p13WTCAGnh7HmcEaOMX/XzWDwa6YanL0tlayRseMSwJrF4LEI
         jf38F3QeHHtUPRVFmIpf1zbzKSmMQjq5AjVumPxwiPbrn/DcBSEaL1KwoMLYhovBMT+f
         t4A0n0T4IjzvlCZaRIEt+R3qI19ZEeTtVuc9oOzOV3hQ14MtvJDCBklX0WCPk5iIaT1h
         M5wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522368; x=1792127168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLEH35XDmiCTcy4TwWz+bK3Tk5dXuZwQrYMswqmAf0Q=;
        b=X68XKz3GK/g1wVOTb+wV0jy/KUia5G9SXxhqc4OITBUK6CooVak0aOnYFqKVu65zeU
         6JbTSoBA9TQmKfVJGOGi3pdSj+U9+HhkGl0/7KUZD0Znefy9hIQkdiWSeMQ1HUSOhZkF
         cSlC/hYALPmWAH6mjQQ8KpO29CfbxWJU6uHzNN/QvlzVTbA9IPJUQoRFk8SulgyDa+Er
         1tc0iy3Wh01uG5aIACIqQKwNjeqr6D9o4jmKPbQfsFk+wef5DJsnXl2JWK+e2zaTqFHl
         SqEfNjXPsdC2KGS2vMQj2ajTnvnpiECiRwQ6Y7kn42MBU2aN1avmhrzTuxl/cPAIgrt/
         ixYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522368; x=1792127168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLEH35XDmiCTcy4TwWz+bK3Tk5dXuZwQrYMswqmAf0Q=;
        b=hf1eM+vB5KnnabZ2J8I97YA53Z5EpFUjvwqTdgen2oEl40kH4F061iNggWadTy8zTL
         0X4PkkFeFB5j7tkXbGXSYpXg9f5vuHAzionIVm6lP1RhfbQYPj9Og9xB3trp6TxPK9L8
         DxX+uZKFjGmhRN6rXdtFOgfXV/UnU0x36bXZb0Z7igQ/AuWcdVt8f+X4lkvKivcBIi7A
         EzR+5qh9lxKKgMMOcSYC/xmq8okhpXJ6TxbSukjGen6lPAda8PO4o/Va/ULlQmyqJxUs
         ZniXwuUpouveQy+jh1OjJwWeREHSTocUpAO5AUAtUYN4sT/SiwyJE3NmQAs/N3QLHAvd
         fBdg==
X-Forwarded-Encrypted: i=1; AKwUvByOi2aMB9Lb+ngyGHFU5KdTPcyOKllTyi6tJdXSm5uqedGdo+on2Qjfb3462oPE2ufPUvEOU6nfCd5YLkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpmzaEpEBcmsnbDj+S1fF0yFlrCPf3fLeep+G3XD8yYevxK5AI
	HxhhKYKiMvZtZgNVTrOUTBx/f3m2LOb52CN988ZADxEwQP2UmCAx31u1RXs+5G2B9+ziLlgWr8n
	e3SYuRFHwVfKyC+XUuiEedRf+dbU58BI=
X-Gm-Gg: AYBFou1gVUnIBKZGHDfyO6n8qzKCLBE7RHb5rxKsW0RVqtZQNRTguVyjnAysI+P7c9z
	byLmlvM6M/bKC70QQJa6tMQCwmQjmEEygMEoo+A7jJ7ataS1wXrlbE0EEzi0sDI+kwMnwufu47Y
	lSnAjJgfqX2g0oZdAs1lgu/yf64rSPrPeeVGBNu/0xsCgy22E4G6P+r+mg58RdZtJdo7SRFGOPF
	xJLwc/xCXOhXJ74+lBmd9ev9KtRJmq2mzSlgq5v2aB6PTIJfqVJnzAQsBPRAoAm7EqpQ9QAcipT
	/2z0d3QGMKmPJa01g7sr+eaL9xi28AFySxuEo12zhtqOgdOdvy20dpmDNA==
X-Received: by 2002:a05:690e:4403:b0:66e:5d40:6dab with SMTP id
 956f58d0204a3-679362825damr160377d50.23.1791522368308; Thu, 08 Oct 2026
 22:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0002-v2-dd6c20a1d92928b33ab7@gmail.com>
 <asfZfZcusHMRiUYY@kernel.org>
In-Reply-To: <asfZfZcusHMRiUYY@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 9 Oct 2026 13:05:55 +0800
X-Gm-Features: AclHuK92MCPHMkbThkXyJZrzV_KAbzt10KrIGn0E5G2gyILDquLox3Gbjywre7Y
Message-ID: <CAFRLqsVwB3s4OQRkBzZb3O7ZmvPuiOYti8xjK72pL4HqnvGKHQ@mail.gmail.com>
Subject: Re: [PATCH] keys: Avoid the owner account dereference in named
 keyring lookup
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, sergeh@kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=E6=
=97=A5=E5=91=A8=E4=BA=94 01:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Similar nit. Not sure but I think even just having these two lines would
> be sufficient or is there something that follows that would be
> meaningful?
>

Thanks for the review. I've shortened the Oops report for v2.

Best regards,
Cen Zhang

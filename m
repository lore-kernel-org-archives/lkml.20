Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580016;
	b=LJ9y4nZ8GZyQEKKeXwwGBauMG0hskZGOSoT4S55zJsqJYVXizKtquiHbGM5y9W45GjsH
	 CjO4sGP14olXy5SR9D5VMwDcVk4HmbUzhsg9RPjhd+7Hv04AjdHWJb4tKyP7eSEup8f2o
	 wd4vuD4qOqwXYiKIIWlE1idwYSnPHXBLmssxySqV7Ft/9TvR3Ue0Z+I0HE1vZekK/h+HM
	 KFCB63k0oOeaw0hGVtNkhKwnJDvpMeG5PNmeywl0qrSJt15o8CWyLCEtiijzeaNYbkze5
	 teva0q8w0Y0eo/iN2TY/CjSfe6iwVIn4+kWWR5z1Kt4keCODW8Fcp/MIXSM3JlQnv4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:
	 Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=mf6PgUbcrfYb3agT01bCPua+VWRskVIrEpPluqSJlt4=;
	b=HPbCYCEdXRF/yBc1Znc4MgzG/70DVGM76S4FxvqFDcPR4e5LEauThFCvadLk3STsSvQh
	 YEBKtlKnBRd1/fUUTGq8TAbSSFRo49mum2+/BgVX4gSZyWzpOdXWPYgi0RXF1sAbRwCxd
	 oldA0X0905RC76msHBG48QlOxEKlRaFb3Q1bMEP8wIWalpqnJAQn3W0B4Nl/tJjjNfw6R
	 m2Fd6+hNTJu54Lyf2RJYyUmUAK/9j9vgKPuhd+o9Pqv/ItDnqSmt8F8ccx2caJeq5G0Ms
	 VF2MyDSugI5h7av9swpx06DCNiRxiZdVKN19hpCtNAfyquSoOT1P6Vjto+2lwy92cew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=accountshq.co;
	spf=pass smtp.mailfrom=accountshq.co;
	dkim=pass header.d=accountshq.co header.i=@accountshq.co header.a=rsa-sha256 header.s=google header.b=BDnpW0Dx;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90011606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90011606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=accountshq.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accountshq.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=accountshq.co header.i=@accountshq.co header.a=rsa-sha256 header.s=google header.b=BDnpW0Dx
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so366878a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=accountshq.co; s=google; t=1792580014; x=1793184814; darn=vger.kernel.org;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mf6PgUbcrfYb3agT01bCPua+VWRskVIrEpPluqSJlt4=;
        b=BDnpW0DxTSpU97znzv+O1lj9rdDN1yXAEyDrScsMTUj1BYwRbz8xeUhsxVn3QiXl+C
         g6KSwcyP36hpH7hJaEhuXXwf6cn1OxcaapnjXpwIgvbx+ZHS5H6jUWjhWzFcmfYxfH2z
         +DocyT0Nx9LIoH25/kCB5ZXm96I4AVQCgOSBwk24UvZu19BynrFj4Az3zuC2PIWFiQKV
         OwKFEW0CZr3ZG4U6spKf4rfgQk2XbwKmm+re196I4ilqms7a5hgZF9LBuWz92Rn9Fa7y
         rjJymo3+m6J+6Auxu8KLesmaxxjItLkAda4J3dEsyjpejNPV+mL0uryxl7DipZoPL+qq
         WWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580014; x=1793184814;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mf6PgUbcrfYb3agT01bCPua+VWRskVIrEpPluqSJlt4=;
        b=YfUbm+OiMPCWagq61MV32nSjzCmXQfn46WuTfGN+QRpb9Xm3xsTfmjf/2H1B4aWmpr
         o/CvVBGcLOKWBJnX3SWq3P69UzSGSL3KmhN4wfjqMRNHsTv2l3Fe9paYy8yoMo1w7t1B
         IK0uFr5Y93WHvxfNoGd+1VqUzWnDBS1Y26y0Wy8Fno2TdUugtEPAZLvTiCpGyX8toJ9M
         2HUFps25Snx1Dcdk8RCyvmqbZ+Yk7ZUB+6knY4TIrYmn/JRAIoSnd75mxyBy6I5wYF+K
         Hxdb4OgrddZIW7KTDVCBBpM2yoNOOspuoSM7My7WIH1MleDGGviKeBvA3ieSXyS28yPN
         P9IA==
X-Gm-Message-State: AFq9FYKDA0Ssuyc4YaTT+7fEzke6h8HXTABwChjk1zd5qPCCxiUTYHke
	bceQ2woUINhH06XvLPCKpfWCF3PemIfOCo4aEm56lyV3ybxi6HB/cYa4NvvMz3BzpbpmT3DvNEX
	5BJDesg==
X-Gm-Gg: AYBFou2yNc56tnpecOZynGsYWhomJ0ZKuAzB+9aK9BL8Lq/f3Czrv23l6hJt1WqXnKk
	pG61KWmsW5GsD6qbFKXfk7wqeNjot2qadG83eC+FexCEW9YRefwKmYTTKrUg88oBShP4C+Y06k2
	7ZNY/qU+ITQt7EGKjGNj3B/ZWsy+TYXHUcNcIQcjslyNFJ6RCqZxykVH3drXfcaEcf5rhuRmSJC
	pMjDgrq5Kw464bhdyTHP9RxUsRnXYXlIW7IYiGgKztxL1NGxqXinDCbaSEeDlPPrchQkZCnCVgV
	g/LXnnw5dzGuyfhXER2iGkVnEgdgarrsss3EgQZ0YPYk2Qoxk88pfyf8n9+T8A2f2J6Nx8P8jhQ
	BjmZzbGhgcbm7dqBPU/SGjFKllIncOKuZENQnwjyps85tMXhqebNrpHkCUIGA0QM4MbhDaHiSfP
	tKIEpqPDkpg4Bl2bm6eHICTADc/EH+E6yKRrtgbisdvbUJXfkJT1j1i8JbbhY+5oC7OFbqOv/Rd
	Za+Xs6mBJfG47/2ZRwfJidbkzflZZccQPRQIrp1B74e9RsFIVJiOx6qyDT3iniLp+QQtolZx90Y
	JFWVSx40FP10azxEGIhs6OOR4u026VZ1TQJqSPP9xW1h5byMuA==
X-Received: by 2002:a17:90b:4b8b:b0:3ac:80dc:f41d with SMTP id 98e67ed59e1d1-3ad86c90784mr1437104a91.32.1792580014456;
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
Received: from accountshq.co (ec2-56-155-85-221.ap-northeast-3.compute.amazonaws.com. [56.155.85.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82e08c7esm2038700a91.0.2026.10.21.03.53.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
From: Noah Simmons <noah@accountshq.co>
To: linux-kernel@vger.kernel.org
Subject: Content Collaboration with somoslibres.org
Message-ID: <4f11a7f0-5e8b-413a-b3fb-c90e9de64361@accountshq.co>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:53:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

Hello somoslibres.org Team,


I hope everything is going well.


I=E2=80=99m reaching out on behalf of PressWhizz=C2=AE, a digital marketing=
 and SEO agency based in the US. We work with many brands that are =
interested in publishing sponsored articles on reputable websites.


Could you let us know if sponsored posts are available on somoslibres.org, =
and what your current pricing is?


It would also be helpful if you could =
share any editorial guidelines for submissions. Additionally, please let us=
 know if you allow content from niches such as casino, CBD, or similar =
industries and the pricing for those categories.


Looking forward to your =
reply.


Best regards,


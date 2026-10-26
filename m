Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019810;
	b=ZX0qnOQaDUHEjlblkaXd5iXiJaFp0aOjJfHK0aKyJwkBDe7G7zc0RZU1O7AvVpfHDfHw
	 i3aHT4A2N+Fke8RMd10TzigggewDtZ/xWetRot0KvwY7QDDewF3W/k+xXF5vp5KTrL3Zo
	 /L103oUlFrDx0wVkXs/Gi+6QPKTu0mr38h+f0lXh6qkWg+MtGoi8ykqt5CBo+Ut+k94bL
	 2qW2g7n0OJelhPlZ6ZCC51cVoDRcWlagQlgEUcLlkqXdvLNnyiVSp0EzEY96XBLuFGg9L
	 1FgqFL+xYV5d6e1wvmVmktvEt7CM43ICyiV3oc+JI/2KaNsLZmBEcqA1UbCARL4ubpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
	b=ocPLdEFFIP1LXbni3IGgBVG2BjjHCQSFGxJ02dOFpb6k7QmJ74BzOX5lJ2/BzJppEJIH
	 74lfiM40mDl5D0EeUFThmKIeg8CNfJ2Dd5D8QCv+CY2OA3wq346ToJzIZqVA+dtyPZRZw
	 SriJ+bgKOxK7Mgz6X6jW4+Cnl84WDhdSWvPBB1u97XLYQ23R3719YwJ3+kp6GtozU3H0F
	 EQM6PjLylXSEr/oHYVDrcpkiJNe39HK4oo2f/tmXW8hu7kAAbx1lj1bBcv6znc+gQ0n2N
	 h4rur7pOyr4Bac4l/aGBHJhDt+Hm71L8sqwhEdkLB5E9jA0EEiBqHvn5wv05fe1aDYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdvYwJhB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E424606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E424606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdvYwJhB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bb5afa736so462674eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019809; x=1793624609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
        b=LdvYwJhBKetf3SJOJnvMSPPjGCYJB6FhZBIY5xnvb2pc9v22Zxeq9j/ATkFMl6btqo
         fZpPdyn6kh+IEdxjgouSMfbHIQDJu7uQC/iooGs8rL5R42UOPSr6p+bdmf1jI24t6HAv
         MB4Jbk1Ph7sb+kzaaq+OVV/udsQcSA8iixCOyZAvgH1N6DHizvQFOnu9pcqgsR2y1uga
         UmuvQ2Do7/MRU411bJulNcFjXMv5SfL/gcxbt3o0xVdipIkmCppikXFf5CXiqcSIJBLI
         hY1xmsw2+COAFyc2UPrEaZyj5qMusvWiziCyfJZ5tn4AZv92oCMafAKRkSCJDcOk1WjU
         Jn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019809; x=1793624609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
        b=cSbeOJN9JE6Wylw74r7s4wsykNKwKlnAr5HvI7U6qpjAoM5oWJGoEo11c2TLl/QaHt
         XNGCbpnNZVJt2+1XZoLjYCHbMm4AMzaULqHprUBwW/isw2Oh5kvnkDP3D/AH5eNoflcK
         /35/H+y1vhhF9niKCCK5KlaqaQvW8nR7jNk6y2Q7hHWAbyzvsndPca0D1aYe0WUgDfaw
         5zslN4idtxAxnzf6EUVXqIQrlWAMcavSyLV5B2wd3+VgcEz7fmuG0MoKf/C+fE7B6phb
         Bj/neFZAw3qwScuazgcs/7PMWrWo1wCnyWnOit0VeFzWTSjD3BUAf+OtvGz0dfId4FKE
         uqXg==
X-Forwarded-Encrypted: i=1; AKwUvBzyNwwi8u0mH1d8wfycjZvxA6PaPr0+/vHMxnyXNla9r3dax0SFY+P3dBbf4Ci4HETMeKIuZgPxIjsXVDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVbixa8PdwF+4pGzWTrC1Tm7l2ezNZzi12OgqAD9SZcg0XECuw
	u+OiaKAQerEL9E9l5mlxz4IZtROleG/9FGAaZyqpcvCbkcUL2O0URSWB
X-Gm-Gg: AYBFou2k0T9lrNnBUieMBaFRvInchO1AW2CQHoCvfy0Zbk4dGEFurTL+fIPs5M6Pwhe
	YjpiJe2tkVe6IgAkROP+c84/xZQxp9UZjoWK8BC6jOa90nED+UBnq35BwrSi4s02FuO5BjCSWsI
	Ogrq1VzEXadyMkRneym6zbLZKulzzbHn0DJdTylpxfPX2Vpcbqv3uzCWMGOC3rAZhYfG32vIkyX
	P3XWqEpUiwBXqTZSNYlRvzXW+tK6Q+M/hJS4F99yH4kHhuHd3W1HK+ITfAyiw2iHLYu9B0gTmxq
	DPdX8G/C5pH4oIIBidqHbugVeMqsaMYrnFhHw+F1ruZl2PsV1TNGdZL9fcPQYGf2AOzCajWLs08
	5QidlZ0dyzo3N5gAwry/cy1u/zSa/RidAkHZ+aEqiKBv2dJ/s1FF5Y+nu+/Wtzk0AOvsV+E1xXv
	HA1X0YKP7hGYQr9t8XYhEbdVp9SSd5wnwaBErDvpsD/K4KYhU5w+YBZjmoMrHb+uN2k0+SgJeDo
	iNfM5SRn/eCaY5y3IA1WdKgDlRL8j7dZTRCH+evbMWmppoyT0/jpsi8vpxbstZ1XHjRl4h1vecg
	hXt3lgBN+aqAsUG9seVkRIiKyS9kXOtIGZyFLsu5/uRldkeLjSx1mVXP7WVMJoVBycAHFH3IFUA
	7r+frH3YEGaN7F/21Zdze/CKzJUeum6731vlFO8MDwB5v0g==
X-Received: by 2002:a05:693c:8646:20b0:368:5521:612f with SMTP id 5a478bee46e88-369e81cebffmr19279166eec.0.1793019808835;
        Mon, 26 Oct 2026 06:03:28 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm47634012eec.23.2026.10.26.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:03:27 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: i2c: ov7251: Add control event support
Date: Mon, 26 Oct 2026 22:03:23 +0900
Message-ID: <20261026130323.169560-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <at863XdUDea7JDA8@kekkonen.localdomain>
References: <20261026111032.88355-4-antoine.pichot@gmail.com> <at863XdUDea7JDA8@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 26, 2026 at 01:34:53PM +0200, Sakari Ailus wrote:
> Instead of adding explicit support for events, could you instead make the
> driver to use sub-device state? See commit
> e8a5b1df000e1a23c04dadbe99621441e0889f88 for an example.

Sure. In v2, patch 3 converts the driver to the sub-device active state,
following ov5645 and the imx219 commit you pointed to. I'll wait a few
days for other comments before sending v2.

Thanks,
Antoine

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608686;
	b=aCWChljK/AsnhkHUTNS5IKtDuKWN3aXqHdaY1I/KT5Xx+YcoEnc7ek+tL/m5A7hgYJ8F
	 xxU/Zb/MUXhB2W9F1ITAL1y/T9mgoT3Z6RVCSnDU2vNs109e8zLsHoEW4OzviKQVHAzii
	 SDn6YIAXZREsH15Lj9GaeE9N8zPNyJSNraKfB+iNxjfqw1oEv+deOihDwO5RZwyL2PfRV
	 Xv/ZsfzWS9ras6po8ba6Hkx3214C/EEdEbl+bd5L6mTcCQuB7MmqJdY8vzx//yberrdJI
	 NCge0TUD4GZxGTiQaZBh33O9qkjKKkQ/cwIlgj8++TSdEswfD8TKDHQqymB57dgAmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
	b=DbpzITiIfEp2kQItz/iD8UY09I+GurT4YZYIiixusHHCs4glTdOZE9Vkh2bK76otJ58T
	 v9BpqfljBTBveRV6mYd/r0XzlVwKxbjCQuttcP1Pna70mMT3IiHQz/lRhGENFRcAl995G
	 AnISJJHMty91u+e035A58JuODxqr1dAv76hX4l6OyLMIdzS10/4TCkMoGZ9dORxGo9B/I
	 Lfo2z447feZ2J+fuGB7Ofs0x6xsT9TkYsHdg7ym/phSd+BkqRVoPjctxHcU5qivJ2Va6W
	 fGFr6+ntzsjRWD7nuFZkUTlN4+nAW2YaCU56GGg2omZKcjtivz0Oy+SzONH17YC9C4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5570F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso925990a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608686; x=1794213486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=ZrsJKdvDf3wSjGkdXQOysAvdloIM9KYRnDXm+0wOiWS0uikOgM1KqCpoJEYqwbxZk+
         xkqunbMOpYJB64pTmQJymcXkuHxOg6jSGWrE6dIrZSmUDVT3rYmaUIMiZy7/i9QqAWRy
         hEL2Z5u/HKyG2GRuzE/AQD1mOn+XtY0599THDMTh8a/nrWwpHVVQimI7IMrlxxUGHv65
         hry+t4HYRYGPjHBZDeue/d+i1FnjE+i9e2LNGjSrrAdPDbAVeazDGEYSe5zX2FR8AxFv
         M13C4q77GkhZiXGkcyv8FoMDHMjW6TsrqGp3zWEDJOGqzl3mdGc5Xc0GCaIAoQXXsOVJ
         hbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608686; x=1794213486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=UrQKmu0nNLoxzE21tzJbRHXisqGUAREk9mA/3MW31QROX0hcbtUNj8zWnrFBiyf61J
         42ULB7yeL3Fk6P0KBqCD31vdrunCFtu4fquRgIdpjU2QZq/mWnIlGeO6Bvsjv+LiHxgV
         ivSMkQvK7OH79HVzEiH43xAm0ZfaPNbI0R2L3D4DQAKwA8ofmTQl5iyT4owjPU3DAwk7
         psOMyPQxsfktaLrhr2pTpiXVAWqhV+wIL/9g/FOxuOfEzfxCXt0kRvncy768ceFyKrDK
         OJCac/PfhWEQChJBhDYK5poMDrJvnOEf2bbTIknphaMJzD8Mnhx/Q5LgR1416ZCZC7qC
         2tWg==
X-Forwarded-Encrypted: i=1; AKwUvBxPDbDwzgPhoSDKn5u+HJvcNO9Qf2UXjY6mZBJIoOlZonFEOOVnEhbgvZZvytOWS0JHmfiKrpcpHyKnuxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sGLlp7hZzy9pdakB4vbi2VyVgxqFvKFvjIWZSKrqxl00rlFzm
	LCXZPk2oMm2g+VwvNVSYPxMU3PZavbGyJqGGieTNk1dtvxXROc4byxzm
X-Gm-Gg: AYBFou0rGALsHkPRnnMuT9Ra/NQ+egYt+lB8X9gpnlpBbeJv+Fo51B6ycaEbb5G5foF
	DE0LvO2jCT32eW/RyuA9smlvtSpoolVYlNNPa/inSa3PuxtrSJOfcIwr0dwdbC1D/EV5DM7SFKc
	Hk3hGKcF1Xhc7Fv23sbD3JT74orsmflSTSuDkSz4mn6NEHbf25Qwz/4SZq6DXRdBsRSVKImJ0dA
	gPTyXFlZ0QlNrE2ZEqrpKByZfovxbzXYJ5oloQ4CEqhWUIaBaQEOCJjshXrAGiXup5IHzsJB7le
	BtMR8oag9aHvem9clwV1MO81qIl4kC9SA50R7aP5WAtz91tTNdkLpPN1kTVULXR11pmu/4tlqEL
	rfyolZj8dfPOaR35X/zLvkUzkGV0ZfAyExm4LBbzBgzvmzuqsGYlkZm/Rr0kd5iesfu5TLkY/fS
	Z/fFKtU5R7dUKrfkeJ3kdyx5K5pM4L6crUkExrO35uBifY7lWHEMRl1P9EDZTEeL0/DE5L13IpZ
	VFmcO4FI6qI2Y/DCqoOnTZpd1TZ/U/mK+VpMHeDEN8dKB5W8LzYU7nqGqMnKhDpisLErgO+C8bq
	q9h3f4AHZUTmdRy4fikYlBO2a6a8+guBJPVR2O0CfnhkdOZWWP1kySk57N32zLHTmCtMjThL94C
	kcSMY7OBqSg1uA1utlphPml0/+VvFaDngAnCq8s+RndL2wElAIX/o8VnpLQRBRUG9UgKZYXiHcY
	fEpgtePe+0Ah7rlg==
X-Received: by 2002:a17:90b:5648:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae89879b52mr8145082a91.65.1793608685557;
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm7861463a91.1.2026.11.02.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Mon,  2 Nov 2026 16:37:59 +0800
Message-ID: <20261102083759.1561867-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com> <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
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

On Sat, 31 Oct 2026 21:03:17 +0000, Wei-Lin Chang wrote:
>> +Minor problems are often fixed up by the maintainers when applying; if they
>> +say "no need to resend", don't.
>
> The second half of this is a little silly :P
> What about just:
>
> Minor problems are often fixed up by the maintainers when applying; ask
> if you are unsure whether to resend.

Agreed, that reads better.  I'll use your wording in v3.

Thanks,
Matthias

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457420;
	b=kws3ozPVN3kit3rIrIHguxtmFuZ3nw5ZkA2zIZM8CohC9uFKO0Ti9qTGVupf8kKmB5SM
	 wpJu60pNq9URUtReCHIDhLsjUDdiPNldi+/EePTrhcN0g9o2BuB+3DNc3PQm7mwBH2pvP
	 ddqITY97+lnIRo+usbX4d4zmxeOUB0ybbPl851kPny4SesKWeZ9VJVymiZeah7i6CQ0Xh
	 Ydkwbh/R/8Y7H8Qga2bBFk9I3xNZFWC6C4+qWEyNzJsqTod2zqdZEZTnDaXBe0YDX+Em5
	 qU4e8CZL4mWb6y/15qB29JecFB9n5bZIJd5j0pRudX52J0JQvHN5IvoW5aM3D2xtPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qhg1mk+TKSbXJlLmrTbnehLYHTBBzICBJ2ydFEY5x14=;
	b=AD7zQZrV58TRI4IsZEeGEJAo6R/gcbr8PHFlKZFIt8EsVBSf+P0ekArCWKoZp9KTKI19
	 usrqtf/ULcWQc63fnA+TjtWsOaCAJEO8sygfw/0JW/DstvXNYWIWJm1bbiW6hCXDoAAYz
	 jxKYHL6trChJRN7NPVEbtsBEiyBxLvJdUbPTTqCk/JwkfR9UmQz4uONF9h7vTqD9m2KMU
	 T2nIVlidLT+iSnAXKVJS3TCyadDqBfP4J5DGcZHEbw/LvmQspQT3CBdndadynknJmFjr1
	 8X5ReKovgzdMM8jafA/27vxxfFGh45s015iEFW68drYDnNhX8QDg0fCRKwqZAQUnzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sLheooKG;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61552606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61552606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sLheooKG
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a07025cce4so794717b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792457418; x=1793062218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qhg1mk+TKSbXJlLmrTbnehLYHTBBzICBJ2ydFEY5x14=;
        b=sLheooKG60Uxk70ynZ1E3+9Ax4Y1JGIovLgMJXyVqR8cg13gCmSIz4jcGIzWkijl3P
         j6Qg6vvukNuNIWgO36m/2t5e82752tISCTa5j75jCrjpgFHLSlf7TlMnXF+OmuOy6srH
         picoa4yddE0PR/w6TABY4Vao9ec7vKORMNHJSu5V0NhhUf9FTGEFvxGC0FIsvEHCV3m2
         /vpn/+ZeDhkDrxM4ueO9MB8dM0WZUefqqzmLCts8vLX98l1+bglop/erlOBEoLrhPSEd
         hv2pMV1nZzcUFmKRSQDClj7bCKwhPHKyWMRnZBeCegGDybK6D/x0zPI59i5nO8DUgeNU
         nXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457418; x=1793062218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qhg1mk+TKSbXJlLmrTbnehLYHTBBzICBJ2ydFEY5x14=;
        b=KYSAv5y5xexdf0i1hPtQtz36aZCmN0aUvDesHsawk6a+DZjiY49JTwrhuT8LvtQBll
         Y4lcQxWLpcUuX0YCq4oMa9h4+QOQU1A49yxPMrFmC3PK5Skuj+aJOIEhiUFZ96jcwOer
         soJCFSv44/HJcURMr2/4SEVMQ9Epff52yH81wxWi8o+hpOcCSYupEELv6Ce6o+bqdYGn
         PzTCob8xEHEHIEj9wVwc4nIBje09o1lEovqilx5yANVZGt5gC6r5dUWBCou3c30oLxQ+
         TSlwufcdwjY24De+Sq9KyRSOd5FfhBPgbW88pXN6Qv+wLKAfuk4zdSLUglhXH3wu7e/e
         7MWQ==
X-Forwarded-Encrypted: i=1; AKwUvByJBsT1Zy5gVk7jvXq91RCpNsEomrglyPvWir35CreInMPHgE/z2bGJO3q/H066xAV8OEGHjB65vfgBzhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsnOauceiiC8IduFTs9seqpozATh5bT7YeiMvPGWWldTKth1E8
	2yTzJIAzD08e/homzEW4M0Nl5QbZVojnGyR05Yd2GqQ4ra8Dyrmbrz4xXZPbN8KKYGU=
X-Gm-Gg: AYBFou27Pnyd5DRmLwqUot/KsKC31hvGAPcNUS0VulmKKcC40b3HJra8Tx7kxEsrdBu
	Pg+CVZCn1029Q+vR0H8XQVBvsgyK0NleVaIkeVknC2pF91FTV193x391KE9f/vjs5Q/SS+51c1w
	0aKQFqILyrFkTTeXEvlfeZlfb4aIP0ewzcQaExCWbJp3gSRCLnKJdv4Ix6xLUkVKyeKZXuBiNvM
	9gbLxjHwoDNLyYZOE8Ab2Gdl5gMdofVPVm6TI8nrCqZ45OhH7CrufKOD6g68uDpCPO8pw8pcFKU
	dLbjiKggyX5dZ1ZzSjjtEWuf+mAcrPHCOqit8J+hB/H4AZBtm3PRM7ft4ZNM3QdZu7jbQztbm/O
	TH58+CONpZ53MdASRCUoGtp7UBGpMEhtTP8XsVDJBq2nf9JuznIuYcnLZdW96GKuvGWrArtG4IT
	5aKVOF1iBHrQn7RuQ3yHgXTMq3C9adk8C4ABhlGQ7NPJWostoMHldzQPswjd5eAkAESWgrlIpOX
	RuCFA==
X-Received: by 2002:a05:6a21:8286:b0:3e2:6f90:b54c with SMTP id adf61e73a8af0-3e26f90b707mr879180637.47.1792457418390;
        Mon, 19 Oct 2026 17:50:18 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm4224287a12.4.2026.10.19.17.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:50:18 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 0/3] wifi: nxpwifi: fix the 11AX_CFG response handler
Date: Tue, 20 Oct 2026 09:50:02 +0900
Message-ID: <20261020005003.1105086-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019092653.3609605-1-jeff.chen_1@oss.nxp.com>
References: <20261016042542.773945-1-yhlee@isslab.korea.ac.kr> <20261019092653.3609605-1-jeff.chen_1@oss.nxp.com>
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

Hi Jeff,

Thank you for taking the time to review the whole series, and I'm sorry
for sending v1, v2 and v3 in such quick succession. I understand that
made it hard to tell which version to look at, and I'll be more careful
with the cadence from here on.

I've folded all of your comments into a single v4. The commit messages
are cut down to the issue and the fix, and the bounds patch now selects
the destination buffer by band before validating and copying that one.
I'll send it as the single revision to review, and I won't post further
versions on top of it.

Thanks again for your patience.

Regards,
Yehyeong

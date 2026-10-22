Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653275;
	b=PIFAbwdBcRmoZ5qglvj57Me/2am8UdQgeOI5SFyq8vQ+buNWmiXQ37fsQTlWDklfYyJz
	 LJ+1JmJRrkD1avE8ELayCiiY8IIl2z7Jg5DntoZyPKg9Lc8rsh17xZcHyH6oxKbDbKCb4
	 fCtO68eg5gL0pVO28FshfgtVyLA4gtDX2awz7x/MtIdfysq1UgvZmtmarlA4wcUnbiZ0f
	 s4OiMbphMBNqS+LklCkX0IR1tp6EN+cCBQOZIJfYZwmIyJp/7S2j4nyKHH4gpkqSmd5Y/
	 4yDY3PhfhvTj2cySpXHsnc8eHdyH1KUKw8dD/lYOfmbiZW5dBomJxCd38/Wmyy44plg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
	b=OF0XSIsUFJxMxbrybE44r+v2NyZsAf+ylPrBojvTxLGG/ZmsRIuYDrQb03OFdNHLfLBj
	 XvxR+DicuUBMD5Y20kpKWkrsJJfIxG9s5Mrq7a5RfsB70okMmzG/bsoGs65CC73Lh3XVR
	 bC3hykGnhdK6IFznbAbDdPaOU0ThgRid99bHRA4g+KNxNHHuQKTuLXp528VF2+ri6CFtB
	 Ga3wBDCq+ilmyDBxiD1Y5q2rFZf61eX8OmOO0olRg7AE2zkTDi5bD71frO/puM92aCXeU
	 +yltbNvxKjvPfwjXaWjbfvi4b2xA+DoY043YOFa6mMguw3+1jkst6W8VBoDwSIFeVBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C1F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-181516de561so247326c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653274; x=1793258074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=lDNVZ+xI4TWk8YtbkTL11n92mW4AB3EEJcGsNKwMrnPi6zNYDDFQGLFaZGqqo+h4Tc
         Durk78e1tFd31HvcAc9zIzRX9DHyAx/IADWbmbXIU8w+lDgNRVHEyKyR+jqxIk3U+uot
         SKw2yQy22Ju4zXIBb0WPRCG9bTtsGCNtkOqU1A0hlE1geL4i+uM58BMz82zrPbZNMeFk
         3xrsCOqmdOL5COho/iEgTPgolIROIIVEPDTwAgnDXjvHficbn/Z4YBODnJ1At2d0bxQ9
         ARaKtFIKivQPgvJ3RL0W894tmTxyooiqbjwg7tcrUiLOlKbLnNqijx+Y1tvG+cFWf0uV
         zapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653274; x=1793258074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=xOctyTf8zMh+9GGdiGxOGxl00VC26sm2w2iM8EclMAvInacDmvjtsytp66VqVvbhrm
         xp73Specui0C3+WUznxWOgX/DwqmzOX6WvlxkL5rODAxQPyj4l8U5a9RRpsi1rY+VJt7
         T6aU/ou36j7zgERSK7zmU7pKVyfJvcOTBq+Go9dd9aj5IPzzD2u+Ycac2bQxW/QiPycm
         SMxpgdwVfCcvwEwN8LBI84yZC2UnS7f13+Qzoha3P/sBCfDGRBuJU7UqqgPJpotOwDHt
         p3Mbo2B4lyqihxNgyI/z1tGYHUvWKdLSS1gpqj9tF5UWu9c8cZqrwcy0zAUR32/C1JwV
         qOnA==
X-Forwarded-Encrypted: i=1; AKwUvBzvytpytP4/NeZVzRHeHUGE3FTwh9I5UKYxbSwmpiZeBV5OU7Od8+T6ZL4oqj2N1bDfOi9AZaprVKNATME=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6oQM+1BR44IqKh/IZ0sRGPJ3hS3bUMjNvYnWJ1oOzPqAOXzPU
	o2odONwFhBuQSHLzBNyez7q/htas9oL6wDpIalJWuyZ/0OjOycAdYV5U
X-Gm-Gg: AYBFou3On3F+QNY9P0bk/6xzILUCiLEp+hJ22vnn2FbpDiyRh82OMXTq0fs9i22arwm
	6PLlhNQIGfUtVymyGVVOVFcyuAeoUcwSXlpWYovhJxGPeU0xuEkME4Z3s0vWiuWz288DSAh06p/
	W6Ld8BtGfjK+q5YwJI1sun8E0d1gU68RQgGUNxRnkh6QIuYeB/LRrANawlbkUJ6sd7hbZx6vji9
	vImL+VPC1Sx98Vkh3n36o1ic38TTTjAu/44l8oSXM6pzfpJbGmaX2qNDt8QN9qu+WVCrKJpr3Hy
	34i95KmSLsMlvC7JN0HG/NeCgyY/ahqro04SE+dAE4HA9AktX1WZyHozul3dnibiFrRZhMyAoNl
	YQf5xyOLxSz+q6ksww1mk3jvqkwVkqtPnZj7ruV+EvLB5+ErTekoWeuUrFO0LCJKqNexEz2lKGr
	DrLNdCeiWKUQsJrf1rWiBhWJT9gTpsrmHlS6hbZkKR4N3uiAvGtt7+LaGSSysUnnYlW1Xk1kkS2
	Ap1Rh47BCy4pFJ//FiKMVc1uAgQMecwRk3ws++zV5qECFH4Nd36lw==
X-Received: by 2002:a05:7022:458b:b0:14e:d0ba:75af with SMTP id a92af1059eb24-192eebbb953mr2935796c88.6.1792653273782;
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: qcom-cci, media: ov02c10: Fix camera power cycling
Date: Thu, 22 Oct 2026 12:44:16 +0530
Message-ID: <20261022071418.26895-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The OV02C10 camera on the Lenovo Yoga Slim 7x can fail to restart after
streaming stops. The CCI runtime PM callbacks gate the controller clocks
but leave the bus pins in their default state while suspended. The X1E80100
device tree already defines a CCI sleep state with pull-downs for the bus
pins, so select that state before suspending the controller and restore the
default state on resume.

The OV02C10 driver also enables the sensor supplies before MCLK and disables
MCLK before the supplies, with the required reset and startup timing. This
series fixes the power transitions without adding a regulator-off delay or
runtime autosuspend workaround.

Tested on Lenovo Yoga Slim 7x (Snapdragon X Elite): 20 consecutive Kamoso
camera open/close cycles. The sensor entered runtime-active on each open and
returned to runtime-suspended on each close. Both modified driver objects
build cleanly against the running kernel configuration.

Saikiran (2):
  i2c: qcom-cci: Select pinctrl states during runtime PM
  media: ov02c10: Fix sensor power sequencing

 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 drivers/media/i2c/ov02c10.c       | 20 +++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.56.0


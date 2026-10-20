Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510889;
	b=T4UC76cUqEkjb4Od5TWdDOF06n7CY1WOaXWdNJiNfXNC8wMve5863TwbCwSioxwU/Fr9
	 wYGqdxRcvIZvu7xSWYr1H4Rwmgb/hq4V/zp9lDEaNCqM2mk6mPed2D77ZI58Y44NCeRR3
	 JwamREhuA67Yr3yCn3grRp0HYmJag+OSDP9LajCsitxuvuFeXDAaEzB9xGSVri00p4wHg
	 D5RamVUHraFtcAorhQLlH4Bb9I6tVP/I6OFeKm73z72eghpnwI3EFxdgp30pyXL07hsYY
	 KJ7NxsVUZQ+l85H+1zK8cvH1VpmkrIzNGcAsXh6sXA/7WepjnSZrxuj18InnN5/GJSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AXJqprv9+6P+ENzF/k+5lacW/cBAnnDkUQI8xHH+RXA=;
	b=dV0vNFswCZd9kv3zNuImahXVtP4A7Z46wVnzZTmymiIlvZtumLgoP3Vnrb3Ue27E2gv3
	 KtC1UiOJJ9Q3v8lmFliT+sxYF4/WWnlfhIH000fa1PodvFhzbEy+bMab37ywK5Eq36zkm
	 yxfMBQajC0sKlGpCMA5yXFtgXiZlA+p5IqF4u0s/pWgZpRVcZxUR+PiJf73PZ4s+E7b6y
	 FjaR4X/fOTSZSRMn99AOnbaWhtEBm5PlKPcEz56MZFXChwOGlesJPdPW2gfhLiHapuVFy
	 wwwyolP8+KxM1szTk7fm9dmDi6gIZ7+bS/sAsRliEuzOu2E1a2xTt36gm94is72oGUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EzQeohJw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FC60A2621
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484FC60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EzQeohJw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so5812425e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510887; x=1793115687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXJqprv9+6P+ENzF/k+5lacW/cBAnnDkUQI8xHH+RXA=;
        b=EzQeohJwvcRZ7jElyhjW9LNG5O3F4Ab4Pe+RTujXeI2BZ8FGdbFtAqPk71XIrpacVJ
         CxgJl33v0hknPRfSUnb2Y/19m2/yYHQNRLQji+VWxpwEuuGiMVx+Iwadv9JJi4GhdRRs
         BLgtW9NBVDnMhfiZrOPHVnyM9j82qiqkjFusfYsAyrA7AlqLXSDALVGP5Mh52GcbnWVb
         Ov78tTFh6tsS4a1ltVix6MHOk+JZKrKy76kh2+S6jE4e8G63SbKDKl/6ax+o/D2SRDYM
         k7nKZNeUXJS84LkgFj+eixY20sANVHr4IVxqNWVoM/sJaxnZ8mi0YK5e9htB+q4eYJel
         a0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510887; x=1793115687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXJqprv9+6P+ENzF/k+5lacW/cBAnnDkUQI8xHH+RXA=;
        b=UeQtc2AmvPddlvfrv3KDizS9/DlxGy8MkU9YXc9YXfOjrOVhh134kMeh50o0RzSiVV
         E4mMCi8XqFb+hBwsiRARMp8fMNumNUPqaoD0PolKwz7Sc4gF8da5jRbPUqDHmfNUGyrA
         +q833nbRoS+HhXtbrs+5wbemxnYaf5oCysqPx5c4SivIEDYESu4UB3uwklN3Mhl+sYYU
         bGOHYiSO9J87KZl+IY/lTBHGRfp2wbRnScsI6D6TNeXfBDsgLfQ94NEwzuFrkY+K1+Js
         mkJyN8WY+/Zs8/tXauu2m7qVVhUc7Ap7Hw3iMxKUFnsT9ZNVFOtNj7VuOTnTyB1suP87
         SpYw==
X-Forwarded-Encrypted: i=1; AKwUvBwr9pNjs5ho19vQL4Ai/SaFQ4t5Etjzm7d3LakWa5leX32vlzx9fAoRW6j7IKooWxqfpFuUyDQHHr2PJ7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxHZaI2pB5Ahd1jj7cMB/OoiixwgVSMoHUmcmMS2dTsMfCZoOn
	Rx0Mra8+C/UaJsb9PLjTXZSi6WoQ069/m+sWjWVCWvQrPdeXMxFboZU=
X-Gm-Gg: AYBFou1lj0uVlX2L2etPgNb9z3qTa7qt6xRnzUxY4LcFVqZQ+ByIMAomabWW6QLFxsQ
	5o4ZJIXDUQpH52fiTziwRTCOHi3TjfBs8uXx2LeMclelfPRc36+9kSNPmpf6b01mBRfiSoDzfnm
	2SaRhqrfj9TZ3EBbc48TP/R/IzkpH6PtBNI/DOvZq2BSSWlhySeI4gGokbOUwrLAn1ENrCGDml+
	opaV4bYVFfhLEmnlO0a+hsyXwM7L/w0haL3vlvcCyQTPMux/V/pAlX46xp0dCLxRjuJT40Drz7g
	a5KhvMKQEYocc3hZe+VZhU6iluonTUAovljRKwlIIhsAnRqS7uvFZb1/vieYExnTAnZYaLomB0E
	HOojj+NxwvJVSzIpCzvM7m6T7IJefTCx0KKrK9sHuKSRLIQOMrhQNQvZlx0roo0YoVTgH7Q6Rz9
	lG+gmnhQpPPrSpbyX1K6CwP2HdYzszYQVKVbFOJat01OyF9pXeCQ==
X-Received: by 2002:a05:600c:4743:b0:4a1:d899:b62f with SMTP id 5b1f17b1804b1-4a1f45f8877mr54521095e9.0.1792510887344;
        Tue, 20 Oct 2026 08:41:27 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:26 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 3/5] extcon: max8997: cancel wq_detcable on driver unbind
Date: Tue, 20 Oct 2026 15:41:17 +0000
Message-ID: <20261020154119.2568395-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020154119.2568395-1-tristmd@gmail.com>
References: <20261020154119.2568395-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The driver schedules wq_detcable as a delayed work during probe but
never cancels it.  If the device is unbound before the work fires, the
callback dereferences freed memory because the driver data is managed
by devm.

Use devm_delayed_work_autocancel() so the work is automatically
cancelled when the device is removed, matching the existing irq_work
conversion done in the same driver.

Fixes: af5eb1a13273 ("extcon: max8997: Use workqueue to check cable state after completing boot of platform")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/extcon/extcon-max8997.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index 9cddf08e06966..7048b9f6d8443 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -754,7 +754,10 @@ static int max8997_muic_probe(struct platform_device *pdev)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, max8997_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &info->wq_detcable,
+					   max8997_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			delay_jiffies);
 
-- 
2.47.3


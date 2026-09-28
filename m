Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1D4D8DBD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604762; cv=none; b=ARpEomDD+sCjC6LYbXuQTcMD5almxlvF63gv4r+RlJPsW0GDofQXrdmGeiYOpIQLF3KLnDswmQfYLyhnokXaoW2Ul/SsLC/yoaw5/lNU60mOyn2jHbjuL9/L6Bxma4QaWCraicSYKdEdANc04/gPMBgPkj8Hj1OXeq4HFN1HPGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604762; c=relaxed/simple;
	bh=CxesPCuSDQamye9WPEsNzsnSxvsW/xWJqTvLKJmLwac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dtyHr7KJnxKe/hANPcN6+SskLcLmXM36Eqiy11H9uB2O+I3S1yBiepzMmUmGAN/viH/NKGr+y6GlxbSoZmWk/YbtKk0ht6C5OFG23pu+3zGNdwmCPPJQImLFjuNZ2QoBoetzhoLrZLIwXhfH0mqENZwXlUv4W9wQRPSYhz3QXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JScYGdgz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JScYGdgz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so14562955ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604760; x=1791209560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGOS4RqauVn5EUCCngXsG+3nUUycunolpYedH1PmDe8=;
        b=JScYGdgzSYez36rmDELDXTtpEh410AZvsA99UkORw7uAqAXsmIe1IKhsdlzxKm8MQS
         rfkhRFKptnMcnHKN718kftiv3u6hg3kkQGW9jCNj22aocxH6HQ4W6K3jet/M5b3dIApD
         X5DQiwiFE50rCvsXp2u87cX2wxAKJ78nU0Don3w4XWvnMk37Ly+lz/eiJqPkcQyD4eUq
         Gn7vkR2AkOSYooSQoSAENQ3iPScQB252UPXN5yCAUt8+7T5mDoXblQ2bFsW2ARyL5DRI
         3wnWTgrqefePbK+GNMzMOqE+6Fy2skeJRFv0sk6itzzJKFAbMMxH7Wu/KO4QqEdMRQvl
         zqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604760; x=1791209560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGOS4RqauVn5EUCCngXsG+3nUUycunolpYedH1PmDe8=;
        b=TpqmctjmRcPiQjnJMfzrZiDHXlx6PC3zSYckSRnci3wCc341FxFpDSyW273nWERVoD
         9lKMXpwEx2XNZxaiLil2liHC/GmlV6YbEwEmmHiVstfPAbghnxSF6TpD8qn9Mb0boJvi
         rn3JSuazaZnLoh9Qx/FVWRnCCeUV838yu/mQDq22aT5MhBXIiyZ57JFhUg1Yw1uPyjsM
         CxCAiM76ARmQF5dHu1L/IixNqpYS/L3zuMr98pKCbkb8tCl9445xWjKclKIVSZF7rUEs
         +2P/fQYNuRszCSVBNho0fFFSg3Iy81GCdX6lmgeLoXp9TG9oNL4nbieQdw9BC25QrZyJ
         BY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqWkbUtI7JR8EGjAMBdW4vqpALG+nfAXoL0kfgS1vBqOTMsgDNf9hkMROSTUg5cSq5D86ylcI6wY07MHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiCdpQjFieFpMli/RsPFVzk7UMJgdGP5NXxo+GhrXMtdKfRA4J
	P76cSPyzq+h6lh1ASnTg7GwJU3ZzYYB7Am/LiSu4mhTMq0zSsnNn/oWO
X-Gm-Gg: AYBFou2Wk2Avf9I0teHMrs1+HqLz4mD5Ru5Sq06s6cMyB2q37PqSPerar1do+Ux4wfK
	4IOLTBc2+kpi9KpjTEqtLQ1czybKZLSFBxLkzFwsU5V7TrdpOdVRyyhdbKjNarq6i1BD7cl//Ju
	quxBrCplnVIlT9/+46CsODVNla58V23UfMUF8PMcfVz9TTgdtu2LVHta6brlyxyJlli0Wzx2a/J
	7uexZS7x8BrNggyEtJO85G6GnXJ5yt5NcMqqyQlGdtvpZDyemA0z7SaaOKLOj0bB2cBTevHC21f
	rp9Ne7f9IMl6ywXMAN8SQmBwBwZxDshTlsasjJfANUIC/68ILrnTtRc7/OmPSfDhDWO/L+Hr4mG
	WKJEFUO1JUnfBF4oRraL8pLIxEfKfqZQ/GDPuUS6u9q1yjMWmTTiBJxtpWGMQkAPHXVYYuXOCmt
	nStR13M5IdikuYENS9Fe1ausVRrH/ZCStgV2MtDy17Dd43nlINSB1hPw0oHaMY4BcQK/B/EBHoE
	ZDZ/zFx0bK/Mk1v37SqxuAfrPM=
X-Received: by 2002:a17:903:3b8d:b0:2df:95b5:efd with SMTP id d9443c01a7336-2df95b51557mr51627095ad.7.1790604759846;
        Mon, 28 Sep 2026 07:12:39 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfafe765cdsm23881025ad.33.2026.09.28.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:12:39 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5647: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:12:32 +0700
Message-Id: <20260928141232.2443546-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5647_remove() calls pm_runtime_disable() and nothing else -- it
never calls ov5647_power_off(), which actually powers the sensor down
(disables the imaging clock, asserts the powerdown gpio, disables the
bulk regulators). pm_runtime_disable() only blocks future auto
suspend/resume, it doesn't force a final one.

If unbound while the device is genuinely runtime-active (streaming,
or an open subdev fd holding a PM reference), the clock, gpio and
regulators stay in their active state with no code path left to ever
release them.

Call ov5647_power_off() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Fixes: 3c2472a3c548 ("[media] media: i2c: Add support for OV5647 sensor")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3facf92b3841..52124327959a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1271,6 +1271,8 @@ static void ov5647_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov5647_power_off(&client->dev);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.25.1


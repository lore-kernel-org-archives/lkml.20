Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097881;
	b=wPpKZWASemihtORvf1D54dLd8ryOBP4ovp/v/anmcsqAcvME1BBZDtqeR+bgBYfK2bgi
	 +WwIHxeesuz3FGJzc3KyMChIWf/qzXz3iy6QYIdCsWvxh50sCopYnqZUTkNqh57F1lK0C
	 mRPQecJzFlwHVTCkyhRKVsdzqric02coBj2Rsd25GvE/4hV2UTau1rClnjahcHN4WCkrw
	 NUUASPzHyaXYHrxcwwcsZqMwl/28ipkuqkKcPqG/r93grTeQNkNIOD7NSFqWY204U+axD
	 Y5RSv5rxS6KMefvq14155U8Q7NjY9krAVb9LQXdjIMemCTsbughEgSddS4bd1aWhcbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
	b=lVpdxrByeXcKxBmBEdPTrHKIARznbqYXGpR/eGAaexBvrpkQoWp3B55zjQTK5v7RjwVy
	 VNHFswq5DAGh5LcypfV5H6EPRMkliKTO6V5nJ+nfdHKQIEGuDKfKGRDG6cPa5nPtZlJOV
	 yg3tv2uutJ2OUEMGJLYCBYuBM7o2PSDfivO1d5ntHEWBT3Y5bZPkHUoViFgCFrCK2lVwY
	 nBL1LYQURN8N9XrVuyh0iF06U1RQZFQWU2AH0X7fl6FqXRI5WChQ1pclcRR6QvJRQeZ5r
	 QW2nuFDGcEPCVa9Np74NlpHKTQmIWkifCspthTgIs6sTzEQgl3ZwsHByBbocV3efjaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=It63ys77;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A4606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=It63ys77
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea138a3497so25568545ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097881; x=1793702681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
        b=It63ys77sAnM6efQWVHuna1Of5OoB0aw9oMmpYvbun+3XsW4BjAazCVz6XuGYxdthQ
         R34fsxVHzXQmUXvNxJh/pv66C0c0GCtvKTmfTCNetR6VQb2/cEpQmvKZGIPUmUM2ODti
         TBlH4kB7A+OJX1GckjfiFP+/jJjJChXbhlh95RzZ5f/4IuYelGAPoDO0XVf3AYNK/FxC
         /RhEwqS6eY5EkPNJpcJXFZPD792hw7y2gluxarNGavJ4iWvgU0k4hNXZfi7CwywrcV22
         VbYmFOaOexnQhOEH8O+GE7OMzQVEvUInS2o8tR4YGhFpoUyNudfls0Bw0ROydO+9vVEm
         zV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097881; x=1793702681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
        b=eYAVSSUc3wlg4o8wPfTD3xRdGVAvxNJjeDE9b48+Z71izMiQ3761xYxeXKJ91GF/0a
         VcSj6P6DwMJBlfNYG0sURLzRWtmnsLDymFM56XviD/8uhzzhIYN1SwIwcWO/hKrHUyDE
         29He/jXxHY6Uk7nnLyOsq7QijHYrivgaHpyEPaYTPsy+ubXyU6Clft5pi7QMoAsDPjQY
         XYR9h7QdyBZsshYvOblXoNGGLiTWQQrlcG+EwR9NTlSgzl9PiGvh/dL7qtJF4Q7KYSlD
         9lH432Cn7H1wFQT1miCGtf1OfuTfa/XzfIR5UP5z6J02KlLZtSMLQHgwuh0KXTkJX3fC
         I/Gw==
X-Forwarded-Encrypted: i=1; AKwUvBz99AirjCFYkC1vmevS99OHuEACOgHVus1iLi/NFNX2KLT9ukY9OamVXP/icSPxXOgIJK+NwiGXNYSB7fU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAzrgWvCAwKfOq7V6XSBaxJXi3RP2w1C4yDTkaWCvO8O+xbPh0
	6LcmRPtSTE0Gl86LyK5X6OVehdJYt/8QFZdFgl7umTRtxDqT1Ibq8KtXw5CW4A==
X-Gm-Gg: AYBFou133P7w+h0jriR+MS5jqUZm5alXZqWPRoYMLZWCUdnG7Vno1/WTjYKy/kMKglz
	QALCQK5uvD95c2NeZC0X5EdbS2kfyMryxSOgwQJTUaYNLndiNVTT9jiiL6dCB6FWS+qWPwLJStr
	wRKq85iqk6mhr9Aoy7g2x5NeisWwC9yakQJ4lKMAVxydEDtSWTNZ8nQppXqopKyTFTe21EUi1J/
	G/+3mXyClysUi1MS0G9KGaVQrmfrgG2c5Kojw/jK1AZg0iV81S/+KrYtOldVvZpaQPGm1yV4bgr
	e8hqpWydPcHV7oNKSK2i1hyzi1hvHW58VkVtznGn9xr5hJk15HMsdeo/LEKFob78f4cfqJWgTXN
	AmKpbx1DVYCAu+Tiui4edtbQGOL0auRdzB8OhHb3+iCi78pvTce5gRIEc54TrsqMwzppTYLvizK
	LWOIDVRYNullqwtYvb6PBqe6sLutn87FHrEui5xXdickYvRMUw2Or3xMhLPgJGz5PW3KhkvF174
	8cTM6HldIHev/sdTrlu+7E+HYPyHI1DxS3IFowJFt2lNeHkeXXEzWlNondEhNvLiLikGNJtPLuT
	JyvCWPmZi/uqfvh7d3rS7IJHYdur55u1+gTLxRpmNYBGJf+XRvs+yZBgYR5Fa2BVFRd+PDI=
X-Received: by 2002:a17:902:eccf:b0:2e2:be61:a882 with SMTP id d9443c01a7336-2ea9c6c8bc8mr82214925ad.11.1793097880831;
        Tue, 27 Oct 2026 03:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: img: img-spdif-out: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:17 +0700
Message-ID: <20261027104417.7150-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104417.7150-1-phucduc.bui@gmail.com>
References: <20261027104417.7150-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

If registering the component or the PCM fails, the error path of
img_spdif_out_probe checks the runtime PM status and suspends the device
by hand before calling pm_runtime_disable(). By then, the asynchronous
suspend request queued by pm_runtime_put() may still be pending or
running, so the suspend callback can run twice and disable the ref and
sys clocks twice.

Disable runtime PM first, as img_spdif_out_dev_remove does. This cancels
the suspend request queued by pm_runtime_put() if it is still pending,
or waits for it to finish if it is already running, so the status is
stable when checked and the suspend callback runs only once.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-spdif-out.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 39a37e4830d8..d93b3a135d79 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -386,8 +386,12 @@ static int img_spdif_out_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
+	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_out_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0


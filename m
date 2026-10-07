Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18472473C84
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370270; cv=none; b=LZ3H/6JSoUSCqm5KpZmKs2BJIsW9ImuYVhmNDtEcDmHbSw8Gq6eURPRdipc24a1wSDLpZLO80vFa+g6lE1bVJlM7WuXImvS2wH4P9BaBWFKQEBQ8Ra7in354sFYyuvvdG3eqcW8ueYJ0MLQb9imy+pVatHOl+ZszPo7TE0RwYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370270; c=relaxed/simple;
	bh=TiTBZNONYLwSCWk48R2S9OYZ0babE0uNHcz1ozFQMHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cj5XSMKiJtvGsk0+aIyWRTJfZtNrH17DeSlzfn6frAQy2ZsBrM5X13k4wyFbfonozV0shkvoLfyl9jX2thmMkpaDgjfYwmA+KFdYNgct+saKaCA1lzC9g4Z3z//ulkd/38mF6OXHaB4G3yNpb7JK+zbsHn08kqTn+maK+Df/irQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWXw1r39; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWXw1r39"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so760072a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370236; x=1791975036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLBcFGOFinccADlrrF62WWwM4vFrExECPGKcB7WQaMA=;
        b=sWXw1r39qf5SBY3Hsz7vDPbjUlm33BAIC5RrYu+4bkvE2vBqkbdoUNxQiFejpFsZW1
         UZDTIM7bCeS5j1AwrpZJVQ1s6UrdccgYRWGqV+KWRTRGiLDrKzqSHe4ppTUjvTT+C1V9
         AG9Zbdf7HlE1lwT/zgwp3wfACvltWGK0JjhMcbCcp2rMJIO3NEBVSMQ60s4Qrmc+wmZC
         yrvawRVHk2F479/OeV2HfY/Y7ljV4bHjUdeTlfiIcCjsooThfcncZP/tKV30ixuuZuBe
         iOkcWKg2t9soBZEU6JD21z1HkKlkhCzP3Nb9BThjPwW2p73/97QtPBoqpRp3nCApieaP
         GJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370236; x=1791975036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLBcFGOFinccADlrrF62WWwM4vFrExECPGKcB7WQaMA=;
        b=RYqEFrLsECq3tA2QHibMhQLlfd1r6IMcUSc5AUX2Wad1PyHkuZLkksBTb7/3dTtDO0
         0ZOVB76zdx+zzCPsEuOubCX8Laxh26dH3UungNS4XxEVLtsdh8iO1pPJPQ9fo/CoDSYq
         pHp9fVAYTHm30XlToiaC02LjRSbFWVpH+aWDFAR4Yk32EpvN9MNvC+uWHpwmBR6Axc5Z
         rGNZhcox9v+Df6Yva0m+a825Qkq/xansjX7pm3bby78a7St4FLpY72XawfIGJipRnWnp
         gNOZOSKNejWWpfDH68rUz5EOAv4gu/LdRCex/iQvYhNgE2u14tyDKC+u3RheyHoD0gZv
         v2Rg==
X-Forwarded-Encrypted: i=1; AKwUvBy2qTfu1Q0dntY5BtDm97SrDa+qr1PBHYxX6b7YYiEBapMQfU98Hy+AqLd62PmOFQC8ls9kmFZK7QypQAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj2yxwcdCl4Y62kJ+iTKRQ2xn6MgFopVKUShR2HA2ldzmtYKXr
	xW6ZYIfPvvUbfc5hEpKRtLbsBsEY1+cDqhQEhvvJD8Mv0c1XhjFP0Y0N
X-Gm-Gg: AYBFou3aMc0yXybySEpp8lzXKUuUPxI0gHEAyyDIwKN9AlWb1LcKH/UD8tZqBjErY18
	AfZg7t6WN8ozgFj5sjpdnNZXx20ZrS6/+FGE8qlb6t3XjT3rxPlaSDaPf2QvQjAJ+pIG+mlQkhV
	HxTaRQBpkTRqcMqfle+6GwGI/0d83e/l5MLwYtkQjkWQ7rkBqKt1gN2OEC9tPy2Sg0lj7Sjjo17
	JAJ0Xef/3rKIZGP0siEcXqkWBHcFT6NYr51MVWosugkJoXgLQ2rQ/E7KaWkHYZHM5D0Dfa8RrBk
	0RA4S2XhrD618WvkaMuN+CUNUCP4JsHudRnn6L9D9LTSFAd7gERQhVnNYBLP+QKb/GuqRqf0YR2
	twycdqOKDP7i2pnyI29eHriwA9yE35KqvjEuSmMhsKkc/DeWz43iuB1xvIAq9+oWETMyMyEqLjF
	9mtwteUA37f6k92qNq8NSXT9Vf+l4tu2fQXANlVLyI4uO5fYnx8KS2451CMX/0pf6UKrrs+Gx0l
	ibi0PxRoCHPoQd38gEP0e2e3sX5yqGeavZ+aEy6rYJqu4mCwur9eK8KUC4lPq03JK6WM6Rq0xbL
	WKmMmEcRFJyJoQ==
X-Received: by 2002:a17:90b:564e:b0:3a4:e234:111c with SMTP id 98e67ed59e1d1-3a8a1d0d246mr1455895a91.66.1791370236016;
        Wed, 07 Oct 2026 03:50:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm9408706a91.13.2026.10.07.03.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:50:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Alex Lanzano <lanzano.alex@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	u.kleine-koenig@baylibre.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] drm/tiny: sharp-memory: handle enable GPIO errors
Date: Wed,  7 Oct 2026 17:50:23 +0700
Message-ID: <20261007105023.507855-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but sharp_memory_probe() currently ignores them.

Check the return value and propagate errors from the enable GPIO lookup.

Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 7efd7b567f3b..35254a2136c9 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -552,6 +552,9 @@ static int sharp_memory_probe(struct spi_device *spi)
 		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
 
 	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(smd->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(smd->enable_gpio),
+				     "Failed to get enable gpio\n");
 	if (!smd->enable_gpio)
 		dev_warn(dev, "Enable gpio not defined\n");
 
-- 
2.43.0


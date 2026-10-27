Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098240;
	b=2pFPvb97Zu9u1XW5Wbw0vnnYE8Zd5ZwFjOjDsEyG1O38vn4AmuvIssZZ3+vVudUZSybg
	 rZDjqXtZ4Tw7bi80EPwL0yHdSAz4aCc3fMSZm19ERpaMFJ26CHD1s6kXeZhmw1zdJWr7A
	 JVL7agL2HmbZp5pTVVFsawf0s+LU2JFHRDs7lgfgRksQ2/vavgxLJajCjxHCG0BqNFSiE
	 P3RwAb7c018Bgxm0hwWlVlFEbEdlvgC2AuU+fD+96euGKdw7FS3M/t03dvDwi2EzYH+z4
	 1MLVXrAKSdWOfw0ZIlKctG9LVc5FM1vV/DnRa6HXk0Mb1lE3u/d+VlbTaYY1Dwz4Ngw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
	b=JcoIz7EG8ZKrpL8kWcnqLQ98EsznTY6vQTDV1ICfh3kksFmW82XVq+7U3eyS+8wHyjbs
	 hgbuo6NMIyMOucojVw7OD/NqXIVGb8Q+HpQkhKPlkEsAKKFmKF1bhBk3TPcXUQKqYzX3J
	 +dfgMMpX74A1BuTZgaEaWN8H7Okpy9VtJFk8tIvlC69LG/0eoaPWjPLiI0kkDIZnb4529
	 CionyocY31yPF0WQ9U3QPETFJJojhHcgnlkFh2Mhfats2EEMFx4sx08G1Y7TPddOdQiMM
	 /K9z6jvh3O5dKZ9D2U+5x+bUFPnvg+rtDYq8kBDvGAVu+df0VdU2ZO9NYJS+n2IWMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DK9AS4Cw;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D0606A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901D0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DK9AS4Cw
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso4018479f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098238; x=1793703038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=DK9AS4CwFQITVbCOuR2rsrN9qvm5DV69r3abBgOccZk9rkDjC+yKRSsQMNoC3xoota
         AH+EkShreAto0DZdFx/VR7MxNeswWVa3K0+vAKQMO1zkuZGg7CDttKseUQANX2vyqoHL
         DgRooymbF1Dihu3isIm7HQd5BrTm8up4cKTyAGcz1N/1rpXn4pAE33MK3ykCpb+tLAc1
         waRxbYNFaCX/XCPCABng6cKYOzyWGBbQVuarvxckXrmqReAeZcx1MDFzseMnGluY88ES
         f3y4D9pvCQGFlU8FIf6I1c9hkiqaiveYSG5PoHAGHR2f/ZTA4/wzV0Vv5kMCivllin+0
         7Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098238; x=1793703038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=ujHxz1gOMacexhWVBUiDj97rzayWiC2FFbckUT51SrjJHBGb3vI/qbyCxI+EvDC9e2
         T/MR0RcFNthhOKLZg00bOmMC/VZWVRF0LUf8HPXGwLorc+pakZP29j0bR010SXaq0Xoj
         8purLFD97pDVPQEvHqkqutOYUzXQEniaCkDOKP1LOdsTOyikOWNMRAhd5zlUrvJiLisD
         2e5S+BYyT52Qu/KSOWBL7cvhvY8soPWPw3fSZQqMko5NJSseI6hQmjxKnuPTsyd4RR87
         wUWnv5CscvV+xlYz933ysIp5VzYE+2TrAKYh0oUa8ImzBsLdKiL26SphuWhNYSmRDtKw
         8t4w==
X-Forwarded-Encrypted: i=1; AKwUvBx7ftYkRwggLlYpD6hc1OHbD14JTytzQ4FE2YZZnj6zk3Ll/kOD67PN19vZFc7EFZXBLpR//EjSLVXKZew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDdHpVhxsz3oypLqDz5XsXa6xTV+xuEChsBlSqn8XYaPovdlVL
	wOmf+6g2v2u2J62QUp895bE42sX6msyRJGLhUwdhK+nWKKj4J5HJAANM/bJK3cZszcIleAh8yIJ
	CXnJLlIM=
X-Gm-Gg: AYBFou35C58scCRg7/PuRQe5zg1jUVDvCoICNVuQ3PeOJydgIlllJJL+FjeRJr5xkrR
	9t/BL1S52RP5iwOuw5maqGazuHFJPG+MXMa72toREa731DUdt8V7Dth3h7Livoe3kmqFPHgDcpK
	8rK2lnjKYWDS3lcPXY92jgcmFittjZyyq2r5et16/RYqaORQYOuVPevmUFYPVLjOUbEgCtFryQ8
	jLdDm2EMQ89aKePZn/URaVmoCu6pcZe0z8drEgfjh4X1R6/e0iVnsOgAgvWrMWBDp4AaSWWHEds
	UdsfwYwysra8aclM/fbEoe4cMhoqs1TquQYg/7Uzug5w2A20CGHFAvITsPGfJW7MTwcFAvkVlSE
	oVHu0l0Pz2G3fVjVc+aMeAN2eHel0NEf4+NKvhhzcvHB6qCiLDRSjuZ4/QcQLdeDJA3kHsMutCQ
	JFZlbchN1d4Nd3rK22gOt8DJY0Q3vNoxQZJgenLAaLwZsSoi0ilEd9wxi2gRPtuRooEdbcY7Pbo
	GBfO28y7GY8+xjg5GU0uHIZgy6s1i55yUH+uWUGYjlURQDq7So1Ffn6pCinVhR220VRBGjKZj/x
	vFOzBtlawGJus0CAv9NeYynAr2LpLn9eQTDxEQdOuOk=
X-Received: by 2002:a05:6000:40de:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-48e4a8ae18cmr13762733f8f.4.1793098237881;
        Tue, 27 Oct 2026 03:50:37 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd4ba7sm22249916f8f.33.2026.10.27.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/23] gpio: pl061: Use empty initializer for amba_id terminator
Date: Tue, 27 Oct 2026 11:48:48 +0100
Message-ID:  <b355a54a01502619b94c75237d187f53e496be9c.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=F0NDFiED5fE2YvaHL9r7KOPlatK3tsaZ/Ub3SUOTuFA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IG04mxX49moMc1ZwmXpAzVIJYDr+Nt0mz9oG K7c8VUV+DOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBtAAKCRCPgPtYfRL+ TlKRB/9/2SD1P45lfIQc5ZOezBh4bFIx07gZ97Q23pmsOlpZHMwynGjuFJIZjG651A1vQ0HjkfT MJpq8IpYdQnWTzbcIuyFvzbn5JJIR1Q46daNppiOYD+viwP3yhdCKrdem1CbzxlViKnTjWk6v4N HU71qBLesIjYFdYzBjfvIcZyZmK8rtQbUkvEDprT2Z8bhjn/dtsjRqF6n8VD/eqPi6EsdqKKEjH OO+kUefD3FdWyUk2EEMx5+SzwrZyuBFDDbaQnPwm3jNeP6coEJQ0wf/8ihyE/Zt68LoBbwoKd16 FQvf1EAerdeeOthDBqOrGO9rgreVIkojOENBw2lKiLiZzXBI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index fcd44e34f65e..f180e5f4493c 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -412,7 +412,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.56.0.rc1


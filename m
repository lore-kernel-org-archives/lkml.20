Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586732;
	b=Crq81Ful3HSiA1xCJVc5zVEdEEQ2gGXl4VWOg/dWInZJscjhdoSnjsd+TvAncDzrIKV5
	 fOuFq7aw/kSFqhGVJMy3NPiHg1cDVWzQjNBfNJtFSoe4L1Xdj9o68lXZukTf9er3KapO8
	 eaCGxYzgW+2A/iAZRLE/r8zzIZNiUPVmq4C2PDZdQrSCtstXBUt5eBwd0lBCXfN2+ZVb8
	 JizKarbKHnVJXWA+4UChcC+B6qPQ4L4HJLV42qDj6TTt4Z7RcEGRgrZcwBjDwUpKwG6nY
	 j7vRPDjrTjw63QGTF+V2+TmJ99PjMen8Ac6Ugwp2GqcUt8GNvt4qpLRIHiNAv7jfutA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
	b=MkRz18lHVitCtyVoFZCfz5jeJywNd+rOSYc1pDxCsgLUsLOJeUfTuts+bToVfg9YEgro
	 gIPW7rCYz3Fk925FcztmsNOW7orG/7UPoxpkqB+GnfI8t1RQ0y0bIOOIhzUBN4EljHlgi
	 r4c31/BWoi3NcLHTlzb6EYTrsmGCh4v479g0h7H9Ubcr4Fiv5/iJ0hpvz3mWiGybAOuog
	 JltkHGJ9sp/R7y7y+Wrkc/m/sfNh9pbgEHhSrdIf4IepLw0xvPHKMh3PYestvdsTH8tgD
	 ZmzJlanjQmwJJKzchjJ9NprRi+gbJ2I8c8TBUDGT0I8MCBtHx9oqmhwdia7YRlcTfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF266070233
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF266070233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c445c95d553so218628766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586730; x=1795191530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=M9UjRtUD4pPPLVx2rlfKtPnYulHOmQSBlzv65hZNd5XJrP8uTSeIG482GQPfDk2hI7
         hOaz8LyLCg+QxHlOolUeh0iqb+6iSi3cV/qtjXjXepsA7nflo5i6k4xzG6Y2p7yay+dK
         umAZt5M7Kq7R8GyhiDHbQFd60NUsxnASXTPBR0SFhakXg7GxXJseLT33OIDoFf/DapK+
         gvcGIO7iugM78r3VU+QwMPYwEBBCSpNdnizDlMF5THvTY+DWpuvTqjJKsCepIWre8yBt
         AoKrHK2cMdqTBtSQYRo2Ca+b1+AdFUx+IjKahNuJV+3QDeWAzd2TeBOTh98kGKp4wmRi
         OVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586730; x=1795191530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=Gvz6JZ7aNTu5FORIr+AeVkx7Jt3u5dA//IHUygeAjTNLSFItGYSirUvQAdYCCA2vcP
         MjLu2GL9nzeaeUUr8XXLYcwExe97pTcKcqBN9jRU5zUgpAf3S3LiufXJWaCatwbn4/2e
         8AQjXEwXB51mmpzIjdmydwyHfpSCRQY8u77falbYsYnF8KXBp8u0j5feCiSreqFk89vp
         WOc8iYIzrtp3rsJqd3ey0QSUhoFuFWgMTUKu09s0vPwZY4PxeGNpAdDH8ICxPhDIxsSI
         FfRlSvEXIGcY3IVSUbIYKU+hSTbGnxqwTKorEb9jtbikF4UWaMGuIULOYdLjo8dQjuW9
         v0cQ==
X-Forwarded-Encrypted: i=1; AL+hErG0Q6M4kwTfEwqxEBbj88gldyxO2oi0cHIvfrJol9sgxov4rYuJNHJSTIyRmqIgNUAYOx8w9n0cZVvX0Kk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dwGDqZUSKAO16fmiK3ZcWy/n1UDnfZIWHWkZ3c81hF3iDQsk2
	KXzxHddowRB+HB3ThTXrkuAczBAzQG7Nulq72vOXVJJy/QrxLnePuCuL
X-Gm-Gg: AYBFou1O2vuErUU1SoBhTMEIx/IERplbpB4xjthJu5tkhLdCUp4dzL9/CONUXtMBc/9
	1WRCdUQ17kO4XT4VEbccfuW8v0uL+Y6PZNzQSF1ieAxZawYcAbDBsRhYmqrA/OO2AWnR+oAJgPM
	PXCPVQzVGmkHTFbvXV6GxfKPSd4r5t4S9YZqI+E8h6KJvjlR7XfWtiQVo1ikOl3LXUz/zR3gT3/
	ox1CbFMVUejUeRBwnTnzf+GhyefY3WMfoF8oU+W4qOV+xazKYCxkMTQ/M2jKPBB41mfUSXc3EJk
	0T0xw0jb3JKvMxGWhZmYObSnN3iMJgMQ4MUkjXWWY1ZxWZaqfv8T2/yLYX+CzpDBcLPpgxSlpUQ
	rjjXPJbH8d51KHMmV0x2t8jqzRcB5mhSNKcQ/VhynAwoP1yzVUTwMMvzOAnHZaLLN3bXjFPRrM1
	LvL3nLRjqKyFOzznKUU2F9bpaRz3uFvHUzw3NkNbqzs508gHb5VAi4FuvhROtelmURJmRe9dTTM
	eDFhRolpt+w1m1thsUqP5f6y/hQZGz3smXhHiSCRH+eF4SV3+/BWN9ug3i4KPn3YIi+ICyr9RoY
	4/lA6rpKs2Pf2qQ4CRTQ18LwGlgz+/YWQHs/N63Ae8OMrnSExNEj4cE613jYAYWisuBniYg8/a7
	20HewLHFYpw==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr252539966b.42.1794586729694;
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to check subdev type
Date: Fri, 13 Nov 2026 18:18:14 +0200
Message-ID: <20261113161819.36847-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() function relies on pad flags
to terminate the search for the initial sensor. This causes it to iterate
through devices that should be bypassed—for example, the pixel array (PA)
of the mt9m114, where the internal image signal processor (IFP) should be
the initial source instead. Switch to checking entity->function for a
sensor or ISP to terminate the search.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index a96ef26af89eb..5c649e3162fe3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 	entity = &subdev->entity;
 
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
+	while (entity->function != MEDIA_ENT_F_PROC_VIDEO_ISP &&
+	       entity->function != MEDIA_ENT_F_CAM_SENSOR) {
 		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-		pad = &entity->pads[0];
 		subdev = media_entity_to_v4l2_subdev(entity);
 	}
 
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586730;
	b=XehT1A252Lqo8Yyu2YiKAyigG72zjZHxcqSoZx49eHgfEnU2t6TEI0zi3H6G2EvmHkRD
	 X0rZBn78kO8dxQyVhVkrL/71QXdVryWQKMJ2xnBxKhIJWOD4P5VPqyBvrMcTNSVhp4FjI
	 Me3Zhw29xYQR71nVmct5BWIFsgN5HGwShweWqwPq2JV8NcLCd/kyoKqWteJnYA2hvRwzM
	 9YHyBJes49InpVjATnLQ1OjriKbgpFOs2tGhwZCgM3bIuxIcVcSVN9BG5fp8Nlk3lZnTF
	 9jrtOO4xIzyT39PCgggVCekOoGf3mwh0vZmEY+mLNhRAjNs1WnjL673NIZ9/2V9xROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
	b=EHAlfXrfwL/21CMGNu8swgQRSq8xjlOXPw20YX1Z6z0y1/jxuuNI9gN+GsgaM0da11qE
	 QvORSUTfRP/jY6brBlmZodwN/BLTzSFdtA5fijrikPg48x5822R6aMbEcf0CKAhajxfSl
	 g/lqZPaBv4XoHk5aYlUSlg99Aojb5mbeRlmmQKNp/+pLvvt2tA2HnwpNeEsJMG0VfSEC+
	 8opYHW4DQFHGNdWiNbCk5QdqRZmOGWtxsP7H3THF69BEMxBZtavTxpq1W8kw2G0awqyWl
	 mgtdXZkrLjSs7LMsQD054NlP0FjDSvwSe3FhaTkBdNQGdCo/sOhTj39+zWzWXDLkVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3F606D44E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE3F606D44E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso289681566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586728; x=1795191528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=At09PamBlx0mgZ8wA1mn4FX0b8cMAl3wGpEtI5vUsyZVLZyLykijn6m+GBgHgmaz3k
         N5Lo76AHNSxg4Qh/mPhuczNxLbchBt9gYHFcLUj67NOD8u4MARnPOl3nJDJAZ7gABrOk
         aeyH/buHFumDJ/xvVZBaKjF5ueH6dBa8X5qoVlK7mgs7IkaoAUxDM5msSqZvSzxUpqnr
         gLXGN8g2/2+nmIQWofHRVcSR2Og6UWJX9G0RtZymvfi1lAnnf3q8yQ8T41Ep8PpFBmDu
         P/KCpvPP58K3MFtcs4kVVsNbubB6RKywoF+xivcSAJQj3YBXNjii7VJY1TMK8EevsSBk
         umwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586728; x=1795191528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=QQxNxAcpqLkvUGvHao/A3dQPrR9J+nX+rMwRBBKqr2dRkJEhQRM/UZN/SPdD8a1WZT
         Y0HKFlPl3GYPfpsQevVenTPaDoE3QBaudKzakoNW218UYJnCUXwP2qFIiTWqJi0uTA7W
         MgF/RTcBhPC7kiB7LuXmaPVAYkf/KFCsjoHyPZgA5syKVmL9bTWjdSGsP3EEbTnk2MNG
         nk1JreZzPETtshiSqkCOuZeG5X9xaHS6URtS5zraH4jRrrPUoMEGu02xgNeuCwH1rtA9
         Hbf2xDmBwTky2CjJQLxqNHxePpdD/G5CQHgI7Xvx/kFwR9VAezYEDhyyoeJE9GbFJp8p
         dG5A==
X-Forwarded-Encrypted: i=1; AL+hErFE0HoWy/8W19sHqizk0pITKy9c7RDsAt6v0r2przbA7ks+B3n2joOilVdwaq3kW3voFJx6HuBi02/uJws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACVYvjIJNrBDXYQRs4FYWOggt1aZ+VqIxU95rwAhyRGYazpw7
	HOK7JiN1PaamHOtF3InUm8Th5zOa7FX6hCnKrhAIAiRLT6457yM4QYDu
X-Gm-Gg: AYBFou1BkudEZ8vrAr4IwwdhakdcuCypw348A1Mevyv9hBEU1lvU7UfhBCVL8y4pUh4
	2tS+IpHRfpoFXzKgCsnwI2HXJFJgJXn4MWbgFPSx866dNo3pK7bYIVGgx+xWkwPXQ6wXhjGtn9U
	ntuId5eSooyMWmbIrjE0ITiKpVaox3dWIt2LH27ajyj2c+fbSSgi5jmxfiqlg/I0esKYunA2lUn
	vQ6oTY5m2X1w3BbfL+LZi86ZJFIPniNC0xcFs+QEJh2UEAv1k9hM+1BrFHXjtJFxXXzQBBsnU5H
	Wrtlp2UO7/oVmXxVoAGAEmGrumJMOH6U6/5n0iWzvWP4TxUE8idUTp3k0hxeRAaE6hTnh1OoZs0
	JGnCit7C0ZTuxig32jrj63zQvVQxej0AekJ5X2I78PXLN9Ysc2VgsQNsgLOMx0C9jOQStirpKml
	LKtcXWXusKOORvIU+bxBoni2MugaYsVUcQgJ2jXXM7wPtmY0kUiAYoYbREvdIyygiABpqsEZEaM
	wLm24/FtsVqLDwgAJdLB/FN6FKSPG7f3xStBuNGCRiK8o5GhyuUi/t4WJxtdFjcCllmwRlnwYh2
	IGOR19PlHbI7u1NLV+GbfV+sPKsFunxDG2HlvyaPB+GA6zXcWSkjCTc2AgdNZrL2R0E5vGT+gvt
	BxHTKfbRyWw==
X-Received: by 2002:a17:907:c09:b0:c49:9231:5518 with SMTP id a640c23a62f3a-c50963d4f29mr272520066b.21.1794586727949;
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
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
Subject: [PATCH v1 04/10] media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper
Date: Fri, 13 Nov 2026 18:18:13 +0200
Message-ID: <20261113161819.36847-5-clamor95@gmail.com>
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

The tegra_channel_get_remote_source_subdev() helper walks up the chain
to the initial source. It blindly uses pad 0, assuming it will always be
the remote source pad. This may not be the case for more complex multipad
devices — for example, the mt9m114 camera sensor with a built-in IFP,
where the source pad is 1. Switch to
media_entity_remote_source_pad_unique() to specifically retrieve the
remote source pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 12eaa89304e84..a96ef26af89eb 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return NULL;
 
+	entity = &subdev->entity;
+
 	pad = &subdev->entity.pads[0];
 	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
+		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-- 
2.53.0


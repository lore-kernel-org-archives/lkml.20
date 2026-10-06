Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323C3CB8FF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330168; cv=none; b=qqzB+Q4tC1V1keFsqKUbxPcOW5mxduJ4uWljtO0BWKSqKJ1pif5MtU6ijHr4KXOHlTd9HxVkK77cKS2rQEj77stoND5DJ4ogkNdU4Or5lMi4kpbuxqB2EnMImVWTG7Oo20qIRYQFqQ8PZbU1gNI5AHjb98Rp0rLvOl3y6WLpu5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330168; c=relaxed/simple;
	bh=zSrJCZPoRul1DOXV63HB0EMGcIr9n+Es/G6flmAK36g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ujraj4b2d1mkZTfK3p1vXGpL0BY4DZ0LFlM/XGOTzgfurwqQjILayMv1bZN+uKcLyCiUs0MTT0hUdPl7oRxAOn5Or9YRVg0ht0sFrisIYTB+qM47fRW61oVkNkCxeAt7vw6u1DEAEzpJ3bK0eltVZW5pu1s2K8jM0rtHMvNAl+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn5WGzl/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn5WGzl/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c31745ad205so94029266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330165; x=1791934965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xU991IjfKpIZ/ogot2MMSRdI0Hykr6YS2Y64+ubMJOM=;
        b=Vn5WGzl/e8+v7u4bD4W/jgVqvVnZT/HSQaxUIp0mbiO2SIwfzU31SnouxZFqKqZB0Z
         30Doy+ULD8ZI/mjFbjkeOMgOk0r3DNjQzKqIpachVhN9CCWK3jmiXeIM/J0DleNtOLoz
         5iOlx1bry/2AspKNXzyYpIXn/MwN1ELjrTms3loaa2uAKxwrCtGwoMuo0wzxQYknPTPT
         VuMp+9O9cffDP5GFK15QOaS82GS3uGGJR9bdqeB+tjxrlmC7t8mBKwZjkjCv/IjfCSsI
         LuiYJ/jFnSa4cUWx7zhvyaV0LyMfehDrcwvwXoURoS9D1YLd1cRGqIZF9LhgWe2i2Wlk
         a56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330165; x=1791934965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xU991IjfKpIZ/ogot2MMSRdI0Hykr6YS2Y64+ubMJOM=;
        b=CxCNTI4kr4QY1geQPHF7AhC6e0b66zpRr1kWyn2boot7cHd6+qtc7CRenX0tL/eZMQ
         E85MazvQCROgAvoRWyURWq3LMoz8dZxj/dggjdEb1Vnh9VmURs/mrn+tfDA+j63RwfS9
         n+5/jmq7uldcyeVQvNFO1V8UyvNyOOHSu5erc6eiVWAjR4+VEDYopA2D3xkHyZMsUuOg
         AkYwZI+d3YzJZRICeCx5bEl/k0GB5Mm7bqkm4tbOrNKlR1GyXk+KyPHjGtLhpPShmHgm
         78X43+l0F130rC+2WOvdHE9cMU/knkwAGw1qUanKbo/mMcBBoZZHd4XTqJXtS4/EsSQ7
         tJDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2L7DzDqjwcUEtafwDoCz2q6vFWyjGHkYpHE5SGsPfzoFTWKTvODhEvYbbKT9Gy5iJxALU5kPwf53JEZA=@vger.kernel.org
X-Gm-Message-State: AFuF++ki3pkJdWbX0/KycGnw7VQto62fjPde8qhnP5ktWHV/dBRd9nkX
	z+3dWmdMze7MjHAFaJOFNOoEmpjSxMTx3zCaF+o/S/I3WJIOBieXiWDd
X-Gm-Gg: AYBFou3aCqy5yaEueFxtdnkc3VeMGccze0ByLC993Y2mgWkbuiVachbJ+BIpMATEIVW
	gBopE1ZPoj+Z5EkNMea9ve7DN3eKbXCAmJgWPLkIFZv02FIowEm5lentVZKfRqtBpUbWN+tzwJt
	ktTGXuS+MpYBEHEh0hLMKfG23OMUh7YrUi1vywvr0amy8Q+6QghXfuY9KlPdcVtRigjdZwLCMU7
	QixM7a6l0Yg2W9Rl3po4lifnub8b1qPWJDfkrZFhdz7hLDCLKX0lTZkiJc0ZIT26oLkKAXLlLq7
	7s4L9sfmqBR7YiB4TW8TfFRs3KN3J+MAWXmix86ZyA0cRSXyt90zHVDpqXc84hNS+rjs6LcH/Qz
	/VoIcoP73dFNDUjcc1oYoXBqquMcvDYcnzPZO6a3qD45ZjQGGeR7Clo3atf2V+E0AukZzmvl5os
	HAn4nLGN/SIge259pzWhir3tX7AihrrD7ezRQkZESTE0RgJK7uDpfviRaMWj78GOIeKA8Cvc4ap
	pieOHVa9npkVXCYpWwa13iwuZG382DG/7LnB3gAHNhqkib+iZVkq7wyAEA=
X-Received: by 2002:a17:907:3d09:b0:c31:5918:86d1 with SMTP id a640c23a62f3a-c317bdbd08dmr65077466b.10.1791330165265;
        Tue, 06 Oct 2026 16:42:45 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c33e313sm18823666b.70.2026.10.06.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:42:44 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Disable colour space conversion for RGB outputs
Date: Wed,  7 Oct 2026 00:42:27 +0100
Message-ID: <20261006234242.11934-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The colour space conversion block is only programmed for YUV formats,
and its configuration is kept across streaming sessions. An RGB stream
started after a YUV one thus still converts its output to YUV.

Clear the conversion configuration for non-YUV formats.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index ff01553026fb..2425a069a939 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -577,6 +577,10 @@ static void mali_c55_cap_dev_format_configure(struct mali_c55_cap_dev *cap_dev)
 				MALI_C55_REG_CS_CONV_CONFIG,
 				MALI_C55_CS_CONV_FILTER_MASK,
 				MALI_C55_CS_CONV_FILTER_ENABLE);
+	} else {
+		/* Don't inherit the conversion set up by a previous YUV stream. */
+		mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_CS_CONV_CONFIG,
+				       0);
 	}
 }
 
-- 
2.55.0


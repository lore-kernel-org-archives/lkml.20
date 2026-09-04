Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EED3E49FE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524813; cv=none; b=oajAwodN2VQBOEkTpwCChlzYlQH5gswKsd7kon/X7a4WWvUCOIK6QPZPLF8y5VorG4mUrPi9ktIyFGNJYG6zdFH6FAVckSLISVFyzurzMGctmHSnzhRDJZR5Kr7lZ16Yww+lri6sy22XMt9MJma9XFV1fTtIYefeGzQiYOQfpmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524813; c=relaxed/simple;
	bh=FWy5OE8EuZlV574J7Cfm1CRIWTypooLcjTrc3wz6AD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fw30Mbugq1ge2NN0206x8wNq7Q2bp8uzgtes2eyjnu9btbc+imHvmeob4rIo4hNO8AyhSw2vxHXc+HCbFpa3pWiywXGaDJq0m1PPpf5ZD16jqqGgm7OSb/yZp1GmCyNC3C+aHGHASkgfK01jeRu4opsxe1If59/8TkDLFPpLEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9o2bsUS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9o2bsUS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1038100a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524812; x=1789129612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCWnmnyrXvFMshF1SLGpbxtR/Lc6PeZ58jpBs90dY2o=;
        b=L9o2bsUSxJaQQ68g3m5Ny58oFN4j+IcONFAOClnELWpWZLqKk0b1+dhn2tkHiw8NoY
         vFUE+rIBkYytSXESfLrfbV2/TlaoHUWC9hpQvaEAeETOjdiK7pGNENF73kLR7LQjPnkt
         oJbzrH97OhGnHFmQVuaTC6QlrMUbDr9h96e/Z2wldADgnhOU1sdeC7mM5B3MJaTz6cHe
         kj0Cn9jrIDAQQWl/JAVfZg00pRF/E87xp6T/8frk0C+x8i44qBvmNRyYk3PCTOmU2Eg2
         e1q53abbe9F7lW+91L6vnlP8ohfWjCt8XsEgbdmVJWvM4qMJf/JMqLqbf8a+sVhrQ2li
         NgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524812; x=1789129612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCWnmnyrXvFMshF1SLGpbxtR/Lc6PeZ58jpBs90dY2o=;
        b=LXYtw8XSEoqZH7UdnSrHT49JlceB7ZDV5kV64dbpDmA72vd14X7qpxo7cJx90dBstR
         9yXjP0iwacVZIVdu1DgOq4Qxr0qg7NyxC4z6O4tu9KlFTv9oyNYNYYqk2BEAPnf+nZ4Y
         s3OtGZdtVRQ3/nWnggfXlAC/qkjNAzfTDKM1X1oXcjroIeLvqYKzVtSNYpYqZyKgpjYB
         CBn/x3tq19op6BtXk4s5DsfFRRO96B2J1ysL5tDq8+9SQy/Bf7Hvn8PzmafSKzGLjLnY
         fmZwFFoP4J85Xk32+j6jw5yUBlPxzJXyJkVv7cdcBYjLzKA9ByCg09+Pj+p4I8Nohxor
         bGNA==
X-Gm-Message-State: AFuF++k4pJLqWQoivWIyA59OfPcB+nlk2w9BPFWs1JbKHWWV4q/NrFyT
	hprMDVj3E5ZmmkDcFb9bH0ognjmUnn4U+XN1KbA23RW7E6TXV9J8UccM
X-Gm-Gg: AYBFou0XMbhOLeUKOrvBDca0dW61r3D0UEuv+7GYZfQdwSM+q+Bt+0iPzHnhdllIrhw
	dS6j+M8PqhUHHWF5IU9XH/XoOALW5OnwoYrNtS77c+xHKgi+RcxIkRBh2cCEhYx3rs3FDWFvCih
	WLwv2k0n98AFn1wgd2suBV8Crh2Yv8VaNAJjF1X3pLnT41hl/VbCkd9aptgckq9H4SCnfxOXDwS
	OTrxuppMulTIbVuj4eoOUCwj/W6GFrcmMcbPkzpDIuVbbofP3OUDtRDZQawtHbcw3g8jK0y7dPU
	U0U54ITEHbWsJiD5hskx6eyzbrCCmufMu3grTaf6nzi6kPwpzojhFq6V42OAQjJlxEMLJP647CS
	FcKG2Gm+TkwrwNVTF3KGHGJ5zPZuXEmQx7ni3ot1b8Qy7CwwNxeBT5/95x3TriilSaX6bdpl0Ti
	vUeltOa+mmKQdZHKsV0hB+tDImn40nSoykJ5gOYO7XMP7hHdXPZfogffDgA1d2E0lziVoxrXu9B
	TxUVSqDK8xi+UKdqnkWcecdtIk=
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr16574087a91.19.1788524811722;
        Fri, 04 Sep 2026 05:26:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm6626601eec.26.2026.09.04.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:26:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] backlight: fix typos in comments
Date: Fri,  4 Sep 2026 17:56:44 +0530
Message-ID: <20260904122646.32558-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/video/backlight/ili9320.c          | 2 +-
 drivers/video/backlight/ktd253-backlight.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ili9320.c b/drivers/video/backlight/ili9320.c
index 2df96a882119..d2f094dd7fc3 100644
--- a/drivers/video/backlight/ili9320.c
+++ b/drivers/video/backlight/ili9320.c
@@ -30,7 +30,7 @@ static inline int ili9320_write_spi(struct ili9320 *ili,
 	unsigned char *addr = spi->buffer_addr;
 	unsigned char *data = spi->buffer_data;
 
-	/* spi message consits of:
+	/* spi message consists of:
 	 * first byte: ID and operation
 	 */
 
diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index 327b4ee75254..f2c5527d02e0 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -53,7 +53,7 @@ static int ktd253_backlight_stepdown(struct ktd253_backlight *ktd253)
 	 *
 	 * Architectures do not always support ndelay() and we will get a few us
 	 * instead. If we get to a critical time limit an interrupt has likely
-	 * occured in the low part of the loop and we need to restart from the
+	 * occurred in the low part of the loop and we need to restart from the
 	 * top so we have the backlight in a known state.
 	 */
 	u64 ns;
-- 
2.48.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165942;
	b=lisy0EwFM+B1EW6Jpp4TdB4YwIxCQ6ltJO6jJhRnyjaKJx8/M+KE1pgEg7u2xFPX8R2e
	 TJNar3TNdGtsGS2usUAt7DulwRu4PL06XmiG3MpjlauxQPw8lPwTXWY4gmPZ0ant5ygC5
	 OXWHxXNpaxdJ/oX4/YAe+ixe22CKtNyzKJ5aKgQHaotg7PtKbBe408XVWXNMl+JAdHMKs
	 fe7yQ8JuFAxzJNXSGfWkOk8rIy6LYiMyR9RVfd7lauugllMzDdXzD5TFfl56iclq4/shP
	 aMhCpQNZooj+UsTNMAe5J/HNGZhSR3x+yahzpnxvMLFJYvPVzPJbYu5ZTwD1HU386NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2B0XES+Futc2oiYdctR5M7D9QB0YhuOgiy88ZuvgwLY=;
	b=EJeaBpcNzWC/3rpEb3+Vt/4BfnK0MGK6LWLoP3lbOLCM8DkDmXAMMJqzDU9pts1xQ/fu
	 ct/Wc0ihnpxybhpvVzZ3Vn9meXepkRVleB4K0RCVsHoti8wHv8/m439ihntix5qkrs5wF
	 4ME6P9t5tvNzcFyiZ6AI513iNQyk+g2hGXLyw9zmtNyI1tDAr1byjEYgFBGox2oR8+Lyu
	 j5tUiKrRcgZtOaJ0X3VfGDKLTwd7jtdSP4Owz4v+8yHJz1LH1g5XXE4wRyBOWN9Ij22Ns
	 Eq0cPP8H7oSRN+YcTPW6rRMw2ozIY/yNgl68MHL1lj32v2wgJceP2i831t91on7rExg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05Chn4A1;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D2606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05Chn4A1
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so213998c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165941; x=1794770741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2B0XES+Futc2oiYdctR5M7D9QB0YhuOgiy88ZuvgwLY=;
        b=05Chn4A124l3WrzkLyyp4YsH1hvxH2Aa+6XqKjm3IOrKHDf22BeD/WG47+hJPGPdXQ
         ofxVryvRYGNqyn+XgNmPVYi7bGsdj2F6zHrB5Va83Nm/4kqslbkDOS08JYIkq5oNclIR
         BDWRrmKBgOZoGWZrB9DoXz6alhSKCrWbxnFOYnYq3SaCPsj6Qz9+0i30pcT0OJhdH8YU
         eg5aSZB7ny4iQQ96550t5GhD+y7cJ3XjWXjIGMykqqDvZVcP+PxvqrWqEzjvZKHn7oDy
         nGR9iZpNQW7Qggowf+NYwqYtsCvwbx8aown35Dreppc4WK3jcwUre/nxGeclb3BsBG40
         ZIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165941; x=1794770741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2B0XES+Futc2oiYdctR5M7D9QB0YhuOgiy88ZuvgwLY=;
        b=k3YaG9qXdg6w37phm+EtV+k4Ou2uE4HTeSrixAM1Yh9K4ZnKVF5Y1j+WbIHJgD/mWM
         j2I3p61Zs8p7w74ySzRHSxwrjOHYvc3vaykEPfhQC2Du/ijF/+nsMtEAOrl3PWT3t+tu
         X6WC5JrcCB0OGvpw5Uuc6471y2oG6OQmN60hpMJcGl8/ZJLiK6u3Q5fcWyENTs4/I80c
         mDO+z29OdemT3rZjWgtBX3JCqB31yaJv369htfOabbQDRB6rr3qdTSWXYuoPQY3Qn7CT
         /LyCI9jjcqMjmFQBqkNP1e3D+p00oIAKOYIsJ2x2nAbZdY/CeFO7SOpkTau0aZ7RuGZg
         2mSw==
X-Forwarded-Encrypted: i=1; AL+hErEYQLSkp9pSLOZGErN/lWm43RIw+aF6aQ1f2R+WYczWQWLscjso5pe5hXEZgmajOtaOTjJpyk/HHSozXYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JqlM9DjHtOKTi6CJ/XAppV73z6z5f6JgKvaSxoi3S8j4z/apP
	QuQStrIxYJVHGOl2e3GY2QZSV2bOENoQdLdz1kYeCLrdb4yaMwmfY5eq
X-Gm-Gg: AYBFou3wJF90VH2j9vFwtIMzaIWbjS6rRFNgjs89HgWm7uowVYyhumI3SMa/9UjVTWp
	Rwc5S2eXow6XVoO/VreGKzwtsOeby9MNsC0uOlvMIyCe+naV3EySefPmGPPOVFNTUiZmyiqtSlq
	IZX6TL8V5VGeFHWQbYySXqIuvxXiyMhbqL09Ck99bqST4F9gwht4V/14YIVZbTQw7H7QpwnISCm
	zqa8h5yDFayorTH/FZUKOoGk39IqWhY/T30eGCLxceOQxg7kvaINrOlfwVdoZxjhNgxxbv/jZug
	l7Gc0hmrTJ8qhrhqp9tPxrRBZ/iOg4Cy4+rJss2cp15GqTawt9x4qWpoiYSw8qRWgfQGyIIV5If
	fU+i9dnrmsElZDW14uj5Td/HEDL0qf6A4FyPcce1VvxYKDUrLKadwQsX0o1WegNQ7awvWpmuRf1
	4Fh476BS4KIeoNIRS1rnLldbGGMo/GU1+ZyMTYpfxI12918p901R6OD9iqKbXiT5/OPUwaGMUVz
	mqLFPpCY/sJjuJrb+mLl+g4EwsbXxXDzmINo/lfnnzQ+7pmBUSI7STPUi6qGQSizNdopd+v9IHz
	PISdx0EhDbp7wMWRUT67n9tj/W0rRE4onVutTEWMvAx+
X-Received: by 2002:a05:701b:2091:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b39feb2b95mr3431115c88.28.1794165941286;
        Sun, 08 Nov 2026 11:25:41 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm6607366c88.11.2026.11.08.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:40 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH] mtd: spi-nor: winbond: W25Q512NW-Q/N/M: Fill locking information
Date: Mon,  9 Nov 2026 00:55:18 +0530
Message-Id: <20261108192518.46803-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The W25Q512NW chips support standard Block Protection (BP0-BP3),
Top/Bottom selection (TB in Status Register 1 bit 6), and Complement
protection (CMP in Status Register 2 bit 6), matching the layout of
other NW-family parts (such as W25Q01NW and W25H512NW).

Add the missing flags so that software write protection and complement
features are properly enabled.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 51f6bcd3f8e5..6ba1a137a549 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -406,6 +406,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q512NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
 		/* W25Q01NW-Q/N */
@@ -500,6 +502,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q512NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
 		/* W25Q01NW-M */
-- 
2.34.1


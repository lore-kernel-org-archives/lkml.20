Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008660;
	b=UBtDcLym08NKHM+ZoPI7FAz/nS17UT8UXENRKEh4kXbczJm5UL1h99S2iHQmxh6uPOAm
	 xNe5Sag1VOwM+ZTbhBQxu/5BIFmXTj0GAyV9jcZYz6sigaXzjqMsztMTXli9s3ltmjs3D
	 fYLU0Tr1ud28C9+4SDgOvEntbWIxdFJZC0NAGU44wIJxwqIdJGxXlo9ck29L/+tkzu0is
	 z+CMCie3JAsWRhJC1xIjAnklcsdB02g/riSIaX6V+L1xw2SyYqcWHeJWGMmVyTJcs1tYB
	 d/bZtaPOgyvB4qzkKunjUCM3yfkM3Gxx1o8rDL3XbY3UnSUwPntgL42b0aDU22TB82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
	b=4py/63bbIyTBy1D/d/krSBcHRMmC4RTaWa9KaCC4NlyNahB+P1X5CwZu8AD9iur8M/cD
	 i6t4c4Ydyc0RcPu/GB3sqAgZqiZf66EzmnMczvZx4yDarDfPXJZBJKludMGsPRfB1pt4B
	 AmWKnu4gkKh7Cx2tkPYEWGOcUcOrr4srasT29unpKyoXN8rZxQk6qc64XAtdl7AOs04JT
	 NdTA9qCosYUPUie+DdVkCJGtG9e8tQ3nh8GncKdtRh/5VUXp3j1EMNP33F6clnLLp+voT
	 3/uu54mYV6aCQxNPM3YYGkM7vBk3dKeEVzjLZyN748hson3SG1EY+8JRryBDpWTICKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ndry3W6r;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89060A3820
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F89060A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ndry3W6r
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so807277f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008659; x=1793613459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=Ndry3W6rJwlQkm0OpM5a/QSIBufZvzAVg356DA5dT3bB3SDog3rU27rIi79dUswBYY
         ZOHDw1qGFiEjsuZtXrWeJzv0VmP8p7+SJ5GKVWy/2IM5UdKgrnrsZONBk3D63P0CWraf
         FBWyQ6dM2I6wQM2VKd5Kq5eZlqaz5FyEot882pyNigZqekG8ZmoaPEEaUvxDgBMKI1IW
         BzOcQaazPgjxhWeIk7Uyy7OmnNnnhM27DelsQjKL+e8NgA6vrxdJxV7apENKr3Af8Gsx
         l3usrq/aU0sjTD/FGCrfICrm92C63XFL5C/mbSjtybRNxSLvakDqkLdxixxvYa/Lk5th
         nG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008659; x=1793613459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=qPizJeFXl3HgNDhcMOjmYZ0nKIhY7tlnGhKRhCDFPZMOo37d3M8ym2SEmUt56AZFHy
         ZDE/ZxH3fUHt+7XRJXleaMYvvXKR+8onhOP3uIWTJwSINOCt/6vZQnCoUPttlExf3xUp
         dt6x0nR7ifN1Jm0RvX8Qd5lzzGBtEuA75ypISqSfUuCNTzBh6LLu5dLWlDAJSi4xXsMX
         Qkb4G7DJ5v3lvaeWfMtYVN/OW5Iws02Ira6ohaLjl/4SAxQShFq6XggZq9RBbYbUiIQF
         qdctSMWcJdVTQcqTZozPJpJRpNw4eY7bCOaOISfz8fEcSrRmS2mEu+WUoXlmqO2CfdWy
         rUmA==
X-Forwarded-Encrypted: i=1; AKwUvByAmFnot3XrVGohmQrkyko5qRds++pItMQp/PoiyxTodU0/t0v0mEDdTg84NndaysZQrrgI1cSCtTBWo8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+4+4/EC2fmzA5Skr0Hogs0DS9VsShSiZxh/g+/IOODTrvbIhs
	EewN6eX+PmUqlWfYECUg/PqJnjhhZSAJnB4KNJ8Z33pGOepHa0SmqlAS
X-Gm-Gg: AYBFou0TUJi1KjI6MmDNFUPCHZ7Hj3oygrbLpK705V9K4w1yLPKhGOYWXTBf+LvXlkd
	ZsgPq28A2BQ4s5+F4uxi2i6fLhjr9v19q71c50xqPDGnsprvT8SScOZnzFO+zZ5ri/BNIevjXET
	JheoaW4ARFaOUme4xHAmDdhzpS3IGiwHhaddX8QMcVpmwbHBQUo6B7PzKcDJLIeKZQQ413WQ2AG
	wgxAFFbwv0FEwikiCZN/zex7nHXLfxJfrnBEqZyBNQV6tmvBLQ0j+aMZfZeKmd1mwpeSo1ak3NL
	XuVLbtRgGqlTHzSUhrPQ8R9aKLCa4COlDQy2cEdmAGLLHDsorf5hhbITRA9n7QqnoDyYsQqkWDk
	WzamINliFEfowYjbCe02I+dypGCZx4OHO7AcdFidU3UYH0rEWABXwkirAj8KMq9bhIZb7K9CJja
	0uZFO88VDYoAZUW3PKPJh5uUeok6xN7a8kZKtraj+6RsmNJD84blw9a5xdWtdC8z2dAVsyh7beZ
	ilWZA4j1m3Wp5n97vp/MzDV1kS2w2eaCI0iaweMEGgwhXPQ+KbFCEAFB8++eGyZrfotUrV6pfXI
	DbNdkzCt6UoGq1TKeaU0C+FNqbvTPTAPDJ+Hwe4Yo8CJGXhnJlHePFhZFBJZGzQDSy+mxaoyc1J
	kBcOyVQ==
X-Received: by 2002:a05:600c:8184:b0:4a2:9cda:57b6 with SMTP id 5b1f17b1804b1-4a35aca71c3mr100497405e9.22.1793008658493;
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: airoha: en7581: add Chip-SCU accessor node
Date: Mon, 26 Oct 2026 10:57:09 +0100
Message-ID: <20261026095727.31708-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add Chip-SCU accessor node as a companion of the SCU node to permit
additional configuration for clock, MUX and thermal related registers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index c5a335086741..fbc5ee47523c 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -342,6 +342,11 @@ spi_nand: nand@0 {
 			};
 		};
 
+		chip_scu: syscon@1fa20000 {
+			compatible = "airoha,en7581-chip-scu", "syscon";
+			reg = <0x0 0x1fa20000 0x0 0x388>;
+		};
+
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
-- 
2.55.0


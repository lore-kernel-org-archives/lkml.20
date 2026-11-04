Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796085;
	b=MSzmt2fJqt3KNyNyZUjum3cmwU0dzDtDryCKT57b+aWKiUTgIpiSN2nfB4bEC36WNspC
	 bg3oJduJvsTWQXd219+CZ8X6S1CKdXDZ9QgbfmMAxAb2f2k+Jw7douAGpcsRR5VRwujnJ
	 VDs09/0PX57eafsrnc2ZiGslkCbDb8V7j5tHxCrzNWDmdQbLf5dhgU+XdRyyziC2XM7yg
	 ZVXcYLzt1wIeMTqY5HCRslOoaHO/BFZegtKmT5UJnJNi9JW9BaeqDhUm4y/v/hxb7E+Gx
	 c4HdjEciAROt6gXlyC2zje7y0Kl5MFpXrivf3C+hQm8mps/1yiUhsE5WQockIaGp9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
	b=HD2jMZ0duZLt3ILyPENYZYhQObv9Yylasqaem9acKM3lCfbLic19etUUNI8xwivQCN5j
	 OVi3i7okRvzjE6yy0SyVzrZn+AQ7FrwZb8IIbmxmoxYD8olizBhBVmM1AxPEC7YlLyKFD
	 ITcoTdz8dADO1fPTZW9nWMP4pmlHEWOr0+uLWU1YFuZeHotDEIv8Ocnko52ulJm4Ifv2f
	 tP+QEbldZqMln6vYFMZLcdHiHAY+bwqKz2VnlXX9+NA0RN3E6xCmwUfiT69WjseQ3iDfG
	 GI3WC+g0bypY/JslRhS362uDNuTPaflQFBAqcE03BiE9aghtJ6ZhnYq67ZfzRMBzl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED2A606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED2A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4793695e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796078; x=1794400878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=S2L77hlY3JFmZzFsMAsKB/5Efv9vC9OzccoH9cJ7Ezw2jZ0jFCFaXti/iQHmqhbrcW
         nwAbU3Z6Cajg92RSkOV9yVzNpWY7QjttNPQjhLfeYb9XmRWyI8o9rWoAfoqV7Ky3qT5j
         +L5QuHt5sijyOSKLYfjfCJaRJwL/a5oKRZT9vvpJgTrfSU9A8gaQHB1KMezWl2jFd6KG
         TxKMIM9S5L+b1lVdRcoiJ+yllC2IzK5JdCnngoGsRHLK+CJeBE2Pq9XCipPJ9oF1KlQH
         2lgc9lVTswJs+yPhXLyxyTTy/YfvbXh3EEpU2o6SFewPxwqAoWY61yFGHDIFLvHz+r2n
         /jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796078; x=1794400878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=U6oK3OZZTO0lTnGTzx0os0TsYd62pyRU6yCtvIobE2ZQM1G0szVFEa3EkD1QJbNstJ
         xAq8N3KWiyoPAkU2/jtus+1kADNRARLXBe4cXbP9j+vhL5JL5Uy06FWJ2R16IeAK31rd
         7p0Q2TQ8j8TIN4cVUeFmL/iy6DUxoeiGwMNRu2WDID3gPs/3YcstbziYKgfnKUi2oiTR
         O7ng0loeQCArkjphCB6Nj0luOSsuQyp1OtAH3oZmSh/pTdA00cNWk1LwzmoZEiD03/bh
         MIUqmEGXYZGKW6ZwvwfTecVA6cegCsuhcX3Nxz9AH3Y+5UOqLZP28b1JYpbrAqHad10r
         CEMA==
X-Forwarded-Encrypted: i=1; AKwUvBzsQnJ/11nZEO6oMYDUYfe+IrZM6RfjxBRL3YxjsOwXNVhjFoYRSOekBWyLQ9UCY6H3lOJbIkwhtLUeFgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DrRp/ZqzE1GvGW4xk7Q9QcC1yOWNl25gh8PMyaBjJ5VYWYvQq
	OdV0HTNPUkfKIZwRrK567HXLZE17FWRMYb9lMNSDAfp4nOVgcYTq3VN1
X-Gm-Gg: AYBFou0tGw/De7s4/kiPdUhXtSJDeqrBTnr6Ir90lrSyQLPFLYotTMv6hIZ+/FukCk1
	O/LDQJmGR3Ac94EWdEM3l8DRM0vcoZbD1fJMJhFQ9UteBFyA3YLKPrfn5DdVjwl3V1I5/hgrij6
	pX8Tyn8SJQajNrgkCrgdGG2GLMKTGpG8Wtb2PAgpFGAGZ9pbFecYls6g12ysHWIp31bw4LhADpK
	aU4jC/4Ti36VTpC0PQ0RvYQVmd+wTx5chY63zymMnHornR6brh2vSfbcO6nxCo3HGugYG70LMZD
	h9aap1sGg2jwpagJhcrkMMNp3JujjdTpCNB9y4dPhjFE2x7BaYxfQfMRkSFVWuQmHyZR1WcJVSG
	RnDO7BNYVGVeazsXo1qlTR+oyQ2AauFGYNPEDN5rz1VmHAs7t3MfLtRjIBpEyujsCmcujZmBkrJ
	ZZWC8V9HfUhv6L0VkJGrrpLhmbvjGP4yh/SMJnb4cq+H9R2VQqvzg7GhmBfGsu1PmAxI/V6sd3l
	nq8nBhBiYnuoL5bLjCPDusEQOcRPUhUTBLEUeLcuAWZ+2vgqwFHE1f/2IXCyU7FuB3EhlX043EB
	1tFwiHY2cT9MMzWkN0gKC/RcLvos07kCQsnrTsPb2REwFWC0Bg==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr363754215e9.24.1793796078321;
        Wed, 04 Nov 2026 04:41:18 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:17 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:55 +0200
Message-ID: <20261104124057.240288-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..f367c1ee0a947 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0


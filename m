Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9834A92FF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265962; cv=none; b=sBr7NvnRLleAPSyPI/oIaR7BKcbf8UNX1vfzN4Bdt9TVNTqbjcqFL/VTpt1fcsnriYm2sYSSj7rLlkAvkCwdYxHlhGT4lpZLV2e2Vgk0uWU5K3PpWXQnY8Gke0DvSYNAX8s9UImOoCxHkZEa1ErOgSmYwq0VHiLY1szX2RxYb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265962; c=relaxed/simple;
	bh=3/FB35Hu5fJEEgD/yBfAAnwDqio0JQJdSJzCduCvMyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y4/63IIFosK+98rMajHZrhrsOWlJBc2u8qEj8x+QfITE2kwj/S3m0gEe+gb5/Chqyngy2ujY2u2nfex7McsdkmTtDZDYoBOV0wydpZIcfTgoC4zWTAM3N/yCwqX+DAlYKki4EgVQ+HFyG+h7JxcyNhGxhwfj2NrK0ZvK4dEw6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=F+9B2JGw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="F+9B2JGw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48870973bddso451058f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790265956; x=1790870756; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wm09KZgtMDDuRCaDDlw1bVTO/lDdGx5khYMsZ7nf5Wc=;
        b=F+9B2JGw6NeW/19APcj6gavrZNn1VZ8WDIOPmZ107A/NSGv55xs5d9EffFjqNcyRqj
         LKewnSDlPYTGqEtgfsLCEYPvZL/azr/Gmi2BwWhCtsV69SrsE7cNHmSd7nYF6CvopuQz
         kDRrfa5jWutn9qxI6KRumw/qx9ON9dPv+lR4Q6pGh4VrXnon2/ZkybdXgDCNe+Ihbl1+
         FgV/oc0JqN94EvFnYgANH8i1cDu2d1ttpVIZ2xLw+eSS8kRuR4s2yw4CxnzjZM4OnT4N
         6jG1V+K36/kytXt4yW2Npuf3LwwSUEMteMIPEEAgOzlRmTjJH7t4ImhZsO3X7lywjuUk
         tnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265956; x=1790870756;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wm09KZgtMDDuRCaDDlw1bVTO/lDdGx5khYMsZ7nf5Wc=;
        b=Vhk64b7gJd9NkLmrMjmEjhqjcq5iMeuLqDIa6wxRH/zbFPBd+29Am9SOGNyiV5qTg2
         pMpN0R73P77Y9ihDFQArk+1hyqxV3y+eBv7v17PZIQiBe8yHib1GWOgmHs96RMqjInUQ
         dc2qO2CehruaCJ9k0hFPwlYE1/PNzb1SMIIIcB65zrl/va27+9ISiX7A0lyat8a1WTcQ
         IELi62YIvISTuh7sexENlYeqEwZs/YcR5WNX145s+ZkX60Y6swj/lWJAkkXb4vNEJKmA
         KmH3R0mQnDxWyFylwZ2nS17PZMZxGslesExIkRnLmFuiT584FccGMmsN2q/Gq5aNTz/y
         AZXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwroRpnhyBI24u6+nRr5pax0L04+BdSmWGlNt2XUBSAKfS+dMqhf7rWUd26IRG7gnDA3U1VVsm7egO9tIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kqow9DvNHVB1sCA91oK40v4fAUVwkKpkfmQ9yFE4TaX6M7exvn
	WST4PIzADPStdQ2K8tmWFYNFalZMRZVcfd0hYqmCIleUgotZQll5GPhxB5/sOOvGH9w=
X-Gm-Gg: AYBFou0t5mAofdeZ24hONJeYGgKnLXCUpu40jKn3eJYKWc0S4mSRGJDVes5OI0AOZLv
	6ESf2kNkVv4S9vqoiImpEN3sTGJXrYAMEl8b4cmBRrzSwFLHwOhhVwQgaoByKSOaR6CE93bvjbx
	XN/XkY8kNPhbU8smuTabi8ib+UhqzOX01Lz78ewdIjeVy65qiBDZKbgMHh1/0kcLv+8ayGrV057
	7Yzm47QuBZhebwhRYkMb/X804Rv8n7g0JY4As3CQsqF0NCsCxayQFdJV4re9mcWWCcZCmCOCTE1
	VQufKseGkopPzP0o/RhBwWGi8YzLeOFB11+mdAMmm+htBimxEhmJf1xkb3L5K5Wr0UBMX0O1q1s
	Nf7uScJRF6AtdX9Mcn7hPNOwLEbe7uckMpdNjdvrE0W3zy/N6hFyYY1F9qVUu7oAxA33HSYl8BP
	84sVpGvLCNFmJzP/SPwbMYDcvqRC0h07XnTCqDnmsLJC+3u0MNRCGEV6etpFa9ubCmF0mpGNUuz
	v2z9X6C0wLc+jHSvA==
X-Received: by 2002:a05:6000:2083:b0:487:342:eb28 with SMTP id ffacd0b85a97d-488716f2354mr5536245f8f.24.1790265956591;
        Thu, 24 Sep 2026 09:05:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a314sm57278f8f.6.2026.09.24.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:05:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Sep 2026 18:05:50 +0200
Subject: [PATCH v2] dt-bindings: i2c: mv64xxx: Add Allwinner A733
 compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-allwinner-a733-i2c-compatible-v2-1-0f5f1e9af969@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBQAr2K69pl++BRX3sO4aMtDnoFCWkQN4
 e4WXbh0OclkZmERA2Fkx93CAs4UafAJ5H7HXGv8FYHqxExyWfBKcDBd9yDvMYAplQKSDtzQj2Y
 i2yFIrZWWQvMKHUuNMWBDz0//fPlyvNsbummLbkYThh6mNqD5fUpe/vnMAgTkRaEynmfS1vXJm
 ldHNuAhWWxd36SP4JTZAAAA
X-Change-ID: 20260910-allwinner-a733-i2c-compatible-2883821809ec
To: Chen-Yu Tsai <wens@kernel.org>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3/FB35Hu5fJEEgD/yBfAAnwDqio0JQJdSJzCduCvMyY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbvZLEvbbuS573+cXazpNcRs3727Jq9WuvrUlsuc5vP
 GnLHkHzjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEwkmpnhD5ehIO+29na1ioXR
 63k5HTw2v71i8Pl26+GTAhOfZcwrPghUwbUw1KmsP3f/qr7Hzytu9q6t1HhuVLBFL95OeZtoRQQ
 DAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The I2C controller IP used in the Allwinner A733 SoC is
compatible with the ones used in the other recent Allwinner SoCs.

Add the A733 specific compatible string to the list of existing names
falling back to the allwinner,sun8i-v536-i2c string.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This was tested on the Raxda A7A while enabling the AXP318 PMIC on S-TWI0

Changes in v2:
- Collect Conor's trailer.
- Cc linux-sunxi (not matched by MAINTAINERS/b4 by default)
- Link to v1: https://patch.msgid.link/20260707-allwinner-a733-i2c-compatible-v1-1-566340542bdd@baylibre.com
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..2a9e723a724f 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
               - allwinner,sun55i-a523-i2c
+              - allwinner,sun60i-a733-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260910-allwinner-a733-i2c-compatible-2883821809ec

Best regards,
--  
Jerome


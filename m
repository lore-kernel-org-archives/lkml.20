Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A08563FDD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000244; cv=none; b=ZFH4XhS8PZk4xCSL+YMeAksfA8PR24iRA+y/NsCpKc+FdM1XDcdRS+daTGFi1OS+ZN0SsiP8WwnrGRsRdrEBFbO9bI8/BxFhHppKCfbKjOFLgu2TePuxPRGwM3C17oVLbcVQVDGuKDE9DV9MHLGxj1N1NlzyrgodLB03tOAodRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000244; c=relaxed/simple;
	bh=wNHc1TVX9sLdgDlURVwlHfFyDA+suFjfxqcNteo3u0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVrgHICadwJR8455oR2a6g98ILsutkAIEb+koouBLl3BbaLofuZdaUvhWNOcIxS3+v9YgHXuAr2xjB9PB4U+llxjtu4yRH2nII27G7TUwCZwj/m5sN3W7w2Exg+3bVfHuETBLtsURHCKtxfnuHCPJyHz/tGhieCqjmfovTcOnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFz4dKVd; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFz4dKVd"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so1755237a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000242; x=1792605042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=XFz4dKVdU+siE6vnkJ/ggBPB4FNRvnDy0dWilLdet/jGHl9baBZPq9lngFEGroxbmz
         IZn+/vPyTPFoJ/kLoKBkRz6Kn4GmvhW/CiUYJ7mpIena1WMoPFV3GKwWQkw+abXJATIY
         Im2xjV9Zo9h4GgjF6l8iQETKFvFTAvZziaR+OytckvqaRho8nBZkLgOUV7UDThBu4pRy
         ThST6z5I+L3UzRd8mWpSEb025rpb4HidWAhjgtKGrPj6ABolJLwsvRh4Y/59wK/EROw4
         6e+p6Kr3kYB/p7nPR5iLjmDtQKkpnRHyf6H3uuZ/WQ9KPodNk1Rh/q8zYE+21dm+Wrem
         e7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000242; x=1792605042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=I4WC84mnfIjSyujsDghQJJ9C+M8LZDz3+0opKarMh6YkXVMijpi4aqu1VVOw4rzZ9i
         oJCql5LBxfx4MJsMZ6c5/YfBJTZP+w272IPs8dYlc+QapwzkBoJJ0k4kky29g4eQayqY
         wATj0uC22Bw7+KK7XfkzxsRBOtyBHx9nKipfYpBUKHwb7sGrAAdMny6Jcb8+BD4x/jj7
         8PGfVE9ZqcAs33+9oQyBicniIcQylgnTFCz3HpHFHNChuYj2D+yZZQ1gog0tQ52LhC2s
         fGKK5KQyda/qNf8k0FkOwH2ViAkkyy523kjIn43hUldDOZkD/Uw61upoYBlSbuo51xlB
         rshA==
X-Forwarded-Encrypted: i=1; AKwUvBzRdZKXcpLs1zQ/mR1yfxpE8ZexX9x77dgcH9g7wO05cMR2wqxX/vvZL9Ca8Fr1WzGnnL1jMaT91DRxlzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX6RKtkKK81Bzo+RwM2cA+7KHuoDCCXvNb7yllUJFYvK5pXU/n
	xh/BgzemNO4y0XfcLMWo8osVVwQ/3jyh13i2q5iR3lHx0Y9uqPsvR7zf
X-Gm-Gg: AYBFou2k0HvE2lg7JaYhh8MCX2wR3TecKEAzylMDIR7hidGk7BRNd0x93LHcKqJrMhE
	AUWLQ0AJu9L7wkaeloRc2JA3PThWqfmev93uHncUEiaO9YbGsP9tgOg1y5qWd5Q1ppbeFyGCMNe
	RYBqs1qyajW4GctzNcwTcNzgxthpy2MDNSqE0DOJ+C1Vl8nX7PUbUmsuxb8o6DYa+iXmkLH5yEj
	1uLIblaZx+LPpkV0DAEnN2eT31RvtiG18Vry5gdFxFJ4NUB8E/beF8nApVPuGPqdsct4Krr+w1g
	8gyDCvwBUyLu9P8lsF0ezhcfeB/8HzbJtrIYu+o0RXGhZLpPfajK+peL7GyrXOX431FSKZOIzVg
	USiZyQuIdQaqPyYpJt1KqsIIJDjT0RcWRzI3fmcA63oa7gDnoNqU1V0Wys5YKTsxFA37CC418+D
	z/kwbNWX0MgA68IC+iwVZQhWl4zVO+YCMQtHJHHtB3+O6JtODf3Y9K9vm6WNINPGroOAwAYGJaz
	FwaXdmjzjEmrnCB69gS
X-Received: by 2002:a17:90a:d44b:b0:3ab:365f:ebdd with SMTP id 98e67ed59e1d1-3ab3ad2029bmr13240853a91.37.1792000242195;
        Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:41 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:19 +0800
Message-ID: <20261014175020.62907-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Collect Conor's Acked-by

Changes in v2:
  - Use 'alinx,edgeboard-fz3a' instead of 'ebdee,edgeboard-fz3a'
    (Krzysztof Kozlowski)

 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.56.0


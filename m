Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4488547887B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799790; cv=none; b=WnyP0OFA+8vLiUlO036Ws+kvZTk1RUdeEb0wunU3dMomsXLG8ou1OSNsZKHFyqctXkaQOsepHWDqLiTvqBD/U7OTltwRuG4ib+aBA8HSQf+4NgsZrSbLTFHQg7k2dkjzPQpn603rFTMVcTVvEJcXFmO6AzN6lGaWrqWb4jXCfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799790; c=relaxed/simple;
	bh=lqFyZF/H6AwrrMe7UJI3gtjvDDPQczserSqPhG0tCVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKK0ZMfn2631g3xTJtU+7N2NB4xRmPWi6xdWZVBZ3qhjmn2n35BViU2UCXwumhNEUi547P0M1eY2tBvi3tHbwCo9EAOOy4rzKJ3SzhSLCvDhgwZ026J8QLvHF2klaJuSAsqn+JfnzMHGD2OuMtNz8TIUWAF52jt9qypW7CHTYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmq/V/aM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmq/V/aM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso11246405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799777; x=1792404577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=Tmq/V/aM/h0Pl3GQ3Ck7W/bxyq36UrnhH0snINqjcZOO78hpJcvxRNEBBebxMsHDXj
         oM0knIxF1Vda1z9SgUpmhVpKP7qSz5fcywFWj9p9gmAHP58DhXoTaQ/H9B6tcLVJ5sI4
         AfT+hCNuJJ1Mpq0Aj4+twBmX0rU3NZKMJsdbYbGY2X8cppevI6GuAOeuU2mb7BG7fpb8
         atDf1Op1uCBsMXDI950RNmIcdAbrQn8F5/4zbGRE2EY03wqFqy99VNnraj2efyYxDHLV
         HKkW0rsbUuznCpBQVvfLco83NT++ij2WLXxhDy+/L4IAf+PwTZluqY+iefzqvIUb8rOS
         GH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799777; x=1792404577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=IMx13Ouf2oeZin/BJSKQjG/iGDHu5oxLZ/fo8YoYt3LNnG1ZkgMQtyYXdgLu+Vm69b
         7XH+YgnFkS3sFLaJAC49Czst7EcegQJyrrxAzqPHlIgkycZrpKAOg7CrYTeNIIHecV5Z
         ec7qZhyhJgxns8Op2H+XAe5rcJckPmhir+y7fPIZQ75hJctO12J8cmgeSvSXqe61YiTD
         3jLlV8H4SrpVg3oIDIjYVLpLzqIx6a1PN5dKTd0jjChjcm4HMdX3ZFYK4x1TeYGZ1/85
         hthy/dKBhtWSmYOS0Rnl8i7du5hOrvT1P4texWTB9mAsLagWCRBFNE0IGS5DepSWdzTN
         q2vw==
X-Forwarded-Encrypted: i=1; AKwUvBzieTwMHBQc0CA+O0eQcB67hQ70L2ssI7O/g/sBrGFQDjEl6Gncrexxn5GWzXFlxdiRVwet+N3T7IEhQMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK60EPWmSC0vOpnDO4x5BTNMpHWfOIF8lvqg2r/Rj6w1Vd+q1pO
	2dx9H+NvsIPavWgaQeWEQvxGBfyc4x3v2Gv3tRSrteNwMUBhPdVTE+WW
X-Gm-Gg: AYBFou0d9Rmeqx9khda+y4GE07NdMU4qbNlzDGEy1FXyczpuGLs8APyfblH4u16Rm1R
	p9JoOpbz+WIYcT5xwhtQ7IPWF22YW6jkQPEwbhY+iYEA67vrJEJ31ff1T/RPLgjCOWz6/K1lLHn
	DS06hN2HJaKtpkfKgOWSZDA77o+GxS//QkUQvN4eX+irMzJ8G9kstBSEaEL+AGVvJlaIjgl5+Kg
	1bXNNHzuN6CPfaGXqLSsJ4ZYL9QXRxc8geVHksxgF9fFvNiQD1fChYZebopFdGxmrzbQkxmQhYX
	JN9l/divLKDc9hxLQ9AW2PfspxtwMKZDgiDw3TehOOFxMJjBU/4363sQp1qhJkOW9PUFF5oXm50
	F4R2ZtR3N5fdl3Gimqb2eniI1MLgwj6iOsr5amGCAQGsgFys+HYZ3NRt8m9BtwJ3sPs2BNNNTmd
	del6zFjCiB2ASU+bwnMdri9bx3g3LAtJzjvQXjJuUCOoPjvXhMBT9WYzCVHZV7eXECNTgkCvEA8
	n8IvbeMFcHKodxDWR/CeWFFQ3BCbZMP
X-Received: by 2002:a05:600c:6290:b0:4a1:813f:2a61 with SMTP id 5b1f17b1804b1-4a18e4ad518mr163049805e9.15.1791799777253;
        Mon, 12 Oct 2026 03:09:37 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:10 +0100
Message-ID: <20261012100816.331033-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0


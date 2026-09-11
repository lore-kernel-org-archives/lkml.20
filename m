Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB536A340
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139289; cv=none; b=SjpAdMRz8SYWSOmgtnfsjAbcES7bgOnlqG8im34/q+TjMOTpU5A7VzcTOmSaZDMtw0ta64kGwRQA2KtqqMVEMd3h2Q/IAsXY0w/LiQ/UNd1hyyJSwc5SfDGs2Dno7GtAZ5RZmoSm1inK8/Qdi5mFVD1SsmzxMeca34tIcui/29M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139289; c=relaxed/simple;
	bh=juxoCJMQ0e93UE40/KJy++lXxIyfrr6e1IzYuMzaAgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6kcZK1WKPcK3SQGdGagZoMk0aEpNKfF16eT9CzIRJLZlEWpGKbwwE+q2w/GER8GHOdqq1SSFYDeQ0MRSxFL9Z52sLBoZAGlAX6gUlDYxovl6ed/meBT5t091ZZEkNyyjyDuGGazf9zqxk22U6ty635BZI00/9gwtetAJU1EFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ipNv4p0s; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ipNv4p0s"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e6697179cso2876775e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139286; x=1789744086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyfOjlYquJubXiCtjjVH2sltdfeny+eTcGS4jxiwlQs=;
        b=ipNv4p0sCq15xM6dAN3yFwBUcpoTY5eRzktfUW5xFeDq35rHrrqLGhLF6XmihytQyn
         HvxCxmfLxpcIq0DrMs+8/8ZLKXbI1vmY56Izk78iPXdvx773RtBdtHegNvs3BYoJDNeu
         BRrV718IcCBc67Gcbhj3SshnPC71qpqrW8zsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139286; x=1789744086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyfOjlYquJubXiCtjjVH2sltdfeny+eTcGS4jxiwlQs=;
        b=DHpDOVrSNZjoz4ETdX4JpaUeIuGl1eF9gC9hRMQnzXK3WYQPhnsbGfkJrZOnlKurNO
         gdK8lpVhCl9ujvwPT74UksALDHKm6n6/JPHGDTjnvKmJhWlmsL6nbb/ggRKuZ4HyUFNn
         599DSIQNQw10FCPAn56JQv1rNdEIXW8sdn93/MUvYfaJ96YJcEs/H2k5TS+/kebbPkUJ
         2xQjezoxnhHYdiq0azAbqiGYVgBqHGmAM5kkZ67RQvp2Jyq2B313N7nbRApELYDkoQo9
         gGRMLWmDF0UOh/UOnwIxiYhHal2WllBPeucAx3P9BjVFyxfQU4tzzK+TJMbwRHMpFM91
         xRBg==
X-Gm-Message-State: AFuF++lqzghi69a4cfgkwxeBJJYmbx/9vrJjj4mXAInL29kqjRJTlUUX
	+RbSbFi+4rSVq0PMoYR0bx+haCInVqX34dMPerXGt0YAzJq+S3hsODXsnL/fHtxPCVJjxJSFpNd
	EFndW
X-Gm-Gg: AYBFou3aCkvcKnXM1Nh+F++LXxJZfWiv6gvhvGlSsxjVJFBEpx7nShb55A/cqedKaLO
	h4v9YmfSSDqlwkNum6moLtezY/HnAA3O71dIUOanxXfy7w0b2tCvYzSsjgt1N4zmlBLc1EtTDDf
	qJwe8QwpRsLYKQpAlnbLE9wWiEF2k3CD5I4m6lyIWeif2uUPRrhLqhHbDE3F2omLbJP0RoTcJSz
	vD1q+LTUPNbzugWiTcTKLMZALgeYj7cSSpEYxgUolese0O2mUtSsrify6b1U9lQ43bPKrZbCr31
	lujOkTCBOMCokBUAL2xqKpTivsXMMSy93eKDjORVhQBX59EwowPGAjSODIM9dC2sS83DaDfM+sY
	izWOJt2U0eoEsMAtvim6T3EBSXizL9YOLAHP+ilpEqbW2KwqxMJCEMGKu11lU5Ze7ZEXdnyQv2a
	7SpXbzD8G6lg884wI41XxNMWWc5EEtiNjqndcz2fKW2OVWnqfSUpBGFhdUOJ7zHLy0R2CY7EZGT
	NFxrpQvVvaYQ+Ds
X-Received: by 2002:a05:600d:640e:20b0:49e:6777:da79 with SMTP id 5b1f17b1804b1-49e6777dc38mr18981725e9.26.1789139286298;
        Fri, 11 Sep 2026 08:08:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Fri, 11 Sep 2026 18:07:53 +0300
Message-ID: <20260911150755.2803736-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911150755.2803736-1-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
based board.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3


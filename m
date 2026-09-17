Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFC54B1BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662728; cv=none; b=A4sWOmSWVySakfMviSDMRJaQiCPx+VnvKbho08muIJ50hs7ks119Ned4sMcSr4NozB5pJCsQxDiOmhWwhREU1h1p+LTPlVn9WgnstNkgNptdXO1S5aTYD1/HGTef3KvkqsxfYweshRTDYsQJzq6ggbvvFBbCz4wjLfTl5KCFdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662728; c=relaxed/simple;
	bh=sUCV3PJZHQDL3sJ0m0pd8ASDLg923Kkb0J3Ym09STSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YB3NY/UiM82aqiSLdfQ6CjzLaH1kXkHIa98D+ZyFR0hOo/mgLddz6PQ/y0r4vLxSA3OVngxsoJNvYPH70JiyB5lR/lfsQ1HEvpBYyUGv1C5NKQ4W49eweQhk+Toau/vIzVOlJRfUIjanxBVW3y56krBI3o2J1PCPd794nbfN2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CL64pN0z; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CL64pN0z"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so720248f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789662725; x=1790267525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeYLsnxGAnR3sREUzabrC9c2x10xNSrFuy5WEeiGuV0=;
        b=CL64pN0zkOjeEIYGUy9n8XSu4TkM2EykbOLlgO1GrYjagGcBs+JUAUbKhXtPArJSJK
         lLxjz3JMw+YUYld+Lgkm+ILsn/XyveQtOEelqL2DdK26zfq4cWpouDGvFBsEjzFwzs13
         A+6q2fdHrijidEWNyxQe2A1O4VSzAt/rAKOxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662725; x=1790267525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qeYLsnxGAnR3sREUzabrC9c2x10xNSrFuy5WEeiGuV0=;
        b=heBLLHYe5TrnoevX+MLjAFLxYm3S8mxLiO3caOdTxTpFn2uqvDH8yuuBY1r547nHFI
         2OZHC7HgrKa2d46Z7MeH2Jcr+fr2OWYeMmgXtYQN5E5Pkx/1wliF+a2yjCikMyUBpW2n
         LG/6yboP3eF22Tb1q01P5tRp0Y6MHH2WvBOZKqR7IvkKyqcYUt5BarrAHhZ5gFz8SnF5
         m80IKiJiyy/gmRI/+eHE4lMSgUBwaw6qTnBFkM0kv49aY4q11SDHXRpot7978z8D2HWr
         2kF7azBsx2lMRa5mfAKO9wbtINDmneTGf6lewIb9qTLfvy50sESit+WAARXtLgJ04d/A
         +GIA==
X-Gm-Message-State: AFuF++ntxpp627FJ0AMGW3kZUQtwu4wwyyWDrMg/tRVdf28YvNBbbGFo
	a6aLIqXnkCT+b/4sgtgy3CycHYN9RgOKwBqWMbSpQPjcM3shnTNBXUnYtWlLipYGY25zYT4jDeT
	YWMct
X-Gm-Gg: AYBFou2GnMLKegENNGVpScoQBCYmDfBy6A3tGJiYhlzoA3FMsucOyA+dVPIZsBKZHKJ
	X+CFeKHqRHac5bDPVGwxI8lMVMe8pJG2J8BB94iF6i9OUUPFw2GLJ2zcg4YCxaoIKWiLOaVvq/B
	PrDwm1gIhHFOpYd23qwq4Ox2z5DbPXV4vZaHT16Czr6prDiEkZD1Z/qNlZcK7Yau6kADakUWPva
	XAGg33CgG2ymrJOZwrtZgUuXF+zIX/jCfhQdEatu3YDSyTQgY/nivazZ2iv3fdJghr2wQ8+P6eO
	S/rhMIIrTfkcapxw0+tAchRpybd/K6WxgqfLUMnXFBKtIvZT3Sj+yT6Tys0vdNN+qCGOenand9t
	IXMiii51+PD5sbZGMpWSB603Y6Jyyu9F9XQZuPY53KWPZ0odmpG1oNxNWfFAATP8/YeQZz5VUDV
	iig7StkC9cPUz3bfiR3ceXinFdkpSJqLk6Rmk5ppeRIotnlqjOyWnI89AQi1Pk8CWIhr2AVdUyv
	Ib4X1ZogQR2c2X5rDVDcSI6834=
X-Received: by 2002:a05:6000:220b:b0:487:863:253d with SMTP id ffacd0b85a97d-4870d0667d8mr9722274f8f.31.1789662724767;
        Thu, 17 Sep 2026 09:32:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16842652f8f.35.2026.09.17.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:32:04 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Thu, 17 Sep 2026 19:31:55 +0300
Message-ID: <20260917163157.1380860-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163157.1380860-1-petko.manolov@konsulko.com>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module that is also
based on Altera SoCFPGA.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e1e4bba248ad 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3


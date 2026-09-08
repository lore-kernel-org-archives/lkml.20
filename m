Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86753ECF7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872884; cv=none; b=Qs1YdYOYTDKCToTu/27S2DAcKfgDOTlFqJAr+6KiUCfvceWY+n1Mh68xO3pZsmvKpW/7hz+Jt7CdSZIREibFNV5LHC1mt8tYkhGxTXyszl/3h/QFw+uMpxxSe9Xx3RWfhQ6VcaqHUHUbgs1vfdFOIDsa6gxrbBrNlAFU+tOszgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872884; c=relaxed/simple;
	bh=gkkTYq1OpW1LdtRjfwsi/bJV0O2wt9hs+XlnNEqqaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM60vdE8Bp3bj+9PQxyLwxpfhjiuNPgsn7nm8+sbvr7/69qJiCMvdwnVG19Rpv36MdolBrLr0Xo9eWB34elIs/9Z1xCNBH2d+nMyDn7MyhrxCKmDVFYDpkdermlgBrtiGtEbP0+HRSzIHwIV+2vyN2aVmw6HdtPrOR05mYrMiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQaVp+R8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQaVp+R8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cbac3so2978195f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872880; x=1789477680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=CQaVp+R8OR9mHUoeuDZWeZcJtaGV4ThWXqnYEbTTZ/oFshajW6hgPxOEbDM/pA5BD0
         yVe92J/YOBdj8RfxtlAo5PAb0YTawx9Ey5J88LWqO6iEQqWKMSa0oBIiFfXJgP1ZryDy
         QXVywcHGv5IGcFcQkMhIkYI8iqbOq4mo8IIsy2TZ+r95RfOpcfQR1j0a2YvrqOHhZ9g9
         05/hg+IBK74GO3lPRuLewoKSQpxBpRhDWDCap/TvaeVBbW1r2sO1Jw5foLAY/P8HdbPL
         RmYofswyjiPrMPe9AWhGv/Apb/gCT+Zd1EA3BhDp6Kj4Q1USlYGauAyRcqNnvEqVvkqM
         pYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872880; x=1789477680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=ea8VJfPfOLDM26x3yQ621R3BZZrpKNJ0PtwOV+KXdsd4wOSPdOUdb+TdLTX3pb6C0K
         Gwu+yAIl/QwlXikEgGYe/p1ezzmniMr/7HZjEBax7/dhqvlrgSGibw9NOLNt0DWOwy6N
         NZAMmbUQAvyxwPA785cIbYLaDcvXuZUYEvL3ookcODOpWXPQ1Un/G2/ObrypkPnYUqrq
         rNs4BJw6hrIdfQHWYjcVRYlwaPPB8Ogdm86etnYZ1Mhe7hY8Ui/Qd7kyU7zZ1fpP5B4k
         sNhrew6EITrcbvFYDNj+xvpOuhuPqdpXMuyJeCa9L0JMpoioEy1wvmooAVMftFDtSoq2
         XBTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6snoGKi7Fa2s+cyM5EuRd0M/8BqlW5BvbuQ0pDEPKvHx8n70bU76Xf6uC8rgRy0wuQSycJ2vt7b5A/G0=@vger.kernel.org
X-Gm-Message-State: AFuF++kM/azfRqo/jWkFRER+n1qfBaKc0McwXrKBNIV9MtASe1F+ZnV8
	vfQVQgV5dOOE1EOSY3PdqJ/7/kZbiXJA34tyb656mJFxiPTFD8QfJ/pT
X-Gm-Gg: AYBFou0wDZ3qDOIFhdFv5feX1jbf1lyRb/Isd+FGJI4BEUfP98D2JBI9MZf3vVm/5sF
	4OkGNJHT4zw80tnhc/yE2bh8+/eF+bqJjFQoeNNRdD5X8Ak/BsMAYRlWcqtnt2NHhFmUUE6QDsb
	VaMZT5kvZSIPJ+ulwfIx75g3AlTu/jcQcHR2iaJC4O4NYqTlDaLbWuv1O4kTYvElCfnWjISJ/VZ
	YF7FiDirMoGOdBQaUoE8kYzI9cOHwP0rFVuCV+rzSRa/gyIlsWKU8QU4QB6Oql3p8D3s9eu6A2n
	WtLL1QYNfl6Q1VI4p+n14k8PjEapGGqLhauQLzc2rF6CuoK7gDh1I/kwiYr9pvEIfqNvSvyqfUT
	MKLsVssK5GthMqNqqzgaOQ4hcmS9jEidIYANXpeWu+5dcB9xjj+Qpd71jKkJgA94WehdkTuHLam
	ARQ2YF9ol+yGzHPqVxfWVyR9U/sYXyy6UbC4P5YKiIzfFCArB1mkDagAFE2bZhLiP5k5W2eaNFw
	XBbJUADF2P/3crFFfbnHLSQWZEcSHlrtrmfCtq4VvM=
X-Received: by 2002:a05:6000:610:b0:485:82bf:8728 with SMTP id ffacd0b85a97d-48586e32b7amr34058783f8f.0.1788872880038;
        Tue, 08 Sep 2026 06:08:00 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
Date: Tue,  8 Sep 2026 15:07:44 +0200
Message-ID: <20260908130745.2545-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8008 raises an interrupt for its own status, its temperature alarm
and its two GPIOs, but the pin does not have to be routed. On the Lenovo
Yoga Slim 7x Gen 11 it is not: the platform firmware describes the PMIC
with an I2C connection and nothing else, and the vendor driver talks to it
purely over I2C.

Drop interrupts from the required list, along with interrupt-controller
and #interrupt-cells, which cannot work without it. Add a dependency so
that a node claiming to be an interrupt controller still has to say where
its own interrupt comes from.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..db1592e115e8 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -88,7 +88,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -97,10 +96,12 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependentRequired:
+  interrupt-controller: [ interrupts ]
+  "#interrupt-cells": [ interrupts ]
+
 additionalProperties: false
 
 examples:
-- 
2.55.0


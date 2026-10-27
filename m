Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123496;
	b=VEHyVLc3N35266EmJ4zuHB7srX78S+sS7nCTagFapu9kFktm9tX6y8WYSiCMa1BOEBZp
	 K2np46nYH9+38iEHedo28L5lHL53r2na/+nA0MIn8LB17s9GydhtssRwF0JdioMQm8BhU
	 7hT13OUojBFoMTfZcsrhDOfgEmb32Hx+kKugn2wT4/EqaaIDLO9Yk8eHnjBz7Nsz92GYp
	 hRHxGIn9hzKEDsznoCX6n+eBksZXIGUjmbgYn9mEhuua0A/ZlYnCMO/sVW956CacOY9va
	 rQNLEAEjLQIeXhvd4Zo/D0iPQ5l8avzygarBFp4LVWNRoZc1Bxgrx1/A+aMNJJ8VyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123496;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=Kn5t7sUvt83bZpVMDPUz7CFOYCvtUcv+/axdUrqQepS8f32qLTD/4ahwkyyw1oHs/wT2
	 DtBFmPFq+ys5l3ND0MEMErqMU1/EB6XVEKF40jaCSmGT1qb2vvJJfrUQkpGkcemVCnt4W
	 iNHFe3e0sPgSzh/B4ZpGWuUXuw+M108oMCteQKZhxcix2eWZpOs+ELCSIT6/u0gS62ze5
	 jFixAy7ZSd/18d1NHyLcsHhN5i9aKNQH93zvPhQKHtmkCEuVzQmWizgWIJjHT3OGWkkvG
	 ksOdHZqhVl5k3dAduovtZMnyzZ3YChZY2S720quVVIjZp4weGdHEV+e87K595WoF6IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EhVdczYe;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE23D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EhVdczYe
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so77784a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123495; x=1793728295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=jrIri/bU673Wg8zY5CWUUO05TQILSk1wWS3gIIwAcjQH+6sEQkrSuXgPzpiZF7GZsY
         zo6OjajIKtCJIxkCqcu8aTOqjBe0CCmB4NCldletSPlKgeKdR2HV6uJlfApHasaqyGwu
         OPCqOjeDWjqT1QZy/3fjO17lmHBUGDxjh9vhApZT9UevsQVLX5ql3nMSY+/2A6PinMlf
         vgLe/sp+mIVkMPZ0zaEZkdh2+cu3EUHif5Z229UaYKm41JWabzLpY+qDt7HSMgaRVww7
         VCe8Lz+CFRpGsVlAYzA+J5tFZIwfZC/B8xxMcbyLgOwLdcbfv8cjJuZttSmi7bjf0aoV
         Igwg==
X-Gm-Message-State: AFq9FYKVptCXDY6OlotSjK4rLagPN1boS8s6PS38J2MJfrrCStXu7Kx4
	SLiMEh/M0G+8qf3QsfJgEH9sJl0DgLE4KsY74iMYwADFU0uFIbB0WFJKuOZR7qIviSP6Wz/GYeo
	WpFA+c3z09Toc4eBjaCMG1ax1tnnIBX7zJxsU86x+rnfF9Y4cgyNk7mnxuHp/KvuijlTEXzGkyf
	5gZOSemkoZm8mw1Nzx6eDZyhX5W3wz9YKXpD8XFyVfFhzeMCGBhYVek1VCfu54eS0rGK4kZI7LG
	el/O3oJywBzQpfO9d1LSvWM2MQ=
X-Gm-Gg: AYBFou2OZjH/DAy/B4HmV9bkWbExAegjtvEPn/Ojuu2W9v36LuLzOYf0H3sEKnzP7ys
	fLNdzlB7aqodBp/pomc8COoZEna7IpiV2i/Umv+8wkZhW0fBHWhE3UCuplplE/UEc8q/4fZj01u
	XoR5wivLik0WPeEximOpLZeErhvRMSQztccnbfVUf/7idMl3TDMZEjpL1KK3F7GcSMS+UybSG/P
	4rk4rMUJNGmpzbD6Xth1buy0wC8Ik7q1ttvRyhu9vmCifzVw/q0uLDPIxzxyMKvtTdyBW+eRkul
	iSsfUpxnm3CP3DdiVjxGxgIm6IaA7avxoZgP3RpsiGlPxWQcdXKVAUZj4Xvzdfz5AdXl/mcOCw1
	G48IimeN/gm/Kzi3jXOIK4auf/+zLWXgmrU4KpQoFZOfMUxaAKjbx4f/BUju6sIV4ni5OyOR7sS
	iAg85Ju2irTjKWS64I4x/gYDyFziJ4mLsZKbjZDYa/
X-Received: by 2002:a17:90b:2cd0:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3adea89910fmr7652860a91.15.1793123495067;
        Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f13ecsm2598695a91.4.2026.10.27.10.51.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337ed1ba44so4869621cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123494; x=1793728294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=EhVdczYeKTFG3+in+4kg8a47dMGgAeDJxQMioQuIGt1qhR2pU7PK+DawqdcLSWi+2G
         ejwciU5ZiHxHCmJ2Ky0cmm6EA0W+MAopPNvofSqxYzComJzljvWJPe36CE/ORI4lOPOm
         d3s9I4BVMMLleGpyLgWqEqJG7ma1g+6PnCHvA=
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr22541cf.48.1793123493693;
        Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr21461cf.48.1793123492818;
        Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Tue, 27 Oct 2026 10:51:22 -0700
Message-ID: <20261027175124.3518239-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0


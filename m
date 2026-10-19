Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CF3164C7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391480; cv=none; b=XmoOxMGWLc9wBlG4wgs2T2bicXn/n6ZPIh6IbL5DFPQpXI+T1DcIbYoqRkacrAFCOwexeH8xRYp/3U5vk5jWZc4nR8yS2a8EH5aq+X/Bw9R3ingEMlA83RYG3MWGg0ChL84KfLWqqtFHQtcqwQH2bcKZIIG8C8hVA8FJIZrOFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391480; c=relaxed/simple;
	bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ODlMCUWJ8XYWdZmJAecgcij/kNGWmu0yvZRHeR9OBba3QaRn0QcyxN9H8DgvyLpmBk/gV+0AKLvf3IbwCO3Ly9kEiGpzI0pQRWn8DQjVnzA7PP1KhizltvvOJpWFdsnRvON0Ce51ruN6wclOOHVyvcSibOvPVEg1q8dixGWMKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gB2mun92; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gB2mun92"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1821245e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792391475; x=1792996275; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=gB2mun92gI5039yDs820EXCenQU4tVDsv3Prgr8rZMNT5VsFeW/f66W7ql3eDaHDn+
         9i9gxp8FhRhOXLs6877qJyVC/oW1+EZnGO2u9NFBWrkg1gQ3HaHr3LcAxBVb5LUCqALB
         ssWJ8rwNZFAVKPWldDuYZahXm9JnKmZ3+J8voNQQC/HA7TGlTD+/ACEWeoorbjDIFuS3
         47mu+F3VTHYq90ksAuIyGu6ILJlJkElv5QMWyxVWN64lWYenwSkaxhAks3AXEqfCS8CJ
         /ufeVlIO3ghzlhRLrxD0BwzGWelv/1zMgfowJTTahr9yWgSxwl1+/fpbssSYrDiiA8B4
         2lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391475; x=1792996275;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=LCi14+ds2KEvVSUwYHAjtM+uWasnDe8+a7rDpPm/tYFSiOxgxR+hA4OTq71iMLHkxa
         cOw11RYOKeH1thYDDKhleWc2Ovqv/LDAtUQ2mFxCyeIle3hUzv4rbGNyZ851zO24EzU/
         RLizwd+W+FWksGdVWuncQvZsINl4eph13JxJfnyuMEKYYYNt6luKMqnaNfvcqs++rNhq
         xjP23feN83+p+7wpYObAUM9ZJFRiJcyPvfyBVEElv1+UG0sOQYE+4nfDVcrv2Ix9fK1u
         +bNuTfYR+UvJ3ieqX1UDaqITQ9735SI5E6VFabNlhrSV778GyDxcq++h5DoB5aODGywv
         UzLg==
X-Forwarded-Encrypted: i=1; AKwUvByavq2IgfBtL7pMd+EZ1DB+yuRCFkEtCKp+tHVFDZaoSiN0PZoIwabe886DukGxkwsK69xb2HFxxoWzXxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJbV1nyxuEEwQbu93SG+ES392j7IK4bes4kwcptA7KYDvxicWR
	BbBNAz40x+IHkW6IhV97/YPJWbF1ez08fdmdoN3Lm/eKtDqztSgGSXD40aHd1UuL6Zs=
X-Gm-Gg: AYBFou2FjCiu+SODbNoFAy+PN9xfr6WZESBZmhhsgqTeN2KjHOykmgES+3bH7Z8Ofe3
	bGx7KbvuZs7rmG4R935hzyi4UkI9+Q31jcxOXVbUzCedZxU9xaEeqtAdIWswn7tWPxKCclSRID7
	FnGyD4VyZwcMGDEyelOhzkCq3Wyc7DsrBRWPFOLQWC1wmbYqZWKqpG9cvKwva0cvCkABgovc//9
	nrxbyB4OM/lcc5/FiHFv6sg5CDyK1IU2HDbTO5QClAOf/MmPzFvQHHDtx+xyhIsG3cXbsmFRLHl
	YaG7RUDjJhV/gv5BnGFIy8VPWCrwWFWFyHoc7yKKZevU+iauoGcnYOz2JydbVpe/KlaRof3zxZZ
	ozdfWX+sLxiI8AvwwIGDFeA/EYpgUXKotQhGuzV1bCj+oJN7nT71fGyIgvryCpa8U7QmR7QzF5b
	ym+nGshedHrtGpnZneOOBeWvI/LPIS9fHmmWChxUu30fxfPvMF9JUFcJ6EH1gYufN/Aox1cILDT
	Bq5+/CVNrk+
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr166458235e9.1.1792391474870;
        Sun, 18 Oct 2026 23:31:14 -0700 (PDT)
Received: from [192.168.200.185] ([122.164.127.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm29269239c88.4.2026.10.18.23.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:31:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 19 Oct 2026 11:59:20 +0530
Subject: [PATCH] arm64: dts: qcom: sm6350: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2klakCJcxbAoddCatGCnGAzh7
 lZh+ZL331+BKTpiaMUKkd6O3RgyqJMA+zDhTuhumaGQhVZSNchel5XEwXCKk0VPfowfVHVjz7o
 21UWWkLdTpMEt/+6125nn/kk2/WKHEek158O0a9AbJrSj9y61ItCS8DjV0G3bF0qB9fmqAAAA
X-Change-ID: 20261019-sm6350-fastrpc-memory-179c467a5803
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792391467; l=1793;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
 b=VEH2q6yE78YozhInji/DsMmhOONcl0mWskWd4bhyhR4rM3/IPyw042bVDiaHZPQLu2pvNLIXv
 KKDA0CcERGFBiGbXdcaCCFB+6gPQjZWmgFORriHY4/Cfw2G8WLopGiH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e0506fada32d..11c1df6e7a4c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm6350-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -689,6 +690,14 @@ cmdline_region: memory@ffd00000 {
 			reg = <0x0 0xffd00000 0x0 0x1000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smem {
@@ -1430,6 +1439,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: ad304bc4f861beeb20f6fb189783284e17557338
change-id: 20261019-sm6350-fastrpc-memory-179c467a5803

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


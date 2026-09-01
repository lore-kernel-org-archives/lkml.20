Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923C92F3C18
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226624; cv=none; b=Od9/G4N6Jb5Lr6dzehCegLq3EOqTIuvlQSebYzMNJbcV27+JO1LQPYFDGGpYVaeiSGgAJwJEPsM338AmrkemvXNjSqAteS/RAngugeGGd6IxJIt4eJOittxd8+g4ZASzl+D0vs1g37Z9Z/QcuWyoyj6GTcNRau84/Ve5KELQtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226624; c=relaxed/simple;
	bh=gfVPdtumkZbpCiDCZ2WA4Akbi4xrYN5pE0/FfAAiH8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SS5+9Xai4rTY/y7x169u7wIUP+NaTxQu1Ui8oj10dVFwfT7435KPjsHhJ6w9a7zmL9hLP08H1hmxDXAdUK7dJtHDw4Trg6ZzJ+hOhEHt38mZ57m2xJbuacbOHwmLVcf482RMdgPGO5WJ4iYmrljm0nVSN5TC1qgQH46dk62yGOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w39fElDx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w39fElDx"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9390a2c8909so295604185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226620; x=1788831420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpaBWipm1BW8poaZLaIxjgOiCGLP65h0iesgThD7XGQ=;
        b=w39fElDx2CLCUmXtZWLD3dROUG58D9jkxtmtMqemoCUiX8Q6Srb/+IR+6pigpZGwvv
         yaDCyuRlUdzlsdXPkX3PdKC8bAJJvw+GJSV9xfpKr3pknaKhRkQu5h+Qe7tOyFXIIty3
         A7RSTxCXxRKLsCfpA1eJJpP3AdQGLLE2OkfqSqOIdWNlsnGRgIeiT3WXZfh1avC3n/Ma
         Y9Z7TCidgtkQGaql7lSUb8ajrqOxBsz4uRyAG1UjuexJ27oPNT3J0xr/tFPT4xmHmSyq
         UheXR1cwZlHz1MC6E/Zlgagn/F+bHGoivRqaDgGuCOCHlLI8mhWJ5lZwnDn5bHgWLNbJ
         I88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226620; x=1788831420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpaBWipm1BW8poaZLaIxjgOiCGLP65h0iesgThD7XGQ=;
        b=BbK34sgxp8qmDYNlRdlFuq+LaaKXaIGLHcLLG7syiKpoHQ/wog16NgNdAAIsVff8yA
         CTYSHdnaRyzXN0scLOguupMdcr2T43DCoFmliqbRYebI4E7aQ2OsEfyxybqd4ZxswYSD
         6caVWen9Z0IBXxo2miY7z6PvUM7UB8eybgL3Rjyit9t9tVuJHs5qElkpMRjD1Ykltpbb
         Kqwp3Ws+03YmmhyppR5E3orsi/5RkfZmVy/PqQaguwUs6/H/WoC+LWXcVjf6r9a0LEhc
         jFqBgC1OapNTSfbyWYlnhXkBMr1izbpOV5D2855Y0Xppv4iYSbIgF1dY+KI98W9NRCRB
         SeLA==
X-Forwarded-Encrypted: i=1; AHgh+RpFTJ1KS/vMOa7rLivQOeYOps2B/SLBL55Sye/a9Qc/DFRL7nL6hiBq9RZM34fcjN0YlrOEmJUVT9lfYGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgTOZnKL5A7BrlBB6VmV/MI8bPvJxvtANCjN63tHkKLrIKKxSR
	wqROP0GxwgvGQvpz6NEMDgCsFlgiwG7Oqzwbgq+ueV2ibhvQPOW5i8dXCwbn8zSjhFo=
X-Gm-Gg: AR+sD118jwIOrekeqB4H8Fx7Tjkk5jKC+5Xmdeg9ZQ4VcdbLPpMevR/rQhZEgZSKqgI
	LjIfsEd1DqlsaEq6dQ+4tk5nwfOR/+8xtegUhPVx1dU5ezsBxNdm93n+5FYbHDtAkYX4YyAF4KR
	56CrQ3cF27rnBuj4l/q7WFlp+ljdhnmDCmq7wJFNJN2CRjr6aM8uzh8hkOa77ONouYrLA/0lPSR
	QJFd4WscH32G2aqts46Ss+NxfjWSwv+M33A9H/QI45W8f3yIHPf9iJQ666eN9zK0OLe4S/ZSLt/
	39TSIgeT0F4coD1bnd9iXNHTOXNwc6hTiEkkWPjvCAQkS6eqI1LOtI1+wmQuzlui/FXJd7l/e7n
	CcfAitZd9n+0FQDjz3but8ocVhUkTvBSzIWoG8/pWZuhN6ekX7vPD4GZASQhixdIepNUlacGvcy
	cEEoBJNxHgARRuP+oxUTRZUlstO1zHS2myvkgtwakPvkrvX31ZkncnpHSp5C7BydkU
X-Received: by 2002:a05:620a:27c7:b0:934:9639:3a4 with SMTP id af79cd13be357-939481a476fmr754012685a.41.1788226620558;
        Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:48 -0500
Message-ID: <20260901013654.1343537-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC contains a PCIe switch with three downstream ports.
The third downstream port connects to an embedded PCI endpoint,
and that endpoint implements two PCI functions.

The devicetree node describing those functions incorrectly includes
this property:

    device_type = "pci";

That property should only be used for a PCI device "that implements
a PCI bus", but not a PCIe function.  So remove the device_type
property from the nodes representing the two embedded PCI functions.

Additionally, those properties contain #address-cells, #size-cells,
and ranges properties.  And although these properties *will* be
appropriate for these functions on an RB3gen2, they are not normally
used for PCI functions.  So remove these properties as well; we'll
include them in the commit that actually adds the pci-ep-bus sub-node
to each of these PCI function nodes.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..db6578f7fba51 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -956,18 +956,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0


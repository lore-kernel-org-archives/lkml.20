Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123502;
	b=dWinNHe/RpXqCVjc58HoQaL/uYflbL2RF9PoXGKveHouAEL0D/1j880GenLxEzwxq5Gb
	 8OSncabZNxmxkD9p8hpOEYGNVE0iA7XF86oPZYd7JbXR94V2XLqYFw51Y2rwJ9NsqvkaD
	 VW7Rc4dOyQ7+/PlmmqGMmrdjG5ddxZ2jqAHMN9z1GzMB0LlNiGwLflKyuVcCuptW82tb4
	 KzqHZ7fMQVnSr0iGvAukzN9Soh3m7dUuXePiLy1PvTHmNq6+N+yVoPm7obPWUNjB/afFF
	 //LN2PwiJL/U2+kavtBD9G3oGq39ta3RwXm7k0K0/v9ETOHj2BdoVIcM9tDz4P05gfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=rPECAEGOivdOHQ+/3wmbDhR6a4Vb6mRFmHuMJwDF+xaxUOCFQ0WpjQMMoCtlWa1134aX
	 T9ZHY3l2UlQ+9vaZwiroZyFairkOtiCxDWtQ2nYpnlAvDMMKbibqIx1GHC07DlSe95PQl
	 PRlOX57+RQxt67/v0522QkZboee+SyKvHEA9NBI438N+r6BRdyU+yiQZSnrSEgpoQw7zp
	 iQ3fGW1qK3BDnCuLh5nLN3sZk5UftVxES90ETptk/UdyfD6SAnrP6UxWZfSv/URRujk6p
	 tLeR2Sp3CGdD+NOKl5ToJfMPVtEb5iCB+nGMwWzizPKGWdv0jmEzUpODrNWi4GX4NIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Qczylg/H";
	arc=none smtp.remote-ip=209.85.221.227
Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A52606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A52606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qczylg/H
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5eac01ff101so77755e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123501; x=1793728301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=WLWrOwijYD4DYyxNLc1f+BAi5IHmxF+HCHRRvsUorNdO7sLgKpX70QYF5b0FXwidbD
         S+ZML9RfH4TRi2QuLHF3qgkGAE4x4iSTwPKvPv6vIZd8YwHK11zoOACC0RZP3jvbGRdw
         DkmwntJ/HZFzxqK+Jd0Qksq4EB5wW64kJUityF1bPzgQizLGDfZq/75uOkMf12R+84Hv
         G1pKJH/MNqIBXhu/7vGLqwdXyuAHlTI2saQz/7EUFhLt3M40h+q96ze3+f9IcCHrcUPo
         j+YnjkWnm+N0VRVYY1WppPz9k0hOSOR6/PRx6cIWiQyA5v8eurCNY63bFXTLh4otdev/
         y/LA==
X-Gm-Message-State: AFq9FYKmSJEXim4zJfAaZxw17KGrEfcRDLykoewJbzPtGofaeVRrMU/D
	w7b8QS4rOGwLKzQD6OIVqbke6YSaTQJlqqiGneFI9gOeV93oZmM4RvVTQ7s/ltZLWbzKgySzOWg
	7xvMBVjgl34J9PWn2RR1i3h7ZIB68VSksScezkqaKVbFohaO756cuCtOxa7gfccmVGmrRqbMshw
	TkIU8XOQOoG90795VWsNIgxlqomj+bjTBbF9JUltasyPsMl0+20NThB1v8Gni7JgNTvb0OVXdQD
	CR1V8vrnsSQ/0dhw7c1VQKYOvc=
X-Gm-Gg: AYBFou13sykeGeYuf+POPtBWwqUSL4sneBgD/eviALSLxfOZbtMxguGhWL5qG3eB+K/
	/gYRVNBVlT+1nRMYRTE5Ka9PFQKtFvzy7WmT03fh4kse7M6vY7AxKfeKwsIaZUDt6fbZBRMFU5m
	Y/g4Vn8Za3Okj1rtfF2OgrV9PD4Y2NxDF0WYZX6Qm4wZ3PAero2hGPdlYkl8HJS22otTcdQeEc0
	VxdelKiLvUzGe6DqDfvbsJv3qmRaHFPteXFedeICNd/S5Nb1oPeVJwekykfOR0jxV815n0dQdF7
	+eoO9NbCMxrkpTVhig5XycVvm1o/bHWFwu/4FmRs74IA8sEecd1X4TX3kRnc+u1x5pma3ZOA4eA
	ktB1fvJAayrW0SNDPHko/Gt5xeMqM9wYQa6u4BeRAqvhR3GCUUepHM8VrVhsEjuy/EoFXhqGU4z
	ztNVpcSPmZMc/qYsExTVLYNFnuF1WdUa6hMnk/toPa
X-Received: by 2002:a05:6122:3117:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ec2332a723mr4287911e0c.22.1793123500654;
        Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5ec23066181sm109128e0c.0.2026.10.27.10.51.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso3052451cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123500; x=1793728300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=Qczylg/H+JxabyUKQO6+Wf2DSWugEEbAKDOWvySYrn6hpb5ft8XX4RJjP5IP7UFiOB
         dTXQrSXG7Wk6MX2PRDH2ffPJOdtECGQQyL0KqWBiZJxBr8hftLXax6E4dODUW3ZpMtwl
         lbd90VI+GbwwIaaS3WR1UzOc04ZGFLcrwcG/o=
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr63641cf.58.1793123499833;
        Tue, 27 Oct 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr62871cf.58.1793123498959;
        Tue, 27 Oct 2026 10:51:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:37 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Tue, 27 Oct 2026 10:51:24 -0700
Message-ID: <20261027175124.3518239-4-florian.fainelli@broadcom.com>
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
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0


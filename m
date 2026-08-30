Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB553C457A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111616; cv=none; b=hC57sZt8kyvzecQvaXi13u8wkpmoIDMMPyR8mvdlAjngqjdQVFptM5enyxzDv6jwqw/o+dmYWUh2WNsVFsEPsWE534gLNdsV5jW5r181z9qtT22CQhrkV0EGYEmp/nfFNRQJySwUArVoVrE1BhZg9Fh5bqEFL/2NqftLLD+itC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111616; c=relaxed/simple;
	bh=51nDrnswJ2AaPFM9avDLg1vi5kBGB+YIKmItqZ2yIz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UQNZAzMVE9Hoj5PKXBzZLN3QBaYDwx7FhWxWr3nQhw1uq8zBwaiC45PskMfaib/Y+lEhgpf7bVJlRPHHM0/RwyPI/hYiRZVzqu/BgPKTwqWcUbhLxoS+focxUE7ojNk/l8u3t/bSNF/Q1OykFAGjNrMwbfAld5gXVK/tnzehPF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cshOEzIo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cshOEzIo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so19193545e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788111611; x=1788716411; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w/FSWWGWlowbgIh64Z5mJ3VjdpIGudc8Mgmwqci8QVc=;
        b=cshOEzIonmgxMfAoPwS+5+zCx2VPEOrlVBzkSlAVpp8SLxAaoxF00bBiq2jw4QIPqb
         lVDp0gTfJde9eEsu5VUtGV8vXdoz+vctKW67c9cLDnCkfbvnPVxFtGWuLlrCEuyhT+D2
         oj4uby9OC1k2JU7iqYAJCRrP1XOwLqyPSZz96SNrVp1UEKNMYUxfa/L+Z4F6K10kXx33
         4lmmGGOXDHmLxRpL69OEMLyIveFQbTOOZHV8uxmLC5cLuSlKuuvzBgdtI1OiCVvJcmjV
         0++sR4l+wV5iXRFsulK481g4H6J+jnx67Zmc+PlkUhT+ySzwmPnGlG72sCwwMGDQb/9F
         bSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788111611; x=1788716411;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w/FSWWGWlowbgIh64Z5mJ3VjdpIGudc8Mgmwqci8QVc=;
        b=btmzDtLqJiEHL0UkXcB4/puyp40d2T4nBsoX+nUxLdDvdWvNoIHsAtZ3CMFIl9ZHGa
         N4GOcIQoU9O4O6iIg9nKyRgOfGAwLEDNI42J5bkjv3vUO/Uvb0UeqN1LHsLfhqOr0xua
         NlTuQFIRELdS4qcfWwl/mooZ+sEgjPrbwd3v15IozQIbtYoHY7JbLVtmEZqZCLtzw95D
         UstxRGC6YKqHqe/miWPUGXi6aGmXl7Ol0wbC8aIs+qZNLozB27M8py2arzPYC14Dktq8
         Uj3so030oil4d9C3PlSK7X6jInUNzeuqipu368OW8L39iw5okRVMIZnR92MYWZC9XEu1
         4GcA==
X-Forwarded-Encrypted: i=1; AHgh+Rqgncmrb70WMtCT9b98Po66O54WED2hNSqI75lDu4Maabb+n0gh2oFnLPW60cO/7kJqpua9i+QGB7j14PQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lcjVAijaPqM4MqvOodcLgqWW9fef4hXrW7M9Pcd3rhEiVPNdmM
	rmC3mOf3f1FXqTxTnUyxjWNFovc1HPvazUYTUu5H7nayi/oMD3njbzdcKwEBQKUBLhETqA==
X-Gm-Gg: AR+sD10gw1OZ0T32sA+tYEDvvGDv1/lXXCi4gIfaaWwTp5PPxWzJlj5SkMCM671gEpD
	24MtcK9e1iGRP0HjeAjob4WMyoIjFgSDqlySSTW6tsbalylcizBWMXyXG/fl+HN2WWZ09TiMGPx
	FQwMdJ2FFqEQFobBXOkstbofmY9/RO80GVRy7jbHxIU4Xkp9pxZO3xAcAJXZKJp82b4Zx0WnMkU
	4GqFoC0g2yLP07J+IhkHFtuWDli2L/p1yq1+L2q/mP8MAzExwH/29PVUeZQUSIbKjem8aci40RE
	WfyFhQlkqM+YBQEA0e64Hy/KZtjSsxf3//z4Cv033irGBgtwDQ1potyutrLh4m6kUg8qxhWn6M6
	LahVT3VH1JCIFhAFB1h5rFSRoLmC8+xBTJEtsLRKZ4L0aD0s/Yph3GAbHssIRoLWbV8bIey+GaM
	QqJIqSAqL2dvShvJ2ZyoLwcfPS04C5smfEqQWrukDevt+jiXIUPtq+y+Esmc4ISfxEgxM6njDVO
	cL6InFSMosYGpWHsMBtIOR9BXEL8lwoVQ==
X-Received: by 2002:a05:600c:4445:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49b91c2e150mr309289955e9.2.1788111610750;
        Sun, 30 Aug 2026 10:40:10 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm387000505e9.10.2026.08.30.10.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:40:10 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sun, 30 Aug 2026 18:40:07 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywqDQAxFf0WybmDGVh38leJCx6gp+CBRKYj/3
 lSX53LPOUBJmBTK5AChnZXnycA/EohDPfWE3BpD6tLchadD3aSrI+EiM3qPI0fs+IuvJgtFyJz
 dcjB5EbL5Cr+rm3VrPhTXfw3O8weEHvN2egAAAA==
X-Change-ID: 20260830-surface-pro-11-mic-fix-4b5878500266
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788111609; l=1693;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=51nDrnswJ2AaPFM9avDLg1vi5kBGB+YIKmItqZ2yIz4=;
 b=FZG5vvPe3SiFVm8SreO8qmq4L5cUrKIKDf4efXJTFH10SiRK1GDIDNtCWUVDl2PrKc2wZlHj5
 mTZwZRr0Tk3DFzGEpOTCt06FNfO5fbV+vHNDTF4pwgWY4QYvMpJhAlh
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The microphones (2x) on Surface Pro 11 are currently ususable due to a
misconfigured sample rate, which results in a very distorted recording
with the voice barely audible.

Under Windows, the DMIC0_CTL register is set to 0x00000005 while
recording:

   bit 0 = 1 --> DMIC0 enabled
bits 3:1 = 2 --> DMIC clock divider = /4

The current dmic-sample-rate of 4800000 corresponds to the default DMIC
clock divider of /2.

Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
the working Windows configuration and resulting in perfect audio.

While we're at it, remove the reference to dmic23_default, as we only
have two microphones and don't need to configure the pins for a 3rd/4th
microphone.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..28ca2fe678ef 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -863,11 +863,11 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 };
 
 &lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
 	vdd-micb-supply = <&vreg_l1b_1p8>;
-	qcom,dmic-sample-rate = <4800000>;
+	qcom,dmic-sample-rate = <2400000>;
 };
 
 &mdss {

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260830-surface-pro-11-mic-fix-4b5878500266

Best regards,
--  
Dale Whinham <daleyo@gmail.com>


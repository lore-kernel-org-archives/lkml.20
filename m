Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916A3C3F6A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226633; cv=none; b=rbWHiGjlBzAujdI9h7kvrDu/74Op0wyMwl5f6gMeKWWKNU/SebwG4oOmVC8SBz4vJLyOCzt+7ZHmFCv+Y9ZV4gD9sD/TifjdlnAaYLvMEVloWfsmm1mcm0gtrOXcyJyuBGUfDKxx3io94vhqRVFb39dizn3GlteovuYLQdOh80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226633; c=relaxed/simple;
	bh=gWLSQTYzpRTWXwqnP8H/tU2Csjcptl2cwKKWkLyEbWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViS19VGql7ddkf9k3ymPHVTCkftGa8XIkptLnOQNXVWJTH3mMeDTonOrCW9EOPlEUxhOdBgR081050fqfqkVQC1qgwuZABjGmad4iyIzMZPZ6rOV2Yc9ECo9dvlcXZuJknztLBuaX1vHLZ01aJzW/DJr+Ob9T7siXVCvWlbr6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KlT6UL+F; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KlT6UL+F"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93905b1dc65so291661785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226627; x=1788831427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=KlT6UL+FNuV43NRdaE2YMZ/XQ3y2JtpKrvgbcvSW5L6Po4NpYQ7C1Gkt5ZyN4yDo9R
         X/QfQ4YnKkO3bbt1UO0UjdBlXkcUEmo6cumMFEvpmgrxgLgWNFGzA4pQyyyOQwyF1I/Y
         9QmZZ3yIq2rs2OdF7eG5Kl1kb4Qlbw47UsvjVTvoZ/EPYXSUs5FpkM8JozgKOOloB9dE
         U8RbA6nokmQDBefRFKOrLkObmQT+rXYotDbVVDBGKOL42IrVBhcZxrqf/AsFv6xqQiAu
         ftwSsrn4cfbZfiLYEp/cjHyPY0T8zUk/AVehdqtRinSIS2qZawN2CHYqktw5QSaTSFoD
         Vh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226627; x=1788831427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=D5u1AKjq7Y8wRz7lH+X0S5dofpiPYaCxw8GF4NcRsU26zZXHZtom3MXXKANTV3JYsQ
         8OqZT0wlsH4HS6ibWfbpnqONOI3ZHJn3oyI8tPiBTbiMRvi8/vAk8nGRKSYNGSIXAYKw
         l3pPTxnL8+/n9cqvd4Mep6NCgZM68I/bGfQfYywyRq3c9TuGFfSYKf+4uYYQTlkqma0G
         1ihnsPeo7E+SsSz5uTRyQwPNPWtJR7bgrqcYMPtHgkHB6S5H6d2ju6gmI6JZBvEb2H6Z
         NwjCAf+NE2KmEiuAOxSP2k3sKZ2kABwGpOL16CO8oHTTeWeWKD+Y1LTuGdqE9aUoeY9x
         0MXA==
X-Forwarded-Encrypted: i=1; AHgh+RrYHMlMBOITXUvAl7+NllOo0f8lLnUcL/Vw8QZb3hI/xfbVomfSZsoirJ5++0Q/XvUZt9b8MmnTr8jfluA=@vger.kernel.org
X-Gm-Message-State: AFuF++mD3p06X1vBFbdUGNbHQaJi/mpAC+WeHVY1Gg0Qy7VYLtTZT9dW
	fMbr2gs76eCO9pBDSWZK0tZXYtZFnhYdXUnsrY5AN8gvG/UG9zzYRbAUXeFKw9eimGk=
X-Gm-Gg: AR+sD13ENrhZFP5xxEDC4B5IIpUvgEvZMjiUNW3fF9j7laUg7lsEWsJ2E/RoIZsU8S8
	1ousbfd7lygTjQgdFQGV2gLR0oWJOXlwhP2f97wvmO6tiY2mdrcvLw/kCY50waM7AfORdxRGkAx
	u6sPQN8jJE278kw6istovzq77m1Nd6gwW+Ciam1LfFg9zst57JCLAqgeF/qmrZHxDZ8Z+eH6Qpg
	mB7oxw19QmhSXSagHHPhaTxsXlcSQuMi0xuuzAD2O/+C1OnkHLWXwayxnARQ+rg+xh/LhFGx1Bj
	itrx2QhpWOlh7/vZTtoc8tlCaKWS0LKy6OhT6/Fz+oQBZIEVMnRN2hkbX838OPKX0tefMwOGgJH
	ra/UpHsTy3ciS0GATJiULXi+EM6ZLyF+GYDCgI49YCqmCn1TYpyK5e7DQZbn2s+Me5+zrUEsHPM
	anIOoUGmP+BsyMuDbU/LmqzkF0hEJ9t+xYJQJIF/fMcw4tHMnUN10x93VrvY/RA7sM
X-Received: by 2002:a05:620a:1d0b:b0:939:3c0:7520 with SMTP id af79cd13be357-93948004098mr760507185a.18.1788226627261;
        Mon, 31 Aug 2026 18:37:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:06 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:52 -0500
Message-ID: <20260901013654.1343537-6-elder@riscstar.com>
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

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..3e8d144f57b00 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -792,18 +792,10 @@ pcie@3,0 {
 
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


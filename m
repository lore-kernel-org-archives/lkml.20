Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465D73C65E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226633; cv=none; b=RE0lQIOEMFUCh5vdrF3vuYItxiA/ih5TmOHrUH0WQOEN9NnxAs7XzKC8A+K3YyLI/iZ5zXoWft83Mc/f8pM9R2Ki1GTg3fkdSgB1QxPdimbqGK2aGGZC0JZymgoKi83/Xfv0hTkfnWJfy5uEEwRLJZiqjfbVS/q4LwN1Djhowwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226633; c=relaxed/simple;
	bh=QInaDatlwxp7NEj4/bdLBqsC3UrTgGWJ6q0lyU7RRsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQd/PyLb5/DS+l5f2abcloS1+DqnEnYRko3yIbMiTFVAyfLsrw2qJNX8e18HKX0bMaeFMO97k9yzwYs/RtW1ALvf91lOq5Xn5Pncgo6qv5ICWF1h99dlLYIlIPy5+8U9cuCNZlA9bgNUu8Myqh4By9gL+7WcMYhvgmxbeZk/z44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fk4JzsAM; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fk4JzsAM"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-936e393176fso33481285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226629; x=1788831429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPcJzHW6TuSLOdHwhvKpqTa7MZ2jOufBeABZfucpX8E=;
        b=fk4JzsAMDPOlXYxqPBYlfYn7Riq7QYWJ83q7GXFWnrjAz9EViiS9mpHtR1m9iAy+pA
         gsjNKwqG4aYdfv+ubvkOgQ7hxFlGIDhCxdVAAQbaq3xs63NwTGODQYy1G1bOvNnl1dgc
         A1X+CeHzM9FzvvtRdpfq5+klzzpxe8p/UVIpixKJCYKLNmdLqAZnOJbEG/pF3Gx5TVs+
         nUQpFZi3rXQRTRCPCxJbf++dJp9ZgGq+TkArnuDcBSCwHxCS83wd1mo9apGIGoD4YLeW
         tABfq5Balmhzn3jwgAaIuMfsArcx894aiKediqYwe3Uul+1OdzYZT+oT0a/ZZSliEWFY
         6wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226629; x=1788831429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPcJzHW6TuSLOdHwhvKpqTa7MZ2jOufBeABZfucpX8E=;
        b=d+YTNFh4ANdh/b23olUNLsmAb7SyRuFnAw2aGdAvF+k9DL9hTDPV4B95VlXvRb7gUZ
         Td4r7TCeF1wIjXUQVaFuLyfyFWgjIvfCoLlEQiouMSyRFGl2i7rcS3gwA8pqLowOiKqg
         T2LYz4IlTdlepR6qhmCE+49V82rhponpyO81msUKBVfzShYulaCA0kHmKph7g5ZuR0Jv
         W9cT1rSxUsWAq0LefHxBBv8knGyI/4M352lHjdeHdvJInRAzRgSMOi0Hzn8HZ7xOX1y0
         amMtYbCGFDyXnYz57dq2GVKNWJXPDO+ya9cHdMmc2mivPf1J0wwhZ5qm8XBCnIHmh/iA
         fvTg==
X-Forwarded-Encrypted: i=1; AHgh+RpaXqr8dVkkoU7LYYoI2elMxYjSqLP6uF0uBfTxAnLtp0edrWHWxeAaIFnOy1gdWBzR/gd3mgBoBMAbX1A=@vger.kernel.org
X-Gm-Message-State: AFuF++ma0pV8ZoQ5mt7MMciT9qdNxUwDNTObjhS4frBG5/Ep15q/p9Ux
	LUbU0i6A06ANtQEj8Sl1vZpuI/TRNOx7dQjuA2gfxzG095BCSeD5igkaP71SMVeQvbE=
X-Gm-Gg: AR+sD11u18wnfX+YBrwHhHQ+gJ2OyrEA3/nPUPJoETHc/4Lu1p+UUhrjhhshMAB1Da+
	hm6ctBEcT1UyzkJff9NYke8diNhVhTGnQPdvCkrhrpHNJhpqJOIkqkdd67lTqMHmzsMB8Ow6I9O
	cCMJbMDB1z9ywrjaVJ+4ELZwk+5MKRMs2AI7kLfTDb2cnkIsdxhMwjgcam52utZ26pdCO4vygko
	F4GTDMA7leVEoTBUd7C1KwkXiToBhyDsLioH9hYs14EbbjpisM7AkOXN2CqQpoTzSZ1OxI88rPk
	nGXfLNLIijhHBvcsCf3gd3wzgHPjvSCSNS/Ghv6F9cu63/3TXsGb2rjsA6hEKgIFTBwNbrdFyoa
	mHmGBzonInDLBnnLpUy4ArNYIVDuRijhueMWrgihJ5BOaWAwmQajqu+MeKZuIQiaXk+dwLfrZeR
	8MTv95bzxWWIjHoH7Rm4k1Jis2fPaYc6HtG/CaFf39m+HD746U6ya25w7S9jGe5UPy
X-Received: by 2002:a05:620a:269b:b0:92e:e1d1:49dd with SMTP id af79cd13be357-9391390a15cmr3286256985a.21.1788226629067;
        Mon, 31 Aug 2026 18:37:09 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:08 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:53 -0500
Message-ID: <20260901013654.1343537-7-elder@riscstar.com>
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

The Qualcomm RB5gen2 devicetree source file defines a node representing
a TC956x chip which contains a PCIe switch and an embedded endpoint that
implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Fixes: 33cae252054a6 ("arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch updating DTS that was not present for v1

 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b6..2c74a1e242ef8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1128,18 +1128,10 @@ pcie@3,0 {
 
 			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pci@0,1 {
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


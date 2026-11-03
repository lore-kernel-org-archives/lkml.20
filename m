Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713873;
	b=zCY0+x6OUhl8uBItX2zIKJuF9m6Ie8AcRuFKUCEzcuQDd2cNqB7EOlQuCU40itbmg5KK
	 pBCA3cE+NVqFXSc2593iUrCQwpw0jDdhKkMM9NpiLhazznPZVER4zhzpb/oYgtFdEW5KP
	 jLZwnwCEHtFTWEsh9FEdKus4WAan0bKyeGGHXGczg4SE7JnvpCXGzr4+seEO1QR6XINN5
	 4uUH7Rthe+PMuEs4CfaIJw6TJ5ZSlHqn0KenEekOmx6KFztb9KterCRKlJAU+L7KuNk47
	 gJC/Bpv6PB4tVRMBpwrvj6Ili/bsaKUvd0JEm0xo0sSV6ehWtrccXcKGU0jcid+Ic0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
	b=sqmvbCKGWU0qthqs3cBvCq4OXd7uyD2FFHofVa2po+BS+et/nZTtrBgH8d2GCnH+ROAe
	 5Im8LohS/YFxBUh4qMJ0tT2FpZwN+1tlqF6EIFjiGau0IYLHqcs5obVriGpSQLhApeVlk
	 UfWPkdAcxMOtRGnvEna1AoTcMrap8y4sGxGNJDSmShHLz31HNYy66qQc8pEGWEmJwgDW+
	 Z7sh56kkLqPXvdIhGvhOlWGzjfrb67bPBVXaBnaHh52YJD4u3UkJy35bxw7ZIcPn0F5vg
	 UdStydA+AKH+zCrtzM6TUG7rT+XFPQyQk62xuZ//twuT5CL9XXZ+91j8j/s50kAIHmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A9606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692A9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so7808962eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713873; x=1794318673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ublNyEuVZhEs1i6z93JX/R8YewpZyMQAk3YlLFwfuXYBFSs4sfkWLWIfpH7P/AJNuS
         5qixV2Ch2exi433cUqhwtamsH5RTjKKU5h+UnV5JwGoMz+/z5255XiDa4N8V1E1e5/5m
         xIef+CIO+jQgdVmK4fVDAbtkxiq0uhCruvAI43NOs9cjwT12hiRlo91JCbLIKW80eVtA
         AT2480xZi4B6M19h6dw5RIaZjKogbNOIf3kkerNxRy0JgoNulp0m+f42w0sQV9RigTM6
         LTzwtARR6jVp6JcgqjxdNtoiPMyOT/xT5JoPXvxsPpU9wQ//lqBy9S1SjrH+olHgj9zq
         xKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713873; x=1794318673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ycH6zIBDo02tMoN5Y9AhBBDwSznJC0xlwUL9zxBtcyNgauhepd3fulyYAUtYH/zteM
         8t05Pb643jaxozOx68Fpo92SvcOHBmBeVS0ma1PMKRFMWJu2zw5f9HFDI+XCeTGc3VSe
         L93/tV44dvE6Q7LD08IhxiDAlb0Tk9t5AKLKAtARQi5kh6px6wzWFIFyYCG7OCRUauUa
         LGpckdGL4yrLW16uiVy8WYSV1IzD8zHamP5/n21/tKblQLnc75dTGMah/s76Qpt93TzJ
         u/apqQYGOD4uamzPROiRW3IoJdXv95LjTvacnTJAvWqAUEwnPfPUVMjAK8okSQ+ig0wY
         g/zA==
X-Forwarded-Encrypted: i=1; AKwUvByMAsztJMkTQGTmYlD4OJ/ijTPHEnWIznNaIrO0TD59O3Y6qdAVsjGzIXUt7R1Zpp6aClK/cJwVna6q2u4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8feiOD32xvdEMnToPwbn+jt4qHfg2SQuJDTlZ+4+qTPakODTZ1
	T8jD/SbWV+rf5RayERAVebR1lSuCkBV/+Iz4p7KjuGvIy4uEZrm1ney8
X-Gm-Gg: AYBFou3AEvml0MexLZXukmFwXpSCKreWgi63e7X9r5pR77Sae/9Zn3YReuHvMVSNY2Y
	mT8vnfwfl22+x4sM+yRgn7q1LH/i89ldR4KFuJJULIB0SGeSOyFhmIiZV1gEP20gtk+0vLNHABe
	rqm53r42GOYlpbdL2iYVMV9JmlBMG+D/QYvh+ksjJ8UcvjFs1ZfPUzEVLPf3TyUy8Lu9SqoPzRk
	rPss2WXXMG7jNLQJd/wQFrMbitO/grvScc6jqrGsMW2wt0/oLAOAYsQk6S7t9/cBivZSF0vNAP0
	KnHlPOdE/nMt0d7c1P2TbUZG1urHbEhX/aOdtzv7CIfm3lVSs6GSJGLE0Pls7ZG84XFwBND8+qf
	3beaRDFtEB2ECP+8GH2W7Jvn9NO6VryjK9ibogr7Lg7kMHd+0KAOBTfi/lueSpdNeYE5dYw2ml8
	DXoVe2ZFnM9Uo1/TBYywWB4jJ9SPuvtYJrfDFE/WGcIiipzqZt4czPpjsjYIb8awppYd0cSopBL
	XQvWDjWTBKiMldilqtQWGtEZTLta3AsV41zg9regFqeX1dPiHGx9FAjgggXdTvp6AdVqv7l/92n
	LDtaVfDZQt3Pe8XamCqdvgwMPZR7OaMQwbAadYIC9DSW
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr24655310c88.27.1793713872384;
        Tue, 03 Nov 2026 05:51:12 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:50:57 +0900
Message-ID: <20261103135057.1682-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The "mode-switch" property of usb_dp_qmpphy comes with patch 3 of
Balaji Kalkonda's Kaanapali DisplayPort series:
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0


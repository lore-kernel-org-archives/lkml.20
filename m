Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF855C1CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993418; cv=none; b=GRhEneumPFVpCIy29D7v6Nwb15eASM0BQpljUOSYwYGrvblpKkiAlUFBvWS/KlDifUQSh2hCVHAZtwXWptn5I+WAof2y3jQpct4xO/z9zH2Lx2ME1rrNAvG3DcsEd4RdDm7zKtox48PK41rDNq48NJwXFcDY6X8RS26w0rMIKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993418; c=relaxed/simple;
	bh=tj/l1Z8D3QeZ5hX3y3HdO8/L7MlfV3oYPsAcQ/h95ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7GN4LaAeSLsHyeMpT2Bngl9aUEk+2BFvgG25Q8eOOIyBfAFDGQxjiGeF34ZvMlBEu7cAzLajFnCXXGqtSydjDxe6Z36tTO1HYuZzhpnsgCwLG9jMtcT/bkC7rNbeRWrsa+qM2MAr/ss4H5kH/ro9cjJcjg/DmeHFwPGeot/640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahNsOuAr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNY5hqrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahNsOuAr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNY5hqrh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpiFZ1672397
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=; b=ahNsOuArNck9oUBA
	k7y6+41pWv7mHKW2P/C7Hp0xeEwaI9BzpicwJ3cIVmn4KLhfdI1S06Xj0puJc43r
	8c71y3nc6x6UCulfFoXoZIb+BhzfXhmk0sfNGYOjDNhfRsxS9SX8Bdtl2+2PC5wG
	c65T8yt3cjjPiucegDM2b8HEKzCgo9AgnxphaiGxHY03uJF+zlNGLcG0TbJVeO3+
	RYajGVYxyk4rchiAVRaiJt98ECrjEGJpY+V4klmfQqGQgjggkMiWtMO1Gh4LOWEv
	RVrWVvBaWeqgKSrP2tZ+IuUSoQ445yMqbec/B8LYCXflAA0KNR/7HqWsaaMA3xkb
	JBuY7w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh80sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so588677a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993415; x=1792598215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=VNY5hqrhW0+/O0ZZybkuqVB0HzP8WQN1/2KMEHaqqiP1qZ0VoPhMrCLHFN8fX+uwIO
         aNWDwzu+5WOlKhIIFH9Trh51KzK9gi4IfFkjnxrPtknhwf9EfszG8RMoD5ulTph52R52
         baR6/r/owvCjWuTpGXoLqZwJo7Xq3JPxZCLBLalnlTwHym3vMIGmM04RngstS5bramQ6
         SYCUQN2NzoMw9bAMFkYUbtWIvlb13KITFv9HmZK8Kp6PrCsD+wYoZQ56FOVzV+YGWKh8
         nSftO2t9QcclTtGzTecuQ5ROZyBSXoA2Z8qUHRttitU88w9FYcLA2p9JAP5BZ3ThJGYa
         lQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993415; x=1792598215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=xjJdmFI6JfLAwDBlU1bCdvAE+sAGjdIXJ5pIYVzaKRSId6wF4cxI93ExqvPbxIe1Hw
         A2ltCqGYGRvSlB4S9ecHlSsa7wydlb5D1Sa5bTrFPv7cCBrTwvikU20YQy6z8Sfeqjmz
         +kkweDuWmFWQ9IdwD0wvvooAy56vrIbEOHbz/xeovaORZ9aiEXwP+KSIbKbEdEq+03ed
         q8Y3GPwgtHmktpaXCzJxJuAVrUBvJ5vsi8Y6Te7F2S4gGkMOFVPZumJTi0cBdkuKv0Aw
         08CfwcamLc5nVwpx2xfjEp9uuKHTNIfphq30LAKD2b4lQdNWouiG+sSXIAXB4jH5hKSC
         lfQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC/gUAIhcL9VqpYVx5PqBwh94wnPyi+V8bPS+GQrxjumNXxWAvUE8xc+Hvj9GVB/Y3WfokoYIV1cHiI1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr2UCRqPFyIn1wvrvi16gK/lK/O7hiNnmnVL3CqkUocerbqLUU
	Dz7b8P9IF6dUDF7UpJrubD/HxJQGsgTLFs+UwVbXUVl6Z+wVDdvvcH4i/Ytj7i+zUTX0eEvoWaG
	YbQowHNh5e300g66lNTC9wkzL8JsDOVOmuJDxz5k9OIKNtgwZscLF4y6OIjb5BIdNy5Y=
X-Gm-Gg: AYBFou38bCa8/4S0oPtfpynAKBN/EcVVdiJVijJILj5esj1XEV+gVWhyR59ad67Ks8r
	0wK3WF+om/PDLB41N0mgzL4xys1/cURQkSqP8FvjC7VzUSLJkKyQuB6+KBzMaBZP45iKSk4O3IT
	5CzpcJWr55vf9OJoRbGOhc9+KMFua4lOAFWhD/1d7nfQ5Xm+6g0BlxVJ8oqSDxHKiM9oVzU0qYb
	/OYfdHIPAEiJe7oCYvR6FS1h8zZzDQOTLr064YN+dBUfbpMFArcneA/Y70/TMGRlK7a9NlEOkfC
	Ou0NeHzRS7/9PbuC/WiFuJjZCvtg62L/+40p2Bd0BiFsP946EEBHOIYwOkpi6oGgVRXuy6kDhUK
	YK4q0WhP9N2SfNw6RT4VlHGwj/Ob0nFLrjA==
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945305ad.49.1791993414857;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945045ad.49.1791993414343;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:19 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to
 LLCC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: -AEiApHOtFlz4TayiBf4TgTTRlAutH0F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX6AHVlIpes0bv
 NGZbRaT6OD9BaHcLgfnMC79T9EMXLMmYtfj+2+A2K9Q3BONWrGaBjMWyo0o6zLTtNpDzVrUPOl2
 0t1rmRtK+5h4xTHOoqOSdvUDJziDAiA=
X-Proofpoint-GUID: -AEiApHOtFlz4TayiBf4TgTTRlAutH0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXxd59CYLsLjzk
 NiOaPj/wBLjG1D0QC7CxgaowriQdipg1oRCP327Xo69E43wSqd3HVU7BAxYfYrc6cXvyNHRK1Ow
 jg0Q+JKTrH9kZoAeEBNUXHTVElayRJZl3JuZk4fwzLwpj0Cu4a6V/qoRfOj6O3bGSWEuUoW8yVS
 KMNSh3rfvusnLXY6lxQ9fARqC+TJ9tsCuE9VLcfcPCfhF14uQCqiV0rgqXTrRVDq5VkfexlBtzQ
 GJZ/64z7JQaeH9FoqgPpP9+S5jXGQWnddAknDooWerps2aNTrVZgBNM0L4IWTA26GGDiQQUwiqx
 HR0DzYdOz+pJ4+MLCotDylNONH2kKvQ1KDYEQmXl9HIp68MTeHOI/dFdqPh4KrSRA8CeI+jeNmU
 Y5tH9fBOoT4lgKB4lYG9p7maHxxOfCeDhgYExPzv+fcVrmJq3xjueygozopV4EWUKQsVV/SHnGw
 s54zp+XwR0t1sWU2Rng==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfa647 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E534aFlItmYAAoDkEE4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
as required by the updated DT binding.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..ff572c003b39 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
 			reg-names = "llcc0_base",
 				    "llcc1_base",
 				    "llcc_broadcast_base";
-			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
 		};
 
 		gcc: clock-controller@1400000 {

-- 
2.34.1


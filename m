Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629712;
	b=Xy6pTKLTsazqRcpHWIpLc1ZV/gzq7O+Roz9BSrd980DAEvupl/kDWRaJOi5xuXBUJiO6
	 /9RzteDJmTbonvf5brhlux7bPZOLUUtpiHijjiOfwteEGZR/bx/29TwpDEPmSNwrqvxYG
	 Q9NILWEbw4ua4qjw8sSAgHLRAdFK4D6NHjxS3abvqusYQ5ToPKPUDkkbB6QG/PgI8T9L3
	 puMxjphpuRj/qdE1oFC/7cHgJXbzOn1LA3Z3/IUPlUQzY6MAAe4wL6mvNspj/G0EV0OcF
	 x5OD6n+dgF1nBnHEC4w6aeLFWOkYXq+z7ll+b3S6KYAtBwi5nexsGSLEBytS2frQ6VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
	b=1yciIcTtq+5yLWfgfrzJIkhDjWkfnHdzzJc8cbMp5fuHDhAFT1hE+ijizOQ6UcV1E7eU
	 Ywnx5ilbgJ7NfzA46kI2lEIo2YNykleOZYQBYGTcVUxTT4EcOzpzWIJMrhchIp0yzFZWl
	 nlAcoZX+NYy0yOIBw8WtNBOloEKbd0XG/OB2dKfdGj60C43S/oxsEtZZYsptOjOnsfw7n
	 ++GH3PjB7Oa6GyeSzxFLcZACpWvxUa1iS4/ZOWRjKQ9h/QZSotSQSWQzpmsCkxOEUUlpJ
	 rNQJ6ar1bgVH88o4qEe3AwgdLj0rVNVk2WIEO16e5ivNphU730a6XCGdlDpXIWsLtpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOjvf2ye;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2260A3556
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B2260A3556
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOjvf2ye
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpReY2991954
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIINajvqYe7V5t/tRiFthv
	ALg2gMWiPdTmYACRy8vkM=; b=IaJdH8oJ20nz5orfJN3GvO+K2E3PG/dusVY5si
	+VYiM2CZtS3gmduNpE86WUpFgZHuScLvTiYf3tBHsOdWzAa+MlWVS1VAKGGrlvl2
	mURmga18RS1Nosut268iPqVotQvIcMPq4CmPizrYM913gFhSP7flGIQ4b0efv7I5
	lxVv5epn/gNRwHOEIFKrlre3MUWZWcKh95S4TpVZS8bEPJK44jyyhcEF/Mirqjvb
	/Ofpv2w/qWqglu0Klt5QzW3cFnLcNujniyH4Ac10P72hcmGcoo3iUwEhac7+GHpp
	pzBSykIsAnz5O+bAKco1Onwfw32rJjanjI2cpZNNAMUs8oJw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgr37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:28:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6790b1d3bc9so5116194d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629709; x=1794234509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=NOjvf2yebATNf18CFef9XziyGaVju9ZgNRADhBCj+YuvrE1wkuTSMzSenBywuKaCx8
         Lwzj9fJaZkrpU1gHc8eoHavV+up8bAyUXBvDChu74+mKtwJ9EyIPWe7/Vxh4WCBLTOsN
         4dTzwzAcrzfxRMpFYUxTSLvv8kyGja2cjWP1sQSYZGlckQUdoatzKMf/mE7sJlZ/ZM9l
         JdCzhXV+xZFjF3ygFHiSV+ccUSBgl7h8r2bthVUIgiZ6Al9Ae7OhsqYucklwByjmMSic
         uV/FchUqZlrfuLDeHsairP4n/VucXBxZWnV0ea6ANKtLQ9tEoBT44u1OKy3WUuxQC70z
         aaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629709; x=1794234509;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=D4em9T49c4vcy/eLc0AwQJpB5Cofe3WChSHfKMjRkkxZJLFYv2S8nImdwuPAlJTlqo
         9iGKGCESaW9+a8MZT95LdVDKvp/9VlqgMjAHi1eWrg5SKvcxOht2TQl0B3buSwiJLYZS
         cu+FxwmbjaKDCjPOjrSaahPlryDD8/6HySBPM93mLvdsWeI2p2pFwwS9uSxiZe2arDT1
         1lTcSPp1pfug3sTSTu4CN736lg7s/xCcM3UDM/gGLK8kdE7Zz29/SMhR6igePXVo0a9k
         bH6LsUVt/n193wyNzBggXA1QP5W+5Fe7UGHX1svrHR2l9rg5NPIy3M4pLphvfcCFH54D
         GvFg==
X-Forwarded-Encrypted: i=1; AKwUvBx6LNPG7DehDnpdSCBVnol75eyVENrLdrOSKQW16jYGraBj19siTB4dPkshUYViO+5se87U4uZTvDsprug=@vger.kernel.org
X-Gm-Message-State: APuU4Z89wYoPKYSj5S+SCRbY+CEsVdl1cjibbvCsB8c5g3CEVUv7uZT6
	uXiXS6z+MOfOi8fvgTLgSd+IPvge0IiJtGi/d0goTvj/N5DVI5BDRScCeBzvJQgnHHtGaCflsBs
	80g54BVtPAIrV09r9xr4mhDbWsmRxXGiYmHIXCQd9Rmao3kNTRVTqMotcScAAFVH3iMM=
X-Gm-Gg: AYBFou07iQ2DvA1H4NIjagqsKtgf/oqoICy4vnkSxgj12tsiI01iXT98+AUISmdQCx5
	wNmEntGZbpDvo+uzblw4UMjBDsmoq20gdamb9xcC5xSTDoLn0M8wFnYaElWTM6/NV78r5+8DGpb
	X2c1fDlsCiM0j+Zmslx7NzsTH36+Rlac5mG2g0wwD06xNomUf5ztoxkz0BLzMYhKinC/+PauKDR
	f7ZZFEtUnotTlCW3q2FVZxNYHS3oGaAur2xwGx8DUvIcaLIXc1yOv3vC5BSbwzEcjo4pKl8cwl9
	Q+MVv2tCLu7CZ47yvicDyk1doq95cLwJEXNNEiixXH9LaR+ZNrzvOhJr2r8HEKuxyKthzUSl8f4
	DEuNLovaV8a6/Z5VkJ3sYagqNkSbZYGORL9kUNl6J35JE0ZPGMfHOzq6TOf9jSsY690akNTiU
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660233d50.4.1793629708849;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660209d50.4.1793629708148;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
Received: from t14s.fritz.box ([2a0d:3344:53ef:7b00:ab30:5358:f91e:42cf])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf27263csm5188775d50.4.2026.11.02.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:28:27 -0800 (PST)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        akhilpo@oss.qualcomm.com, jie.zhang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Date: Mon,  2 Nov 2026 15:28:12 +0100
Message-ID: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX+q0u+1rAK2+m
 0us4Mx/XpBxc4kTLkfy/zUUCY6fNvV7GqqIWHzvhNblBqD4wFvZGWbw8X+SsqEnLkCVpBIp/RIv
 rnnVfzUfrfDhoqSq7+A7wtuJ6cuBk2tz9oYr9h7lWxJ4swpkKr+9Y3cjn5sn8dtigHy3XJMx2aL
 EemGs/7Qi6hOHTXMorcg0SlDD6O6AkHQxScon7gaOb1lL3Lka8jDKBfdrgvNzf2bYK7SCHGMmmS
 WIlYZhogd0ngYfm0A1zLdYwtnTxFronSYefRbBVXZ3oa/79HSsIEsvRXm8DDC9P3BbB26qld48+
 uOlVhsCK0T+Fia+eTRES2MGf10goZVFSR9OmGGCwaB40KZ/sBt4dDjEu0Il5X47jM5dqvXvg82L
 cKS3JwINi6QluhOWHlbR1DjX3BDuYFAHTbuYi5x8P4z80iLK7eRyUBsh9H+71Qo6j0HT5AavzFA
 uNqgyIyObzk5MVpqO+Q==
X-Proofpoint-GUID: qZdPNMt5W23HlxWArb9onpu3jml_RDYa
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae89e0d cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DMYfw5cCtgNNA2bR9BoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX6hNCv/iPWjPK
 1FI0QQVnirovahhPqpvTKasByuFg/06ypqS86Q67UaH15LS4M75rpe4xPgNM/2Np2l94Vgz8WLJ
 kaaJUaTO2kSrB+DfM7OQOO/25B1RaWM=
X-Proofpoint-ORIG-GUID: qZdPNMt5W23HlxWArb9onpu3jml_RDYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
was introduced, as the Adreno X2-85 found in the Mahua SoC was not
supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
X2-90, which is not what the Mahua hardware is.

Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
driver carries a matching Adreno X2-85 entry. With that, the nodes
work as-is on this laptop, so drop the board-level overrides and let
them inherit the default enabled status.

Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
and Vulkan (turnip).

Assisted-by: LLM
Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
---
This depends on the Mahua GPU support series, specifically
"drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
Support GPU and GMU", which are not merged yet:
https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 255857cda9b..189dc3fe542 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
-/* GPU/GMU not fully functional yet on this platform. */
-&gmu {
-	status = "disabled";
-};
-
-&gpu {
-	status = "disabled";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 
-- 
2.53.0


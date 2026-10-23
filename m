Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775916;
	b=J4I9WtoDWICKwLwu7oBZsr7TymPslBSYfdpxFkryxmngsX3wDcCwnLVIAeV4TBGrIQZL
	 4niNM2CI2lVT/Y00HBFzIdXpyFhByMxYKEPzk8EMVbnexyI+6aaAHWaRwVE/dmbeOJRb+
	 h5hpBsNpz8oi/k/6ULqDUdbxglzKExTuCrDlV+aiivau9shiTzWa4Pac2d721gurNZz0p
	 wfsQw1bgPo8B9E3cKduSIHvRI8I1Ux8ZBwBZix0ArzZJIM38H9bTUz9xc1E1BrS/8zJMx
	 GjEQJea1GOLlZy5pQGara3Rf2nqH7LN/J6RmNCJgT6haw021jigPfSqplaR6IHXaI8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
	b=Lz/g2nZ+nSHWsPv7dgcws7MIdzXO6eaov0Y5DCRiXU4eDx+7rJjRDSxqzNEVFjsB8ZrV
	 N1rmbCvdj8OnHOw2pP/rBTaZrCnVNNcJuqea0mOugbjJGTZAJILKOJijC7htx1RcRY+tG
	 gD9kM95UwSJz42GA3OTGj68tsdbzcXBaRk5m8XBCFgp/3zCC4kM/H93wKgRjjNF3m9cYH
	 DtMRi5EeYegE4jPXgOlsgE8P+jmxYUSkxnnfy0XfBApbo2V5jBOPeqOZBA/iRKO/v/n0K
	 ED9aQWhQzAeMeb3g8AgIaoRe4brSt+WVp0vQA1d1a5cd0Vjwky7HkAT8O/kRJxnPTgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF8606E9DA
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DF8606E9DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DhX2462575
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nuqdJUBgvz
	q3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=; b=R45wIbQgErXsxYdYO1+Z/I7bC1J
	5d4RNR2zv4FYzqgC34lY9duBrZ/xFRw8HUGTsrjbL5lPqa3AB8s8gdHkRoKMwefs
	IvsHWvvVSSfkR05tt0Vd3XV/fXJ/XB54sPBcqDZ1GJeQOTsJwv+MG8MaV6lx8CJf
	BvdahcESu2MGZjr45UbdqcHn5lqcPrWqpmMprb5DrJLDP/3EAmw9EVpGV+NW7jgl
	Xnrrv1DiYsJSjGzGLWm3fPqGu8ayFg4kTgwQGm3A1lXHSUeBGwpmvWk1UugJYJTe
	mxbVMTGUHEe5NWM8MSGmcuBo1QYoOKHQ/5mBbnebitm5UHvzhGdkJtCJg6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvsm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so252591285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775909; x=1793380709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=VetaSVmQRVXif5aLmH2WoNwan4zvnfkl7uhA6V4q3b4TnTRv+GdyiSFHjbO0JPuWm2
         blsRrI/cIDMRnvCYI+lhQomai303gm2xcy6Ko/W65Qf9Olf2t4C+JZ1eVhqw5G2jLK5w
         +7jHtTaIiJdCT7ouiw3jnb0YRKpnCbRe+OVNka5caqjowL27x183My4/hcGkftI9TS+7
         QnPOGaSsnT9I3VHAtKorHpP6JsnuC28wwW5iYighCr+qoSnxkmfBsg7/TkURBqTBE85/
         EizWQArBtj20DdiIYO4lDDVRBs0dj9cB4XJW5NZQnfvXuFX1ANH54AxSfT0k0kGjdzsE
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775909; x=1793380709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=mzscSvUQi2QoO0yRqimV6tcwzet/hw/v4OO+fkiLUnYIh+i2ml82E+8Y5cMwV1KgXC
         j+N3zdw77xWN3C77seWfhF3HDqv0uS4YPQo+9oLBE5lXfpjL9BgJV7zqQkEvkkWY2lxf
         6UAiqZmNCH/dD9xJIff9dD3UfNK852O6A9lXykpUc71q7khbjwFDOkggy3N6X+gZm7WQ
         Dfco0r48Mmb6iZZshRyIXjzx6amPyqgP2wQnb6/VAuhO5LCRPUrwKrGL+o8tCV1n1jvp
         VvBmoUfafM8Y2f1eQZoLdV3lLeBgHezyyf6zVCu33+1j4WxbaGWmhwbnjduhg/c1jgUI
         zWdw==
X-Forwarded-Encrypted: i=1; AKwUvBwGpTS8c3xO+vHAyG2P1Up/+UDPytkQooV1xG9Q4bVshnDi1n/yAxiN5Fp5a5XW80rqb174BxB6yYHJ0U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpL08brJZdKin4Y4MkytPEhfaLbQtZx4lSFQb0xdCfvc9Y9J74
	J15+cmXzKfwoFuNUAJQffpR7JgzGJYehFggf95IZEdX29bNsIl/VoS2cOYXSWob9TWk11tiOq2K
	wWXrGqRjrzAMpiZoGfjs7vNR49G8xoc+fxlkJklcpfPkIwQpTSwe9sB+CSs4u29oMDY8=
X-Gm-Gg: AYBFou1KabRKCwlmlEHWk4Q0tEofQXW0/L6AvYiu64UuOTtCWFe/u6H9h7tVtjRJRVh
	HqTVJ0/5fClO9xCWcrt3Hu4X8SDH9fcxCk9IzCILYcmIkf34kdkJhXiS+ySMeqTVnUhM+1T5BGf
	IJrmKN/1jEHt8EvNW9ukcp7sSwCTJRC26i2oE0o6YggReKpcHwOxI9fTHqLOADvYo/TuvQJicfi
	CmYW2+/MflB8kmLwV1HXZtwmy3p4GNM/3lw6ayElHKcoELto8rJkRXDyDJHia7ylRPl91JyJTwC
	JsNJG1bUQeUELKLQ9+GVQuX5xYeuS06fvXiO5kQ9hmvE4lkUrpdFknCTnJcK5vNOUkiRDAAEOGp
	vJY+nHvlCg86/
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545741685a.22.1792775908756;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545734885a.22.1792775908118;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 23/23] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:33 +0100
Message-ID: <20261023171433.820092-24-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Utl8hdiiEunbRZ2aTdiAT8_cW3RN2G-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX56o232/mfWif
 riI4dfwnsUx8VVGGI38Wa89KGr33Kwo/rISXG+v5Ic2bIm9Adu1xmkAQ570Hb47MD2p2YdctsDr
 AKdMcNNTl7zkeTQRwf59GcPQJdswtjr6avMRFO0ZCAUFlaK3FeJhI2BZbltCVTGZruq2dMusaB3
 ue1ZVyhoaN52ikT/z8QGi5q+5ZpDHG2JWNwzISnmz8btjGAOyVRklmNK7tEeHGc47NWiqPcqyDy
 goTcPR8ELb1ZFQ9tvt5ekFMS+Og9AwDbJmaO4N1lorut7kzZgwJa9d1XnFIp/OcSf77MART+n5l
 SD3B924wC4arJ2TD4X4kdizr4oRnJpiNukV+zhr/aVSkxuj5Wy21bOIw8QmPZIGXqIuELb8nLQG
 +Ll451pPYCVNpKVm7wgBDQguU4py1VAmkVAkpa1RxJwBuGteF+O3RlUrggOva06zER93AuDw2ri
 23LGvBA5IspZssu63dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6tb0/vARl1sw
 SBjLkfiJyCL8vGvcAbd/fcSLDkWmkR1G25fGlcKt0rhMJudN/MNNV6DllqnMo1sKvF173GBVXDG
 pwVsc97qbSmCPxJXYVnSfWVR8ljsItQ=
X-Proofpoint-ORIG-GUID: Utl8hdiiEunbRZ2aTdiAT8_cW3RN2G-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..d6a921b3c713 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -268,9 +268,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -928,7 +939,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -940,7 +951,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AF4A5C42
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061581; cv=none; b=OFlztNpPK10iv5SsO3wEcVGi5cB/89Wuj4ER4LSIDK09wqKWByRSOmzV2Xf67PG6aP3zZ+Y9G1QY6lqIFWc4/iZTT0C5dRVNlRYhITF3p4NCpgurtuLw2AR/cc7s1nPQMQozxv9OxNMDf18bFavs6tFaOgorlK1zE7tsO58J8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061581; c=relaxed/simple;
	bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYece2vO+C+oQXZ0K5mepxxxxU5YlLlC8V/1VqLEo1dDjF+xfaTpigUYBTxNjgOgyMLdIJqmq/vwW/itDDA13Dxx0/c37buFlC5bpUt8h5aXR49xMKixiFzsoKTNIASNLWHJurBYthjpCEy6Mwxwd13goFlD9oV7IHmwnFWf+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/2QgHXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErUEtxhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/2QgHXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErUEtxhD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdFx4100196
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=; b=W/2QgHXGhs6St1wU
	i/Y2fJ/zPfrar8ziSE/xeASY57iInYnOMiPwhPS3HQfiS3/sr9dExcP4d0/jCW68
	BRos3AtY+3yYMAMn6MnPSOGwSjHA3LJtHcMvJfUhobqEw2tFDCQgjGKv5ZoPjnM8
	1/GuwAhbVuaCeQ0ImRpGBJ0JseA0nM5+4RzhZLhtwvlckw0w+Wf5+lgdm13rA2+Q
	8ElltxG9/D0fJOyUo+socE3cw9oOb4Zzyko85nAjnMjNVg0hHCPMw+SMsh2bruMj
	aXxAcgDD53t7+3nu0SdeeLQ01F/4WP4abiApQfBxwEE0IhusaatBhwfbxkqTceUL
	VYvbgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r833q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60bb65626so55856855ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061574; x=1792666374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=ErUEtxhDVKfBYKijLmNKV7A8ouL5VDHWJLCRlcLi7kzHMH8mK1316xAoSW2S42G5ol
         Dam3px07J2+a94Jo51WIAYH+SE1RnIC6LpQl1r2qIki+kjlDwgkgu1lA5BU/eKjXIF6O
         DypYpR2kTWgqBD2HT49CboLejW8sAgpH6tsQeIgu3Jux0MsAYrdpXQy0zs2KRhK0STQB
         mWj6hnNlEVIW0BGEKjFbVeAOnf0pLIlYpYVIzXnPR9TF96E8U04BZfKtr12FQZkRRq6j
         omH7K/x2kxr4Q3TsCi6MLSaPUYTsYI33kOgOdMXA8kkFtZz3g8GW05bBwiI5k2rS1Md8
         cd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061574; x=1792666374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=u+9OoVhKZpB5z0OqCgK8EzlXVblsuJzXC+M1kSnyRtztZeOsJBqyA19dSPgC/J2IIe
         wJD9z0epVxk7ZfjzrxcmBnQlHdFNg1/RAIvAcPpLcwjnUTkopJutQjYHPJYa1qd/tsEm
         /P/pGdZsqVFwcoyFUnLlX7ddnp88h8aaTa4AgJ7wr4w4RoDNVtWNUPUUmNn6Mzi9lIxv
         0ns5koEQLTbFWckMAie+MFsuLkTe6WAQmsxTYO0ws4CA27WBKG3H2yNBq3C2MYPNLmrM
         ezH3sVuyUHlfoPpNtjRxn/fRQM4kcc/y/TAW6c5LBe/B0CwYp+GviyU3GLpa6ya/uWox
         NLqA==
X-Forwarded-Encrypted: i=1; AKwUvBwLRl4KMkS+61sggMlrV3jzhdM5/BvGIbElW77faDhf+JiZ33BYcQoa95HVNt1qvzBULhdYz5kdqBw1/iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuW6AAXGbSqUqjCB2VngLDCAdhWDLq9jF+42lNTvyQHHpz71xw
	YZ1312Uv+tTkinAct6q4Rs+TdvVC561tvlTrn1knxnOn1eYshHW/lLAByBNHOkL+EmWFolcxyVD
	q3n89x4rMajMy1rr2ZEUCmKeUgHJVKrxITwYuLsjAo9cFnJZPdL0jZet/tyc9OQS3MQk=
X-Gm-Gg: AYBFou0KT7D6B1oTiZtkoUNJAFFf9+jSRiqAF8+zEo0jTxOfCgoTL5TC6N63qDUk8pf
	g+E2W4Z/OSUC1hA87MrZxH569mOJdvuSj6cYpkaC4J8Lv7ZX4er7Fa7MusDpLyaj5rx+hbs71n2
	SUTdL4WZ++ponOwKAhrgz4unfkAceUOOd1jv6b0COuYeKq0iMo+ToMyqN2VBzkCo0RrfcRc/oTs
	sTXmcHGfWVA2tAgeQMgnxVXwn5lh57pqbMkH4cbf+MLR1K/MCyQKcK7UGhooqLuwZiByjR6w/id
	kjh+vLatsgDf95wVyXpHSOAsSqyvgv//HvnO+71gHM0w2HDvcRDmZxZ9mIBsOgkLbe0KPlPUFQ4
	7K7mCM8RfuBkxtQ0IFl/bXiLgNLaEOg==
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847325ad.39.1792061574063;
        Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847145ad.39.1792061573574;
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:28 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=1609;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
 b=ssNeWwp+Z6JPGn+9KZS3XrKGp9rToWKGr3QX+4qGvgYlS5VrXm62oQeZU+alq25Xe+uqY3a62
 +65h9wZATt9CIONXxO5+VzFIc8vzuwWJeEC/f4slfwgQIyaxXowCWZ4
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX311zU+jG7e1g
 bCmU0bRQZijx76YJCMNq+RQDc5T1Czhdj4vkb9+zlKyYlR+UnRJZZkUM28I7gemHM1qPWSIGr5p
 pK1jMsz5MQZFVV/vQqt3sExxtA4p5Ho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX3QCVPOKvILbR
 wnOphNuDMffIB5XYdeHZsMMTpVKHR6f2SzFlSu8C5ejquXSLybAM/AtK54QuZphobZA4tE7NA+A
 pBkMjTfKnCxX5lkYT1lu9al44AoGeB5Etlhp86Z6Ea3YZDFLqO2uOGbLvpg71u/Y9fZs1uJLuOU
 l7TvxGjNnOAVsrL2unlipZfE0t7HFnEm1D92noJrHVm6WKXfjyNaxXwmWlK+9f5JA01tl3Q4UKj
 uBwShmsRFPjRj0xWALYdc1KRop5mV2SJINPEb45vlIaA0H1PdFpfIUWavYapzBCP90GtTJzi/wK
 Zo4P0A1/ecZ9PHJ9/DxIByKF0O4kY3VHGGki/szyHW33jExHerE7iF3nTYiErvDEs7SJsIJjYcm
 vqdOWVew19InX4lCqOeIZgWLILxmBGZaCfsWQupxMJTlA6Z8lGK9clbIP8XQz6+M25Y67PRftmo
 HzaVKd8jrGBL+johr6Q==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b086 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XLrFv9MQ_WwsiHGvDjkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: udZoM7RwdfXRYafWWPFZZW2TiOoBZLQv
X-Proofpoint-ORIG-GUID: udZoM7RwdfXRYafWWPFZZW2TiOoBZLQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Add pinctrl definitions for camera master clock pins on Glymur.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index fce3651c47f403e01ffc2a44d6d04a4abba1f310..e38a3cf5c9ea27e34f1ce312800965fac640b57c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7148,6 +7148,41 @@ rx-pins {
 				};
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio101";

-- 
2.34.1


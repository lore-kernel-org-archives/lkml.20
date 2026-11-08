Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143965;
	b=HPtnK+WnPRCH5cii2gE5Wa1eHwLzImhwLCIrEtX6rvwYyHaXItvbVGn0k2+IFAH56zjS
	 lAhnH8FfwxQzHEd+RuliL/mcG32/esQjRetkprNm4eN7T2tlRKNzHlyr2znDUykeQlRCY
	 bqgACn7U+B5e8q9wXgbgpmw0sMNS6gvYS+YxURTikZLr4tc0naoUs9TQ81a6iIWtnJ2It
	 4qirhk5MCLjsyghMlOtoKkS8Z1Iad01/gN/Kxli1AYelt5uj5VPF3vWwU2F0sdRRIwJWM
	 5hDi87/1l6Cl6FqU7m8TcnL0/z4ko9jUTYUTSnfRZ8siiDb0sMJRL+379E20oRzuv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
	b=u9f14p/rPDwYrtkd7YujPnHw8fQKAiAZxHueOqA63EMAQfPE6zNFCE4dp3OqHXuhEy59
	 +AWIKYtXTg3F0bb6t4g0lJc9sFqYM1+1actufuZNHVzMGWW+ZYEgN4+XgGhXmsRZDVReo
	 E0RLa+hQHEl3KqzCgpPXnDTsA0agoNfiBCV5doGUsdU2R+KxElC0kYQnlJGs4+ei+EwOT
	 ZEOdXihG/JwOgFgSwZrr7GfQ56nrCQGNABhriPBUwkJawaGlYqmh3qBSKsGs8x9Wb260O
	 ExDkKzphGPdNFbrHgVhZ8vPZoJr58y1qajhRcBBW7vqzMlaDuHjd/mkEpN28faPaS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7347B606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7347B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ah0X4285015
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=; b=mJb+vQAK+qKuQ5vs
	Tsruf/KqugQbkXCuoGn/evxlOTchE1/QLQHwJBXXn169QltrYvv5wreM0ua0efwk
	T5vmFlSCSynprOjKS8/xdzHUiU7QlKIrfo/2D8c3wmvJvu3LTZ8hxQB0CESQYxBL
	nrBconEYbjucACCcu4HDt1c2eIVpbMpIeuU7/3IV5Pecj8MEJX0tHexTBS3vXBE5
	11422AiNv6kTlZXOBxwq7jyh/XhoocDCLOIFrmC9yyUXcEBTVI0vKCKXPl7HncCp
	RcNRA1cTFcz9PjZdJIuXdBVRgMWkacbLqVdWOJBWIBtwQO3Tvlmh+L40CsAB1ri7
	LI+zWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jswq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso243086eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143963; x=1794748763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=Cxvu3XtzGCc5/7HWJ+EPA3OtQIY8A3fLLHQYSqEj+71QrML4dlQOF9kVArEoWjoKWB
         sB+LwtbxvvAEc5BUmGulQTMN72JkfZr0iK4HK4YUia68tXXuaqLH4SzcbsVxl1hr4oxt
         Vnqs2gDFKsWTmFKMlDN1auQAvptr5KCMNAn5IpppmOOSvdMXIHCIlu/lMaTLG3VetO/d
         6c1rosYtouuYd1fPKtN9s06USdetZrBk56wcwuQo7lTtMBQjeTcvbAYo8pP3cl+9SdMF
         +WXA3Sea+85gB5vIVrHupEARO5WWcp+2T73hSQ30RRcx4cz7+soh2TzHxUC5l+ZiVHAb
         1fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143963; x=1794748763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=KaODp4ZnURfybr6YhTDNAXga27aEP941FTtQaTVI4YBoizo7UI3bI2thIDn2EipxC0
         X2Bpcb/P+D9cOOmEX7bN3SxuOEFkX+nnicOLMrDhRCBFWBV4jC89RNN+vklHEWLACz3K
         2S8BW9fMorNDUtB+7FurYv+7nVrceqKq0hSCWf8iHi91t24wyqTlwmWD29n+nysPDSjP
         tDd9GHueOwe+qDmPB9KUwwftyjflIoiUapLan6pN+m80H3Ras3DgiNwrpKtP8m1f3LGA
         YYTlV5TApK4w71eF7YnvUOZv8vVS+b0/ztvqsspSlPcttZT3ovN4nDOqA1hYctupoekk
         Ditw==
X-Forwarded-Encrypted: i=1; AL+hErGY0WMwtuFr5zR04ExssR9/huhucMjuOXKCdbYZ/V4my73BtQiixTVQrZv4fija4tJN1ZL+n7hb7w+GKTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7OTzmwYQojiqKEDjxzeesohpgmnN0lAeSSmwOoD+6lOXEsEr
	7IzNAy7eKrY3tAtXc/P9ksRMMNv7WT2obqE4D5lknjjvQkF137OjkkXXN657sUC09VtNZkD1Kpg
	ey3KZH19G5F/cYZPnpxMldjO8outPOHHUeu0OLEvpE5vq4LeegB32S+nGvQ5GKko+TD8jROak/3
	A=
X-Gm-Gg: AYBFou2VwSRf3ncn+o2KjVzGt2QdbkvXMekpodlXW7pVzaVsel/WrOD+dVTFpmwIceC
	FulabsmsOSBFUeb7HG86HjERzP8czl97/MyesgmpBaCYF7epu1rQqji9QhyxE8BLzfXSmxLrQ+1
	HNARQA5kexOB0ElD8z/X7asUx1pWeBRbLFt2xOT7rNj1yElRn4BS2a40gYW2xIvc8nMO6+Zzevl
	sSQTIqLNKCwbNPCVjaDxUafUn+JUKAUpXDUOOkrK8XamynAyki1j0fVDmRzNUuYk9OCZooUm6Wc
	L8ueeygSSFg0uOhqGz+Z5t69Gw45DFMGxNEiYF+t1oktdsRqx9wGNPu2up13NcrQHCZ7r0ev1xj
	sLoiRtQYAJDM9ZD91jG8papZF1u5FGZzk2kdWOCV3dnZaINlYmkSbGLJX9g87BRQQwKk5iGygXX
	Xf210=
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929518c88.0.1794143963075;
        Sun, 08 Nov 2026 05:19:23 -0800 (PST)
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929501c88.0.1794143962553;
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:29 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: qdu1000: Add support for TSCSS
 node
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-8-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: -HHyIeWUZVlQ0WLDGY7zi_ZWgwTbRGnc
X-Proofpoint-GUID: -HHyIeWUZVlQ0WLDGY7zi_ZWgwTbRGnc
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af076db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pCDFdeNEuqTB-y8mxvIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX8Uv5z3tQJeqU
 G66G4OJtnjFmZKYRZOe7uD8AREYq/mCo+LxG9v6E5s7i9082wI22uM83NqjAsmES37prnAhi5c5
 4WJRala/XlRj7ArVTwhHJ2ktCVSjgNtuaw4gHlzhpe83eleiBueCLg7h16dAZreP1/XSx6A1Wck
 IX3GkUmcfET3GJ1GJdNeOCQnwWATvFYif+n7L1L2p2UnzoEuIcDKxRM3/Pr0I4GhS8q9qcq31Qc
 fJWlwfMLf8FnalpIfEg9c/5Tx5EDcAN9+I9mxpzqZ3ixskDzIbrT15sNYt8am9ExcJRe5zRykFY
 2V1UAAQZmj7EpmaQqm7RBCMl5IO5rQgpjC0PmAxJrl5T50FZgtK7boejR+jOrVM2zMN/tDnHuBY
 l3cpurfL6EDf/8GoNYQxd5yf9qzQll9p8dcCBzIpoGgJKrs0GVExLmgI6Iq0NVT9hCpQ9tgtl7/
 rzXh8wJhm8JnYF4EuRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2p6mAaZ22Hcp
 Uth5Y/4LB2+i3KMVX44egZHh6E6tfcpZdMj4/pCJnEEiDUp6zm2MF1jx+L/b27pGDUfk9DbiviR
 r9XFKD6OFr7U1DKccvtjhKDY/SvE4TY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm QDU1000
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..0f4028c41b2f 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -877,6 +877,19 @@ system_noc: interconnect@1640000 {
 			#interconnect-cells = <2>;
 		};
 
+		ptp@1da0000 {
+			compatible = "qcom,qdu1000-tscss";
+			reg = <0x0 0x01da0000 0x0 0x2000>;
+			reg-names = "tsc";
+
+			clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+				 <&gcc GCC_TSC_CNTR_CLK>,
+				 <&gcc GCC_TSC_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+			assigned-clock-rates = <500000000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x1f40000 0x0 0x20000>;

-- 
2.34.1


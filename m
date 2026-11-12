Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470592;
	b=xl9cNXb16ptrH49Ed6f6Tyvm6oHUXHNlCE0iKh7XU7CeDi90dHp1hM+/DQIQcKoZJXVt
	 aSLcyJYzHQO1Qmg+UDWJbR1V49aYjOniyqK/nkTz6qSKzUJukG6DqYNuk4ijxhmVCJne9
	 Ozy1+dd46VLjuelqCuCgTKhcjHbN7ln0UWagiuQPT2o2+j+AaoeU70vut4Ta7i1m9T7Qw
	 zJifq8qyn+cIbZcfxTTek08hNFqWsi5syEblQTs0prJSJsbJxtayGz1ZCfwoiiGn5vigT
	 ceL+2uEEzGIdAoBKhzcHBapVPBvyz8JO35t8XKns9Lag2GStj5ZC+yOQNdMveXgVeAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
	b=HSBfHOPniQf6HobgRDLdMZhRk446DCIZj8DendT+rEak9UHNAI+rCS375I9b+utqXW8G
	 sV/b5Gr9DgojD2R2PnCknrCfu46KId87pzV0dClMAvuUId3Ing56IxoQFCfWJemkpgN5F
	 wRigR1qbkXbwPk1UA9MgYg80sKNlhYbgiSsXeQWZeYiYokLfR4Fl2iBWYEAauRcgRVOgw
	 VjcMr5QM43/GaZlUSFLa3pCY1+2fyA1GluvLxzkBnEximRY06wJRvixATuRmHBgfXkxfU
	 qpNwhSIhW0MdPFEHKsuOMWyHHORCVbtsivakdqHOOsP2/moCNjSSK07OyKM5y2e4WnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MEh8W/pt";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174D606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5174D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdL0wFRf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEh8W/pt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7is3v126041
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=; b=jdL0wFRf6Hn5LMZV
	c4Wyu0uf4e9YIuxbbm7EDDu3gx7zdl+gkN0koMGuC23/o5U7BcLiaHSg5Gc+dtGc
	1STEW98k27ENuOfBB4eOU5QRkmg/toHbxU2Udzdo5CZQomaVGuFTg8KYuMqvB6yP
	bdIxLNEuIfYnNMeo1JTnchAvwRV7V3DU8+TjSIQbNKTc69bRQ+xkWpfYorLXhG2D
	VzWSytzwBtpob+RExPk4ZKRNk/TnJI6AH4aNpKjpLNCwPmO9v64nTtA0fGZRSgzq
	CiH7106sN+CirtjDYZrI3WEM5if7Pw18yH4AUajGA5P2CTk9b4IwKfIcanVdM4sz
	DoHRuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a082ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2303867a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470590; x=1795075390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=MEh8W/ptjPqxuHU01Kygo1uQKHPf5MZYaGLKkZAXzVZPbzPQrWu4TDRFocm99wFfpi
         45mjuILxuwInEPU5Rsr/taMbaj4/imLUCna57z1htU3zaqsPl06LvSFyM5k/u+TWIhxM
         sc4LMQq0LaJsn5fsXpv8PufgQOG6HY/om8jt5klMo2NJy04cWRh9nUJCVybk6IAGvdBk
         cXbieDNuvhBIS5tgJh/5k6Y/7CbGPVLY2UBL+NTlkY7It45GC6kKAbnrfp8Yq2BZwcZj
         O25JlH9DjH8S3PgEeNe//KJXrBv1XmkDRdQRail10+bRdWBU3PIe/F5biKiLNMewPSph
         mJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470590; x=1795075390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LHT2Pk6v42iV77ZEgGM7n8Jd/aV4EqjkqJEp8A1OOw=;
        b=0ix2JDxFS6NEs4u6f7r09vQPOAzOPxfDp34BBNEEvOnlX+024yr7SMDuaYFm2ia6k0
         p0aPn5QWpuRy4+MAOi85lFf3mz4jgyNXc7/EHt2nczfvOrIea7Nls/VTH/UHFkvmiSOK
         +u56JQ0XOuoY81+STrLabx99yO77mVAEKa9toPGjh0SkJE8gR+lVEBFqx9scat7195h7
         UrNOvGcXcPHdik0q2AIxRmC5G6eWmigpuLmKyLnx19o9wst+F/r551pT2lipjy96gs2Q
         rLzmEjODrIytg5lsRO5rLC3qwPdAG0z3o5DR5ihKjIZ+gbIo2ncg+yC2UJfnXCXF26RU
         48lA==
X-Forwarded-Encrypted: i=1; AL+hErHpVi+EVXhfD5UESJJhO0JH+fDQi6n6F596AL37U0CK09oowqfprTRlFWcw24RvPJ6IRZ0ac/bJv+Vjz9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ExfqME933u5AFMiUD+7jdEm3/0e3ol7cGCg2R4wY49FehppNv
	eP8uecBVcY94wD+zq+Bgiq29QH/O6Y1SwdDrztNnijDRRO1sTAzaH1ye7xqGOd9fhq9H6EPCCF/
	rrqiFGWB+kJW7AS1QUSSbH0nHMHxq/vFPBGE3Q+kE8uWmPAP/8DQPQzvhnTqiNVoNx/o=
X-Gm-Gg: AYBFou2sduSvfPkF7ubrFHXG8VOKxxN/RU1h9PA5wLATN3OTvk5y3EdwqcA0iNtJM8g
	KPC7cHyUVLaFteynIq1soWc/JViEPPMgDrtDVLjogk7czG2gaaYtQwelFj9hZ/Aa6QSNOUhLOVz
	WV4HP6mUpqYM1tfWkaCE1kiWv3ek8KlIdRDJ74MZpSHn9H3KhEKvQ3ToXrR4f7Lv3MQXjYqE/Ud
	JUpF9YDS0HTr0ND3BD2Mm8GvUKrtztVm1PXBKXYGOkqPVf5d9ApWuPDVtb1hoIJu3lEMn2Gfv3q
	VMavtERjmgbqybjnGKBNhPrnHKa7hFYxcEH/3f61SrQgcQBo3ZU/4IQ5x87dE1+mfy08+AMBbeK
	yDCCLXnTd38AFoaPql+bCS/N0Z//6jtZWRLsKs5yymz8+t9kP2f3QwxWnihixpW0CbONmV78/+G
	4dKtF8PzPl
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019664a91.29.1794470590136;
        Thu, 12 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b182ebe947mr5019636a91.29.1794470589637;
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:09 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:51 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261112-nord-soccp-dt-v4-2-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: yNss0t-IGEmrGy8V3TPxvH5Qd9EKblRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXyd10eik4NMVK
 6V7FeypgCGm9JCvvtsxtr8bkSIS7xr4Cssb4s1ffE0Omj5M/f2MGEbbjG/nY7uCo90O6LKGexcs
 ndHnh4jiKIpHrDMESzItfGTQF9SrXkVngyZWK2zBHgCw9uVI3sh2eLBxSWJj937fI3Y5ZbLj4kR
 t7DuImvectk+0esjl6MGX41aEYsFNZUtAdhbZDG1c/2owcUy/isp8GxGH3OOfeozjHIfXcJukBz
 mU7sdkJD3H6cBYwj9xCgg6jHT2hGsTekWm4RRXXZ7bV6dHf+y63EtD69uftxthu2zEI5m7gF+wi
 s8Fyri0qMjkWTcuw2hRrwMV3ss4SJhy29TxCabRtVYWK6j7AI3Ahn9JVU8byCHOsfrbhigY8pgO
 brmm3nZaYGS2IHUZhq4wk5o6oTv7/lhbc+QTNx8goyl/qgMhMWXAs9pIkCXKbnFsHrEpTU1ZDFg
 g10AE6OHYqn+Ar3TvJA==
X-Proofpoint-ORIG-GUID: yNss0t-IGEmrGy8V3TPxvH5Qd9EKblRq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX2+e5YfQZWsiJ
 wC5m1zBdkKeThGcWP/PN2Qi8UNKxbl+qLkyh2/xTvHb6N4qBwIdYYVeKpMNl1VJGUqiFgXmTGAH
 j0+P+sVLvg/f1jONR5bNFKyHJOvfLxs=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af572bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0


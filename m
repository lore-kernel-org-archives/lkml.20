Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548049;
	b=N6tQCaqFvs/UOSfP+O/jKhgTj26WcPg3ip525gjF7IukYs1Uo+Hr2lcsQbdYhvapMSrp
	 +bGpV1lEbLgM7dKGdT0qhu5wT3AXtFeqOVxveR8loyY+u2as5TuMQo4gS6qVzoMvGxbob
	 VmFnrwsoxbGUqtPmFwETTOLTUUxV29H28TXERdSCn+W6VNTjeImd7J1lh01JP5Ng+Z2bd
	 X/7bxFBffDuIluXgyqydKt7fXWm/t7mh7198xGN79H09f7jxE2a87alHK4ANfCBbEE349
	 7tb9Lbz6/+tHsjDOU/NOhuXODusDp2gH2lyCbaJCkdkrgpkq8JWXfGU8NCdTklJ2ycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
	b=GGmAZ17W/UEJhu3CCVWpw1YHBjOHoaAhrqsJW/Z6qLh7r/g1n1AZZTg/M2wn1joOgtbI
	 LitrfBPKI5AT0P15hvRywYEypGNhSOF8He0v9/qBl/tVebwniZXoOkiY3r0KtTpgOzFbG
	 L5TeVl1vqfADWlxn+BeZTacGAOSZoJ9LZXUzO/5ncoKv1IlvuRBj45sLXYEiMbVzS+nJL
	 N0eRIfGkjb3o2w3isXnV2PJGmRmY+HHmR/hAn4Ib94UyFSkWAHS8ZGTU2fn6hoV/gORQa
	 nODLN/HOHD4aHoWahFdYg3rZBek/6aO0DTmOuPDfTenwNJASh9WppGfk+xhiTdpziZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1060A5BC1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD1060A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576gU073405
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=; b=btfDw3JW2Ox7IA8Z
	si602r26ZUVvjQPYIU1tKK1w343yNFumbcLZQs++bascEp/ldrfT9/RIV+KQppnZ
	54wGzfq2Lr7xwUMXYMow0toYZdEa4QSUZZcdl8pMXxI7BfgqgfUeG0rjYvF0IQ+l
	RoHZUx5G57q1wGTuggyIchGUw2Vopg4RZ4kD7Xgo7Yb425JamLduxq2W+jjzy7Sh
	xp0UC7xMC/W1qYwIJxZYNSjfMvFge4BRGxW+j0SuLdCbI+f2MPHjPqxoyuFI7CGf
	VLE8EyBlUkX2eaPwrkHf0A1Y9odyGs20yz7B2xEv3C2CrM1Z8/HBIqM5OdyuQZ9f
	/H6/ng==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03me7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a8eeb3386bso882063fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548047; x=1795152847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=IQ10AOerh5tIj0Ep81h7QKiNRTgWKy1v6hIwNKDAixhVSTYEmPrL8HpscEefMP53/U
         nqIW2n78/yKi1ItBzgnoeEX7X4b+xCoiCqHaJmh4KC4XAdEO40pfrz0nwFFMnBt7Gkba
         tvkk9lBmVzEt30Crl3NxBX4AhtWX0q1rOC0R9jeryL3eRMGcbxX1cM/gxqsPOjc+TZHQ
         dGGNos/A0pRti8vqrL0CAtW0xXljmVXJm/UIpX+yMMNIItUV7RVpIuzUiPaQftnDvhnd
         m+sBXGDiZzWcrVtc8MpyfJ26f4sPbulisASgA1yhLetPxdaMdO6JTZUHwbCEJ1HqpKom
         DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548047; x=1795152847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=yMs/ScCJpWGML8MIivFvAT1U5UnDkhWlRvPAHMZT9KvCsvy1N1EHW9AcSstA9WJK2R
         YZrCm4M08sZ1UAmjznQHsFOjkS+zvipXqjq3opRkanEzudDAbuiFjyuUN9v3bxqzewl/
         KQs7ZRKgRkk+DyouY74idPBdGHj9mgSeCTM7ionJl7wOj5kz4BhGOFwUB46NctvA1rW8
         kxBvf2mwa0ZxlKqEfTmftdMuCCW0FyXqdbilpMLeOwYmWwUhg4wLBVH0zCSwha+WV+cz
         jcfHdzIuGJRbU1/pqzn/RL/YbCG2gxpK/J2ZqH4cLUFTNIDwBMB6iX5RDXubw26VUag7
         qVgA==
X-Forwarded-Encrypted: i=1; AL+hErGdkxgUt+YDdOYTxO0KFLQv8vad196wtZrO3FDsUQEIHrCTT3mFbgbcFNBAeCxyQ3B8V9U0L4xu5/vjv9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/or1TgKlFFvKF8ZIATITUF1OWIcu6zoqJTNg90aYdKAgBrkY31
	WK78WO5Iaxb9R0Tqts8tC83E4KJay0NExfVO3eSelEqEzXguUuLVVbP1ryT/C9PcXR9oB6lfUs1
	OKQWzM0jem+0AwRne+IVjXORZeLwv/QOTDXH4jUHxGM8nLDHyOO+ha1bxDQtBpSs/oB0=
X-Gm-Gg: AYBFou0TIp0iCDKKlwHd1fLrv9Xs1ThPiaKzuaaMKINGiLb+KO8qT8FgCgmMRKuDsLA
	lmB8lM6hrTl2nhgxw2QIjBFZe1TE6O1GS2RKeZbi9A25OjOju82RCh5BLrMviNXVSvwUR7vlIPr
	xgqOswTCUv4ZuZy5wH8Lc0Bwk2ooC27I6UtHJAhcKIw0IFi4ftYJbl0ACZQLOtsR760iwKWhib0
	2lx9DhshjoBt6zs0uYojtGscMkDS2d3lMJQYFrsYPcI0OqH2pGd91kd2QKw9MLuhcxx4gfhAG/a
	GjTNYg+YBNCsh89il66w1g1nvShx/2qX2NTP+742FR7Z491cQsS4JnLpYKdd/vdfssS+cTuZbyN
	/O+P9ic4NHTFy+u0+t00ehnX1CTWxvtBVLWJo0LoqLmQeaBH319958sbuKfEbUCdhWGNsqhNAl6
	I1ZuN3uHy6cri4lym9tK0kOAbwCFamHF3lt6lqO1RNEtBbsAAnb7bF+pEq30SR
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812635fac.7.1794548047523;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812615fac.7.1794548047101;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:39 -0800
Subject: [PATCH v25 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261112-kaanapali-camss-v25-7-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6iGrcsyfoxwE
 hM6qvB7zVC5OBV8CqvrbkiOhf4Ji17Yzvm3zE8uQh8gJAMKQLaCzmR6Cja8LkJzZ0LPnrL+djx8
 Asgu7PCP2+YPCs1+9Pw7lngzWWVbpSqlt8YU/n2x6NyBtTxmgmmw/Vnz0N/kBV25i3CtZaVkXO6
 cCFCX6gjNa4FAmZ5gQcm1LJ2jYs2K55Q23109xJvh0XN2wMY56G21Gp0OER0ASjt9vS3q25D1I0
 7wnwtcRzsYNVnafh/54saisReiSWsKp8UFzLP1AvK1zJz8TTs5k5gr0nQaqMGj8sKComJ9tuTnJ
 DUyhYuVH2jpNfbk2WUfD/QgEChhxDnEUvbJ1m6hOfZuOrgoK84b7j6GL8TEwmliiKwjrswIgwPF
 u+JW94KWBhb6VeEPtr1jNg/+IuPV88efDJr04tb8HakaZaP67ERO/Any77aErFNLlkS+jgyVs7F
 8cgDX8vb/2DaMD6MCUQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a150 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXzyWZusiNOlez
 CowU7nxdORIafURSK9/7ufqxgtVI5xIrbQY1lQlFPs3gPG95PZW5CD5C16t/O4NumQ6AzCLI9aN
 DXrJgmQoBOEmWsvj5sSMEombNZi47ig=
X-Proofpoint-GUID: Wij_hEDRzgylR05em13jMdetWN6UlyrH
X-Proofpoint-ORIG-GUID: Wij_hEDRzgylR05em13jMdetWN6UlyrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cd6adf749c6f..f7b9c71cf263 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5602,6 +5602,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1


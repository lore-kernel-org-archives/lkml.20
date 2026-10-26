Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021865;
	b=0w4ejgsOjbFFo23/XyyWu6sNuXCHviCsmjkPBdHZ7UJd08C4O+bXCyL3/r8UVjNVGOUG
	 MCSvRtyXkqkvWVtoEBwVJYGYoG0nGYFuyum0LhhqnWL7USXeR0ewuZTVRfusIF3hP+2vT
	 CMqUQXK7WrCW+1gO0nwXzHhW8iUVlIaa3OyybqaIrlWr8w8RtGo5Wfu4XLc323nXIqE2M
	 ho4MpaUR3L5qlrbHlBp/LJYLXnYpJ8d1T6aZRm1kFatJDtgSGlsKyABC1odEUbuPsHYHX
	 RayANMbG8vDPVlffC8LwmlirPGPa6BACDp09z69nF6QTuU5M386jOktr+AXqwjlm+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
	b=2xbyWVjwte0Rcnhc5AF1pZRwsmIbXeO2s7I1H5dCTqNlFNqXZb+IWaEB+nFCgjty9wxj
	 OYKCn0FN0aCuC3fecZg08DKmPcjbiEue4TarUM9L02uFeHqKYaTETfrK9wlE39cXGTVpo
	 15jePdYeDYt+0e5SxzSAULD4wpc+CGQGz/TnG+R8tYFDNeoQ9XSTR2AQXn3uqNvzBFtvY
	 fBbr9SHcfRGTH2PwsQXol3V8GElPWmLydDR5/yAnyBON6E6nD31bdnbw+/fYHJtGkDXqE
	 SuH2Gyxru71sPA9bHcDQqFwwIXTNva8MchhtLZTfT55Tl69K/9Kv63IUSbkHUnHpN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802360A6F71
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9802360A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4oV4132054
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8NVtysIHAb2
	aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=; b=To+5xErFOlemyI2j53B+tCU3jyT
	Xq1t0PR/Ydkznmzbri8snC6h7Kr/QRuHhjjSs+9ZRutlIzgDtjgqW/wPDNDEZUz9
	Xey+tQQIRvNgbenmUND4vvLkRj3H8rIFKpN5w5bje3xZkE4bP4DXl51iokpcwGZE
	WS7os9MM7kn0pjoELYs5DKmc/mkR4oRqppe7pIG72cxHsT2GHwCN7x+yXyJ3fvxp
	X1HmZrKEG1tnpEbU6gVY39YngJcI9R0P6nUDmh1JGxmdAcI6i22fPFVALTqAchhc
	ARQDsv9a+jyunGkiAMWGgAgonoTRz8K80UeuYv6JoSCeuzVH5YvtDCcQ7dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0nsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c046843f1so53135326d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021863; x=1793626663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=bSAnt6cMZW7KcRLSIeJAzPv2oCaHlcXgaQgkn0WN2UemwkTlyQ+vXzlPr25Wq6GryN
         ZJyuQX8mTu0Aq9zAR48+56nweMAdOqPpyPK0dmcLJMpaeFem6NYOn71uMeVKvHenXais
         yPAnlHFBrPILCKf4FnzJy+xdy/aQtt3s/wKlLiZ/5akqMF+PZeIv1NdsY5LdEMIflC9T
         HgM4R/TP6q4G4lmOHOUfLIDRlY2G5TKMjJqkjOmD+FY3RX+H5NNnYOA6VjgNFOHrC9oR
         qpZ7BT2vfI3yo4l3/0eN2fdh3NAe4uxXpYZyrmWL4XunPpPrLQEdEfJon+Wl/g59o2//
         IK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021863; x=1793626663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=eTax6CxyxnJuoUFzyKNtYYTTmnUSCoBx9qGZDC23QnIU7oE+oldZhRoDPKbte1Bzz8
         gq0fdAC/ilFpwVZ8O8ofWFFAYPzO1HNsuJRWKMObYFlAr6PlCRFfDOXoC3Iu5eA5+5/A
         usnSjFC5nCHxEBLfYzfz21Q3LqxhvpH9lOReuXozdH10oLLM+Ru5SX4ZTiZhkG+MS0ud
         MwxCEj+QuGYpW7SXJyLRtEjDJrr1JqZlfCy5+z9JvwGxAB7pEooI2a2cjbtWcUcBjFBC
         VyyD9CYxX00nRXxxxaCHMZoYuSxcpeuv0sO8q5L7qAlPS8aTTm1YzJ9ldbimYvcIGFLO
         H9dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbUed7zteRuva7LyZrVN+WMpdxyxHP65l1pofCxRjmr+ckY1RKTN05v2TZZLod9hZiyn/7LJlWK5Wb1xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuPJnMoqpWmmEJkPTLv4sdnCPLO0lzFrBF6sAR9szsG/Gzyqs+
	RjIQecKm1d7V1PWi19c9wk712Ng1x9TNcGbjovq9FAHGNK5UqjePv/dGobug9N8VsLYIhWzKB+Q
	nC2YkZESvUgL1AytfneIi94R0yB2k5V1Q/ZMemSbOniNW+BSO3aUSAah36QzwfGglCqk=
X-Gm-Gg: AYBFou3+WFRMvdopShf8xYNt8KfaU6phSBjDxOFKcEgTqxGwECDc0JMWGBLcDSjD5Zk
	jJ+HlE9ZbAfeZbIoiwxdeer2D+L5I24eYAnoOaGM1wfHcYwgEz1xJTBRpjMa2oc681sN3oyHGi4
	VFpj6CaCpmMX/kfWB0APd3R5AUQdUo9uDdKP37b1izE/GxxsvzpZt1InkbEyr3jEPm7MSVXq85C
	w8VO0bo1Y1wHGeNwqu85r9SRZ4byUgt26GLwYwdMNeTF1nEt6waJ0eUNf8jxi/Jb/0Y+53m0rf3
	D3QtBZEmSzHtddL3j1rhFePRjBJjT0bx2ya344kzyVFcIXIHCwBLkp5A4a5EtE/hRFNskBayDjD
	5NLtjQTl4cvMg8JUa6rJ9VVVF
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021019585a.71.1793021862815;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021014585a.71.1793021862215;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:37:26 +0200
Message-Id: <20261026133726.3249235-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX2TIga8KgjrS9
 UL+Urp/T4zFhQltSTvOapPBkfZOsP14cImAPvwrwet0zd9dN+JQoRcdRomWuMLsEkbHaufjzn97
 QoYNkdWLUrn8inz1OFlHNmGGFh7bQrI=
X-Proofpoint-ORIG-GUID: -wRxdCQ9XKGRvl3pWDhf5tZZqALwt5XH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9nENhW6aODd9
 sr196FAgwNbSx503d/KlrSjqXyJYKN2I3maT5WQVMWos/9qbULvkawmun/BxRbI1ISQfeB7Bezo
 Zb1nuKSWpA8+BkpZenbYEXvNOYUaI6ivLqhQU+1wTC5Y2MYIPiYQjjzL3KxJGyHuOSggK7y7Akm
 iqdLwpCMXYJd3orV8d009k94gE6sydYjDUO5OnYkUAiKNAQO3anN3y5XZH8mrSryxjlauKRoS9q
 Fm39dQqU/6p5s/SlWZAjhVPVs5weN6haaq1pjRR6X58RQmIr5cJk40VOjgVmGlOPkwceTfL5mfF
 5S79BbOvx7/MLl2i4KNeGjryz41lTvfUC/Qvg/2ggzPldF1qhAqwkU8p5E3DUpRv6jB4J3z2Gf2
 96cf6WRrQcBo9QjJy6KlogR/6bqR5dbIDBp8UfX4eNyvQ3vxDFmBZeqnaC40snC0xDfkleLFzoa
 96NLAA+y9XFqNdi6iow==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf57a8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -wRxdCQ9XKGRvl3pWDhf5tZZqALwt5XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share the camnoc_axi clock, so it runs at the highest rate
requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 911ceb7202ab..8ffe02d97dbb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1


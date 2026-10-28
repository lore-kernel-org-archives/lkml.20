Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193869;
	b=IjSQAQJfXdfHyFUyDv9VGSK/83vNj40KIxDd8+VGjA6Q2pC4OCXWW1Otr+9ZeEALVhNn
	 TL2S/440zX/7nOvytvO6F93vQuM4IDbtosJo9eR7/Ud3YtK+ZgaAFN3Ee/AW2hgwBjcA1
	 73g581a7f65VJkhtRgItqNfEYgRegFLRIlkfimdLLnXYOqPLLKX5aAiIFQjKcr/VES+Tg
	 dfTJoFJRodsnbz6UHXlWzC5djnzoXCLdOT6EmLaExVAda7yGL6LJ/cK92+KfrXwch+pkD
	 l9BEMC55rGS9X0f2UGrc+YyxsKzySUPrDFwCdn3PiNNmqbCEyz4sjoSJgqmRZNF5QtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
	b=ntd1PvDDgqf+Pmh0cBoVbio/Ap5ptSTOYbjdEjVRfayUjgUKitfU7VwK2yPTwxE9Oilb
	 ImEXQ4v96lj3Sl901Dz7z8VgZhv59E9oNE5jJ02AM/C49/82tRndru/E2O+0vzyuQPms9
	 FEOUugRTv2m2R9QgRx0blPjKmO9oZAbzUCPMTRakAK0/PNCh2cYCyul3kF1k67jrr9Ihe
	 dRqgIKRgYfKJBKeubXbv+fPYY7933WHpYJ7BrrKoYpm0DbF/Vm5fwveBn3wnHfNPn4jqy
	 xshYOam3Fpo95Wghrxf1x4VH/u83A9dpquCefi9EwuGFLwcaoS4kploI4MQV0LTO5Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VL06b7li;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B5606A339
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4B5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VL06b7li
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6U61012047
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAC/SldCPnN
	A+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=; b=As0sDMqrMpPuemuxopQxV3UW89f
	APjAaziJ4+j8BNg/TnCqXxpDC/YF+GPKIW94EXkSIcEBqI4NgA2Yll0ds2R3NAEZ
	rB/ju/RqbhvbcQ+7Iu9DGtHpzWyXNVAVfG0l0vOpAzrJFP3d2YkWBEFZ0edGWNVI
	3WsRWXi+GsYa9h11zcOnE1XrKfyeSLTWnNxVcE1X1BvoPffiv1hLdR6UM6tVJc2x
	klDtqlAbKGmOhGDT3k8EZOuizt1p0Bq+t6sWm50eAtyqv+S+LAetNdKr8r8eOfUy
	oLGdPS/NCL4pD70GWAha8ij/lGFJcI9gIAzpmvBTj87uCekruCG966dZoMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgkc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso153736585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193863; x=1793798663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=VL06b7lijNWx8+6CZ16lobUUbSNvWip8Ss19UFMh5KCsE4qwItV2jUfGeuf/V+/9Jr
         8myu3kJfbvK9rkcazsxw5LGimvtwqs95RwlwjsCuc1AuI4YUJwnE2ar+Vk6eaj8EZUZU
         3jOSp6o6GLA2oa66erTV9mx6IbHT2DzIhvE6PyTu1os3XbxdqOFNIea4y0DucCnZNChe
         uUr8kEQtlg0gpir40m7QCXO6q5STkw66oG9KZv71AXa680ZD4u2pjZhZkJtKo6EfipP9
         7KMOtcyoa4z9dfN+8H+XfbmeI6FM7qxowR0WObqvi0LuAAoHHHZNfGPYTzPS9xECBgEK
         HgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193863; x=1793798663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=ICw4NdzF2qrLrkxhB7tdNas1HP7haWnBhBxSoOGH5bD/Emo9zkvd7clP+XUNnJj4QW
         XwmBu1pxaACg69/OLu1yAyi/GNGE2tb798Ki5iWYamak37516dVS1Y47L09AU7qvUlno
         aAsJNWbJl7vzwFulaMiXhCBW+/JGTQxjvim2xFfJPWse9zKPeNG9E7RZcCcxViTF+H/O
         ijYf+HOQhEoq45L1NezuoqSNdYF0FezihzpFrk2i0QyKXMkeToPNbx4/bEmZhbBkKFGq
         jhU192JuSyrga04wLFhn2s8DEo1+/nbkN0qqE8W14oti9Ku+3QesWQHq4el4pGOtA9VZ
         0K1Q==
X-Forwarded-Encrypted: i=1; AKwUvByPBKV8p4y5xErWBbkKT2r1vsfWRJh9aboDa2sm4611938mlusAbfA13d4xjtnuZ3e9ZMB9lhwo9erlxag=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF1FrhwUbF7ToiqaGoWXHAz23JpMcvGxvcfUwSbkn8o/qVpv9f
	KHvHkAzliDY1AvW216NrFFox9FX0NUvDuewhiD9dpcczZyCicO6NAJ2fglVAHLr87q8BcLbHRU2
	TKNUbY70WoVXfcoD/3HsQN5DbpbePEBzJpeYTelahVqoZKw7nlqNBNKVaOHkX722aCrY=
X-Gm-Gg: AYBFou12e0W53slIgAIW3rmz5bg1E3lBp3vt0+OGwp3mWWNO8KdQCUDO/WxTMqCWREy
	tBeb1FqkDFqyaSS9S4cVCP4q1TH6q/Bg9iJR8MNZ4tlY+tELYNRf69n4PMVjze386id5+6WTu9Q
	6BvUeftd/Ewx0WidCdRiEtBStgefGLBW/tGB4xt9Grtg6mlljCMzou2SBL33jN9DJJdemrbGB6Q
	9fLfcsubopqXDKtNcicYgSGS2rOn1wk7lOn5FhFGxOLRQO7CMAbiWTdJdPw8pMqPZX6jwfyUP5W
	KCixkJLsrmjvMQswb96+E9ykY1Jj7L3peXPFMuI/H8QyrepDIQ9GQV3xakT3aPCTk2ehlm8+296
	2ORsua0r5Ipja5kF3LdZ7q/3keWWcpjeJPCCb+Wt3MIlZn+MHPw2Yh8c3sIh0cDAtYI1JQn/qOQ
	==
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305856385a.60.1793193862396;
        Wed, 28 Oct 2026 06:24:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305851185a.60.1793193861731;
        Wed, 28 Oct 2026 06:24:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Wed, 28 Oct 2026 15:24:03 +0200
Message-Id: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXzHJNyGTK72LI
 VlPZsnYIP5gv5GVNc3rB0xJsHVMqpNAv2WlMUhH9dHQZ81qCjgfGPLjHfAxcFbVIz3OYKxhcuTF
 fvG3bmn3FngQIwN0r+d+T1ZjQUaJxxVtUq3Qq/0hWFdjT8MaAUA0uawdqZHJSV+9lU+f76e00d3
 ZhGihHD+KqXd/Tg+ibq3UMkgfdg2G37j7WgUGi3VYM25mhIaYc/oAsr+qBC6baVl0H+T0sru+HA
 QYp/twaoceMi2YI9pG9LfZBeQC0VdozYEzQpLKkbQWShiLQey/TH+ngZXGhDHqC/7+arnssTP44
 gUyXhsnlbQ2RAyF9oLwDd3Vpu/hqE/JAknVFlBMcd3o6n6BIvFBBuQ0awFI/u8O0X2dom2bquSQ
 1kr4blhsj4nbYVowINL7rIPZ6rOGBFMiYa/Ixga4x7lLxpqYLG5brCUobBTyzW78S/jo3Evp/gJ
 jrNNn7vnAGGfQ5fHyDw==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1f787 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OdZLnLi0ZByC8p_Q_X1WfpKpxZMSN1pn
X-Proofpoint-GUID: OdZLnLi0ZByC8p_Q_X1WfpKpxZMSN1pn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX4WZghDuvv2tr
 io1jXyqLvlNhBhpadAI9Dlda8wmJN6kEgS5C4wNvrKv6Sdvwb4vpgupyOVmnQLbhBSGQ0TL7ZIi
 7YIsH8I+EAdb9/CfODgZ3SbnxjXXlT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

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
index 9e29b713288f..6c3e00e043eb 100644
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


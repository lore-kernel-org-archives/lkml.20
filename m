Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769352;
	b=LN9OuB20eX+yn7SWPPZDPnuySq2qihIIMWV+uUskqg+qIRdpXkrVE/eBrd2m2Z5IL70n
	 wl1sWuXZsM+tcDOCDw3oCjEjMbFzBaOWibLW9Ef0XJxbEPio0p/+d9dnCS/83aO+nbuSq
	 JUA7p86/2GUAJbxhsHtQX1FL19mxbhwr9Ps2NkyzgMtJ0zoZ2jq8M3kLrCmSwF1vA61TL
	 KjNNA0zbJYEVulju7qfilfKMJawJSTcF7gf5lSFPI1dEM6W0CXTGBwqD5pYB5nJD8recl
	 sLUbEI5L5ZZIspN1mkt/BxO58VCn2mAex+x6Hjyckt3Dlg9hOpSMqha6pUVJPMppsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ap4DFh5/bv/iEHaltCM4bXLeg8aV0IbFlXR8H1BsPlU=;
	b=SPpI4lbC/fMzdbPnAFcwWy6vct6eoiYy2HjEOQwF6+/cEsFQy0X0pONMzdi+V0yFq+y9
	 W9vIX7TUeUruFMNVELaq3rQ+i74SzzgBx+Eb6H8MnQPE2zmKWExOuDx2BbosLonNqhSob
	 b4k21uwRiFM3SL1iE69nNZ0oHYL8mBf8HqX18uAbds1HoZspx2oktK7uzaNTt0/DC8Y8F
	 CuZXrUcRhh34pftKJtTbadsOL2d4ojLjcz2WMgSjUhMX04guoMKBOOi93uzvIdue0Q1fy
	 jNpLrQ3PXaO1T6j192wr0SiQZgJSCKAm3TeQ/8YJLDjlXPKLraXzqJ68f1bxKuNnf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oCH7qf7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ip0yR1o6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31EF606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oCH7qf7q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ip0yR1o6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5v9T4072856
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ap4DFh5/bv/
	iEHaltCM4bXLeg8aV0IbFlXR8H1BsPlU=; b=oCH7qf7qOccQHX64dUYFWaGNfu5
	KkYpHrCrFQRmW0i032NylXqWXSMAKsetmBC4hf63l2b3gXOGm8orSQEVegTKRAF2
	D/SzTVvcRvJyVvWZBs4L/6afW4nCt2l4VP9L9GNE8tWxgoo3KwEESdr2g/Gkz8RM
	FVxsY2Jnh5O1Y4WPte94bqMs3+kw6MFNX0nw6iYBAa2z8ZrJrrh90h7f6fA2wjXp
	aU3e5N4aCrDGntgeOja51pjAMlDH6ShuTlY1VYejrCy+ZEDxn9+IhHZZrYYNEmDJ
	aPCVMDNwzq7e1lUK/70/klL2RePns1jSafAmJoMIM56i7RYymGH2h+Xem0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0qrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso248640885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769350; x=1793374150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap4DFh5/bv/iEHaltCM4bXLeg8aV0IbFlXR8H1BsPlU=;
        b=Ip0yR1o6LJVFljLT9lu3LrOfdLVvOraZ0Ux+rectjQpeTywXkft573atA9OFc/WBgQ
         cBO7Vr/EFjj5MSaR5iH3+ukzKK9RmfBRksyCcfOXmXzuWMkEKbO0oFZxn19+HanXNHOR
         uzFti7jeCX+dNTetZWvQS9MZzn1eQx7tuMtvX8Rbni/0JcOXFNrEoeQS2bC8i3XZvMsl
         ulP6NBfYFoJrWI2DewXtw8d9kScMK/8aEIjqmt0l8G9a/hsTAM1AedkWQnS51Y4eR4BZ
         OhdNC1QkzVa5NgOE/LqM9CTDLgrV2KjDds/VNqqmX/DOhBh6U7DLcWUkjRiYQ3CUgAm5
         MTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769350; x=1793374150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap4DFh5/bv/iEHaltCM4bXLeg8aV0IbFlXR8H1BsPlU=;
        b=Kob+srCxS41BCcOVeAH8t5waCaFwSHz0tR7zdNIohBirtxy3Ucdh38PcHZViN3g6Z7
         huPL/a0qx+0MZ5VhUXkLaiXrPLISiFjprPX3A5YGylW6Oq9TniUT/9qv/uwKUk5nqnel
         IEhedWjiii+QDMypm8pjUg+syZ2EpFL7Y4WmFvBQqJHLeoIf37MiL1V33m+kggxgGPoC
         PGh23DmYZ1HcT8yCNNtlDvERUtOZ4jpAR9PZP3P8Pv2Ra8nLr1/mSW4OaLFurYpRAq6T
         kwEWKf2IJcAiD37qMQ8eSQ+51I1Hn9wlbFuiSUdMI1qS1hg9Bzrtp6vTzZ8g3j+KN/NS
         cPow==
X-Forwarded-Encrypted: i=1; AKwUvBzWYAVPiPjPOJzAOE3rs/P3sCVzThtk6shItziwsVIMY/X7S0cqh98nplcnwO79SK/1BGrXbKPqAE4xW70=@vger.kernel.org
X-Gm-Message-State: AFq9FYIODNCzgp2LbeQCtrpWldKStGlpnzz8z17DTBRK7LR9t0unv5Cn
	CNPgUyUv/ML99wOG3q/F/jcMG4AVTYVKXAC93nvkF+n6/QcJu1uthrPQKlP7Xn2BdjdoVGrYJ6F
	Dm8dRmm7fcN+Uwd43IkUgDOFV68V+BwCCVng6oeO8g6+91W/Px0J3UqYrhVg+R3J1uTs=
X-Gm-Gg: AYBFou341kkqdl4EyfN3I8kaY2/GzSm76WfcaYfWuYShg22O/CvTORixQvzDQAagJgA
	7nq8jYRHvbxmVqtGGVaoe/N4Dj/BcXdVblxuE+i694l49+iusVM+EvZG+q7JfWMGUa5QrI7K33+
	Trncyhv1hp+T/hL2kD7puauhiW5tBRjUcc27oa6qBIoHoGWvrV52dCn6WzJNim48Psnl32u37bI
	D6tZzZ+YtHhcepZ1cc9aDkLXJ7iujnRxG1Gw+UF43ULaFmODvoI08ij8qfGdIdfC0wFH+My/ikP
	UE2prJDoL8cnuKr2NzwWjc0dVoyzZ+kPOiigtjFiSRWqakDo0M0LoxVdkWx09684i7itbDMFluG
	gRD5FjQUxVpJ0uMGg5i8beC9w
X-Received: by 2002:a05:620a:4491:b0:93f:211b:a88 with SMTP id af79cd13be357-93f6f782f97mr478015785a.14.1792769349884;
        Fri, 23 Oct 2026 08:29:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:93f:211b:a88 with SMTP id af79cd13be357-93f6f782f97mr478010285a.14.1792769349304;
        Fri, 23 Oct 2026 08:29:09 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:07 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: qcom: camss: share VFE clock sources by the highest rate
Date: Fri, 23 Oct 2026 18:28:56 +0300
Message-Id: <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bAICrTLrsmlYH1qldQZmjqDunSSkEPpr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwQ/6uyBQYx96
 FAqc9CHP3vcd/P00H7Drc7PAazbxDUr7/v3Tg8nctYaOy6utNmZYrw1q03o+gvS4mZGQDiVZ07l
 AnEFH+4aSGniPWJNlCfb0K/yMgiDsiA=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb7d47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=g-RfV2_issfNvSL_aowA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bAICrTLrsmlYH1qldQZmjqDunSSkEPpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9E6oIbH7PsKE
 nDppJqR9SI6upiLxwpIlmPZJGanLbrP3j60kFiJ8+iuOXofSgkRxuO+j5uPaVMB/BsALCeDgN8E
 J56pX5x2yZ64mfkqOL0tvyEibgCX5T2yNDUvJCZEJqHN6PKklNNHTIbd/Be2JALTV2bNZ2YJfSH
 pjcDujo2Mz4CcmqjYYc2FJ+O3fjLXeDT98GWKcLeP/Ex4zHlZq5G7y2uGgyYyXP8jDwtrHucM0y
 7WC65GqJa39y80wAv2Ewyp6RFTVhObWtGsGm4cYBsW9XjnZxrRExjnd8T1PJwGwOmu2BbZhDLSZ
 7aDLcaF3RQtxeshlkSbimejBB+SZ8WcVdPo7i2dOkg83ws87/zaZm/ipRjA7h7mrqId9it7iQ2W
 x2Wh8wGke6fa2N+sePRPQb0aRJTwPsNEbqQN2Ly70kYObpHcfb3M6rUsnuGZrkwKXzgpYPuTO4z
 /Y4vRs/2zbmbTTbOoPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

Group the VFE clocks with rate tables by their clock source at probe
time, so that a VFE no longer lowers a shared source under a running
one. A source shared by several VFEs follows the highest rate requested
by its running users and drops to the highest remaining one when a VFE
is powered off; with no user left it keeps its rate, as it may feed
consumers outside CAMSS. A source with a single VFE user is dropped to
its lowest rate on power off. Clocks whose rate the VFE does not set are
left untouched.

Grouping is enabled through the vfe_clock_domains resource flag, so far
only on SM8250, where the VFE AREG clocks share the fast AHB source and
the VFE Lite clocks share one core clock source. The current parent of
an RCG depends on its last rate, so other SoCs keep setting their VFE
clocks directly.

Also let the VFE set the SM8250 AREG clock rate instead of the CSID.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |  14 +-
 drivers/media/platform/qcom/camss/camss.c     | 175 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 196 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 87096095b1eb..a3133720c765 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
@@ -1002,7 +1005,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				return -EINVAL;
 			}
 
-			ret = clk_set_rate(clock->clk, rate);
+			ret = camss_set_clock_rate(vfe->camss, clock, rate);
 			if (ret < 0) {
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
@@ -1101,12 +1104,12 @@ int vfe_get(struct vfe_device *vfe)
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
 					  vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = vfe_reset(vfe);
 		if (ret < 0)
@@ -1131,7 +1134,9 @@ int vfe_get(struct vfe_device *vfe)
 error_reset:
 	camss_disable_clocks(vfe->nclocks, vfe->clock);
 
-error_pm_runtime_get:
+error_release_rates:
+	camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
+
 	pm_runtime_put_sync(vfe->camss->dev);
 error_domain_off:
 	vfe->res->hw_ops->pm_domain_off(vfe);
@@ -1159,6 +1164,7 @@ void vfe_put(struct vfe_device *vfe)
 			vfe->res->hw_ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
+		camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
 		pm_runtime_put_sync(vfe->camss->dev);
 		vfe->res->hw_ops->pm_domain_off(vfe);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7fe12049b78a..db5212b14d5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -4509,6 +4509,167 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
 		clk_disable_unprepare(clock[i].clk);
 }
 
+/*
+ * A clock domain is a clock source shared by clocks of different engines.
+ * Its rate follows the highest rate requested by its users, so that an
+ * engine started at a lower rate never lowers the rate under an engine that
+ * is still running.
+ */
+struct camss_clock_domain {
+	struct list_head node;
+	struct clk *parent;
+	struct list_head users;
+	unsigned int nusers;
+};
+
+struct camss_clock_user {
+	struct list_head node;
+	struct camss_clock_domain *domain;
+	struct camss_clock *clock;
+	unsigned long rate;
+};
+
+static int camss_add_clock_user(struct camss *camss, struct camss_clock *clock)
+{
+	struct camss_clock_domain *domain;
+	struct camss_clock_user *user;
+	struct clk *parent;
+
+	if (!clock->nfreqs)
+		return 0;
+
+	parent = clk_get_parent(clock->clk);
+	if (!parent)
+		return 0;
+
+	list_for_each_entry(domain, &camss->clock_domains, node)
+		if (clk_is_match(domain->parent, parent))
+			goto add_user;
+
+	domain = devm_kzalloc(camss->dev, sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return -ENOMEM;
+
+	domain->parent = parent;
+	INIT_LIST_HEAD(&domain->users);
+	list_add_tail(&domain->node, &camss->clock_domains);
+
+add_user:
+	user = devm_kzalloc(camss->dev, sizeof(*user), GFP_KERNEL);
+	if (!user)
+		return -ENOMEM;
+
+	user->domain = domain;
+	user->clock = clock;
+	list_add_tail(&user->node, &domain->users);
+	domain->nusers++;
+	clock->user = user;
+
+	return 0;
+}
+
+/*
+ * camss_init_clock_domains - Group the VFE clocks by clock source
+ * @camss: CAMSS device
+ *
+ * A clock whose source feeds no other VFE clock forms a dedicated domain
+ * with a single user. Only SoCs whose VFE sets the rates of clocks with a
+ * fixed source group their clocks; the VFE clocks of other SoCs are set
+ * directly.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int camss_init_clock_domains(struct camss *camss)
+{
+	int ret, i, j;
+
+	if (!camss->res->vfe_clock_domains)
+		return 0;
+
+	for (i = 0; i < camss->res->vfe_num; i++)
+		for (j = 0; j < camss->vfe[i].nclocks; j++) {
+			ret = camss_add_clock_user(camss, &camss->vfe[i].clock[j]);
+			if (ret)
+				return ret;
+		}
+
+	return 0;
+}
+
+static int camss_apply_clock_domain(struct camss_clock_domain *domain)
+{
+	struct camss_clock_user *user, *top = NULL;
+
+	list_for_each_entry(user, &domain->users, node)
+		if (user->rate && (!top || user->rate > top->rate))
+			top = user;
+
+	if (!top)
+		return 0;
+
+	return clk_set_rate(top->clock->clk, top->rate);
+}
+
+/*
+ * camss_set_clock_rate - Set the rate of a clock
+ * @camss: CAMSS device
+ * @clock: Clock
+ * @rate: Requested rate
+ *
+ * A shared clock is set to the highest rate requested by the running users
+ * of its source.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
+			 unsigned long rate)
+{
+	int ret;
+
+	if (!clock->user)
+		return clk_set_rate(clock->clk, rate);
+
+	mutex_lock(&camss->clock_lock);
+	clock->user->rate = rate;
+	ret = camss_apply_clock_domain(clock->user->domain);
+	mutex_unlock(&camss->clock_lock);
+
+	return ret;
+}
+
+/*
+ * camss_release_clock_rates - Release the rates requested by an engine
+ * @camss: CAMSS device
+ * @nclocks: Number of clocks of the engine
+ * @clock: Clocks of the engine
+ *
+ * A dedicated clock drops to its lowest rate. A shared clock drops to the
+ * highest rate of the users still running, and keeps its rate when none is
+ * left, as its source may feed consumers outside CAMSS.
+ */
+void camss_release_clock_rates(struct camss *camss, int nclocks,
+			       struct camss_clock *clock)
+{
+	int i;
+
+	mutex_lock(&camss->clock_lock);
+
+	for (i = 0; i < nclocks; i++) {
+		struct camss_clock_user *user = clock[i].user;
+
+		if (!user || !user->rate)
+			continue;
+
+		user->rate = 0;
+		if (user->domain->nusers == 1)
+			clk_set_rate(user->clock->clk, 0);
+		else
+			camss_apply_clock_domain(user->domain);
+	}
+
+	mutex_unlock(&camss->clock_lock);
+}
+
 /*
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
@@ -5427,6 +5588,11 @@ static int camss_probe(struct platform_device *pdev)
 
 	atomic_set(&camss->ref_count, 0);
 	camss->dev = dev;
+	INIT_LIST_HEAD(&camss->clock_domains);
+
+	ret = devm_mutex_init(dev, &camss->clock_lock);
+	if (ret)
+		return ret;
 	platform_set_drvdata(pdev, camss);
 
 	camss->csiphy = devm_kcalloc(dev, camss->res->csiphy_num,
@@ -5474,6 +5640,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_genpd_cleanup;
 
+	ret = camss_init_clock_domains(camss);
+	if (ret < 0)
+		goto err_genpd_cleanup;
+
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret)
 		goto err_genpd_cleanup;
@@ -5736,6 +5906,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.vfe_clock_domains = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..ad1d49275e0f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,8 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -120,6 +122,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool vfe_clock_domains;
 };
 
 struct camss {
@@ -141,6 +144,9 @@ struct camss {
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	bool legacy_phy;
+	/* Protects clock_domains and the rates requested by their users */
+	struct mutex clock_lock;
+	struct list_head clock_domains;
 };
 
 struct camss_camera_interface {
@@ -153,11 +159,14 @@ struct camss_async_subdev {
 	struct camss_camera_interface interface;
 };
 
+struct camss_clock_user;
+
 struct camss_clock {
 	struct clk *clk;
 	const char *name;
 	u32 *freq;
 	u32 nfreqs;
+	struct camss_clock_user *user;
 };
 
 struct parent_dev_ops {
@@ -170,6 +179,10 @@ void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
+int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
+			 unsigned long rate);
+void camss_release_clock_rates(struct camss *camss, int nclocks,
+			       struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
-- 
2.34.1


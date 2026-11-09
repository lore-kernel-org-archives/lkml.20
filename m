Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213426;
	b=G7GgT3jKU88hM8ub/Yzp6LsU/T1ttmzuzarmkGyyarZK8+tobWeqtk9wobLhy/wG7olN
	 5W1vDGaSjA7Gn0fXMdAX96QnUjzlu5E/lbD0vcxhzc00VLL35BGGgocVlD0nzccdRQpGb
	 koBbPH1jU5T7YRIxMHwmHFim4O6VVfRktR1jxpbG5KgvyAuGoXAVH8G9JMoF4+VGfpea3
	 b9tkUuOAaEk1NP3SRmwJcga2eR4ecIwZ6Y7HJKCNZC94hjLlvuZBj+MRpZpd8CHQyYvD4
	 AxbDcAtlnNESyX3iaFeO1Ess8z5DAv8JV2614Wl/Ex6E0G6XEZ8XjFKvIolty6TV67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
	b=jCgFx6SqEcfcEUbOUTtFYVtLEX3nphlTBwq+tSIgw5JiXpV6X/MHUl6inW/ZNfA0NK2b
	 n80G6w0GYeQ8YzSeKDgMs/FCVwHxhy82GcS9/maLsgAEwCnYyX1X0FqtDVZ7pxluyT7Sf
	 ZXjUVn61gHm3Wg7pPvIrr5xqg2RJoVlQx6ft+MNScLMoQ22z+dtuTCAp/8Oe+CFZLO89Q
	 igfS90gJe98RKT9gB64l7NBlVxJ7LG97Cm5AdFqzRyOtFzAp9Z14g1MDvuWhta3yZLGkN
	 8qYCiCbIQDER9nBfSPhYXGXGino2NrG+G1u6jH2wrH9ynO5/0rR3L1NPiVxOBGGMqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B161606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B161606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AiWS2008411
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=; b=lnKMZmGtCPDBiFDV
	O+2J3/bw25IP3lHVDXfZ+xEfGEQhOQfAE2kr9LyOa8YLzd+aKMP6uQKrpzHYdXDQ
	K+OhhRyt61g0L64vXr3sGCow2GbkPU0jGUekTLJSwhTwMMRCCdGepvV/LaLSPDDD
	VVujFEDpsPMVdVT0pb0YGUrTEknGGNFmTRE+HZyLoragy+4Cd5u6Y5ZoTnybjp6p
	Yxq0401Yo6/L1yap0VRCQzxQF2fbqOaK603Wv0Jt69VZHx/Fiy9G27uBvTgnLBu2
	/UrpqciPcTtr36VL3ZFADZVjLDwowhKDjVo08fBvXStABN8C3ZwWtshmRJVgWFsa
	XBqQYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k59p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so58707985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213423; x=1794818223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=dQqOh8sqsOjkWW2uSoXUxMqcj+Jwb0t+OR4h7QmDMWi3OElO9CmwVvZNcBY0zD8f6u
         iJUbcXzkqvrTg2Ic/DA20F3NHVU5U6x3kpyRFUo0YS7FZwCNNeNaEjOsqjdgJksv08zM
         u3PLVc3vg0/H2Z6Bx/Q795EujwASItEH9YthlP/3i4p2J0tyVSrv8+wnfa+vKMlsxdOM
         wd1ph9P1vV7+HuelOCYkCIfzE+DD7w41vhsj+/HKh4VLYsb+GpVg+HInxxL1nvuGvQDB
         5/MOTzTuWVxnFLxzaUC4dZ4U7n2Ell7gkWMg1a2EcVQ/5YLRCirT926HtEfXZ3aQ7pD6
         QQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213423; x=1794818223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=UkpRsRK6kxiZdxeMITRZk0E97zQxQIvKGiLYesaETREPaYmUz6fQWdfxM03J9vwrmq
         o9nhD+kmb0P0VQBomsH+p2YX1EjpGG0jJ9GkLH/yVWypYMz5zJF0Gcwlc3ZdVFVnwKY6
         XdAk2Hkp5jlhK0xQfP5x44gHr6g3IAW07IBT74Ok9f/uMTi0cjI2e9VL7QgYsd1b7vsg
         BThG7YcqGIsBWda+cYTUCeQu6pM9rHf3nNC4cokdPb9jvfCpq/7oa+bZiNHEaHCvI6QY
         HM/1yrQnSHB67U4p18nQSP3ycTq9+MnKEG/8QMoDtpLoCqHHYO7ub3FGpmrmqTJboWh7
         h2Dg==
X-Forwarded-Encrypted: i=1; AL+hErHh3RmShDs5pMsNuLS/1JCQxJzbHgy0tHTVBS6D/RTIm+MeMuc+cAl1thSFBKA+sl+I6unZk2mw1YvGW0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MZw2QZFqlDGSWdl9eQSlVDmMqQymIJSbAeTVX5gr5oZsu4DRc
	GOX1GwkiHWpjKZPV+ovswwfJfyx/WHnxobDfZe1VbQVO6ghWlp+IPWbZ41gakpKkla53pZo9/Aw
	OP216wYTVWh1rDvZk2kOuaRFtjLWZKn0yzMEUGjEv0VLxUSomuK8Hvpw1lWYAnGjPFEo=
X-Gm-Gg: AYBFou3cj1Sdccv/Z0ZVvVJTuIv5f/Uv4SQyMrKopeXeHbYRiWM9BIvL/b6YTQkLQl2
	drcRF/fhV1lilrYHneb8xJ48MIwDNtrpxrLs1aFp25AA7/jHNnhhmZx5okiT4HtsF0TU+Zr0+ee
	FRJQ63qiPpdpPDIwOOTNjpWU88JqDTBwBw49b8/GLbUJrm2mg6adcwV8Jauc92ronE+V+3meSpb
	CxmLR/Ry/fiVqPwHg2uxkpbuWHCFc0sAm4hNAFkN7SJ0CvA8rz5vybrlyxV2op2nJsnI7dNJERk
	TaFYKeR1XosCg+FM5ggfw9hP1W95ztaSQayD2iSvgXHgwYKq1wrxPS6/EpnDDQWlNFnDf9bexfs
	yneEAQdSaeHq7OgDMB3Q61XwlZEIKpOpE+lU7BnDTwLWGuTq53uq2/w3xPGSWQIKW+SKdyocYHg
	+Q1UgnGKpr1xozfD+hBgKSfcrXTBD4ksYxen4=
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120149285a.46.1794213423312;
        Mon, 09 Nov 2026 00:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120146985a.46.1794213422839;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:36 +0800
Subject: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
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
Message-Id: <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=2690;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k4/w0ByaTXPXsf61RAe4GLz/Jc50aw9jLRjtqxw+Tis=;
 b=jm/6dNLOk9BQB6T4YigYCRGN5rjJDhn5xVlksn8EDet1BPVk3o/WxOyDPoNbrLiVSarhzbAZL
 DRv1xuJkC0MCjBgjnFntvfBf23OQYChfU4yNnGqvGROfVkRJOaa72Qr
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX+VIyswM3ua3h
 0M2ZHsh4PQ0zAEQwkX50LDufz2reOCAH13UDL6+MceK5PRqkwYa+MbmkWP2cjuFatudiUIdFijL
 TegdG7fU6mzvzDYxsnJj38R3lIU6Nj3xupy5aP0EIFe3KK9eLo2nMYhVgRdwyD5CAtI16vV5r5H
 tGEgAHgePpyzLuGyiQ46QPAPQB0l3VXTr8WHufO/FibfxeX6G0bkVgkZJohqJmBTQwrGfWmkdr6
 fmkDWAt2r+Lct9c9+np49bZB/XEUEt3/0YYzVNWx+X5mfqJrfzmGW35rTfuVAV6lRrVsX3DsfTm
 3aHpCcImd2HJr6ru0uiCxauRwBU1IUME+PsN+K+4K6msIGLTZ2KiBSzastUCgAxrSlcHjnddxBC
 y9qST0kBx0z42WrOT2dCIlsLbbsgGoBB/P2IUGKouGZiGty34zT2MmDkLQNPjBXp1+UL/gDZE8O
 LlF7vKdBuhbUhJKs82A==
X-Proofpoint-ORIG-GUID: eHG2EkzQWezVxMZXMfXhGEULQcCrThh3
X-Proofpoint-GUID: eHG2EkzQWezVxMZXMfXhGEULQcCrThh3
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af18630 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX8U5LAEU3nDbF
 gJzO/oBgGZZj4j0zTG7qu/VYNCG1/nxxJtNY6Fls4KTuvYrR3557FQ1yCEadcybM+WeiVuDN/Tk
 57ZsSppoGq8yfP0ex1N8/2Zc6rJh7Xg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
power-domain core only auto-attaches a single domain; with multiple
domains the device is left unattached, so both domains must be attached
explicitly.

The DPU OPP table also needs to continue controlling the MMCX
performance state. Mark CORE as the required OPP domain so its vote is
propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
own and is attached as a regular runtime-PM supplier.

Platforms with a single power domain remain unaffected and continue to
use the existing automatic attachment.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc2..502e50ea5acac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -12,6 +12,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
@@ -1376,6 +1377,33 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static int dpu_kms_attach_power_domains(struct device *dev)
+{
+	static const char * const core_names[] = { "core" };
+	static const char * const int2_names[] = { "int2" };
+	const struct dev_pm_domain_attach_data core_pd = {
+		.pd_names = core_names,
+		.num_pd_names = ARRAY_SIZE(core_names),
+		.pd_flags = PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data int2_pd = {
+		.pd_names = int2_names,
+		.num_pd_names = ARRAY_SIZE(int2_names),
+	};
+	struct dev_pm_domain_list *core_list, *int2_list;
+	int ret;
+
+	if (of_count_phandle_with_args(dev->of_node, "power-domains",
+				       "#power-domain-cells") <= 1)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &core_pd, &core_list);
+	if (ret < 0)
+		return ret;
+
+	return devm_pm_domain_attach_list(dev, &int2_pd, &int2_list);
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1392,6 +1420,10 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->pdev = pdev;
 
+	ret = dpu_kms_attach_power_domains(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach power domains\n");
+
 	ret = devm_pm_opp_set_clkname(dev, "core");
 	if (ret)
 		return ret;

-- 
2.43.0


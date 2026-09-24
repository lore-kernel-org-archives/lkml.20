Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2B484242
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251766; cv=none; b=Bl4Lh4oTfHR3x1MK67Pc8RqQRB/WxKvHnutBXWTJwkB/1jSijQUNBOaWaTzGv4SjOxv6W8FupgJT0OwsTMg3fDBl/kNqpubdHHo2bzKx50iIzyerDAvXjTyR5T0OOs48agyEhcHU7WLt+PAUOm849YRjSoUUx073VomdKpAkbLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251766; c=relaxed/simple;
	bh=fpAqyKfFKWy71M9unm4jkKwXTIYpTZjdc2DJToIUe54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDZWR0MJYpzJ2rbKkMhFLiRCIJVZS1dQ7Wf7bpV9UgCvfXkFHnFiwp5jVeg/oHPs5WMDAeKePXtD1pKrJxMHJRi0J7DgcDoq5V6uMQMxKCvmh/OwGfzyGlCNCuNnSQS5XFGy76znW8nVXM/e3EMU+Dj/bUhPrBs9+WRT8WLTH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pk0xdaAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z89Bpsct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pk0xdaAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z89Bpsct"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4V3K3282824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=; b=Pk0xdaAVrZff6v5K
	rqVDp0DBlVBbHFqKvMGEa/efjXm9u5SemevNc1qnurPEQimdxybF6FVwsQ5awDKR
	aNNMGz4Knlw6CY+hiXu22bHIN6KvPh1V9SZ1oW1lBs8xdaoA07MP99/tyUAQYxlJ
	wDMvu4B8L+OpTRctL6AdxLj2pwMaNLbkyHRlxM8u8YZEsiqobtSag71iBtmOdO0S
	DAOwEgzO2i+a0XdpnniPndLLZFu8ai0FRYBmAD32Mq72xWt1iVP13XeVE0DW8/Op
	zCMRwYgu5WtEtnMBQscESfGoYs11KMkXh+ZOxNOZW0IM/IZPGLSLNbqK8vq5T3h7
	yxvTAw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujg0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c93c294214so754370e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251763; x=1790856563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=;
        b=Z89BpsctTdTDRzBH9x8SBOp9YVuIXJkNcSomVR1pBmQ7kOdIKrjY7aWIiIvqcIfZ1r
         mBOL0PZrvfkyZEaNT5iE0EYX+IZpmiIfi1L68EBdWRNPtHCiMUZMRi13jWMzrJzcK3sk
         KNe0JKSZww+l+jEOAhOneGki7GTK+7eHqGJRHyyl2uxKWKU3Eco4wJ6NDl/W9ZMbAeXq
         9Fq07DhAOhXi1OUypH3ip0QLycENTpnLcLrHuWa5oKCbXwyXA6lA7x8SIV1l4IaKFHO7
         JewNV6boC7XTG3VtDH6OTDQ/PAYuP8o9rrQ7Ch3eUP1U72IhwY86F+WbAh70PFjJuA57
         FtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251763; x=1790856563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=;
        b=v3qpgkFcKFTgu7/+3SjEW1tESLKmbgu47bH5oSW6wLFxAaKLy5E0ra81Pvo+RldI/n
         qx85K4tYWfNX0K72c5sDfP8hMJUfVLlMszG5htBhRcDjl7HsTFlSnhKSRvgJ6JRLXxey
         dT2graOBEHs27uJYJ6Tsfw/JhH37vmLAKPw0rPtUZ6ZodpGzcPkxiENuWKs9DyntyiXf
         ajbWUyJRPEEuNIsBUCXWCWWPZc5QsjgFaIsJ0QgDm5N2Z3kfekjYB55MpAkf+KS44of4
         oAktmpItN/kjT6b5vc0e7MErpy0mv92glyXvHwUq5Cq87luGlwauw70iV6aQpPxMDLgZ
         f3OQ==
X-Forwarded-Encrypted: i=1; AKwUvByDtwHraQG+KGQXStzaXgsbxjVyqaHCm1xNub3YTp5ngRmIMorTrAAXtO9VRSwPGckGexb8m6xx7MfoWwA=@vger.kernel.org
X-Gm-Message-State: AFuF++k6u23yRFz4ZB793IBIFyN0CrAVDuJyuEx4rLcnYqies2aibs1X
	mpw4hzHCURC44x8w6ycs/UHnRr7Lii6qm5GzzDt97EAYt898uDyC7sc+fYrk7JZbxtBltNdbyKg
	LqeWw9fnGzlyXAQ6kX+G8VanM74uOrGHQOdEVT1XUyA0+c14QG3nvuKK2l26iPF4fFF8=
X-Gm-Gg: AYBFou3tAo1k//PSFoe3xaxTVOkFbG46oPc7c2zEfmzGOw5xg77OsPJsZkD5MXeqqE7
	tatw/I5gB9vc3ysx6PgcQjwwpabZjvHO/Cm9BkBknQLtrCaliZiDbKmugHUpltgnJrI2vos/Q/Z
	P5DztoURrvBQT05QUpYBSHwd+tWhZUTDa4SDnd51FSAu3p4yS2oCF+OEZOtS6B3SKs60woqmZ+X
	y9w/MjEQNTK6pfH7FyA4JvtroNXcGjMBScfhsC+bieHp6oUR1iIIOmGNIHbPc26ZDxYEOP7gAhm
	8mXY6+qu59IqBm/E9s6z1edOwwOI0UZbk0Ul4Nc7wP9KREyYs04u5sUqkkhem54eP3DU3hwCHcn
	VYn8y1X70
X-Received: by 2002:a05:6102:50a6:b0:7a0:eb10:76aa with SMTP id ada2fe7eead31-7af1c7a07f0mr1109255137.2.1790251762984;
        Thu, 24 Sep 2026 05:09:22 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:7a0:eb10:76aa with SMTP id ada2fe7eead31-7af1c7a07f0mr1109234137.2.1790251762049;
        Thu, 24 Sep 2026 05:09:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:59 +0300
Subject: [PATCH v2 47/48] clk: qcom: videocc-sm8250: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-47-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fpAqyKfFKWy71M9unm4jkKwXTIYpTZjdc2DJToIUe54=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJvto0gM6txrFaI6aQsh0PS7s8e6iv4ckNQW
 i30X50y+vKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbwAKCRAbX0TJAJUV
 VnU+D/9thqA7exHm/mgM+2LKawqDr76G26Jy759bIYvgb7kTbHBXHmLXSg5kd3DjfQWrq58OAF0
 5iKebPsXpnFEdI/5/khHAA3KYkfuUJq7wycdrRtdoq2ImAcRZ/WFhvdLK4OgyGzpeWj4d9/weS/
 HWLfNyYbqhigYGYrwgzG2L/faYs2m+2GS68GV0VMdTU4JQ/JS/HihrYTB0HxnFGPv+cpAn3QSqJ
 gDy8SPdgC5e7CH+TDPeci3fqOnE1u1JWnaXt/Qvrr/C/wVB81lEYv+YsLCum71HkKV5/vv1DjzJ
 awQAX5zQyCww5UWQ4E78grN5bKFoBfb1Oz4126EAQLY/9417wxrK6WHzNGsjHigYDb+UzkG7zu2
 U2GaXChlR1DnhjKxj1H9s7Oh2tSIIE/t/cr109xQs2K8z8eUf/KbgJ4M478c4WZF61L2W4YhjeS
 F5lIA9/q+MGewts5JnCCxn0r219xwcjiEHNmbRwVEkXj8PfS0XF3WK6rAXMoT+qOGidvRUwig9K
 RHfHpM45tOvnDqzfCez7QmTtpq8Ey1L7t/Em0c3Dwn4ek38ZNTBO7Uvs1MpQ3ugvyR3jbAlppCT
 mbAvKKh8A00pQhtjqEV/QTsZ8XWfdIkkwlEJw+nGiTeeeTiTQxkTf3AUoA8tjXplU1GXB0qdELS
 732cwwvcNHfIyRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0S9oM/TGYFNK
 lMKQ3Lg7i/tmp10ng17gKZ8y85G3EJoWTibacX5HMXxk/BuahPPO9ppb88oXCa/jIoqq+WGDZMK
 uhg6PZUyTfqQxpGT/htb0K5Mpcid83g=
X-Proofpoint-ORIG-GUID: z6MsnYPxqK0TdaUZGkboeqwLMi_j3FWT
X-Proofpoint-GUID: z6MsnYPxqK0TdaUZGkboeqwLMi_j3FWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/Db042BW+KMf
 vSN42jE4volTyMZAUZSXo9yHAAmOo/Vamm3hsXZKzpIu+7Jc7yEEjzxt6ndsdee3i+XY6Gl91rM
 G60/Dgn+Or6Q0aLdCYxUForAlzJ3lmwF2i3HWO9V3n82FK89UWoSFzFjkoAnVLgeWzCI49QHQXW
 UdXc1FOoDoR1mYOKLy6noE/uMBNR07kilWSO3HQ6OnHBLwdq0YwsXIEex0JUfYZu+IzKTtcJ5Ft
 sUhnhotSnV0NcE0qhUc5HXcR5q0CNqdZ/wEb05pXvPq//Sg5RbgRwQyRg0Aka77L5IBPF1rIw3S
 PxvolzJMJBIou7VCFamcGU6ZupXf3NQ7jqY7tDNiSpLZf3/xn7NRIvOXpmRX4iVJdTqBMcUWPMN
 JTgOk/gb685+x4esN65bVneMbt6ZanSzYKsYGZCD31OlBiXooq063DFLyByW2joTDEtwpOREU7B
 Pp7qMVr99qKDkOGrwQw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512f4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w5mbRZx1dI4nJrn9fZAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm8250.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index df479a69cddd..d29d64138508 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -345,7 +345,18 @@ static const struct regmap_config video_cc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8250_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8250_driver_data = {
+	.clk_cbcrs = video_cc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8250_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8250_desc = {
+	.driver_data = &video_cc_sm8250_driver_data,
 	.config = &video_cc_sm8250_regmap_config,
 	.clks = video_cc_sm8250_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8250_clocks),
@@ -383,10 +394,6 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xeec); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0


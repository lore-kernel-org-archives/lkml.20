Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181137;
	b=BdARDfZFRxITv1mcbyv80Yuo+tScVJ7pkq60rfuCeApl//wkXCw7duE49c+01Fy8uY/6
	 Yt0LQwjb3CqpoiYG7JQRtPimI4njE68M2tmthunTQsf0IrGNNBwVHi/qOLVe6pdZpKIks
	 uAt+5HV+1RDLE+Yj4fSOqkDGVOHFaYfNTVP6tLHAr+S0a4HOuqMx0kdEcjg3SfwO5DyKh
	 DY4z5RYnaWbkAj0sVcCvo9Aa9o1SyOXLR/1Pwnph3CINyf/g989TOcr6gSzb05P0FwPO/
	 PcVzSy4O3ETDxGu1F6tN18zKr4LHi80qcAofCRTIbxcsCZ9792mmPxI8Ct9T4pwIzeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
	b=MXRg3AgC0qvJfKpTRwrdzXUtIaS3ZCi5R+d7oeQ/AH/KgNCG+HHZjlL+ShNlavaMlhRy
	 SdRHNNFq75Ko2A3pPBAJm/pbHf5GAVybpfJoisGr14/scwSaqmsMTS9egckfDatcW7xBn
	 f0POLG2ctuNVa52kPhytdE861ARilwPWcZ+JiuxcJP7j6wqvp1o3YLBn7XImfJgUA/BPd
	 1AZ3vQ4YilxTjL3/+tRbEI9JTVXjFDE4i6Qpii8y2EG/KrhkcLqWULX9yhkBeePWGN+lS
	 wprKPenl2CU5p7d3vJzhsXIaNya7Tem2c9dAjIGzDAkOVEHveOL4moj2q5wHry/ie2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRcwlHw6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVyKba8u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1D60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB1D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRcwlHw6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVyKba8u
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KSLk3265095
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=; b=WRcwlHw62bFOrKl0
	2J2D+CAMzeakmu471lcTmwzYsWtWePflATOlZOPusgjXE8jik80sdXCyDKUdrQDS
	ONRXaxi0OB8c/9m+bP434JMyZ7ioJsIzPoX9GLL09L7QgLJO6jI7taUdnxm7F8v2
	I/GYjZSyoWffxr0zzy/w7v7ljbdqjzBEifKyQ6sEhOXhlxxWYFrVnGf9plk1TXDU
	FEcZ8C0B+C/YNk9CiIbRE6FNOl0Z+4/uHcsVEZJQuN3DPfTCehX8EnDo3QGzp6ij
	mFNvkPuaneduyIZfMJ8UcbELE6y44cLPEWOP6RCRPi+MiLGxQkJoH9YUTFwMl7Be
	MlWsdQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713k81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so41578066d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181135; x=1793785935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
        b=BVyKba8uzGQ4Hq1ncit/Z8RqPtdz/MrajjDcgV+ma1RMdxBS1U7Sk/Z0PakggXUfn9
         oDyYtXVB2uH4rQAo0falgd/kd7Fbkow3K+YYU7fs2NwLNXoWpBuuYmhuuOO/lZ8n2ig3
         OPsIziMOxcvrdUgU1DktiOHODOIZHEWo5vkw8NRfKHjAnjnK9stJyR5pvRcU4Wgkmy82
         wgWlCfAZR+XdKZXYQAnodd8cC2nz7saeLobFQvHInIYAn8INQmpC433GE6GWi8qQqiNo
         ZRyvqYAIFgDqvwXgFkhXCK7t55DsgqEg+YCDVu4FCrYdqYFsaLkf7+kAtuQw7ffWMy1f
         SwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181135; x=1793785935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
        b=t2kXdS/15qrSof7VecUrj3NQsfdJM8q3l1+srZRXRdmScUAeBzp3N74tMzcM1PrCxA
         nVXTYtVW26rn+2yEIaHm4nLrH84/I9RXgmgdWFX2gIi4i9MQ7Qaz2NhjsSb5qumNlLVP
         rgDynK6Dmkagv504beSQoEjmiIftFPSG9u4nDai+YQmDHPsHuIjMMydGTdCL5HfS4opW
         X8mD0hNjWEUufEZ4aw6yDmzsXmk2HivhTxUojfwKa+Fg5tR/ixxaHlGTfmG1mTYrEjDt
         zkaHQ3VJV9Vdp/uI7Tf7iv/v5Cvn5Zhg9SLgynSQ0ygYLg+Db2VPLsXjnkEOVMgHJRoM
         2fdA==
X-Forwarded-Encrypted: i=1; AKwUvBzhSZnz2W2Q9FH5gFdp9zk4HfJH8anokCExnsTRX1NlfK8oooe1YncgFx6i/Ifi1uEDW9jO1udfdJaVlHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEa1HitYKG6Gl+ZTKDH4OC0oTvIv58ka+d50DPEfnyrJxoP2Lp
	05/HBy9vf7feKA2M1Ukjkq36CvNqVZK/kLDnXFd9VoyfNor3FXpkl7fT5UA/LjYzNwmN5yZ7j9F
	DFsyGJwLBqcw+cop95Zyep4Dd8DPGbpkseQ87VKOFEGmq8xQ4DRA9TaVaYgN3YKGz2XY=
X-Gm-Gg: AYBFou2GcdYdANnSQv6Sl9lZYM8fnaAWl2miwzLxbhfl9gdLi+iPto4g98EJzMZ/Er8
	5SKea+rYtYDSObU/53BbwpJbvxv0/6pI/gjA9uuqYT1XEVCCsgSA5ZnkSlZNyNgdEzP+gXgaYbi
	gq/FlYBYDzTeiGRtoMjlZX5PgOOEs0c7nhRSrdhibpAnARFnqrQ/xR4/S0gt315FuqU5dVPbc5h
	+eOfZ2yavDYVcmkC+boGndzIKZIH6ljvtFgCUzaQ7I5T0tBD8coDNivUZWknM2UHHTF4yd8trZy
	/f+7qahzMbv9n7ae53pJUADscQkEBdM8IUwWMDxxF+/FVrhypLxKmSvJLeGtpAUfXT+NpGdEdU1
	R9eEtI3WqEPYUFIdsR3A+oGEp/iPlBBWLZf+bAm0z1DqohIWD8h31CAjTAR0=
X-Received: by 2002:a05:620a:3728:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-943f4b7c848mr860920685a.17.1793181135377;
        Wed, 28 Oct 2026 02:52:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-943f4b7c848mr860917785a.17.1793181134679;
        Wed, 28 Oct 2026 02:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:05 +0200
Subject: [PATCH RFC 2/3] clk: qcom: common: Restore the clock controller
 after hibernation
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-2-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKY61JZxHgZWybeQ4KIp9ckDmN5YeqgRi8ne5EazT6I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXIEwTqemXTw3jRGvsEiqiNK2ghH+zedd3cP
 RxIFMQP8euJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFyAAKCRAbX0TJAJUV
 Vvf5EAC+3ZPMQCN69ut3ecoidMF1ts3leHlcnbHwyBc4MP3nJUwnJvon1FUDL6Egulhxm14djMg
 S3VWStspwUOhwBmCYvUDr5+6EC7CuPBEwKJB4Lv8ku+Ifg3C2VgxJOY6Qfebqel+v6v8f6jGxAL
 8DE5I3oMyv5AxbM4zePwFfCYYM0pbi0zqjBlf9a5lvqX+DRzVIM9a7O4HjAVlcKGPRTrsmF9lxm
 diH5bdom4u1c4UpVOMZZzddwQlavp65h3NBC05Ms3dErx5XBxTogS3UpUQWq+NoTjtR7zpvzBJ2
 zO2CLHOSxvDHjbby0CGJg22ID56nR2Q4NY+SRK/9ZE9Hppi8Av/o59SbW6Hzyqapw3dmHvItSFS
 PJb5D0Vwqiry5WTh8UZP05fS8dmLegHCegxLl+0eiFcz7VccH3ks6SwpbqwFAg4YPHAghm5DJj7
 lO6QKU9xaFUMfTDaazP+CIOA6P5fL35WyGz3d//G1QbJgdFD9Nypd+nVQvu5CfYCJSgCi0Lr6cD
 6/pXWM3KbxG/7Zn//shfyL4+cszTKw0797V2VmdZPBjz7zmAU0Gp9Atm38Xkmeu9ScssghelUUh
 XavgNBiNXO5TxE+j6tDHK/kgvZv5bP2khcACQhFJJrUSGXMm3IDF49HMDVRa3WwPJXChvTvwOwd
 X228z4tVrRJfgCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXxoc7ly+yKCRX
 21uAMJbxk8zPBbY8CEXZBVklAZNeGV3yxyYdTm1huFALLas5S2X1++xeiz1ApPcbmg6SfGL9oYZ
 N3pgtj7ujIDcD2tpCl65iL3V1Vcux92YrRAG4VuI5TxrStesMIO96RuJqnJpgMPnkpkzxEVdQib
 Yz86aI9eqXTO/pFp2430Oax2crLMAjLC7lkvroJ7O0iTn2RAM+Jc39oiNrpE/SsAeeXCRL/J227
 t0WEDUuQrs3gZ1r1kAJgduiS3s0f7KNrO0EglC49rEE4yox7OT5HGR/+QEDqcrXZ32GJQVOCe5n
 g1LTZeJborsXaa/Z9tN70Q1ZdUvGjzb9DJ/La1gclLbaMfocjX9h27WadO3AuUro7g3XLCxoIew
 jzyEMdR4lsEnN/X65/XoH/gajwHQVOD1cTpeAVo5YgXQu4aZ45s9K02eWBAUtGKoatERLB4A6Zw
 BbtBbx6VQkE1MTKxoCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX0NpHhPO6E5HD
 pdrCMQ/IzyJP30LXtcAo0sySyHe+hBcK3HKLlcGqoUbvrTJT7VPxtcuy6B/d0DaFz56qRwAYFiJ
 GaM0HHN5nEgRgEvyXaftWn+HcAVs5t0=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1c5d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oKKWX3z4MXjDt05ZYnYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: GcXQjWpgjG8NFi5u-n5mLR5gJGl5IsxN
X-Proofpoint-ORIG-GUID: GcXQjWpgjG8NFi5u-n5mLR5gJGl5IsxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

Nothing puts a clock controller back into the state the clock framework
expects after a hibernation image is restored. The hardware has been
through a power cycle and through the kernel that loaded the image,
which may have programmed other rates and parents, or not probed the
controller at all, depending on whether its driver is built in or
available from the initramfs. The rates and parents the consumers asked
for before the image was created are not programmed again either, since
the framework sees no change.

On the Glymur CRD, the display clock controller driver is a module that
the kernel loading the image does not probe, so the probe time PLL
configuration is missing and the DPU runs at the 333MHz the boot
firmware left the PLL at instead of the 717MHz the framework believes,
underflows, and the panel shows a solid blue screen.

Add a restore callback that redoes the probe time configuration and
restores the cached state of the clocks, for the drivers to use.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 08fd62ac780d..ff243fc78188 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
 #include <linux/pm_runtime.h>
@@ -26,6 +27,8 @@ struct qcom_cc {
 	struct clk_regmap **rclks;
 	size_t num_rclks;
 	struct dev_pm_domain_list *pd_list;
+	const struct qcom_cc_desc *desc;
+	struct regmap *regmap;
 };
 
 const
@@ -321,6 +324,10 @@ static void qcom_cc_clk_regs_configure(struct device *dev, const struct qcom_cc_
 		data->clk_regs_configure(dev, regmap);
 }
 
+static void qcom_cc_release(struct device *dev, void *res)
+{
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -333,9 +340,13 @@ int qcom_cc_really_probe(struct device *dev,
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
 
-	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	cc = devres_alloc(qcom_cc_release, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
+	devres_add(dev, cc);
+
+	cc->desc = desc;
+	cc->regmap = regmap;
 
 	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
 	if (ret < 0 && ret != -EEXIST)
@@ -434,6 +445,45 @@ int qcom_cc_really_probe(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
+/* Redo the probe time setup and the cached clock state after a power cycle */
+static int qcom_cc_restore(struct device *dev)
+{
+	struct qcom_cc *cc = devres_find(dev, qcom_cc_release, NULL, NULL);
+	const struct qcom_cc_desc *desc;
+	int ret = 0;
+
+	if (!cc)
+		return 0;
+
+	desc = cc->desc;
+
+	if (desc->use_rpm) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+	}
+
+	if (desc->driver_data) {
+		ret = qcom_cc_clk_pll_configure(desc->driver_data, cc->regmap);
+		if (ret)
+			goto put_rpm;
+
+		qcom_cc_clk_regs_configure(dev, desc->driver_data, cc->regmap);
+	}
+
+	clk_restore_context_dev(dev);
+
+put_rpm:
+	if (desc->use_rpm)
+		pm_runtime_put_sync(dev);
+
+	return ret;
+}
+
+EXPORT_GPL_DEV_PM_OPS(qcom_cc_pm_ops) = {
+	.restore = pm_sleep_ptr(qcom_cc_restore),
+};
+
 int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..227669609a50 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -4,6 +4,7 @@
 #ifndef __QCOM_CLK_COMMON_H__
 #define __QCOM_CLK_COMMON_H__
 
+struct dev_pm_ops;
 struct platform_device;
 struct regmap_config;
 struct clk_regmap;
@@ -86,6 +87,7 @@ extern int qcom_cc_really_probe(struct device *dev,
 				struct regmap *regmap);
 extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
+extern const struct dev_pm_ops qcom_cc_pm_ops;
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
 

-- 
2.54.0


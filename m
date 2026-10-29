Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293066;
	b=nOHQhFhuSL/LW+x6ohEFIT/j2GWmXWNLydKNtnNwifxiOWeUqX7oM4s8+ouFg/Gttle8
	 l1oeqJJEYRvA59HCCFp/vb/I2cmV6zBnZjoLkKQrRoeKwptWzRx71axleaxMlk16fCzr8
	 Jt61Yeg/9Xgn9gK68bJgxXvQJh7DpfRbLfrU4YDzNrUovMobYoTV1Ne9pTKV8BtN9ukfz
	 MOJ1FNox3cekiCHLE4oPk8bwL63FnWf39lO6l4heK4/Rm2sViVwOINzQaMfOvsq/pj/zE
	 PWdh6rdMLuSfrH9RsL5hq//8qb4ztAluv7GbjocGD1dwpVOJUMbi3UF8wqm8cBfnzJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
	b=PwbH+HaX65grHPvOrHKP46jRMVqSlG4hk56sZqESPRevc++ASDpiCW3LKdhzHK9EcTql
	 UbV6Y3Ez4AwXbj5oiDD5vQy/mIcmf3cXJ16shAFK1E8xvYzP7Vbi6eNMauLezQhVY7gQ7
	 P163i+j94QfSCfnNx9Pza9yDEXeAFuusKBUVM8Qj+bIGAD3+0c3JUuUzgZGfhilZrx0pu
	 A+vvc/6cg41tVOgGn2DIMlusaTe40y7iCsn2yo+q3G3VoH19ma+VOIwt97Vgl/CkPLQHa
	 j/SlzCCxsqOLYsdBLa+pMltdH4D+aScxAB9qaU5ptjGt/TQI9hO8zOhZnG/gdmsfXuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXs86wpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGrGC1H0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C360A2606
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1C360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXs86wpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGrGC1H0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGF4ml053042
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hTV/3nn/Rkc
	mn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=; b=GXs86wpKTuJaEtB7IvbsrQaIJiD
	Vzau5SA5Ip+Va4Mf7Yqhhf2vXf1VBswh8RUkDV6XmXP4UTiDz83JhUF+8vSeo+Fl
	SIxDn4xWqgvL126WPyWvXV31hOW1RV9v3jnDpX/7UDRCeP7qR0c97qiVWXf5HEFc
	tD/swatm7oFrd2gPzLbFoMU1FyoI9OTwCeprbTcqlsSzoiqUukoqjDDju6Q6CrpU
	uLNUnGdd+69JCAh4/HgijN6/8kUn+oiYlhFekVGKj5hfMFiTK5vO3LLWUtD0fA6/
	ymfcWcqp4hGlkl3kp1PsW9LTPKvtkyJiIm3nt3868LpR3rnGO/ombmT9hQg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nc636-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9913f410ba2so157372241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293064; x=1793897864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=aGrGC1H0Ao2Iynuo0mhrxET4tY1TvMZ+XtrCZum1T2gtXc4f3AzCJLOAxQgSvte8nt
         A8eBI3CHaoTw0F2OxeCM3lgdj7qohG3Uoqpz1o0xdFustRtaVi2eedXVRlieQX4IOxi2
         9w3owQHPOxDDlfz0jNC2zH9b1ZEmmBNwIybGjWvPqSBUR+VNQs5nb5XXwNemTdnWjwpV
         TvjHuH63sEHDqykOtRHzKXPFWPpva+tA2ORjPiG5z7CmPnMGbANYJzWE6Lw1Tih9acuT
         1UguC0MNCwfyJHGNgbIVNGn29wJUOj6G9T18OShHTBC5vlVCgURTpk9NnvWhCI+SIy9D
         72fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293064; x=1793897864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=rJGFXQ+oYC384IvJ+d5dLtOOq2CGIEf898xDApufCiQK4Fypif2jtOyzLVsHMp4ddl
         FG2yZkWjWDbse9T0nP6XQkUHevdxUL9PNnqraMHxbyStCoWu4nKVP2zXUxdiM1C88Rir
         xFlN2+GO8PfUPT4GISnQpMocyAaYeB1WMe0NMrkBDISu1kFleyOmJ8LvBxyR5bN+9dBy
         t4EypZ8oZT0ydgYRuObhS/MQClguLO1PjrMDGKrbr8f9efljqewFIudtUJrGGWfwRmSa
         0piK4GSpr/t2a0oBAaQs56iuwVwusuj+SdyFXhPHcorApdPp5VnPYp8qGjpJhD4q0eji
         hMSw==
X-Forwarded-Encrypted: i=1; AKwUvBxENdS0DtKuCXeXmq9J8bv1foaDaNJ1K/EX9Xn9lGpEAHxrzeLHDzIVaxZV2c4dmeHtI4bdMScIhXHs4dE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjQ0/SXiBCBhuhapCO8AifuCBwVM1c6Y+EwDE3MQCB0igToVsJ
	Dk9NhiJoMqfOLk8qNNUfuRYr6Lu0PowGFYkxCnZ6cLd+3XA4MQw0eIypCIunFVbLVCDyyRdD3Ol
	bk3ddQJwlNO+Q/5kcy5tqlij28qAH4ye8vvWBluYdzHzEkK7c/zQ3jTwj6/vcBygcxeU=
X-Gm-Gg: AYBFou33X+DuK1eWxrvU9efMNxhK52NjaVkmkACxHAYnlFCAk9t2vp72kyw8NiV1QeX
	DYEQlygQVITc+9gU7FqfYSH3AJZpla0DEH5ulwThvv9aLAEuk/AWLEy2vqsa6g9tPyda3VsNhNx
	WFmVFLRgrbZIBQkkfMIpYJBC/fdKYAFL5mUu9GWUG5ymA5sL/QfP2F4Q7HAar2kJnCDgll6lZ/6
	J5vBjjQ+AqS3UICAYbaTHe3Y4HonfICgc9poW4I9C1IAIakipnuTrPIjnOSEL1FDuRCZty2qMAS
	xoPNA7IkUMPDOljpyBZX7au5UmCYqxb3rKeYUbNkJNRy4wYxD0QtBVpvWintqoyL8ssTQ6ELLG+
	AwyCvrQji3G1zjq1yDVUc+8ORWWOsUPnsCO5cgpzI2aG3GEsX5uqJ+g0KotIK18X4IFYJjse/+Z
	7O
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367409137.33.1793293063951;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367399137.33.1793293063416;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Thu, 29 Oct 2026 17:56:50 +0100
Message-ID: <50f06fc06f0e83ee59ecf9037071e02344ecd15b.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: uvJm-zBXz9PT0HPZEF2clX4K5717KPPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX/2+5mpTe4g/s
 vsijC7DkrUCLbdBW0NZDMwuuQYOw0QbFOzCrvajt8zgzPvNGUf0flesqwoD04O2XAD0yxDAk6td
 yz0COe63nl7k39RK10Cx/t1mWMNB7AqhGox+6RRq7PgCR168loqF5CFKqif1yqMJ0MUYwqqjqOD
 7GsOHkkLLFZTqwR666RbQeyJFt0jQywd0WaDdKFaVGfSk4R9UlYDDQAwCsn++XE/UwbEcBlvIao
 vQBwyKZJ/PSyMlropAKKl7Y3l31CQ3T6OGkhhJ0gTnkwFR5Vz7lmIJ13E/2u52pJuRQZ6CyFotY
 4y+rXApZnKlOAqqKytsiDf3pislWweGKF0sm8ypSNpXc3z9V1saa10Z/lgXnGoVztFBDzHK9opx
 qbc2kOT18CML3ByOXz8efWUL42DA+YeOIC69y3bAk3q/QmaNyqZCbnDjGJWkAni69UNLo1MmbFz
 pJ0IKVvyGTWvuDm+XIg==
X-Proofpoint-GUID: uvJm-zBXz9PT0HPZEF2clX4K5717KPPN
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae37b09 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX1fqsLNarUaIL
 4kwVW4bJF5OrKpK/FoxF/Xj1uF54jojYhjz8Mtb7Zo3iaoIHmYfyaCkhporHq9x4QAGHf2iRDxW
 JZ34TbGW2TJYDtYZuCGnJnio/2GvhIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- No functional changes.

 drivers/soc/rockchip/dtpm.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 5ae00680602f..664764f4b460 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -62,8 +62,56 @@ static struct powercap_hierarchy rk3399_hierarchy __initdata = {
 	.nr_nodes = ARRAY_SIZE(rk3399_nodes),
 };
 
+static struct dtpm_node rk3588_cpu0 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@0",
+};
+
+static struct dtpm_node rk3588_cpu4 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@400",
+};
+
+static struct dtpm_node rk3588_cpu6 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@600",
+};
+
+static struct powercap_node rk3588_nodes[] __initdata = {
+	[0] = {
+		.name = "rk3588",
+		.data = &rockchip_virtual,
+	},
+	[1] = {
+		.name = "package",
+		.parent = &rk3588_nodes[0],
+		.data = &rockchip_virtual,
+	},
+	[2] = {
+		.name = "cpu0-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu0,
+	},
+	[3] = {
+		.name = "cpu4-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu4,
+	},
+	[4] = {
+		.name = "cpu6-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu6,
+	},
+};
+
+static struct powercap_hierarchy rk3588_hierarchy __initdata = {
+	.nodes = rk3588_nodes,
+	.nr_nodes = ARRAY_SIZE(rk3588_nodes),
+};
+
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
 	{ .compatible = "rockchip,rk3399", .data = &rk3399_hierarchy },
+	{ .compatible = "rockchip,rk3588", .data = &rk3588_hierarchy },
 	{},
 };
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505868;
	b=AA6XMDpy1G69oxI2NrOeOPlzbfSwH2ncHUVfGStKcuqsNJiBT2KZ9wFJK0SyjJoeazUk
	 VToLPGBpiQcRQVtFn+oLwrUsBQKsWM4k6dehIUbcZrHvmWxQ6gRzVrEQOtw0y4SVmV/B5
	 x3pmyTESwtoBOIfWddmVaYpyxPKLbLT9m80TgiBWR2LH+uN+3JD5CmLrIQYwIIb4DjVME
	 egki7iawcWozv3vde7j0mNmv1EKA7b+j9DJDTXwrPi4M70TdZeHzZt9oGE3j4ex2eeVlt
	 QvLuEAqjVWcLJUIbF7SMfTWEw8tpb003JMwG2qyDHZLfilBG2QsTazfmCm4ICdEVKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
	b=DpqF7I0sKL2nRDEaY+kz+J9RFnXLdMQEGaMygIYGzohLB/bHSe9p9b0mc1EECsJl31zK
	 JEK7jZbyieaah1iur79+a2dLRWzuNatvQW4bxzYxZ04Z0SUJtDWsbq1/aalomjQtgHcCQ
	 mUjqS1euFJPzw6ToFQDJRw2iw7+NBB31Jvvp2I9DWiwp3IsKPAIewjU5axB9j02vNtP0o
	 gPIFlo0kQPz93ephKsZioGDNMwVrH+4iKwLDg39nz4OLhBUlXtMMO8Wen3GDbTyHnta+4
	 3zBYdX2fpRXEaiFc+31gWmP6rbu1a+eyuiciehRrAkU5iKw3owOZAi/kDwasDWjOD3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTPDiGzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DK7ggB2R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264B60A6F61
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8264B60A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTPDiGzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DK7ggB2R
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9xVo271035
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yt8E290dh+t
	ISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=; b=HTPDiGzfWdVUe/V1+jG0cjMtZDg
	whabYYTeFVEldVcYw0qR6EO1OYDdKi0ZaVAjAkOznL+PaOwru5/S7K6yF9njp9ld
	17R056nH4/QOBZ9gO2sRZgbXH9yTwvYuJ9+NWwlezCC9mmJsjVkZJCoCT1dVjXms
	lnBjyV8wDGo2eoV9WDnBQ0h8uydGxNYPUM4sNtdAS5siRok672umX+l+eg9L/Bqk
	XqA8wtOC3j4pEowXgV0hvvxN8ltatQaGNrD65uk+FKexRvO2+g5OT5FsG/il4Jp1
	VHMQYiDa/jW4fcxk2eIVxX3FM6Rej5JY+EnUK4HOlVEOekTTTWDrrSuQK9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8hvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so733206985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505867; x=1793110667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=DK7ggB2RHo+8/cyBV2sHoU6EjvyD2TPMZYElVi8EBpcH2fgcBS+OTN5M4g9bERnxyw
         hf8IPcBsCb/XMepL9Y5pFXGljJswxCIfmhZ4DQ7BMuFMMMxV9xZRqDHV/lwShuCr3u+b
         9BBwi/lnf6NfarvOf7diUULZkVNVh9KfhXz4S7w8HHbrdRVNR/dNQF6Q/O2zZ8rvSrYO
         xQkGNpRbu3qC/h2cfqJU1f1Xr40RNEDHfWORrGmP8IvmAqGfixnY4IR+MpjWMIIOVSZg
         lCOigfL8DA4FyFL3HYQrKaBLylSjDvDD6uD26mRw8afj1xwzmuBUlXz8HclQM1suKTxF
         iqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505867; x=1793110667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=A490dhvQfwplrYz7OrFQ6uvuwl+g2P/+uvbkROFvqWBECkkHwNM2mpgSLRb8Sz9GZj
         7eNWbeAyGxbTyqDVk0SFVI5H48fXt/8lgHOrt1wFxEaTitJEudl//gBHUw0nqJ3u7geu
         GkMuGRYnsJk7JW5o6HsLxlAV94hr6gvMZNXdEkdubtqWW6fmtAvu18sL74458GTGDwb1
         9gVz5TGXKT8BbIP2GVGXFZ+Gl6jvbGmFl2QTz5Retr9B9k5hofRvMAjgAWvw7DYW/x/7
         PnZUIl2u2nbVvDDJnnW+SMBABTiTUuxAyKATO/ITVZeksqGcltMymzDK7r41JneLtYD6
         0VNg==
X-Forwarded-Encrypted: i=1; AKwUvBypWcKr0H4834yzCH4+goI535y3r3b0MoyuzAFjnJHesaUF/OnAKbgjf42FJ+ODFwsHlIZXTjticoRNiBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8xzIYYsfJxZ83f/u8jsovpOpVV0yOvqoo3IhNEcGljRoYDqT5
	28o1fKzFZPGYc3iefwYDaHH3Lvgp1rcH32N5lK8TZbXTUO8eaL797g4nCpIuqFYVxgsTY5E0P3b
	TZWHnqtsY3WBjmAtrP7EIYW22Ld2gU9yTNQfEqn44lmK4JO6KRkn8/0ER+yCMXQk0XF4=
X-Gm-Gg: AYBFou2/vluTX48zhbf5WvXAeLfS0RjKgd3natXtqwIeGmYgOY9FCAuBYGgkTAzlOsQ
	ulFi9jSHDvk6S8k/DGpA6BI6NZ4HUeGiE12J2zlQk2IXC8q3a5xi+sIhEm/Ugdh31BsDxJiTafw
	+jckQI8mSGqK9c9LM2h4jpyGHU2UeFLex4t2ikObjNQmSvo2Fdz1LjFA83Lp1wywnQZM5VqHOUw
	bslPtAm4H9H4/pk1WV6copALQRJ104L/eyj3E8DWFT7hyFghqrRJrbMnD+EtdMxp8xVZpBELj0h
	dlA3Vendxi9vZQS9UWqMiDBz409/5D5uov0DoI0nBUvy05bLPds7ytLz1eWw6H9A/C4o/8tAYW+
	nlBjLJOuz3NYggc8kuqACigXGgKI=
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783590885a.56.1792505866731;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783586085a.56.1792505866248;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue, 20 Oct 2026 16:16:56 +0200
Message-ID: <e271d25192830ee02fe75bf0d5e698487b1579f7.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX1LKMyyZ9rHuz
 pcYwDdbM/UTQ5B/Pdm/ZKZQ4IY8HmIaUrEnY5otW3GCNKSVCN5YTMwDi3Pl7YEyRL58auN7NJ4e
 +zdm6WdC0M284HHb7iumpZYif6Yoo22SonLNw+aplubgYbp2LyfmN07M5bSUrX9Ojy5BrNVWYMy
 KIRvDVhlCutZHWhphFEdJ4PPmXelNslSomwBtT7sKyMebAPJgWkxVjQK0sO7hMSAH60iXa3WZ0S
 PrbKNKLqq0VoMx4S34neNIdQRKFUoPumIFv3GyuqXZaXS2MtwBppvKltnHdKowx67tsUyYeysri
 2NAPZARsaBuLFTpkpBVwrtwVnwZPuuTPHlaw/nUmJF9wcl9S9BiPWAxoJQ11X8e/IRBSak46V/K
 vp+bjGYKmYJfaWZG3PDUefBkSyiPbHOEzSO8I7LxSIDc7VjmJf/e/pnGQ3t6UWAWME8+WCPc62N
 H5RYjy5bXoWywtWic6g==
X-Proofpoint-ORIG-GUID: Kb7CfueM2MimRxxgJ3ny1zbH5eNsLZc2
X-Proofpoint-GUID: Kb7CfueM2MimRxxgJ3ny1zbH5eNsLZc2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfXz04sDfc+gCSo
 jmGmUUPIb3BcnXLzCcz4t6O94VoCSwS8MxeE2U2+vOcDCoLXEUFKQ9xbiYmc2MoXIYY6QryENlY
 hF5qTp29zcKf2xSgL29rpDEg2SUFMUE=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7780b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- Add Assisted-by attribution; no functional changes.

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


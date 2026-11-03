Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681358;
	b=4hT4e43sFj5FCUMWWu9wV5XvB+3+a8b0/J1Dz9Z1Rj7jcV61UhbBGLyI1Xc3nnOvpcaB
	 gpfiCWnbbhN3nQC5wuCZr6WipBqPduvESgu8J8IA0VXx3TYxEAJZpFMhBrDqS1C5Daahx
	 VMH+2k1POJlExmoBtUbZbh+LuQW4E0rAjj1cqZb1L4c3Bzy7sKY6xoMMyzjJAcy0V+iuw
	 7HNKUQwSYMYokw43uWfaee7AgIPZz18tEY69uJAF8HVy9SVkPWVjth3o2Qe6yUO2aHqf6
	 xR4WJR5rWrAlbZF5CimuQkTulQdIcJ9CLCOLEXaW1M14c5EqQqgoKodOWhr1TZ4B4xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
	b=F4ksFXAxm8hTR9Judm49IDafhkU8z6qvUXhS+j1D2dAxW4hHw1/ARAtrRDB0iWpvwIAF
	 dAc/TUuVBAn4hAe5hunRaJKO/bt5hcMXp/ogei4XHkLIA8c3UJXEjMoNBYY3QkPtoLBxb
	 C4EQ14S+y5Sv+A4y+l8Y2CvvvNyH0XdnHIWQ8PhR6CTKJmr5+abJE709d+CzTRO0yiy93
	 /QP5LAz/tc0MSzSbcmFjHK5eUiD+A9NmhM4Sornzz2Tu1UIchsPVJHjLBgGYHkApaGtLF
	 vsqkkXqCrAl6sBVXOxPWHxh/UwQ1FrAZsO1D8yD74CkfUH3erlCZvMSUjoMzZI1drTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HW/gtEYO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bwhgqKQE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9D606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A9D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HW/gtEYO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bwhgqKQE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32CJA62107205
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 04:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aLQirFytpFj
	aE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=; b=HW/gtEYOYq7qPFBq0/gQqd/3Np+
	RcWkro5MXkDQIBNCR1TXtNRsGdHdCsQiKw66Sx/kGOr08qK1PaXIYeiYJ/wry6uM
	IU7tQM6geAV3UkQw7gLioBgYAttptD8T/JeAJmiwFCc9gFObLAjDR+kgZ4ePka+/
	DIwNKCEntBWFyADddc8uBtmmvwNeqL0lke39UycuBFBUqhVai/E8ChTizHlMoEZF
	SliM+VOWEWpM+qr655TBkIyu0lnOX/Q+j1HrAaXJXhi1af8JH+sJorsELhWbkyMN
	uYU/CWsrEhRLd3ffRmnO+FLwWOy4ETQslXaj0tuelDfhTGhWCPmWUNlgDVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m98fqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:49:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso58152585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681352; x=1794286152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=bwhgqKQE3kqUkT43/q6GQsFlxYJYpo21rnOUzLdklDETojqytxgxZjjAzqiIij1vf9
         pa0fhw1OWb9qIj/AKA3KYn470F/shF1VZSv4WL2wCeYw/ScG0ZsPhCVujS6Q0hM17kwC
         rriubc9/124mYHa88yloTUCdb864CQ2ZbXkCeBgBitPdaem+zlAWV47OCVm7+x+prbG/
         ZMly6bOZVeePcEDKz66zsnFITEBj4vY0tiHkopI2TheFTsX+QrFs2Dez443/SaI3Eiw/
         mmsq0NVYGQeDC/o6LGhubWOnJOuMhlAFwD90C56DH1x7SYo32h4+GwZLRCwFQSrmn8nj
         RkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681352; x=1794286152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=AEXX/RVjSO4sx/zbuLlJqflfkDKCj4HCuDtBrV+iKMMfxHrNce93NYhMrcM+SoR/wU
         PIz6DbNqBZFRbkY/4FVbDALb5xKyI0nniPgJv4PrEYvbU5MLfsbPOySeX6y6TIOKOVeh
         eS4fjp00aHeLfXzq0icIKp4yWDJH2ixVACUXhUhOm/kWx+DryDi9juZ7/fmWuTSLIfEm
         LAeNUbFbqOAe14WERG4pbQV6Kw7pHtbgFXZDxpbLWgBNeEW3imFWeRg7k+gogFZiKrLB
         owl6nfTEJdpLYGRz3Wk7acdEaxgPo1eW72paB7qZJsxEmFFiPmw4N3LsCeHcxRc0C6Te
         eMEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwtoqnlbSKjDB8kb82pSnUDyj2Hmtpkeg7Uaxk90BkMJdsgYRyMbXkEz/5zu8IegTZCz6oyUNhIyVdPA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/APZxDLV67bBAFgwhYuVMmDyQBQR9M2ctnYFcoQwJizX+EYORp
	bhAS0kejbj/RbNEy6HLkzFNc2vuQ5xsuyswuBu2uYq2lDleu0WCoGKoH1mtcBE8hm7Hd5uUpCjO
	qmtNcnWmFAEVQ4Ad3WIVepqar5rB7dnWkWl3ZtJPyydPNwt5o2SSC8MALDu+t/HzRK0Y=
X-Gm-Gg: AYBFou3fO3VtXPMcantS9dn6c3ymRN7pG8ecXQJoYouo9ehNi3tn3Y6xYzTVSq/pTfT
	wuSyg38ZO6kc++L8mB5rQSAyLUH92hCj+4WnPCa8g7zbLeHNEY4hT+iigv+CSrC/Nib+l3S/H7D
	iNuwl4kRvJCi2f4EvuLh+AgP15XcJD7JLjNErEoew64UnRFwF7UML5Puu4I4eZNta1mkS07fvQg
	SBoNfIO03ix9z3HSQcXIVWEVjL6B5pKHBfNkV0TtvRs7+LD5J0OfAankYHVU59mwnQhamMBXpIz
	xPohpICv6Ey9PV3hDZo8NGSqwY7bAHfxlkq6i/lR5Aqv0aGwfHK5RDhjSSqErAj6pRGCinAbgVP
	cn1qfF4VCMeIb4Fe1uteTi4647C63YyJQTESLSAwhUBjnw01SB1eykNHmV1+te45UYwtBbfzkSv
	0h
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383284285a.16.1793681351795;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383281885a.16.1793681351285;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:10 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue,  3 Nov 2026 05:48:20 +0100
Message-ID: <973998404b628e5a995a06fbd0febce0802f79bd.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: URzEwCO_eEy4Or8Cv9Rh67RlNQNcZUKu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX8Y5W3DatV/a+
 3FBacBEcLUF2BmHLuonR7QnemYK2zEp94eW3VrYjZCWYSvyLWAY50z0P+bUreSJQOvs/9FJRsRr
 YQwNqW0mirPGLlaCOnmGcpIYDDiVWIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX0LWRWpkIBxNb
 q8HaGt/p0AUegOuVaQKmGgw9H+783rgk1nCD7qteOr4uWN+H/q6cyRgL7chSGqaJgjVajlFdAws
 IBVkJHTxRgc3Sue3ho8j9PtpkSZFcLCUGbF1x6w9tgNkyA8zfo9kbu5ajvGODdciVU5ctskUrQE
 oUZMdxqfMtpkMPHJYkMEGcQAR5mR4xPSadbled4J7zezqKk5ooOZR6Rd5zHB7SzoFmoil6DySbC
 Wpjq181Pf0hRN9FA3I2pun4Jl1hrcCN0r7XoXS3HwAcGouw9ZyhFNiVf0lddf5P3K2WYO4H10kW
 NCcQCkyJVRlhoZ7rHVxm15UDdb/GoV8qW92zZnFETTZOehaFSyHhhEi+QC0rieXgdxxWGpW6Xpq
 I2bkKjveLm5wzvzAXK6+5p0HPRYs/oGYAQQI3KNr0QuS/lMIzHQj1gh1ajZz5pyJeAd/4nEakUO
 6Tp3iNcKa6i7CXHpLUg==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae967c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=8Fys3Dm6xgAeGQ2jRPYA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: URzEwCO_eEy4Or8Cv9Rh67RlNQNcZUKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

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


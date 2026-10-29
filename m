Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293059;
	b=PwWrSuFH26QrCNIjcw2haAD3QWse8J1RAqsIA8SKpj4iqNHAmpctnJiCoFHmO5M+9Lvb
	 5IaLjP5ePdyeKriM5W5ML7KiLEQK+ehov4iCb2/jR7oWCGrbUCiWdftMc0Amitx+HR+2P
	 tqhl6fT4frD7B5mPQS/8DCDECy9WBQ2OnH8gcs9n+m52lsX9iXnFDu69Gy+QL0PTwUaPI
	 VVJaFiwU7EwDYZBhGndlgXWq3368hodSztkMjHIlft5wC4iTK1pA387gGt5rttqqLY7B/
	 fdJgSRfCq079aL/hM/ceF322OCOMoVRdCqY5bHmJDbz4Pqq5B6asyB7yFv1NlrW1Q5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
	b=0YuyBTgSQYJA6NaLzWV68Oc1tY7bFSHdZNrO5Ahkgx2Q1iCsrIMJ3xwcpCuq1kIXsQzu
	 dKPsOvdLW+mNeSJtjBBMr+FAXbU6NSdB4MaEEMyChocBHgO/X13YY2YND5MFtZzJ67wJP
	 jrptrakqePdAR1pKxyrutqBmM3OSFBfLLnLDTgu4JBfb3cv9y+ZPTuZJpeIEUMnBRyoA9
	 DAb3N/jxvzIqtAwIraPKjuUQLpEwcUsaZojg3+KJQvQZ4fDocpKmGasLoGHkljkFWzA9+
	 BAeLVmAWt8KUCmhfivUCe0VKCVxJNCGG33BKktywI/tWidmH3EOyurpyVLoG61zT5Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmlqFbrV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLFA90Dt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F005606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F005606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmlqFbrV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLFA90Dt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDPbN594480
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+xV1RGjg5KU
	41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=; b=mmlqFbrVGnojNptRIp2Y0FfR73/
	wVV/o5gTl0sCSMYCHjuF3Dx6l0i5+dOf8jR6p65QP1QMFMPWqGx0EMXVgd6dbauH
	gdakoBqo/m9dYUGh5xACXlDUC4wCrqj39o2uJq7laJlMZUyh7kOcGa0InIpCK165
	6WlNbRcScA8H2Sjc/YpxU4HfKK8QEXNqvo77ljPo43uBpqhXz5cAhR9QkF4qQxMX
	5svf28nfmCH6fqPn7+p8M49RKPZmG7OQ7HilRO3lwccPNt/JQ28mwIbGboEUWZDF
	xEd7ajB1dSy8HHKOBP6FSUd4j8X9GrXE2IGybfIwRnCbmvDY8UBT9I6lL5g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kj9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99063f4065eso564363241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293057; x=1793897857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=XLFA90DtsV8ao0O1g1TGR8ZaeW+WCt5ubT7HTmtPEAqL8PY9W3Lco3ryBst5C8B8Ub
         A7iGnNGPdCESMKfg5SYe5LKaEzRGz1TzQEVQgUDYlw0DsxKwOrGsjF+JrOgSoNewKwmF
         WbmpwdaR7eIRHiGsRTYuQL5nomcxJ+YE+aE7GMZ+VMmoWZ7x1TtIksALO26lvzEPU96A
         YAndJ3IntHxwNhehGYsOTPR+jFoHJL21mKWqnLuiXbBRh5NQ0XnodZxPe2UhVG4I34/E
         c7afvCcaMiU3SbO02J6zc61gNut9JlrOsSCvctp8eZYlMPijwJ2sRC0wjDPEeNm5mUBn
         xepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293057; x=1793897857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=Hvlwp2aPIH83FbMk35U3L1cNsiKra6B98zRksYDizbkKYuNhJtrSw6UGoweJnA9xTR
         RqjKUCcl57pGcinemA1CDuwBVgxBSZjTr2jX5sgqaGgF0898C9IHNmA4Xs04/aYzhUF+
         Oc0AyxB2EFKhSH5hLZ+WVpxyB/OBdoABd97TPdIlYIqz9FrxHfFtm0Hc13/bYYtWzGo3
         bAgbvd6alvIuYyGicpVw2Z2QQPIFWABcnHrr1yt6jm/WbsjUXEiElVHGZw7/a4ijdeYg
         YCkhZ80T0YPgJbqfzeVLfUfdd4sLogj+OMCJZaLUgWLRmXJ4h5SAbZ/4QgmtuWp8cD1D
         4PEQ==
X-Forwarded-Encrypted: i=1; AKwUvByrOT693j6AUmjhaD2JhPT8yPcoYJKjtojUWIdVxJJIZaJk6BG1y20vms7Oy7NuYC7bEVgqxJbRntFhy90=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHr/DaI+rEalPnJZf17uQblVZAYAo/kAQZDPGv+/1BjUvNvL29
	tPRHkQiJH07iSpsKT4ICVVlv959nKKYGAa9bB9Bl8Z15HarqvzdF/SSp2uIOVUulYquPS1NIc1/
	bw2+DAyx7seTv/VpuqXJk3tvBiCUVeZ5v6nnZY9sKhPiiR/S/EtR5Ic7WYa+FTocpiPk=
X-Gm-Gg: AYBFou3pwg/cr7/3QzNchpNLwuIUvYulHFItAONj2OmhaKu/14obf8QEaxjzbCMrm1G
	VUo1qQSx7A73eQgA89EJ7o5n6JFNI+alnUNt4lh3iQOMR+5Go8eohsXRASxrglyKhd2/N6SpnLM
	2Pv6E1rs/J/I24T7UHkwrlVM7vmhKOrBiBCVV6cQPMRFzoMZ5kEze+SJsvPAuLlGeQHJvl3FyD5
	A+zfU/F+L5yGje/gM+0SabSkEJNKJlRyzzczXT8zmb3iAZuaapccUcVwQ5ZCVdbnlLNqM9/ufEF
	NCTf5oxrg2PuRi/qwrm6WlqnMG6iEBDcIZ1VvqG39ilzRsZcI9s81QlZHuEMgjpLl8l/1ftVxKM
	zzBPFiPBWmGJK2FmLsXU9V0kN7a4UYcrGDcgz1ZfoethJHs7psndLzB5YZcA7f/zo7l2bFfnaqp
	kq
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117844137.13.1793293056977;
        Thu, 29 Oct 2026 09:57:36 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117824137.13.1793293056511;
        Thu, 29 Oct 2026 09:57:36 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Thu, 29 Oct 2026 17:56:47 +0100
Message-ID: <141ad25a137cb50516bd92f9a13dda7ec940f6da.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX3nN3OGJhApBk
 Ad8Ethm13DiVvQkaLY6siBa2rxFuDTuuxDhIQTRJnjOoD58NQopSoeu/1GjkdaoK5z1qyii+7ki
 wpWoYSm+xpKNwemV1DRmDs8WXaPmT0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXzhZGbXDIS9Iw
 IxyMXZELwMEqu4vNL8sjza1PolpQba8BOWPOP873d1HDbThlO2w2uXqP590mfrVOtzmOFmLNnx+
 x1R675R7XAA0MwSq5WcYfYj8yOV9o4aVBrMX0nUBxE8mmnggP+m5QiRaXA8OpYvOREBc8M26Q5v
 3KO9w+1cJXBt92TVHiY/Y7fb21rSvH1eD/UhnPODaLO01YcofFQsftBqcB2BG6JwPG9z5rxWQ+d
 Cm+ofUSqPuo3KUrdMJzOphY37XL/iQHHf5Nu6DE298EOqABrOunh7Ja+yhWy6ww3ejHtzlRhc8y
 G/VH5XvdCBFeTD9k3wa2BfVY0yFgWxgx0o6cI3fZLiE01P31FFo8Ssvs8yesDX0oWVa/9TCDpLs
 mD0uANjwCuYmUdVCxH8fQ1PVafJplWL0TzGzsQv1Mrfvh6TlZlhnOG9rE3EGpXEzp7xeKF5k18n
 aMDeyf8KHAs6YVhXDRw==
X-Proofpoint-ORIG-GUID: 2FLYqEB0RVvfXc6SJ12o7tzGVqh1tY3N
X-Proofpoint-GUID: 2FLYqEB0RVvfXc6SJ12o7tzGVqh1tY3N
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae37b02 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. The backend already suppresses duplicate
registration through its per-CPU state, so the removed entries are
redundant descriptions of the same zones. Keep both CPU policy domains
and the GPU in the hierarchy, preparing for one created zone per generic
hierarchy node.

Also fix indentation in the Rockchip device match table.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.

 drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e71f315fbb6b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[2] = { .name = "/cpus/cpu@0",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@1",
+	[3] = { .name = "/cpus/cpu@100",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/cpus/cpu@2",
+	[4] = { .name = "/gpu@ff9a0000",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[5] = { .name = "/cpus/cpu@3",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[6] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[7] = { .name = "/cpus/cpu@101",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[8] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[9] = { /* sentinel */ }
+	[5] = { /* sentinel */ }
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
-        {},
+	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{},
 };
 
 static int __init rockchip_dtpm_init(void)
-- 
2.43.0


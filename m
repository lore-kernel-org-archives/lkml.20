Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193866;
	b=IgUG7bzh+mAcF/hF8DWWl5u3y1vk02ZkSDezN/17UVDGqyt+4qk0+NzgnSzaZvt9SfTW
	 QaQjUOMqQc7bHW/WFW1zKCnmtPnbF5RIywvb6jj/w3b95BjMgceGw4OonIheufumorYOO
	 +nS70Q0PxslkPrcfQFKqm/p86dpGCTmaf1PMErlanav7InC4SZo65vXr+A8c0WDyeNa43
	 dbBShvWlo7KqtEigGzavoutUmcp+AJ//X91l1xtBSEmRZ2nshVjpbaPDNWtSFSxLWfA7U
	 1vlbKqhXcT17xZV6yaZDMZNobe24lj0df0YjjS6VfcxLPkXx4hl83XiNtxGNcXmQ/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
	b=aL4AMLO/K107jpuujivu5wcK1Cv7GzFKRhOz7/jEnyjY2CXItCQi32w0VCNsSsyjie/B
	 ePQLz7ejNSj5dKIWxDwQZ2Nouu2iE/fv3PzJpD/dPxCj8WEx1EvJd5vCMx5R7YkB8vzHt
	 SqfCbcHbNC59WPFUE/Cwg/Q22hxiwAIgAdleil1w3kDX1rVNFeQA7N6UrAwep14R9N6EX
	 Wt+fGA6V+VRtasgGKEK7oTUKJ5pAz+NZmOyd5V0mYW/2RrcdlToQQaZoc1QPriDS4yw0l
	 ZKCL5jcN/txb0jUXn3jevqImtr4U+ru0mf8BbC6WTOGyhn7uncTXpX6K4VeQbkdkK2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hjAw/KOT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B860A2602
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24B860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjAw/KOT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4mt4154780
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MkvFpAtin74
	QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=; b=hjAw/KOTCala2OzsqHDzXHmsLW6
	6Z/uFjD3FTk+NQjLFsqvGJW3rYeR6NDq+wMC3lE9GWpm5dXzlqkk/98546CvRDOE
	g+FsZiX7xJCDpPCOAhp7FvmWpoQt2rtuc/Vb3+MZ3zss3aw2v7LByAu9aHL1ivp6
	azFJJO8muTbrFif/BcmCDGuyZuSFR4wknQLTRSH0VZN+N7Qxfb2xtwCO+kYOcBHm
	9ho0pPGWPtckl21N/+oOv49iE2vh5VEf10UHuhcSoK34QocElZVHxaHUkdeYMw2P
	B5/uloLK/VTlH9cuty/hax2MA7mI+Ra1v+Knfr+UTbly+Idd5PO87fuHQ+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0yp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso414855285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193851; x=1793798651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=jMa8LWOdqLd6/I6OnsPR1wADRNO9bg3rYnJQYSzcouOGw2VyHqbHkWkdas9JazagW9
         GNB3NLeMa86S+tZ7wl6ENzh6a2LNUmx6RDFx668eaV4w+Ct3BeovPxNN+1Mi/QqvGM8M
         TGjMtCki+nc1r5u/7e4uqec53E3lto4jEsJapcYpzEcC2mJpTvZp88Qs8NCuW+2Nezhy
         fH6NnxWoh869lLrF/XuX6KAkMZOXmk7976vb1IL70cDDNCYYuLdWHtf78Bf1NE/pfj38
         M10FiIr85jBfEiyA0mm1GLQroKRBeE2g1W5NYLd5EAM0kJSaRRavL4g/FUp3lnDX1ESa
         hRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193851; x=1793798651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=hYob0hspo/tHrTGq7sr/aObcUxR0oURrQTvx8PtnZw4UsrpZK7hrO7UeP6ZLUJ1s4Z
         mKdSfdxHZUeFog1irUHMpCI5UxZA5b/20f/PvCoSCiiAIqJuibxMHPl+KpkveNKdno/s
         vzlXo20fQrt4yD5RyTG9+GFtIHMujKQsuBuYsp1qb5wiP7QBtOlkxF4SKyQ/O639Ejvr
         smWm+uRRxc/XLTQr19hOIQmQ/VNvy+vGHmMV109FPOb8HpksTOSMqLFfhQlGbegRzwjw
         4cfEjvcGOZaGUdhG3nLP6lcRbNQxU9pMEtN+bhS11bQFLc6FWgIjRdRFW5Jc2vOeRwDi
         RkIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCjtJJZXEX7572nBm0DTotwbOCqFvz9OgJS1POnzMN1f4lCtM488ZYElv7uRWb9ng/LcGK1+RiNNghAok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoWDpZbx5so2JOXxP7DIAS2nOCQRPZ+7C+hPJfvCacCbWSBSur
	EBro6zaW4+9SDij4IIemgPraS4UaCEvlMjYE1h1LDbz14W8PAOkMzrilFuGHQGIXilKvGvXcUQk
	J4N/Mb2VY1EylBfQs96Vbq1796MbY1lQ6rkxhgicv6mWy014bb45OAgIN6UvFup3jX1M=
X-Gm-Gg: AYBFou1FGKa4hHRiBnuFY9DAFT3U2AS+N5TSJuMa5Ww0TGDY0Pl1uGKHb1S4AL8kkn8
	0bI0JuEW20Pvpq/KolJs3oi2ifz6r5ofb32vfmiDaX29jTjaJjxUU+XgkDQYqKg8nqgs5UzLRJm
	Ks0iDPe3ALbLjFpd3aI+LF/9ZsGwRNw72PW7QKPB8Kal9CasHmNVOgqPwsr14ByFglc9QVZyG/k
	RLIcqR1NIaZrSUuQL3TxLA3jdNW4NSVWy6ND3QAjrWauEvgpRFyrtOeTu3fE6wafoCcPv6Q0siJ
	sARIGyTY0+QsUxmvXAfmhut2CjBZuR8MUbhXlid8COxy+xrHBK+2PN7PwmQbxKiwx2AXRPj+DnS
	aKg4H9lqgaUiFNKp1Tp/nFjVxBJRYK5GHM5/8py70uoGPQkct6DQpJKOURAGK5wVccVdnFPW7WA
	==
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930533885a.11.1793193851149;
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930528885a.11.1793193850586;
        Wed, 28 Oct 2026 06:24:10 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Wed, 28 Oct 2026 15:23:59 +0200
Message-Id: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: ep7zc4G2MwcKI-NJJImgSs5RbpClQgny
X-Proofpoint-ORIG-GUID: ep7zc4G2MwcKI-NJJImgSs5RbpClQgny
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f77b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-HOgthFiqlNClzdobJoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX8TtbkItVssBK
 GKFYSjCVFm+I2683PBqDfaCiNvn55NiIixyUNtEAG7BBlFVlkuZpuZZXfW+ObX8xfdlb/9Oavzv
 4Biq+L2Ij068HiMqrKJMR3DJ5i+fnxLj2qsUOzNLeit3ljR8vachZOPEYretM7E80dSa940ocFI
 JAl5NN1ZyI0qB+kuxXP9rkVLYyKKL+RKVdVEkUxDcmm4NrsMcEW0g3iAPsTL4wOWMVIL+v7/rAV
 0PRJU0RQs8Lmt5WSl2DdElffNjN9hYsxyror6lJbc/lbSFx3VnjKHiKEdGBFdZmVYBhh4nLDd+p
 lEhvlFuw6Lo1uKzNxyk19ahSEDRZ9QzqHBfUuOieIzogbgAFOfp5vKQ1qhecSXj+mUZgucNiQFG
 XklPwbxRhqtKz8vWCZcFskp5TuywQ0vRLw1y9PzLt5hfES4Z9rig6QNreJB9BShYIYkytIfkG6k
 t211xy7PGbHfXpqwAbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX5De/AyZxkibc
 +Henaz4h5OR0T2xv5h0M9cvtRL2jw4vEanC7S3swgl2MBR+0tyMiYtnLTQV5uy6cavPe0b1L8k2
 wuc85/93232//XTS8h+qOLke2OZrWvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Keep failing when the pixel rate exceeds the highest rate of the VFE
core clock, and clamp the other VFE clocks to their highest listed
rate instead. Take the clamp into account for the other clocks when
another line powers on an already running VFE, so that a clock
running at its highest rate does not reject the request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Changes in v4:
- Keep -EINVAL for the VFE core clock, clamp only the other clocks,
  drop the warning (Bryan O'Donoghue, Loic Poulain)
- Dropped Reviewed-by due to changes

 drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..bcc2c1929af1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
+static bool vfe_match_core_clock_name(struct vfe_device *vfe,
+				      struct camss_clock *clock)
+{
+	char vfe_name[7]; /* vfeXXX\0 */
+	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+
+	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
+	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+
+	return (!strcmp(clock->name, vfe_name) ||
+		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, "vfe_lite"));
+}
+
 /*
  * vfe_check_clock_levels - Calculate and set clock rates on VFE module
  * @clock: clocks data
@@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 					break;
 
 			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
+				if (vfe_match_core_clock_name(vfe, clock)) {
+					dev_err(dev,
+						"Pixel clock is too high for VFE");
+					return -EINVAL;
+				}
+
+				/* Other clocks are clamped to their highest rate */
+				j = clock->nfreqs - 1;
 			}
 
 			/* if sensor pixel clock is not available */
@@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			u64 req_rate = min_rate;
 			unsigned long rate;
 
+			if (!vfe_match_core_clock_name(vfe, clock)) {
+				long max_rate;
+
+				/* A clock already at its highest rate cannot go higher */
+				max_rate = clk_round_rate(clock->clk,
+							  clock->freq[clock->nfreqs - 1]);
+				if (max_rate < 0)
+					return max_rate;
+
+				req_rate = min_t(u64, min_rate, max_rate);
+			}
+
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < req_rate)
 				return -EBUSY;
 		}
 	}
-- 
2.34.1


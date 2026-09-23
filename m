Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA5483829
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159213; cv=none; b=UepoXSnfWn3vcqjCDSSYvSeCMdTrS/VsZDYgaw0i3wW8HDigm3kOkV9uctnNlNrQdyWBYlFN1gQwczuf5eCSClq+ueZgVwxbm1oALUgORxG3VDf1krkIgc2RbrszimXXoO5g99VgT5Mkw7sQ5sZLojP1six/WvbS5DPQ8nhX820=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159213; c=relaxed/simple;
	bh=CHLjdgbBFmYAxDYgBcG23Bc5Mf99naNoUTb/q1yjs/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDGMRbx+yUNpMlE81BEwJMb3a4hC6HuNJUVAGVKXfp/euvZOUWGlDb2UlxmM4m2nm+t5a/GBrpj3RsAcpFR1kXMdQWXOM36tc06KYg79nP0f58sz0LV6WRL3OJ48PUn+03UcZ1AxTlINn1GuA3+qgRc8wEmgcmMJUfo90DRdG70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrPgyRPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG75mqfT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrPgyRPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG75mqfT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA33Pl3088652
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=; b=OrPgyRPUXd19SZjq
	yxenaCAK/rVMzwNyvviWmyFKvcG++SVPikn61GTUJGKa7KQvF0CukarT6ghNuTi2
	VkaqiMGolVAvn2bb+IGmmlkeT9Gx8X80LfZmyc80n2bihnd3aWsOJ7yB5cbSUvCD
	5gMoLwD1dyreuSrPdCNatkqnKL+yD6iJop4mfRGbaLXnjkyLQEZ16f1LVxRrm53O
	vPvCpS6nEMB22Mx+y1tZ88teXaJyuUSEVmTV2+eZH2z43d4B2pmzAl7XCclEL1ef
	IjeQBeBBv9oe/6M67Ck61X13d+10ZmBn4G6vvVdx0BBi0ehXNdfRBOxgKP1cSC9C
	E2MFLg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8ams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438fef603cso1264038c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159201; x=1790764001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=;
        b=kG75mqfT3eWg3+/1acsznH8vpfzufo0R/aHDDpg69dfOB4ox0JT6/alR5GZJSSlx71
         NgCp7qJY8mahAnVkxbcMrTzpw3sgq+QN66tLO/Hj8jBcCNuj1XDOznfP6gtNMo7/JNYb
         pC0E6R/7uHeq/QPzrDJWY7tne74hwDuh5rr6BKwvXSeNay5/UIAdNPDlDogjK5e3/LJ7
         sQlIayiIlBCNAovGkQKFE5suNgn04yadGPGu6YRDzM/uBHckj8vW/VLm+zVeDlNqnN+3
         40SYb5Ax/1FRycYP2ixLG0iGGdfnAbEAiH81muj0pcuvmMt1qqR0oMigHFvXRdtHKK13
         qVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159201; x=1790764001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=;
        b=bZWTbLSrpAaJWuNBoS7jOIqOS46nYHHzvfW4psgsOh1Q3yQ5SEzT7S7P/LRPEdA2TK
         4wfoAG3gWiKnp7A4wrRFS4BjMT2IIQY7XP+0MBChRQRkjL/WZRXVM+L1fype3e0dq2G+
         j1SnP0XVaHuGfPa4ku4B6rANghZWH18j0vclbadfdEDgeDY+dSi6q8uH2XaFBZIFZxIx
         k2Kay7TXbaumL70LrvklEbQMGARbCWp4suohBOEgD/1dmjfh87YHMrRdYbRgxe+5cCPD
         L8cSECHiKQf8mt3xahq8K0v3TUGsXDnRwtnDuLbE4nstqAsKckn1IZxDKT6sd7+KOsFO
         UW8w==
X-Forwarded-Encrypted: i=1; AKwUvBxk+c6d3BBkHgIingx1AUGsilqnrpVlByUGSb/cfklkuwwlZKa1NAMNYHSCebV5Hvz1oVXihVivMQibfWI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/yjh/ymNzF5+dypxEQpbdcYLFmJ4GjqJvifEJgcfZ1S5xP4uN
	2LZnGWY0nfgg/xD521xKaO6gHGPXMbWVy5NO9mNYS8ww/xrIQPUz1jhHmLDGr2MHIZxmUhS8AET
	Wa3Fg696akvDr7P+eDEBqHkH75xoW5nO22iystk53Co+xazWL+vBsqU72nUOq6XMTzsg=
X-Gm-Gg: AYBFou0xjmGi4jrwXOHtx4NPCytNrPgULeG2PDMbWTHFY6n1X7z0HYrW4C71Sa1SMdn
	/2CSHsLLPk/8ZyACDO8zVD5OanQKi7cFRnqdH0fAWZTnYCO3nFUBOB0T+ZIbAXo4WWU847+9NPP
	fqf3kNZfNqDn2f0f+IYCw7DunJQstExbgbjyn2e/RhCGqsqfmtooA9h2/hCWpdyiuljvcQHT/t2
	26gyO/Vgswxm4aeLN4mg1Z4CYjQUqA63hrTYmzZHrqpzJ+buPAe6lVHKhFqrZ3JYW1jlwEmIIYA
	8Uc6/tP4FU9gpOPZyySN64anv4Yq+y93dY3+0S/m7kXyV48vQlbQHQL4SFv0eck2qWSZbgaKVUO
	vH6ROn1A7ur5cOLrmcn7UQog=
X-Received: by 2002:a05:7022:282:20b0:137:ea7d:a5fc with SMTP id a92af1059eb24-144f9179536mr2813763c88.22.1790159200900;
        Wed, 23 Sep 2026 03:26:40 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:137:ea7d:a5fc with SMTP id a92af1059eb24-144f9179536mr2813727c88.22.1790159200327;
        Wed, 23 Sep 2026 03:26:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:44 +0530
Subject: [PATCH 04/15] drm/msm/a6xx: Factor out RPMh arc-vote helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-4-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=6066;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CHLjdgbBFmYAxDYgBcG23Bc5Mf99naNoUTb/q1yjs/w=;
 b=+Rp6S1IwhTCXU93ZAg8mgdTbPXp45wPbraxUZ/P1QOMC8I8WlimNA/tiubX2aEmtEVVidHQtk
 H++MFfIe+ZWBNB5U6dNCkDINdR2pBBg6Z0oonZgj5HTa+BTdrZZvthV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXxI1yWCgRWdI7
 hT3s5gZUWrqu21UZsveUTkWTLjVjWaaYZmN0npJpoKSkuYIsylSO6f0l0A3Cm7rJPWtPdpffjAS
 OIAwAOF8NafZAdZ/UdXsEgQSFYV2e84=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a961 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5x2u8yzsEs7RXICRzdUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: wjq-YuFdavW21UXi9OPiYOYNlg2Z73H4
X-Proofpoint-ORIG-GUID: wjq-YuFdavW21UXi9OPiYOYNlg2Z73H4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX5pj0aFzqtGG2
 pXZfp1n9hxpwT2/aI9lbcdYb8o3WaR89gCB/+SiUDbDz0ONb1jcJ0pQZHACBMnCrq26e4uxXXRu
 UAPBsHzy/7GdbjEuIERIfbMS/SQkQ3Oo20TD/cuKs786SGqbThm78wCfRstV98DLQtLZu6F5XGK
 hczA02l2AyFYP6SFfbfOEwHsg0hNH0KWObO7Z2foEKWZbq12tIj/qa+QJ+QQ9ViMAOTZuyIayRl
 fskfoosJsMtAHPt4VXyDcHTMWEq2ubqtjMB6YAUMIYthiF3gIt6wvC9YBgCB4zy67SK+khGa4Ej
 EXSUGx6a8xsUUGa4d1LSsm/3o2UX6MoblCop/LMeHv1E5cE/g3YxRHoOnyfr4e8G618azAa/PJn
 gK2Rb2YrNQMvNQycbJsJGQHPZL+2r0b3b20GSXBqeyjrP8ZH1InqRbB4uVJO72/31jYBehKXurG
 1N8tDUOcguV4ObgnomQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

The GMU RPMh vote construction repeats two patterns across
a6xx_gmu_rpmh_arc_votes_init() and a6xx_gmu_rpmh_dep_votes_init():
reading a cmd-db aux-data resource (with the same "halve the byte count
and reject empty" handling), and scanning an arc level array for the
first corner that satisfies a target level.

Refactor out a6xx_gmu_rpmh_read_arc() and a6xx_gmu_rpmh_arc_index() to
reduce code duplication and improve code readability.

Assisted-by: LLM
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 138 ++++++++++++++++------------------
 1 file changed, 63 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 161b360bf3eb..0ed01ce1c5c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1711,74 +1711,85 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 	return val;
 }
 
+static const u16 *a6xx_gmu_rpmh_read_arc(const char *id, size_t *count)
+{
+	const u16 *vals;
+
+	vals = cmd_db_read_aux_data(id, count);
+	if (IS_ERR(vals))
+		return vals;
+
+	*count >>= 1;
+	/* Exclude the trailing zero paddings if there are any */
+	while (*count && !vals[*count - 1])
+		(*count)--;
+
+	if (!*count)
+		return ERR_PTR(-EINVAL);
+
+	return vals;
+}
+
+/*
+ * Find the first index in an arc level array whose level is greater than or
+ * equal to the target. If no level is high enough, either clamp to the
+ * highest available level (@clamp) or fail, dumping the list.
+ */
+static int a6xx_gmu_rpmh_arc_index(struct device *dev, const u16 *arc,
+				   size_t arc_count, unsigned int level, bool clamp)
+{
+	int j;
+
+	for (j = 0; j < arc_count; j++) {
+		if (arc[j] >= level)
+			return j;
+	}
+
+	if (clamp)
+		return arc_count - 1;
+
+	DRM_DEV_ERROR(dev, "Level %u not found in the RPMh list\n", level);
+	DRM_DEV_ERROR(dev, "Available levels:\n");
+	for (j = 0; j < arc_count; j++)
+		DRM_DEV_ERROR(dev, "  %u\n", arc[j]);
+
+	return -EINVAL;
+}
+
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		unsigned long *freqs, int freqs_count,
 		const char *pri_id, const char *sec_id)
 {
-	int i, j;
+	int i;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(pri_id, &pri_count);
+	pri = a6xx_gmu_rpmh_read_arc(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
-	/*
-	 * The data comes back as an array of unsigned shorts so adjust the
-	 * count accordingly
-	 */
-	pri_count >>= 1;
-	if (!pri_count)
-		return -EINVAL;
 
-	sec = cmd_db_read_aux_data(sec_id, &sec_count);
+	sec = a6xx_gmu_rpmh_read_arc(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
-	sec_count >>= 1;
-	if (!sec_count)
-		return -EINVAL;
-
 	/* Construct a vote for each frequency */
 	for (i = 0; i < freqs_count; i++) {
-		u8 pindex = 0, sindex = 0;
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		int pindex, sindex;
 
-		/* Get the primary index that matches the arc level */
-		for (j = 0; j < pri_count; j++) {
-			if (pri[j] >= level) {
-				pindex = j;
-				break;
-			}
-		}
-
-		if (j == pri_count) {
-			DRM_DEV_ERROR(dev,
-				      "Level %u not found in the RPMh list\n",
-				      level);
-			DRM_DEV_ERROR(dev, "Available levels:\n");
-			for (j = 0; j < pri_count; j++)
-				DRM_DEV_ERROR(dev, "  %u\n", pri[j]);
-
-			return -EINVAL;
-		}
+		pindex = a6xx_gmu_rpmh_arc_index(dev, pri, pri_count, level, false);
+		if (pindex < 0)
+			return pindex;
 
 		/*
-		 * Look for a level in in the secondary list that matches. If
-		 * nothing fits, use the maximum non zero vote
-		 *
-		 * The secondary rail depends on the primary rail, so match it
-		 * against the quantized primary voltage (which is >= the
-		 * requested level), not the requested level itself.
+		 * Look for a matching level in the secondary list; if nothing
+		 * fits, clamp to the highest available vote. The secondary rail
+		 * depends on the primary rail, so match it against the selected
+		 * primary voltage (which is >= the requested level), not the
+		 * requested level itself.
 		 */
-
-		for (j = 0; j < sec_count; j++) {
-			if (sec[j] >= pri[pindex]) {
-				sindex = j;
-				break;
-			} else if (sec[j]) {
-				sindex = j;
-			}
-		}
+		sindex = a6xx_gmu_rpmh_arc_index(dev, sec, sec_count,
+						 pri[pindex], true);
 
 		/* Construct the vote */
 		votes[i] = ((pri[pindex] & 0xffff) << 16) |
@@ -1794,16 +1805,9 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	const u16 *mx;
 	size_t count;
 
-	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	mx = a6xx_gmu_rpmh_read_arc("mx.lvl", &count);
 	if (IS_ERR(mx))
 		return PTR_ERR(mx);
-	/*
-	 * The data comes back as an array of unsigned shorts so adjust the
-	 * count accordingly
-	 */
-	count >>= 1;
-	if (!count)
-		return -EINVAL;
 
 	/* Fix the vote for zero frequency */
 	votes[0] = 0xffffffff;
@@ -1811,26 +1815,10 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	/* Construct a vote for rest of the corners */
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
-		u8 j, index = 0;
+		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
 
-		/* Get the primary index that matches the arc level */
-		for (j = 0; j < count; j++) {
-			if (mx[j] >= level) {
-				index = j;
-				break;
-			}
-		}
-
-		if (j == count) {
-			DRM_DEV_ERROR(dev,
-				      "Mx Level %u not found in the RPMh list\n",
-				      level);
-			DRM_DEV_ERROR(dev, "Available levels:\n");
-			for (j = 0; j < count; j++)
-				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
-
-			return -EINVAL;
-		}
+		if (index < 0)
+			return index;
 
 		/* Construct the vote */
 		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);

-- 
2.55.0


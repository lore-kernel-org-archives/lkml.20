Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9F4963BA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363949; cv=none; b=hrWi/LDmMkmTVR25+5uzV6EIieTtRieJffoMA1OwLvBDn5ODV9ZNCvaEY5IYcPjGZmC2AaLs4wfcd/z06VOzuY+Yezo4THfA4Jpey5OuwtlPkVtdjjNiAeSMgVby8nRybJeg+cGulF7YE06R13tjfDSu9dQjmzTlPk3AmnXupCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363949; c=relaxed/simple;
	bh=9IHRMabF/UUZ/I8jhl+b1TFxH72KngRZLYox41kc84k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCFjVlf1dWTCKc1d5hJkRyv1wv6YjiDP0XyQMYKpjDz4D8oDHjK8e/caJ9Q2wtxoX1dX2g+hmXA0s2dQZwuxUpYUcdC8xq6YPUhpFAVzVwU932op4fJetmo2U6/OL/VXi56oj0tSh8LFRDIKlFXYub7EQifdTrBFaLDPQDaSHuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuKeueNb reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuKeueNb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgZP2969757
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+w5RJMRUBd2
	5lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=; b=cuKeueNbGlBMpJnc1sk1A1+lpBe
	OtZVThczFoPqClILI7fYv+TnPIhkq52o1LdiIGmiY/bQUbu43DUWDa94XmVgO+tG
	14tsDRmpb3ZRmO/kGpy38etHReYR6Rn2aRVIJfPZWCGoZ3zZbf4daHE+t1S6sJ5G
	PP3goja/BbfkfORvp+ZgtJS58Lq2hRa+n1b4nl9x4aTYKBRCJDPRr19sV6f+UOMh
	lEfNvfIrrmSjkO0qyJ9b2rYep4U4PHXoT6R7fpbqTXlfUJmqAYn+4ots7aPh/wyf
	iYGlZ5WzoOx58d/LyY/RIv6MKO0JfdBwLBt5FZZCuz/lnEkRItFqYyF4x4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679c1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so895432385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363789; x=1791968589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+w5RJMRUBd25lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=;
        b=TOK0aQ8J2/9DunF4updy4ROk7Ww19KxGs1s8O4DdYPNKzBoOfgjLCcyzOZRuHsV80p
         gb7OKq8DqN/2G0QE9f4G+ourYkdD1mZEiJtOM8Lc3fyAG5R9+hX69/8XZ3YO5hLO7JXz
         US9BqQQVld+7BX4sFDkonn4/2hqRgMSjfk6A6rVHPT8ijr/m+hFcyCDBhhQ2viEAAYKW
         ds18n0arP/apsiAc8XVUClhkacSsEEL4EKNT+4BSarzpltLWvjbiMG7yBlgeryF+kyQy
         kpPbdueed5GFiJHKSKjQqwKhfLHDiLdn2eybN1jjkn+l7E9r5TdoLdGv4zVWMtzgrOMn
         o/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKMFxm7ayrW5rQlmCYewd2UDmQK6JqgTCQt3yvx3EnfkuYMCSuQn72ENMxgcLVIduiVr60soHvLqKKFUk=@vger.kernel.org
X-Gm-Message-State: AFuF++nM2Ba5Xx6LR1KHQfD5Nz26o9uEEbuZRXIRUFfLgWuzhvfZWuZB
	SNIUJ2ZD5RBiagQ/RpPs/z/5IPBkCGPAHmvqPR7o6dlNvMcHhMORJim9BxhL4BXyBM4h4gMiuc2
	dN3HVPHTXpZ1aWkFOZvDiNi/tVD4Pkf0LmreiLrNSO8ZMGXNtaFv+IwAK+T0b3vMzu28=
X-Gm-Gg: AYBFou0g853n1ZPdS9ZZNRkpJwjhE653/GT5bjBUtBrGVzBHr0K48iNWQlb3EcptDWo
	Ruire9Cj1EysA+gTEeSHP/s5wmcuIFYV+2LP7kIAq/npvlJwSJr4LVXKTI/yX2r6L51mv27neox
	N6UmkSX1oBWC8Gjc4SDBYy8X02f5Sa5ZQmshBKFHqgebjsb/Rjn8apWyjUTOyy5Z9o4DM/5c8pl
	i8PuoE892jMqMYqc29vGQ7k5unGRRsAgYcjnIne3sS7TU8klbfuBhN+MhjYn16+z1DCzwoC1lfk
	axKKw81tfmeLyFW2CXDhpcOc5GY5o2WCQzzl9NjZDcnNglsf6nUrv/kFS5M=
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr280296485a.31.1791363789243;
        Wed, 07 Oct 2026 02:03:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr280288585a.31.1791363788617;
        Wed, 07 Oct 2026 02:03:08 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:07 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 42/45] media: qcom: camss: use one lane for TPG internal path
Date: Wed,  7 Oct 2026 12:00:38 +0300
Message-Id: <20261007090041.3732717-43-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4aemxRs1tDjx
 7sSSnJiSoAvhCZLiaG/ah6X1LQSQx7TPNgeAGfkGzTa1NJBdudt1C90IPBiKtfmjma3Pv74llnG
 waEvoeswUWBw2Ht8WTTwupRjnW67Tes=
X-Proofpoint-ORIG-GUID: Tlsxk5VvEjmy6Xqn6PTODiCe7wj8v7Zr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5pyqa6waw328
 RX8sMZHmZiYPcuba+fTJlbRj5NZvB9Owtpzfi4kQY8kSXeSW9hD3BoMQ1Z+ulF1kigVGtTxd2yH
 p+3VB98+W1q3lKrttESk0QYwSmV1+qUrQfcyQbKWZF4b9JJqaJ2VH0WmV8P/HzWL/jCP875XGA7
 PoYRpNLHWUWD27L44aJgsPNUAO9sCzc6H/UIxkM0CobUdqsY148tnKPu7p5jkFhyeJ+oO78SWFE
 svO0/q6t3bZrbs+VuegPwuRVqMNYZ/DPPGK8aoMWDkFfQHvGOOOcswA3n793Pw8EmBGX59qzjSk
 g1pMkB6I67kNf4qDsswETpgLDJirw5FPaeYOoid0dPS40Fy9UuBNVh/9Rpj0bOhofPtG3x4efFh
 tSWEPUoojCzD3OraeSQYKaEM93toXUbcrZkLxw8gx1pQTG+eQTT6y7RpFsWAObetaoRDBw128J0
 LsupKgJh9pNEJCG/tpg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60ace cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=knLUxTcafSqJ48ELel4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Tlsxk5VvEjmy6Xqn6PTODiCe7wj8v7Zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The internal TPG path sends the CSI-2 packet header on lane
zero. Configure both the TPG and CSID for one lane to avoid packet
header ECC errors.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c     | 7 +++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-tpg.h      | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index da13963ef1a0..6bb0af77fd49 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1276,11 +1276,12 @@ static int csid_link_setup(struct media_entity *entity,
 		if (sd->grp_id == TPG_GRP_ID) {
 			tpg = v4l2_get_subdevdata(sd);
 
-			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.lane_cnt = 1;
 			csid->phy.csiphy_id = tpg->id;
 			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
 			csid->tpg_linked = true;
-		} else {
+			tpg->lane_cnt_override = 1;
+		} else if (sd->grp_id == CSIPHY_GRP_ID) {
 			csiphy = v4l2_get_subdevdata(sd);
 
 			/* If a sensor is not linked to CSIPHY */
@@ -1294,6 +1295,8 @@ static int csid_link_setup(struct media_entity *entity,
 			csid->phy.lane_cnt = lane_cfg->num_data;
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
+		} else {
+			return -EPERM;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..423f45378a48 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -105,7 +105,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	const struct tpg_format_info *format;
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
-	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 lane_cnt = tpg->lane_cnt_override ? tpg->lane_cnt_override : tpg->res->lane_cnt;
 	u8 vc, dt, last_vc = 0;
 	u32 val;
 
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..fb22747f5eed 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -94,6 +94,7 @@ struct tpg_device {
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u8 lane_cnt_override;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1


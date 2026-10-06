Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0743B38A2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328708; cv=none; b=gxwZUkRCyY0rucFezN3vZqynoVnm86K5YCv3c/4scgpBvC/VKZNVM2sX8dNpmjBeV7ES0zJXhpabnh++5aYOv4clJp8AeyFakkJiL2ZbrhGtN9du2QN8z9jfPjUZH+uUP1Qwij3IUkQouSq7beei+KDIa8Taxy3ymr3/+bwhosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328708; c=relaxed/simple;
	bh=9IHRMabF/UUZ/I8jhl+b1TFxH72KngRZLYox41kc84k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YjGsFM05U2+j14wLXilwj8eDOOrIkt9qVlJdiakVDSXmRR8CFFASVd3mRmmmvSpEzxcUCdUvHGub1r8pAAWqIZlks7gVVwTkh1H+Iz8xkfd3mPwIsrdAh3iqUbCk4kVoiZp42CDUlGy3eMG809g8g0Gs8TCMv14WmAhB6HvdY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9Ditxlg reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9Ditxlg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeYRd1676188
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+w5RJMRUBd2
	5lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=; b=e9Ditxlg+tGP5efF/CAv90lWdap
	WgG5NpPtP+KckNjY0HhrefxkWRsJOzd1xD8+ataYUT20F/Xv10f1PxqyOAzygpAj
	YbCEr8/n2/ZKBBXGu0hmHlzB1QLIMfBZrtlLz8UjGsDA9aKZHVbbs+6kx0PvqbEL
	XWGdpWYMkvbSSLS67qJKeYGHdSZrsYHaOfEpr6sWKC0ve1VPK0mQvUFywWI6Wieo
	V918e3HMakQdY02cKOMjSHo+lFq8JtQn/378vPvIBeg2rIKUFHouUea5PQiRN0oI
	Q+Eai4CYpFLA6svhqCkHVFoJCdarmfVDUb0ztlGqNrnSx1QZVNZAShaEUcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub13c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so725260685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326512; x=1791931312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+w5RJMRUBd25lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=;
        b=01tILIhGin/ZkBfI8T3er+oiCsIjpeGXsclrVuGfGFUXtjpUSEhSNznm9ss/Mv/z70
         3bl1Y4ZO+EESGL6HqQozSlXoDJgBRRuhO+1WnwKm2KjhU4jdX7x5tXXNoiKWsEBBBoPo
         UC9ddjukFUC5E4VIcb+xFkE5oSoWnV06YupeWHaH5RFJx9U+qSpmJcLuaCfGXNMXfkNA
         RY06vvWhrNRIllI79GFPjs0pxDiC2iOHL5Ab95zynp7xKQX27e+yZ9cjUTmHCYxXLKnp
         G6Bzmx8dRZ9t+kkzeYgxdndCKd/9CpBv6pdcNDhnEbBaXTdMpjNn3uAXElabLgSbZz22
         a+RA==
X-Forwarded-Encrypted: i=1; AKwUvBwR6iWEIgACYu58BGkOmYBD3oi5A3bisA8dJ7Tmr3gUmwi9L7oCt2IMubSgWpLCq5FUfdtFKYpOzteJCKg=@vger.kernel.org
X-Gm-Message-State: AFuF++m5z0Yz2AmDpgraT0aMOm8dn2JIALNa0k0SdjXWMQFhQEBWx/5t
	aCvkZ0q6GNS0BTtt4HWCL3pJzVLUp8hxhOCgZ0KddGPfF+lEp6zRcFj50ldo6lzLXRF1HQLI9V7
	GHwMMY6aC2gJ5uWX4ePxEgLpLV1WjFj+zFEdFJ2O/fjq8WBDJ8I4D71kxl27M9cku5eQ=
X-Gm-Gg: AYBFou12RDDt+gjAsTxKsU2Mdfj+HjWJb4FoA8uoNZfHmZRL/yMa7e4gSzscj9/3iph
	EgyLuvIbhj9OOeXDljzk+VYzFZy+Sx7KArt5DOZ09mr7Ps91KIxIoX3qATh6CbdoJkQswUL8E1U
	cv2uy76UDBUlNNtwSNPQONBg0HFG8unFqvU4y17emn17cANmhVN0DDoMpYhJqoDFhxZVA1rHa9A
	43oNYBoBp7D8LWEcZmQBf3O7SfY6qLSoAtSoWmSBN9nULPTB19Yj7F4HI72/EjZZoHJ/IKeaUUS
	pLLR/fovApwWwh66dvRK5z3BqxlwWfHYrH4V/xmoxGLOuRgElntCffM9HvQ=
X-Received: by 2002:a05:620a:2b45:b0:93e:92f1:4222 with SMTP id af79cd13be357-93e9b0eda3bmr81145385a.4.1791326511577;
        Tue, 06 Oct 2026 15:41:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:93e:92f1:4222 with SMTP id af79cd13be357-93e9b0eda3bmr81141185a.4.1791326511104;
        Tue, 06 Oct 2026 15:41:51 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:49 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 42/45] media: qcom: camss: use one lane for TPG internal path
Date: Wed,  7 Oct 2026 01:39:50 +0300
Message-Id: <20261006223953.3382273-43-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX63mTVhIY5raB
 /R+Jykgp2dMDZBmcuCaPRpEXiA6Z4lR4ddSL4Dal6fsjqU6pYXeH2Xj5RvvLoYMFpAL0xFrJW8U
 EQdSAnCsJpEMkR5NPSwv72IRbD/8tXA=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac57930 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=knLUxTcafSqJ48ELel4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: l39mHX7cEqTADhsA8racBF-lO7ZV1X-7
X-Proofpoint-ORIG-GUID: l39mHX7cEqTADhsA8racBF-lO7ZV1X-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwlYtq9c4SBR/
 H4Cya22X6QEi3YRpsgxJEGKK8OJoFePSmOE+CPq68lkYX3LdXrO5amXvL4LybqldYSQfR3hf5lw
 RRYyykXLS2/5Z+2egjQ5En2pILviOzuSK3Nsz8IHl08RnRhsxZ9bmBUpjr07G+EsTGIFpXdukLH
 GnzA++bDM/kbqpSIyOTIXNhq/vPfuxNvJGybwB3AbCPGeqBCJUcJjbgrqhjSAyLYRZ++CxFSkwX
 DroN14pWlBARtvddkumBxMVOkxzE7OsZj8jf996mVawoeE4w9f4OepPEx5xrYIjCvSmWtmwNBMm
 XVlFkZ7LM66TzUCQaRMTB9WisAibD9mgJK2rl1fFkqo8i6MuTDknoB0XPN0MK6rR32dzZZNdNvB
 sGww6OG7XKf/DtMxlWfJuaC5I5zKjX1Smkj0iEK4k/CRaTVIVyvFAVZsZcUID0zf8BzFn+R37KB
 Ms+3tRDFmzl7sQlivgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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


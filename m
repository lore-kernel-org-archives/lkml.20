Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898252;
	b=O4UgAJIqjOcRSbABhWIT0AgM5hd09+mFps3qPvEw6m+wlox668xG0Ynta36vK7/D0Q/n
	 fjRI/cdkhiEhqkbonwmnYMWBRiH2usLY6fqD/SUnGCGQzI70CsoEijlFi1dNa9rRV5Gn9
	 I/bnWRziCmCxEylUEbJ6QwyFRp8Kqcf/qpcwtE3cmlPbzymyBS6bfVb6Xs6qIjQRPJX8M
	 sYuCWJ7cduV4Diw/EnUBJ12VNiNFM05JwBoK8LSpedZ/IAUvefGgo1yCfxBDKvNQNx1UR
	 GtgvTfsX5gh2mEQqMLTWPYSZz4UjjDPbtYZTi/MRF8f4JAU6dMzrMy6oHAWWmMjPL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=mMlvbZY+YyoogDzT2FeovWKXlTD30IuW0pcd5zZO6FxsnO2K67WprL06FekuGfJ/6ZAK
	 eFGLT2Yj7g8zl+uHY5gAnD0XMrWj9vSeAj/dW1kmgCJgmU3b/wNuMCfX8CUVTvW1IiHIf
	 oqTNMeTZfvLBHgy5f81lxAP/KDB0bcDJb5kOIAYN4Av28STiMLvHEISpiv/ZI3bZtVnbI
	 3RNqqOVsk3Mslr2GdiGKiiu+/MxLkqVCcf6UDvlIZlx/4pvNjQ9i+7gnyyewuok2nQC/L
	 pdbHLOKd5yA5zfdrWjTVOyg06hyojhONg+fMzLN5x8/VZ4FGfkDGqBoV6IocBeZzhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E75606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E75606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16EBH3074810
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=P1UHC1VebmLt6ZTL
	1Jqz/2iE2BIvp+dVY4Dt9zA5H03AqrVGPgJhnovYdsyEp2xOgN4+ob6DW5vX737J
	4M4S+ZVHq0E5sWtaEEo9lqI8waUYpI2CVjboEuQMDbQaR6tvttMOA1epXoWBNzpf
	W0OTtE6ZCrF9YGAaBY66fdE5slB3+/PaNj3+ha+byHZkBjGxeqb7WPyeJeQacYvQ
	dbLjcZ8V0j6dSrbjXNoUJqXGo62S+QUPngMperhZCq9gLQ0YO94yQJ91T86Kq1ik
	/qf/uHMlLtu3LBV5abzsIJ/kCWLz3dBQQiQlBQvCAx6Dv6fuSOHPvXeqcBm/A5vQ
	kBR9sg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruja3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso6453867eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898250; x=1793503050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=dJOn0uUWLBn/+lRrbYlX+lSc2BjbQS8J0ysvoSiC0/4oEcNf1oN5cYegIHB43TEHoB
         urzoNsDAE9G1+VbvhNUiKd7ZKyxInzXT1zE2hjEcrntpXFDVREPG9HoWghLlZM0RLOtl
         wKLXdxLXZx0sB0NS/opuKh2c3pmMFwJ2c908j/O9IRXA4u0pCeRfru+IjU0Qu53Z2GCE
         6qMcY0bUbhd2WNP+T60pqRmk3sZKuz1XjijlMbtS6Tt/ozoEsStZxx1jqrN+d+Rj/k4D
         g/4TcsVAN+joHuKT7HR+bY0MpIAgwYQJL7qlxdiRpVNc1Uuk0xMAmyWVfsA2uu/PYanb
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898250; x=1793503050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=f/aqG76NQ5Qw1am/e1bVS/qiC1b18WyBXZvX0nevQjWPEK4MdA7DhZ+WTxOMNZiQG9
         6FRmZRE5J/opTJdBAK2/s0kzKWk6FtASQgMXrYr2D2CdMNjO9TZsOtifi+kPm2Dj1LC5
         /CekS+BF0RNu1ARi/aUqNoJo966FEkLzmK+wXeSVbb29kCaFzzbc4APplP9Fbn+EoyzN
         kim3TVH+fpaqMQIt73pqVWfb9XapQaxx+Wukwqy8hKMT7twxAv3ptDNy4Db2nvmp2n8X
         q1y5w3taIhAHule1b+3Rz5VYxkAlbF1JhCyCpjPTeRJ9fAwTORr5DEPS4KWUiTfEp4VN
         mNzw==
X-Forwarded-Encrypted: i=1; AKwUvBwqXz4K6O+LnJDLg3PbavBGRY3f4eGR+YAxYoBw8iy54eOWvuedMh/hZxHu8Af49WgQwqnGaQ93Fqwuqu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5WhuixvGYGi4BVkdUxa2rMZJhuY+gxUg2Rf7ZJE1+4R8vlYcD
	txuH0pLqT0gGjXRjJVDYWPqi8/yTaMiliDvQonhKnt86b3z5dGHRY+lQFyWmXfH85fmxQOZJGkf
	SXFdl63gl/cy6oLEQmCmZQJwKnBVnqLMmTA1NizarprJTj8o+4A5az5Uf+ImQPmc91Pk=
X-Gm-Gg: AYBFou1SUCfs9KHYhvxw36NopnLijkiwp22ZTxDxWK3dcbEwgmzQiRt3n1jGpHLz2zc
	diiSYyZyo2fCf+T28UKTU9S4hloIg3DPHPvW/JyphMGxEsIsWLjPoGaa7UPwBBbyCc047wbiFpT
	aPlPAFysxXkGRd3CaeVGzXCoTvikr8VKCWmFcpeD1rcJckpzHp2a534EyNGwDorbB5j3BcIAqzC
	Fi5rDS0eKxhjLVYr1kTfmRaMnt6Idyrgq2abCkNVzOeIJsSG04DDYns1OAdFZjB0FrZmkxRnSj7
	t1awdDDzLm/s9+DXu5Uq5W5o8V6zlVDQXdeqbRm79/5NPFk510pMWoMj9unGRV38uo7O2JZ/pqi
	NAXX2P7N93y/Bm7ftJhhVr0Y8YdgkGpWss5vpXS+p48JWzPEGrkih36WTltpWf5Mi7yQGrpdbir
	YkxypeDaUHGA==
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254307eec.31.1792898249648;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254281eec.31.1792898249063;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:23 -0700
Subject: [PATCH v22 04/14] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
Message-Id: <20261024-kaanapali-camss-v22-4-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX8JMwO+GyiIS4
 eGpCUYTwGexoLy7HnriDc6Z40Jn+fvit3yJHG93jY1eLEKp2Dzk9PwcPWUlBLEWcfB1idjh6XtW
 n97BJxZ17KEs18uhU/ZC6gD/gCE+KD/e/7i9B+xsz3PMJUC9vmOsoh4qMBa27FxqOxaxr/nKBBI
 nIWKWKTI16IWKk/L5EyoMTi3yui+6Q/GI+MJwYw8gRxlxyH3JRwNkrh4RN4V7t4BPVH0UR0m128
 YgxHbmc1PmIzpYCaDm+IRH2VhfvWkiivGAffpsCU2FqBnAsnhvNMFVLVoLCyrRfZCfnILBL4Vr0
 XdA4qfxwmH/RL047oMQHULMMUqRJYz7YgCcON7yEo4tNhW5w2+znBeE/1aU5f6UnwHN07LPUdxc
 FzGavuX8O6r87v2O8gD72kCpWoI72JSJzXeURXHu6E9Bb/IVJrbgsCmtBCgg6UArHcqiAz+tBYa
 Mzg/UvW78+gVkV1VZXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX/OZlZTlCahd9
 YJqZNVNg8CBND28nZH8PqUXVKrjRpW9BAdGaZS+TnauRhlIryfU72bnWQZg42ausG4rsYawNS15
 ivK08k9AvTz4A2OfbREiFQ33N1bAz4w=
X-Proofpoint-ORIG-GUID: X8AxKQ-Jsch0b0_-NIcU7FNuDE9lfyDY
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add74ca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: X8AxKQ-Jsch0b0_-NIcU7FNuDE9lfyDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1


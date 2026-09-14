Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC54825A3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390865; cv=none; b=ApXHmnN9zJIHbyd8b2B1tqBkwrNZh55V1Tff+le0A0TLFPrMkmnOXdRvexLRhry9sVTrRXrqNSGZIzpMCAnqvSo2eKbbXE+sM7SdakMyGbRAqSp5r1R/z3Mx3ksuJk5kA51yHCNtxl5xlLUl8rXRas7e2AA4NGp2PbKdkNtH4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390865; c=relaxed/simple;
	bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6yos8H3/a6X4Nnt2BbGTecJSN24vcq6wsGgG4ctLvbx+T3BZF6Di1+2TRDFfGHRRRWk+0/hKdt79rKK2ZHPGxMhLMwUZ5Xl7KwCNjOlGfZ4R+XQXxb5tq1Q8Vmjg5vudbbPqDBuxKh040fLtYu87ZeRjn8y8FJIsYp6WdGsTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYtwgCd0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZs2+Hyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYtwgCd0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZs2+Hyx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Z2l1025912
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=; b=JYtwgCd0ranMmEqJ
	Lo0I4s6s/dosEFGfTMw4CjXw5PvASqWyW+21OqWp6l46Gha2kdLgzVgYPncJuvC2
	K7BPZg8Jg99SFgRG2rutHlnJtRHw0jzBllXEHqzZCpB6KXXpNoLUjwMn/T2NPIbl
	QHdJZoY9vlLlU2jK1hFbAbw7tj6eNCZoubIh3k1JPqMK9zz5CdfznicWPmh2gOOk
	ntzkUqD62+v/Xyou2BY96GbW+lFS+bjahNQA/3Zg90Etg1eSFFjzUQ0Y2bcTmbnj
	5uTUhx1Kp9+i3pWUfl649V5hFh8Lnt4aucmXn2UKVR0oNOTEalG7JJgzag0E3Jx0
	Yt37qw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5s0h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd1631d291so36501605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390861; x=1789995661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=IZs2+HyxSAjZepcRibqIxiwjj6vdiDP85xucX14QRqqPWrjHT9Y0/aum1wBF6PR1Ni
         3a6ZEkJ3gqfGJ0afhnsD+RhN1TPQU/FjWux9PAEU8KE+I3DOby/7yVwmDuA58xrNP3ju
         U2xNvn+xZPTcQaJZbEf7jDICh6XllMLB4/I3XHTGFPLuPJpGmhbDqKjt7xiglSX222zM
         wz8SE3AUPKpPf4X1lKK4o8tu/cislZST/NjgYQRsLeNYnTwtDjIA/aqvlOjv+DXd//IM
         WbHNZtJ7Z4335PxKNEDlpT65r5oXNNgfNbiRGttbjev0KJjzVNdVDaMHpN2zNiYOWqMM
         I7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390861; x=1789995661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=af1umBL65Epoh0trLKBieWzAo2Wm3pEpyioaIswRCFTQcjDXz/TtFpZOyJFeyHer00
         SwPawAfsXkqKxPyQcpYHSuR40PNPwyE+KXWRGpyHqqp6G61KfbFEcsOO8AserU1KIGJa
         NMuP5xKl55Fr0+AEpJGX77LB2GIQ1j8epWNF8TJD7nSfqCRxNXnJpCMB7DDzwQHontUT
         pTxXkF7WQZhEcMZvHINiLGJVVYDTjv4wwPhELuF2z+/2Mn6Pcbm1J3jILnNeo9V/SFMN
         xYzvY+W/r7B9srY6H94hPFcwizjIAej8lSIAp+fWMzVKCOiWtCLYklMjTlO0qrFG/s8Y
         l3UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNVIfs5+VMyCXqMlfK4Vk6Kw5Ev47hdbfLGA1SltrivlXWo+HLqFPxKegwMqZP70QzC8aphZDd2b275Z4=@vger.kernel.org
X-Gm-Message-State: AFuF++kbwc4l17hSDmouEGMt1WP5+E0JUlT1OieqftRW8ml+11NcE127
	u/D1vrGpKoxz+MOyzHgNOz6ed370VO/efJCSVrZ7CD00tk1eyYPGaOsE+CEbZGR2bKbwVbmtDoT
	rXJB/ucmWo/6efcNWmu1wRiihEKiaQ58evBC4iuz63OVHVxcUtC5leZo9EeCj7deR+Jk=
X-Gm-Gg: AYBFou1N0Sn9K5zw1Fiw9F3WUPYifNNerUE+QtU4QNe3DaPYNg/UmdCmnClE9QDMKJi
	as9hRSsOkAWUKKUHPfY4mCPUfK273Lm4T1w+4h/6E3aeJMgH+xQcOnB0qOy3ClXU9wOD6QTYxcq
	3Hg7vERkfVSyFlXQUhtYqL/lfZYC1hAnWTiNyrVjHp1J6fuMMKg2jPXTMh6aNswTSjE738XzdSA
	4cZdVsMpQzAEWjahJXoS5DiuPtjaD7Vixx9UaTHLl5DjzGsF4w98x2mzXglVVJUgLeILTd+BvDM
	U2abSR45egSWPkMaO7ohWjxdjkR6NsY7ITQGuASc88MZ797YLUPTWekh4f1YpERh0jX4nS/WFqP
	HgLaRiR/QAtvM2iKI5KbpD4mUerPjTO2/P1AuLUWg6ROTJ7WPxyGBVVGbKwO9R+ISMNLd/0FD1I
	c=
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56496205ad.1.1789390861002;
        Mon, 14 Sep 2026 06:01:01 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56494955ad.1.1789390860432;
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:27 +0800
Subject: [PATCH 4/5] media: iris: fix VPU4x encoder line buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-4-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=2172;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
 b=hmO4WEwtyVRXwiuH9tfu7VUYrnOO2oOEADHxnP0ceI4IvbWB7Ncasq8AsbFNVePmiDrjwKvmv
 Khg8JxB5vZfAGFjpHbKDm51zTt3Bb/6Gj2PizdEFeyhTRx8t/uRfcps
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX7OO9ybVnI2co
 K9G405S9UARlDNAEmqF6XHRDB/S91xElmy6kW8LQKXqrbjqzegWwEJnDhE7QihdGMI7+qDr66gs
 j38IMZgsUQIq/IkFjUTrORY4qxrrVHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX2qqlMAw2G6Oj
 9k25ASV4o/oFXvlDO6RUo9+8ywzCsh6qnDA/QHnnHBOxMArfDIbxyYjEzQrkL7xCI7vB5a0maE0
 djfxqNMESz6991HCVRnkXpACG5DauOho+STFxoskk8bPpeREk60TKaDgytJSItmN5Vs2842+6Pn
 5LiyMqFYM4qsvRLkiPIAfTl410siG1m/1x6pNHFAwXTJsZzwk4QZekWKD5VXFOpvkuhZ46OurTH
 8v2PZWazUHVvXWYc4GnUhU8+4z2BolCP5CSd00DtCeERexmZ6yrwOO50AmhbxsESdgMvy7tVFaM
 4qkBej+qJw2aklS6PBD3SlfBfZslTT6vBneDq8B8IRIn5vPRQEbildGedJdrPFbqpejPwjvX6RZ
 Des4Ej0qB5lhtru/yV9vLYwTXx5o5dZv6UiCCBAOQQR8BtNs6jBeOypUO+EMMTDcGLE4b/0jbEt
 MRsZlVn1nsZV5sMiJDg==
X-Proofpoint-GUID: ziRBDC7B47i_hB1c1heIBd48dZ9NjieE
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7f00e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZutslQBMatpZbJmTFbAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ziRBDC7B47i_hB1c1heIBd48dZ9NjieE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
called with width and height swapped, miscalculating VPSS line buffer
size for non-square resolutions.

iris_vpu4x_enc_line_size was reading resolutions directly from
inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
account for the 90/270-degree rotation case.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 55996fd0d14c385ee63d2577b3e6d71b51d9e541..c4922a25b4501a851e31fcc85bc13735803be366 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2059,8 +2059,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
 	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
 					      frame_height_coded);
 	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
-	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
-							frame_height_coded);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+							frame_width_coded);
 
 	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
 		dse_lb_size + size_vpss_lb_enc;
@@ -2070,9 +2070,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 
 	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
 					 lcu_size, inst->codec);

-- 
2.43.0


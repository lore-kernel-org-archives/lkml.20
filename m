Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F2D3909B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047499; cv=none; b=TRKYlnowFfxPFbWIsyfuiAgXJiwEdajeNeS4Os8jwoCxGnxFOmRLcyXmyYnw68VRENZ3dse+d9SmrtzWdhVNl+wTdOXVZCw1t+A4a62k8iqa/ia9J3JNzI2mwoeDux2HovjxPFfD45wGRenLwHRpW1BKdfoqimhcqSFKV2/bci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047499; c=relaxed/simple;
	bh=KGqJvyschyivMcCpwVaFi8h8Gh2XUT/8AidhRo6fonE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DNhT8OHbiu760j7tHcfMjdtkKOvhjDeVCq3mmngYh0TE0snjzzaDGdM8sZauVj1fZe5r1bPxpqd1CexmyILohEb66waAFhzeEciPC+qRFTBH9YzF8h1w+QpPTig5Icyl8BNbXPyP+rGbsBbW/gwk2vv84YZ13NqsXrj8HWtouYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejwvETQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cwk0Cvvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejwvETQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cwk0Cvvv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0eP4i3044036
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QdSFLnOc1c4KMeMBQmdCIS
	7pmnYBgQXqRrl5gflD2tc=; b=ejwvETQEcG6lD6lqkE9MnqqiNpyWc3E1moI/hc
	aYuGPuIHoDwITF/yZegYgDZemxkG72TeWQVD/R3w5rOVQn94pWclNlI8RPpomenL
	cVsRKD1K0+K1yh16du3bfGfkopmxSmO1r/pHv7go7IA7iKFfF6de+wL+t9iLpdde
	n8alevDYu92J8rGlnW2YktEb1JltiRB9J05eBPpOWEwfgl5Q/m4Uy+FZ/VqFhFcA
	evzWrLWMeDPysB2Wuyv1M1yZvEcej7BlhlFdaw/IzBfKYUuUrrG8GyvXFT0y8ZKn
	6HDX7TCtnCIV8rJZncJI4iL+fmrV3Mu1gsaXXenE464hGUMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarh2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:24:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2986777a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047494; x=1790652294; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QdSFLnOc1c4KMeMBQmdCIS7pmnYBgQXqRrl5gflD2tc=;
        b=Cwk0CvvvOgz6bWXtn24ap5viMEqH6ZLHFfFAlymUzk8kXPl2pM66ZTGarSDD+2PDUY
         KuUFNV9hr2ShUV3/3LbliSyQeRLgEs1PB7QsB4ZHlk8AQ+WE2T/NfbeyrZC+4kq9Fvvv
         ukvAMVzy3t15H/9G7TcYJBwYxnUwM9UUrvjCQO8CeAkTWqADdcaA1FAPpxDe3Z/xAWt2
         gpoO7c+eY1svBPWaX0vfBeaqreUMFO/xsboP2XSdpju8ylvGoocdRC9tK0A8sR7+Qtf+
         FWB6YGhvD1ZaTgbLzP8Dw7f8M/YOViIcwcWRoZAJH16B1Rlhfykbb8R+9o+5cfJRloDj
         zVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047494; x=1790652294;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QdSFLnOc1c4KMeMBQmdCIS7pmnYBgQXqRrl5gflD2tc=;
        b=le9qmA8lqSVUEHdRl5Xs+kbqCP3QKM2tVrBAG+uHQ4x3koXt/DnKHkKHW4aYk32ZFT
         Ev99khpeCoxBkgm9URHcMX56jKozpD4gM9xL0BxhZIaLNA5sDWVk1Heyk68fUF+KZChp
         1PWfEenSOfdakhqq0jaZ2PXDmmZsmyYcTh6cBh5qyhLCSyAldhp8MRAMoF1xN9qJ0PH9
         WytSvZWnhXnNCL5Ao7UWwhMYM6lihGDKBTzf4oONMjRI1poJ7bSoRL5Kl5HhzBffYMgm
         WA/oNUHktRPfIazttFnFfKDGob9DHqggFFS6bJazxZT/RsjAktXU7jbUma8ZzFzleyiC
         i6xw==
X-Forwarded-Encrypted: i=1; AKwUvBwhB5TB2LJWMIdWYCdvwCbpUj8OP69dmxYaVUVwwYnCSJ0B81q/bWJt+bHIYiWbIOuo6pkoa1gqhO5xnkM=@vger.kernel.org
X-Gm-Message-State: AFuF++laAMvmgOovuRhS1kA+IEhX+gdMR3GpnvZYLw7DA1MA4tgxw+11
	PiE/KVBmr3FbbC7Wc9ZsPug+gIFBaSCwmAMQt872sNOgL3Gd8c+embQ+fuTozFn7GtKkNtoO6LM
	KYlqt0HwZ0r6U6ZGtQHiFVPgFKtVsU7AEcAaE+HjSNKEQrSsqfFkUSlwlYn/NZ/i3pds=
X-Gm-Gg: AYBFou2l+fmCM9eCtuAFzWv7RB6U73O/+qp05Bz6YAvu4Z5z+PGN3e1CCFKiFjbMdqN
	+j/dZDasIRuKbhsQS6ZEInkwaAdXTcSd7rcQ/+KFFw1h7+AMauqtoHx8aSpn13SfI9I+yhHfQsN
	JK3u/gef2lphfU/ExNrjc9IVN9LFQIP/57urKGg/IpqdUNR1N1jcQeeXAniDf05GuMEUSQl1rSV
	+BgbdUsORBUWR0ydh6Z2/AfgISKATptzEo6xzkalnqyDLzOn0Za5uAa+KKcvXzjq+nGwCir60az
	xniiks+NCuKiYoCns4ywqYgYjM7nzhzDcgCCRjbxOH4MtAQnujsxk5XY8SUfriCghwTfl8SsNtp
	P/RdMVwFptoaSWqEfFa4cAAxs8qS8Qmgx7jycOJPZSX+MP0vqb6SkVSi9d4R3cqd6E2YuRrRPfO
	w=
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-39e6c69f55fmr12762645a91.65.1790047494468;
        Mon, 21 Sep 2026 20:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-39e6c69f55fmr12762617a91.65.1790047493966;
        Mon, 21 Sep 2026 20:24:53 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm2082452a91.12.2026.09.21.20.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:24:53 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:24:48 +0800
Subject: [PATCH] media: iris: fix VPSS line buffer width and height order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP/0sWoC/yWMWw6DIBQFt2Lud0kQkIJbaYyR66Xlw0dBjIlx7
 yX178wkZ05IFAMlaKsTIu0hhWUuUD8qwM8wv4mFsTAILjS3QrB9zeroXfaeYu/DwQxHp2zjjVc
 aym2NVPQ/+epujvTNpbzdEtyQiOEyTWFrqwbVqGptNVdOygalcQ6f1mHtkUuuhDVlaQ/ddf0A+
 Q/DPq4AAAA=
X-Change-ID: 20260922-vpu4x_buffer_fix-80cb495f8f46
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790047490; l=1599;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KGqJvyschyivMcCpwVaFi8h8Gh2XUT/8AidhRo6fonE=;
 b=llB+r3EnyxT4K1K/9bCp1rfwU+khDYnyQ3VdsAamtfybduCk0pleuOFPvlab6C80BsPQwRcd8
 +Scfv0ABMxAA/qUWxKGeQ9LOhE9jpsskbnTaAK7qXkLH9uLlWlN/+J2
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX2lX2yexehx7X
 Ev1KpohRevQdwiJsM+6QuiY5iieiHdAPYBjVY4jpK13GdXLuqQW5Q0kXPwhw8/66RsUr7JnnetD
 99c0CCVp4wwrubeTabXqHkjEqNcdD8awTeKaIXQxyYzaFi/5ARSjmDA6Pd9nj5MN3oul5GqOrQT
 AhnYnMZ5I9sc+fWDbmmLqC8KexDZOCJNsKPiNAkWeM7YFcpwRlwnvnfU4AWaSKEZTJaobY1IyMw
 elH8iM/iO4jrMSocmwEDEnoO4jOPvBTeVWnJxO72zFumfRAoY9K2qp3iHx4YQxPKWGf65vwUL0p
 2/g0MIv9iHq/Fg4LE3U5JmYY0xUNWg+Wt9bqI/D8w6gCMjvx5xZ1CV2NspsEnNEx+y0ikEmm4gr
 9RivaBxgu+nkN2KvkwyWvl4mopUzBvWLZtb/aZ7h/uZRNcGEpFm5alEGLcJY4Xxk/F1jkqxZVd1
 /znDRzwQKFTNIMM/6gA==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1f507 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pJ5EbSc5xwiXHrCt9wcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfXxnVRCLrJGvkh
 TvjZfiOa2xwZSUB/Id5rS2Qgj0l1w1ZxPgwC3rHhVTqBW1OT9SaJgugBS6INuPsqYRQXUvhR5//
 muIRtHdPAdDAT5z2m2CI6cYeVhFOygQ=
X-Proofpoint-ORIG-GUID: x81MiPRD2IHz4JT8ATgHAAUL344rmdCf
X-Proofpoint-GUID: x81MiPRD2IHz4JT8ATgHAAUL344rmdCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045

size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
called with width and height swapped, miscalculating VPSS line buffer
size for non-square resolutions.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..3bafdee7f23ba99d9cea4b809b953053275459d9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2031,8 +2031,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
 	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
 					      frame_height_coded);
 	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
-	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
-							frame_height_coded);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+							frame_width_coded);
 
 	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
 		dse_lb_size + size_vpss_lb_enc;

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-vpu4x_buffer_fix-80cb495f8f46

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


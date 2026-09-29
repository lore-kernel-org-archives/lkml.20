Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB53F23A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656090; cv=none; b=buKnC6F5KbGJ/nk5mByjeDRgNG+Dht7C97e2bAZHkZ1yvl1pF0y9L3Qd5lGOh+MxzqXfygim70jCoBRsJVPsNHJNcSNbUE7YsiQ9J5nfpiz/jH55WAOA6LlXxTI5Bh8Dhc2UcKztkosqKq8aHfVOw+h88yv/eBhXB+iK43GLbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656090; c=relaxed/simple;
	bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeXHv48DrFvso3idgrqDuHsgTh+SgRoN75dQt48CIW58xF+FJumDrrtllvUgjVyARRDq5YbrOTrqVcU3k7sULwAd4P/Jy2YgY5FLN0+E55/SQSAIOdG66VlSSAxl1OvFVaJ9AnrmadMBRYDbfwPjDjP8UyvMP2Wc4KrxabEIbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtg4Ce3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLGnH8+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtg4Ce3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLGnH8+U"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T470Pt2685996
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=; b=jtg4Ce3C+VddnagB
	y5yyxDtyLjA3367sOVMchEPAOl4ObiXbsO4/cvLLkir1bYaBo+iHcOaqIGhVEUVw
	R1SaLWYQrQqQGe/jL69J5DXjDcwOx2wNrM0QN3BWXM8A+rKJK72imewp5Kblo9y3
	wksug7aERHWlkIDRWivU2k24qpQbhS84nJcUSDO0S++aih+4LrbjYSQvgahkEVE0
	oAhgFbQ9e6KpjpkH9g7QJakT37kEkMXn9E6VW0P3MbRLttFc3hnMr2YBOG899C3v
	N4rNJUPsgrMb+WPmuQ11Qz1KZbPGmwJiYC52Q2+sA0z524VEwsrPmUO9+YyX/O3c
	MJYcVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjgr4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f5e827c6so87912551cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656087; x=1791260887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=gLGnH8+UOBD61ApCJxb3qqYEHXhrJ4wAVqiIsC6JZDqMCxnvl/xp98+jzxokoCGdys
         Xq/DHu7HnvS8FrpVZCtW3tR/8T/66Eiaj4pbhRG6Ezh8tfifLP6cF2jp42z8IWxToMRw
         WeRbIWLZUycVFIEZsZk1T1rbEA3oy/HjdyVeeWaauCbBiQEwEMoKQQ7wfXkUXgniMYpo
         m4PKHxWEmcRVCzi0NbYHbnH0OuhHSWkJGjkH6/Wy2ljnmYUQJtBhh/nFRiKU/KZhOc79
         czQi5QlntWmvhY/UX75MsL3JYnOc/7UMQpWKJAUGd/l+HY/NNNjmMRUTvVJDzrvkXzxS
         l+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656087; x=1791260887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=Bsdxooi/TyrLquieMtaq7s6Y1DweVGixqSRyVOajz1VpnN+i0zjQFjtLXYPxOooh1p
         HsWhZj7NUPCxLvcH7Ay+bNXcFCBu+0WFdGHF/0U84YEVa1uiWC+vR9HCVXW68/zWPo5+
         CFlzMJ574ryFDCdW8ivlskGNk34bEiLJ2OR8LVO5l9mxgCLpF/reJRDnMfF8ae945Pjt
         KP1RAeAUaAa97CgNv4w7x8Dmnm6gylGlizpWCpdKEa4QL5kIv0uUnxJKlWiqprJogEIY
         l10nHkBoIGe1IJI5eJaB1M+0aUkDD5NdGCi4djHhV0OfQQUSAhE/FrrZdH13c3YmhC0M
         v7wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzouVw96/ul4UfaDQP0BFku6pF5M7OzlRGIFtJRDjmU9JggDx6sJ0Gz7R+UW9S8AIvwdlqK8QRIPApz7Cg=@vger.kernel.org
X-Gm-Message-State: AFuF++lUbHTCky2/W63HVcPBcH2bIShcxyTGF1q8RbBTJJYR+UXJr0L+
	K7sPxF0aDCT3+GisQhcqpPu0io8MUtU+sDqSHVeSu3Atxc0uaIP1VaWyLgsK51iKn2xCKl46UIi
	+kp5rXnYF2uDj6TRTlt5jWNuuZskQhtTT6pKI4rs9sBNQ7a8R1eEitjGgmqtQYW1tN80qarTRrM
	A=
X-Gm-Gg: AYBFou0cGM17yGkdXOOA0LXenIQNq7fyrY5atagWDX4i5EAJuB2GHSpJylqJQZTjJ3y
	lahEw7MueM5+GkXA2CyAR/y/SH3REeitAAkrlSCxaN3gC5vetA35nJpQlgJ541c2uwAD8DOc2Un
	s/HJNyJJD2P77iznHigkuBlLGgV44AQlPNdEOvg51Zc1AvXJNFRPGlGkXxY6mm5r5Ydbpp1TFvl
	yZ9a/Nu7jRjruYvhswkSe/FcXjRPUDrOx1vlrFfV9H8aIVwN8ZeTMc5G7cS4Akbspv4/B6jJfQ0
	PRiF5yfgkO8Sve9PHNXTp8kJioht4cvSDMm8Q1H8KKGldL5LTsu83eJlis4iJ6KE13NmHe4KweZ
	69m6+6Y4EdlhIGmUxyUAySvm7nkyE2gVACAvMnzjoNrcj06KrNf7na7szsLnudBA=
X-Received: by 2002:a05:622a:99a:b0:533:3aa2:d8e0 with SMTP id d75a77b69052e-5333aa2d9damr113330741cf.55.1790656087232;
        Mon, 28 Sep 2026 21:28:07 -0700 (PDT)
X-Received: by 2002:a05:622a:99a:b0:533:3aa2:d8e0 with SMTP id d75a77b69052e-5333aa2d9damr113330571cf.55.1790656086805;
        Mon, 28 Sep 2026 21:28:06 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:06 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:45 +0800
Subject: [PATCH v7 21/35] drm/msm/dpu: use stream_id to select MST
 interfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-21-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2465;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
 b=75huUwdtfb27GE2zMYuYJme5I2ccgY0Sc4CV9nSVhK7uu9VmXXMVqxJgzh4uu8WVlNecHh1vD
 +CS8TqQbzqJACtDwwLmoqe07j0xZpdIuQ2SLXcoqvjzy+B4ReuGqQx7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8SWMm9eIMPoR
 14kL9KaOyx46ASQ5FyI5fuYY+v2h4yxoZkXptLIya3pVFG+Yx4HZIqqY/dhlyHRHm4YEwbX/vSB
 TP2tDGui34tLdY21tdvmc/2ORQCUkyPMpochNkbuZQQndz8rr6vrDz/YdCbo4bxTR46gIj2mJCy
 jvsRKQrd3Qe1+nGE3SNzrd8D0X669+XV7yn0XdmLJxE96rGIfPe0E+R03/bKigcRn3SMAn+qgUU
 WCnhKb6M9xto3w7PS1hvRuhxyuDL+eCtXoOpisOsHAHX7TF3fqSF5Zh/Q/3sQHA334hByC5YhXp
 Q1dlvKx6eEYNfdXYolH6Na0NEXeQ0yf8R+9zSu5A9sK6L0tFiDFHEoZlXgzZrqkFQNjPBr9PtHd
 VQ+stnFvZWDnp99gO3FMrBdfTVa86WrQD6X5wWiBXLiNglASK0838rBqk06ZocRhz4S8MOqCNNO
 segOy3GuVAGV2xHjjIQ==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb3e57 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0WTfypRwNYQE
 npQRLrOfMH1Az6L9GgU4tH0HKWNY9hLNdz/i1TM5s/FK8kuO2QoyDJGSu+Qb4eHHKAReLC7seMi
 XjMBIriw0hVnwrEG3j0MLlUK75sygKI=
X-Proofpoint-ORIG-GUID: yVJs6pQ23ARVaJXdfRuse3O4J0ayzu8C
X-Proofpoint-GUID: yVJs6pQ23ARVaJXdfRuse3O4J0ayzu8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

For MST, multiple streams can share the same DP controller, making
(controller_id, intf_type) insufficient to uniquely identify a DPU
interface.

Add stream_id to msm_display_info and use it to select the matching
interface for a stream.

For DSI, eDP and SST configurations, stream_id remains zero and
behavior is unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 91cbb0ca521b..004d5fc460a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1439,17 +1439,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 		struct dpu_rm *dpu_rm,
 		struct msm_display_info *disp_info, int index)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
 	u32 controller_id = disp_info->h_tile_instance[index];
+	int stream_id = disp_info->stream_id;
 
 	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == disp_info->intf_type
-		    && catalog->intf[i].controller_id == controller_id) {
+		    && catalog->intf[i].controller_id == controller_id
+		    && cnt++ == stream_id)
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e7613..9972e209bd58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 

-- 
2.43.0


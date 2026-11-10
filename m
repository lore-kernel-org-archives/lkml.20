Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286493;
	b=fLfgpCyimNM1oJMA5xUFR/EpTRfsV9TkzJ3uhd5+Fx9EzwJPcGJ9o9VAJXZsxqL/S4Eq
	 baNir5wBiKCFz8u9ZNi49ivPtyxzuaiHA1ahB/FiTZzlfU1Q7zkm19Mx50+h850KK5ZTV
	 I+WJug6mUMPk6ZsRFA4iOksw6xVAVhlt4/3Z5HOsAonf8s9+W4NUc6lELAbBXzfHU8Rl7
	 MW3qNgXWKTwB1rfufyRhkT9Q8y/EkiPdweudjWVQsYmL593bOIXYmgv1y+KpYvOx3P26f
	 o+z2yW99Tve5ggPlqXYjkH0X3PMdfCAGRpiwMRi+S8ih+40YDGwwoHvayktrbRFZkFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
	b=unFeE8Vnp7CM/e25OeKcIUfWRjE63wv8rqAUGCrpTlgzmFLvYOeHGuQ8a7kknd0sJHoZ
	 qQvomJa+paX7YCAKGsh+fzKAD4pXR1Ws/XwV6wIQdMMDIHeHhCwQs6Bm9CUqFzKwZsy0V
	 m4x2exfRfO9pyuZwq4goZpyeZoGyvrb/cgwC64m3gY3cHaDM9xW0S22rcTfsjS6VDBMha
	 8Ga49MPYF5XuR/XbJp/3/lz5DwzkvCH03ds2aXbC+Ceoj/NdgsbahRsNk5AWkv91OUJAt
	 EVwzqkWr4Yy8SO76GhandLNPP2PQQnNVuxIEH4k3I5GIElSSEKymvnWoSiKDKQMsK3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KcDWHYmG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K5kvFnaY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC746606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC746606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KcDWHYmG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K5kvFnaY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49q373267897
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=; b=KcDWHYmGxidiY0XM
	yk/pb68uA9h+1sodu+vD0Fy4wlDgEz0lhQL2wevJRURnw/XPNIzhN0QryMZEW5n7
	aYq7468RKsRgsh9nPLGGdv3tKI0kNlkOFsjKv7SHFEliKSi2MAQ4JC5HiASk/YZ6
	OLnRFF6HOF4oWWJ6IjN82w1OdeVBVnLeJK/Pmj+5Tmr/svhT9+Rh2RSkBKx9E6mP
	529bNm9mi7b+5n0Ljw88y58eUReeC1TWga2kVp6YBCEdHXszIQgUM8HipNrQNK0A
	BC6nEaEPGpn7k6xFJ7FIT4ewAbjb6Im15WWwNlwV+FzzbYj0P7WYj+LX5mBWzXln
	cKtF8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qubb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso344394885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286491; x=1794891291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
        b=K5kvFnaYCyuHrpE1h+kKucjRAm+cQeHUGOql50EsvZNqv8P5B6Cabn1+Bv9B3r6V2Y
         xhCyNyEuEAfqLSX0nW0U9tcQmMctAi0DsHYvKnVSN63wNwXV0nmHDAQagthn6suf5VKL
         QfWQrPKFXGx3c9EMACyLFqY83P9GrLumJRcw5MtMJ+t/ncRNkQZJYBWaL5MssTXyYV52
         vmIAJYOw+7hiw2BmgyhaOoH5DRsHLg2zG6tl3/2Xj/q8lhLFc7UQaR9N5nYkYiKi7gxn
         K0XSXXtr7qZd/DmYd8jRCtk5wHSbKjrNnVy3xPDbK30/gem8VgbqPUL5jsGBnw8fBCm1
         pGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286491; x=1794891291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
        b=eeXnNBpfvIZRxk28hvQIgv7D43njdHeRf9iDPAkcxS2q59SRYRDZj4va0rrhL9ZICl
         seOHV/7URXmUf/aHtMRTWCQXdcOgnoj/9E8Ix07EgH+3qW4f9yjefVH1oMgLZIb0/1Ve
         mb6VNXJLm0PdVU4XwkVRUEmt5HsRQ3E8VXhqBtqGs1aA/hz94vPfqd8TfErKbOK+rGtW
         TCRqjHKNrztEZapHAKyNMRAToNdfF9YIOwrCRhZoGSHcC1OduR83mudszip3lpCSti1v
         +ezOJRLqSWX1vgvukz9EWjZiMDcAUqZ3f/7tmqtN6yMqk5Cc1PsP7BD/Jf/eJqpUxEg/
         A3Bg==
X-Forwarded-Encrypted: i=1; AL+hErEW/t0ah/CMAfiOvX6L4yfX/ChcYId6r4NzeY9rNbTXRGu8JDi9neHihCxqMBqA+4Wqcmbbka5KrAvEoKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r082hi13130DptDVLPibWOsF0k5h/eeEwBb4AK988Pb9eMfXk
	qIaNr8CckAOR4GIRBmg1FwN7K3gfiigTAjVqaQzEQ8og/Hh9hD9zDYURgwt3qTq8Qvhc42tSvRp
	58KgZ0KMyuARQgUXLQGFnxHvn5UGEi8UfCXVnPZX1hd1O/GQ+w4A0zDH0GVZj5uOKVsk=
X-Gm-Gg: AYBFou29+6768cDn4m/nBI2jC77yN9Z9TRNhR3/PZ5UFtmbuu2Xli8H+xgp4Rwx69XL
	2VhjXwzvIvsoeK8Jdxs034baXrRIJy/jS0MKrmE5oeZsdAnXHcXzRHvoxVu+stQyM7dP2qWsh0f
	HXAIwfhk4VVqe/HpU+/qFb/GlPFs5hbxMMq6qoPdf/ex42Ia6CHMNb91dHMm3qbMbRz4Kulyzyo
	S3M0gbSVJk5djpqmzedtwuk/S2uzfVS/++y3+uMjnK9YSXaenYFiHhlCxXBXL/WrfxwEJ0tFGAM
	bdPUnIRyIz5ZTpfFTfzUTy9ET97a2ulaRGkGE4QtzRYrvx32n2487opLrZVsZL9mw7uRGSGJu2Z
	JKOUWP6ZppyiVicWbkvEYInwvRqT6rP770xhANsulr/kzUVCC+yR1TD9y04Ivhre/yn5kRz1efP
	kUkVEHWphmja0we4Mgxfl/PjDG4TnjM+Ysdk/4
X-Received: by 2002:a05:620a:4449:b0:93f:3193:ac09 with SMTP id af79cd13be357-9479f1ac375mr261587785a.15.1794286491004;
        Mon, 09 Nov 2026 20:54:51 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:93f:3193:ac09 with SMTP id af79cd13be357-9479f1ac375mr261586885a.15.1794286490609;
        Mon, 09 Nov 2026 20:54:50 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:50 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:24 +0800
Subject: [PATCH v8 03/29] drm/msm/dp: add support to enable MST in mainlink
 control
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
Message-Id: <20261110-msm-dp-mst-v8-3-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2559;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1R3kmWVAchrWxMW+GrgfYnJ3iT9s5hz9hnS0dykL1+g=;
 b=n5/USZ38RA+t7EKjG3ozYfbItnOm2eC3jTVm+gz4hsoE/z/pl2bi+5S18b0Fv+BfOANJWgAQW
 ZmqDnmIH4+EDGB2MtBgXlioX7u2QDf2QJ4xCWk5qtZe9DhHipWvAdS3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/ec16PZxArPt
 cq8O0/WA/zNtWQP4bPANWZOHlK4f0sq2Te57oScP+EV7CBkvMBjHjC5BZqLa4Hi0ln+zf300esB
 E/8tYtRh+5SqKRTso89HY7zu5mpzlHfC6IUpDpJrnWMYVR4t3xbFxGxsTSEKym6leMs8hqGHzzh
 QkWVMPbiGLvJoHo8dqSB613wifu75Rp2U/eqUtGaG+6NCQgoMFzl7v1Ha7FqnnO61G2r+TH3NKf
 5ysG8a8LaZ89nYmJS2xtmPfqHSB1gnId/bU8UisVhiobkRn0D0427jN+yOefJg+7eHCggNxUcxm
 4IxqRnaat9vh4q2Pis1wiAEaX/YffcPswwZxt+FTwsl8m+V0GJXpVPfqzS/rL6YdpAYG3M0YZGj
 MrT8SNLIlm6TIEghhElVdHnrOfnAICehmkw5NPLr2DuqwQXaaWFD+9v3GgqKp/eSEW0xmOoCK+I
 V9rG4xAbJB9M3TxmznQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af2a39c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 15BAG_ww4LOFfWtvmIF_3vYrGFKhCwRX
X-Proofpoint-ORIG-GUID: 15BAG_ww4LOFfWtvmIF_3vYrGFKhCwRX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/ryPVZsQvK0b
 XWIstdsqsllRnnvimLVUMFsjSFqu4HIP0apoDJvdp/GqNrUFRo9E3duOgURzXePV+u1zxeoduM0
 Zk2Xp2IyfhxexH2K7lJvhTCY8ZKfLVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 288f84c33275f..b6ff3d8caa2b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2689,6 +2702,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_mode)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2739,6 +2754,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c8..cc74b1ed628ec 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0


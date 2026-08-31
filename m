Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833A3D3339
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164323; cv=none; b=im9WjrHqpyiiaiqo875EoXre0FIqxYMFnm06Jq1uf72Gs4Ic8qtIa1JDU1LuCa43FiDSxbF+SV9V+w8AbV6Zk3YEle3COt9M+S7QEJdtj2dO3rPslvLl+Jyl5Jq4FiHF9kVh3Vz9YK75n+jvXyWw8kAfJRgl2WQcImrAYPkrbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164323; c=relaxed/simple;
	bh=YPFTFMeMfwyk0eyZyqMuH8LSBoUaw5rTGj168yk7P00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPELx8+Bqhy6OzxsgkKGEeHbfx7YzZv85gBF1YAK2gfDwRt58rqHpO1J3kXlnbOheRB9q/CObEUe1M8Y/OXElBRbqBAmg9dv+LbHaS+QuVj/wxTH7sKZFYyJj/5oKAmf8zefQi0AsqFJuFuT2vR/Mrt5WFOnH81aj0ALhL0Cbt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLfurGQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAxwGniB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLfurGQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAxwGniB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xGL32332469
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EMKuiMNWKeZ4aBvPfPmmvPs5u/vyuYPwrGuoA34Wfc=; b=ZLfurGQIiesOa+xP
	FxUp6+hbo9ssHJpH9VlcX/l4piZw5v/aX99rUFxJqLrm6mEL9NLkdl0jm+h8O9Td
	bZFU0HflJ/Lvy0NmCtzM5yuQ+QlV+rOzCmMYFbt+sifK1Rasx1Ml01e1Mm4L6fyr
	m2pl4jcLoQU2kQPFNWynJgJyecCICYFBRWnR63/L7pn6cMgxY8BKDpeyLfTKNHqM
	J9LsvhdIwZ8WUN8osjiAWFeSOukXz5k1e/O58pCyhjKDy+AXvMOXMPs+ObYbqanh
	etS2P+o0+P2Jq1OdzLiviC8+NLBauVLVuvWj93KqaNnagDZddAI/nquIUiD8g7wX
	DvyOOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq856wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so436345785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164320; x=1788769120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EMKuiMNWKeZ4aBvPfPmmvPs5u/vyuYPwrGuoA34Wfc=;
        b=AAxwGniBWkngDl01ZE/wlb9/9ZXiXe6BMr36TlAX91cYYReLw5jBpnx8/47I3QZUSH
         ItXL8ITIisAwr892MqOF3JFPP+1kfOHpdFjz7JVdBPtxuaqUH6M2JMKdr/aJFxHCToMY
         SxOOggQNP1Wv5L/f4Nsn1pFuCVD1vhVuBr92wRH7xedjy/TsihforOz9sioyQuTGH2Sj
         LZnIKa32U0inmnRRPki6IO0VjlgaL3XZsXtpSTSQCs0YtdzoBALCRtB9MOtT8WoZ55I2
         P9hR9JQrOB9k9Cjg9K3CMd7D/eC5JUuxOXjxre1Lw+QbDFeBIIuSFDMvD0JUjgTlmONn
         aBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164320; x=1788769120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EMKuiMNWKeZ4aBvPfPmmvPs5u/vyuYPwrGuoA34Wfc=;
        b=kPkHDi83fz/ycW04QdTB/m3P04PrtzcYNyfr3GsRRG6svkqXMBLG9f2nYouoNklpnj
         Lnea64XM4JexBxy9xdRq4Yd03lzITp/TL/fm5wOFs+6+fAgJ2J+bwTVdbHeHHnnxlXGq
         lqTrggLWNyXX7L4DfZkv6OtwUTbhJ+F4dtSOFIJOQjlxcRGfKW5VFO3hh4juYrPr7Ovt
         BNaT821z8ybQ9hnzyeHI/70wcbI49I94ri8fe/iDbE4HbiltRTsbhjDuwRvZ0IUhJgHi
         9XjXJdO9GkeTlGcZ1QedYskveI3W4gdMsFR3Zwk5ib4uBXvWehTnz4n4IXYydkshYLTm
         2U8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3By7Q4Si9MWVdbEocWvWfCVej57cU+af7/on6J2HFSIWJUNYLKGExFJ32Xylql/jH3cNNl65N4cY6cb0=@vger.kernel.org
X-Gm-Message-State: AFuF++mObbaoyCJx0yHxdk+sUp3mokijFe5UGmrHK7gk/XeFRoP6u1tc
	e9dDZwKdRyHQrHf23Mg1UijjgBnJFkHylDi3S0RiLa5b34PIvOq6piqSmyXOYcKNm4C4RFv0IGH
	vYlNRDBkvE2tc0+poUlWm35y9eW9yZZX51DRxQy47gA34CsDDWKD7oGCPNwN3EXoc5yA=
X-Gm-Gg: AR+sD11RgnTENN9L2vAz3KsQqVzidYoIxZeOowIuVfLXK4gVXO1fGFFTyY7ugY74mJD
	JEMPNa1QS9zIEWJD+QV40mFCseVGmd4HPGRil/mSyIoNt2hcbs3+T5SD2u+ypeuoZ+7nhbonXz3
	OfxelxUbCbF4yITMFiWqA5pCb1aZ4xeR3Kjtq3AdLnO+6zkfGLPiH9dv4lEzL+BdZJ8bEponuNx
	0cTk3NfQkc/mIz7RTPA/GWmgIo5nyCZuEA3TY9tY8V/r6qCuxgAO8/J0G45Ki6oGQ/PXaPQMlFZ
	b2uw0W4qUjF39j+UAaPDxSU+I87iPDfsej2GTJYjAbQiei1EMrqvDn/PldxaSOoXjSxtGubPHfQ
	TM3dJIF9M2JiRlClk10Q+CWoS2JGJWLvpS4eXW6ZuZlVWTR0HHcVbIoX3KA0y8cc=
X-Received: by 2002:a05:620a:1722:b0:939:1df9:4970 with SMTP id af79cd13be357-9391df9516amr1931046585a.24.1788164319357;
        Mon, 31 Aug 2026 01:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:939:1df9:4970 with SMTP id af79cd13be357-9391df9516amr1931042085a.24.1788164318866;
        Mon, 31 Aug 2026 01:18:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:38 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:29 +0800
Subject: [PATCH v6 12/29] drm/msm/dp: add support for sending VCPF packets
 in DP controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-12-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=7068;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TniWeqxzjHoUl2Z3h7/YCZNFywxvXf4ceE4t73tCJCc=;
 b=qvDy7lMpOnpszVhD3L+WiNxUE3NqJDnIcENXmR2Ui59izzpeCUZou3gN9+M0+leMVtmjV69r2
 7F2DyzHWk3zAVe2BQC90AvBHx55M3RgEHqYSEtOYm1KbhQ3zFp9m8iv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: CxP2TVbN-UrLtMA4tI3DIMxw8dw0oIB_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX1PFo9gePVP3y
 tMezOAUV4idDpaYv/XmmcIynmxy0R526cOkjoXTYZvNVyn7leiYuKSs8Wif7YWfWTcuPJpH8UnZ
 cHs13KqY3wQJCiwAYrPOoGL+Eqgbi9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX+ALKs/0r7vfD
 xLpiC5aFUB58vN1aY4L/TFkcK2ni5Dq89IjzyfwwhAegxZ32G6m8vsLN0egHHhdT7qkhBd6Ex0P
 D/LL/+GmS04weZhVwM75zkIrmVuSJZDR25xGgaqydQzyY1wJWwfx2WvMgJ4OY5z1acGj9HUMPwu
 oPkFO68DCiuYunIS1/uScGoxL/NXP528ErNhmS+XTJlS3K153xvwKFeit8gZJP7WrYJsrXx3WeB
 XXVMX8nJ8ZE93z4YrYwiYtpw+gMI0PmLZkaI88GKHuHU3oAUsaY1N0kFuB9r4l1RUi4gP0L8txa
 tWHpxOHxn13QsFL/bLu2f4Gs1q7noAhOKafbwHftO5cSpgkVCMiVJBbTvsBYf5hZa25j996rD82
 4PA2agbCo1lBUYDSor0b/KhuJgosfTJQNf6iyVnppPXP+195ruLO4T5J4UUgcZctzzR1KN5KoKo
 HxxdgReX6wWJaanKp9g==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9538e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a1Xw59hMvoynOX_QUlAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CxP2TVbN-UrLtMA4tI3DIMxw8dw0oIB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
Add support for triggering the VCPF sequence in the MSM DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  8 ++++++
 4 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9a0c9737e6d0..109a84167599 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,6 +65,11 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -351,6 +356,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -360,6 +367,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -379,6 +387,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -478,6 +500,34 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+/* Must be called with msm_dp_mst::mst_lock held */
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		state |= DP_STATE_CTRL_PUSH_IDLE;
+	else if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_STATE_CTRL_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_STATE_CTRL_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_STATE_CTRL, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+
+	drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+}
+
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2801,6 +2851,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 41a69447001c..84ea37d8db2e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -27,6 +27,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 52c13823e8d7..00c9b55925f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1496,7 +1496,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index cc74b1ed628e..e37a05c2963a 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,6 +42,9 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
@@ -58,6 +61,8 @@
 #define PSR_UPDATE_ERROR_MASK			(0x00000008)
 #define PSR_WAKE_ERROR_MASK			(0x00000010)
 
+#define REG_DP_INTR_STATUS5			(0x00000034)
+
 #define REG_DP_DP_HPD_CTRL			(0x00000000)
 #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
 
@@ -143,6 +148,8 @@
 #define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
 #define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+#define DP_STATE_CTRL_DP0_PUSH_VCPF		BIT(12)
+#define DP_STATE_CTRL_DP1_PUSH_VCPF		BIT(14)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
@@ -370,6 +377,7 @@
 
 /* Streams 2/3 registers, relative to mst2link_base / mst3link_base. */
 #define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define DP_MSTLINK_PUSH_VCPF			BIT(12)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003c)

-- 
2.43.0


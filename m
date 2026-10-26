Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995841;
	b=NPLkLzPeDxMVXM9ShItS3nJojzJsJaOJdG/zNhbJ1MwW1t1awQD0w7sIfERWp5m/Dif6
	 9dvllsgPfzx9fGesUlWTGeHQk4hrWQGIcDcaotYEpX2484Zv72I12DeWJ6bkiIFiyCqLk
	 KK8sVajCqFr524rIOopnZx1Ay7271nNt96z4ggfa5vJr9BgrHuL+4zSorSmnAArNV8JR/
	 Vj4TBM1JGHT3UV4t4jpHZIxq85F1Tv7lJgviwisTR7FYBpYPekJ1Brtq84dMfJLqOWB6k
	 BSyRMrKVMA0fxFK8PhlnCjrZpGQT5GxOuSrHlpmOFBBtDbLvimfxUFqlLc19SE3gwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
	b=YVsmAbww+xtjSADwE6IMiblne+rdPWIBQzepoV4Sq8odDlEs1MsLxPWkkrEsCMEk2vJ/
	 D8sW+a2eX8JD3k7khLwwZtMpQWpMU0AJ85vtFoq85b9aYBrkqWw88xZBgz1cObV2u0hE/
	 dGDVUuL+XPbEohovWhdXWNupmt/MCFXyOUCunceR0iCw0L3dQ4+tj4OFYDGLtcdmAfMtj
	 /EDi5lHHX92OKhTpgbq65D4yKso60yP7X9FZFHbUxlzCvC3iK1jl3yLYrWNzUjwGbO/EF
	 IhJItSkhIOudCLFDvPCZ3HQSlU/0c/sbHLEH1CbLyrVVnSGWRA7VyBf+L8G4TS4pDsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRS16m5m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd7fdwr4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D36606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRS16m5m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd7fdwr4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b83h1907971
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=; b=dRS16m5ms665/YuJ
	Br6BSa25BglOaVUYMDaXlJ/uSX/QpV0mpRKD61oClP+LUpAWEYxStU4EwUO7hnkJ
	jxgYutwnPits5c143mX5LemV7XGVjloM3+tGUkMa0S+tttGEGrpl9b0Hmkw4B1x/
	HanNbhsCSlJw1Dz0s6337gsZcwUhSYBISHXwmxkSyAIK1vX4ZmvtOt87m/f9Pn39
	cQt2Zyszk5Up+EJ0jQX3eHeWNiY+7txu6jGXuvTAXvdpEbreH4HLdrMZExPIZGah
	ICAmXeMImI+QRzO59OTo4WHTRxgArfTxwokNbh+7tN/i8mO1L6xLhj2+Ny887pCa
	KRgLxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn4fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so1515553a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995839; x=1793600639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
        b=jd7fdwr4zq2dKgjOFcpen3EGKG4ipx6aSXi61xRHmTxsPjXlVJ0Niy4ewmfSkpQMGR
         rHZGs9C3s7qd/+qx0hAW7bV+3mbH1PDbBvLmE/Fw1U5BnHQBU/x3Wdhuc2r12gfEgUPg
         imJUulfDPPJfhuUvgsvTJAmdZdgI6IWzShWYSCb/ZxZbrrakI2U5S0w5vtoHRKoW1F0P
         SeC69H9lcJz3nXnupGnzgwm2N1MkowgM4LXrPQELU4ZakCR7vZfH3O7odl75UogpaWg/
         cd3XYXFjI/tCpr+1WZkfLMH9yHfZdVKRJJ3FnYM5MuaBEbv+wxtkPkL4zgOO/VHX8RHP
         H6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995839; x=1793600639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
        b=lxGs61FWJOpBQIOtphHTviAgXJ0nruNkzbn08zHTXzYoUDFL0pMvkmKvN5Gw5g6zqG
         DgYdJ6Btiwr36hr3kNw8m7RkLf+38uQac4uiIa+Eo9s35HkbVd6thjmSXvXK8zcHKfds
         vrulTke180ZD9TyYi7vwqS/6JRUs8YliXlJRZbZcn/F5xktu3TPIJIRYrEsm39aC1gYE
         NoNC55ucnp6X1nu3Depjed7/H5Vgd8d5FFHXg3x8rVZ7y8LQBwNoeWxzxeLQURpBLrdE
         juLNh/rf9tL8k4ZbrA0VDfkOQPxvAbfhuSYqKjgSyXmVQIQ1+jLiwCqdOSC7fI3Urkjz
         OudQ==
X-Forwarded-Encrypted: i=1; AKwUvByU3OglPr8ec9rppsdyOGZ0ZU1XJcGbgLt1JMrAyD5MMnej96ybjmBwyOkEePjBWy/Y1/WXW+6ILoYVW7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMJaDWubZQcojIypl8fxMSUaX0K4iuvV1h4jEtNCpLBhlsl8sD
	JgE5kANK8J7s4NYI2K6+W5OmqqlL0lJ/gnc2pxRM0fy2O6tu7PgW84Q02ZHa6YDvQDfUbbWZrVJ
	h4iC6T9rT288lYgRZ8OhTlwFNH77TCZSL6LeuW8+lDCwqyw6F4R6NhOidr6yMLEwYW0M=
X-Gm-Gg: AYBFou36FiJMcVQsOGUaCipnzzDygPeDBkxqynJr4j1jU4AM3o6XeSxDlC0Uh0sLKtG
	YAyeev7d4ZnBWNyWL0Xz3GgCWXFHHPQ8xNLSrQ2wjthiUOvLMkXyrqxUcj/3WqHcDCvUG7T1/3/
	r2jOYQPWddWrVEK0vBAHt2AVv56xFFEhS6vKfDkL99bzsWhyb3+ODNPne2UKa+xTXLThT8+r3E+
	9fMXCjZtJIdSJNVW0BEz+hKRLBMopnluEgJmx6202fGQD4zh0c0rgqtPwFCvmXYLOO1MRdsx0T0
	WBV+OxTgqUBhGjI5M7imweDF8zaHcHz6wfD0RQPltu7khyLoDRqsEGTOUHb2Iqe9kARulAKAYw2
	qCvqcfPvd7a/ZEUUwOzRi+583CldonhS1nw==
X-Received: by 2002:a17:903:3c6e:b0:2e9:6645:e9ab with SMTP id d9443c01a7336-2ea9c6c246amr54738175ad.16.1792995838582;
        Sun, 25 Oct 2026 23:23:58 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2e9:6645:e9ab with SMTP id d9443c01a7336-2ea9c6c246amr54737865ad.16.1792995838107;
        Sun, 25 Oct 2026 23:23:58 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:23:57 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:23 +0530
Subject: [PATCH v2 13/23] drm/msm/dcp: Route HFI display events
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-13-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=2412;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=BFTr4Q+ZfwwET6V0CyDqzPQcI8MwpqQ9e75s1Un7OM8=;
 b=SKN800pVbhcnvPWsUmrNznlIDbT64GT7gmpps6ZTh83CJvMF8drOdSRqgxsHIH2Rhkat9HE0L
 quOBQpd8NsHD9Z9IG6TzeX9xiSU8vrxzzp9OkSE6Nv19uQp+UAa/FHQ
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 1jSTbG7-R3pMgnoDjupHMb557PsJzSUW
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adef1ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dkYgh42podB0RqWQ9ZQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 1jSTbG7-R3pMgnoDjupHMb557PsJzSUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+AQO1Q9Mof3L
 2oJ7PQqU9IkO9MmHztFNer/QXNN4VIycJmc+H2oMmCfq/1+LUXciHdRkXh7NW6r51gOz07VOFGj
 2uI+d17pJZc9xPH2kDhPCSC6gzOo6zbzJLHRwdEc554uqsUwAZ84uOXCRzfq38jjcwiK+lM6d+r
 ixguvgJS9TxtmF5ppQseIM0lvxYqJjcw3rvG3ZBa6gyCASzBx44oiAz0z+WkwZtMst6We1+6fAc
 K0U20dvalDSz9Z0RvZL61ZmkfKzxtNC7QZvJKtwvCIj/gj6pymupVtGEHrqIKkBTg44LDRXpcZE
 nIfIUOTxWak9IZhv9y8d1aEhmAWH+tVpdnDwfC7WuL0OkQnnjLU0p5KZcIkJD13801kZBlQ7wag
 KflITj700NO8phHjCNnCoNRXy6xWpGd/pQ4/Sm57dCjqzyboJB5DM3i5lvkaoBapPe05gjon9zq
 7acpvZ4zSa8ChL3FiqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX07CRM7pYKZnZ
 WAgrc0PYIB6IJrH/L07nH6HBQz+SibSoV0+khkUu+wulcLIRS9KiKXn+iGLXaWl8+OI7iwWFzwt
 jkcUjr9yWdviuVoqol/MMbT6AjcnDlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Route asynchronous display events from DCP firmware into the DRM CRTC
objects. Without this mapping, VSYNC and frame-scan completion cannot
drive DRM vblank and page-flip completion.

Match firmware display events to the corresponding CRTC session and
deliver VSYNC and frame-scan completion notifications through the
MSM DRM callbacks.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 774a5afac0f0..e54ccfafdae0 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -19,6 +19,7 @@
 #include "dcp_hfi.h"
 #include "dcp_hfi_priv.h"
 #include "dcp_drv.h"
+#include "dcp_crtc.h"
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
@@ -260,18 +261,35 @@ static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
 	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
 }
 
+static void dcp_hfi_dispatch_frame_done(struct dcp_hfi *hfi,
+					const struct hfi_packet_info *pkt_info)
+{
+	const struct hfi_display_frame_event_data *frame = NULL;
+	u32 sequence_id = 0;
+
+	if (pkt_info->payload_ptr &&
+	    pkt_info->payload_size >= sizeof(*frame)) {
+		frame = pkt_info->payload_ptr;
+		sequence_id = frame->bufferflip_index;
+	}
+	dcp_crtc_hfi_frame_done_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				   sequence_id);
+}
+
 /* Route asynchronous events and capability packets before flag handling. */
 static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 				   const struct hfi_packet_info *pkt_info)
 {
 	switch (pkt_info->cmd) {
 	case HFI_COMMAND_DISPLAY_EVENT_VSYNC:
+		dcp_crtc_hfi_vblank_cb(hfi->drv, pkt_info->id & 0xFFFF);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_START:
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		dcp_hfi_dispatch_frame_done(hfi, pkt_info);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
@@ -975,6 +993,9 @@ int dcp_hfi_init(struct dcp_drv *drv,
 	struct dcp_hfi *hfi;
 	int i, ret;
 
+	if (!dma_dev)
+		return -ENODEV;
+
 	hfi = devm_kzalloc(&vdev->dev, sizeof(*hfi), GFP_KERNEL);
 	if (!hfi)
 		return -ENOMEM;

-- 
2.43.0


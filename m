Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286488;
	b=Fdt5MNDa8iSRN5zZaKbk5nBRTTOdsE5Q7CyfClO+UHTO5D4vsvtntaDsNaxUMfEdO73f
	 Pkw07i7C4c9RJroVAwF0vChZ6RCS8fIFSNHVVJkGhdbLSeVCuM50kR0HLFQy4DtOJGciJ
	 mguESUeyMRMvcdvnsR7kj6f9EDdU3VhEXPnRIsD6/+HxJCkW9roRnwwQADauDYmR3jBMt
	 DlsIT0UrtcZavEzmGqceCor0v2UCPNMDQId6GN8AfPX7s9J5obTUIRS/wV0u6DSJZY31I
	 plQzPHJrH8gx/b3NGJQZYQuA/6wiVMNvn576IvD85TtjlLsu2+7e7k0lNITFn0G1Iww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ruRaxGvMFDm0H+4zN7LbQ+8uAneeL+NMjMtpoe2WjRA=;
	b=ZclzNR/lPmzfvq6YfQdJEBj5D44chVBPU91cmbZByswUxyaxFty652sbL6oXRHzGr4xp
	 I6dmy5k4XTCe0k7V4j1vcpkw5n2gHbb9fSyL1z1moi8c+17I5lNt7g5qtYqRypKePDs0f
	 o+bKqahY0SRvS23XPLEfjWrpgvh5adYtjpCyHplhQ3v3VK6YfpF5q3N9VyLidI9mu/On2
	 oR6mrODEJXQk0JhED22pr2tO+i2Ya+9uwG7IbGzKlSxFeuW4j/RNonQuQg0ILZ12YeCN1
	 1pD7guO9vEU2kEooi5fDCAXk5Vr+F2iJL2f2wIB1Qp+5qZ2Nx/i7uulveH2oPSUSpaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dtIYRTYw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUBABD0H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3103606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3103606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dtIYRTYw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUBABD0H
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A8Mk2919626
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruRaxGvMFDm0H+4zN7LbQ+8uAneeL+NMjMtpoe2WjRA=; b=dtIYRTYwvB5AOxv7
	7iS7rH2YgC05wtTgsmwTO3ijCVMxTaW6wxYn4GA0btiRveBTTmnlX8sXL14NCGoK
	TNhH2PYgzTEAwJZl4clRxF8Jm0yVAlf80OYE+dHNQ3SGralzcPY7Nl78NhgyL5pX
	I03e7xhEuw2XNndu24JL9AUWFyq2XjTdLAB2kY56Hlkit4egxBNPvP45VgEOhhWc
	8gU6B4hytK2AtSFmMR9HvbZOnwtgAij70xwAEsb3QJ/gO8/VO96EijwQg2daNrHc
	EtWjUB347YnYh5Gx1b0+/Xsl52xDmXWT98rICHgrfVIUWXChkDaiakbNYD43QLOD
	T3c35w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1qt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so313380385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286486; x=1794891286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruRaxGvMFDm0H+4zN7LbQ+8uAneeL+NMjMtpoe2WjRA=;
        b=dUBABD0HsqTWO0wsepV4Fp+8At5dL9WIOWnsSiOuqJzvxOGgKV8ZnzRrt3/nV8VN+b
         vW78BibYsx0G+QJu0aGGu3EyJZshUn1RrKs57H4tnh9ai82s4E0HhnfNNicjwLvcA8aH
         s0oqIqdgy2K1Act/38f55Ytc5pir8PRB87BUf1NhcnxAzq07kskkl8YGEgHP2gwsG4Vn
         22ZTCF3LHv3u/JR0bMsd3BDJO+eb1Ofv1rOzALjtvreW5XJfXLnLFcqPuOVvfIAkgvyX
         7OWflPXT+2Lfi0peB1Bap7K7KpevQSdEFVr2je8qml6gac4Mpw1rBxUVX96fQ3pFEW+I
         j9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286486; x=1794891286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruRaxGvMFDm0H+4zN7LbQ+8uAneeL+NMjMtpoe2WjRA=;
        b=OeQ5j9oGOb53VHbXtbQiMFSG1FGAXkVEs7QkUFQxep7WzaEkEoLLBJmFG+FfF/Atsz
         zVhBtrGSDX/krn8XZydG5Ij+KcGRuzWvHYYJ4p4Kw2eU2EwBm/ZnPs6rzDDuoUsK8pR2
         Ehn68Qq4YzvWtaCMuUmQCFFyXd8qxFhE4Zm13mOXnmietwIPbaSfO9x6IsRadjc4Hawb
         fnCNOoSsu0UFYR3+LtNw+3/VAR4oW7xSyC2eap6xgzkwIDzNJGOJiKZjYir1EbPaJ4V1
         pg7eV49PTx9jN6a9FZpOzDezJVV6ODvfwI1EmvEAsOs/IPNktBP8qs6m0mi5ShykR+D/
         gb/A==
X-Forwarded-Encrypted: i=1; AL+hErF2WaehwAYfARmpi2tLP2otyQFhdkZ8SWOcZjlkEMmvcMoY20tHz880l/nqIFAt1eOthKln1fRw/YbvVHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85J/4p4yHHb3jK8glgSh0jZYHwwYfTL/k9is5afTwIPCGveRgV
	wMA+eVh3M6vZ7A2KMBo400/lRIfv3V8nk+GyiFlA0nK74UBb2uN5ICUXX6/Ppy9wYa/HiWFbOy5
	o0M6USNr/3buQLyMKMq6/KyFMrh5pODaJgOqCr8CEL6IRDm4MegJ7vzHWrPCy1+fOkjs=
X-Gm-Gg: AYBFou1pgT+IKWefv3ANqjIZoXY1xBYnH9Y5brQciZuMmDtQKa2O5qm9ad72fRBFpAH
	VOs8mEbfY7HmDmql93W6QuE/AFNIuPiUAX6xfcDAKGRzAttccltSVExV54O7btHjC74o/PRiOIb
	TkbOND6rWBqfIsv6J881XzCOcnlH6GuxxpTkf2ZbC1FGM9EIt2aiwvX/DUHnnxNrch5g4KzTWAH
	t0VimxgHdKGgh+hQ1i0x5lhgVK0f2wpRarckKhCKt3G8+KKHdGmTI93bJZ/fTFv02PGmLfGgB37
	zlF5+5QiRJ8xIYFrk9tOHOaJ43AIcChHqciPRlftStdHwI4/mN34s+BhImsQr00s77IUH7oXIe1
	SbsvhwssDofOOOpJl34xgIrUnVXo93rGYV/Gehhf7nvie3dcwqEbNt7RRROXRCGKyWF3nobSh+9
	Pnp9V5B6rPI5MMZrpC0/DMl1IHE5crbg8NPRPV
X-Received: by 2002:a05:620a:2849:b0:945:d6e9:9a8c with SMTP id af79cd13be357-9479f4e8106mr238498085a.33.1794286486246;
        Mon, 09 Nov 2026 20:54:46 -0800 (PST)
X-Received: by 2002:a05:620a:2849:b0:945:d6e9:9a8c with SMTP id af79cd13be357-9479f4e8106mr238496585a.33.1794286485799;
        Mon, 09 Nov 2026 20:54:45 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:45 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:23 +0800
Subject: [PATCH v8 02/29] drm/msm/dp: add support to send ACT packets for
 MST
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
Message-Id: <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=6703;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=XbLxRh0PZCM5SnxffQCQRKdW1ToMllyUCgQoYUJ0gkk=;
 b=MysI4TYuPMoAJUTAqOzj7J5u9cTkA/HYGlTIdMO3ftynMPESUFuSWwx4aKXWNJ+73NO1zGOlz
 FHTINv/QqbsAdSOn1mxc59s5bBqtRYVX5CRw2KECcDPucHMkqsACeyO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX571Pj3u+eM7f
 Wqplw8w28TQFCR2o3A3pUbY5D0n4Yu3yitIu9FrWa7upnIAVoaukqOYsY1a1ex7QE8EFrj6nVK+
 iVbFUtw+mIrmw5KlVtds1d4UWdDv9FGWSjgaJ1FKgYr7hDuBkov/iCmCD0WgUA1v2LmgLgSsrFO
 F8J70k6xP6c8tG/NAMLLdlM1C2Q9WiFwnrkJrnB8MD3aL4O3z0sYmc1qgzkcEBdITimrMCM5JXs
 OY7etC/nKAIhBBgue2bzoQ73DpKydvDqQmJiMRwiihjwEfPnVrku5mq4I/5OcYuKb3r9AvGAni9
 7XHYj8w/lYKUqhdrOyMvjQ6mUapUQ9sDJYR4tpIHFN1Fmf3jx5CWsizCDXytaqY3mdVy5aGccEl
 F8L9aTuktEFsL8P8f25joGhud4N7vgBuEwKq0cVanQkxwmIVSZdGXM1HiBupKa4waR7Qe2o2hbQ
 /I2YsrYASXHcfjng6zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX0ztkHpIePEYb
 nZnZevoe90uvBaERPbPr6KG4tyDM7RJGmRm6FPiPhWgZFQgJ3WaB1uTO+UcQE2yklsiUsfetn1Y
 XE/8tFXciZxJFJ58LK4fjah+lPL6akI=
X-Proofpoint-GUID: 9UmZoJK0nyJTSttQJK5fSkBToFYzAhLJ
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2a396 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9UmZoJK0nyJTSttQJK5fSkBToFYzAhLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 5 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 32d4d5743eb36..288f84c33275f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_mode;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_mode)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP_ULL((u64)mode->htotal * mode->vtotal,
+					 mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2623,7 +2655,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2635,6 +2668,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_mode = mst_active;
+
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
@@ -2666,6 +2701,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2703,6 +2742,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_mode = false;
+
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2882,6 +2923,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_mode = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b49..41a69447001cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -59,4 +60,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed899fcc91891..4862d0b42f290 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -679,7 +679,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1525,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 		return;
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 83117e7619f31..472429d092009 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 265da58e064cc..9263e61c794c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -330,6 +330,7 @@
 #define MMSS_DP1_SDP_CFG3			(0x000004e8)
 #define REG_DP_DP0_RG				(0x000004f8)
 #define REG_DP_DP1_RG				(0x000004fc)
+#define REG_DP_MST_ACT				(0x00000500)
 
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)

-- 
2.43.0


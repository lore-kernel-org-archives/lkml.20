Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286518;
	b=fXx3yUQZbFIIwKtbwygAFvHhV5I2UUYFyoXvxhrmLLeYzvknR5/pl4nmRnwMtmrRsrYl
	 FVgTbUMIQeZXnVrH80rXdzldxI4c0aWajmJu9FPJba5Ril43vXnS5ZU5o9Erfudmlu9Lo
	 jpevNzkQDCIBkQrVJUHmcVQjomSXexOpc0/iWl/LzHXHJzbAxxnSUX16KbX4/liQNbXnr
	 IMlpYswsr9KPRiR2BJpn1D3mbZUlbwDGboj84EshiCti9Am+4tyVgb+ces285wZ+BLO6E
	 BMfHZ5kdfeQ1GfRAGjxb/yC2T2Rnwb+vObjG0Ky0/qLHBWMJLfX/m2QTkvnP2cOa0vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E+qyh0jetayrxs5tFWgrW+8697V0epCTw7HkDfY3pGk=;
	b=AZ5FFrtZlNYceTzLkEzDcZfTUeDpMbASmqYsHddpP2ehwsZGAG8ORPZO+JIKOHlqpVqe
	 O0pkRPJi572QnR0aQlLP3GFG/pEgkLeuC7TKj9P7CtwjRqEXeWH6RbqTjc7dVp9YSkE0w
	 IKY81IJhS3g+7DHLayVlFdBpSoNEKAIdrQufpBDY2JXcyyvlk52LZO+HYtH+FjU0GYaTl
	 k8sw6Gzo13Ptc9t6dSV8TaQjkJCdek7CtP+CfrtONNohsqNN6ar3T+t3SPYLT0F0AHaL3
	 p9ESrtDIkMguFPJIw4L8eLShhxadAUXrAtdbWB/bbqDhWbGHVbh7UymaOuYCxYvoZdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bmy36vgv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STNliMzo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E9606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4E9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bmy36vgv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STNliMzo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ADGo2295639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+qyh0jetayrxs5tFWgrW+8697V0epCTw7HkDfY3pGk=; b=Bmy36vgvIu1nzbVC
	VZ4l79wCFXD11e99RKFk8xFo4Sv5Ez+ZRCxthfiB9jeOzKPJN5XbN9oQccTBqEos
	PVOj9O7OP/9/9tuP3yuzu517aiWFUQOufpKeZpzXzXt6l6rnH6bZ0iJlwZkVFNqT
	8EibzyJ6eE9jTlMS1uCyESC350/09N2ILeiTJ46ERsBwIm+cqYBgR3oL6QcgtSYu
	kfBYU0onVObV77WPZrjfz+2S+IxYkCajm8mlD55KMiCvZy3nMH+GdHWNJmocmavh
	Tjiq7cXHmMCm+C2Zyee8FpwuZh0blUjFwzMYhX3VDfdbGJtWdy57adDXf4WdqNG3
	vVgrcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5un81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so275547385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286516; x=1794891316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+qyh0jetayrxs5tFWgrW+8697V0epCTw7HkDfY3pGk=;
        b=STNliMzou8dePqY2icJAcHKd5ZeXiDed/mU/otPZU1ts3JARJgLhuriCRTBItBV4Uv
         HMtZ6NcofpRlbD81gdd9eDdUnkAAEid1F7L9H6W/nWnCNst6NIjfEszIugfRGYLi3B9F
         6AuDgSJGDCUL7XbqBZQ9vPMb0tLIJANt+20zXaG8lciDlpjeOmqrvi1HqWQZZJv72l6j
         nt3VQ39Wrm+QLmgq9zy4r2k4sbqSoWJdkdmu77li0Mwt3szH+FtfPnrjOGgNobtq60AL
         Fio0H/gnQhil2dAzKEVnZ5eacL8NqlliOM0bY3koXj5EtiE5SgI44S7xP5oScKI+PtHy
         ip0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286516; x=1794891316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+qyh0jetayrxs5tFWgrW+8697V0epCTw7HkDfY3pGk=;
        b=yhg2ED8mc2PbP3IoSGKV5PUz0TDtcc79vKwL6sAtv/OEbZV4oZSJRcWBP+rAkFTr0i
         JKkJ3kQB8eLnxhLjFTFNZApTYoJT9EBhOmVJePI+fzS2eAjdljZWdl4AL6QpGx/Y/8x1
         a82lBOT06jP7/em7rkc4Bod/mz+GAi/Al6px135CsmFd5hC/H5v8qq7zzSblSmRG5YEC
         KCLEj4nXk93w0Dvo2kbzksoQ/t4jB546OXuKu/HMvO5wmnS5VUKExH+3rsUXi1OnS+3Q
         LDvzeJbqo9MND1fm5xLrEuCHYbHFZdBXOaJotATD/0jbUEsBjrzPDcALrzV7G20bh7c9
         miqg==
X-Forwarded-Encrypted: i=1; AL+hErGNdJEPaUsG5lL2AB3/uJG4W4fI5hJorSXe0mzql6/0rmcVr/koJLk9z5ynLD50UqZNMuknHYonEBObNTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QI4Z8E4TzIQpk6QPHlwdDNReR+4H+AuB+MfEnYHxwxXusqApX
	tmEcZXWGqmVl5BiM8CBtsqypvuyXOmU07kFT1yA+7+EsmZRzX/+g9hqrp4i/15iaU8PEkycDTMd
	ZpC+q8zejRqNnj011sfnahUh/u9vbeGu/wiA0YrINeI6flF1KYrPf6hToSDz1VPWTVQE=
X-Gm-Gg: AYBFou390TTMauJJISb9WhhFlBv+r80oVIdEd9WmhqE3zgd7DIjik+xf1HtN+w1XZPY
	0HFhz+WFCBlMT9+KzstN+Rp4ItDWgHsYrIQUT6kPJ8gdOB+KQV/6MmXO20zSRaga87fTdOi+GWR
	IxdxBrwbJxiTnHL13TSARYwyJXmiEiuQaBAS+pWZt7rU6Tws4ht2sp4gp+Dld8yyxb4vd9oXYmv
	l5FHDdt93nCV+KBlpKqzhkbK3jUWCHT/KalhhrN2NG9F6BnnD3Ndr8se9d9lkLn2Sh/YQwPf9DC
	T91yuv+UmnmwEAPf+HrWoFfg8RhSnUKxLOKbr9wptT5XqpLxit3H85QHTmJ40M8JtM51trTjk2C
	lraGznwLRrIqOZIRJfj5P8cUlCPYVxPacRQrwIT0TRhwdZUCcnoM+M0qa0hkn1uR4SKwYnYe4lS
	/c9qbhf4A8BJMK6nmKHlUUsfpQYZM+S3b1aPE/
X-Received: by 2002:a05:620a:17a4:b0:93e:c12c:43f9 with SMTP id af79cd13be357-9479f36e08fmr267942385a.70.1794286515887;
        Mon, 09 Nov 2026 20:55:15 -0800 (PST)
X-Received: by 2002:a05:620a:17a4:b0:93e:c12c:43f9 with SMTP id af79cd13be357-9479f36e08fmr267940685a.70.1794286515362;
        Mon, 09 Nov 2026 20:55:15 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:14 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:29 +0800
Subject: [PATCH v8 08/29] drm/msm/dp: replace power_on with
 active_stream_mask
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
Message-Id: <20261110-msm-dp-mst-v8-8-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=6983;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=lf2boYn4jRL809HHeb3AhObsMa4DRl0sadT8kljernk=;
 b=F7VoRy/xhM7IFdtGf//nN2VT9hFh6/qQlUvMODHseq+WOl81W29Y91n5oUKMVs7+1cTvw5dgb
 g99EOLgh7P/Dxrk17fSw1kvVQMzE167zMQfHjT7WsDu3EF7rSk9S2NX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9UHeOLMnycco
 58haEDYvgVrBucpvIiCXeZ9bAN4p1EbcVKWZmLk/hOa8PY5lI2CIZYxY+tRb0dD2nKIvZBKlXue
 Q8C4VmdJNeNGkIYehx7bfNoAnmWA9Z0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+MsrfMnoshYh
 eh6ojafq2D72lyXATsKpz3jTfb292PpJA8vTDxJO6DyT+CkivIKofBlY3uh7s8vPcuksmfCaf6I
 9MF2qGy+sPubhZMyX0ckouqtP0w8raOjIZn+dSFDRr7ESZSwIMnU1SgGar7uMqO4qHJhJHXVlP8
 TXzREsVQaG7ovBcEOCMwYzj2+cvmwDhrIAu6SX+V8SysDATvMbgzMPqndTLateQk+idXQvKsQ4F
 d8AfPgZwIFlhFcD8KR63WA9JoYcxCb/EUNoRwohaQfyCgc898TjtEmKQ2dGOmCNO5opB59Quq6S
 jtFYo/whhD7PkuB/eE1GAPXyRzUnxd543R9ZxTelj/kzIfIQ+3d9vkbxOj5pp83XF6EuvXivJso
 CLc4nYLQ47dsHMgal0z06kN3agnKF58z9+coKtxdo1F60m01kbSiGkPITN9x+9Sf0fjbFQRhDKE
 mE3Z8yMBfCiQFThdztw==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2a3b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OPa7gS6xof81t_cfdRgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Toj57rLift4WXx_oxIU6AUYEOVACk2zV
X-Proofpoint-GUID: Toj57rLift4WXx_oxIU6AUYEOVACk2zV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The power_on boolean cannot represent DP MST, where multiple streams
share a single link and its associated resources.

Replace power_on with active_stream_mask, a bitmask of the streams that
have been successfully enabled, and use it to track the lifetime of the
shared link. Link initialization is performed when enabling the first
stream, while link teardown is deferred until the last stream is
disabled.

A per-stream bit rather than a count is needed because two callers ask
whether one specific stream is up: msm_dp_display_disable() uses it to
stay idempotent, and msm_dp_display_disable_helper() uses it to tell
whether that stream ever made it through .atomic_enable().

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index df222943ae57f..05972a302e542 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on)
+	if (!msm_dp_display->active_stream_mask)
 		goto end;
 
 	audio = msm_dp_audio_get_data(msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e046184a30f50..169990c10b367 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -652,16 +652,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_mask) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			// TODO: schedule drm_connector_set_link_status_property()
+			return rc;
+		}
 	}
 
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
@@ -671,21 +671,19 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel,
 				 const struct msm_dp_mst_slot_info *slots)
 {
-	int rc = 0;
+	int rc;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active,
 				   slots);
-	if (!rc)
-		msm_dp_display->power_on = true;
+	if (rc)
+		return rc;
 
-	return rc;
+	msm_dp_display->active_stream_mask |= BIT(msm_dp_panel->stream_id);
+
+	return 0;
 }
 
 static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
@@ -732,9 +730,11 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
+	if (!(msm_dp_display->active_stream_mask & BIT(msm_dp_panel->stream_id)))
 		return 0;
 
+	msm_dp_display->active_stream_mask &= ~BIT(msm_dp_panel->stream_id);
+
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
@@ -851,10 +851,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * if we are reading registers we need the link clocks to be on
 	 * however till DP cable is connected this will not happen as we
 	 * do not know the resolution to power up with. Hence check the
-	 * power_on status before dumping DP registers to avoid crash due
+	 * active stream state before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_mask)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1514,16 +1514,17 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
-	 * case - the mainlink was never brought up and ->power_on stayed false.
-	 * Driving the PUSH_IDLE pattern into a controller that was never
-	 * enabled times out, and .atomic_post_disable() then drops the
-	 * controller's runtime-PM reference without tearing the PHY back down,
-	 * because msm_dp_display_disable() returns early on !power_on.  On
+	 * case - the mainlink was never brought up and the stream was never
+	 * marked active in ->active_stream_mask.  Driving the PUSH_IDLE pattern
+	 * into a controller that was never enabled times out, and
+	 * .atomic_post_disable() then drops the controller's runtime-PM
+	 * reference without tearing the PHY back down, because
+	 * msm_dp_display_disable() returns early for an inactive stream.  On
 	 * glymur (Snapdragon X2 Elite) that combination is answered by a
 	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
 	 * There is nothing to push idle, so leave it alone.
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_mask)
 		return;
 
 	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
@@ -1535,6 +1536,11 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	if (msm_dp_display->active_stream_mask) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1547,8 +1553,6 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	else
 		msm_dp_display_host_phy_exit(dp);
 
-	msm_dp_display->power_on = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 472429d092009..b163954deafcd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_mask;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0


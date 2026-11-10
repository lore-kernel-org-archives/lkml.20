Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286532;
	b=Q33WIIfv/SfTDwDx73uaO02C4cpOIgCRdKM0i4AuIl79GqVp0fMk4xdNFYbJJSb2nvzK
	 4LEjROzbask+lK6NRcOEk53rpgVW95yEZGA11RK/Sa0GirRVmhJpCw4y9XZBPBgJs9p70
	 IkKHvv+wofWvdsggSN6HFoSEjKm8WvSDItgqz8bytiaZTWWGn+zMet4X5h1r6SFCp1NIk
	 4MkiSCWAukElw6TPl/N8KddIvi+QFe7wBeS+RULg1UYAIdciiWWqL0mDP3xJ0eVNTI7Rm
	 NahA3FNssAihI1vxn+P0hDxit5RntEuMk9L/TOlWqrGojr8SaslHveztWqk3p3YAgFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
	b=FLX1qpF8+MrpUOTbC9UhT75hpBLjVFzA7gC74xox8JVgfC+SL62JeuEfSpqMwSlVxb9M
	 nHP6Q/8YUq6/ix/k2jVqJndkkDbmj0FW6XZ9WsLsycy39cBpUQl9dkmu6gpddNRbeJ7OW
	 J1IDcOCyQHmve2i9w3PdKpo157W7uaqs+7OBMML+TDqH/u2HZ/QoYigSDmBibitQl3DLg
	 VxkTiRxP1fh/6NV1T5rLVsARFPtUTaR+AcE1ZJDLgXP1i4T1GRZNReTUgzNkLhSvg4UuX
	 QK0fbkuOGkj2I6cpeO+IzqLEWCT5CnTHpm5LThn9qHeNd73+Y1nLZ9r+uUupkRyM0Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUAPswNr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0kj3J4L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C5A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUAPswNr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0kj3J4L
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ANUr2250204
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=; b=EUAPswNrY/FqCzhk
	opTIYtUWnW/pSG4BsgZrfINQHYfFU3oVJa/6vAAJKnRJcJm9p+kA2RIzFiYUbIH0
	xgCP7uHbnVRDWZfI+9hUKGYz2E7ijUTVE2AI8l6JpJMcPXLr0gHyaVVfzFON3Mp3
	toNyCmEyMSnsyGGrEDXI5J9eO8EtLJmDYffr67KVfT9AQzDHQeWFNIW68d+V5sbB
	y9E/DmOV68EUgJWiElNWTzwFx1rNZcgWBznGOGmLTkSBhPScYk+KHztwopLFfALL
	cEgA/JebMAyOANS7tCxBk7Kql9QS1Mdy8RolZ+EQNdSZsJILt8nPd2MJF5FzXqYf
	Hz0vlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbps3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso337193385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286530; x=1794891330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
        b=b0kj3J4L292lAwEI+e8hcNfIz9PHGd5YA+vbmqlyo66uolBdDhKQS08NKlZ0uSa5Sm
         6WBNek4W2+Pu1MbGPC952rI/lcgw9t7KS0fOzABil8DKIqzno28wB75pTehv+AI+9tDX
         sVeHf0xSoPYvdP/vLrp1eLLm95KuL0TpX0L2+SJlNHazv+YVwD6fynEdHDzlOJoVSqq/
         j5bnsFQ3KV4z0N88KUDlAZmmDKi1OK+oCRTV20B9U+HE3GgfbzAzQOol9WSmdqHRWeTm
         aG2yj3usLs2A/eUd/RXyOQoGYU/pldRw69XZlcTFbOMddDf5HOm9lE3Psd8jvskctUCb
         m8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286530; x=1794891330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
        b=VUDdLV2Mchi31gmIzyNSgeS32ucp99369PKhzGvGIH4DDRWAIHO1Vcdjgo7++krGDb
         TW9CYooJSi0xXFl2Un7NrzIbYQV6IT9xdr/GJuHVEknArebiVbdR+2s3Y78GK8E18GnX
         Zo35IDVSl6cho/aPX+8mUez2+BY39TaeqHwYg2VZzEM5fDiqO6hx4pKR8X//mtgwiY5b
         7o5sdFwTUutG9vutvU41DxA8P8awzQEkf3YF4uwzUsZ2GrjWC8MbkcljP0AAZ6YHWTRy
         0b/2gwPiZzZ6UMtR8Vj3ZTEyP/dI4Jo18xIKrSRHm1wvqqE3++EP84LoWZ+5C7FOaYX/
         DwnQ==
X-Forwarded-Encrypted: i=1; AL+hErHc9yBV0gNrFSNqjfqsKNpXRZ6FyiKidBUQBpBFyEX9IN87QGB7hEm7ZYbMfyQD9bVbVtpzYQ9u4FJ34Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gsdBm2hCbE5CTpxZA7PUDwZ5JhuZVgYz8bo+8VlU//vJPlWEj
	+/zRNVlIETCwwDKUQXQfxCdy3rcFn/BeTiJ9IZ4ass3roH03PhR9OpOxhIMqqHzq9hULVpVdFOI
	0gUTgLeNz2Wr7O7nMUKCXQ99IDNUVzSG+NqjdoWeWGMVWSINWt+SIwrQZ8cEcf9bun6E=
X-Gm-Gg: AYBFou0nTwUwYDt76Cp2whQ1ytrgE+6W4kEC/j9XNbNtPF35LG4LT8xHBb04wQo1gFF
	pw3xrau2fj7ByIl9qpnbewxwKwidC/m/IV7uPKPBBy0qlLILKQxYpMnJgFTHMIJtBS7Owdq9oe8
	8bQCqtIp3wiXVWV16NX2e70hjG7Fw5wQlivlHRq6+6vsH9t5oz4O4cEdt8ICe3GZRlJykfhfXT7
	PpBEdaeR1Jokbdpn4Unqd9j6dDTasgFfoSuBoQ1heR1LVTXAePhUHDXZkzW4G35VJJMaHzt81zN
	KyFtbJ3SESXO6UKcl7HS3/wApHCBcvhXldptDvWE602wqv6J+xC6JR+oN6fAowMhwE6oGJMhwe7
	c9VrO49zWRTWrE3ecA+Gva4vWSeH44WrLHrVx6DE8/5L6JW0dxmqCfHO+cc09+trLWTEusH9eOF
	tqghhS7fWFzOeSpSEbhJTWYA48fJnCaV48zzNW
X-Received: by 2002:a05:620a:4043:b0:93e:96e0:25b8 with SMTP id af79cd13be357-9479f331a08mr288348185a.42.1794286530038;
        Mon, 09 Nov 2026 20:55:30 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93e:96e0:25b8 with SMTP id af79cd13be357-9479f331a08mr288346385a.42.1794286529569;
        Mon, 09 Nov 2026 20:55:29 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:29 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:32 +0800
Subject: [PATCH v8 11/29] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
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
Message-Id: <20261110-msm-dp-mst-v8-11-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=3825;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=WcSG5FkGjNalbzWcrp4rU22MtewjiNFIQT7LAviddgU=;
 b=CQW0ge4y7W+gi7bpjyGppXezH87gJkcqHHx9M0FOpkHwRrL7RGlbZ5+5TymeIRA+CGgKKE2wH
 soK+ryFdyTzBw0MHMtuFHfi4UxxrBB50vAGEgbUxdLTzHBSqGlKdkqZ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXzC6xdoLELlb7
 fyfrEMcl1TM3dgzDRm0T7uEtKZF+Q1B4exw1Fs9PL0SXsnhowqTOvzyCpUqZDNb5/lXPM89ZqR7
 eeMOuu2vs8wAWfu7ef90sTbnyri1pSN7XLU5KWfTMNhhYEn5sK5+Sl1OHEeQhRRiz+gMbN0ex/T
 Krt7tzr10XmScsqkdP8AzQR35PkN5YWjdwQBn/ours7flyZQaPMQNkF06qK7fv84KfLgVzeIYYJ
 5vBYw3WZUkMS9gUDfxdMi/aPi/ttR7iyGDIXey2CNcXszF5VX629VI13/PrzkAsgA71RIYiaK6e
 IHwia1TdhdvTxCgs0/pz1JLvgxD9VpZNFBZ7fLAYxVD3eqJNwefCZKCDxjJ5VxZAdywsFaxwWbH
 71UFrORawIDt/YHW5lW5ZRntRPrH73r25cXVcEWgtYoQP27RkmxrJy2FpfapQ9aK96kG09bsFmx
 /UCgUEzapZPto7T5QqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX5GNXuBGqYEjw
 PdmwEYFOJ8mcaIdfuCiJ7J3bryD9GpTzxkqrzd1nJ5VH7wuZ2DlmjaVGx+LMvTHp9su0E0yn+Uk
 zOKj8PYbtzZ90luEVX5Tj9CUgv7JJI4=
X-Proofpoint-ORIG-GUID: iP3nAGWgONc3DL7J7lLqELrM1pnZ1oX2
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2a3c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iP3nAGWgONc3DL7J7lLqELrM1pnZ1oX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0b34db3bd5d2..06c370c5ea09 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3126,6 +3126,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9478f127c6d3..8db5f714519d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6a522cc71a2a..fa027659a079 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -536,6 +536,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b0b7570cb16c..96be45c3dc92 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


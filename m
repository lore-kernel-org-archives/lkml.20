Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286542;
	b=ffjOwtLMYnk2FM415k7niXgQgAUn57t2F24vsrd7HmpmgdLzGjTlk/vP4p10Locanzkk
	 OtVsTG/BxVWmVSZ6uCkItL3kUsbmDv58n8Oe5rZydcZz1r4WIysrDBVzJIS4yDLmZsgKL
	 pHAFEFMlVJpMTE0NLvazJoI3uULuU4mLNfQ6nr8zTyFBsJ7SyqLbCixaB6CdsAwv9k+w/
	 ZgaTXGDwaSKgZTOn2jdnD7jZew7eEDnrHxzk5USBwNmIS6Gx8JULT/OIItssSWahVexYh
	 nwW0L/bTQtXvGOvifugaYE2F9/8cbrMtAUFrwo07wf0yUgCwu3sDfzAmd13Jb1IRRBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
	b=t1bUPFCKL4X2JtlNBcnQAADZsz5qzSVfZQmP6cgRq/72hy+VsWb9lTescINyzby9ECKd
	 hFE5CZb128n8uNDnMN9F7g3aKeAtBP0HCm2n8wHFJJrTHBBvp/VjhvdLM1cNa3h+EJXAS
	 XZg+7x6sT+6fxBReNpmh1sdhXLq90rHRYB+QCNw4tc6F7NcAwlIT0cMV96dUMFbupLSjl
	 pOQsYdR7gH/Ve9EKWw3Klk12hqn7yGchF8euh6kKaPVIQFjmUB2ZlAWfVi35GGi0DewZn
	 rdE8wAomTOdctr0TPgIQa7FcsHxebp1Pm97rrsvprzRRjWT635x5BKlNOTRTICozj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKyu38K0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXKrV0Jr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98307606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98307606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKyu38K0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXKrV0Jr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9L72919655
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=; b=bKyu38K0bRLLIbYv
	tfhCnSQqlrZuiUZVn2DH9puUTYCSALeNfz5A/30vymA7SRhz0OI/ZbSeKgXOSgaN
	VxFETITIFYh+5+RiHDvMaCWkkCUys49HskYG84BhJHc3i4UnVx8K0CReZtYLpOIF
	YYdyaobVb3limEdqwmc1fntU+h7W/18mVkK/eR/T4ZmbudaUasTxWdTYI6d3rQy+
	US9GKmm3YIbJDiawtoIsusArPfPTleOFpcPv8VChr8Qpwz37IhctCS8+UbZLhczG
	NwxHrOOiRsj/C94hs0TEDSqx8nF984x+47GhgaGLWTI4Xj3RxV2sWWTA+/KClSe8
	8BqS+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1qvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so351513085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286540; x=1794891340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=MXKrV0Jr7lGcqyHXoDwIPniyziNRX9cQrk3+jm30E58I4i9bhoVNbRqJMdZHrJ0tg3
         vJ7sXSrdmwn7VAx9GvysaBhfxdD5J7TGV5DpN6XQgpcwUQ0feRSUOQFqnHBa9YZWwbgQ
         DJ9bR/gqsGS2wwuutYxvCJxcWDtIHxrwlHbxIJSW+6gICu+uk0zANh3m9BniJ/bprlin
         necgpHeB+X3kMn9qJsGfu3CzsjTqP7vgV5j4sTlfw59/esY9UwoZXGIROmQ9ZPPL7BMe
         cne+uvxb1FzHtFJnOLGVXgiC7ChcA0nEFirOijSkX86LhUSYrZkLOvzb+IvX4M3K3y9+
         f/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286540; x=1794891340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=uJVgZQnOAi6tHbhQ5xaAk+Mge0RbwhEVlucres2Bt4/U+j/ecAHS2eqOhpSBHXTJO5
         M9MxzWWlme95klCwd27nmriuwZn95tipADmLs56CfdFtKzKvz32xGN0sSWjzOsrC5wej
         cm1yjkRe4B4cDhLrqUGNUR0VrnGiv3mrZQUXCWFn9FHgsFc9CumNEyPQh4aISkcBIED8
         5aiwPHYbgpdryjYq0s8gLU7q7wtYWjdYO45k18/xiL8Xyyh4pZgct5X74P9egqiyqxcP
         qfcDqbHs7uuRNSwjWMPanI0JprwnZI/mHzyDkZIRM9znATYOdH3UZ7xWlAoskuu4J6mr
         tr/Q==
X-Forwarded-Encrypted: i=1; AL+hErHFJsc/hJx3eEVh8/Q5gyfgLpn0ghEtTigJjONPOJ81tzNyU6MgdZItcmhN7caC53bcnDkCtt6G55cXJDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q8wSIRyzW8ujhDJ8+p53ZYEtTb+QJDWjMVDZNNL2wUwlhVdZZ
	wc4p97diQiopTDMlrg21T6LOAS/UIEf8K7y338eVe2W3II7J+nQ9CQkVFKvvhN0z0VkrC62Uym1
	do6+O2owmlvge9xpqYEDvgg37M6zY2kSVyAFb0ioNNxZjk8RWUMrUmUkDg32/4Ov1NF8=
X-Gm-Gg: AYBFou0FC/iTsEEG9Gz7HZLPHV0fK3X5I6cyi8CtqYSJTUX2Ue2LPWKJuYuDchUT1ti
	/PPiMQYtDjiCXJDvjdzpfimkjfuZbB0z0Hhr7xpHLVppzfpP+blTH9Qn8QeLWaQ+BVkFAHVefod
	G8ollRstezdT0O5wWZb/MZwfQYyKVfqb0iFnLjFgpvCvhOf28u3kQU6PYOPjl2VX5utkOZ8HEuQ
	WTmu3OKQyyEhSNop3xuB8cIwvJih53tvyJr6L8eLF7M0Vu1zihG/QFmZjs68HQ3wO3vmfrAO8Tx
	9wXgIPge/cflhS51pWt4J0zYYSzwRjRyvVy8R3l7mVuAx/WWJAIArCFhfrIlY1EwUVbhelUU2r0
	Lk7pBoOkq2rF0CD1MRvtOMki7V27hiJp4/Tg2Y2EFw42/D2cU1oq8gEmADbRDng6H37rtPBup/+
	AmVJzoUvaN7dHSsVkoyitTannId53CwHvN4B9G
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f137 with SMTP id af79cd13be357-9479f368c54mr242416185a.82.1794286539624;
        Mon, 09 Nov 2026 20:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f137 with SMTP id af79cd13be357-9479f368c54mr242413785a.82.1794286539085;
        Mon, 09 Nov 2026 20:55:39 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:38 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:34 +0800
Subject: [PATCH v8 13/29] drm/msm/dp: add MST connector creation and
 topology callbacks
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
Message-Id: <20261110-msm-dp-mst-v8-13-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=9238;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RagWELnNOcsg5yVGhJwCjO68hxskqfF9xg+etUHxKNA=;
 b=VNZLQvBzIovnQEo//j54Sxz60WoY88QHQ7/ZIPlr2SaVxccoYz7U7GthjZdMXXc0W39EslYk8
 MJuEmwuyPpCBbvNUMyWSSVR1hjYwRefL9BU0WipAvFhUVY4UQE6rxKp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX19z9sw0Nmws8
 6TkdPfJix/9F6kLweJi2BfeDBvTU94pwLqvLUk2w1tyeUIqpHI0UmPqCIjAMvcxY8AZq1W62r/G
 ZTUOjHFEfIIUXTHFCxe+iRijE6zNmG01lJtED/7sgBMTE7c18XUmPAdmWuGU7M3mOQqNzf7iQkc
 GvoYLF128EBbbJjQNHQnJh0bkAhv0K8/CXml4RQHKUVtqJxuvBojlaSYuCROLAxFgOxnrEdOmgw
 Qv1zY/2cgat8zgQy7gkY9IX/QFixEevT65u3U/1qNEIhtFGKpyOv+Xrk3Nt7nZTI+XOgHHn8rcF
 cGXbau9DPNc7fSucXpfcmYfjrKfbxnohj6ue8x2U41CDSX948iCFHUNK4EsYPKp0E3qEp8JycJS
 AUPE5QaMeo0jOWVLoLib1YsygrpdgHCYn8Cey2NHNq7Aa6fTROV/h79cJcWZqn2yzb6niJ7NTQP
 PHN6iRuAQSiSiRiGPjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXyh/nJMluu9rK
 4I8zM0qHIbcu18gvkX1PRkZCIKmw4vhkjcdqACmUAo150fTEG65z1hNVzhrCaprgrtHW3uVoRPY
 FUAOu2Uq2HI8U2vKp4lw9TkUowGZ1f4=
X-Proofpoint-GUID: RaempZA6Awe1TCP-jxISoBmB_gn6dJ-r
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2a3cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n5AsotsA7IsgDgQ4TjYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RaempZA6Awe1TCP-jxISoBmB_gn6dJ-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

Register the add_connector topology callback with the DRM MST manager
to create DRM connectors dynamically for MST ports as they appear.

Each MST port is represented by a DRM connector. The connectors are
attached to all available MST stream encoders, allowing encoder
assignment to be determined dynamically rather than being permanently
associated with a specific stream.

This enables MST sink ports to be exposed as DRM connectors.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 242 ++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 5d22aa34c521..a2900ff3b0ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,10 +7,20 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
 
+#define to_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_mst *dp_mst;
+};
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -25,6 +35,237 @@ struct msm_dp_mst {
 	u32 max_streams;
 };
 
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = &dp_display->pdev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	if (!dp_display->mst_active)
+		return status;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	status = drm_dp_mst_detect_port(connector, ctx, &mst->mst_mgr,
+					mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+	int rc;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	rc = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return rc;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	/* Use minimum possible bpp (6bpc RGB, 8b10b) to avoid rejecting modes
+	 * that would be feasible at the actual link bpp. mode_valid must not
+	 * depend on negotiated parameters.
+	 */
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
+					struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].stream_id;
+	}
+	return -1;
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *iter;
+	struct drm_connector_list_iter conn_iter;
+	u32 stream_mask = 0;
+	u32 i;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	if (conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	drm_connector_list_iter_begin(connector->dev, &conn_iter);
+	drm_for_each_connector_iter(iter, &conn_iter) {
+		struct drm_connector_state *peer_state;
+		int stream_id;
+
+		if (iter == connector ||
+		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
+		    to_dp_mst_connector(iter)->dp_mst != mst)
+			continue;
+
+		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
+		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
+			continue;
+
+		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
+		if (stream_id >= 0 && stream_id < mst->max_streams)
+			stream_mask |= BIT(stream_id);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!(stream_mask & BIT(i))) {
+			conn_state->best_encoder = mst->mst_encoders[i].enc;
+			return mst->mst_encoders[i].enc;
+		}
+	}
+
+	return NULL;
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+	struct drm_device *dev = mst->msm_dp->drm_dev;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+	if (!mst_conn)
+		return NULL;
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc)
+		goto err_free;
+
+	mst_conn->dp_mst = mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+	connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
+		if (rc) {
+			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
+				mst->mst_encoders[i].enc->base.id,
+				connector->base.id, rc);
+			goto err_connector;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+
+	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
+		    connector->base.id, mst->max_streams);
+
+	return connector;
+
+err_connector:
+	drm_connector_cleanup(connector);
+err_free:
+	kfree(mst_conn);
+	return NULL;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -35,6 +276,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0


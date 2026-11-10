Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286569;
	b=ka2gTh1zxOAWjnM9A2a8UpjEmUChBo/F+GwAzEErwJsNsyWBbk1toXgD5Ds00YQrMmSH
	 xTMYhwzKhN8x2LwUSTOge6vHPT6U51s4XW59BveJT1mVXyWdj1yGwlFSvVcxcRl14hhfu
	 hgd7lRcHI+vYhxfSEsKfjoaQ0fTO3cN8Hf48IkGUXl1UU4ApaKcJ5ZWWLaSC7nmMQVYhm
	 tPH5lkcBtyZ3J96POYhLF1fKYQ6IrOeAw8QHADOxNEus3t4y4MvcQsitzPp4DA6NEuFqD
	 qoz5aljEbtsp/Kv1vRPomsaAxHUKLOYB3lNgnjtnLyTSAmPNWTtUGqTG0wWemng/WyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
	b=c5c+xa/lNnUGGpIA7qeyUpPTpdHrypwp1BUZ65zMaDOcQAW3Aud8Uuopy1p0bKtUNhr4
	 DzX1T47WfKKxTWXHd83oSkO3QEXyYwG7TX4T4XFCLXK80Huvf4y26RYxF7wHxOz+BEQDm
	 pbOlBy8IkDY264LOyNISwtnJPObSGbJZ2Q+WOUPuxLUZD06UUDsk8srpXil6wiNRkxeST
	 5TZEbP1ZtXiVeu5Zi+SLES/JLbxGOF/jqvP6SBlaDG+Il37zen/Nef7J7T/h3BSZexQhg
	 JnqNq5hqc3IBYFfnoKx1+30KbUZxVFR5Q+YJ2R5hmsfAW8H3zBmuqvCCN5sQp2x5ycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YHR3wYzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaO9UJZU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A7606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YHR3wYzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaO9UJZU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ADjf2928656
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=; b=YHR3wYzQSEvp8hiq
	8+pZd/VLF32qWUtiQZwP76usI6A2RbG5YNx1DvUlbA3aZtXbs+pP31dwh6e8lA+Q
	Zt+c13J6GDnb5ZSwyYBYNXSRg1OnyKx0wk+s83brmvIMS1mhnpLx0NkxY23pY2ax
	LIG5cPfV4DoyGLcvia75UQGkT88JyJwFM3M5hmu/UkaGEBTOrYMNvgqAboRakjHv
	yAaP6qt9lgpVtarKOmNZC+j08TsUocIq/RH4TiWRX4BD6Wgz5nZ9j/j2BUCMVniQ
	HWcnwACveZd8vt0NynrxLdPZvOQ28obWQLihFeuEnLVjW6JungUOGZnCEoNu/loM
	r85MXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx830ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so313526785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286567; x=1794891367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=ZaO9UJZUeb4xIH8SBigdAsireSf4B+dk/FeMU9WekMcMJKSbQ8zYmkr3/K0UmQPNg1
         l5M8lcUvlB9Uh9L6J4BoHZ/Zjq2L+uKKKXuI5Dp73vFwYkxPMk/CZ3Sdl1yekDF4Two6
         4ihVRRmc42vaXQeFP1xg1X7VjiknrfU1ejo/4coeTmnbi3QGyELAlxNji4JQBVJT1h26
         M8XH+fQfYZYX+dzdwWnTfA80sR9rhVVCgXqSuKngR3UYuIC1sVpwDOyUZV+AipN6Zjay
         CkZITpBCqzCARyy5JIyUmhODznZTpRYzjnGIN1opMx12qTzfcKVSVyaY9OUamKDqrK7M
         +Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286567; x=1794891367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=sl6B3PWcOf1mM7r8FTgu584pGYLq7nxUpoB6I8C5MW9gtEK6Yj3UUx4eiDKhRedFoG
         yir92VMncG2Tb/3Fg+hGzzG4NEkY/JL86Zd5kszhZfPvpMjcW+5ibjrBkglGtEhZYAra
         QDWnF9Wg1nVQpjut8RmwTHI6zW/mRKH/sB36JU3arn8VzDiklgczgf8drfLu8sx8zJRv
         qAAaprji+jbyJkrNbkxZ7bFDxyVugYwrxLVn3EF0GEfvQGcs+zhaqPINRhdfyeOoTaGq
         I0u3fL84qpeqwduR6VyAAEcIL5xs/9eoiOvPI0XuMxYkfH68U1K2ca6ol5MQFMY9ZXvX
         +YBg==
X-Forwarded-Encrypted: i=1; AL+hErH7rV8TfaCBKBUnFB9hC7RaylZiUNFKrTGpjLCZ1HvfxUsxP5slBdJIEB692NTctpAQZslfVNhpX4vlj+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CLYXo3AzpygglF1OQOHocbULw21CK+c4tEE/YhVc/nmX2X4Bd
	Qn97oezB4ZrpfDw6gpKVq3G6srUMyU159Re5hG126mX0k8z2XywR2v9XQEvVwwH53sxBu4PyVzQ
	4KIqFMSgz23NKZZYNIbbJ7A4oItEqtsm+vLM7z6CPmdY1JYqVgZZPZyZAAiPPxQxOr8E=
X-Gm-Gg: AYBFou067Xw2eWIkx8Wuw5F9ny7E4HoMa8IWO6wLJ2imNeGWpFi42g1TStz7yaIHQ6m
	okfElSgsHBRjPTPAAFDXffweeUofTj8T/8J9qjF7jLStFbkvEPwC8NEZeN+5uBxPIWOA5MNZLUU
	RXjZmOfdHwHkRiUYgDvTOWgC3H2pBZ0+2Nv5Zn+zPq5ZwjAr+WNNgOIRQ7EgGlRL31tkL/5YKd0
	8pFPf2v7Ksfhr7e6yr66nESKSF9VZOYiDUfS/AWDtuyjjWSkF1bkGBcOugihkgSzbqZPKU7MJTL
	Kl7qRIqzH19sCEqPjirZNJivvv+rYpYOltr4vrcpTMNRK3EfPMAkXR42Tp4qAm30V9jF0JbBHqv
	UVBjAE+E/TnAJp9lCikDT/lQCM6V9Vv5v+gPjH2BJ9KaT7BnuiGLlbROWIZntsrKvgXhj4dvMB8
	SVx6JGTy1iZqCfUUlNW700/vtGib6oidzyfJeX
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr256099185a.23.1794286567414;
        Mon, 09 Nov 2026 20:56:07 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr256097185a.23.1794286566975;
        Mon, 09 Nov 2026 20:56:06 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:06 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:40 +0800
Subject: [PATCH v8 19/29] drm/bridge_connector: suppress hotplug for
 IRQ_HPD without status changes
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
Message-Id: <20261110-msm-dp-mst-v8-19-d040fb33db5f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2989;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kGM6WlVxmPmHaLD/xSO0chVTuHvRgAil4JXoPE4JTA8=;
 b=8bc0gtObWWBr48PlvW73gguPpwsu+5HEpzjCr6F4hIY3Wfdk49PR5EXvKzOk87iwF0MiTJ4Y+
 o9xrx+nvqv+AufuLO2jgAimhjGFQ3I+/dnJOOyhmKUo0iR1u+9PJxET
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2a3e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XU51oE-CMt0mn-qX91oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jE7KLaMZ7nTUVakn0Iqco0XYk8vsapnq
X-Proofpoint-ORIG-GUID: jE7KLaMZ7nTUVakn0Iqco0XYk8vsapnq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+XAF0haPj9Xz
 sSwKsgp0zENj7ieg7B3WwxVRnvNrAqtBoctLyLrGi7iq8v5VridI6JinomL349ubsXybFURZnnq
 YaGMbV2ToJs/wQKVjLsVS2fg62sD9b0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX0jqCDjvcC5e6
 3sOUjb510IcnXCsKhrx9C56a/Ou2i3bco+SLwzxcxBdZzNNCPErOlSPCnX6Gp3Vf2fXiocnl7bu
 nmCjprlPTe2CQO8LRkvPdJbLrKDQQAtoyeLSgMOi2wt2nHglBJFqGL2xCN5Ayq4PCai9que/+bX
 MHZ5NsI0SxzWDOkQLSgBxxnR3/PAU0KCKjSM715i/rrzLpznJOpChQ6Zv56X2E4sFoB12DCyEo8
 PKxgEc2UP0Wu+KsyJatMzzoX6qMbemjyfQluu3+bTEoIr7YG23d0/VESEw2BrGZ7pY0qgJcRQs6
 HIrD3ha+KC+GP004KCKdk0xQojEGgypqESHLmc4ACyNOe9HR1SrrEWoj+VlimGJqK5PoseGKsmW
 GyYUv+Luwq1WdCI2TwmcvMlYKjaUxRl7yfjD5XKfktZJo/OPXtraNcHs/kLivZRRw+Ogq49l/kQ
 MwZ/TZufl0u8YOpl81Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

DP IRQ_HPD does not necessarily indicate a display connection change.
It can also signal link status changes or pending MST messages, which
need bridge-side handling but do not necessarily require userspace to
reprobe the connector.

Currently, the HPD handler sends a hotplug event for every notification,
without distinguishing ordinary HPD from IRQ_HPD. This causes IRQ_HPD
notifications with no connection change to trigger unnecessary connector
reprobes.

However, filtering out all IRQ_HPD notifications would also discard
hotplug events for downstream display connection changes on a DP branch,
where upstream HPD can remain asserted. The decision therefore needs to
use the actual connector status after handling the notification, rather
than the raw HPD status reported by the event.

Pass the event to the bridge chain first, then call the bridge .detect()
callback to update connector->status. Fall back to the reported status
when no .detect() callback is available. For IRQ_HPD, send a hotplug event
only when the connector status changes, suppressing IRQ-only notifications
while preserving notifications for downstream connection changes.

Keep hotplug events unconditional for ordinary HPD notifications. An
earlier detect may already have updated the connection status before
subsequent plug handling reads the EDID, so a reprobe is still needed.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 4ade63306653..1d4502126bff 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -160,15 +160,25 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_bridge *detect = drm_bridge_connector->bridge_detect;
 	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status, new_status;
+	bool level_hpd;
+	bool changed;
 
-	mutex_lock(&dev->mode_config.mutex);
-	connector->status = status;
-	mutex_unlock(&dev->mode_config.mutex);
+	level_hpd = event == DRM_CONNECTOR_NO_EXTRA_STATUS;
 
 	drm_bridge_connector_hpd_notify(connector, status, event);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	mutex_lock(&dev->mode_config.mutex);
+	old_status = connector->status;
+	new_status = detect ? detect->funcs->detect(detect, connector) : status;
+	connector->status = new_status;
+	changed = new_status != old_status;
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed || level_hpd)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,

-- 
2.43.0


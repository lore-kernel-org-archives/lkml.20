Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675716;
	b=1y5ziO66/MnRf0KlFH3CE58WNK4nsaqHzSPdMns4W8YjG7ofbuSInz5t3apvyvdy5OqM
	 pvnDIgUUjmRu22m1qt85VEM5WOCLHdy6Ipl5IO6wtXcCJbJaPHczJEcJPvk/x7rC1zPx3
	 kucwg8t60OaF+/DDJ+8UCRtAvK3JuVlmAmL83hVhhaZ9Qsv6s8yB0uO6P+RrI7GIcOKz4
	 RKbZVPXLFgiZjLHceTiaIfx/3vnhRmP3uCZImWG5c468GoHuM65jTKXQckxrv6JzPrgjk
	 8Ua1mWpejC9TZLqpQIEOuqEO8LfQLaG7RqMFFgWYVjPGpUXwAjamAxX/d6BLRgTCBAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
	b=N/zvd3doxJI0ysz9zz+y30/VR4MJkLIt/NJ+1UxqJNFofsnPqgebcvjWiv6MHzc21v2H
	 2pCAFH9duh+qZZI7X+QckoYIwtQ6MXrEKMJrlqFZfzCjlbJDqU+BUeIWlPFTKTBhXB+sa
	 /qnqQSTcagy8Qvox3Z+v0KLukOINm+QwNSnbT9RPoAxcYHSJZLB0vBWzdhlrLo4fFpKa2
	 MnCvmKKcvglmvC2VBiCWe16A+aJN6Krk1AtF2G+lX5ytCAINIaI6mlhTL/hpaoASjsygz
	 fkwzq+LIrz1bT5A9nDyl6gGvvMt500TvhM2K1rZClrYXeEWRZLNJ+aMWweceRh/Krjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5i2kilu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566260A4AD6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D566260A4AD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5i2kilu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06mm3115556
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=huq6+EdLHIG2IKh9
	fq+pBx8cZXxAlw6MNLQsBsBq/skklFtFTkH9mSCKnIther6jO1a/HCONVvYjnXN2
	QaDCt6zjurulTvzpcbiYaCRzfYZvR4c1oCAyDzlgxAPTxrJtmDUH2olZjhE0ztaT
	V6TNw4uaZ2X3NoG8Qp5GL6OFRwhDGX+7Z7cqCx/WnzXwzLURb4i7N2oPXwzAmGZg
	E4j7rsqN+RkR7XbGOp/uhX4utIY8PH1+EJ5AY8tegI2Q3Knpq+Leq6P/5u6+b1RX
	VdNA7E5J1CPiPvBlJK+4LT9ybakIaQavIzrJIYYj/wYjlKKRvoggcIiE3kj/agu4
	izt4BA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so298461285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675714; x=1793280514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=Z5i2kilu++16xLxnsoKZpr0Ld95+P3mk6K4ro/j8ZmtRJn2fDxSeDs9OmG7t136wKY
         nQEc261CG3IPaXNjA/ewbiY0N0Q73D8k8vs4OMQEB5Hhzzab9ovGJcWm4YUo7N5PO8vP
         IBFPt2RCAYDo624LFQACSU71Aawcq+FbBqwpTDg7r6Q6pSyJL9z41drq1MYRSz1w3Zyd
         4I0+VFHUIsFfDjL5kpSBu+b6f9tkfpcAAarCQKXE7tVlDVaFcwelkGgOAmE69L84Q993
         cIALQq0XdKeGzgqicS1rZQi8YCSHSV/ZdGbRpn9bMvtVCGHlQaJiRyPoiosYxVsMRDxJ
         PfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675714; x=1793280514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=b1Ae+wajTCoiv2h4vq07FV0EAD32kyr8AleUWDqdguDHfu9TfXQIRRelQfmgwIw+pg
         5bmaO2kAK+v3wP6ndzrKgrGjyLXV6RWnzj58F3NVPl3MCt8dybpUNdzwJU91sLYZsoEZ
         Xr9qEsMfyVOPkjLS8LmJu5rsqSU2R35+rvC5AIq/q0SdSIjCLt4lclh8BiE3rdu/qH4p
         /sVomlleJBGwJDOEhIhyXD5uyoWBlTHTFF3yEe8OnPNI+0qqiw3DC88N2CxTbWVx/RTn
         CehCEYXL+YWAMQT0DQUcL3R3ZF2dL6UQtN0xmQvHKtDc9fMDkwmQtiYw0Gph1gLF3W4A
         NwGg==
X-Forwarded-Encrypted: i=1; AKwUvBzDdvt1dzyqB/3jYeAJXqm8b0JPKRKMW3jvtm9wZijRlbAG3j/GxjmBVezNoLnK4IDvppn84zTyTo2XiZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzBVWe9HY1ZP+m3aXLHyy/uWue3xB4YAs74uq1FaPThOkd16QY
	I2WvuQ6G5Zv3C9wK7IzdWVIdRhiid+u9xD8lB1HFpmInFIm+jezCvzGHY671Ig9Un5LbAAsEg0F
	ZK5OUg7T/WIvXyjojLryELWy4NK5I2MKAApk6VJhq0xQcpRdsN9idPKP6OhpIMgtWtlA=
X-Gm-Gg: AYBFou2KlgeJM9TumWQJRyGlUiqis+5Sx0YbQO+mxkhOVU5u6kJ753dymKUX8CgDzN2
	+Mnb8NWx+GvH55hEeUZkUCvK2D4CjzQi9gZRSJSKR8PnEAR4XNSiUvI5BTGFgsHZW6a3RECG0kb
	biEhPjtJnRZvKoJWgUNcjxVx1LsggT6nSE8HJW/frC0I7DjiCboSm5XA8ycs7USLw+fcg63E6fY
	UYSgiAfVElaUvZAQfFQULDwFpi9Utn0RHQG6NSJ+ic+zpzFW44clSNueozXhQyStXTevP/BcZX0
	LZkfbPaiiJZvGipi1GJTl8Vu1W7raZmjXjhuXAkhiouaGBmdrbmjPIUXjk8NXf/QCg9NvEV2yHY
	aS9HIvTkA/y4nyqzaS15rhcSY5SoiyEXARacIyYFPx82vRG5O950Amz27PcIx1HcRe3eoKb24Ky
	0ZFOqJe/0YNLNG
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860581685a.4.1792675714403;
        Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860577785a.4.1792675713861;
        Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:04 +0300
Subject: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
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
Message-Id: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9oUOGyoZ/Lo9msFFhzc2wcKn57bx/TRaPi0
 NP7H+uDIseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPaAAKCRCLPIo+Aiko
 1Qn/CACG1K4eJynq5qB7lVOT6butQGOdb0Uhg1y7eGfXBUIIGj1DRv6ecFzKRRK0bqqp6pcC5ci
 EIrQitRmOJrdtYWSEpurrdG1g8G+KPLJUhVNQEysupJKk1UtdeTjjfLKzFo0433HZaIXhfDpj3N
 K3momphg+N2wrPSqKOypSco4Z/DK1vaIXXYy+0UWhUxrrYMXstFcdV6IsFrEXkcVoNcdL9pxLls
 IJxAjrrVY16uL/yTOwggUx66Zvog/fgGXfehXKJwmzjWKCAkhWW369L1wPJ5HGNAbqCPvQESo/X
 5Wj+blNVgBLSYe62VO2WdSqoGusXFkACUWYMezRkF7KbPzw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5y9JXD1VK9rt
 oMcJBxorvKaThIULod1Uc+kuDm4333lerBZdPCACg2h+6AEKC75z22psS634WmxX2GXNL3olbcf
 IbyOsjK9dAvh3TXW7Lj7Q+zSSx17fOw=
X-Proofpoint-GUID: J1eHKCfmKRt_Ns4n4y-JAda16ZWCMrQh
X-Proofpoint-ORIG-GUID: J1eHKCfmKRt_Ns4n4y-JAda16ZWCMrQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5sB2fhfTxOst
 M3g3zw/9+/3xH59Cd+UJQJ3pipEsJ7jFFIMgg7Vbe2SGS9McCiRn8nKdAQ+Nw2UY+WyXizN2p5+
 TQErCqAM95GnCGj6OLOfaLQorcGTg8SBlM7PcmEe6rYu714lsIC9oYrRwk8VYZSgojzgh8vJx2b
 eyLPC8sqKhpB0r4sjYErgI3DarNMPHiCpT3qD+6S5+z0zW1qYhAvtZWcGjJ5RLN3MIHwBpjtpXL
 o4otNdYzRHAjswYpDfBUYLZwVF/kIRNvO10FUjiFKIE8aZElqBOgumD+bieALizN4SwSJEf2qX7
 sGLP91CqnLoWYByCVeDikZPUhxWBnI+Yqzmt1jn3ouOz9IqzVezqLWrHCdRlTMWmCh5rrLfc1nl
 koPi5KFw+Siicscgckonn2sTanzZAQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f83 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


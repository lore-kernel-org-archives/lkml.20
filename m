Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286607;
	b=UO5Q6lWkOYGZryp3nYehUq0DRHmUfQjBtf4GAG5eoEuMF2FJtstkhoNy5CC1eDbqoSTR
	 nAdvTOx7Q59U+N9NMHGMAig2uJVC7UFPEjlMohaIT178c4bFiRroOiaQdxxFrZmLSfbkK
	 rsk907PWYCn3YlJfmLp4ZlS/iAMlFn+Q3fGuzLmFZeEN5tCiiMoUEvsUC1ssjmEXE8e2L
	 Hb60lMDxk0TIXBbUG+9Rk8YaGbcmGuB6wtLCyZnnuDXCqTCkubebjmSk55cn2oCH7t5ad
	 z7ApRQC5rruUZTKI+1gplQMuq4MKv4sAA2RBN8mzNvjgNayC6pl4Z6TN5LpJEx/4RcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
	b=ishT+llWYm/2OqM/kbHgcr8Qpds2XUDD4MCzRTFKKeX7ybeXT9+kcEFtDsLFiYtLJ7P2
	 9DotIRI9y+UeJ4VBOgZ4VbMdFgOy5GpaG2m8ZmPpRWSXeDTARykd914k2qKG7MK5lFOgI
	 xHXKMsJEl8Lxn3rrvpmJQxlz7GoBnA7quBT5buO7qvXjcxG29Y/KXPyFSglYzy0bKBoQU
	 DMNKLl+j8petuU+xp5urnTX8InXOGapH+c9oZu1kBiY+z+Y2Y6vu/G+oKMm4uWlns/L2o
	 kIK7/PwtH+8gibO2dxCWmX5/fNprQUVJJwWcO1yBlt6hum3sz5vjf2G0TjzkQGdOD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxdhQ6Xk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F76liToW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171260A3839
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6171260A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxdhQ6Xk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F76liToW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A58T1957598
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=; b=WxdhQ6XkDhcOOeSE
	P17r5CQhmNPkhAroiEynqNkL91aSHU5Tu18tnWXsvO2f97MTyAGGzrqaFYGIw8WL
	maO/Xl5TvTxkW1RATLyqfrEabizXvX3WYZKBGMfAdCmqwAV3AJ6cmxposD/uklv/
	Yxw5e6E9r3rbGYvQgVYoZkI5byUo6y/YciR1q9AfLhkzoOyHYR4ucbU1yRlfbM8z
	6Uv0n1U/9AYoLXAJlRq30VleSNxYkNuG95UTKZSX79o9ZVd4PU8Ccv7rWqdK2wKh
	yYPVFgt5Eklzl/xnKRkFB4PRSB9ECtiHGF9+4epk/SpHNtRp4898wVBHuAF7YFa4
	IeLXsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydknn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94776ee7bf0so269027485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286605; x=1794891405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
        b=F76liToWAyfNBWY8Usf5d9RXF/n5iaQ2M0fCcaNwaU5nT+ty2fMUT4c/Y3Mw3ponmH
         ssMBQZECHljc60m/Cdc7HuSjupwNRC+k7NTpuxhQrSROkISb+3NrO+z2lvfyftpvzYVt
         lpqK3s3LNWh8iqVhYL8tnSn5OfcYdK9v3jO3TQ5S6KTqRxyHJVPBXgiw11d3o0g1d5Og
         +SgujrCdUUs0TQDFlN9gFqDQmjaSjWGtlX3gg2hvEBOPzq1ZY6MP5BhCrT90X3EQzPN4
         5qVmIIcv7q1+om49rgYlImxxgWz+imU08VBQYnCA4oO+GjahpFCRLBJEp8a7Zm4DS5KI
         20NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286605; x=1794891405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
        b=MkqY/8m8AVw9QWDOQSuGyk21rRUn21JE0L/TSfC3gPQqMnWpJ2QTejH+nxejLAIBfv
         s7xiYRfmbAW+03kNc5vZK2gkSLboTkDzlimAAm2If2H9mReQERMYLPP5cSlmx52BZaLw
         bX3ZtmJijpkdod0Uqd1uy6i+WjI7tycrPei5gDU6oGdGVEp2Ys70XFPdt7GXIEGdET6v
         Bs1QsllmM9Vi2r/pp+aOFr/Jpw4E4yeJ461QtukrZWASG8FEam8FzbI5LPWovt46RFs/
         7z08tpkLaXJgr+1obfd+X6EfiZocrjK5yvVzxGgcIgEZWa1lYJlY1AM1XZP+4YmmkJkN
         8h8Q==
X-Forwarded-Encrypted: i=1; AL+hErFOGihza4C1BvsvToxiybbS8EaF7s29YQfzvFiCV/vncyWd5BhSKfT+ZI6SsQxzfznt+mzcqhfpJMMqkLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k7GmU+ZxMJ8O3TdbzFpCPSso8KiwftxAUAWVgdG6P3sI4JZ/A
	xIDGyN8ynjnd9ll8qIhTq/svEIlURQ0yXZc2DJwMINpNXryCUosm/e1+X8zxxp0lpTWBTSX3tZc
	jIP3YRyU3mPqppyryuEByAD1FIi3/XZlKmCmRi9TnTlZ5I5b/bZOUjqKFllINZBemsVM=
X-Gm-Gg: AYBFou2dowjXDb7HDqjUonL9I4LxnTEpQw1wBFbZxAjgLrdfkNzqATsHwpjk91e02kv
	SlTqQhI2iVL5jp6nlQEvvE9XrVogq904MW1BYJxCQuX1LNzZ5TxZnnvfsIL2gzNf/3TLUqy9z0y
	CnCXZ+1Ihs18CfkmzXr6O/MepWQT+/UsfIRri4aNbAVoGOssZng1b/ex+faBgI+qVhvFMokKvDc
	mQDzCY1VsNkGaBLVWfvbLP6ra4cy9KzWK5N8tNKbkE2lBUwpZ7UfkYOYf7avW4qGAONfgpNGylm
	jHe2+2Kc0OE7JrOuPM1z5e3n9la1c59qRmrDP6j7Py6OC4POXM5D5ulH1qrymv/UCRT/V8otvoJ
	qX2y8SE7uYMlD9m+eExsw89xrOCqWijXIHpnJOJm5uQ6cVNoo8YJ/aflBbIKMuHMizp9nIXm8CC
	98y/Qa+wpas3nuD3XVQfsBYHFjWDQNVnxh7J1w
X-Received: by 2002:a05:620a:4610:b0:93f:565f:e40 with SMTP id af79cd13be357-9479f31a225mr262557985a.65.1794286604729;
        Mon, 09 Nov 2026 20:56:44 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:93f:565f:e40 with SMTP id af79cd13be357-9479f31a225mr262554485a.65.1794286604262;
        Mon, 09 Nov 2026 20:56:44 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:48 +0800
Subject: [PATCH v8 27/29] drm/msm/dp: ignore IRQ HPD latched together with
 an unplug
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
Message-Id: <20261110-msm-dp-mst-v8-27-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1164;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bfFHW5pac45fv2G/tLtozJ4WL3CywVJbvdGmDCdZZ9g=;
 b=9cbHRITB8rdqKvOioGVspyl8NOFunJMJu9syJCGcN6BNUDfuVhjXb/O6LBqe871chXyLkpnlx
 nRDi1g01szgBfSLz7Ia7qm/D0i4Fex+Cr0K8P7UCZ5sH5GHWQRIbFai
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX6RDn8vSNsQEL
 FYzTmE9uGeDqV6lNf4h32eqJaj0PQS6R4rP51P/ICUYe7OC1Jwu9bCtA1lFYISBSGPwSuCokDFc
 eTQzpHd2F7+2tEUwyhbGKsf1q5K+vkk=
X-Proofpoint-GUID: ATjM7-y_5Q0JjX1I1pdLTae43q-Bp4TU
X-Proofpoint-ORIG-GUID: ATjM7-y_5Q0JjX1I1pdLTae43q-Bp4TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwx850aw7uQI3
 R0SdGNlLmRzGjDKzgpT6BtIYm2L9rIz47KeV3AEoxPHWrl6sdxvXT3i4dnnGjTpuduy117VNw3S
 wNi/cc+9RsSEMc5bHBqxjS2ROFeeI+DlT8mRbe863o4mBukugvBjEQ3qyqNmHSbH9qTsfTDlNl4
 auNrOjysHORI0quUp5JRIF1VBetLFm04rdFkmJD2LxL2Or2ilEzB1/VqlDYqivKHx7iskzb6sh9
 0L0llK7ESx35mz9Cg2cuxvVgMrB2vaRUtQrzEYX4XtwEyGqRcRA1PGFdwcZNPgndqt/BVmdnmrE
 TQC2haXhnHMEkn3PqLm6p8XnH+V3gsteOw4IgkliRlCyJuYd1Vf7GBwXQRpw8Blxfq/kaj4tiff
 eCbd14w9Su5KaZgmJvNhjNAhSHFbIa3i58P3z8MdUJsOQ0iFSdxGFBg7E5acG4HGfi4nNRl/G8x
 MAL3dQSxYqNYBnB80fw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2a40d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GWmhsmQFvB3G8ctGRoAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

IRQ HPD can be reported with a plug or unplug event.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 40b2f6e120cf..8e30420a017f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1131,7 +1131,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);

-- 
2.43.0


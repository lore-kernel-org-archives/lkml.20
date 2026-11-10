Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286508;
	b=aBZQpA/TxyCXiKlYYcT3mgfYF8P+ryn9Ku34wmAYoNpNy6W26UHmlEjoAvst4sjiFBj5
	 OtW5DsjA5aFC3F4CRQQRzLubiQ9lE2qPsk2Cp7aRlyE4zBOqbhZsPdIVgZW72mAyRck2r
	 MFDE76ZLWwyd2WesPgvM/EeteX8Q9vdb9/4YDuWDtN+5FRiz3NbbiA0xG6TLpu7L53/5a
	 /mUu3JpMNp0aaZTUUrNurDu9bpdIPwRnhcq7RqZnS5aYAMj5HxUxTCy1jZL7NuA7peIcj
	 lFm/NNoWLWhcuN7JXWQ5QYvW+S+3fU9YCt27nD170Jtr/8+Edix+WXDCrXx1gAy7Tew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YOeHFzSP/M2lE2RBxHF9yVFMDiuJq1eI6SXiZToljd8=;
	b=JzDKjNL1Csdixvl9cmx7RyBALIRBDuANdLphgpiACRb9ml+CCD3DW6AbeA7sVY11Iw3k
	 zRvMw8Lt4Tnxd5B720HMZV0gi7ziA6P0OpwHBjOORXqm4a65+laukJXkYxbZfU2nVgBCE
	 YMmKDPKO+v0C5UvHdCg1OiwiC2kfcLSctGqoto2JBvFsDCUXrGjM41nBLJjuznCs03unN
	 Y1gJrrCzFsumwVNxGO8Vi/GjXZ7Qa1Iko09BT0bDdfAwmtd1kghgusxcxLCc4wNpH7yX5
	 Ce4Yi+LDwzZ2nsJozhkJLoE9j+DmdgqxkXsEl/1sfcBOodx/zOnAH5zI+Yt0XJO37nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odAHJsxI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fC/03JH9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C6606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B55C6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odAHJsxI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fC/03JH9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2tN1207398
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOeHFzSP/M2lE2RBxHF9yVFMDiuJq1eI6SXiZToljd8=; b=odAHJsxITZj+MolN
	vlQeds+o5gZXZCfXGy5JVhytvUR3SkZAtO1tl9HX5fJeqjS90GRJrM/OoDP/P3iN
	XUvdPYdXMasvyOVEMkEao/XMDlWbVLeZsD0Q5jhFtRtuImGpaKUe6rCP4FNTQrQw
	p8RX/0DhhnkPM/Wxl84BLY7H+8j9ContdCEjXHYdZoqnUsYhnANp2MwtSOb8MlMe
	ZOqDLqjUF0AtfhjKvbUaQwjFEmVMvzBzSXhT6xX5y93PEiAGUbcGPxU0Nh3md3yw
	qmGIeWEQeBIrp/pvhsvRFsWk7wB8bjgvV1oGlHHcg/uCTF1UMldWrOW2a7baOOCi
	XODvEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhf7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so324520585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286506; x=1794891306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOeHFzSP/M2lE2RBxHF9yVFMDiuJq1eI6SXiZToljd8=;
        b=fC/03JH9eQ3vq3uuimyU1pXpIaDWplIk99dWbk1Uok/HQkeCIKfHWG47FLu6jw7iRs
         yB7PVygsJmmTwIVBqSVqbytLVsjy834dsNulIpNHUS3MG4qvKgKDm0z86yIbTJVdnB2Q
         MN4icBS5UYCcpqMmmtJx9r/Bker1hYdsbOQBK5tx41TQDr4guCW4xX2hntNA6+Y+DcEI
         SgZnKRp/t1SIr6KId0Zoisv4yBk8nPV5QIb6ItcJWvQev8uvJdpY4XSQCIfx0sZuh7HN
         roiFwHmjeBeCQW3Kb5yqj5Kif39oEOhAWCHcIfRM/I2r9jXPsLyhA0zKHkYYfGuRy57K
         Vaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286506; x=1794891306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOeHFzSP/M2lE2RBxHF9yVFMDiuJq1eI6SXiZToljd8=;
        b=SHRXZGBRigEBMWMThtOB6hcAR8mqNmgMNKpeqOClFL4zgG1Iw09Xk0i1SSxoAgibKY
         maBq0ItXXn7zjYtcurpbsNiUnXAA0D2n9t+0CjaYyRIpu5KLeDFKUzE9zZoJUwSxwGwT
         /GrXBk58iTS4a9XtpHMlwQG85xzg3EwJGVzYBOl9lRWznwnUOaMXpRbjYAxB/HHKUN/g
         PZ6NuJVDdnI8rRKVXmaB111MdrZ1HwdZxP5fa3KvMF/LeIrAbnWOcwIy3HKQ62WomK1B
         NJSbLWz2uxG9JO5BavOvwIAtNjHSrJHRxrX0U5eAuZfifk48Ezcs5cU0IyDXf8FVJQN2
         nOgw==
X-Forwarded-Encrypted: i=1; AL+hErG1qiqSz233Av/6W/EcmnB1+4JoIE5MRQR4DiMtgvXtR90AkQx3eTKR478w9TrgiLtTlnVeGsiOVJDKTkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uEnKsbcG5jhCFVfLtxDVq4OhoYnNFb8FjZcfad9ZmtKl2N5UR
	q5xH/+l4EnOL+HC/mJ9GpqAkRxuxX0nbeJbA9Qkp7OMXWJ9tJh0bkIDl/A4YaSs4WocManVGeR2
	0YJjW1wCkrMIC+kKg9zNs23bjUqfdNqa17F8WzGr0mZae39j5izh3GfAmfBZhWX1oIhU=
X-Gm-Gg: AYBFou0Px4TutO8Tb6DrXCBOoQ43N8VsS0tpQSdxUFI1ohSgvmwuWLLDBPc17Ea9rLi
	vP2rpDyHGUmMJF+k5SbKM5HUh5r14/074SMN/mlCahI0UJV3Tgs0dZH0g3Qq0JjA7pXh63M50GW
	/dvw9uRyRM5gL2XBl3R7R9hTB1N5vsV95Tuv5jywLBKYDLUMM3HgsqhnKK4a/5pjWHJN3ns+8mO
	bw86hou680xbnYJAoJ2i+F55KOAU6pORG0sNRPSg9KoJ9XJm7Me7WcDT6cPWlsorz4R59JUwy3I
	Lop42l0IWVuoWTgvn68ZCVYK0oQsESPVIhNsjRxCVSLWAE/XPntp4DY7BQiSEVUrK1jO8cmEFTE
	87exjBt7RuOHjvcvlo0joIpzt9os9YHS6Fb/U0kXWE0RxQbTxObRDtMtg79LxWbi0/BArD1mmpF
	xa92OdXf1oSuhjrW29BNueXfwXoaRu+VJ6mpVS
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr255892585a.23.1794286505680;
        Mon, 09 Nov 2026 20:55:05 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93e:53db:d59e with SMTP id af79cd13be357-9479f1e8436mr255890185a.23.1794286505234;
        Mon, 09 Nov 2026 20:55:05 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:04 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:27 +0800
Subject: [PATCH v8 06/29] drm/msm/dp: add support for sending VCPF packets
 in DP controller
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
Message-Id: <20261110-msm-dp-mst-v8-6-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=8277;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=AnPSKBPQwv/mJseBH4MWUaEZFwaWXwY/PyWgtH4ZzSc=;
 b=9EgZ5rtljGEBS84O2Z8wVDlLRCCcRkfeq+Fi3lgP7nSiOL7olA/2X5jNZlGsxfzOUBavG/P+W
 /WNjnpITY+6CCpxxmaudLQVYE/gIWn3CX9TiU5azjBsoAMg7iI10lfO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: _eX9VuNm3f5oiDLd-vyM6iIYPV1GaX9h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX70H+lctb/l6q
 TAhsSzycqSqLODcVMNAMorIM2xut5fSHxh9oTndV5rnv3NXUy7ZX7TgleN41EV74Y9eagLxS4cp
 tCOZJKjVzgIe1vg8y8tIrnGyEyvV530=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3K0hjHndsinMD8gLsdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _eX9VuNm3f5oiDLd-vyM6iIYPV1GaX9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXyZ7TeDwiI09+
 FnPYapTgIcK7uR0Dpf6aC9XFZPdLo/mj5EbgqVQqdKcfbL703IA6nu++nrzRJG7pCqh+sqOSle2
 hhoOvz21Ywj2U2Mv1Uh0HDLej/GQrtyfKC1uylOOndle4Xa3SIQ1Gcf1n7hS0VfKfbvXifjvRrV
 DCvX9fv5oBfuy2oASWSKoNv5ewNAUs0373/Kh7mt4YWr4yU+T2AERHG8z9V0ITvC3nN+exLSVQc
 t0qPELnio5hcK5T4mD/Zl6XtFf2GojAb0bbs0G2gqbEBRNn3+8E8zZW3yVZHx5+fG4/RpF53Jq6
 gFa3N3LbBmhT8r5n7zZPbqmUcOWo6OAzVurdGRrWW8oAdhJdLcBm8+a1OLlmD3fTPro4qxojPOA
 1d9v2aoNlEcRMnAkZFYUtf239Gn8Y2sRYwUZjaJnAXasu55kvYgJm0OzZV2GqgB/VSWBZG3r2ap
 qUS9aFTONwSFwfEy+DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
Add support for triggering the VCPF sequence in the MSM DP controller.

VCPF completion events for streams 2 and 3 are reported in STATUS7,
while streams 0 and 1 use STATUS5.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 86 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     | 12 ++++++
 4 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 249c818fe79c5..8a2396aec6d5e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,6 +65,16 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS7 \
+	(DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)
+#define DP_INTERRUPT_STATUS7_MASK \
+	(DP_INTERRUPT_STATUS7 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -351,6 +361,12 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
+	if (ctrl->num_pixel_clks > DP_STREAM_2) {
+		msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7,
+				 DP_INTERRUPT_STATUS7_MASK);
+	}
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -360,6 +376,9 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
+	if (ctrl->num_pixel_clks > DP_STREAM_2)
+		msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -379,6 +398,34 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(struct msm_dp_ctrl_private *ctrl)
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
+	return intr & DP_INTERRUPT_STATUS5;
+}
+
+static u32 msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS7);
+	intr &= ~DP_INTERRUPT_STATUS7_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS7)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7,
+			 intr_ack | DP_INTERRUPT_STATUS7_MASK);
+
+	return intr & DP_INTERRUPT_STATUS7;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -478,6 +525,35 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
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
+	if (!ctrl->mst_mode) {
+		msm_dp_ctrl_push_idle(msm_dp_ctrl);
+		return;
+	}
+
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
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
+}
+
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2810,6 +2886,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
+	if (ctrl->num_pixel_clks > DP_STREAM_2)
+		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
+
+	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
+		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 41a69447001cd..84ea37d8db2e3 100644
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
index 4862d0b42f290..f6d16c57afcc1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1524,7 +1524,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	if (!dp->power_on)
 		return;
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index cc74b1ed628ec..36cfd94ac1622 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,6 +42,9 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_MST_DP0_VCPF_SENT	BIT(0)
+#define DP_INTR_MST_DP1_VCPF_SENT	BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
@@ -58,6 +61,12 @@
 #define PSR_UPDATE_ERROR_MASK			(0x00000008)
 #define PSR_WAKE_ERROR_MASK			(0x00000010)
 
+#define REG_DP_INTR_STATUS5			(0x00000034)
+
+#define REG_DP_INTR_STATUS7			(0x000000FC)
+#define DP_INTR_MST_DP2_VCPF_SENT	BIT(18)
+#define DP_INTR_MST_DP3_VCPF_SENT	BIT(21)
+
 #define REG_DP_DP_HPD_CTRL			(0x00000000)
 #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
 
@@ -143,6 +152,8 @@
 #define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
 #define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+#define DP_STATE_CTRL_DP0_PUSH_VCPF		BIT(12)
+#define DP_STATE_CTRL_DP1_PUSH_VCPF		BIT(14)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
@@ -370,6 +381,7 @@
 
 /* Streams 2/3 registers, relative to mst2link_base / mst3link_base. */
 #define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define DP_MSTLINK_PUSH_VCPF			BIT(12)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003c)

-- 
2.43.0


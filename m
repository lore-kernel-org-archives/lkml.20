Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6E3ED13F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164413; cv=none; b=U65nnO4kktQvrUIxhMtlmLW6JjbN9yjOcMLbIB4k5WbfTzne+Edvq11ptkfiJwnGuEu9RwcuMeTzaHH2wf0/nm0yukKgAyRNfnKFdzIGZjGsIKeuBrIwEQ27DJzix+n3m6bJFIivh4lWSUKQn142BLYegi74kFoyAooJcLIEcPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164413; c=relaxed/simple;
	bh=BsKEu+fcndTB4mpRTOWC04mHAeoO2RA+NVOzYn24ODM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sv5qoLUqvjwMtc3eVHzWShfdr/CpbF+6mfHcL767aJc0stT8oMyLEJlHSU3vniLxcbO9NcI5lNb4v7uM2I8txv7SuoTQi7330KY57QDpok9zwfFulGZHJ0O8ZuYkkPJUL6PcvwZvxZtWVr8xpgfyz94PJaEB/m/OJ8cHRcD0Rpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd25IvlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B06LzKrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd25IvlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B06LzKrj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xH7u4081405
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7utkUh5DGGPO01r3em/y3HgsFdRZPOx4e1kb8cs6dU=; b=kd25IvlEbuF+4tjB
	KaRS94/MW8qqX4RTVbMyfOEDuyNxecC1cZrdrqoRL/XWBJMlGbVjIHVHYb6WFD/y
	e2tvB0eYjAlG1TPNFNtUNBKiAw+597V4R6CymwwXcLeSxO9WNCx3uvrM44s21L+u
	t/+FKy4rLXDxW14/g/v8ZS3SCGDxqtU0N7r/Bcx9J3bBXXoSyZ5DEjlLxSigGQ2T
	C/P9F48oXH8Ims5WuUoBv2XFNZIYIrHmdZSPCwOOIAkFfMQgTk5/8+K0kAggQSyz
	RUVzghOBCF7FLe4kpnteZPhe7ZxyrFjSSkeo1vbS+rb0aVlkwtKFLloPqS5eulZr
	7UgdhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1nh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso405238985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164409; x=1788769209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7utkUh5DGGPO01r3em/y3HgsFdRZPOx4e1kb8cs6dU=;
        b=B06LzKrjpZ1ODuo1yqy2U/w80jnkFrEjlQBI1VrV3PNnHp5A4/eFSTV+DF0xi3Km52
         g2iTzwaOqKgLVcu51v+qYJ4gCUpOB48GvW2LMD2wCowmtBcAHvZ+XLhxDKKkPylyjFn3
         2k+2T3uolAHMlbRute2eJaQ8KoASQgmHxrj24jyaG2uKjCfMC0/KoLWUNA+/s84Bxx9M
         MJsEbIrEv1UsqRKE2Af3WNrkuR0xvAvmmUNii/aPxruEZNUMkfk0dosfYXoHejk3SX9+
         QHZ39G0dUL36siQT61kZ7goZDDYiP/jvkYVM9AN6bOY1SleSLPv33oeH3Hc1fhqir6Hv
         u3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164409; x=1788769209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7utkUh5DGGPO01r3em/y3HgsFdRZPOx4e1kb8cs6dU=;
        b=alqtVpVWUAT4PCyCDO+W77SJ6M12SfnspYF/Xx10ESub7yvbr2ZITo8o9Jkcf1Sk2I
         ++LClcnDidO8vVJMAalEEijM0q6nyTQNB3XwHGTX75gOoqER+12EQvggC2D9ekp5GkTW
         Srj74QyR3KSu2sLofVe6i0Ze8Zr2JCbNXLK+f/Ufut0tcnem+/XT3ip63pOg3eiuShkq
         l984KxVZuqohZTdIsBRLYpxl9s0oS1B6RaiJGuUa5048/eznCLRMk/2foqrKX/1dY0K6
         rAV7/ciOznkh0vKUfrprUxK4ISieXvuWAVrMqYswYMcLBki3A/zcckis845nU3lpHQLo
         Gugw==
X-Forwarded-Encrypted: i=1; AHgh+RpyjqBZ9ql4KmK0DkFp/CZBpTX5NrAUG0rS6TjAEYOtmUDeOrd8WpNKEuCTfZ/foZQJXh80ur5ao1noPfs=@vger.kernel.org
X-Gm-Message-State: AFuF++mBn42dTJSnNfuHfyeJ/O7mt2Bb4xdhzUlX+Jhb7DnBVfBQv3W1
	d0bKsvxTCqdy38m0BWHDSy/qAubxXVomM4g0KvZ+PBkeMkTNwypqUip4LfmJo1FjTEhfhd1eraJ
	PZ7VG4MZdbHFpistfMfwJd7fHMqDZRm2e6Wn9KH9SCIjB1hBcMrYgkfv5bZ9MtuKhdB0=
X-Gm-Gg: AR+sD12u86HRDTqdAVJMa/QhNkPwQpFit1jHpuN6VMh9FwaPhyUgPwQ5e8Qv4VvR+zk
	62WCYW3haeaD6u+Au/Pr8DaCVIF39h3mGlgJ+99IddqLISY5uCfCsNWENE3MySB3O0Bo+ANIm1i
	Jnyct+qkamzJY6K6UGdsDbT9EYY65ShuDjXX8V84nJnOOQ4pJqyaCirr+++cBsRrFPUucb20xYa
	axWnW6mWlGmpkr0kQgSa4Nbr4CBbVpxvbgkUZhwp2t3uQFP7e2m798kSIQyUHIjSh9nv9HhnOqu
	AEe1NwyqE0KwWAGlDNqwGfURvzgBBf85x+MSi7AiNntp5eu+Msvz9w/kVv9jbNTyptd3fIW59uC
	w1aylu1bwl1PxYMnu5tVrSyfY64JszJZT7D88Q7IGA9z/a08XUuc1jE4c1fhsJHE=
X-Received: by 2002:a05:620a:271c:b0:92e:520a:ffab with SMTP id af79cd13be357-93942bc5d61mr128906585a.38.1788164408799;
        Mon, 31 Aug 2026 01:20:08 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:92e:520a:ffab with SMTP id af79cd13be357-93942bc5d61mr128900785a.38.1788164408148;
        Mon, 31 Aug 2026 01:20:08 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:20:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:45 +0800
Subject: [PATCH v6 28/29] drm/msm/dp: mark the SST bridge disconnected when
 an MST-capable sink is present
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-28-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1360;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=FtG0OtAF0cEV+melS90shLLkD3JKef4yMUSpzTrvG9o=;
 b=MAsD4O/FZCIw+md7L0Mbc7jZOxHxc3x02AYpVe088cK6PBce079tY51MoNdgezu/eyHlnTIg3
 CY1micG7rFhBNpDJk0ulGpI/QzDEfMaODS7egHsxGwNdPegiXikUJFt
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a95393a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX63QOIYf8a8Py
 iGj4Q6UvyLrxkqbL5cmfFhTiNhiw8JziEM2pIQ4CgrR+g6zvACbgCnniQSloVYcl9TEE/X57XjC
 L5BafAm/YuRZU3i2UHLzPeH99WL3LdOsrsMB89Vl07x1FJ8IohNVDtbTxiGqo7U6eRQg6z3SLMK
 QP0/+IgjCaZzOoXgqqCyXWo3213gHkhR2Et6xVBgWdL41uS1TdwTkidrexRPgaYCrGb04Xc3RIT
 z4waIedkdxf0OEUBp0lFAU/WqTFNUUdUBGiMcNYH1OmQ1bU8qg/HkHqvj25bU+vyU/ptPC63iQo
 Co1AlsAdptfUuvwmhtc4EjWaFP6DkyOs7EpRtfQ+I6i+VyvoDk/ME4lisoRokJdtnoFtF0RTx4J
 GcZPJA/Nukz+65sQLUK1m2f0jOWketcPHwGcTi68us6zVOh0yuo5MZI33jlYUuDIXypHmM5IeUy
 CR5b7AOD3ikMOrhdGVA==
X-Proofpoint-ORIG-GUID: XKZ-Oly0OMC_mfRd0S-x5vhrHMAmKSfy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXycAU4YELNnNg
 cbPCPr2ShjchoQ00O+bhLlL5JrzSuCk2SJKBw0w1PE6ZcUl5EUKdiCMTZHSx8kdcH33dgJ/c83d
 xRWmy7o9gIW86RjocT2NfstJH/QbnvI=
X-Proofpoint-GUID: XKZ-Oly0OMC_mfRd0S-x5vhrHMAmKSfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

When a DP cable is already attached at boot, msm_dp_bridge_detect()
runs from the connector notify path before MST has been activated on
the sink. The DPCD capability read at that point already indicates
that the sink supports MST.

Return connector_status_disconnected from the SST bridge whenever the
controller supports multi-stream (stream_cnt > 1) and the sink reports
MST capability, so that connector detection is handled by MST
connectors instead of the SST bridge.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dbc0e82d333a..d2b2c7141db0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1052,6 +1052,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* Mark SST connector as disconnected in DP boot-up case*/
+	if (msm_dp_ctrl_get_stream_cnt(priv->ctrl) > 1 && drm_dp_read_mst_cap(priv->aux, dpcd))
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0


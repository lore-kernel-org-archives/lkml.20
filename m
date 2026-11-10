Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286598;
	b=w/0DRBYFh63cdJtVZi2G1Q64u61SL2/6dS3On24o8H24VqbygsYS5lbrUx2UefWGc5Dz
	 UHoeBKBerUhcxgAfKPMsP2v+ZipPby50wwByHucStEvkSiOOAeaQQUt60o7/TqMC5y6P/
	 wjhCylFpua2OKBeHf171554Vo2JMu7cfQV0NfyjA9ZiXXdBbZWQxcnN72vP5yJbJnFCGJ
	 fmwe99IYdm6FILIAahlV/1bjX3GiijUHH7JS/hDa51BeXUtsLaoifL16EIi7eB+oC3yp3
	 B2G4+pIIFLz3j9wWEmRmXIGEVuYIi1VukUf/8++4sS0s27GP4goro64KlaQ8/o4IQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
	b=oqoHLYuFS7R4fKBx3yVIE11pKN1hl78AW5ByPxuNg73QpefmjwF2cse9eSXw4tuxmrT0
	 nPhB7+rtAizEj5UZapY73LITOVoS0bciuBib0Hkc05m/VTNB3i306+NysA6QpHnjUUY3Y
	 YeaG/5HXMSb1NLiusRuBEFi97HPbMu6fad56SNUcrw7Ngqlk4ohNiZdp69WFgkXzxfuZC
	 j+ZEnAPr4ITkASo9mJ3ctXSc/meCy8Nvza/jh0RWAqBfpHPaYOgxntAcMStXvngMDGXOg
	 rAelMi3oGmPrg1dtomWckGV9rpqW2IXhKzL/xRONDKHxFOzCad/KF55VsF6Polcb39g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj31q4mm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbeN7ODi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F760A261E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181F760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj31q4mm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbeN7ODi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AD542919687
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=; b=jj31q4mmGzsllkPW
	oLUqZ2MbqNc1v9D2gFKfdPzle3uJghQPrHL2y5Na/tU6KwTFPUuAT+1zrgtGB9mB
	NPx0ngYElKDlccW8zp1Ms5CdwaBWdaP51zlQfR9IR8LH8PJrQhzGEc6pXGcEHngY
	zpT/bA8UyMkk9sowzhIQc6KKMacKI6u1p/HiWMqtITbE1fU6tOLu8hAxB0fRCTVc
	bj95zy7cP5De2M3NbdypaPbBQvvF10i/NKJOwXjq56bLEYxlvmrkLS5e6uATlU37
	WN5amoaK1sfiMEtn1hZUFA4mOFbJoI73OCJMUs5AoZWfAyYFnozRMS/O66eeDNkL
	sgJ5bw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1qyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so351637385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286595; x=1794891395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
        b=HbeN7ODiNMIjmPhriuNHn/OqXIW3mFyLt2/DYZdh8hIxvGEc4uudxfosUSKRZ0MGy+
         Q6xgFWt7youHCBxGLq4wdVc58GnASHEGM/Ogb2Sf6Q3vnY+5BBSMacQGLJ6w4gzZfKfb
         4EOYGe1Sz2yU0Up6uYGLlAqskblnMJJnjpvJcg0zkiPiuKXgIcUn7U5sGUnWX5A1ivxW
         5Axs1cEDINFIeby70RCKv3BM05fc/bFCPkEq+IPIzpmrTxPjdZPQJDu+IHPx5qnWQTNO
         8m1RF25G4bwnSAcv6T7aT+GfkGr9aNeQ314EsDe34mSttZrR3V4ltj/ZyXh7OCHELtpU
         K54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286595; x=1794891395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
        b=0+VY/NBIipYa/Iuiau/RlAICk/afAxhAWNRoEZtZfPnHmb4xEOTK3AfeUL3fvTCoUJ
         X3drRecdVyPX8+cP7/cn1Od8TCSnwG/5WErRnGgCJJHqVpr69Pqq6I2dJcMzFsCnWGVF
         9V4p2k/Nm6lRfvGJEoEOEbqL2g9L5Ej1WUBJ2vdkRcaVcjsYV9caEqczWDH/8fPTdfPk
         a0oqjdWABwOnF8d7Kg5Qr1lCViH7b12KAabef3fkhY0Y1M2PMuT/EGgJSumbH5CU278x
         0r02+V4apTUL8zd9yg6CclvaHtg/ar5j/KCzu8SJSgE8bT4ujUeoMvYY5HKqMJ0R8AbX
         0D6Q==
X-Forwarded-Encrypted: i=1; AL+hErHy1zYizYPhvMug2PUKbTWc2bPl67N5tFMAW0HN4TWzRQ0lweNmZT9RmiYZPhP2/aCDca88ayd0FnrWOG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gGwZH0sXHhUIDIkF9x4VYyLByCKmY7+AcBJrHCG7ZhOMoiaZX
	a/I2QeLnoK6YcwPmH+Dw6/xSqNIos9Y5pSV/Y0iZJNhwhe//vZuHCKBnRw8QQ5K0HoQJ3QFHP5j
	gDykxx8mdqptA+39F1ywZPlFhxK0EOXKYNQdRzFWqSSauq1NeUAWPowaH+Oeq8GzTrcY=
X-Gm-Gg: AYBFou02mBiuaKN9JgpywnmKH4py6jHLGY0BrIRZ9UIRlC/rN8NEfP1wDueJvdhkufS
	QosX63ByszVX8HmDxJP+tTYVfFbnFRIH/ZREGBQAS2g8VRzKsWuAZp7QX99zgk8VP2NiNsgYcdm
	Dub7V7fi9/a40IysF067DUaN+Ogf7NQQGBKao8lXlK9l55cxjdNDIDBOKHPucmnQKSHbx0rI4z5
	B66dN6v4sqc6ccT5vXGQw73qy9MRS9c9Bhk4hYbryDT01R9WFd2/3Qt/E/nJ5PQnkWpCvICESb8
	WxwxNVNeJKVsR3BdJxYNeSnMLP7C3DQMVao8pXVyTzuKF0QL3hcdd2U6HQXPdjUz13ys7P6GY+K
	EVgGSBCac1sgKFZpxA/PTIx0tu8MXYNnMBes9ebQekxZZouAuxvwZ1w86yy4CSaC7OdsNWAeqEa
	gIlFZPIomeke6LnL2VDT8YXkFW8IZWoG7Mcho/
X-Received: by 2002:a05:620a:2586:b0:93e:a51e:7ffb with SMTP id af79cd13be357-9479f1b9eb6mr278178885a.2.1794286595543;
        Mon, 09 Nov 2026 20:56:35 -0800 (PST)
X-Received: by 2002:a05:620a:2586:b0:93e:a51e:7ffb with SMTP id af79cd13be357-9479f1b9eb6mr278176885a.2.1794286595119;
        Mon, 09 Nov 2026 20:56:35 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:34 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:46 +0800
Subject: [PATCH v8 25/29] drm/msm/dp: mark the SST bridge disconnected when
 an MST-capable sink is present
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
Message-Id: <20261110-msm-dp-mst-v8-25-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1383;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bBuxzsx7BIcnWIcOt6s6iyCubG47bE57DQZDBblPLv8=;
 b=DLNzgPu9qOBxtXLswwJcZYEcAtSDIC4flSxsblLg7PLqOIqmq9F/2ZFaYh/pBACS4ZJ8d4IBT
 R57rPTUbFUMBpKiBRKDMAmu6VaDTETc3eU7/WX4vr9Kr4om62lqG6OE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+H8MG103yYjL
 EAyqpqCtIVggn81X76NhlHjvVfmr7rXOgbSaC3OIqFYtgYjYOEung2QQPYGr6sGEfRxZTsDAvpg
 bHEduFNpUsGTd4ZQj0M9irbmoIgpNBnU+wG9pgRZ5MYZieBNPJlCclSMTk9J5WleJ6G3OjmM7nL
 vXM0orn8MPOTAIWR1g2E85G7OA3dgmEihO+t5x2lO7D2FKW1JNmhvw56OLHwYpfQeec5xj8//pg
 2tiV105ddRdu+GijV01IWK+BmN4JDRPexGfILFigHwS5yna2NBHPyxabTgPOEW9T1rqDqGiLPjV
 Ij5myDjEb4teSlRTZi2g9iCErTmg+4Qfr9xtpNjTniIs+/WjUaQ0AA4h49mN3xjd2gGJtQzHPMa
 fe4PHB0wn0Xyu6Cykkple3cMnJvz09RL0Oz7KN/I/eGzz36UAo9WA/vHI+UH+xzWjZ2+D5DBnMm
 AihMugMxeOxV2gMPMBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX892JRne7tWGp
 p0A/z6ZCpIf8EnGGJv+QNrw6fONhCxYkASvBR50dFs1aKopOOUbZ+uyWrR1NENn8Cc2OJrAuJLK
 YS++MVmA6Q090MOeYLi+I2+iDCHQdnk=
X-Proofpoint-GUID: Am0vW4P3rD79GjW9GoGU3KsnB9ORkE1X
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2a404 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Am0vW4P3rD79GjW9GoGU3KsnB9ORkE1X
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
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eeb0e0494900..8ea3d258a98f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1063,6 +1063,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* Mark SST connector as disconnected in DP boot-up case */
+	if (msm_dp_ctrl_get_stream_cnt(priv->ctrl) > 1 &&
+	    drm_dp_read_mst_cap(priv->aux, dpcd) == DRM_DP_MST)
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0


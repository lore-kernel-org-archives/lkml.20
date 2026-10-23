Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797642;
	b=43hcgReynQcImv63KEYKxXUqQXR8JXfhkjgsaGVYCEAE9Q/VMoXUS6DXqXLb1rsZi1HA
	 XaU+BHzcoO5pPSs64oA7Ba+3EhANDy/5oX1VxyK0tswk+j+dyOoId7tkvcvjLdjWCAIvb
	 qfKCY+dbMWsUAOQZKUVlaqmflevtbsPI3rP4TiexdsU+n8PWIVIr3il+yyrqvQesUW0Tz
	 yQ/sUOEsWNp6dW31eiC1kQlm2OlWJo5T6ROVfl7rga4cRAfb/dZmWC6Pm/+se6NSVxh1F
	 Xg/AVuZzZgjG4Y0+lwD6m4WxdzzcqJBp3wtlO7Gg1685BwAa/xxlUaVBQ3s8iUyWzCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
	b=Rq0fd9uKOuh7OJRYWACdVvr7lXGXgarCHBcU1S2EPREIo6PKdguBEqujaICT/LQlzOAI
	 6nSeNlgQFJeKAeUzelm4tXZYvJtSimSGbUdXBNqcg0pr2JXYbO2Ka/RyvZTgeMQbyXROv
	 BmfABdcfC++Z1ODQ5zlcS2DuxgT20rvTzsFox8OnYQiogibpH1/HXVK7lCYUrdA4LsnQW
	 4Ct/ADciBmMyX6Fv2XmKLdD+acgKU5hGhb6IlrvFrQ1u3X/Il8wggE1k6WizXeLflOZZH
	 V8+lxzp907ygk/X15LUKfWpwChm0odL4pQ25my20V9DT4w8zNbeJ4OGgcXpKdkmHtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8cIjAwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecrFZ0GJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D53C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8cIjAwP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecrFZ0GJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvUYn3684536
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=; b=V8cIjAwPVzF3sl0s
	qqVdosh279tMLglHm1tDmWR1h3tves5/FxXbwbSgHSMRrBaJQ1a1fRVbhsmdiqt0
	ydZXYZaURZEYUDelErcSVEQegqvxoZ5CzbtSzrEDFPtJMemsPZgFsS2sIvTstvlI
	IYjm1nh5iRXUelq5HOeC+AtrdentA2QoUzjlJHKphLuhCHOhWmqMjSW+mS3ivXip
	dvd+if8Z+qR8da1KkSCIQhQ0yeKkOwjDxiF4HJGyrVcKqN0ZRJCTuxTR6gsho/k8
	ocgy2pKgYOcak1XhgaNdNwlxsRMYtq69tDG3oW8IUu4t6OeuZKYoCv82eqHZtFRK
	tAWagg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sb7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91256a7b7b3so27171886d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797640; x=1793402440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
        b=ecrFZ0GJpXet0J7x+sGfcBb/CqQNUC9uQg3yNb7PpLeVngJ3IDjfdpZ5dmNtJOi1Xv
         E67cmleeDCf+/N9MBSj5KO/KhVDw4V4qRpmBJI7MK5Fl0A0cPS56b4yhrgB47EIo3wBb
         2Zg2O24FuIOLUY/e3YG+aT4YKJcXHvA6vZH7+7sO/Ui/6vEWGAOyNHOkMCZdMO+0h0mh
         Ub5x8NhXxY5hsnMeaIbR+/fkJ8VqnVupPBnWbltTYuEQw3Mgizqxwy96EjvdX/GDU+wF
         iaU7IlblvQ2MVEgM09oCmqXpJRAioEFLo3Nw7qnautL+lN4MZ7qsO8+qZt+DbYEf2nHM
         +Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797640; x=1793402440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
        b=tq84IQWfaNDftufYKdIEviRpMqNKdPKEfH9hHGIhmt72b4gnLo1/jc4P0xqInYnMVF
         8eyPorpby9Pf8U14DYr5JmpHbTWqLkmdkZsfNQP77i532u/pl5yTYUmwJQOLffVtkxdV
         UTMz3qS7aXq4YlWDZeTtKaLEsecsH8deNC0PuJfH/yIS0rfceecmQisRmjP9aKisFtkt
         +b8cvhSI30KVv9/GCkz2ZqESa/dT6S6BhMyaVFSw6ogXA9NrVjN0y1VayhLXESEdC2NN
         K/3VWXx/WAXZMzqhIq78EeR8DxsBFFFuf4VehFro6JtSQMOw194TVTnx3AfofJmLodPZ
         TQEA==
X-Forwarded-Encrypted: i=1; AKwUvBzOyeglf2aDDtv7Kon7wT/LTtcEcTZakCOTDD8t2OrnHqokgyq0Ul6D71QBg2lHEoqFhNq2svVthwSFJdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLVdmVqWQoW/9Daf4/GNSL0kGl0vbCSi6TzmRQjueLT7ACZAR0
	011KFpnlTxD0v7YcUnO7cmUuR4ZmFTOTyvCgPJwSp3/uVB8HWEZa14NqVNW21F5fmtwvA57AlXn
	aoAM2utMgLWkllOLOLpl3z3g999vxy5AhjC5PaCQMStODi7FM7H8mZPLZ+oDie/PYZcY=
X-Gm-Gg: AYBFou2eXuvtawrkMc/XXeTqGsuCEEKNIJp+bugs/FbbxOPJoSxl7wC4qvKRz71eFNi
	x/rjuwQ7y80yAiXp4nojR74Afz0BgTrK4VgijPEK0S8Gnw7YHjC2bZ3rNXWhZVlqxR8DCfVf84K
	00I2ZwEu5kr/auc3i3gLeyTOaDL6P+TUy7/bnvlR6h8RKr0kKkYaCfTzKYpOOJVTMMqOd/jKG95
	cASfHP0rdd6F7YRlOBQKcabTD4z8HkmdH5uirKh3vFI67nmAatOl1D40WcEJU3+eHluH9tiKQ5t
	p1Cv92eG6qJ8PCvouB10stI9ZG9SUVg6UC4KPXZIWrlOh11qFRYfsXvi3pryTQQeYvZMOS0QwZL
	PBb2kbDhsTs3v7i3aLvKYAees3dPx3/ETvdYKiWbBDJLUpJfsYp4ZF7YOIo81VD7UR6kWTvRHsm
	36ykr/6kHhZMxi
X-Received: by 2002:a05:620a:2984:b0:93f:571b:c733 with SMTP id af79cd13be357-940ef901d8bmr86866285a.13.1792797640115;
        Fri, 23 Oct 2026 16:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:93f:571b:c733 with SMTP id af79cd13be357-940ef901d8bmr86862685a.13.1792797639605;
        Fri, 23 Oct 2026 16:20:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:46 +0300
Subject: [PATCH v3 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VKYiNlRfJt8Fwux6dkL1nhokW/Bh3mSOu/sCPXnJ5gY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uYSSzng4DpP5b3LjESkZLtZ1OQwtkpYpx5d
 qEVTTmYH5uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrmAAKCRCLPIo+Aiko
 1WWrB/902OJE+kHi35BZP8sSb/53Y7uXNU3TtdFd/43ktWC6QMoWgqS3EBVSRTbcMXiNUL3nEGZ
 o0f5b5FLes2yO7UzK7GGtjC890s7KQp/LLRn1V6tegJi+tveo6jH4C24Bfa6gjv0PB6yk8BQv7r
 x5pxDF/wmccUjuTfbYkX8t1QkQ4ZZGknleoDMqgu+4lW67NXzV1R+ksqUzzoFRObCipgzVKYyd1
 xl86RZ0Br10M0aq7mI89WS8lrogQqbs/OYUVwHhHYr7832hlkvIVRZPJ6CagkOzxvUy6VinR9w+
 ExuR57f4CaotZCekFVt4RCIg9bKr2MX/nyaBdQLzrQBiE4vM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4DJVEXYCx3Gb
 OrnF6+IZNvPYsjyHYOI6sknYFnbMu/JqIV0dB9jb5wG0RU7stpBB7vKrFWpcDGVEGqfdviLsD4f
 6Unwal4wdycOq3V8W4PdOufz2BvGzE6VwRTyN9NZENglJezoxaFwHZUomnBgWabRBI+AbF6BfWd
 LwVIae9mz16Pj2+IqwpSGAOQsQePw1RnaarLtBZhI1v6avJ/vu3G52njLaYWDc490OH532vGoRD
 prL7a+oYqUxPz3Lp1rANSFVXux19ZGbcyK9oSqMFdjKvYMbqtLfURjLuNIZEfEPm2Ta+j7fYLbP
 tZno+GpMFn524ZWkSwBSE6iWg0GLi97bH2TRLf2Z4EfhfFucXFHyq5uP+4kNrGV7cT9xsJlkyqT
 VHeau395zZ+6TiYoCBoEX4sJIVpCp0dbOzzhqW/4sORgBOMp+NptqxvypH2YjpJ3o1kEaj/80Ml
 8NQyVHFJHLrky3PqQsg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbebc8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m8q_D-2G2n8EEWQKP4cA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: VokrfrC-FKVge4XkZWkehO5P69WuzP5p
X-Proofpoint-ORIG-GUID: VokrfrC-FKVge4XkZWkehO5P69WuzP5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwiM8+h0zr+3r
 U1EhWSCQdULoaIJCC/rS4O/796GcFNYLREiEVQ3ynN4T4I+BRi5W9Aa02m4LA3PuB5kWz4a8VoA
 YdtVFsHK/6JN0GQf3PMEMA9H36LpKpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c1f61ecf800f..cb95a492e070 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -152,6 +152,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3


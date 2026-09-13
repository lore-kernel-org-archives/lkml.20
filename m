Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9EB33BBAF
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341890; cv=none; b=lxFcknwMkvVF+sAaTahjt3Z8w3UOYNkC7wBk10mhWAq/3UZpy0xX82dzkAy4IJTncxBSD2eD35emrP5v6jQ7bp7zdMya7XBzgDJUBuaFYi46t0OVK04rdChzC/0uyZafuR9ECHuzWXUwNR04bxmEjq7MKplS6BLd+vQCf6UifWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341890; c=relaxed/simple;
	bh=EZeVNggLDFp49i+zFbHcRV8kVa7+aob18truUbB8RGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WGJ8rN+Mz+zkBXCzd8lIETA0bZNdrPhOlebzq1DEuFr9cxFJfdBZ5LAHRimjpprvT0DfAqupSVPUhY5j7JOtqRZHNEFIoIhqRQfQ6dmh8FiCqHZefBWBm31zxVObK1E0FcPnhWJ4lNPyba4BhBqu+N0eejVTDIDHhmXNpYL6wgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rptv7zTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeHa6p5i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rptv7zTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeHa6p5i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK03p53217873
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pqoDxiAWKMV6OWyFAmtNvQ
	kBFPSx0EJAqZSSmJxGHNY=; b=Rptv7zTdTM+CZXQo3fIFW0bzhbJwJX5HjtcDA1
	Msdu//DY0G8APlLv2cOn0cz75TAoJBk5fKnOFPhs/nuSk/xtGHuX3KzL75zk93XK
	EdIQR1w737K+2hrwhrOi8A2LOBWsqvp7ete19ayuSim9aOicc/y5fEnKJ4HdYu6h
	lQh90la7zaoR0xi3nNVx2daYrBg5hQztZ1LAo2HQ4EPdPGMfsc787Q/zkSc23c8q
	2QB15adTfTFnPFyAnxL3lyZ4rGR/RT+kdCa+c3fZTYKt3x6A6D9zpyC+AZ9eRqKk
	nT6ZJpFsQefeXfx9SAZtw1uG9PjD62HIGU1nCYCZAD2vR6Pg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmbgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:24:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso1010024e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789341884; x=1789946684; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqoDxiAWKMV6OWyFAmtNvQkBFPSx0EJAqZSSmJxGHNY=;
        b=WeHa6p5iSZaW6cjei+ySr9hqDR9qqA2tEUZ0t/7Bh5S8vqUkMHuonXfJUb0ZWu9Sjp
         RgHSbKodny2VciIj2lg7LHoajIjgYCS2ZKTWqQE29giPTrVOGBDfTk47kdGP++/D1IXu
         MJiyM+1AyC0ncREhDaU25ACdQb3Xt2tMx3HvXm4wcrnimf7OZloqZRqpuXrEX/9S291H
         09cJ4InkFP9mmf4P2tnxHVE2Z3v3Lz24NGr7w8l7VzmJRAL425WOGAF8s7IQswSBz4xU
         GRNTaHv19Mmueepn+I5EXg03xdQKcplXfHbOjBC9RSVnQzneeAfsD7EV+nbGNeKKI2GL
         cKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789341884; x=1789946684;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pqoDxiAWKMV6OWyFAmtNvQkBFPSx0EJAqZSSmJxGHNY=;
        b=AFz0HVdm3HKRCN1Sbb/8Fbp0PlAKZ0SAAlWEVIVvNQfZGGEqE5OvZKwzRJIWsJwlXD
         5NplgtQK864XSSg5JDJ4snGFxARBD6ksnRs0jalmmZ5gK05kk6ZuH/MCdlgllAXSthih
         exlnjGyvZ1lIoJUfg1+5LjFk6ub+4Nnq40fXAwBc/QVHm5pjRJv7lWFCrf1iPppmlF5O
         hDTr+aklKI+xB4rEFYfkc3nC50Yam6exxooA0KfI0zEBk3DCkZDl0nWSBbSW1tHcup3n
         CCU/Z+dz8J/1eb3KbZG7TNvKOqevFRrOXnP1EGUbtyyQd2xZs0qqwFxSWPJEzRwu2FOI
         X3Jw==
X-Forwarded-Encrypted: i=1; AKwUvByraiXz5i7m25sgynLxKXMpTVE45aduHzdkye7D5fLQOO+yK7/PzMNc0QMClziqb933EV3lwvAA4Xl/vRY=@vger.kernel.org
X-Gm-Message-State: AFuF++lbHxqLd0NKGcqW6Wh7xuFr4oUFJDSqKWYwHTuzpLXxF+o8JKzE
	T8Qoh4RfWPoITAWXeyhKVjgNnjCt4LhQPod9kWN4Wv/6w4025M5aJYRA7+NSkmwaCHpQux/rL6T
	9SehP+IfbBd96RApc2Yo8Yi7uf/gKv1q8qJyytnKDfMV0DcXxSa8h1Fog8x0/aposr7w=
X-Gm-Gg: AYBFou0NiZRE5xj1PbGg9/e7Rz0GLWttEY3NEXzrylGC4eX0iMK2b3lgC05ruAhEprR
	GrW19ouWkHQmqOAveJx035xT6cy/lVLNO/Dmy9ER/XbVP/+pIlcxVjGaXMi75PGkK3xNRqeZQrD
	Azrry5MKhOo5n92S3/4x8cOpQnLoGc7LbjaBAa9WS6vEPm7/+TIsnLlGwXpn1ihFVX8P08auopz
	BGgeA7+zgqN+Ax9n6tg9UvDqIfp1XxuO4DHY0PySjmGx8ZOq4zc7GqehxARh+80Lcojt6RwgiqW
	EFZjlUUaEeJTM0SaWZjvv8YSMs41VilX2cgJDK7FEx10BwcXRZa9DXUw7e95PLVfBzM49CyexML
	E5CkcVVQdJPBAMfWVN8GpQkjoK7W0rbG6/bikRTXW/urn5Z1VEiHSPN4UdLq3BXghfJX6E3/u5J
	Ipe4MDhiYM4W8F
X-Received: by 2002:a05:6102:6045:b0:785:e069:6c5 with SMTP id ada2fe7eead31-792ab142074mr13116192137.8.1789341884425;
        Sun, 13 Sep 2026 16:24:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:785:e069:6c5 with SMTP id ada2fe7eead31-792ab142074mr13116106137.8.1789341879102;
        Sun, 13 Sep 2026 16:24:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263c7sm21394251fa.21.2026.09.13.16.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:24:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 02:24:24 +0300
Subject: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKgwp2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3dyUAlPdtMwK3eTSouL8It0kC4NkE2Mjg1QTi0QloK6ColSgLNj
 E6FgIv7g0KSs1uQRkjFJtLQAlru6+cwAAAA==
X-Change-ID: 20260914-mdp5-fix-cursor-b80c4320e48a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EZeVNggLDFp49i+zFbHcRV8kVa7+aob18truUbB8RGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpzCygNfJ9UNU9zLgqJpF9/2PjHAJzuKsAhPZG
 3LxNqonhfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqcwsgAKCRCLPIo+Aiko
 1RntCACEchaO2I6uPRA7XMlyzZfX0Ov464yDKvDo7gS8KPUInfvd2AlsLqtrsD3BxCFwb5cgUCj
 fCx14rf0WEhxch3k2/3mU/Cvo9Eq4fhkjqAOSzpKlRM4TVLMGcio6//C6bwx76ehJcE03D8IU03
 wTR7vWrMl9mx0llpwAlSQBcubP6vjhXVa+1lNEVI0WyxtuuEIUAXAiUoi2/qRDrXzn2D5URkwjP
 VzPUI13/wjnHj1Uv2IhF/s5vR8wLobpGZpaVwiqOZ1AMFQJz9m2aPiL1niapIAHVXwYUroo+EGe
 fn9ys61fvLlBJ2YGC2EZvMFXahi9FWxrfrKwcAgp78+CMxSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: k_uqzdPrpKm8Rbili2hLxX0b_V7R8EoS
X-Proofpoint-ORIG-GUID: k_uqzdPrpKm8Rbili2hLxX0b_V7R8EoS
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa730bd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uEdjA6kzdaZioO8ovbUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNiBTYWx0ZWRfX1ip1ULa/VII9
 b3fUe/Gli9mBh/t5aSH398A4QPh8n6Akj5kbrY9ad3hypiuGRe4gNjzY8Leiylh5ExIuzSPyKTn
 KCwXCtlDkxIVxU+ffZ7l8qn5dWHVEWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNiBTYWx0ZWRfXwhriM9uu3wez
 uUknt1f7YT6gnRTBqnHqOdFe6XjPFo5UT8l1Mm0zqrpcSA7yFqAL3kidA1jIDT6DpCONG7VJx1d
 i9IJJdAHs6OSVPV5Lm1A/GOa1fHlE7ya00TqGmK516HiPkpVPxJCmCwsdwC54ddq9q6BM4oB3hV
 Fr1kUufh8VT7UK6pkupEkPGX9ExVOpkjc/NyzxCvLI124fonFh42eHFKif1pG8fSIOp3syhcFck
 N/6zjAUFY9fDqkVQJd1JIUPmhzf6RuZY3e7o6TKX8bJj2wJDRzIuAHmFjfmecTthx/gZ86iwKMn
 oCAfDu7Epqmu7SimBXW22lkoTCPEK47ZGsM5b/9V5Y4cPvYZjxr8QIUHkO+Q9IWkFJaLaEfkRNH
 z3DqtDtiEEdabcGIYG2IaysbiXv9ep5HFUdiz/HVaI2v4gnJ4eTbphTdOZK9OIN62b7VfKpy+Kf
 /uyKQ+3+1pu+oqpLOig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130336

The MSM8976/56 family of platforms doe't have a separate cursor plane.
Instead the cursor is a part of the LM block. Drop the erroneously added
pipe configuration, letting LM to provide a legacy cursor instead.

Fixes: 1860f2a8b8b1 ("drm/msm/mdp5: Add configuration for msm8x76")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 7c91fc1915f3..389d74ff7516 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -698,15 +698,6 @@ static const struct mdp5_cfg_hw msm8x76_config = {
 			MDP_PIPE_CAP_SW_PIX_EXT	|
 			0,
 	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x440DC },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
 	.lm = {
 		.count = 2,
 		.base = { 0x44000, 0x45000 },

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260914-mdp5-fix-cursor-b80c4320e48a

Best regards,
--  
With best wishes
Dmitry


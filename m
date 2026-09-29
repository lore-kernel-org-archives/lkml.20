Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82710401A02
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656140; cv=none; b=LUZOMjKR3jQ0QAFnbbN6XXScmJ6a59ZeNbKSjDQ3OHypzq3pEaoyUGx4siLIR8AzzfAsdSoUs7W+GJyl3gV2zL7KbN34BhSxoc+jfl9UucD7fDnC89PdR1nI4NM3CJXNenfWy7GNtxhtbYQIDeiC15lIdj8Rk5f1+p6W7zEhW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656140; c=relaxed/simple;
	bh=5htyHKHCl9o+PbYW78BpjyfMd9ftMyBWL2GavIFT4qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iua9y7GscKCGUTxBfYxYFRSvd0NawEzfGWrVt55S9lN7+dGPTRVoky1YTyFW8hORR4d+wbOlKHiMbO5aI90Mob4qU1d5XlzdbzTrEmZMuEQiAYgrEbK/vpX8Jbo8wXjcFLqijB/2s8puqPC5zHXyIoDKmMoPgtGQxdhh5XKQO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckeCrnZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxVxVJPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckeCrnZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxVxVJPF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Mnw3891433
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=; b=ckeCrnZx6UmRwruS
	bmdUpUbee/0XMGzvZWpJ8DJa5pCVyI9B1n0XyHpZV9ZuF9vGpzbHkLs895l836Ek
	qLHVXtJxPDpTu+9N8lmIUcBs3S90LowZZCkPsDi9tcrpO7nXap127uA5AAfw8fga
	PckI1l7yWhKzCzRsnzI8Od2Rf3lbc6rTAvgJQHvBRiy9v8mMNNjHF6xLHmuAf7Tz
	Ipuo96GY5rChoDz/GIucSLRUSFmGHX8MHTxUQBSicprc2weB4zkbc6AZ8Hl2l6xH
	tkt2f47uGX7jT8nBlJYUJR9CkoNvpUFsgsRNDi4ZAXQZBR172ftw1VZwm21avj5a
	brqvVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkv3w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914355c5a51so68854226d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656137; x=1791260937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=;
        b=bxVxVJPFV9oKKdKmHceIna1+7bKUaTWOsv3EzGSRpV0EWIMOvJ3+4PtsuZ5/0QwxqC
         s/2d+k2RCOau2hfORmNT136JnmbcxPK7BkDSV/VVhX81lMo8QXWcl2BYELLq4TnOxKYQ
         lqlGcEK2ZYjo2Mswr53SGd5s6lxGlhuTrm5mQ+K444jkSbUNtxztbXC1FT8t7iEYou0k
         V9pviVQIcZyLki7ZkvaJ7f456opdTiVQfk9nFtSl3Bc7aBouBbdeEYhTu1kmdZnkJ2Qx
         rf302bjVtuMcerlsmcyUvBDvXvsgbnpA5PTfVNLkkSTesP3v0aAsB0CE9PU8r2Db9UJV
         NYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656137; x=1791260937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFMehukAqEhgm8Zxo1p6NeadQI8Gqa7siR9Yx52UGMk=;
        b=MNjrATHCWs/a98OZBa662ZzDm1XJnmfvyCIqYbJRCVBviydUPWH7WB6qrrlM1/rBtc
         zzErWQIYo+WE0Wc2tEgVYTBcgjnNc+JUoRbn/KkTycq3p+Td/bmnavZ+oGjJt0rKjxB0
         sB9D6niQ+IZXxb/ad81CouE4QR3zUpDYUzDhY/mukv8WQCo6ERUo97K3J2030u7bGCmy
         Gg1+MGYrCKHtRhTyUuFYOU6LhlERAN0hNGSILiTPYXmZ5X+CaY2zIDFLl6FAjdPDnrST
         UNt0VLq20tds6qVfFfeCK3CYunorl++KmXe3w48fLX4xY1ud2At3sTgIfjWvdIAV83Kd
         Wz+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWHbshMtVrygzLKGLPRFv8cyp5yGCScMnW/EHbOibJgfmMTD6HdJpnQ3zKb8oErygZfVjNBo8d5yT04eg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8pFioR90/0OZqmUEoh7Lr9V2xi6v2kDeYwwYog34gKXq2Ti8Z
	O2QJBOE4l6pgg5wzHzLo4h5fB2ZzOiw9X5HszzcbOAiJp8ZEDIMg2L8jIfkrqcr2cKqRJYRljwP
	opbWfFxfW7zOmWVuapAmhy/LY7qtKfqoRim9bZrvD/1RCNbV8O+p//Q1VHE7hEautu7Q=
X-Gm-Gg: AYBFou1jPrLCCYkxObI5mhS/uZNnBya1dhezxWafRJ+r3qbLKIOlqSGDx9PoBckDTZZ
	m7c0NKj1jVclNRiq4dHaC0Bd4v05dfOrmLgs5DXBDQ0i9yPH/5NnZV16MIs/ot7vTMY7aipIEUA
	KdxnVTOqpxo3I04hsIkZ63YJ5a9B2VNBzjDwKWOxjBzrVk00tTkDZy52eVK551WdhwTd2qhwvNX
	scyPpgnYbhfMxMj2QXHheeutA8gARd+PJWzqkZMx/+5AH735dkQgqAbfdjet6cJtCergM0cE/Ri
	cmLjUQ0HhQRoTB5QONfTjrdmk5ShDpvAbJo7vVIRyQQ0OxDQ47LTdXJVvB3ZpnhnppPpqiUrG7C
	lIOvZIdp3b7U0NlKKuAHJKipyQ4RJTCXyBTTmqBBW6OCYGNIiAAenSQvUs6iKeyg=
X-Received: by 2002:a05:6214:493:b0:912:517b:8f5 with SMTP id 6a1803df08f44-9142f93e82bmr240773496d6.39.1790656137486;
        Mon, 28 Sep 2026 21:28:57 -0700 (PDT)
X-Received: by 2002:a05:6214:493:b0:912:517b:8f5 with SMTP id 6a1803df08f44-9142f93e82bmr240773206d6.39.1790656136925;
        Mon, 28 Sep 2026 21:28:56 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:56 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:56 +0800
Subject: [PATCH v7 32/35] drm/msm/dp: mark the SST connector disconnected
 when MST is enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-32-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1197;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5htyHKHCl9o+PbYW78BpjyfMd9ftMyBWL2GavIFT4qs=;
 b=Htcq/cd08vgiwo2WZz1Ns8qcJpcWLAGy4lEg9agUz1Lj1glaG45ntMYmEWSpK1P4kwu6DU6Y+
 i5th5qSz060DrXvDI3dIYnXi72pkGHgLrvNgR4ocWHilfZY401bSd9Y
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX5WZLzQZtOV3v
 6L9+vpEJAMK0b8UvGB3rAZ7aut63fY2HrG10fYLL00fjJ6DjyEnNTaWRe+1ni1QkWVKKtYIU/4a
 ymb4BxnHgsEBa38OJ9eb9J0mSPYVjQ3sgaloWHrE5WoTqDAjtG1VRmy9SkjVRmwkE+tNq5icoH/
 bIJX7GcH/tSqRR4dGw9NS27Glp7GYgzuckcbMVT8+xwFcb1Tx/pk3Ww6J3+1M2tPXSqT6Tejhr1
 s3f90s/1w4L81iVP3HYf6pBMxDsLeAN9SBy2yKOfL07jh+RUHn9Kr7Gjn7qqdIRUwPOaWG5l0dq
 31NC9gYxuwKDj2GxYO8oq22C0/EyHvSWmVVfEREWs1yF6qNt2Q2muupf9fwZ3Ik1iKhceCYGu89
 SntSEWNnotXUuj1n2cMqwY1wXpdhITM1oeq09+OcJCM7nvw5hy8bChTpWb4wXT3zsHSmWqIuev6
 KjqT9NE1zn2GQT+9hrg==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb3e8a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VuhzylXr5gTqft-DN9kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: IMXCI_eyVaGuhdLHNfQffaOUs5MU2E5o
X-Proofpoint-ORIG-GUID: IMXCI_eyVaGuhdLHNfQffaOUs5MU2E5o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXxh08hNtGUIdz
 44ghxP0p6wYQd4lFBd+f51VRnYy7cn+iCShxryXjQetiEUQF4wmezgKJ5L4X0wGCO8PEPsZpnvd
 ECcMgp5hbcB7NO2toqLUrwblKlkiwYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e8181932c27..327777f5c95e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,6 +290,10 @@ static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp->mst_active = true;
+
+	scoped_guard(mutex, &msm_dp->connector->dev->mode_config.mutex)
+		msm_dp->connector->status = connector_status_disconnected;
+
 	msm_dp_mst_display_set_mgr_state(msm_dp, true);
 }
 

-- 
2.43.0


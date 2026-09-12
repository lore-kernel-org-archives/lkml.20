Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25341A57D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225767; cv=none; b=Aw08ZfslvCyBN2bEGJVHmnTptQx+uT3N7WzpwFjhm9epkdK1dzxGdwgJdyNbilqUa1KGNpZfCoOMNeO9NKVgNo73UzPPmobjo7RegIrpj98UojJjGZYyQar/+Is3WGQf7TCzbqbtbriIkFkVT4DtgHJuEtHY37KlJpxQtAnjVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225767; c=relaxed/simple;
	bh=E+pgQfat9DwTCUXUsfDAxoX0Sb4N2yvLcFrtGR2PfNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLObXFQ4nV03WU2O4lnkZmvmwewSHUTd9g8x5NStoRYHRuwsIBL54d8C/ZKslkG6vBGKl6j9S2mchEClCMt7tt5Fwm03uFWTDJZEvEBRkvfNnGbzvLuR39+Mb1l6iHJwXhCeKsKBM9Ffk6qOoUhECrup6R6mKXjikYATa0le7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0/FNeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0FAgUA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT0/FNeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0FAgUA+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEeMF23829996
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrV
	QFoYNlZk=; b=TT0/FNeN1dsS79JksacI3EvHp0CovXEJEt6QGB7lEjvOWzxQqpl
	Gl/8W1SzHH18cQ4ymfen7V/dJUesODf0zWAlg4elwA4xH6ZkijtfNeQ/eTQ3MRXD
	soJNgh4mTEVbzY2WvZOLnAQmh02srKNypq9b7Hhdr6CWdPTc/jDO+2qV2Au0QINt
	hXLlcH2/i6BozM/eFtfNkk7p3tu3NhMbxzt4BgMoGYvvbAknCgBIQ+6myYRP/Z1O
	LjodWYLxbSpgr41gBaEFsYNfYAAdwofSWkkkZGReAzjHqCB8bwL6pBS078hAaXCh
	BaRh1ASLbHaHaeZYZUGk5F1PC4kn03pwuCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dh7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:09:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1645241a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789225761; x=1789830561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrVQFoYNlZk=;
        b=H0FAgUA+NMaXKbsgIqDVdCnDU/EdBXyM7jeUfd1lNb55WAvISNLfCAM0a1TRsTK3Oz
         6XRjhM+rwy7a59bAYXVemTJqwgIilLZxa8iDSVtuGBoV0ZgsNcnGG4pggy3V5SDqkoI6
         3DDMq+1+kP8szItN9nKpDG6FiOQbICY+W/nsOE7oifw/ny7g3+nmduavChlG0Z58OSIf
         VXu0dJERzwyFNWQru4zrsRpXv1myMVe+gPmJSfewi/Ps9CVWT5SibOtYfSuPJKPYDmIO
         lb8lkueZc3HwpORilQuCm1IMBzM8vdiS8o0Z+b6TCY7RyVkeH6oRnTzXgT/huPT9LcWt
         sK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225761; x=1789830561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrVQFoYNlZk=;
        b=kiMCjuhgzXo01enG9ulzQjEFqs0hgZP6TnJn64xNF3rRDX5rjKXOwlR3QaRH34lJX9
         8j4FeOCtUFhOS36AXlRDylEqDK6bidebkqvVGSZ/APG37UmqIJUa9HCL+/B9Rl2WyW9u
         jywoRJL+toDJlnHqSks0lXrH/c9ZijqyRdvIMIKdr+yYtarzbFTVCwFzOhTPcAvMwGPB
         9gH8HRNj8FcmK+uWYVD3RHxiNDX4xXx94xmWQ2DJgdlXQlRJZoT+4Svmq5dqnnu8LBJf
         WfPnGDJ70fv52d9tj76856cGIlhTLLTeU/z7IHRUj/vVf9J3PXyj11oe1+qu3ZCfr8V8
         HgNw==
X-Forwarded-Encrypted: i=1; AKwUvBxVu+SJedBTTQXa8ZBqgtcqoKXMrFNygLJtkM5WVzyN2Hfzl9hc8CvNFY8ECSgmowELWCLGUB8weHvS+8M=@vger.kernel.org
X-Gm-Message-State: AFuF++lTfx6GpHLrOfNFkOwC6qP2hiQOAGNF6zPLoOThSY5hzDIfSaEL
	2f/Ad51aRIOYYCR96UBY5BL4UwiaZ6kzTr5sjcWE/AnKmg2kEhYfmaEnxqhKSQ4a1bM8jWD2QQ4
	pIxkFQ3vfRIV/DmbtGHJqXD2GU5g1i9ultmlLiPm9Oz5KycZgeMIBqWl44tZEjj8csW0=
X-Gm-Gg: AYBFou0T7EAYl52UT1d2/aj0xcyhr6AMZFxvrkHAX+tzZXgI3dud0KVU4bl3x6xV5K4
	Zls2nKPh5NN1X10KTlqBlI/nUuz4LRwS7zzRdnMIWmfIXRI2Nhx87x7KVp/8+MLsOrGPoV9IdhJ
	XHUyJOp+YitNUvsSnLU3HbGA5liEUOLGb2TmgIyCe57kZGihvhwktzNBSfvJrS2sHlLguB3mZws
	uyIqducuDu2iaorwqy2RTMz9g3wRC+PXuj3x4NGfFeo/geNLo2p3glRVNvYnvunSgHEE6Jyk0wO
	cmlcnialYGjDwz2cyCicBy2v836CN9bQOec6nk/xLER/J3gvlMQMkEr0wH5Vn0+hI6ai+3VC1lm
	1u/eGkTUIDSeUlxLxQJio6Q/xN011A46tcd4jjdq0aY+gyGE=
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3daecb013demr18650578637.0.1789225760841;
        Sat, 12 Sep 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3daecb013demr18650511637.0.1789225760410;
        Sat, 12 Sep 2026 08:09:20 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6549d95sm2564095a12.12.2026.09.12.08.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:09:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Greg Ociepka <greg@ferrisoft.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Increase GMU FW init timeout
Date: Sat, 12 Sep 2026 08:09:14 -0700
Message-ID: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1wsL8-dp_odTffDzibVKWVGUIoW6kjQ5
X-Proofpoint-ORIG-GUID: 1wsL8-dp_odTffDzibVKWVGUIoW6kjQ5
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa56b21 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8lTVeMJbxB4f0FvlbnAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMCBTYWx0ZWRfX9obIhuW+gsmF
 SOiq9qD2rNCN8v+PT94mNbTDS+miMjYazJG7qQrWfVKk7e/vdoVCI+q/6WURiyYDj9i++/ujCTS
 hJ1O8FqCOkDX5Absg9yFORmOdWRAOzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMCBTYWx0ZWRfX0tshi1HXTcVm
 6x13ryq0Dnhi7Ov4yXkI+duewSJkNh7n+3AbWClW/jGo6Ze6ecK4jDqIEVzjYjSDPXfrjLiYqrB
 bNCkE8Acl8AQJWfpyTAS5qJ2Sn5Py3xE1CUvCeZlEgDAwXe4zJ1gxChpR3HkP0wisVSH3PDGLWA
 GtCTMuhjHL1TqtdTrjIDezZSCuG4qigCpVb+L9wV/pMuUDQRXqB5loCWD0HY2k38fty1XYSJgdI
 xj7BWIAc5N+18oRETbzMUa75x+dZBBMLvQLwpsXoYcMIdVOL58zjZCtoL36Ngzr8+8k0KQG/YfW
 2ptoHw5USIoGtUzk92+FwWgVoWIXADhKN9J1R1r8iUXBqC2ugxxkma1qkzDNcyUTcjG10nAQDq5
 WxsDW5VW9okYRiVHVE84Pyz3MHZbQPhby2C2fKhLjVfBmsxp4cLb4NMvR7xZKEAw4co4dom9HNm
 UWJUeeOBmIFDGN8XvWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120220

We were using 10ms, kgsl uses 100ms.  In practice it is usually takes
less than 10ms, but very occasionally goes a bit above 10ms, leading to
a "GMU firmware inialization timed out", from which point things go
south.

There are probably some things that could be done to speed up init, like
increasing GMU freq.  But to be safe, increase the timeout to match
kgsl.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2170bf7bb045..9290010c8cdd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -320,7 +320,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		(val & mask) == reset_val, 100, 10000);
+		(val & mask) == reset_val, 100, 100000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.55.0


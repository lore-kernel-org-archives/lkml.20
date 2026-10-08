Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5030DEDC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480269; cv=none; b=jBzxQuClBEzO9QBr7x+LgGYmBJos0jq4XZyH3VR+tLrwPi79cEdR8nt+LEYfaW98iKWT2u+PzqEtPFuD3NICUMbwuFl880BtwMx8h8CfhWM931cGJr/NSXT1vdEi5bjHHrfpYmqZk+p5BZDPb229SJSPdpmsYcs+nV/90vBsr+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480269; c=relaxed/simple;
	bh=Ci/PS665BjdBcch+dOPxtPE8vGyH3+My6ZiyIbuOWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtTsGub9M4yhRqUSHasQMRUM2KNsT18QQDAUJ1LifkTby+v7XS56X6fyL+CVSRNoedjnMBgxh6jMcj8rDNHe7zD8CSviQA3YH3/SuRY9oaOaeyMftA8kXtWSlwaqpbSTPusi8FpUNT8LQQFGbzTBofP4m30zqa5IvavxeJdL+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NC3A8YCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPMiEv4/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NC3A8YCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPMiEv4/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698GK3133881255
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 17:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=; b=NC3A8YCyLUwbUwI4
	OTYH/fYsZPPA4IeWRF2Fvy6yVjVw/SARYGnqWItooJ0QN105ZZScruekYx995NCY
	uzQ7u8j5yFBaeTd/YyHTwTko1KtQkqjgoo1djga6VPf4VYtM+EyoZXq33Bcm8T7K
	sfLU3ElgJTClEZkXgUo/sOReyqusrGYIB5TkOatxAQHVbiVEimRBrW+YumK1aqqb
	+z/5wJpEeTez1xZ2mg6jXX5WL1jd3RVxI9WqUEZLFQj+6zrfhaX7qZS0sgfDfbS1
	nHShDDVhECkJoMHAf6uAumllL6G1UdkF4PVbYD/+elQ4gNPfR4T3mwXau19YwWSQ
	BEJbrg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekv8861-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:24:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so1737596a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480266; x=1792085066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=;
        b=QPMiEv4/SeTwBK8r8j2qeTZ3adBjcjr+z7hzNgUfauPdhK1Wa2iZrIWiFpHHW4usdg
         MvMUAB52x1wMzuZyeccE0mscvojLejQF7jeTt401C51xD03xIrk6ZEURob2C+ND4TFrI
         Nf+uxiNdO2ZgMxcafXpKYNcnyb8CQbc1yU9/j0qoS1WrJFUhX+M2sUZHtfw5QAwcf9lH
         zqt3/u9gHkqTfsR6jtH6US8QbFuItNMNbYC6kfpZFDkv0uNjIdgEs7OVYb3OHlqw8GYv
         7mWOBx5WLo0XJHcCcKLk0JkUn1WUih01s7SN6j2AgQhRBxuLwLAToxhrdDZabbevjEzx
         RTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480266; x=1792085066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=;
        b=vgCJ0fPy9U0xC3rD7LgZIkcrmTGdvh3HR9qgHA1NVcZkh0z9tkFxsnLig8+14G+2p1
         SZMCXquYSw8kOYmi80NLbvhFw7zG3rW6RRilcfWwb+TMZjzLR3o+EfcqVo1+Q71G+GPD
         ulEzTxfivvgSNEk/ESBleyrDqlQbPuxu4/aolKYpur7OEv5I1VlHg1ZVI1n6YGC3xw/N
         zAV6hUVgsHST430LXVdeMuJxx/Is60rEbTPQllFHJLQ+fFtizAmTOMIcG96T8aHlpnfT
         L2NIWWU6gmSb0tk3cwLZgYEwERh0aVBYhauli+bO1UCGes+tHZDfEmkq4R71vSFSnPA3
         mi0w==
X-Forwarded-Encrypted: i=1; AKwUvBwyx0l5aCAqDUGFHIsDM7CVHy+GdtDIFofwcXTGU2qnD/StdfXqWjr23ieI9dCuWkrPFcGs8LkUmE/j8CM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLaWSd3UNwNfr8KHzxnQdeJtvoAkT0UgQZSx0S4UdZ5d7lKZcD
	E9lImrmu0bEue9aRWfj4jhYNmi5ngncEIqWLcfyskuqbqpbz1eYbnow/XEJ9r+LsODfhfsZqahv
	baimOW9lHlOaEPbHEwUNoS6xik4EkRjSvUzcQnIE+30KHGkivRnrqr+LXDqs8Htc5gbmyEY2ZyX
	s=
X-Gm-Gg: AYBFou3dKdO7S+LDme6YW11SN2QVLfOBiVz6Np4mxPrhQ35cfkVocxoUrJg4F9A8cYR
	5Q45LYcNowBBEYPMjyiZTrRMsFJKbxt2PvzGtMuEQDvUywdD08trBzgl/2bskTH948LNjMMhuKW
	gFVF6mpqIMjTPnroKEmlSL3LRsQAXkQeXHIAgzYsApNh77wawY6wdQZgyLDen8LXZIO+fHhgpjB
	TwdPpgxNFYdCCdmcVUGwfDExnAf68el3F1Ob3xvLzwBKI2KMtm8EARdsruPsHCCVITY5ryPR0D1
	w569scgxLfDJwabvXyMcbXM3PzX97r5CUQRefUauyLCcJdrXzlWOfmS8Sq8ExOTzsB8tSFb6U0n
	7Dl3HCRBriaMupubUxmvkasTrmw==
X-Received: by 2002:a17:90b:57ef:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a8a0851600mr5697311a91.20.1791480266345;
        Thu, 08 Oct 2026 10:24:26 -0700 (PDT)
X-Received: by 2002:a17:90b:57ef:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a8a0851600mr5697293a91.20.1791480265927;
        Thu, 08 Oct 2026 10:24:25 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:25 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:48 +0530
Subject: [PATCH v4 2/6] drm/msm/dpu: do not assume a merged datapath when
 validating mode clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=1410;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Ci/PS665BjdBcch+dOPxtPE8vGyH3+My6ZiyIbuOWgM=;
 b=z8HH9Ia4oPJR2+l5VABIXCPrBwXDiAx5379BwT+dX7sr3efswNq0FhG5+k5B1GBrj9nTfgpZA
 Zb0DkZ0uih9C5ryuP63VX3vpsk9SRJtHT2G1G5I3CznmQO1mnNxbWHt
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: C2dQMPoPK6NgH1bN_71VJumPHdKh6o-X
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac7d1cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nDKeDdROtNiGmcSYc70A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX9Erf7osOubXY
 P4tXVaEQ8cNtUhUIUW8+mgwiRUNIxzA6JqhAjM/DQZHBBUgjoPU91azkwXNRsQnIyIJeHkvJixg
 t8oEVke6zMxVHBiR/+33+feh3KxrhFKLvkr357zUcoArya85S+mFWBzsm/XWK0vfOKmzIRjLzaK
 bXdq7K+EkRpq8oLNDy31FxlyJ8U5Y0Jd+xHFeFI9pv13fXV1QLiAY8jS5ugLuCF0DeyaT5iwoxz
 z8WZISp0ybb4qjCZkEl/7u9Wy3OQ5WiU2KCAc0FqJcmQswgZmTxJ2LX+8s86AWikw6BralIeuQg
 W1K3G5IaN/QgSeCpcHu7pAD63x/GcXuo20eDnAhIHsttGwzqsfaWovwjvyvKqdODVKfLzVd9QXk
 m5aE/IbxP87/TxvSfDOKKOdDKhOetnfrtK8kISgh5sDDKJ8odNsPLG9RRAzX3/hI4NRco2G0ZAT
 UB+wNfO5L87xfEUImaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX/C7kC1I1LCIQ
 602Ep028f9nROcwm4Km87tkQBBu2cBIL6pPUNTzRKRcFjJOp3bMSgSnkcc9Ff5ST6jDq+8KPaI1
 lpI0pP0iBpjyGI1BEqlVccZL9EkXWP8=
X-Proofpoint-GUID: C2dQMPoPK6NgH1bN_71VJumPHdKh6o-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

dpu_crtc_mode_valid() halves the adjusted mode clock whenever the
hardware has a 3d_mux block, assuming the mode will be driven by two
layer mixers. Modes no wider than MAX_HDISPLAY_SPLIT are driven by a
single mixer, so for those the check permits twice the pixel rate the
datapath can sustain.

Divide by the mixer count the mode will really be driven by, as reported
by dpu_crtc_num_lm_for_mode(). Split modes still get the halved rate,
single mixer modes are held to what one mixer sustains, and parts
without a 3d_mux divide by one.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0b51a4c5db57..209b25dbeb6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1631,8 +1631,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 
-	if (dpu_kms->catalog->caps->has_3d_merge)
-		adjusted_mode_clk /= 2;
+	adjusted_mode_clk /= dpu_crtc_num_lm_for_mode(dpu_kms, mode);
 
 	/*
 	 * The given mode, adjusted for the perf clock factor, should not exceed

-- 
2.34.1


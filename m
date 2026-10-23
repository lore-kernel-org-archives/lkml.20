Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797605;
	b=UwFOT88u3DTwsYqxaCfc8zj2kfR66hy5Sm8LbvteOlEp8OZDLo+skuHJvB84nbvFxsJC
	 xa8WIsMBde9PSTxC8kf5BVhd3GbCraMYPigcgQmD5jKCbaMR/SwtZ9pKdiDZxq4FC7TWR
	 aqdm4hLDISfldjU6948I3gEjM30kMjs+bPoUKuLPNOMMfdTUTZvlRW2DMfbGTYiIIwZm1
	 rlWLjoG8k9lc2/g+1cCn9rQkfetjdutzRhmteHQM7UCGtB3VAxuniunRdcTA1nTRtXFmX
	 i+wRlGu0KzlSxJpvA3K7R7wGB2gerXIL6JmCxRYM1PB6W7jduXg+LOZS6KVtFvFQvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
	b=IMDAPOP1MaEziQanLKVv2xZt7skJLN0fUw2YGTgYsT41lThrpYcZc4WHav27UaI3uUkX
	 j/gtV0x5M8za4shdZE6wa5ro47FqHDgnEGEdgd4afg/OctRjK276mj4u+8GWzpjHyzJdR
	 gkVUHWE7eKlaxAOybUeCEgAomc6bo9gMwcS3quKg0KTw8H2dv52zRfhhlhHIC5RVLjNYX
	 kFpVUTJSsZ1wmvtWaAHeVtRhbzyZqJ/BCIix/bleYH15GWRW13QbtrfZwL3MoT6AEXEQX
	 HxeF2rLOPwKJZYmSwJIAeGibgIuCmidBDj3e6nTGaxUxA3IrrszLC9/+k7VxDVuoi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKdNy2wH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIqNp72P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C48606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C48606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKdNy2wH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIqNp72P
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvBOU371936
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=; b=mKdNy2wH/sX7FwLS
	kKycPfqt4xGo39A76y/IZ0v8++1UOO+34LiPvMnmhjWa1C6P+7ksRu8YoIKrPRw/
	nIIwyhaLO9FEc/kI2+bQKpywHTVcr9G+rTsg93ybF3frNl8sx/28mD5QUZ2qTW/2
	4jABJFCUrqP/BsJp7BBiB1B6/y9bWUtRYCoc2w15sBgMzoGZ9CDiKjGnlQTH1mcd
	HA13RJDC7wDU+GmrmfEaT8OtTmQ1LYjfIhFNK4rypjqIHPSg0Q1rnku8LRMQn9fq
	ifLN9Ji71Pckd1c4KdLqdJuxqnnOpwToaDLI2k5CnZcS2lDmB7zdVb9vmC6TtlG0
	8SJK8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89bj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5383d650f2dso227641cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797603; x=1793402403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=EIqNp72PwNDvzjmDguTjkN4pDkbz9wCvyoX6NrBnOPzJ3DBLsE8klDYjRKrjYvBwDe
         g8pbuYF2nJJa1drbeXpX/Z8bbCoQtQnCvLXns9XfeDtf3R93M0aHjF35r8jKG6Zgdy2Q
         WEaafugjrU+SZNL1npYkUy6L7bQn1x6S50/aR+mZz4PtggmVTElxvMdcv6sSrCvdRPu3
         OIUDlVYltCyKUGUMVBQ0hUWy0fBeHGHgmiLIMzxJzsXS9n5kGKeDpqGkswhT/VL10evh
         /q1Eni6KCmKfSA03C58xbSBbyv1dSgr5+KHeyzZaJYG8N7sp6WH66fxOY5P5s2EBXmnB
         m+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797603; x=1793402403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=GPk55tpL73W0YT0NbxgHVrxdSPxKX5hU5GJ5nyLxpkVnFaAet7SUFDDxdewgR41wK1
         3JGN39TI9qWNs0uRgls1U9nlwaYLZ3RBxgnR7D0L3xshSbhEMMkZIN734aCJTe/TO1CJ
         pUtbaN6CzbsVHPj5LmCWdpg9WryVHyT7+oKWd/XPFb23t3eCE1W4jqIoMibCLS0rbF5+
         oarZ1md1OsU2jXmHMQGjlyFi8An+OjikYsCB9CQruZCAuQb0vV0JHeEDwSgtFL+9JRfs
         a92VYTcviMBnPwYLzP/2ZO0f2DGk7KFpSKhNGeIXHABBwApmdETcNoFOfO60dui6No1E
         InVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJcB+YEYVoQis/BAazUu7CWS4kR7Ycw4aVnyXRGoJkifU4A/Zw2yJwg5/zlFsqTBgy1JZGY5W3WGBfx98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpFaxslSqDbgvbT7r5lyS5GiEp58D95K3/q8vraKhw22IKB/tz
	IU1rDGbtu02ZPLMRTufrkFvJoQoppt5kmTwjso1RK6KL6W+YiVwVRdfRrwEuCf8urrazL9oqXdd
	ZN78mcPdKPzUlgUp8GQ9G8J4dR01vp7DWkkpOUTgnQi9umDHNGfte3k/jOhdblqo+Sg8=
X-Gm-Gg: AYBFou2mQLw+SLyRrDsids8gKQsZ7aCCDdqBe4Lf8O7WfoxrsNmTK38av/xkBPnYt3M
	zA1w/gGnIX+CB+WSdR2e3lf6PtJghofmLsu3hEDrdR98MGsEPrBXgMazFC3KOpo2265rTDjCmIg
	vmM90X3yyJIb9ioP3XMHe7e6N2sQCeOR8A+kuFJGQvZPgAfhnbl8wnBwobVQHDXjwppaDk2yaZ+
	VS+u9K9FUJa6alo98IIlUyXerVMPn0zjqcuUg6zFpsi5QpaF7pmPQQ4U57FfsQiXN1eK6wtYn2E
	K6KK12IY75B27JhMychSB5mCIMzsbSSyU/PVf6aNtfquYetU1xLAKe57Vne/aLh8ujBEzkpQBsr
	QO/nGmZCF0WBfy3MhUVt8TTqeHi0uWetYc8sHr7H/hmyc9etg7rK+Jnj2g1vT+wsI92AAYjWz98
	NKUyqaSp9E8xoz
X-Received: by 2002:a05:620a:468d:b0:93e:920c:c00e with SMTP id af79cd13be357-940ef8fd21bmr96413585a.21.1792797602743;
        Fri, 23 Oct 2026 16:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:93e:920c:c00e with SMTP id af79cd13be357-940ef8fd21bmr96409285a.21.1792797602192;
        Fri, 23 Oct 2026 16:20:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:35 +0300
Subject: [PATCH v3 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8zzii9JdhRdB7nBZfP+Qff9ThpfwQO2kWqv8U5qv/u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uO+QiUAi8caeeJrs1U5ahmbNpXVYKhX02Xv
 hohVY3UYMWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjgAKCRCLPIo+Aiko
 1ZhUB/9FCfpp6kqbpXO1FdSNPOOBOdObQF4s4CoMcDGnbhssHsdSzjl/fZhMtOXIHxXOigdjEJq
 Y1EQldjBwSpggJYu5aHSRglselo8o7y3l/DtPyoUaHSijACh1TdH2VbJmL1F86SASURTSkWhv77
 M40b+aGboElMBGcXCYfp+vAhcLss7R85o1T5gzzHGKkTml6JMEOiFfeW5kp6YDQQ7i+e8oQLaxv
 shMMhIp7aZ1YLBAAo6um0L7wfAgc1KQNNVAQOmjqxjL6XaDEorktGjIW74fBEt+yUF4ZrQfD/fT
 QDe1ShH6DIht3O6nh/Pjz+vMS/fHCllSTWn/MUl7IWqZaH40
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX37CCs3T9M6Xg
 gFT7m/l2YOK7F38uafmaAlmk5aNz9VwzBaEM8HZE7x7XspY333WFhl3LY31AVSbH+m5DtD52UWj
 DYTtdFp4QdGSBm0d/+LkJv6bmunbiH8=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbeba3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=X8-H6Saci9yJdrauny8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX25CtkGuBy5WV
 qkNTHvgV0EPvC7QQeiQH351giOxJ+FgEL9QRSFDxizPpjsyTI84sjarmY6pmx0zS7feSBV6bUjr
 Bo5t2hjvyYhuPQbd2YNM7ayc1pwktkI3ovy7X1YHIyqVMutiLXw8xIn79+jg2gm5KgwnsR5VJyv
 d6Hw1mMb4e10metJ1K+3aEI0tLYsONNUgHDSq5nDiuTpLUKThpcV2svOC2O4ECDzFWl7+Gmkvnu
 yrz6AHUDpzo7CPPt7sUW9Pekw7cU7lOtL4Tn6e87egalIoCeZ8buoexSoLn0THKUzHqUgj3DzwN
 co0aVRbqt4+aJ7C2FqRuhRKp3sVu0SZG17mZoMNSQ1aO5gWAgSIXDchp9H7tQNMZHNGKk+fUCfz
 Q3pqPFQlvA+zPOGJarlKv7SO18iZTf4ffL+SqDbl4DHVK3s4J28q0lIJZERgFR+cvSIMVmu1Vbs
 /+tl7BctbuoKJgo7HZA==
X-Proofpoint-GUID: wpVm8AKkFzQVr7KeWX0TZmposP05GYe3
X-Proofpoint-ORIG-GUID: wpVm8AKkFzQVr7KeWX0TZmposP05GYe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

Binding the MDP5 driver again, after an unbind or after a failed bind,
corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
oopses in hwmixer_init():

  Unable to handle kernel paging request at virtual address ffff0004d411f9d8
  pc : mdp5_kms_init+0x264/0x7f8

Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
but hwpipe_init(), hwmixer_init() and interface_init() still run on
each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
without resetting their counts. The second bind writes past the end of
hwpipes[] into the fields which follow it.

Reset the counts when the hardware blocks are torn down. The blocks
themselves are devm-allocated on the MDP5 device on each bind and are
only freed when it is unbound; that leak is left for a separate change.

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..085c23820f46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,6 +570,10 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+
+	mdp5_kms->num_hwpipes = 0;
+	mdp5_kms->num_hwmixers = 0;
+	mdp5_kms->num_intfs = 0;
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,

-- 
2.47.3


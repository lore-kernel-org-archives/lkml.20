Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797939;
	b=wFfNcCknU5qs7PH4LZZxe6XAExAcl0UMxxSlqwwisOb4ZQ55+bMFC2M+xWk7aIc5unzF
	 cpmbnlQgmb6EzClYngLao3PS+QhrxIcGwxAPImB0z3BjJpSfvcf20ewuX/xn2wTNx1+FL
	 nvBC0zTLksrUyJJCpykhWH5CTEtcmgKFFMz3U7jLOFNRet9McwFVS1EnQtMaKkvG7M0Pw
	 3JBUer5v/FRtOVjnerSOTMsCeCfgBBMJFKqxfyuefSFqC5aY1uZAiiNgMaO0Xsl6pUufW
	 QMMlXprzv9qcx7wrcCfQO11Z07ej6gC2ezsUFHqaM9+lM4T5Ofcjx6K1kiy269d9mbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qOShQj0uJ3d7Zum6NFZJy8Ct97Abc7xdZVqjTNdUtKQ=;
	b=MMTcFeHz6xqX7+2tF74Yy+jgx6y41oAzZLSjUwR62JWGG1MdHGhvhQin3lCPmjkO2Z4L
	 MvjlB4cXCM48yRZUJkNlBeBQNLbipmNQAxAM60OvNCLYjxvRMXOf1vhAmVlXrESmCZ3B2
	 R4nYPYtslnbF9TPGtYnJTQ07awNon9Vol0q3VEUiP5Ekz6yNesnNOFRtvkMm5Id3Hh9v1
	 u+l61FR0Fqcf31UagJL003oDBmKYun0WQXvMipZxFaHva04gndGC3wmMVjurdnhWb9gxa
	 /lrmtEvGK0gppjefAAt5lI1UtGe9HstmYaOVE7v+ATFasM+ethlDS6yIB8AebfIn0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HNB+HFsJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WktU6vjn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC04B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HNB+HFsJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WktU6vjn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvCwe4006342
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qOShQj0uJ3d7Zum6NFZJy8
	Ct97Abc7xdZVqjTNdUtKQ=; b=HNB+HFsJL5Dr9zVCeGPuJQjarVVSAHU64ikXrW
	1gIOq7DMgLSduKhzEMtaU5zrxUEYb/5/C+PvO8c4bGKDLxjicu1oikWKoEfBj325
	Wki4aSBxz4ZNf9TfanMltY7LSMi41mmy+vTdhsVBY1aaKbaKKySxMlBr7Iw2XYrO
	I3Lo8w35z2YTgjnV51iFSHqZ0R1k7Oh0u5Aa92/g8JOnuoNoITNa/0D/hvbyHIxU
	qYyKC+SxFTzIEZoyYjomOATTFNNAcvKFD6Ywv9SBTPFwPPgzaDjPp+0X8cjs2jlv
	qv/UlZ9OkvqdqXKwIOfJXYx+obSslNY9AsaUtML8y+lc3DJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn26d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so251952485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797937; x=1793402737; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qOShQj0uJ3d7Zum6NFZJy8Ct97Abc7xdZVqjTNdUtKQ=;
        b=WktU6vjn3VDQXSLUGrRuP1mpPzvmwk2YcLvDlioUkYk6mL0hDldNS8O0MJ7yMk45X3
         1bDQmju0fwfFblJyZFJNeOJI0y0uhemyVFH6hwbJaqBe9uIdWzcHk3r6cBAP7eTbYW26
         Gt9mJigffcHjpJJgdgIVyOEm+CAbHZoLClXMaEis4m/Px2FdJud2Y1TMqn3hAV4dymca
         zhJGA5750ooGWDGAKviVxuRauEOU8GsunRWbZe/fP2yJRU807gelPyXcM5XjHG4Zj8CS
         DsUU7L0Iy94+QfuoRxxktkx8DvGdmJF3ckdlPrO4UBZKSxKb43ibBTaXY7jVyFhM2vpH
         2C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797937; x=1793402737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOShQj0uJ3d7Zum6NFZJy8Ct97Abc7xdZVqjTNdUtKQ=;
        b=mTGvDxTR/GbYacPxXn456tv0KPv2QiLXTzs4d4ucGyPaEn2qbI8/P1rc6aLEJnHNLr
         zUTD2lq9X3KynYMIdz44SphZkou3j4Vz6fPFSQ9YLcSQzqOnfQVwnve4BMMLKmrrsLqc
         CpgsXpTJUEkdjK8pmfuiXZi4SUA9Srj8l7oJxH/1L/3KgkJb82Y3tZPfV0qejXpDEG/B
         RkVFsxu9Zlmkj450u8738j7ENNjZdVn4YCKEe3ZZme1F5DsAsAv5V2nZaz4Pa1gQiQzQ
         5gH9hYg2kRfpRsV66LLksWuKgzMEw87f/oT6/4cu7zIan7Z5KuUAm+1Pj6t0+139jBy3
         swrg==
X-Forwarded-Encrypted: i=1; AKwUvBzLkX4SPMu6fj1E0CIasYTmYEgat17P55XRp57tcQbIeSBJcxwGXJ7WFGrzE4Snf8aqdPPSIZPXZhfuEcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZqPVeplYsAsV+yWuLbaitZu6KK8HnEhybr9EsG+kv4s7JRmgC
	n5fXpBqDz+sK1WT5Qu+p/RGz1wKINZZ5FEYkPHE1fQxj8J2B8aijDB35y2r4UE2T7frJR76wcPV
	rL5C+zg+c5NZxVksVABe1epYOjteMFf9D7I0Vf3VbAz9NGBGAlfJeBtZZ1dR5qGWBINk=
X-Gm-Gg: AYBFou1VjJaBUe15Tjf9dq0lrhrpPr4IwY3Yirb/rFcBoqStMXYYsNkwamwqwZkNiIG
	jiYSSGGkXqShDblCJZWz+NVHrPsoSpr+GIh/Mz3bn/8IC9umhElES0GyCR7UK/d0M1rmgGt9Qc6
	1mHTne16qOR2mkGQ1h0zBXfOV3jMQmlfDbSgc+woMVT0PqN3bfahYQehvWIgZNdFlBk1haZUqvu
	O/vNwQmRr1OfL7r6bUWW14q8BN/vCB7knSu9afzb61t4DMuASh+bRi7lD19xdO5QA2QkVYNmZSe
	NENXo2hC6WfOzrHBHeMUAa5UBsk5ln+4QpXlB3178oQfJBF2/NsuM/j5fmeSsX0Q24v5I+ALNLM
	ZBZJ2c5SN7vfujFOr63+4EztGq++au1K4yIa423FT5jo4LwMo9D8gO5oACEj7hwYtXwUC8A4uFw
	G9dqAjrgPnTggr
X-Received: by 2002:a05:620a:3184:b0:93b:d79b:9a57 with SMTP id af79cd13be357-940ef986b38mr82194285a.56.1792797937128;
        Fri, 23 Oct 2026 16:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3184:b0:93b:d79b:9a57 with SMTP id af79cd13be357-940ef986b38mr82189685a.56.1792797936586;
        Fri, 23 Oct 2026 16:25:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/10] drm/msm: fix SMMU fault dumps
Date: Sat, 24 Oct 2026 02:25:21 +0300
Message-Id: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOHs22oC/3XQ326DIBQG8FcxXI/u8KeIXu09ll2A4MpWdBUlb
 RrffYjN1sT2huQEzu/LxxUFOzgbUF1c0WCjC67v0rB/KVBzUN2nxc6kGVGgAiqguDX42wfcujM
 O3k+YGq6VarkADSht/Qw23WXx/WOdw6S/bDMuzO3FYE9TihrXZ/9JdbHmMMA++BxkbBiH/oIzi
 qEFrolhlZasjmzhtAoWN733bqyLtPW6bHb2PKIl/uDC2A+X3C+SnHarwjZVIsGABUgDlFdECPH
 Wh7A7Teq48Lt0ZDLSe0ZuGZqYilVEkn3JqZJPGHbHkO3HRpYYVRrTiNZSYPQJw/8YAo9K8cRQx
 bnhRqqmLB8w8zz/AuOWy/4JAgAA
X-Change-ID: 20260902-fd-kms-fix-smmu-2d4baaf460b0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7388;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9gsbuRhdPFZBYfFXXLiFzSoka9OhpnBxLUCPjEMIkCI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zkRr6us/8hNHsNgb5tgofxHAhUjPEDTPbOY
 lH50yJm7WeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5AAKCRCLPIo+Aiko
 1eXDCACk/6aB01Sj/56mDQmedmHP+qhgXyddQK6bPz/xNwRWcf5RLsLKjhQJbPYQMOc6r5Q8bmW
 tGA6zwx6mXErRCXVO1OSGkcoGID8aHe24FSEYpQd78XE69roCkQ+06t1rn3uS20iAcS5czmKfLu
 x8mBm2J0DQavxjJIwlck5hFATk2ZjrfVytNtagCCIxMYcQzOP1RExSYW0TTDYNxSKH0RiUV2rWS
 SFDWTPv4924MOoCbRqyzBe4vdjy6L6jnAT92u9J//BCKPv3j4WJKsKtiNxHABUDYYgQDppM+K2O
 46R62wHGJtaBKn1ZQJcuUWqXBvKPUdyhfS8C4c89Pae432mH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzKvlg//6NsHp
 mVv3C71Aek+C4WziTwOsMAYLFn4/W3DZBaK+L+A8Wkj8I8RFpoxrFPdgmCL5fwn8oOi3Ddjl2M/
 H8i0Msq5w/gU8ioSg0g2GxkCXwR8kUNAD+GmnAzyJwl2FpMybpmxB7oBEZHgXMjQ4FKF7I8r5ww
 d3UvQhKRCN1XDkanJpVF+Xdcd3inVCiqyZLF+BNIdIiG9ahyDmMuzzstRyB1cY65ZeydyN4VSfA
 6uJT42sBwBvxSHGchKOWKA/QvVUWMI6xtDuw9BYzhXPtmwcyY7ppUhSTQEll8tE1PyiGiN7R/mL
 iZdYqtsXGPMgIWkoTGKuB5R3EaRX8GwCeM0BsMZ/P5mzu0uDl1zJzHFzjrdjRFGWuv3C74WsdBX
 d1TLWs+3vwi+XsD58OmFMXxYUCUXxA8YNF1cYHZj+H9uZTzqKx406IiRXQkPJ7XELJ38o8INM5A
 e2T6/ieyjFl5yDGs2Cw==
X-Proofpoint-GUID: 05QFIxEv6GJ4ZclGA7hPFdq5w6jXOvsC
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adbecf1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=9OaiLBg4dggejaDBeAYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 05QFIxEv6GJ4ZclGA7hPFdq5w6jXOvsC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4sLBrTIYTY/n
 RkGfdVS0QyPPGNC5GH37bS/GW0IbIcciXYhVx890AJixDeOmmOwgX+P22Qe+m/1RjJfWgylNY6y
 iaY+lMWBEE0eSKvdG1JIzae1Aheq+rM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix the cases which I stumbled upon, together with the issues
found while chasing them: hardware block pointers surviving the
reservation which handed them out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Rebased on v3 of the KMS init series
- Keep the kernel-doc of dpu_crtc_check_mode_changed() on that function
  rather than on the new helpers placed in front of it (W=1)
- Explain why msm_crtc_vblank_off() can release the pending framebuffers
  straight away: the encoders have already stopped the timing engine
  (Sashiko)
- Link to v4: https://patch.msgid.link/20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com

Changes in v4:
- Take the framebuffer pin lock with guard() instead of unwinding through
  labels (Rob)
- Move the fixes of the KMS init error handling, including the unwind of
  msm_drm_kms_init() from v3, to a separate series, which this one now
  depends on
- Add a retired framebuffer to the pending list and schedule its release
  under the same lock, so that msm_crtc_vblank_off() cannot free it in
  between, and track whether the vblank is off next to the list rather
  than reading crtc->state, which a later commit may have swapped (Sashiko)
- New patches, ahead of the DSPP and DSC ones: clear the CWB and CDM
  pointers left by a previous reservation (Sashiko)
- New patch: flush the MDP5 interface before starting the timing engine,
  otherwise the first frame after a re-enable is fetched from the
  framebuffer scanned out before the disable (db820c)
- Link to v3: https://patch.msgid.link/20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com

Changes in v3:
- Initialise the framebuffer's lock and dirtyfb count before
  drm_framebuffer_init() publishes the framebuffer (Sashiko)
- New patch: unwind msm_drm_kms_init() on failure rather than handing a
  half-initialised kms to msm_drm_kms_uninit() (prompted by Sashiko)
- Drop the pin count from the deferred unpin work rather than from
  ->cleanup_fb(), so a framebuffer scanned out by several crtcs stays
  pinned until the last of them has passed a vblank (Sashiko)
- Defer each retired framebuffer with its own drm_vblank_work, as i915
  does for cursor framebuffers, instead of a per-crtc drm_flip_work: the
  release no longer takes a detour through kms->wq, and nothing needs
  setting up or tearing down in the kms init path
- Release the framebuffers still pending on a crtc by hand when its vblank
  is switched off; its interface is already disabled by then, so no
  further vblank arrives to run the work
- New patch: clear the DSC blocks left by a previous reservation, the same
  bug as the DSPP one (Sashiko)
- Link to v2: https://patch.msgid.link/20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com

Changes in v2:
- New patch: lock the framebuffer pin state, it was updated locklessly
  (Sashiko)
- Do not defer the release on an inactive crtc, it was leaked there
  (Sashiko)
- Flush retired framebuffers from msm_drm_kms_uninit(), before kms->vm is
  dropped, and only for crtcs which have a vblank work (Sashiko)
- Clean the flip works up after destroy_workqueue() (Sashiko)
- Fixed the long-standing issue of the msm driver roguely setting
  allow_modeset, which started to manifest in timeouts and SMMU errors.
- Link to v1: https://patch.msgid.link/20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Antonino Maniscalco <antomani103@gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
To: Federico Amedeo Izzo <federico@izzo.pro>
To: Helen Koike <helen.fornazier@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---
Dmitry Baryshkov (10):
      drm/msm: serialise framebuffer pin state
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: release scanout framebuffers only after a vblank
      drm/msm/mdp5: flush the interface before starting the timing engine
      drm/msm/dpu: clear the CWB blocks left by a previous reservation
      drm/msm/dpu: clear the CDM block left by a previous reservation
      drm/msm/dpu: clear the DSPP pointer when no DSPP is assigned
      drm/msm/dpu: clear the DSC blocks left by a previous reservation
      drm/msm/dpu: only reassign resources when the encoder is reprogrammed
      drm/ci: mark pixel-format tests as passing on SC7180

 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  36 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  23 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  17 +--
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  75 ++++++++---
 drivers/gpu/drm/msm/msm_kms.c                      | 142 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |  19 +++
 15 files changed, 276 insertions(+), 62 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0
prerequisite-change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83:v3
prerequisite-patch-id: d7439e7df4daac116217eb0fbbc277974d8dc1c9
prerequisite-patch-id: c1e587e18e63a6d5e97326ea2d93f58bc109ea89
prerequisite-patch-id: fb2a9d3af5c8fd52a0a3907f20f6b90661664dcb
prerequisite-patch-id: ed404293463bd438758cb0d1ed48b0c4c6de161a
prerequisite-patch-id: 5519e2e012b2065c08849502118233ccfd61e9d3
prerequisite-patch-id: 09f7ca53872a2ab17488f2bb94a1c2cd4c396781
prerequisite-patch-id: 3bc29c32e4b7fa71b785e0f7b6e16aebacc5be60
prerequisite-patch-id: 63305cbd316626057e69ebafd6689daf10f2d2d8
prerequisite-patch-id: 11dc97f7f4980bdad49123271651749d0a8f8d23
prerequisite-patch-id: 79bb5b490e30ed65caaace15d025974ada206d86
prerequisite-patch-id: a1d0abc303bb5730ac9901a29d678db593ccb55b
prerequisite-patch-id: 346f4bad40a14c72fe5966a9adb0d258592bb546
prerequisite-patch-id: aa59ee029b6f5b24d6870208ebe8a5464204cad1
prerequisite-patch-id: 2830113c25f6fafe3857fbd4685efb161d19984d

Best regards,
--  
With best wishes
Dmitry


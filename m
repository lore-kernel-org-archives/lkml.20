Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747944;
	b=Ta7z/A2LMR7XDowBytf24OaX/igUsKswZ5RkFmKuDHeqR34B+bdCxXpupCu4vtbEn6kx
	 KYsc55/sYfuPlC1BOT0U9QXmL39O3dF+3bbNwFAxYNwiN0SzPXVx3uCESw42kkLFsU+yv
	 woVRVNfIcsbznU6tzBmc3wsaAkOoRR0NVtStibl7/W2aPXWCYuyfmWM/UdqlB1hiYgy6V
	 qExn6m/yfrnWvpsRFwKeXsgxL4GgLCvdbPVGpe9qCWEu7wYjSNI5kxjI2RII0ArrXAnAF
	 Lwm8mZUV+D13dMiXcg5jd7V/QQbIbFMPECdphvhl0tmqD2uX/Gf7vGI97X4n6EnhSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
	b=FGdjFCat9gB5kWfTRvtJ65Z377S+8Y5FRkmC6UaV/EzcALbGA59+R292l4FZoyCxf6+E
	 hjOJN8dFECfOCC4p+IoXpEdT8xQxvbMwSDR5QIOR+EYPkLrZIqXyBQI2P3SlbpTr84r7/
	 ttA8SzTWQbbeiz09L3cQXFWrS/83lwWLqGZ+AE5R5uI/CM8mtGfBle+veyO6LA2MD4RU0
	 PyyUg/Ky88qiLj3v8FfY6QpYfeb1IdlVcZI9R1bpYOOZ2kMV/jLd3uJrXxy2gMOPAqI8Z
	 MKVimnFtIPI0Mmm6vith1Gu4+TXxWT4+O/o1zxuXSS1rNkgf9q8qht9jalxHLgoD8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="olHCr/66";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTO6oxgK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C98606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C98606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olHCr/66;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTO6oxgK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKlev2395511
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d
	8+dXPutk=; b=olHCr/66IZCC+qkXrqdBMMyHNtXAfgoDUbnApVOlUdMkYMuw56w
	/bfgzdBXW/CVS2eu3nKrplMwD0CsZFosPuyUXu4rS8fgebdH2xznb615jXiElwZW
	ZBW0aknArj7jBXtwum40l4v4t45SYnZKXQLEHZT5H+oHLw2ifLl++kU9r96BSl+t
	DKq5bBCAqY3mm62jh+6DJifkWkB1ht7o6Kewndo6rOWBQdp9kPYQjEno2vZqiAo1
	sHsUesJbA46R/FwsVFkhAwwXMvihCImYmXF/DGA3pTabFdFoNATbvMYQkW0cos2t
	RLaeb/yqgQ8RMKKggly9BAh1iu/c78WVtCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1vmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:18:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so238200b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747936; x=1794352736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
        b=DTO6oxgK5xPoDiFzRVfErlUntjRbqNdhzsK7U1hbucE9RWGjfHgI0QGi/+YSaWISd9
         A+enbdFO0suzg3X4NVbX68Fd9wg1361Kk85lHjO4gb6eKH85jF3mJFM4joyCUBNt99/v
         u8PGvV+x5MGQ/3bD4KWojeJUVD7PUhgVLripfU+nWfH+fxQAsIVd5RaYsqyuDMiq0xgo
         /BuTpIP08OAE1ITkRDtzWBHNoRM5hpKG90dOWSpZ1quQRmEPOp8sJDLSwumZTQ0k0c7Z
         auBaq/f4a2zmJ8u25+Vhnh+vAb4GrKmIvGACI5t/MeHMtr6vwYffKRaXqqg+SH6j6b+c
         OKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747936; x=1794352736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZZP969Qa0dVMO0pKpNSkAF+fJQV8oUTt4d8+dXPutk=;
        b=HQ0maDuceU2/HMdmF7KsYrX6upuv82mIzK4IgI8fu7wEKxXs1VKin8wRN4XtahUnmm
         wnbi5Vd1hlftqWIPD605CrblqhlidFvSF5CjNDa4BZ03GsmxfBK1svz+Ae7vTRMwxjrS
         7XtfQfhrzeJMBvTHXkaKcvXTm5qq+vOC0kvNGmrw6bYe4D3jd0KcH9ITS0AWwbMLPBIQ
         Ls/BCUtdrou436qPuVn9u1TuGetrcyTCZafb2mUU7TBf4HIeRC+X7Rna2j6Wbzn8RXg/
         XtBlIY/+PKNTOdynRYRkZeQxoYFBpnw8Z+sSqk4GjPz+1LHbcqs5T2GVg+L9ww3rnIvN
         e8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxHTOIOgWI3Cu32QMMAJIduvNeqGxy8CHifo/lgRgGMNR4D9jbVkY4GJYTIs4CdmHi/lTwn5G8pIqvvO+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z87EFTqT1nvwP/lLbTkNbzjvJe/DB+c6rDEemx9dFUPSiZEacKU
	Hk216aiImOqFqbyvOnBWOaJedf9itZMSR2IJxmMNuY/eUaNcvyI+LfEBTS43e1rVPjvR2XzMUJe
	sQAJtt7qzJuwj4RaUwbtd4utW3zqCSgygcZeytwCJz/srRevTlBMfIknRbvy+VFkBZxY=
X-Gm-Gg: AYBFou3BmdLPqsDNwmfpT54HejgOQQtxKXnQ9aLfBlJIBMJtVWukyUpO26V7BrjXVLA
	hjsCYnjopa9cV8PPSJyx5hV4PaLvbsz9GydyqI3TWH6WUYpU7ye8MzJQpPIBPg7ypJ66/cRkeQa
	7NNMa/vaTUUrT/40UvmTyo7ABAOig9sI4qQN/5WAxZwIy/HdfeFkjYHal4Uytm600CwsuazuC6Q
	9aiSFQEbNLqRrpe53lc0GmyLerOGtCYe3K8hRLs4cvYLneHCDiCRH7a3nx+9ISv+A1wVi6GTHDm
	kamLc3WlAHi2aqLFIqDIC2o8ILPvCqWIvlNUyA1n297rTzg4+qzzsGWRJoM+C/xwSDecDCCMPEY
	FfkgHZWQAuZPzfnsvHoOrSA38KhX3SeZ1sEe8F9aFNEw2nVDcSHbGMsMLC7fQI/yaAyS/w7AQD3
	gPdqemO+Io+sy7SkdeF/82mr8RTpeP0K9up9Wz+En1KtqFjN8s7VvyqEPPn2w=
X-Received: by 2002:a05:6a00:3a21:b0:881:8784:95ca with SMTP id d2e1a72fcca58-8a9bf04dfc6mr12252531b3a.33.1793747935891;
        Tue, 03 Nov 2026 15:18:55 -0800 (PST)
X-Received: by 2002:a05:6a00:3a21:b0:881:8784:95ca with SMTP id d2e1a72fcca58-8a9bf04dfc6mr12252498b3a.33.1793747935377;
        Tue, 03 Nov 2026 15:18:55 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b667995sm142420b3a.40.2026.11.03.15.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:54 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 0/6] drm/msm: Decouple IFPC disable and sysprof
Date: Tue,  3 Nov 2026 15:18:39 -0800
Message-ID: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea6be0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pAKKPEBcNh-_eZAUbWwA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: mW8CE-4HeoSJG09X_bFKN0geWWIGfVSk
X-Proofpoint-ORIG-GUID: mW8CE-4HeoSJG09X_bFKN0geWWIGfVSk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX+jScJlZKRzqD
 QMWlLExe40X/RHNNDFI6FYNbnNEXhm49aRk551XI6QlhUXAXvC7sz2l8SZuUUBGceQdz+kbeTea
 9Y5xJCtblNGuYbY9mMqQSZJ1VheaTgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX3y1n9hdVoqAx
 LsG38pCE4O2iN1gGTQ7atIPNlNUQS+xRO+PD6ApsM6G5151wanAFtBJqMhfMA+wadEZOMpiwvG5
 tK4KhWNUbTLknYTLoupGI0BmlqWgPyaaZXg47+QyDMeekSDMAy3iKfLMXf02l7K5F18WpG+o80h
 gz/XIrjXMY7KvsCIOicamMKB+KBpSiP+SnIKXmTryEQ7mQGDLvcyWHbcKEj5Kbi4u0uaJj1yy6E
 kIcdHaj/1Iwpi/5+w6OdFoBnm1fJutBOpp6SPaKT3lneMjhftaJnKFBD51UtbzEW2gjQtyEzwI9
 qkB77SwU4pWIShzL6Es7WuJALcw817R1rGbjfT3n/937pqY4zNrbIbLtJJsEhvko723zJoQl1hN
 vcSl8JP/bXHkxkcmPtTbbJ0hCK5eK9SaxaoKC27WR0BGZ1bnPnoUOR6Na33LoxLL6l40HwL5yZ1
 aHMANubF0w5agFRNixw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030092

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v4:
- Don't clear GMU_STATUS_OOB_PERF_SET in suspend path.  Restore it in
  hw_init()
- Don't require gpu->lock in a6xx_gmu_ifpc_update(), but instead warn
  if needs_hw_init
- Move perfcntr resume to after hw_init()
- Link to v3: https://lore.kernel.org/all/20261103184713.29664-1-robin.clark@oss.qualcomm.com

v3:
- Rework IFPC disable harder to play nicer with hw_init().  If we
  need_hw_init, simply update gmu->status mask and let hw_init()
  restore the OOB request in a sequence that won't anger the fw.
- Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm: Hold runpm ref in set_sysprof()
  drm/msm: Resume perfcntrs after hw_init
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 28 ++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 11 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c      |  5 ++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c          | 32 +++++++++-------------
 drivers/gpu/drm/msm/msm_gpu.c              |  5 +++-
 drivers/gpu/drm/msm/msm_gpu.h              | 30 +++++++++++++++++---
 drivers/gpu/drm/msm/msm_perfcntr.c         |  7 +----
 drivers/gpu/drm/msm/msm_submitqueue.c      | 19 +++++++++----
 11 files changed, 78 insertions(+), 67 deletions(-)

-- 
2.56.0


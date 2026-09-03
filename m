Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C544B0C85
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441840; cv=none; b=ZxVzz8pIBUhENoJVSm45ogAUptN0B+sMc2cSEIJ+eVQzEivBMm6Jy8eVezjIKBTeqEv4UdwYkNOMNNzw5sQuRLfRBdbYkd2mgGfxb6g/NbN1JEAuBBp1qI9tj8riwDjnnpheFgMl1clCeu/zmzt2N4emgwqUObZOHnC7GFfBvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441840; c=relaxed/simple;
	bh=RFLoJGRUYKQSl0eHpP3frDnq8eQZYV9TudlRj303MbU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dbUrd5m4gdFytAevOGOUSCpms1tT141tLSWo48QKDfaBqc30To/ddCZ/Glrp6jHhgDg+dsucLlPMC1E0aIw9e3UdWI/G8EjjJfLUDHsWxDEfPU6TTJiZ7a+1oU+6JPWOUPftgbtg7Xw7zpVXhucef3Khr9L9S2BQI37x5xk2q6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsy9TDJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJNWU5/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsy9TDJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJNWU5/v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DATjt588878
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ddEIk0gBSlY/UOmh/O0b11
	0eqVZgbiue9Fzt5Vm/jf4=; b=Bsy9TDJyU9JA1+8EaL9MHFzlfvuK1N4Wozf1hS
	wHWIp8IbRmr1MMYh5pLElyuOOP6eQoRHHyRDMWT5MGbKQg2ucdXDP74XZL3IkbWs
	gpsAEFPepPPXfDQL1TSCEbn98bMuYFO+hCVetmSVVGXnGjRq7BlpHjGh1BNxwERj
	OKINTfcs5FOTUIZNHph3UAZ+OFn5qnkS7VMUpxYfr952n3bNO2zqrK0OX9zSMCth
	zldSbFNuy14o6OvGU8XNkVjdMBvKDO7m2qBjOiKjaibb5ceRyubFjnBjh1uPStz6
	jUo/Feaj2yxwP2S/sTwmMZbmhTPxei4jEgOEWhyCsEa1On+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyj37v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:23:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so187115085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441824; x=1789046624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ddEIk0gBSlY/UOmh/O0b110eqVZgbiue9Fzt5Vm/jf4=;
        b=HJNWU5/vpOxei5mQ3MXJw1KYWYTXO6BwpHmz3o45tOqKnYHZWzwz3p8+lxIF/KP/uz
         PXjKJoapI+9IfU2juYeH9fO0hjrSZQIn/UVVFtt174nHuJu/DNjFjoHTcbNQo0bNOOn4
         X9w64vnyuiSVCCPu/zWuug8SlpZaDGGVO9DWKR4zvJvA+8f0s8xVA8PmOwMvWepbYe30
         3H5J+Ivf2b0+s5ztwfTHmoL+GUZFTpXJcX5z7ZhF15u7khdfxsoa2gZDTsiCLbyQ2mWr
         h2s6YXBjOqr43IyNBA80jdb+UpthAX+ZVDdmkWutGUG2/CZAuMYZXHXtsd3knhJ+zS2W
         wXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441824; x=1789046624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ddEIk0gBSlY/UOmh/O0b110eqVZgbiue9Fzt5Vm/jf4=;
        b=fVnM7HNn0C3W2owtiPm4CnoIC8OO1I9fWyF6ktytx9nx5HYkOYN2ROLEidXM1SK+Wi
         qWhM7HiKSZ3w8rxYIOhm7+ZfpuKC/OyzZyL3+D+zc9CIyLoaQ69QDp3LDh7wCKpNV6Hs
         bODTvC0DoJyOhPK+a2v2h0fIczXfKyKnpJfpcykzdXh8wLDzWnre47wQQNazRLFQjaLb
         Ups92uX/4f+M3mPhpFCUiiGwFNemzoaa2PapL6qFHX2KAnEYLX1RhGS8h735yWnMjsE7
         z74fDXf8WF75JovsuhVzujSOMn5rA62udy9KcxRGptqfrhvxAr56sp46bogUKaicsCiG
         te6A==
X-Forwarded-Encrypted: i=1; AKwUvBzYk9DhaaaYAthKa6ijwRjtcYkTsu7AhUGN/pUQHVB+Npee43/SsgMnu4eNY3yyLTtgjgHUTobjxxD9L4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mDMu16vVvhT1yL5+yN4sNuOFXRv6b6w1Qi1NLA4iCj46Uid0j1
	kEAIa4FiCzbHvGhS3QOTynSbafQYPBfrNkd1vCL5V6saP3x+YCk6zgAX1VBJwDPzaXziB6wGE1n
	uwMZsTnw2o29ldINRSSOpwePnvOPI8YHmKylHXas/Oudb21D/3KEOJ/2ReyLX0axZnCY=
X-Gm-Gg: AYBFou1GJx5fxBON5zWZFbm3GgCWIZgew0UqxuTs9VHfx3l5gWxFDnhRGwRNlHTCg6b
	mQWW87nC+0iqhkRiUo+4NepBg5gbEsVhrl6/b8mZaIuqCcpk5nXzGXBbcu8XtnR0G8Oq6CD9dL1
	52p0Z7PNA2LZp+qiE3+0CuSgzNW+ZJ0Wi6EO6OSq1Yc8+ii17F6fv0TidhroXdNsh6RcXv2wJgK
	UOcFnzTTKQybetXZsu7P5H53wWEXnbpdnMYmXmlUtqNKZhbFtMCn4VoAHDkxIZKmrpUZWjlBYEJ
	8BzxH75iNjX5iRdtbUB7BSLklArk1OEQhAoHl0IrNGyfNHO90rDvcBl+U6r+xo0CJmNPuM2TE39
	BKq4P6a3wH8LVAaPkKmymwA6KLD7gctNE2aJDLrKxI8ue3W3/Os4zwawJHNF9w0oHG8IOQrZNd6
	onJ3mjiQDtSd/y
X-Received: by 2002:a05:620a:bc8:b0:939:6b87:9a62 with SMTP id af79cd13be357-9396b879de0mr1060430985a.38.1788441824318;
        Thu, 03 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:bc8:b0:939:6b87:9a62 with SMTP id af79cd13be357-9396b879de0mr1060422485a.38.1788441823782;
        Thu, 03 Sep 2026 06:23:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606da57e9sm1296480e87.83.2026.09.03.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm: fix SMMU fault dumps
Date: Thu, 03 Sep 2026 16:23:39 +0300
Message-Id: <20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANt0mWoC/0WN0Q6CMAxFf4X02SZjgyn8iuGBsaLTDHUFYkL4d
 yuY+NLkpPfeswBTCsRQZwskmgOHxyCQHzLoru1wIQxeGLTSVlVKY+/xHhn78EaOcULtC9e2fWG
 VUyCtZyL5bYvnZmee3I268TvzSyR6TaIa99jfVGebRw5GjtgFcZxsqdB5Uxnjjsaasp5zaNb1A
 2YULE67AAAA
X-Change-ID: 20260902-fd-kms-fix-smmu-2d4baaf460b0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RFLoJGRUYKQSl0eHpP3frDnq8eQZYV9TudlRj303MbU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqmXTdZaCsmTfhta7bjVfnWor5pfR1CHZcUmh4N
 /1g/SEMzEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapl03QAKCRCLPIo+Aiko
 1VHMCACNGK1ulFfyVcuyqPWadIqYosMva0O8kpB3Ia0l0XYVhStJ91zMYBqalmwUKXKTcON9F+G
 OP7Gv5JRCVa67Rwv7prBayTtuzKi9KihkpKp1Hgsab+qFJv/uAQuWpU5QpEMC/rpvq3Qo3lptXT
 IcAhWgWv8dQoxiJnQVjfy2CWDAEZs3lfevKN6vvNbM6PotKe9nh/n+4ETi0DaRPw+pRojbVwAm1
 qIbFTCV/zIsoMx/GybuAOaNww78pgW8TeshY3nLlzp/ZgFq+ZP0/fyc23FlFZXeLen4nInbciFo
 tpkXKVlCMSSDmgvuTVpDws8yLA4PKXn7iPzIuZ21Iq3XQUM2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX1W7FDLKMtrDO
 w0sDejCPHvcT2jXCgRIOuuKJaUmCT0rZwhd4HV52JmIjYGC7clMa45G8i7vkbWlUzTZy+gvuisv
 3bQUKJelF0myF4hSijTM6PoSotWHVc3Jpqg4krXpak5cz0NOuJG++PWhAQf90OifXHjY3NlBbRl
 D7roeg7Bj0jmriAYktNC4fHbbTRTJLcYgEXQShgw1VEFyPh6eGvMo+vXRNy7HrOzvottNeFAPaZ
 W8nJDAMx7quO3wleBlqxk2fyCIDUu2t5hRSOmQtmTNzQ5FeziLoq++e+/h8CNKzN5oQB2Yu/RJm
 doFsPDJAldXoLydmIyRf1Mf596Ajtq471ORGAKOeRj8OD6wDFCRyi7pF1YU0OSs5V8gPhj7+t3u
 UQSA2wgy9jfKkSYuk2GgE3UkLkS/5UTxHyfzgSPU+34NZBtMM1xnZerUIrwLTauTvmEWzeGj7Z5
 JC3MXzVEonBfOFiQKcA==
X-Proofpoint-ORIG-GUID: 6pqE7xSh3G0qvFxjegU_NiLPVf4lll8b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX/bZ8L3V7u3Tb
 ahBuf/ISWbnwosF0eLBRfLGLubtJUyNw0UYXWdxDG8+3nDFGeHnozMa/lemT4envDD1+pIAvwkj
 WXjGuwUBvqfP0T8tng9C3CIDzlNGndU=
X-Proofpoint-GUID: 6pqE7xSh3G0qvFxjegU_NiLPVf4lll8b
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a9974e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YykjKjUOdnYcj-ftorIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030116

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix two cases which I stumbled upon.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: release scanout framebuffers only after a vblank

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  3 +-
 drivers/gpu/drm/msm/msm_fb.c                       | 26 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                      | 88 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      | 29 +++++++
 11 files changed, 150 insertions(+), 11 deletions(-)
---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0
prerequisite-change-id: 20260202-msm-ci-sm8650-bd3933b73635:v1

Best regards,
--  
With best wishes
Dmitry


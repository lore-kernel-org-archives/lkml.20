Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797949;
	b=dZszFDlyL5XnqEBeT1aCdBoNogTl0SwKuC9i4jXGfrSdedvV09BalWaDmTSXuDpoyGw0
	 +wewhjP63y5XOUmm6Eu3+w5azKCm6CtkPtZJ7Vx9myvGjot9sYgIMiA2Iah+Dtt8evMq4
	 5dZhkPRsTRRGlTJWCxzIXc6nNOwN7B9KU+kDbX4eM51OeQVEvdEYhU9cFvHME5jiD5vfn
	 LuuDsj2+0jNOAjwo0pQ0wqVUtCFNj07/7b4rJmIetaxYCav4NC0jhVIn6zngmu6agPChm
	 EOZBtd/lFrWpGR8HgVlTiudx/bmS3B9A/xNqgQicKzs7mbjN9DJFHjNq7ie0x65kj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uNlBOkiEn2JBFAElEZWCpviN2vNkFqt3VdVuyWG/KuM=;
	b=wyMZmb0tSDg9lGgQnHMvsoZcEX9eizZ7M/lRRewVEtM1lFjPaZsJLBqWhCLHshE1olUm
	 5psSJbj/5WTunVyX+WEPB7F5rOSnf61PZhKFc2OzbD+CXZzTnyjM/wM5n2mMpnmCrBZnO
	 Ul5MHxuyTFW6IbvCexaLhosfNjjUt0SdLlHpxq+fAqDP1UuFBgr1qDIPdwUbB8FjpXnos
	 ZvqmJCYy8nG8sj+GCok1nBrjpjcLycxlapqhT+3Dht0n+05BdsEYj3MVbODEe1drveSM2
	 e86JGe4cp9gWqesLdAs4iuePKCoFxAFY9NoEOMIXBjrxESG507AK9+y1otFQz/DVgtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7yZw+UR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cf2a93k1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DA606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E7DA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7yZw+UR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cf2a93k1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv7sx3683556
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNlBOkiEn2JBFAElEZWCpviN2vNkFqt3VdVuyWG/KuM=; b=R7yZw+URx/63c7fn
	w6OO6bAeHhx6FHVzP8Y16m1S+TUv6Ypo9TW9gt0GEKaW2KIYLriDrVmwAU/DnLsC
	cm7neKh2i9ELfJBOxMkP05LFjqJr+LPdfXuXwWx8lT5h9EZ7zwvAQk+et/GHkcD2
	aFwy2hQvX3TTsVGizdCwLlswkx2l8TTCRdZ8qlOXDDr/kRcUgMc5mIrUTi2HOCV2
	2awikbbKboTk7FN739a5jEAI0DcnEc94QyCKnzekj3FNpEwElIzruYvhWtIiaQL9
	mFvv+Eh4hFzIJTfLkUuUS1MrK2BRQZYMoPg5sfUmQBAkpxVjr8W8v++U7ovf4dXc
	TJNk8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso281463185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797947; x=1793402747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNlBOkiEn2JBFAElEZWCpviN2vNkFqt3VdVuyWG/KuM=;
        b=Cf2a93k1NLvhcn8bHBfgMSOvK0Ykv9OYoYKsBfKK8aDmtk1bSR6uK9g/sAn7ggyYNK
         oz5QT/Htaw9JHnmrki1D8s/hv9/ZbMwx+LmkoLXQJC0kd2VpD+UM7N6K1eLLedyyUSjG
         zBwIjtGqwuPRnx3t159P19pfoGof1XRLhOcX5SimoaoZZTzhOdiPyEXThlCvqPCdonG/
         idxZ3oHY5BQ/Fdv/ytCvhO0Na65IJkx0Rbjhz8oMP5sa89qalQG8Zxk6UsovRwgG/kgV
         LfGQQ6D2sXXQqY+LSRBbssqlthuUGoxjhr24crXDqTTBHj4fqOPvLu/OjL8IsD9vSNZd
         DHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797947; x=1793402747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNlBOkiEn2JBFAElEZWCpviN2vNkFqt3VdVuyWG/KuM=;
        b=HbS4JNj86z3lJuGONCqr57iNOCsaXiEZcUq6Um5JQ95TAqtRcX49ydP4OI9F/Sw9bu
         /CmzkGYTkuSa+AFIYMhpGkka36E8Lpm+IyEsWowvoJ8URXspAam0/7E+xoILiKAWrGIs
         p1z3T+K+GQD8fn4mr4SX8sB9znGB00KHXcpgfL86GMkuirtvM698CzooRkSkBiOrGpdn
         8Ak/NIF9b3x2G8gTPC2C5wqj9kbagsIz8UddIHOf/a6fInbBQHXktFa9vfTNbj0MxfES
         tD7Z9Csh12/eDThB49GjRC7r+WugF0Xc7xpBeIbTgylL1MArDR0QNQ6aBxmX2pZ7AFW3
         WIvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+3G9ifEF3VWx+hISdb2uugyKj07XbNSQWA0cOBQc4u5eFreiEqa7A+E1tPGqsAlpU0Dj5FQU5xz4gYQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8fdICtS1+O443SOF0oss2vQyn0Is7a/iQp+D41a/Atdsxrkf1
	gBvbE1GXhWq8ILMcQu8VZkACySWCd/PlItZixCeUwXHvMCoYU4Rjkoo0kA7FGJ28njlSmWcsgcm
	B7mENq3ZZ8UWI7TNsj+/Zp/CHbAswR7arglu06Gj3TMl4ILf5ql9rbHY1oFNNt8gb3cI=
X-Gm-Gg: AYBFou1sO+S8Yl8SHMjgxillVUV1A3HxME4xv83+THtjelULnqtUwm6Ex0zrnj0PxmW
	UByW51gZ7YTe0KteuEcSmbFgSTR5Q1590r094TgyFgN4c8bqnDw9JCYXo5k/mxk2CrQkKZinRPW
	nzfG17RzLfbvlcnX4B1KvR+QpOzcK8VaTsiqNjF5l1RSPnNpkc7Y3BeIoGa0Hv+TRTju1FNyypu
	Elfn+Fe6qTqNIOWTDTMp3Kq2S6wv2bO5oPUc8hBBY8v7FxyBt/AMerQGZlkEVvqlb6y+kLEOiqO
	KJM69WK2EWLy9KKCvLu2T+EnoC2449p8ROTHP3VSslsT3KqZ1EsGFQxaOpfvYckpJAkPdcwsjyJ
	KtNr20+t7hXLkuKS8UL7bRTdZxzmyV3V1MbL1D82sHIovRTbfZDYQrksI1mKpAJ9BmfN8cZ1UFJ
	sGNvFIpKDIqP2q
X-Received: by 2002:a05:620a:3945:b0:93e:f930:5ed1 with SMTP id af79cd13be357-940ef9dfc18mr88914385a.82.1792797946433;
        Fri, 23 Oct 2026 16:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3945:b0:93e:f930:5ed1 with SMTP id af79cd13be357-940ef9dfc18mr88910585a.82.1792797945844;
        Fri, 23 Oct 2026 16:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:24 +0300
Subject: [PATCH v5 03/10] drm/msm: release scanout framebuffers only after
 a vblank
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-3-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=w4dbrmmcFAugIp2zKup0aWJQkCcSUt04qBtnJ2bJoBA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+znpKsPEsdAxkDfJaLuW2DXCdBqf1+7X5rpu
 +bD5Du023CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5wAKCRCLPIo+Aiko
 1bPsCACCFZh9stWJ2WyOR2EuOdGoEfCPvq9u8kBxuTQha5cxf8Bcmw4Sws2Q2JRFi44o7gB1HTy
 tHgjnMM2fxf7jAjRPkmfLjsaeNPKxn1ES1gqUR8Nb0MRAZxD0fCtiZqhidKl0CM9xKkb87JjJ53
 daBF5RRTr5cmzR9k22dQQbTLRRdPv1mFO42VsU2JEtc3n7uP3fVDYe6w0SedYSi5neRqxYq1yK2
 vL2t1I10EHDFLX5/QS7TTR3WLw/BVtR2oKnQSfSL7MT5HMft1AcjCKJe6DegjNdDSUIZwXix6kN
 9xZVwWkFIqx2vtkDMRizNApe7HGycjvPaLHG2ncz4pWhyeEh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwcWiV7gQCzaN
 AN6XKkkat9A5flPcas+1QLqVcIcoKVYPGJegCUZY0EjeokvEZMSLD+MRqTr+VH1QqESkh3U30ow
 gXjsKHkz3EjdFwsOvkpqSzYICUth4JXJxPd01TIa6vb1aqfgt29njnLfdzBLPBPZSvkhX0KWNfg
 2p/T9y3mtunWphVPacUtWi9U1u65+QShANcS2+d/B4/F9Eno3MoG9atuCwuh/LAw97v5//4gzHj
 5AsABEzL6pGFXdSuq6YoKxf2AdNBlusrzHWsUQFHlZaCVZN0MpPGiOCqtnqexDn9q2fkSwu5hyX
 DCRLh6tLR8fz0RJ+GorDbVdCb7OByKsJggEXIdp9B5RDrYGLrfZEck1jcJwv6fohBTiOTHUMql4
 js1mEXoXND3G/QJuARjyrPUCqZdNqymKRFvz0iExPrj8wg9dRCJHJUJYAttukZdxPVxV97Z3rAe
 70SU5cRWcCCm0xiDOKQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbecfb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RRHiXG5J_6CujISSfyUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gdRC6l_nDBq1j8pESzNUQ1ny_AvsOUxo
X-Proofpoint-ORIG-GUID: gdRC6l_nDBq1j8pESzNUQ1ny_AvsOUxo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX3x9qpddlNqeL
 PlCKBPD1S9GZYeDUDpFmxd+cIzDvFYLf7JUtB6/vvUJqhaEP/z7JIdRx7/C2JQRBVG41zfPVuxu
 2Y6ba1FdDrGID0TiUyyhjZW+BHNIKVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

msm_framebuffer_cleanup() releases a framebuffer as soon as
drm_atomic_helper_cleanup_planes() runs.  msm_atomic_commit_tail() waits
only for ->wait_flush() before that, which for video mode waits for
CTL_FLUSH to read back zero, ie. for the new configuration to be latched;
the frame in flight with the old one is still being fetched.  Since
commit 111fdd2198e6 ("drm/msm: drm_gpuvm conversion") the unpin also
detaches the vma, so the display is left reading unmapped memory:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x007eb100, fsynr=0x3f0023, cbfrsynra=0xc20, cb=27

Hand the retired framebuffer to the crtc instead and drop the pin and the
vma reference from a drm_vblank_work, as i915 does for its cursor
framebuffers.  The work holds a reference on the framebuffer, and
drm_vblank_work_schedule() holds a vblank reference until it runs.

The pin count is dropped by the deferred work rather than by
->cleanup_fb(), so a framebuffer scanned out by several crtcs stays pinned
until the last of them has passed a vblank, not until the last one has
retired it.  Deferring here also covers the async plane update path, which
has no commit tail at all: drm_atomic_helper_async_commit() programs the
hardware and drm_atomic_helper_unprepare_planes() releases the old
framebuffer straight away.

A crtc which is being switched off stops fetching: its encoders are
disabled first, and both DPU and MDP5 turn the timing engine off there
and wait for a vsync to latch it.  No further vblank arrives to run the
pending works then, so keep them on a list per crtc and release them by
hand from msm_crtc_vblank_off().  A framebuffer retired once that has
happened is released directly.  Whether the vblank is off is tracked
next to the list rather than read from crtc->state, which a following
commit may already have swapped in, and a work is added to the list and
scheduled under the same lock, so that msm_crtc_vblank_off() cannot free
it in between.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  19 ++-
 drivers/gpu/drm/msm/msm_kms.c                      | 142 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |  19 +++
 11 files changed, 190 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 42d0a529b4d5..1f8fce366a1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1213,7 +1213,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	}
 
 	/* Disable/save vblank irq handling */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev,
 				  old_crtc_state->encoder_mask) {
@@ -1301,7 +1301,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	}
 
 	/* Enable/restore vblank irq handling */
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 }
 
 static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 22433bfbea1e..5db33e49c345 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -615,7 +615,7 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 	if (!job->fb)
 		return;
 
-	msm_framebuffer_cleanup(job->fb, false);
+	msm_framebuffer_cleanup(job->fb, NULL, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7b92082d35a6..0e986b533bf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -684,7 +684,8 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->needs_dirtyfb);
+	msm_framebuffer_cleanup(old_state->fb, old_state->crtc,
+				old_pstate->needs_dirtyfb);
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 57dfce58450b..2d73ac3d85f2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -267,7 +267,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
@@ -297,7 +297,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
 	mdp4_enable(mdp4_kms);
 
 	/* Restore vblank irq handling after power is enabled */
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 
 	mdp_irq_register(&mdp4_kms->base, &mdp4_crtc->err);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 9459f70ce0ba..5f669a02d798 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -97,7 +97,7 @@ static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, false);
+	msm_framebuffer_cleanup(fb, old_state->crtc, false);
 }
 
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4c4a897fc1ee..e9e55927655e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -499,7 +499,7 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	if (mdp5_cstate->cmd_mode)
 		mdp_irq_unregister(&mdp5_kms->base, &mdp5_crtc->pp_done);
@@ -527,7 +527,7 @@ static void mdp5_crtc_vblank_on(struct drm_crtc *crtc)
 	count = intf->mode == MDP5_INTF_DSI_MODE_COMMAND ? 0 : 0xffffffff;
 	drm_crtc_set_max_vblank_count(crtc, count);
 
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 }
 
 static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 841f444a8d68..dacb387d9bb6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -155,7 +155,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, old_state->crtc, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..9fad2c191ff2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -254,7 +254,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb);
+void msm_framebuffer_unpin(struct drm_framebuffer *fb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 792d47b4acc4..cc71c42d4e12 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -130,13 +130,10 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
+void msm_framebuffer_unpin(struct drm_framebuffer *fb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 
-	if (needed_dirtyfb)
-		refcount_dec(&msm_fb->dirtyfb);
-
 	guard(mutex)(&msm_fb->lock);
 
 	if (--msm_fb->prepare_count)
@@ -146,6 +143,20 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	msm_framebuffer_unpin_planes(fb, fb->format->num_planes);
 }
 
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	if (needed_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
+	if (crtc && msm_crtc_queue_fb_unpin(crtc, fb))
+		return;
+
+	msm_framebuffer_unpin(fb);
+}
+
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9a207c1e8583..d836d6dd7f3e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -11,8 +11,10 @@
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_work.h>
 #include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
@@ -165,6 +167,146 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
+struct msm_fb_unpin_work {
+	struct drm_vblank_work base;
+	struct list_head node;
+	struct msm_kms_fb_unpin *pending;
+	struct drm_framebuffer *fb;
+};
+
+static void msm_kms_fb_unpin_release(struct msm_fb_unpin_work *unpin)
+{
+	msm_framebuffer_unpin(unpin->fb);
+	drm_framebuffer_put(unpin->fb);
+	kfree(unpin);
+}
+
+static void msm_kms_fb_unpin_work(struct kthread_work *work)
+{
+	struct msm_fb_unpin_work *unpin =
+		container_of(to_drm_vblank_work(work), struct msm_fb_unpin_work,
+			     base);
+	struct msm_kms_fb_unpin *pending = unpin->pending;
+
+	scoped_guard(spinlock, &pending->lock) {
+		if (list_empty(&unpin->node))
+			return;
+		list_del_init(&unpin->node);
+	}
+
+	msm_kms_fb_unpin_release(unpin);
+}
+
+void msm_crtc_vblank_on(struct drm_crtc *crtc)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	drm_crtc_vblank_on(crtc);
+
+	if (!kms || idx >= ARRAY_SIZE(kms->fb_unpin))
+		return;
+
+	scoped_guard(spinlock, &kms->fb_unpin[idx].lock)
+		kms->fb_unpin[idx].vblank_off = false;
+}
+
+/*
+ * The crtc stops fetching here, and with it the vblanks the pending works are
+ * waiting for, so release the framebuffers directly.
+ */
+static void msm_kms_fb_unpin_release_all(struct msm_kms_fb_unpin *pending)
+{
+	struct msm_fb_unpin_work *unpin;
+
+	scoped_guard(spinlock, &pending->lock)
+		pending->vblank_off = true;
+
+	for (;;) {
+		scoped_guard(spinlock, &pending->lock) {
+			unpin = list_first_entry_or_null(&pending->fbs,
+							 typeof(*unpin), node);
+			if (unpin)
+				list_del_init(&unpin->node);
+		}
+
+		if (!unpin)
+			break;
+
+		drm_vblank_work_cancel_sync(&unpin->base);
+		msm_kms_fb_unpin_release(unpin);
+	}
+}
+
+void msm_crtc_vblank_off(struct drm_crtc *crtc)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	if (kms && idx < ARRAY_SIZE(kms->fb_unpin))
+		msm_kms_fb_unpin_release_all(&kms->fb_unpin[idx]);
+
+	drm_crtc_vblank_off(crtc);
+}
+
+/*
+ * Publish and schedule the work in one go under the lock, as
+ * msm_crtc_vblank_off() frees whatever it finds on the list.
+ */
+static bool msm_kms_fb_unpin_schedule(struct msm_kms_fb_unpin *pending,
+				      struct msm_fb_unpin_work *unpin,
+				      struct drm_crtc *crtc)
+{
+	guard(spinlock)(&pending->lock);
+
+	if (pending->vblank_off)
+		return false;
+
+	list_add_tail(&unpin->node, &pending->fbs);
+
+	if (drm_vblank_work_schedule(&unpin->base,
+				     drm_crtc_vblank_count(crtc) + 1, true) == 1)
+		return true;
+
+	list_del_init(&unpin->node);
+
+	return false;
+}
+
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+	struct msm_kms_fb_unpin *pending;
+	struct msm_fb_unpin_work *unpin;
+
+	if (!kms || idx >= ARRAY_SIZE(kms->fb_unpin))
+		return false;
+
+	pending = &kms->fb_unpin[idx];
+
+	unpin = kzalloc_obj(*unpin);
+	if (!unpin)
+		return false;
+
+	unpin->fb = fb;
+	unpin->pending = pending;
+	drm_framebuffer_get(fb);
+
+	drm_vblank_work_init(&unpin->base, crtc, msm_kms_fb_unpin_work);
+
+	if (msm_kms_fb_unpin_schedule(pending, unpin, crtc))
+		return true;
+
+	drm_framebuffer_put(fb);
+	kfree(unpin);
+
+	return false;
+}
+
 static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_kms *kms = arg;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index b5e1cd38cd8a..a33c2a0db206 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -133,6 +133,13 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+struct msm_kms_fb_unpin {
+	/* protects the list of framebuffers waiting for a vblank: */
+	spinlock_t lock;
+	struct list_head fbs;
+	bool vblank_off;
+};
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -168,8 +175,14 @@ struct msm_kms {
 
 	struct workqueue_struct *wq;
 	struct msm_drm_thread event_thread[MAX_CRTCS];
+
+	struct msm_kms_fb_unpin fb_unpin[MAX_CRTCS];
 };
 
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb);
+void msm_crtc_vblank_on(struct drm_crtc *crtc);
+void msm_crtc_vblank_off(struct drm_crtc *crtc);
+
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
@@ -179,6 +192,12 @@ static inline int msm_kms_init(struct msm_kms *kms,
 	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
 		mutex_init(&kms->commit_lock[i]);
 
+	for (i = 0; i < ARRAY_SIZE(kms->fb_unpin); i++) {
+		spin_lock_init(&kms->fb_unpin[i].lock);
+		INIT_LIST_HEAD(&kms->fb_unpin[i].fbs);
+		kms->fb_unpin[i].vblank_off = true;
+	}
+
 	kms->funcs = funcs;
 
 	kms->wq = alloc_ordered_workqueue("msm", 0);

-- 
2.47.3


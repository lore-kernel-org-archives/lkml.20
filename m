Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797942;
	b=5eTKYNPSt/ShgMcw0xLFtDtl52YxDvJuCHHdRXF7PuATPuwCtomfcZ7csY4GK8vkJJEF
	 yYdZHcgvNsuXV8089/9+LpPwKC/pMtFAmZada5QILkQNUA2CWLylb/rr1xT0uUWZnaZcr
	 anUkUhRKWj+56uC9vxfMGY6hMCTtDeRDn7i/AMhcGoSk7ZWAx1oKKPEOudaHCHN1RWTF4
	 35QcylwIpgObp7RP+M7s7cSGfbkJlvHnviMXOCl+2WA1LEPorAVyZg286GoT1PTubeHk5
	 2t6MuZdSSxwl0DeruJy9aSaxcdXbJico66Ye7ntc3AljOyQC+l+x2nNukPhPwcS7vcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
	b=gOwCJ97Ui6UHhSQtwond9L4aajV/ORLvLDwjfM51sNMm562r4kEQClfXiveIQkxp80Eb
	 MTmyvhvLvLrcAv3nA0foSskOkZckB08lQEJ+brOIkf66J+pK/THxpW8awhBIUIg4mT3pB
	 pVcWLQIGbxYY+jZ6SYQJUxxjT3sonyhiueV4MB9iAX4PWfinCIIa4UII+HjGmG4ndoCS7
	 xHEi6ia/RGuD46esZXSfkP8/oXDqpHJ7T7MPo620wZ+8bBwU9k0ZHLJ2EzDBtS8bNb9/c
	 AKB8apnlGNwmc+714kD+xd6RXRjZEPvsKsHX58PfkwsB4GivSjvAka4PYEI3Mniu2yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAMUadzW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5JtdAnO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AF606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889AF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAMUadzW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5JtdAnO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvcpH3471180
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=; b=VAMUadzW8QYqrGu9
	7KnooXbqalCmP3vcFXzD/4gl0+5Ne261n64gcBT2WC1Rf3gnHzn7egpyYCnHPdFr
	ITPMIQvlNPLWb8K/SDtZh8cvpY+MizbVFBXuQG77I/WTnHGji7qysQIaK28ObyTl
	JdrqLGozTY7gwGOZel6YnoEWk4cewM6QS1djafInqcws9RQyVfw/+ilqm32ZGfz8
	gLGONR7HK94qqJDz4zxq6U4ySoocqKXM4olF+79Lr05M0s97Wes+HuvaMKNW4Sg6
	X/uMvW++GS7f4rYHrfeaaMfMJIRvscUMHOawC8jpbwgyRUJ/6wsvazh8bEHx/56v
	OA0KkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugv18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b875639ceso28984686d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797940; x=1793402740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=F5JtdAnOch2Kvn1eUID2amG5BZ1eKY3j1VXuEHFYnqmwr9HVUDXmOGVWeNK6S2Dbic
         kmC5huR81GXQdjMWl08hwq5PP5JICjMAtplu6I3ct6lj2Qg13siV5j6xAxyeIRE2w/nH
         2rijGoWWP4OYVnsoBp1rCNMrzBCFgT4vnPQKV/sNbK8nemsWHPis341nut7Mpbl7Tbea
         Yh/t4Qx2DPYI7UDWM+MufH4VsRN/UdwLf2jkCUNgwU6rJYwW5eWfQJrm6TQAYFbCvBKG
         IjhOofsc2x6CT78fwFxdcKubGc5f07NyqCasD1TALJZEi/wKVbohS/nUmxfc8ar4Izmr
         k2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797940; x=1793402740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=vE4padWesqYkWfVYIU7H/dWXE8sXMGikRpwXnSUJIL78g7qzLqvvhuZP3T697hVyss
         31VkQP9/LWZhh05knVgZv0k6VD5hAggVAclZCTFO72x0+YfFhrH+X5/7AlALS5TKYdnS
         LBEOWp9QHvaMZS5yr5Dw/clQnBJ9o14z6yfVxNmbGeTyrMkJlVW1cC/xXCutwLU+Lwbc
         EI9iQdmQAMh1dytlkAaYQ4s6ElCZmS+CR/JpukT2tjPJIPYOmml+9ywC5e1BDxGvsfs3
         EQyKf4c8iJjPpEDT7TICNCoRG+YK6qS6dHRNUnCNqvrEKEFYc9AG1DKVxBXHSigL1G5F
         7PKg==
X-Forwarded-Encrypted: i=1; AKwUvByIwZuBPjAjV9wovnkIzkKUGTKoHSFVnmkjqzhuYinkO/dvsZ6uu8f3ddPGHy74lj6ZVMFyqmW3Q+Rjcxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYItC1pM2fJjAZY/OU1qYlPWBCaqwwpbITyZWVP9GEb2/BebLX3c
	uskKnazTNNj0czypYno0ZZjGGgZ3ckiO4O/1TnGxtJ0YIT84xN2jilvqAR5dBeX7QeDWEO6DnTz
	IsS9ia/HcKJRJmpM9wXkevKbLyIuVTXrWS31bZ1CM1uNU38ETKqTDSQixOxZDou+mOsI=
X-Gm-Gg: AYBFou3PT9o+G/pKZPQB9iTOJcWvZTx101iB17pLqyXmZ5yPUpZkqUuHM/qKMHovWrE
	+UkH88IWZUMXH3WQL7bG94KxCCLjolsAX1t819MrzrPExKhcsxooLSqY4lfs4A5Ppjdd7i4SxzF
	UNM+hkd3CvaiOXEGd0VEFYB9TYvAdBKaty+3klgQci9I2pj79RFe/V2Nw+LUU0Tsgs+3eO6AjGK
	WkKlzGVi2aIcg5eyMHB07R9tTIWeHuJhZctCVDw5QQG+5BQ/yYmvoz8GVn1qhQESLKM/r6ALwP+
	shRJ8JHHlRaJTBMhWNI3xvoxuQjDCYQYC4Sq2Q2UUqfmRTmIivg8qYZ8rssWzy2U7aFMOqMWA6g
	P++RBA+Pj1sHxf3QrcoKcVNLfNXKHoB/9csh8y8vty6FFB9hZGIh1n82GvP2YujPtOl/Va5aF+1
	nzU9M4P3NGBNPS
X-Received: by 2002:a05:620a:45a7:b0:93c:6e1d:96af with SMTP id af79cd13be357-940ef96e35fmr83466085a.49.1792797939694;
        Fri, 23 Oct 2026 16:25:39 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:6e1d:96af with SMTP id af79cd13be357-940ef96e35fmr83463285a.49.1792797939152;
        Fri, 23 Oct 2026 16:25:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:22 +0300
Subject: [PATCH v5 01/10] drm/msm: serialise framebuffer pin state
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pamYy0cN7nsNt1AdJwY6+IG+Gt3DwvWS5HicK2xuXmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zlx5d+BC4E/Dn58V2ZAbiHRmaYLqNSXz+YP
 6gqgHdn6W+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5QAKCRCLPIo+Aiko
 1daPB/9opOYYqJncg0k4w6fjr/EYYKDQfIYLXhPJ4RaR7SSBnrC1r8P6mu+1aUaGbnzB5cTuWRG
 nI2f/05zRx2rqqKiyABRqxOh+HxRDgi55dZqQe+GIwWRuls/ZY4avwoz+UzwBgOb2jPA80pqjHq
 WMevVMtnVznsFQsO68WMAug+GjEMcX6QWIa8YVZuY0NmjeiUZmY+cj1RWWQCIIW8cI7nHMawLYb
 uSKjw0peTf3L362ITK7PyV1rcJ0U7iARC28m6KMOez587EJkqjTgvWhstDwd49L8qmWKO4Wr77Q
 DGsF5g/kzyQqyVcCUTuZ6W7sAkZTvNmJJPeB2jRCEIqvvs++
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX8m4tl67aRH2Y
 ROoV7Ss1OWmqW3NUk9AkU7dPw9oc+1cfH1If7rEaOBrsORru5n56bIw23bCCGtxYrer4bRViXhn
 iMmxXzLggEa2LbEd3znbFPEtsnY8zts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7g/H4/tpVET9
 PrcU/NV26p47XUUG3K7+9Xj2e322UzpHImctMyaOf+iXZ+SKzgI3F+g1DEYdAbKyV5svJIHRGyg
 XLA9O5IYw2+TagqdA5nC1UL4MMTxtDWIZcb0810y4znceqjJi1XyxjJkFBLe2ec61pDxBn9imPv
 uWY3NRrEN7NyFwR+X2WX5673y748RHTk4apIGzWtnFXUGLCQo6d7wD3j6Pq1ao6Jkr+cDrKY0US
 g/UD+s5vo5rnV0dTFaGeBwdxo5mPqdL9kmU/RChG5r8wT6kwn40uByMp1rTHFzdlcjanlo4PGAV
 bVxUs0oSlklohW0hjxKxr0MCQE2H+NJ1h2eWVuoXaj5BrS+SOh26qC8DvTwNSW/bjcIgyFG8cCC
 XC1FFkIm7PI4yrKGFXC0L8nmBwdoGuLIe68f+2AzTvDxHuBGRo4KBJOTxr0MY0zWGxddYGNMUSM
 +9kaE3B9udugzArSw0w==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbecf4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xgb_odkXjkZCwJ4aViYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: grQmwYFkbIjcZC8nHdfus0QmxP0m-SZZ
X-Proofpoint-ORIG-GUID: grQmwYFkbIjcZC8nHdfus0QmxP0m-SZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

prepare_count, iova[] and the pins they describe are updated locklessly,
but drm_atomic_helper_commit() prepares a new state in parallel with the
completion of the previous one -- stall_checks() only stalls on the second
previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
in ->cleanup_fb(), and for a double-buffered flip that is the same
framebuffer:

  cleanup: prepare_count 1 -> 0
  prepare: prepare_count 0 -> 1, pins, stores iova[]
  cleanup: memset(iova, 0)

leaving the plane programmed with a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
Refcount framebuffer pins"): a prepare which finds the count non-zero
returns at once, assuming iova[] is populated.

Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
adds the framebuffer to the object idr, from where userspace can reach it
before msm_framebuffer_init() returns, so take the private state out of
its way and initialise it first.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..a38e5b3a1d1e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -22,9 +22,12 @@ struct msm_framebuffer {
 	/* Count of # of attached planes which need dirtyfb: */
 	refcount_t dirtyfb;
 
+	/* Protects the pin state below: */
+	struct mutex lock;
+
 	/* Framebuffer per-plane address, if pinned, else zero: */
 	uint64_t iova[DRM_FORMAT_MAX_PLANES];
-	atomic_t prepare_count;
+	unsigned int prepare_count;
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
@@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 					 clips, num_clips);
 }
 
+static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	mutex_destroy(&msm_fb->lock);
+	drm_gem_fb_destroy(fb);
+}
+
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
-	.destroy = drm_gem_fb_destroy,
+	.destroy = msm_framebuffer_destroy,
 	.dirty = msm_framebuffer_dirtyfb,
 };
 
@@ -81,7 +92,9 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+	guard(mutex)(&msm_fb->lock);
+
+	if (msm_fb->prepare_count++)
 		return 0;
 
 	for (i = 0; i < n; i++) {
@@ -106,7 +119,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
-	if (atomic_dec_return(&msm_fb->prepare_count))
+	guard(mutex)(&msm_fb->lock);
+
+	if (--msm_fb->prepare_count)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
@@ -199,14 +214,15 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 
 	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
+	refcount_set(&msm_fb->dirtyfb, 1);
+	mutex_init(&msm_fb->lock);
+
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", ret);
 		goto fail;
 	}
 
-	refcount_set(&msm_fb->dirtyfb, 1);
-
 	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;

-- 
2.47.3


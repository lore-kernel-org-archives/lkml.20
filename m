Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D294E0B65
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955004; cv=none; b=sRXAvHEqrbDIfekBEhJ3oRqv+OrAJnjO7gTKL883Yn0pPADMz0Yzs6fECJrkpfD6PbusU8fP8Wo/v+EPDnwZejDStKOtZuyYGFT8f3Pc0c4gSCeM4uQeA1Miz5tR7iUcO/rZmarXr6h5RnZFbaALgc1Wj1Da542CS+NQKynWTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955004; c=relaxed/simple;
	bh=BRTFGnRCiK4ZFScjYYLcMsd0f5n6Kl1CKn5U9teS8ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQCvMzSXDaUr4Pf5xA736ctvbvtTatB8EfM0AQmhcs1VlWT/pszQ8cu2BWpBB7nZJroQzzCpzu47U2pykL7glYCvcucX+EUALdc8DNsV2rrFjvhyebFjc1dAsJh+OtC6LnDFiTV3f/6Iu5t6vnt0IDdeUsp73dwLqzo/JSw9b2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8R59dN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1GD+VWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8R59dN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1GD+VWj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHGTA1044174
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=; b=P8R59dN24VRLzKXT
	C1IN982brIZqOzMsrWlAQLa+E8n0vS0+ikZDzBYc/VarhRVAnxcXYasL3dWipcJ/
	NEBINX+4l1IjpUIc1oRsl8h/XFVFfYubHBjshOEw2Ot3pjYZoqKXC14nhNiL8ZYX
	ZQ9QnBUlcE92eg9rJhksv/iUgEV2RN2GbcKuQk/FAu7WBAbJRr/UmfIVeRBO81/z
	1XFhyti+nYvDdPyhihoR5wcpZ4AK2m2CaHN+Rw88BPCvrqL5OLgY6fxntQkwuNSb
	b4nj37zANQPImZbQY9NIdmicCcc5jPTGwO9y/VExqJwEf6rVzpCy+d+saGkRWmmz
	a0nvbg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdgc0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:30:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso7525058a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955002; x=1791559802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=;
        b=V1GD+VWjAXsV6gVk7LuO6h3RpA3liMnaYc2FctINq59L8bdVhLdbZrzENiHSAfcRku
         Q8n6Fb//p78b08nzwGJP66xn7fzlwbsmnPz2iicI+KhplmuuAU/6634jc3PrsUVMsTW7
         KLpkSUNF8f4lsbdXv3eMrVM31SZZNweNBPWCO9M/6CiS50bp0wCZFTYQs2CGHMRiJ7iQ
         EJV8C0+m+NNMb2IpI3pNVLj29x3gOFzlflZieLyF2fJxdtNJG8/Tpw9RTNCz9vahbSOA
         +ncoUsXjNSc1Zju0cdim31aIDSLQfTZHiHW5G9PNIp5Qe51q+xYIRBrLXWyCAMQ2tUOO
         Jynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955002; x=1791559802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTICCgegx83CMaefd/EXj8tYtmfzsjfJOJdBMrgs7UA=;
        b=LZh3s9oqKIYZnhVC/tqcpf9mFHYYArlpAEL9pr6YOepiOkWqiSqndgM8lkJ3OFA/M1
         CCAyOQUs+tgH+R7wpU4xOAmVcw8gANdFXr53xtvFsm7m6/Jaxt1HfwHc5RQM3lk2Hmne
         CcM2NMT9mEHNGDQTFmvVm6h/y7/7ncFnjfhb9EPYqttKaDqCb/OOdw99a6owhZH2VnaO
         zNicCz5xRSlIO8SAcP2ZfOts6NEGM1x+e2Ca4Lp2t+rXc7jCbM1s4q2irA7qq9qhDpoc
         6WYYjC3VtRgDsmgbJw9ohMeF0McYGS4lhVtBfEAay7a4fryZD0SJoUYdg0/JewVkj25V
         dtBg==
X-Forwarded-Encrypted: i=1; AKwUvBw0hxhinyY/UHjD4nUiD4eYUNQToqm9t2HWtJsoqaMGdSvBERHqkxrEUcC68o8lHBh7tSN43ms/FtTXySM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK007lB1KA0vpsn9oh127fy8CysLR27/4QkTv57uWeftxV8OZQt
	LMHksGX6S4aCMl9VThrc3qJn9iTouh5NjRCCfZxxKyqwWVamPD3zyS3VEOV8Sa1dn6tH+WSxFJd
	2HXPHiYQdUO4dfBk4ThtM1Iz7Q/rr8sRbY+5uU+xu7Z2ALiOZYz4kwsHDLVumpozy15I=
X-Gm-Gg: AYBFou1m8K8KNyU2iDaU85NRiyOyhwbEIwBSqxLbT1Y5pg4kcsVTxZjAMgvdLGK031i
	7dwhyota75eub5WSsFw/7yD9fzJpQvmZqIynCJXWz21p9mVpqI8IdSPUQAWITp078voAYdBnIfR
	9SFHF+QdzqdsosQ8yTIV/Xr3fQOMEnUhV9g6hLfux2djUlM/qiFSzn+S8hqjvBh9YPY0ndp5H/G
	0qzRnRo+R6i5LgGWoE4+UZpmfc+CSEz782sfpxpXxpHMhlBi+sse3Zq7NhdT0M8/GFYwAbKajGX
	HoV2UJr01pLEMoOWVsyBA6qbApooCcvsO1Pd4ZfdIdfZnBKXQw/pd8urfLQHrNu8WSzM/OIsG8f
	AQUH70s1EC83QMh42ArvPz9wQ+cDDTs2OUMrg6X4z0r439xw=
X-Received: by 2002:a17:90b:3844:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a6cec1c749mr3289861a91.49.1790955001824;
        Fri, 02 Oct 2026 08:30:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3844:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a6cec1c749mr3289830a91.49.1790955001162;
        Fri, 02 Oct 2026 08:30:01 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm1643414a91.0.2026.10.02.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:30:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/6] drm/msm/gem: Stop calling get_pages() for imported dma-bufs
Date: Fri,  2 Oct 2026 08:29:42 -0700
Message-ID: <20261002152948.85308-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXwt6I9UPgyhG7
 LX3lrmxianUsCnVFKOZ1qhp4vnik2vfpgqLC9nez8yf+PzcjGLUSRA0kLxN9kd98NSDADRKQsAu
 QtVyhCoWo7BmUbFpFyIIHi3eZNhLWSo=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6abfcdfa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=n7WAr1GF7x8bO2YR65YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: WMVSHqVc_grFUrasSX8TxAHAnleW5Mlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX/VQGrSjG5VzS
 1IkmjC3uS1K2l2TVYDZ+hccCixhAzbknHt+so1i3EHU/tdX2p5t/Ab8rwQJgIEGohssEWc5vwVc
 33otketr/c0je0Pu6QrCM56fWerMoPnvkloUXqZRJ2/j7laqAp3l2/NSm24Xbz8G6Dx6wgAkBHi
 eOMnkurcGOb5JQf3cyR9SRB1RefIOjN8kGUxHLSB74tmYzag0NCcKa5VNzE3weOimq9NbvStwlI
 hLYt8Vwg/rLrf7NBwYf0G8dtbTNhdr6T8YV2tiWrMWjVlJGHISl48ZiSsdggBSpl5ByEsLUWCxI
 kzASRQLKNTOvRrrTyk9uxl5QG/i7wGTWssfXvy5e1/xyAADTbX+mXSiZlOEwb6G4/MoQPOYqaJe
 VGmmw1o0jM+s2skLDcsts9ItqQKJyhMB3nivsGLQ6EHmeUl6T+XDKZ3iylyHAzvEWJBHbKFREgo
 HitYA1SIJGsMnBGadkQ==
X-Proofpoint-GUID: WMVSHqVc_grFUrasSX8TxAHAnleW5Mlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

Use msm_obj->sgt rather than msm_obj->pages to determine that a obj is
resident.  The sgt is populated up-front for imported dma-bufs, so we
will never go down the get_pages() path for imported objects.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++++
 drivers/gpu/drm/msm/msm_gem.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2341f209adf5..3111d7389572 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -193,6 +193,9 @@ static struct page **get_pages(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return ERR_PTR(-EINVAL);
+
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
@@ -286,6 +289,9 @@ int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 	if (err)
 		return err;
 
+	if (is_resident(to_msm_bo(obj)))
+		return 0;
+
 	struct page **pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 4f681100ecb0..e92c6723d352 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -422,7 +422,7 @@ static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 /* Are backing pages/sgt allocated? */
 static inline bool is_resident(struct msm_gem_object *msm_obj)
 {
-	return !!msm_obj->pages;
+	return !!msm_obj->sgt;
 }
 
 void msm_gem_purge(struct drm_gem_object *obj);
-- 
2.55.0


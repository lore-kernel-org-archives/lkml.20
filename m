Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797625;
	b=ZqLT0X+X9TziP5lGVW12Sh0DF4j4/wDCbeBORU6L5UlA/x9uQTR9L/S0qyX8KtAoo/Vs
	 VpVqidwFoowgVNUk0OkOHqztRGq0JU+vfkTa89L6u5Mo3bWWb9dj5qHKOzzzTv3rlId8B
	 VLpqKVtr+ZjACnQ8eB7xuHHAEC1/5pwBJibi+sv2ukjSng44wa4mfUT55sLmXiDk22I/T
	 fZWlPhW17aG1HNIUsgqb6sOV4k7/8SuROY9an+ZklP1d02p45gHiY/eMYN7S10W/Zvzxx
	 fhOCLvLAKSUKoh3m02rRoos4igbZOgFKDdfrfA1E6yYH60Wy899QjIQSmbNEIWveoXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
	b=uJdezfwDuQC8Hkxn3639xHn3yXVhWBOsP7bW0CPApfg/h2RxBuMqrnGmOww9/quxKYYa
	 SGAmJ1gRiVRempeDSEhAVy5HycZ+TMImMOsINUJLXv4lhTmG6VmpsZIUvBAp+wBj7q/GY
	 8FAumXSrfHXnhEJkWIJ4eulrDVsxtpqP/6TITkm1o6rypAXMuHSXs+wWX2/9BxEX28n2n
	 b35iv5O0zV6wpEarz99nyJEE6AUwj/XQg4MeQCyUF9mBqQss1HEAoRDAx0zq4cnszQhE7
	 Hkpc/gdhpXWyJNe9S7xeDoBOkWR8NMT1A3HS8zafqCi4pRJU86Z2nI4L9L3/Ql2Dn9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9iO2Sbv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDhY7ZUp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3525606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3525606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9iO2Sbv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDhY7ZUp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvEMA3683758
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=; b=a9iO2SbvV/Fpl0MR
	jAvoH2lR8GzMp2R4EltVuOwVK/TFnV/TiFdy8llNI1CyokZXcJy2hh3lKTwzslNF
	zyiuMMmXyo+TLHil8YXvLPVXBSahytP2Plr9OI66UUCgbESFLIXc8Q3cNfRVGoAx
	FupdamU71ie8Yd67O701QUoxNaTlfd10MIAAo7bIsJlCpg9/mfbcCtr+tAj2tt0a
	7uknFwMz7Oqwtj6OARE8Nxs1rVJjld1nokFbLeZHPWVti6hqFB/IzhagKlh2u94a
	RFg3sfu9QYsqlN8govtdTqS+ebdnMfHPiZqhXcnNW/BqMuEhInfvDUf7rDl9GouI
	t0dT3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sb6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so283487685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797623; x=1793402423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
        b=PDhY7ZUpI6QT4bB7rvjgYhX8N1Ce6DPrUDwHmoAxeXKNpr7+Zv+rDoYkFz3AfQbCyN
         9uGjDSjUKJUg4aiX8YxGnyfsz17aG6Qi0xKonjl8/yC9nyhsBguWwOVV4s3lgvXuB/Me
         OX2px991gOC2KVAOzf40zC3xH7tsYe/VwQ3UYjHPbLrSTrUir40DVyy2L0VRn6fOjUxx
         EudVNSc+HrgGDHu6BnN3vaCrXU85fvo/hlq4j8KAQQTEClmgbH+9DciEDFulFdTmwpIC
         wLFPv1moPgXeb4gEttgV2wDaQhIZOm1PYrlOxsW94Tts9qojWlY0sxTgLVh/KfIrrK35
         BL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797623; x=1793402423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
        b=baJBeKkaWeVby4SdwRdMmu73jRQeRJ/f89DMKbBZBJZZ+RLhUPs8ueyEZMB6CT07A7
         ninT7SIBqQo139z0GRzlZ/y39F+/PokIsuVJNrZHaX74oOsPEmPTYJFRNFATaTlJzU7r
         CoCBYL2fzz0BAZJiSf3CJdM4FkZ3iIlTJFT95gZf0K95x5vM04jBszQb2LqSJdXwn7HW
         Akjxvh3CFu9iIIKBdz2PkDnvJhGoEZ0CjWi57DX3ZcReu1ADwmUP8fia/U30unogktbE
         UXo3+ITOyZg+S9zDAdTL+4kEhEdov2ZgJvdujWvPLbhgsSR19Of/DIHkcZPdSzvPPolk
         t+jQ==
X-Forwarded-Encrypted: i=1; AKwUvByr1Lv0oBhNDzRi72iCpC+KsKj9VYK6wC8ML+CAktSW7khAKHQLDRR1jBNKifhZGYArdkzX/Jl3v103EjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkfZrzZhC1QnxVsKCnh1K28lMcGPS8gUHkARiOOvEgkDOwjvQZ
	/wjYJDFzUj+TltES8qRtXpnQ93YiJVi93vhOahu5w8d/6eEECC+5UXPDfO83I0yMePgv0YBUlR4
	BUTbj+Yl6Z3qLqNl1SE55BCp2OcJZlaUelDiAs6vzSfzWi2WESCt7dR941z/4gVUqPLo=
X-Gm-Gg: AYBFou1rrVDGLFm2e2d7BIvF1bdU2nch7KnebJHnnWBUxrMmCWo32G+EZi5+b+uD4rL
	aMDpoQigc6rLrcvB77OqZBZzsQnvEjYA68oxxNQCN6poIKVxPNskJlToxTzs6Nz47i1GGM+IL0e
	zzD0VZCDLksPJZo07Qb++9qIspopNApEFhSgoyUp+XYgkURShAhvDuY9D8FwnmG7BvEtLTCHTQZ
	jn5DawYeBerYI9If2mKNvVf8XZPMKZ3i7jJccblbA2pkf5YmHdIEczzvA1b9+ubyllZzEVFa5am
	zBuJGx94X/eXy6gFMgrPpOf80BoEqT0VjbQJD6Uhw17zw+SDHlvOzphnSW8tRzCRsXcX61Cf2d4
	oSWE1TwQ3Wo91+ryhTXn4hbJur294mYazqtYxjWvQPPr5VmkszxZxfOhrnZ1rn1H20b3Qb1m/z2
	FTg2D/WSiXq0kz
X-Received: by 2002:a05:620a:608a:b0:93e:5fbf:a41c with SMTP id af79cd13be357-940ef8bce10mr89611985a.16.1792797623301;
        Fri, 23 Oct 2026 16:20:23 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93e:5fbf:a41c with SMTP id af79cd13be357-940ef8bce10mr89609285a.16.1792797622802;
        Fri, 23 Oct 2026 16:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:41 +0300
Subject: [PATCH v3 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=B/6y71z7QZD5In0hTeKTmGTBI2ihmUVSVBNm9f6oKmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uUdaM0NnOuVLj898v2QdtaUnwFeVQRpBHcc
 XyBUaFTW+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlAAKCRCLPIo+Aiko
 1evjB/49zUKYkvnvAWGzAg3lxD20MXjvpIkl/ZfrdzJK6dOX64hvE+8udwke14BS2Cln/znh0zl
 Y2yahTL3O6VMyvkrG6wHpJfNGBpgBLLJGX4k8Mi4TvlejJ1WkkjvM2R5DFMrwcRcp8aJBd0i+oG
 YGs7QBtkYmWIC0kNb3j0bpkJmS3FelBvh6X/6tuYuchOAhM2pX/FdFBFNZTItWS6IrM2AsgzQYN
 gt4VH4XuSFBSoztU+x6ThnIgpmYBsX1ZpaYY63FpKXPjl3CQ/ak1ozdCqwhWy88Z/rvRQGDYnwk
 MskUvsmNPkSfvJ/+OeQW0B3Cx0bFi4D7ytVfgM+FE7yJoSVU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzxpmhPyI2MOY
 i4lT51FlEIOFTyRJHfSxTXMzNZX71pyBj1YZ7dTqhNlYZ/DO1Cw7jjUGdFLWGi0X0rUK9u/yiFs
 7x0iNB3Fgbh+BfLhVuq6OAHqoJsjkX/A0Y9Ej/83EDWbHfbBZV/dt/Y1sUPc0wvydXc5Jk91ngh
 9ecgKM31bESaF3ANbssxEa5LRMqzYzB8rE5nuj+QG4tPx9rJDfhyGknFjLGD+BrhL46BqHG80hy
 uKCIjp051zL+owWFVV4y3J71KpEDlDsogjElxx6CjNyW8Al/fgsOYbniOxHfo3NQUb9gBsGFT90
 JrkIoGWZjj31RFzcb5n7T7Yk5slofHOh2a8hbCtjHzjR5tjyuQoOk6hNb2QGqFr5pTHcea4hcZV
 LWdTCo4bF2ht6Z/unf+DgAI13altZfNIEDK8wtIQinXqgR7y21EhchAR38Tvng0ptTl4W/aUpLH
 97JGAT9S3ZnCRqlD9Hg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbebb8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eUwfnINNGUSAVHp6jysu7kA6SMvXF3C4
X-Proofpoint-ORIG-GUID: eUwfnINNGUSAVHp6jysu7kA6SMvXF3C4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXz81pYX6VHok+
 en6iaLnJnJOga4Qedt6yeqL8i1hGbP4afvJ/Eo4YJHzmSBOobPtSxMK2ec0vept8WGZgy5Tc7Om
 HEBI3nBitTql1W9s3ft/ObWQuWamCb8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

mdp4_kms_init() returns straight away when one of its steps fails and
lets the ->destroy() callback, which the caller runs afterwards, clean
up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
after mdp_kms_init() has succeeded, so a failure there turns into a NULL
pointer dereference. It also leaves the vdd regulator enabled.

Set mdp4_kms->dev before anything can fail, undo the steps which have
completed, in the reverse order, and tell the caller not to run
->destroy() after a failed init. Fold the hardware setup, which can't
fail, into mdp4_kms_init().

Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c299fef1a400..c2172e5f9e85 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -29,9 +29,8 @@ int msm_count_mdp4(void)
 	return count;
 }
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -84,8 +83,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -132,6 +129,15 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+static void mdp4_destroy_vm(struct msm_kms *kms)
+{
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -141,12 +147,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
-
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+	mdp4_destroy_vm(kms);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
@@ -156,7 +157,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -400,7 +400,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms = priv->kms;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -409,21 +409,20 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
+	kms->init_unwinds = true;
+	mdp4_kms->dev = dev;
+
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		return ret;
 	}
 
-	kms = priv->kms;
-
-	mdp4_kms->dev = dev;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
+			goto err_kms_destroy;
 		}
 	}
 
@@ -435,7 +434,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -444,7 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -466,7 +465,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -474,7 +473,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -482,14 +481,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		return ret;
+		goto err_put_cursor;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -497,7 +496,23 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
+	mdp4_hw_init(mdp4_kms);
+
 	return 0;
+
+err_put_cursor:
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
+err_destroy_vm:
+	mdp4_destroy_vm(kms);
+err_disable_rpm:
+	pm_runtime_disable(dev->dev);
+err_disable_vdd:
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp4_kms->base);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.47.3


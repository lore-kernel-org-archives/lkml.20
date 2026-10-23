Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769531;
	b=DYqrOQDtsvHGTL6F9pc/AAe6uvd3ktrnRLE+ij5oEMODu72njRZSblEUfQCgusEmLq6t
	 h0WOpY17fLTU17zJr1NbbdcA2S8cHpfTKhrhdQ/K8JyBkjOlu+wIb2UKnueVheVfohOh2
	 gpaT74sacy2FNnjUpvlqtyB2ryvI7bz1Eql2rbgHJXGH+S/EgbIIY8XMUbwzciO9yOWls
	 VloyR1fPzsPpcH/h3KGHBNqxCMrRBZN7L3ePUk4ei0NOIbCYVBHW6FKWn9RvRual2H4Ou
	 fons4hh45ns7KfBVbJebsP1CLbgnHyTIayBPEeZgZ39N9ivZIc3CcalkMPaz5VKRRYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
	b=HF9r+YI5j7xpSZP3b3LcP5Uhb0BzIdNHdM1n0DTwLaIXHtTpaohACgx88OheBINKuzuK
	 WXaYLg8U/OoCqq0ytGieYpPv4KFTOsc2s41S8E2gAmk2O26KiYubWw1yS5l9wA/VLsa35
	 +7Ysrukb/63TVUwNFdHsHYOkFoMLxQsvDffXXSgnANsT/9zhrjb+3Kcgt8gwivIVusmKD
	 vSqMAhED4khjJOGv/LBnsNC0D4oqw8cZphrRaRw7fPHRGfhqjp+677ExQQVfjDkOCqx1U
	 AJSsNNZiQqExZVePv4taDTATfGIV2R5R3M7eIbnNWI+UlyQXX5aYZ+uIh2KBGLvP8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvLgKBDE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KggnDxTF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9660A5BCC
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F9660A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvLgKBDE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KggnDxTF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Ahl2999833
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=; b=kvLgKBDESPU8ZDsU
	FIwwUJZZEzWiJ4CKEXrtOJUg9AnOQG+p5GN2TlIH/crsEBMur926Tt2fjkErDpZK
	HRJ4BKDDCJ00g/PEcqfWC/zgwxDHBGcwL4kUf8O0GA6JM7YJSZlfkpQr+LqcJku8
	KYvSV9NdZ7/n8B1BMpTIzLGHaz0MclWYnJRB71hg5tELNMcrkJSbxuP4S0rjE+Fg
	iTa/lVcI6sNqLiEcxhbkgmaJlGcsfVXIJjg5TfAMclkVqIpYv4mPbWMbP69SOtiN
	qMc8FYmT/giNSRt7RmLC81DRINxDZPQixaC6g+MUasQg6nUiUKdzyLSdCp551kJU
	xLdlNQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0q6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99063f4065eso255180241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769529; x=1793374329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
        b=KggnDxTFI4FTvrYtZTtLB1lJ5/UAgrbm6zIXNiqM/ELa8Xsf0Y7Hx5gU1fthYV4tkW
         +ksOgEnhzJIsj9SDBr0U4q/UQ6siTLwhCMuqrceEqRwBXUDt5ZvT98j2K6XWiDgbd4ZW
         vLi6ow7GDTupbpr7Drx1bDZZo8uiKmtXNc+fp1NDh6miGrRk6S4z2ze+UrowMP89Y+zz
         6TqlMoX9m6fYAEbQzLykP/1YfWQIocj5+A16J++ilzgg4CllyiFyMzP6nDCzjEkXFVrC
         1hznpTAnHBk+tex07bTrS1xIIqUa0Ax1YS9NB2hK8s/iwO/bKjpuPR/jlc3nmfXBQ4xb
         3uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769529; x=1793374329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss2KL0OlOxY+W+P1n4KMOe89FXmDrXUTQoz5/67K/78=;
        b=Dsw7AR7IJR5BwiqdDYiu+Gsk15RnIGTGiSAjOAFHA6u8UbIcmzsnD96TtvLbVdDUh1
         iZtmbxgRTfjHh9PtkzQbmARrY7AoqSL8jiuQe5trWfxLWo+znaWixufCpQ29TCBzDr4/
         LWVSKcW7w3R0zJ6CEqfpfTlNpX75p8OtqH6D/GXlQZl1HB5jeTY/iKxVAuXSq+uYr0QB
         ++K7wfxLLh+ir5Ew+inexv71tO7J9PDnc4KOA9vsviGeeimu5UYGoNf+TiRMcEDGtwvi
         9JLK+135gR+BWE/fZbc9SOIsmcP2shDeS5595NR86h/++WtcjHT88vQNXt28SRQ6KI6M
         SMqA==
X-Forwarded-Encrypted: i=1; AKwUvBzpMFNX0Epf0IWgpViRIRXnHR/AdTI50Fh2sOd151jnCehT+gf/+T480zsQ6HkwdDe0nQzl+B8pxeCxvpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkXEz5aWKSXyQ+kwAcYAfgNVJEftSQarbsN/gySU+5T5/eL3yL
	UFYsz7qe2WxhPBTgqpgar8F7TZ7MirNMJO5Zcpk7ZRchWH3XC6Zzmv5eAwylMPVrqhaiyOzjQTD
	NGfwytItWUabRjVymtkIG5UqM+JEY9fpT/WyTGZ3zMNtwD9Ttxk3H4lEp7bmsTwfSsW4=
X-Gm-Gg: AYBFou1YUs3Q0xHha+Th91uBLlOO5XlNjfKMJJ80ivHm5lmH3T3ft6IzGqgH1CUGpx8
	6dhGJpmSOscLKOdWLWwcLhiyJXhDiQQlzxlnbIQsmnE2jtrbvvk7IoKy/WMl9tzg0tFdFPGkGG+
	L0zvPMzLak6a+oI9Ft4dBvUCpliHml4z1XDM8C9xWOurGwP30H+48ulMEDt0XL2px8Y/IdfaAke
	yiuoxxoZd4uoAoJzc2XLhaaCHBNWuTtzmvtBUk/eDdSRSeE36IWQwsktuu5XXHW3/cnUwNmkdvu
	z3NjPKXx0Eyj3eSCJD+Uk7mwpDsc5h4FQh52pe6hwBHYXkEHZlKKBdjlUQVb1nfWyVQIaHKaRxd
	rwWul/rGGf2lbfdey7fEnde6gQvwqWHzpxD71QFK8uiOlAenQSAq5GJR00pR22hdo4l2QD3FiQ+
	vs+faS7tGawKBc
X-Received: by 2002:a05:6102:6445:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7ccc31cfefdmr988218137.13.1792769528991;
        Fri, 23 Oct 2026 08:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:6445:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7ccc31cfefdmr988186137.13.1792769528478;
        Fri, 23 Oct 2026 08:32:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:29 +0300
Subject: [PATCH v2 14/14] drm/msm: drop the runtime PM flags from the KMS
 teardown
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-14-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4747;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=B4JgGLbwDstbXJHsjEO5t0PiEr07XCtrTjLF1Zlgghk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233d05ctLcFT1lQ5L0/y1fptF2HZbcHeyP4sb
 JAkkvqqzfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt93QAKCRCLPIo+Aiko
 1SETB/9GthrzeNPq8k9LtQHSiF43VI7ukKfO1qp+Sqy1VfPwJGk6afIi5bG9zV9tuFc3RXD7H9S
 Wdyw9IQyb7B0r8OjXjtaPsp3ABNorMhRIe+ar2YRvLeRN0v/J04O2oqFuI/u7hYEiPuNOfzIEkX
 a+byim64iLn2VYOaMOZMNT4qm0TEhNSiQd8SN9KrUDiI5iB2sdUPxGifzecdttWjyYjiAgLJHvM
 vQwH9gdoe6FgLUwN7HBlulveia31pWVKDg8HF7TABV8sVfwT5PFJuhaF43nXuvt3uL9ok4N5H49
 AOtjRoBdgN/3XUcMg3RXyD5dxC+F79DScnWsLE8tXz+K5+z9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX1eZRSFqM68Y6
 qowapkFFMJEjgA0nJd5gAIU9feDUvKxb21Dh2YhUNW2StQ1ZJnLxA/wDIaVRCEoj1yG50ZQnqfD
 bSo4FQ92SaZyIrgk3VlYrooCSVhITUYNqAnR5/VikA+G751EwUedpzfI2Hje/pB8rxqWE/uZ3wx
 u59ghZ/1KbOSEEfMOFzdwmwp/5AGeX9F1Cwoojg/zNDqFVijuPWwIf2434TZ39RDd8vDh5zysC/
 mzBmXEFurNDcqUXo9y1r5bf89kzld47p2hTndGyX5NubINfgORVTVCkD0zaMrMHFlBFmyfx3cw1
 105QoJVKzXXixYkD0ncxFhsnVulFkKf0ANCyj18hAkQXXKw9iFbMTpIsHlu6Qmhna4e+5dY++wH
 PnXWjDHAJqSkz+7T/Gz/ASHyaX02VOOeckjCBbPvFw32teC7uakF6JNJQtmN+Jf23kVo+Ch64YV
 jg+LzGk2ns5CcJLPwyg==
X-Proofpoint-GUID: NQZd80t76c-VM6GySMqvOqtamZw8fSyy
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7df9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=83TlOTTOEq1NsKmbc34A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: NQZd80t76c-VM6GySMqvOqtamZw8fSyy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX2QMveB0D5l4N
 YqsrcYcUyG+Cdtm/lDg54JMllZtWjF+lkATPSDsJsOLZEMX3+bDJqX22jhZrkGKIlnWvo4olPFN
 E4LDFJduiay1ZbcaqkTKwxJ2U7RxyyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
tear down a KMS whose init failed half way. ->destroy() now only runs for
a KMS which was initialised successfully, where both are always true.

Drop the flags and the checks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  | 1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 2 --
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3546efacba3c..e994fd267c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	msm_kms_destroy(&dpu_kms->base);
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&dpu_kms->pdev->dev);
+	pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static int dpu_irq_postinstall(struct msm_kms *kms)
@@ -1320,7 +1319,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	dpu_kms->dev = ddev;
 
 	pm_runtime_enable(&pdev->dev);
-	dpu_kms->rpm_enabled = true;
 
 	ret = dpu_kms_hw_init(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e39831a397b1..769b8ce6332f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	bool has_danger_ctrl;
 
 	struct platform_device *pdev;
-	bool rpm_enabled;
 
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 58a269cae31d..0668ae79f6f1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -129,14 +129,12 @@ static void mdp4_destroy(struct msm_kms *kms)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
 
-	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
+	msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	mdp4_destroy_vm(kms);
 
-	if (mdp4_kms->rpm_enabled)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	if (mdp4_kms->vdd)
 		regulator_disable(mdp4_kms->vdd);
@@ -437,7 +435,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	}
 
 	pm_runtime_enable(dev->dev);
-	mdp4_kms->rpm_enabled = true;
 
 	/* make sure things are off before attaching iommu (bootloader could
 	 * have left things on, in which case we'll start getting faults if
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..9dd829ec9401 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,8 +34,6 @@ struct mdp4_kms {
 
 	struct mdp_irq error_handler;
 
-	bool rpm_enabled;
-
 	/* empty/blank cursor bo to use when cursor is "disabled" */
 	struct drm_gem_object *blank_cursor_bo;
 	uint64_t blank_cursor_iova;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index c349eedd55a6..bbf459bff35d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -575,9 +575,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&mdp5_kms->pdev->dev);
-
+	pm_runtime_disable(&mdp5_kms->pdev->dev);
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 
 	mdp5_kms->num_hwpipes = 0;
@@ -734,7 +732,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
 
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0b..c0b163c4baa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -62,8 +62,6 @@ struct mdp5_kms {
 	 */
 	spinlock_t resource_lock;
 
-	bool rpm_enabled;
-
 	struct mdp_irq error_handler;
 
 	int enable_count;

-- 
2.47.3


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193E2749C1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987443; cv=none; b=Zf10lbKjCbavAwdEwXVHbNllMFkzfGUPntbCXQm0lHzDQoE3uVTWvKwpgHrA5yskBf2pWRxgmwzTDBKk+QPEairXwgTqqigtprb2zXLo3DEA/AtpRziinPD7zreUkYGoI6MA2Fox1hP+Bpf/+2YTgUf6e0r6GHvdNqVuU9mTtyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987443; c=relaxed/simple;
	bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYIcgk9JOVJUIw3QOdVPD3kHjfsgNEw3EXEbIqYUElbgyQRrTizEIaXO0cNUfAXVYnCCb//duddirahh45yRXv22BJXs5c3NkRsfnr6xTywoTGVa8+UD8vfhduFK12XuYGcfcHQppOdfzjFz/yBDPU1uzXYGZx8KwwHCWtm1DVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3Er2bYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baI4zP+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3Er2bYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baI4zP+y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nevxv3187123
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=; b=U3Er2bYQbYYenOG3
	yz//5n/vcuk8BFff79e3s5ptrjkIEUUoCjw67ERR2aXKSg91vMMrGwKMK23T1tCo
	hPtTYFm3ZLDKv9LW08Bfb7aJgcqbZlpmfaL123hV1k7TlhXbu4dp6esJwJK9AVKf
	xNQC1Oj51tGhjy+3V1uXU7yzTT7C4/KIeQ2VCB85mI2PFF2JjFxm1ErY3ApXZrms
	K2FU+wMgQ9K82siMho0PJ185+q6D9j89U/CYEIaGZL3c6JxTVoFul0JqUZjPbFjv
	lRnNAuRuO7L6w2I9wmGvk9g1HrGEE8HJKLtkykk5BNbO7J1n1RvV44k3yYfwwHzg
	aZKDgw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh4v2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a510b22fso8651726d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987432; x=1791592232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=baI4zP+y87rpNwM6tEGx2nmYOoB2CgfXFDbGAy/bvYjv7WQwyU9yrq9x5kcjXEq841
         gJjn8ha2g6NIz9cEEE9A5RTq1JwhIioCkccM20KHpM5QlVsDnPH8KOPVUa5+j0Ph9YIP
         e8Wmd0X2Mza7ylw6RYMHabaCot3UwojUYZadVhYJkylRYL/ujAG2YLtj4qO4RFVLTIUp
         FvKerKqrzn9Gt55rWIB/tSUUOp1JDsemHIrBldC8DCoS+U1+SzDzDLVO0sSYWji463Xt
         sbZyQVoXPKqGMFdyma3HkSBA7r0aDeL3k1g4qG1zIXez/OvU9Tvqb7Ib9vSvDk0wG4CC
         MBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987432; x=1791592232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=nXh+Der8GQ/rpaOi0G8CIw6M7JSHrzCdS4CLp0mqxEZzr+lgiO+SMAvtC4e3fFg4bj
         1G+9/qcsB4lfF/hspUc6yE01OsBcBLBqKWbOyXG1huXAvvdez4X260MXTdEyxIu8yqEb
         YjacSci8HI2xqd3yxD0L3rpON1Y+Xk2Is9R6qkkmlKiUO+HYGXnNns7xZo9ZzVFfNkVO
         fwtigoL/yiQYYdvUU5PlPP5zlID8XRn7gZuPu2dzwsHvcTaIizDNEYTxibtRA8OGLAFD
         cWKYiPlWDQshIiIIZq1RwzHjetX/VDJQWVu10Qt4csuy8U1ocxjEDX8m8TN+sW1JBN9o
         5Dfg==
X-Forwarded-Encrypted: i=1; AKwUvBy8CHI3FsyWEvcXinxm47GePz2so6tJuKmKmQOxssaptFmgodsiP0o+uSDHPx+V7VJTN+jFzI6ZumEmPZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++k79hllOOmbM4HS/Sgt5064JuVQDKAe9MpPnRv6bPrlLe52YVzy
	WsuAfg1CDtHFT5YxKpHEw3JZfQqhJjr9gMXO1z6sGjsoZttPhFKwNgtWlDVF3nHbkYSAPVcUWBj
	3K1R1pIxbkTl0tGZ6qRpbzJis41nT6ZlGQFDgFQuzaimNFBcYuWp5zPMZdbZZ1YE0JQE=
X-Gm-Gg: AYBFou0zLsayEm/O1LdzAZ3oWaZHKWjvD8PD3d/LDFzL/AKpo4eBITgDWBe5kEp9XCm
	jVoOdY8zT8SKinzts+ODgzD18zLVr7EjXMHxM8IM92JzMk7cQgvRi+OcsnFi4HcskSkI80RAjjq
	fM0vxfoF6h+eNLxSXONhCob4XYql8jR8N0kGylbyK49anpMIBnFFqpvaCEGTVKBf0PpcfOKyfrQ
	HiQjcVu/zo36DoalxpuFszH5oFs9D2nHdtaTiXvmrh9wFoYu09bl2IZdt6cU0wazGpWba1bHdff
	1q91qj+jJ+SOdXEpdkrjrosMA+zHdsxfvpmVGAPklIQBZVpAS2WKB0LmKkjFiPK8zUV7kZFMTnS
	n3pfrJDzDoRoUunrG9e9RlyTTY+VvRznEVGZAUB/sQrTn5Yyxtu9LrELlMm1Sog4/3z7N/aoEJf
	eDlU9cnvUQiZxh
X-Received: by 2002:a05:620a:1b9a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cf178a668mr803419385a.49.1790987431970;
        Fri, 02 Oct 2026 17:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cf178a668mr803413685a.49.1790987431402;
        Fri, 02 Oct 2026 17:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:17 +0300
Subject: [PATCH v4 02/10] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-2-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydtwrPat7qXUt66f+1g4fJ8zOYW9Zis+PZp
 +p7/sDvxfCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1cxRB/4iUUgl17KXsRCJ+FOWP4ku1AInAHA6A0VhVqHEZMS52SlqTXHj+gh55MXrQynLwF2a/Vx
 YewljfPpngqmOQx2GAagDIm6k2tegkQrh4xmCE5GEhrwUkfCr2+0VkLjGbvCEXHVvhGEQ+JDj9U
 FrS8TYarjb96cwT9jkOnohW627OHttXoLAJ2zF9bc7/7uG1bUQytDJIGOLc0UMdjSm0nwBvI1jt
 zg7iU+r+8jCIsjgsbJFvppl3M3DkHWkwWPgvPasDZx0eWRdMuPOJiN+6T89/qkO1oEVVT62q8Pi
 0N3tRWo9/eoBAkF1zl4grO/n19xAfWTdQznHCEZ1YmE8Fz09
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX8zpBcm1VwGyC
 L4WaRkzOMjKtDlOZ1SrPCuq/1z9qbeX/6NPdwq7Jarx8fTM1+21oIArNkU6PazeWU3/4nk6XvbE
 /cE6Hg8JW360XtmbKGH6GyAY7cIiFGY=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6ac04cad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oM4tAuVuu9RyGq0-O0gA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXyBI2ypQ8gCm0
 krBLTHeEoZj/Oq9PL/vm/9bA+TWUX3fcRpS9tgn9/UyC2GeMhF2r7/z9OSLI7/aJyUJwWcmDDng
 w5NLVXYkpJYs6NaDrtpcA86qNKUW9qP29NwxpUkDaSSNdghDUCKq/DJRHk2B6zP4p0P94D94NtS
 rVE/2Fy0U/duM71QqP8sPW/3ebEzJ6hbzP0OaZOqa2T0vwYL/5Xn51DbvZQ/R0G0liw0kNUl5q8
 N09hTeedogSA6lAMe9Jr6vdiwWLik3kSwdTrIZ+w5hBwR2lSGuMuNTvDeAmsZ6JZ/VD0wUB/dBm
 MaX7eoqk8yyAgBWpDtB63ifqkTftRbFj+I6XRDbZ9GMcLZIDd4qiraNks+T0C2COtfYtYqx3ZzI
 rWcVKwIJU0Hb1RHDnGBUE3szDhJfP1K1cVr9yEpYFYJ4zN9vL8ojF259n7DM1lL/9rKFSiMWOSb
 I/qUbTMBcZrSu/PxKMA==
X-Proofpoint-GUID: Oocdm3jtEys6h4DpoG9e_Ppb7b8NdL-_
X-Proofpoint-ORIG-GUID: Oocdm3jtEys6h4DpoG9e_Ppb7b8NdL-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

msm_framebuffer_prepare() bumps prepare_count before pinning, but returns
straight out of the pin loop on error, leaking the count, the
msm_gem_vma_get() reference and any planes already pinned.
drm_atomic_helper_prepare_planes() does not call cleanup_fb() for the
plane whose prepare_fb() failed, so nothing ever drops it.

Since commit 8ac37c88f991 ("drm/msm: Refcount framebuffer pins") a
prepare which finds the count already non-zero returns early, assuming
iova[] is populated.  With the count stuck, every later prepare of that
framebuffer reports success while iova[] is still zero, and DPU scans out
from a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

Unwind properly on failure instead.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index a38e5b3a1d1e..792d47b4acc4 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -80,6 +80,18 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 }
 #endif
 
+static void msm_framebuffer_unpin_planes(struct drm_framebuffer *fb, int n)
+{
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct drm_gpuvm *vm = priv->kms->vm;
+	int i;
+
+	for (i = 0; i < n; i++) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+}
+
 /* prepare/pin all the fb's bo's for scanout.
  */
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
@@ -102,8 +114,17 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
+			msm_framebuffer_unpin_planes(fb, i);
+			memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+			msm_fb->prepare_count--;
+
+			if (needs_dirtyfb)
+				refcount_dec(&msm_fb->dirtyfb);
+
 			return ret;
+		}
 	}
 
 	return 0;
@@ -111,10 +132,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
-	struct msm_drm_private *priv = fb->dev->dev_private;
-	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	int i, n = fb->format->num_planes;
 
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
@@ -125,11 +143,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
-
-	for (i = 0; i < n; i++) {
-		msm_gem_unpin_iova(fb->obj[i], vm);
-		msm_gem_vma_put(fb->obj[i]);
-	}
+	msm_framebuffer_unpin_planes(fb, fb->format->num_planes);
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)

-- 
2.47.3


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DC51A737
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881069; cv=none; b=Sf+s5ctCIjDjXyBK6pIEbyw273rf4HuiNS4lJRsV+37kK8W8tshYr1veCCbHuE3xAaxeh3SAXuhV0yyra93gw+2VS8A5kNaUxUIK8mK4iauWBn+LOoJ/hwrR0EbRluwk5hDhjVzEjKpgzsMuN5BxzRcvwDTJ78ykTrJW6mvpxqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881069; c=relaxed/simple;
	bh=UYl5uPwIe+02hy+yKWe86cREn6t55UaPf6pfOMS27Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dD4orC8NbKpKVLlYLcLTFB+FIGgP7nXonaIRMkbNHyAfiN9/4HuJI0bXECAxH3eN3YWBDJldDajbQ4XAUYtvDz26jrbZkW3Ys4VIA9rdp1gIL40ZdQiMeonm4i+4SZgLlRLHLjZwyXYNO5ub3IWJA8AOlRVfuQW/382ShXNMx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dw1oc+Bd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvMF1Hs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw1oc+Bd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvMF1Hs+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1Lap3670653
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hveldepbFOlrTK82JptzZAqafhP4xGd41Uh3UvDE8Q=; b=Dw1oc+BdXv/gygR4
	gPkUad9PeInTVCR07yFjnrzQZw1zgaUZbMmvy6iPc0zFabVtYGVK8cXOB7uQvVLS
	yb8kY9ZQfpMsSvHKsp+pIVclezlDTmxOH7QzNpgVc8DisxH3QXQ6Uq/wdqGfzMh5
	gsTVF4BOVcaPKtk5USPGRxNQ4lL8F0k0Uz6aidx8Ly4HZ6IrDpkVJs8LlxnHb107
	0M5GGjSxJZ/ZvNWj83COy5E5Z/0OG0NYU8Ct9spG3HN0cmjEEEVLuTUl5hvpxwTU
	i1Z1J8iI/F0NzIBiRFImTZB7eRa359sGqh6rIoQZ+sRmlAWvYfH2mCsAYCClXkj+
	jIiURw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7jcch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:24:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97bf875d5f8so3783366241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881058; x=1789485858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hveldepbFOlrTK82JptzZAqafhP4xGd41Uh3UvDE8Q=;
        b=KvMF1Hs+/0bKExoMIRi6RVBfGtRh9jzZWVp6jEsCB8Pz0cr6sgCElIjL468qVjLkPi
         EXDN0LI5FDdUIn9mEUTSInmOs2B8VufM6bYj9AGGON/2G02AwDjbNh8hgs4MGNgGrUi5
         UCqaf4/uKUaZ9epUL22y370HnTc+8GOU3t7NIBjpe5Gn8l7JfqGjVk0jzmEm+BsvmIPa
         5cd+tqQuW4DWsHrXuhpWJHEY4n+mx+Sgq6rCnARMFmYIiDClGlpsvLmuwC3x6+Fakna0
         vVHZAY/3AAy9dBIG4DuQdESQMS4gWzsN3AMtctLOrLPq/XWPYyJ58WnLwGMy/+UCkcHF
         XQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881058; x=1789485858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hveldepbFOlrTK82JptzZAqafhP4xGd41Uh3UvDE8Q=;
        b=IEOwKw/KYn2ZkMkTs18o9WBxzd/QQf56wWToArMWqQY7PehZWWGFdpjGlsSW+2vLuz
         Ha5i4DPkzIypRHfu9m7tN7ErJTGwWLVNo/8gDyUsFHGiLpf2xrwPwVgu0XbN8WYDjUgY
         SFaflspSisuTOKvccq0JguVGqxpghIh+HwNs3nRrh+cQiQHgMOQJ/HOIp7xosi1ueD32
         x0ZHCCbVweV9AGCD4+1PDZU22cEict+aKwmwTWCVv7BA/amL6o3auHo+gUE+ut5/fLTK
         rtMJ/lNEGz+lqKrNEuv5Cu1e8mva9sdnmlqWHNC0eeT+tUvbtefAibKL9cxYHo3IVvrG
         cWsg==
X-Forwarded-Encrypted: i=1; AKwUvBwvtuPpFTSyaJN6tw1io37izDQujYlqSvImFHcl1mMpEJ333eyAfvpLDbWE2bIyl1Ji51EA+REffg+Bu+U=@vger.kernel.org
X-Gm-Message-State: AFuF++m59GkY1NOtq1psvUfzGJ0BvdxVTGYkLy0DJwtG1KEfIdWIhNRX
	RJxQSYkstwEsY6TbBih1QspjOmoKOkOLDw6cliosivU/TxedgMA0QoR/A0E8S3vUwWtJSp06nQ3
	U1oxR78WMJZW+biFSolitBUEVaHlFbLNAseNMX2gHZCKg1dqADW4KxiYeAh5OZ5C89IM=
X-Gm-Gg: AYBFou2WPA/sZ7nxIchW/3wrxqKmNwOshAIaNKEAtQGetvUamKDhAqaxwvY8kkN7Y0U
	K9WzplXQSE65jgpJzqB4OaIQcCuwLsCrTziSTcv13dQSzbBmG91FLgE19KHV76iOmRK3WaVh3QP
	QUJk3oNZSCT69feB1oKKcj9dJJ6BtWu6A/43PwARIWo9gmDm0tgyMuAby9ypH6nnSNmoh6Y3bd/
	lRp30lSsp3lvsF1I/OyWyNr0waPiOQxFzQLZp661v57LrZDrn3cGCVREwgK8h78kgIRA5NVZUYl
	ALlx6WYmeiglfyZkI1immNVvmVHvzhN+OAjM++shR06tiU8ICurjqhQ4b9TD0+CyoE0nV7OW096
	3Jane3ww1WDqONVeaDvMw9P4bG3tUcQ28YWK4pXTeTvCv1pkXx1aPaT7vNCquzJB9o+eBqVDpaH
	Irln2zMjVdjrjy
X-Received: by 2002:a05:6102:6495:10b0:734:54fa:971d with SMTP id ada2fe7eead31-78a2ee06a31mr6908226137.7.1788881058458;
        Tue, 08 Sep 2026 08:24:18 -0700 (PDT)
X-Received: by 2002:a05:6102:6495:10b0:734:54fa:971d with SMTP id ada2fe7eead31-78a2ee06a31mr6908198137.7.1788881057969;
        Tue, 08 Sep 2026 08:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 18:24:10 +0300
Subject: [PATCH v2 2/6] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fd-kms-fix-smmu-v2-2-9391815742a8@oss.qualcomm.com>
References: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
In-Reply-To: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UYl5uPwIe+02hy+yKWe86cREn6t55UaPf6pfOMS27Gs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqoCia6fWmhiI78WH05KOSSQqikZ2cN4aPI378b
 2uqSykW3KiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqAomgAKCRCLPIo+Aiko
 1RjdB/9wvr9IkU9TQglSkUwUDy0hAnyERZMb0gBDpBkUyGuYKgLfPQqcTbTULAuYSvyLM5PwTeW
 p7/XdIVMnBPIlqsvk559eJmhooldOjoCl4NV346dKKP0WJRoedRp1FvdlZ1k/qalrStSJeQr34i
 t9q5maP1p7UtjN40q3KaqTQ+NlNaoVlnmsKF1Kkm56AxsYDvGT3M1YPwtZwUhTeLnek0WehSVfw
 nXULlKvHcyubiBNHLJHVBGJtGPMTHi+x620MaYiWdA3NAdabSt6ShCfEBbh+NGIonkaD9xgo6YW
 V6r0mI7zIz6enTUzHFBhWPKGqmF7qE5ZlnucUKA8AtJ0zwE0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa028a3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=tvlXP28v7VYLJ75qtzUA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfXwkfcHuOUbwv4
 XdsHI524bERr88OywYOS3906LAUAuRd3RbOz5qOornGIKH/uH9nQVlmjW3Ccz1BtBkpD5jin4Bh
 GGH6yUfwkKzcbEp4JBX9XvU7n5ecWAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX91Iw1y9lAij6
 LLxuY397ZYC82P+/T3A54mDfqtgMrey2m/iU+q7zQylznYuuTwEqgsrg+d/M+ium+ftP64i0cK0
 +6My1sEAlcL7VYuq+rdyg24QREpY2zn3AaNzXEqGTK8CU1gRXRZKDwh9aOjAj+Q4y1csORsjdsd
 rZuYJ5/+dig/kNqKQeyfuiWSTYj+dw/vKdNlBLsO3s3PHvwTo1lBTOyWm4PQIDKd6YEserEpEs7
 RbRWViraLKMxDm7TQM37zOAPypEHF3aWABgMnr9DKQ0ms5oXimKtJK98jTSRNHEOflGABXXhTkE
 9gF5YC4mUoQAkzIseOLhY8NL8Gx8a+vg01TPHIuZXQV+9Zx/YdRKvOUNGaw8g/9sAJpSQ5MpeK5
 NNe2KkfI0vls2AhtD4G3vrjsKT4B1CMwxsWUn5JSHtgIgwdrQcFknfjBYOpeRMWB1sIphiLAbvr
 5U0P1pRhY266iC/QUCA==
X-Proofpoint-ORIG-GUID: 92-G22x-lJsi_nFKtVACjS8yRCR34Bgc
X-Proofpoint-GUID: 92-G22x-lJsi_nFKtVACjS8yRCR34Bgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

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
 drivers/gpu/drm/msm/msm_fb.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d69591245231..dfe040d5260b 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -102,13 +102,28 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
 			break;
+		}
+	}
+
+	if (ret) {
+		while (i--) {
+			msm_gem_unpin_iova(fb->obj[i], vm);
+			msm_gem_vma_put(fb->obj[i]);
+		}
+
+		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+		msm_fb->prepare_count--;
 	}
 
 out:
 	mutex_unlock(&msm_fb->lock);
 
+	if (ret && needs_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
 	return ret;
 }
 

-- 
2.47.3


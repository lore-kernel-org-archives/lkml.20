Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B03976A0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447517; cv=none; b=NZobGWrFCLrSV5SnhJ8TBHpFW8QUEbicXnrxwAc/FtCRx7XpEc3AX5COUw5GvfmYqYpzQG/3tgZ+qRPOgp6ctEUH/E/UKg/TL4+Nrf8nsmZa2IVbxplH6tz8G1CCWCz6nGNVgcK7tfFzLATIcPXvkw59YeD1UP2eXGHitpEJYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447517; c=relaxed/simple;
	bh=cp749u2Jy9ynFXzCivwV+Qjk7tvfqMJ6MGuAtzcObIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiQCUOAcz2pCRIrIBGHDl5Y4jLBsIiucm4Ofc9jGd90N8tzzln5r2wBC4oL8SzhSujJPwM4CzseArQqc4wjzIg1FFwXuf/kKBkxuMUWTXfLiaoHjuFOVWqqlnwR0fV+rf7JjWYXsM48z4YNJy/ICVeAnXFbD5+OFXLDusWaoqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgGtQ4fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZJIpkwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgGtQ4fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZJIpkwE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxSWi4013857
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KEn46yPk5ku
	xZ+umsZjKseSAIl9VBEmi21YoVSuxwYk=; b=pgGtQ4fwu5yEoXMV39+99q5F5yn
	6E8/T6zVomuf8x5cmiirEvUUu1z5iMAFu22OopK8EiE1rhl6uN/lvLA+fZUKTf9N
	uIbfNhuqBK4W8yF32BBVYhnmDsuLpGSuM6D6mlFdvI4rXFpaAaHYeWcdQ8irdgBA
	J9UKFZVUv7xCdTrlZR0f9F6wIlN89T7VH+dVHh5InPdmY52QQgX8b8yrFOKcJ4jY
	KrtzweC8g4vBNon47eUzq+QSUWo4owj0tlwihDSd69yr8UxFi3y9EZ4DrwgWIaqp
	5zDB4px2yY0jUyufB0/m5yPe8hoquBBzhJ5nsmzPCrPRI2vbIK4jf+TTxTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tehdgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2187756a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447513; x=1791052313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEn46yPk5kuxZ+umsZjKseSAIl9VBEmi21YoVSuxwYk=;
        b=dZJIpkwEX/L4MBBbfj97HXyQ97rWtDKlxrDlkgSzzpYeT7NmKW0KiGInvzB2Idcuyz
         BO77QQ5BMc+6a4HB+TfCrNAUiLXmo00Hi2N2DKsMI5Oe7RyFSwyzHG8Ud+naJZzWNW07
         rhqeH8V0RISKc37S2cRwlg30v7Q6PjoxrTmJJDCgE0KNPX41wCLElF+URtVMRW5G8Vbx
         QFYgEcT54phYHPjzbHvQTNIAmx++Tr0F3547SI/Di4R7qiccbIv1drzvoUF6jfXmkG0m
         He340WIx7VWxgBeghlWGeulKVnTfatIBZU98O38ESyGOS6y4t6877XHlvrGI0zsrTJjq
         2+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447513; x=1791052313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEn46yPk5kuxZ+umsZjKseSAIl9VBEmi21YoVSuxwYk=;
        b=FZZvaOrp1i/Fp4kiImQFrEH/M18lWCjeImfyDTjuOpvmtPvkach/WO4FD2RiVkW0Jt
         b5g6UkQrjv3T1//roVOvsec+F/MkJ/xLpXURLXVKSzBekeliwlxqLmnb3E7rxTsD865A
         G4nk5Xz63bjSGV9/vzTeFx6ZIwgEPUKa47R/oC8h6hvCnwBiNNrnA4UZDr6i8HModAWw
         YhEHbKFkhJnPmaf4D8TGFe/7uojdEZXu2XC5dBLHdu1rkpyNJEGSlYromy8zaDQJojCO
         9IGJ85ThljGpTE8f4y5yF2d01Y/qqZi/x9tLzg9lFvkADhkCkG0bmMa1yAwazpApyLfE
         fuoQ==
X-Forwarded-Encrypted: i=1; AKwUvByw+8V027+ukvGq5odfloTkRCswWmX/qrJ4s3yHt18iQOvYpsmjr/T0ImkMTDkCnQoocRGjmtxvHiRVJlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6NDP7cjuSFytZmV6vSROa+fi7WS4qA2GaiTsy5N1QARutPboR
	x2V5VlVAsBIKLc69dP1qW3CF1CX6USpJgt3Ku94NWc2HNlbmYJL+9J4x/wGliCSVOVlb5EYuybZ
	R6zBYnhigLCmdd5cpbm/ZSJaEcMQp1H8OzmKd7cSpm0fbO+eFVYtbMczcvCdT+mjzvWQ=
X-Gm-Gg: AYBFou3ZrmegojZ6VnDtrl5s5OrCvblTfSbIApB3CWrr6ZldaRfTVmyJ01PuZJw2k5E
	CUqF0UUIdWmZ/cWsBa22pUdzrFM5d3p5JvKW7OY8U8p1/fvdWCwJk1tfJWv5fXx/YD5C/bpksR3
	LVYVmrlljFEr6aTzS/XgaEwPc0G20pji5SmdGRHtT5Mpc31Qnnw5P399qjRaY3rt4/urQa0ePVC
	4/S2DTJDQ4S3FlqcHpB/Bja5rUIKWP8fZSNYdQvOOTK9T8p83aGkzT6tdKwDXCkCluIxNyMw6vP
	xdBftHGWFPsuCvmAOwM5qCdrBVEBhDH4WsBiOAF27ZYB+lR7dojTp+VQLeNnmrfAS7T/idNXo5u
	+tCKktqnQwX11V5jr6IM0DOthycprpZMKRIZUatStiZk46i0=
X-Received: by 2002:a17:90b:5807:b0:3a0:8050:2ec5 with SMTP id 98e67ed59e1d1-3a0985be2fcmr6524333a91.12.1790447512759;
        Sat, 26 Sep 2026 11:31:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:3a0:8050:2ec5 with SMTP id 98e67ed59e1d1-3a0985be2fcmr6524318a91.12.1790447512313;
        Sat, 26 Sep 2026 11:31:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0df614b02sm1960601a91.3.2026.09.26.11.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:50 -0700 (PDT)
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
Subject: [PATCH 3/6] drm/msm/gem: Use get_pages() directly in vmap path
Date: Sat, 26 Sep 2026 11:30:43 -0700
Message-ID: <20260926183051.25754-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
References: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX804sP4QSZfPz
 RMbJQM+VKuM+3dkjPFaN1FD4C8+1BhfHr4EUJpTfZTHtTYQLJu8UUoxWZP/quiyuX/3hw+PZneT
 l4z2wXTTKehnvjALy4R6kLyZtMjuUfIinjzVT4PuSzBngu+akdlIdTxDo1BXkzlk+lTG2MGdPtc
 ZJsXJ6BvY7HE5jOck92bieTtKlsWkrzAbuGvWB0GfxoTx0qBYJgEzIMq2uxVS9Br1hPKyTAllLJ
 3HefEn1zqx596T7CVEDbxLJOtdA0mRGOku9eTWEyjrI9A9p9pBwiGcWb0RJ5IoMzZkx+u4/xpIO
 AlOsVyYOVLZ0sjqUHRfnYkqBDasPEZlDM/dZxuYchOrl2M2vbLrjUKIrBxqhRhD3XM7Mz03dtiS
 BC6uzZ1Et1qHIrXfzjyt7pV5MB7VVUtB6ER3m+/SmqGBtU2BKp+Pje0vNji9t8VeTR4isJP6JkZ
 drfModDTPQjIv5hQ/2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX5N6EPlWaYqMk
 bKaOy3Lxtxt6kNgguZZJQ3Zbs00Z4jTSJuu0fkbfAcqzGbj4UcllyV7ioLlJQ9UC3RGPBIhmYO0
 k3r6JqD6FsJMTpxRv55imqvDpqtXhAQ=
X-Proofpoint-ORIG-GUID: cE0URzrOQgia-ec6z1mUdxNGroP5C46g
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab80f99 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bRy0bLnbznpkn9JxEt0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: cE0URzrOQgia-ec6z1mUdxNGroP5C46g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

Split out a helper to check madv state, and inline what remains of
msm_gem_get_pages_locked() in get_vaddr().  The vmap path is already
disallowed on imported dma-bufs.  And the rest of the callers of
msm_gem_get_pages_locked() don't actually care about the pages, they
just want to know that the obj is resident.

This gets us one step closer to not actually caring about the page
array for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c90336b3b231..bf6a8939af7c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -265,7 +265,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+static int check_madv_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
@@ -274,9 +274,17 @@ struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv
 	if (msm_obj->madv > madv) {
 		DRM_DEV_DEBUG_DRIVER(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 				     msm_obj->madv, madv);
-		return ERR_PTR(-EBUSY);
+		return -EBUSY;
 	}
 
+	return 0;
+}
+
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+{
+	int err = check_madv_locked(obj, madv);
+	if (err)
+		return ERR_PTR(err);
 	return get_pages(obj);
 }
 
@@ -722,7 +730,11 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (drm_gem_is_imported(obj))
 		return ERR_PTR(-ENODEV);
 
-	pages = msm_gem_get_pages_locked(obj, madv);
+	int err = check_madv_locked(obj, madv);
+	if (err)
+		return ERR_PTR(err);
+
+	pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return ERR_CAST(pages);
 
-- 
2.55.0


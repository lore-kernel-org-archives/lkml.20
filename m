Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675A4E80B4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955001; cv=none; b=ol+az9OJyYlIHi1s8piATtsAoEA7ADgfesg5oG6Bo8CSLJzB6zEGbKZ95cohL2hNOBLz3WNxMCs5EXfNgZSiw/KYiII/wx7rdrL1TC69WMHmK4LPqeYTalYJuZH6HUBGXMocvhgMLvM/aWobYEb9Z6VivQrU1ZIuL4rZNy0rbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955001; c=relaxed/simple;
	bh=xevZIKXLSA/jlrAlWPNFb1iHsDDse9cohFxsI/blgVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5nWrlcqRg4eobnRARbZNw0RMfJ9DitmLlMad4YeniWzRQmKTfoMZjCRXi+XJvA4gK2rQrhV3M81/xSFK64XFh9u1So+236ncEJtsMRExEn3tfAFaSLaXAVSf+IdvC75uEcLs9giRaVfcLT2gxR/aqHsfkbPf8JxLuP8C5+RMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSeE7o3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WD90YP/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSeE7o3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WD90YP/6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGoTR896048
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=; b=dSeE7o3j0Ls6N8KD
	/K1QyYiGFAHIGPBFUy2HW7ZOzK9yE+br3UrogTeQIsKt6ov93RxBzz68ppf5nebE
	uHuYdBYSqMH7a1v/6SIZmgSa7HWwhVwx04x7rhdQlNWXzXrEVODipZqjAULYZifJ
	xS+8T3VemGMo4pZaRwRvy5ZCC8BKEe31ALpNJKSrcEQugr0vItzzHXOILZH/78OT
	lvqFMWALuSp7IBuno8PaFR0O24yd/LSVXDJIJm2yWGZ3y/ydPvKQ5FwiweGF1fNK
	DyiUGUUyNA2Z7/jUJscdwK9hJDsEOkuQz7SOU3dyuCgWwPmL2TRA+PG2ZgeqQlDk
	moGFBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v0343h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:29:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7695f6a30so8161826a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954998; x=1791559798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=;
        b=WD90YP/6797gGPb05vbttW0dd0tQodzIxKtNUcjoJIGEmLupldwXizf/kjO31GN9bz
         HJ0Ntqo8VRjrIlhHjrlUigb8rmHGMmRR0QmkgiDWdwO1Ham64b+B0ey3DGF6vh7njaIa
         KovYVxtR+lgcWyZ6BfMQ0AIPTRIY5pffaYpwAuAgpAvt5gq5bbNE5aT0zi+r5EIjrwpk
         PXLwFSFE2o+VOa+EaMnPCaOw8vTKchMkENcPr+G86gfLzJCknOb68LkmgdKFL2iloStz
         +5y4QSFJnTo4kaLKDGMlXCVzYaoNzw8rW4qfxgAAtf339I3Dl5uECRutBF9v5vwLRjs+
         tm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954998; x=1791559798;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=;
        b=sQ9hyxgDB8dW9i3vFiX18WKjCeLx+oLGAZYbaaUU+MnPHYnUbwy9IS0NWtbXX8aRrZ
         qPx4Qcjj5er1lHudi15ax4ZLBzRxU6WeEamSxaF9uLqMWOleFRuW/srjbtbdqptY/t6J
         VarzWGDnru4N9a0j8wp0ws6Zb9ZwmpL8PngefJUHo0ou+SIB6TOWJsXBA7l8BTrtzJ7o
         T3GPsSSite13KB7Rs32Y0MEeH3xm5Wxp6fRBT8SWgdqnMsw1RRqLwbx2M/JAZPpR4FlN
         UwrCbM/e66zMnMcj6EW+YPtH3zUiXUuMrllJtT/YPrIGC9ksbAvcWUASMy5CdwCZ8BBX
         BMpg==
X-Forwarded-Encrypted: i=1; AKwUvBxOktxveCx0dMe8ST7Y8bby+VW2uDzq1RCJH9QEob7u0cJmvETi/dwgFiDb2Wsk5pto6/MJ6xdHc1wCWLw=@vger.kernel.org
X-Gm-Message-State: AFuF++kEJpSiba6GueJclGsjgu8YMcDjNWc3jPpMrn8rfwlWVcQNprjv
	iC7yEzG1OXs5FcS5YqFyVklT6xZholaZC9N8cQEgv6XYdVBDrEbMTfBtDPgpRGc1TVpBcpvHKjm
	wJYXEeLyk4dkntPp4xXl5Fo0EJ9YJEQ7EuDXOhygLZx0FiAV7KNrAHQPVpZc2Mzc+ue0=
X-Gm-Gg: AYBFou0OfKUUSiyoXj8cyp4ZRKYIOH4jh9DWk99FKkj4dRy7Ra0uth2Qa4KbrPX4eFv
	6lgm8pcqJHi33vjRQCd+Eq+hYfnqwiapGOYuF6zcfuJEQdL4fR96BAOiUKBSSZ/Rq8k/szCOlVN
	Euzi6H9Y9ZDnu5SqFlbXytYexi0OB9+yGgImA4iOi7e0lIhRu/l2WnRM4Hpal4PsJ5z7IGvBqpf
	UEKruIM9wTa9QvlSdyNgGHEhsGO7zMk/ImT6zpERV+bA3dX2O9VXj553/tvHXIZv3PSVNsAX2al
	JOsE3Y+mZqE9CGbgXSeKvsMD2EEbwYcztXDcY/MqW3bSRxAGZ9o6/zG3hWY/2b+2yFfz0oAlErZ
	Qj/qPbuXia+zPNBsX6j0foR0t+1xsi6uomR7pNDVM+XDxbs8=
X-Received: by 2002:a05:6a20:5493:b0:3dd:a006:55a2 with SMTP id adf61e73a8af0-3e0bd01fbe0mr3757155637.48.1790954997683;
        Fri, 02 Oct 2026 08:29:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3dd:a006:55a2 with SMTP id adf61e73a8af0-3e0bd01fbe0mr3757115637.48.1790954997237;
        Fri, 02 Oct 2026 08:29:57 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0bfc3da9sm1093702b3a.25.2026.10.02.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
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
Subject: [PATCH v2 3/6] drm/msm/gem: Use get_pages() directly in vmap path
Date: Fri,  2 Oct 2026 08:29:40 -0700
Message-ID: <20261002152948.85308-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX58Kr7e0BdMVQ
 3VdnvWACo1RbM5+ZhaHy136iNSr/9nPYK+vHcwNyZ4CUUSvjxvE37ANt3EHIVWRzwIPrS8TcJSH
 +UODMK3rL69wfduzbPndcwqbj1s/9t4=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfcdf6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=bRy0bLnbznpkn9JxEt0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: OoaTaZ5ARH5ewzRZOggUT_WdM9EO8UiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX+05sZKpriYZ2
 FhqojRBlbtjiIyX0q6oBT8I+s56xG+fpPl1/bKo+CRY/ZWWl6qiCIf2IiZoxpFc3pSREd2yWNI/
 aIhS+B/WK2v1QKZZUGBlYTsaGdtK9kQSnKASDMHXfrvIV7Sqe2s/aNX6fo08mptR6XfEa7gjvYv
 vHLVN0NcVDGs8aWpEo3UEPaIOY0rD89ZKJLKjv4x8F2OL5szK7BFAMNY2H6nXmpd+v4D5vwf1BA
 BGrFvpL7aWNBRur8E2qncEyQVDiek++rpnB8mEEMVppNIRytaikC5Mtdua6FvoTWWzWQmYNziuV
 RIyV2t0DubG6wzvIeuPcf0bBmsluWa52K412frTH/AAwQUVExudVSofGEY0f+Uh6J9p6BjuLYuY
 Fcfeh3FqMRo6GYETZJvVm7v/ClBQtihb/7bOtfnazavzcub29DL8EjMBJicbkyvSFZUj1moxP45
 3FkWofZb5ScMyz3Jr+A==
X-Proofpoint-ORIG-GUID: OoaTaZ5ARH5ewzRZOggUT_WdM9EO8UiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020061

Split out a helper to check madv state, and inline what remains of
msm_gem_get_pages_locked() in get_vaddr().  The vmap path is already
disallowed on imported dma-bufs.  And the rest of the callers of
msm_gem_get_pages_locked() don't actually care about the pages, they
just want to know that the obj is resident.

This gets us one step closer to not actually caring about the page
array for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
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


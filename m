Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164E21CC71
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198271; cv=none; b=ETJdUs0JGNx+8eSVrmB9EjEHGos8X2y4zzZSlRxaib6EraIU5QvLGFPSvT4WJHwifge08MRw2uIRj3CQp3nmAgnWeMmg04Xj1tVt/TOlGGb0vcyVdLqIMMyq/zFAwQ7yuxGIxyv7F/E2XjeWWKqjLuqqLtxCTYo2EvcLtylPvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198271; c=relaxed/simple;
	bh=HhWeHjZ5gz8kg7DHpx58PDuTw0CVTiLv2vHhFu1HlI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVUIpwsJEBMO1cvKZ/a7CSAW5N7J384A/tSUlCRz0KRYvTjfQn9Tk0JCbcJ/LW/BsuO/MbghgjtxWnpp4xlBShlGYN4xttTen7e4ACXrHjhxlIkPiIouREBR6DdHBbtLqYQB8VILrq/tnRlHJLpgaW4gqVRHZ7YIUsOI6MQG9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEb6eX3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpHGQQkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEb6eX3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpHGQQkP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFrQbm3891205
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tb6Old0Ag1lEg3tHScHhxpyXT5GNHcc8VNH
	j8DsUkAU=; b=jEb6eX3jnUvAy8R1MKaDv7FfFKGDl/Z/XmUmsi5jyYKmfoZQAof
	r1Mk2Mq+Ac9XmHMQbRgsBE59qcItpMqi+sari5jwEi/o4JwWBAdMLZcgCo1Z8dnA
	AqMA2lzQd2qQH/ry2sBOwc3vQKiTpHXNDdSprrIlnCu4A1+1An8e9mXVRQpHtz4V
	bjceksArlVmev6trF6dpTvBvJe7KB9LUnML2LQc0NksymODv9vz1ZSPYvaLn66pt
	PqWWFSX67ildBPbqWh/lQlfebXt9CWQBMNPgg/0NRKOiiBfma9Hil9h1lknSydKw
	fsrnspFgY5cgTo3Haufiv4KovjwE8Hy5Gsg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yat7ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4123545a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788198267; x=1788803067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tb6Old0Ag1lEg3tHScHhxpyXT5GNHcc8VNHj8DsUkAU=;
        b=GpHGQQkPTw35yf3Ln0V8TA2RWubDf+fKiMP39aLvVj0ZuI9HYgx0gWKoiuZ/o5KExO
         lHYnVNFe90KhV4uBzj5HjypGFVApx9OLmswEH/hsTQO7Xg3Ty/yRODRB2mr3Ku0W4qMC
         ZvHy13dnT2fHOzRQdo0AZ/DUJaCuEWjzwYXsvKbXJTz+IhsPZA58xEL8zNVV+NBRPUq6
         c7Ao7PO6uLsDaDFCBpMn3OdaihMKfjsL8Ko220WzoxCFiEWmenfKlG+4cXd+zeMqefnO
         r8CpLFfjlNQlhCBDDxE/LtTZQzOBCgteePb+m7s2B7ZpPOxg1gycOx/dTi5Z0Lc4cZIP
         Nf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198267; x=1788803067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tb6Old0Ag1lEg3tHScHhxpyXT5GNHcc8VNHj8DsUkAU=;
        b=ELS3LVTJb1Qp+uW68Gy5tRYU4ii3MsLTn3AodO16kH4b1mfmlznvQ+bP2rpg8fMEB5
         5JaGdRTSr//2Jkfb+Fwp0qwUELkrJUpnZh8cdqltzUVFo6OSgt4VTZOnxWyk4ipqkmnx
         6IScUVuFU5Xxe/cTEuHL+ZFdnqdhQh9qd2iJX/PogIF3l54kudMsdWE3RKh3P7uVVLcO
         LDOk0EOalwXlA4O1mf8Ebfvj3R4zgF85MKFq4m2k65S0pKbkSGlsL+wrx3i+FraR1wcD
         RLH+GMRRXFilJUvVaE5L9I1lHzXd73VspmASbA4jItxERUSHQIacHpob0p8w/AV9NPqh
         db/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkNV+0Nq7jt/vZTFFk20hxwp1tjwYCETel5EVxaSTApBGrrulN7I0mACAJzuIIhDDYlvf9cAE5y3o4WGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mGEmwJJ7P2fWGQ2hR/lDAivkduFWx5xbY11IgOhvLprjOsm1/3
	6AIEAbi+W7MEx7ia+BtyFYUd04tPVIw7V+9RdbhLoPUX4z33lIhc6p5lILwq0LMpZZnRERmGK1H
	aJfm0Y2MObNd4r0FepCr36X/SAwyoUAUFOTbFq9kcIwrR3fei9ddicXuO9Jf9lgh8Cqw=
X-Gm-Gg: AYBFou2rN/g0ESNlGl29aTONi0vnSRVKvjmNBXig6T45z+kEB/yZ1qWo7s1OwQhVJL5
	atSNeYtFQ36NV7vA5aK3/ldcwdZzErRwbC7VDyTxGy/mTqBYRd7HsvtEAo4YXyeGUEulxinqtR9
	BDKvXS0Cz6nkKAUCU6rJo2iredXeK9R0iy6OESX1KTLP+Wm00M9xUB1DDzkZ3gJniJFThqy5SIi
	Q3M4vOLS64UuD4YX2yuwGS3TIoGoUSqAhI9t0qBfggkN/WmYIELoAINfzsVA2dFhVbhfiqjCtl0
	8xZN1t2HFewQOkQegT3wDY1uZl5WkngYjzD1fOtDVnWyqVYwWY36ZBewNIq5Nt8GF1K46UZ4uI6
	3QGJZ/b+CdkSd75eh1eTG0JGHn09A517+E7H96L4O6mPT3oE=
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr45970769a91.2.1788198267248;
        Mon, 31 Aug 2026 10:44:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr45970686a91.2.1788198266770;
        Mon, 31 Aug 2026 10:44:26 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm630545a91.7.2026.08.31.10.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:44:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware)
Subject: [PATCH] drm/gem: Drop ticket arg to lru_scan()
Date: Mon, 31 Aug 2026 10:44:08 -0700
Message-ID: <20260831174409.465181-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MyBTYWx0ZWRfXzf2xAEWMHqH2
 roNh+0835sXm7SdkluI0HrlZBl86fLALAQ6wvzB/CO1wUaPJE8FIp5hs1PXMV1UZ52P7TSWknsg
 PWf8JpzJVqGhTAljgFGdzztNYAdBy0I=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95bd7c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tUov0DBtqpY1NIlP9OAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MyBTYWx0ZWRfX5oo9Caip7ApF
 NySSLW58Cfrl0zuljhS66owKLT9ftVf9Z4s8EBHRW72/p3CyyAfq/MAMGjcTCl0cDEjEz6vsTtm
 WmgudWgJmiQE3WK/fCP1CXe6QW6mQEVZJiaORsJQKcXr5v83rrl+SrLBWM6R5AjiosRDyoNUBDQ
 pJZ2ircKx3Gpg8ccL0V/wiWeYZFVnjyhVS3JvTlBZ42rKFjrP5hJ3tPM4D8Vpse3o6XXPt89NZa
 Fjw98sn14NCSWqe37FvsRnNciM2GXSbRuwZ0H7CJ8PULzHYArBNWt6S0f4iEf0hx+K8vHA1XD2q
 +bjUCVRv1817g5LWchtwj/31+YzQxF55hdLkGoJAylPnmuZKke2n59VQ+I+qAdTXg3RJKQSbu/E
 DpsQhw+56iZhC0gEkwojIwVi/6yKwsAqb/eIcflUr79Kswlq/IlFKtl0NEfTi7I4DSV5yDWDYEX
 7l/aTBKzJQxUXi8/3PQ==
X-Proofpoint-ORIG-GUID: pS0sFiWCFlu_2V7VF2Tp--KzTdgkpYme
X-Proofpoint-GUID: pS0sFiWCFlu_2V7VF2Tp--KzTdgkpYme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310153

Commit 3392291fc509 ("drm/msm: Fix shrinker deadlock") dropped the only
use of the ticket arg, but at the time left drm_gem_lru_scan() unchanged
to avoid conflicts with in-flight pathor shrinker support.  This commit
is the followup to remove the unused arg.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gem.c              | 13 +++----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 22 ++++++++++------------
 drivers/gpu/drm/panthor/panthor_gem.c  | 14 ++++++--------
 drivers/gpu/drm/panthor/panthor_mmu.c  |  5 ++---
 drivers/gpu/drm/panthor/panthor_mmu.h  |  3 +--
 include/drm/drm_gem.h                  |  3 +--
 6 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e3ed684ddcf2..15acb958ecd5 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1656,8 +1656,7 @@ drm_gem_lru_scan(struct drm_device *dev,
 		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
-		 struct ww_acquire_ctx *ticket)
+		 bool (*shrink)(struct drm_gem_object *obj))
 {
 	struct drm_gem_lru still_in_lru;
 	struct drm_gem_object *obj;
@@ -1690,20 +1689,17 @@ drm_gem_lru_scan(struct drm_device *dev,
 		 */
 		mutex_unlock(&dev->gem_lru_mutex);
 
-		if (ticket)
-			ww_acquire_init(ticket, &reservation_ww_class);
-
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
+		if (!ww_mutex_trylock(&obj->resv->lock, NULL)) {
 			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
 		}
 
-		if (shrink(obj, ticket)) {
+		if (shrink(obj)) {
 			freed += obj->size >> PAGE_SHIFT;
 
 			/*
@@ -1727,9 +1723,6 @@ drm_gem_lru_scan(struct drm_device *dev,
 
 		dma_resv_unlock(obj->resv);
 
-		if (ticket)
-			ww_acquire_fini(ticket);
-
 tail:
 		drm_gem_object_put(obj);
 		mutex_lock(&dev->gem_lru_mutex);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d2788f79ace..3514d5c84989 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -102,7 +102,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj),
 }
 
 static bool
-purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
+purge(struct drm_gem_object *obj)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -114,7 +114,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
 }
 
 static bool
-evict(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
+evict(struct drm_gem_object *obj)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;
@@ -133,21 +133,21 @@ wait_for_idle(struct drm_gem_object *obj)
 }
 
 static bool
-active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+active_purge(struct drm_gem_object *obj)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return purge(obj, ticket);
+	return purge(obj);
 }
 
 static bool
-active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+active_evict(struct drm_gem_object *obj)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return evict(obj, ticket);
+	return evict(obj);
 }
 
 static unsigned long
@@ -156,7 +156,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
-		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
+		bool (*shrink)(struct drm_gem_object *obj);
 		bool cond;
 		unsigned long freed;
 		unsigned long remaining;
@@ -180,8 +180,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		stages[i].freed =
 			drm_gem_lru_scan(priv->dev, stages[i].lru, nr,
 					 &stages[i].remaining,
-					 stages[i].shrink,
-					 NULL);
+					 stages[i].shrink);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
@@ -222,7 +221,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+vmap_shrink(struct drm_gem_object *obj)
 {
 	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
@@ -250,8 +249,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		unmapped += drm_gem_lru_scan(priv->dev, lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
-					     vmap_shrink,
-					     NULL);
+					     vmap_shrink);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 54535bae2b0c..17408f832af3 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1392,8 +1392,7 @@ panthor_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	return count ? count : SHRINK_EMPTY;
 }
 
-static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
-					       struct ww_acquire_ctx *ticket)
+static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj)
 {
 	/*
 	 * Track last locked entry for unwinding locks in error and
@@ -1479,8 +1478,7 @@ static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
 	return ret == 0;
 }
 
-static bool panthor_gem_try_evict(struct drm_gem_object *obj,
-				  struct ww_acquire_ctx *ticket)
+static bool panthor_gem_try_evict(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 
@@ -1488,7 +1486,7 @@ static bool panthor_gem_try_evict(struct drm_gem_object *obj,
 	if (dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false, 10) <= 0)
 		return false;
 
-	return panthor_gem_try_evict_no_resv_wait(&bo->base, ticket);
+	return panthor_gem_try_evict_no_resv_wait(&bo->base);
 }
 
 static unsigned long
@@ -1503,13 +1501,13 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.unused,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict_no_resv_wait, NULL);
+				  panthor_gem_try_evict_no_resv_wait);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.mmapped,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict_no_resv_wait, NULL);
+				  panthor_gem_try_evict_no_resv_wait);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
@@ -1523,7 +1521,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_mapped_shared,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict, NULL);
+				  panthor_gem_try_evict);
 
 out:
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index e10dbd18d8cf..ab070bc74857 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3133,8 +3133,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
-			     bool (*shrink)(struct drm_gem_object *,
-					    struct ww_acquire_ctx *))
+			     bool (*shrink)(struct drm_gem_object *))
 {
 	unsigned long freed = 0;
 	LIST_HEAD(remaining_vms);
@@ -3160,7 +3159,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 
 		freed += drm_gem_lru_scan(&ptdev->base, &vm->reclaim.lru,
 					  nr_to_scan - freed,
-					  remaining, shrink, NULL);
+					  remaining, shrink);
 
 		mutex_lock(&ptdev->base.gem_lru_mutex);
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 3522fbbce369..abc36e7204be 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -52,8 +52,7 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
-			     bool (*shrink)(struct drm_gem_object *,
-					    struct ww_acquire_ctx *));
+			     bool (*shrink)(struct drm_gem_object *));
 int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
 					struct panthor_vm *vm,
 					u32 slot_count);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 8a704f6a65c1..ffa607c91aa2 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -616,8 +616,7 @@ drm_gem_lru_scan(struct drm_device *dev,
 		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
-		 struct ww_acquire_ctx *ticket);
+		 bool (*shrink)(struct drm_gem_object *obj));
 
 int drm_gem_evict_locked(struct drm_gem_object *obj);
 
-- 
2.55.0


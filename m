Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364683;
	b=yoUbbVvvpKqtLR+sMf1Gp33cVE7y6vY+tIIaa+feUZqvA9DoGs46r5k4f+GAzyKu9xRW
	 2mtaAr92nSQsrhrNXD9u4p0EbyAMuaoo0U4A9MLqjsxVE9fLCGv87q1JJkD94gpv1wMZW
	 r+hJsHdON8z/6dv7ajXCx10LfqmVL+zgaKw1JyV3M51r62boKINSHNovpfvYtpS6ygo9X
	 8FHrvDwLO7tRPLGvr7Z8jxjlAskvWqt9lviveX98ja9ymIf5wkKcH1WrE3FZZT8OBGkb3
	 4exoPZ2tEONVeq97ZeabaHEeZnJTptpYMhz928LfrfHlVb4maAkQybxyNVpX+EIiiOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364683;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=J603gBsWk1WUnInDsrOoZH+4fJtrDlBZvxmc4O7pP0Q=;
	b=3hp+63W0btU2l5vTWKRkNEKNVH20ox74xBntE80lhiBtpEhIlOvDkx8h+KDwH9m65ani
	 +91im55jN8dWqKoyfbRcWFD//ajV/ysZwu4HVzF/YeVJePjR5bA9ZOGDC9ULJBTvZHJ7F
	 rBOnjBb+/4YuA0dLcABNYMyJpYk7i475bdwVU1523gxcAJLkebNHMiJqViFf919LpYKca
	 A5wC6sw+9x6UGVJYSlCLLUURAW8n9kpq8mnANHdS9iRt6btOae3jqBBBrPa796HO6Ioiy
	 xVzSKgfayP3dLrS8e0qcKJapQt5/1Uu9h09hPwdHjjBeKaSvObXmT9l5uvJbHAdzlRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=n5CqqJz3;
	arc=none smtp.remote-ip=95.215.58.214
Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AB6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=n5CqqJz3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mmKeCbjE3ZYA5V9Lf0Tb2oYgIWNEyo0oHto3fq9oodU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793364680; v=1; x=1793969480;
 b=n5CqqJz37p9rFuvdI9UpyK0CjidgSh4Fo+rqWnyHglipDdHVQnFSWXiHWoOOeOLmTuxRSOb5
 GkZCrAQn0tn65Fm3CFdWjYissAXFozTgwPAnX67mN8Ck1W5BqAoXUTMBjDHTauw9Bvf4QQI1Rz5
 lr8ozEOTa7S2DCpfHxmqyqUEC898YMqu2KzlsetRT8i647Ox7PEOoAY1OWTSYe1GK3wb96WlU1U
 ysVWEBvJFBP5DWcUDeuDCpxM7U/byS7qU+nQklvFB51qfbRPu26DlfcfXwFgqfSZ5+eUpovWwzx
 Yn67Wgq+tCSN/S1S4waXm8eCISH1OOmdVZ+a2pdHuQRbg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a8150d0f62198a2;
	Fri, 30 Oct 2026 12:51:20 +0000
X-Mizu-Trace-ID: 1a8150d0f62198a2
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 20:51:16 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Tomasz =?iso-8859-1?Q?Pakula?= <tomasz.pakula.oficjalny@gmail.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/exec: Fix the drm_exec_retry parameter documentation
Message-ID: <554e4d14309801a497408a33dc696519597ed941.1793364084.git.wy@wyuan.org>
References: <4b9b0f01c86a84b4666a1ba38a085c7b84e9a585.1793364084.git.wy@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9b0f01c86a84b4666a1ba38a085c7b84e9a585.1793364084.git.wy@wyuan.org>

When running 'make htmldocs', Sphinx complains:

WARNING: ./include/drm/drm_exec.h:162 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:162 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')
WARNING: ./include/drm/drm_exec.h:162 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:162 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')

If duplicate, please ignore.

Thanks.

-- >8 --
From: Weijie Yuan <wy@wyuan.org>

drm_exec_retry() takes _exec, but its kernel-doc describes exec.
This produces missing and excess parameter description warnings.

Use the macro parameter's actual name in the comment.

Fixes: bba175a2d4be ("drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer")
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 include/drm/drm_exec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index c92d69a2c793..5a2a8438f094 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -153,7 +153,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 
 /**
  * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
- * @exec: drm_exec object
+ * @_exec: drm_exec object
  *
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
-- 
2.56.0.438.g30c3f27cb8


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426660;
	b=SjKI8X2Z9YPISRur2UG6CcL4a6bvY+8A5ykQT1Pl4+oQnX6poWvwC04/Mt6vaYV6oWvA
	 5eBML/okRkrvnaADmSvelhGF+VMRBocokWHiDDzhaHGnwpgmvpnCZWJ+eIN4rzYliV1eH
	 FaxPuL6/UbnHKSOmGiGZh3BypBjBT9WVlwh7DDvl7CshXi3FptJpfq9gXEGK+/7p3ZFUo
	 W9utqNLRfUIMOrBfKpS2C8C3Mc6kPWUKAFaSyWbSamWqTN6wa+WHvxjv9PXplt018XzaL
	 63/5WUmZQHLhvIs7HQ0YjkMOXZGqHeSHm94pbkVJzUk8NNJeNw2Z5t7d0bnwrNVFkfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DodzdsbvDAWeDZMO/tmg1Z+RgzxRjG1yETm3wmiwdhs=;
	b=zDNELophT/3pFO6sigcjDzK/NjHN+4CIjQUNqan7wxaFrgsdOhu8iikBC8Ue1+C5YGvs
	 JWdJb5n4acPUMEykwqJcDjsYgoVQhjjcaiks/iCcoHjZ6JWoa1snBWzIh4vvdUxyezyXY
	 yBipSGRTQDjy6rT27HX69Nr3wpO2qicZqUmCP+1BdozSqPQ3qOZ0luBLMkmiDPLf7dq8P
	 jjbAII0R5CqwvajdofPmR2ayh4UBMbFbmsOxyKRNXP9j+PyQmBkZRQy/4hu7PQlUshNjd
	 OtPGGpRKW1jPWrq7XOj2JDAe5Kp3ea1SJyq0/8Pf274RAChE/tvb5cPIFCOMxK8VHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="bT5/bbgG";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bT5/bbgG
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35943f55c06so3439592eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426659; x=1793031459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DodzdsbvDAWeDZMO/tmg1Z+RgzxRjG1yETm3wmiwdhs=;
        b=bT5/bbgGjuKBgrdzhd12clNr08pqNNMhLJfQTyOjz4iWA21DqERZdjiZBiCnWEVw5i
         u8zsxYk+Lk+YnMxAosCq9jbbbpTmVdeBFMIUrTRup+09K3nydNcBjenULVZkbTegu0eb
         0rPPZpL+Dcf38dWstQXMi7iAIteyWTSQTWQxMzEsKjStV2iwJePyqQ2aAmjagkKbK1EE
         kuEJPoZzXcOngpAo/4L9PBn6QlkC9Oe20HM5dwIow7CWUvT/gZAv1som+5At9thWeUcF
         kgKtBah0ZyKTLCYYuhaETxngVS2cLGNu/iIo2qcyCH21eMZudConGSSxub6cuicVmv8S
         r25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426659; x=1793031459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DodzdsbvDAWeDZMO/tmg1Z+RgzxRjG1yETm3wmiwdhs=;
        b=qgnGGCUe3R6+7VCA2FXLzbtbEIK8gLO1ljIddKhRNQBF1Ta5Et1HTQK1UEfYGoJbxl
         kvNJgtw+4Fq1gcxJPA/dNk6WhNoKEXBnxXALxq4PQtYd6w5mHkHmGimLyL4yXsX7cr3c
         fzUMd6WewLXwEqwBa3h6hgeA8D7Vmft3RribBZ0sBVVY4/mTQTo5PghHbDaLMgxmDJ24
         qcG+pt4OxppVrQQOdfgK+XvRxIKbSDrwIOUdICtccDTkp/TaxaIxsD8LNTnDm+vzy8xO
         E7wp/iLNrOIAx8DfR2mLoccALVLRprFC/M60tO7D35CLuNWP4FdavCWEaSJ4Pfmcd36q
         IfQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxono1TobN7ELc4Xk6VofRUPgMTPKaj59QmsKhRMqKSwf/5mPTdJsLIa44b7r0fHU3eClvDSufrEyg8iPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiQ6akftkO8CpkROm/CrFtBbfFQd+f0szJrPzuvLkR7Uplv2Wo
	Otp9Qi0hNd/Si4uZ4RahvgTKSJqZW8jsgaSPj7s8GEji/hIdhWh+jr2N
X-Gm-Gg: AYBFou306YOn1iWaXYAIchhI18I8eD9RKchkS14eJJmTruKcBnbSAfcaelsRDTSY0Tj
	soTRrrd3fytfvYMqDPlKwkqVmJ2OxoT4VZamD9LrC9WzxvZftnp/4OFvZUruqpAyuEJgZpNGMBy
	PtO/cinf1B0CFGaqrj42q3c5tKnGojWx1hEIitztCJzGdR0q0yiK+gPbLsZ/4t+AgxXd7e/da9Q
	a/QSW+Z8rqe5tPw1iZZ3yR+GIOGJevG4Nn1y1gu1NyNm/AZJoqnT9YStjHy9S9fLtwbUc0lafBF
	x8wGkfkaVeYkBsflS24yvlZTwM1/MfDu0V80HZRp1cv/JLb6PnBzTv5WnYdT7596YR25lZsZOc5
	+QDV7V1vVSqbo08xxgoXN4IoyV2yZxUXu2M2i6+DwsXvORXBYnX4sDiP3awWtleAjy7L/xl11ce
	mLFOWZAVM/x/6dgasmzGbEKbUkmDGCrGZZQrSWylrJRJ5kXd3ssmPDJReFM77InekNlHNB28MXj
	zYDtjIkKdg=
X-Received: by 2002:a05:7301:6f0b:b0:353:7f47:8168 with SMTP id 5a478bee46e88-3602e69d2a3mr13680943eec.17.1792426657937;
        Mon, 19 Oct 2026 09:17:37 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm35064341eec.8.2026.10.19.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:37 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Don't BUG when a CRTC fence signals during a name lookup
Date: Mon, 19 Oct 2026 16:17:31 +0000
Message-ID: <20261019161731.2341-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_fence_signal_timestamp_locked() clears fence->ops on signalling when
the ops have neither a release nor a wait callback, which is the case
for drm_crtc_fence_ops.

dma_fence_driver_name() and dma_fence_timeline_name() load fence->ops,
check the signalled bit and then call into the ops. If the fence
signals between that check and the call, fence_to_crtc() rereads
fence->ops, finds NULL and hits the BUG_ON(). This takes down any
caller of SYNC_IOC_FILE_INFO on a CRTC out-fence, such as Android's
surfaceflinger, which hit it on a Snapdragon 8+ Gen 1 phone (msm).

The CRTC behind the fence outlives it, so reading the name after the
ops were cleared is fine. Only warn when the fence carries foreign ops.

Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/gpu/drm/drm_crtc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 63ead8ba6756..1dbd0e9db536 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -158,7 +158,13 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
 
 static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
 {
-	BUG_ON(rcu_access_pointer(fence->ops) != &drm_crtc_fence_ops);
+	const struct dma_fence_ops *ops = rcu_access_pointer(fence->ops);
+
+	/*
+	 * Signalling clears ops, and can race with a name lookup that already
+	 * picked our callbacks, so only a foreign ops pointer is a bug.
+	 */
+	WARN_ON_ONCE(ops && ops != &drm_crtc_fence_ops);
 	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
 }
 

base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
-- 
2.43.0


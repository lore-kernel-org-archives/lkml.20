Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9B4A5C29
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004174; cv=none; b=Zo6QZbt0+Dr98OYeDnukGCK8M80NqhJAGLnEf7EeJTdqsSn17DNocN92fGjhLcA5uAcLDh3CB6vhVM92hGa+0+/3/O3C1IdgtUmXUcG1S1wGeFLXzS/qB9OiNwbWBedkYZ9bQ6fJcW6tyX5jaDa4rFtKMbp3EkfegaStijRrdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004174; c=relaxed/simple;
	bh=h+ZKIHAKHBXOHNFQ4rdKxT20jM6QS9cKS3j38JGgcKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbBXnfnT8uz8Mg6YB9cAWzcbTCSxF5W7KoTGjzHrXLN6lPYEF1tm0MaU8WqcYapj204Ev2I9Dd6+pRHJth2fAFNTN2V2ajuozzUNThXuxgliRAIVPy9OSGp4ckPPkkLZoiFCayxWSi6FgiGkoNPEcEnFXvEPYQ2nf7KS+61GGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHoxc9CT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHoxc9CT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so17611985e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004170; x=1790608970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivh65GK1bhKN65DM2APn3F7RhHRIzPyKv2hl9XfM3vk=;
        b=fHoxc9CTzXZCV041biT3g9R5+P2r5Wt0I85dIKS8B0Bs+uqiYv9MGyOG1G8qHW+shc
         zcRqaE27vHxcW9UgwG9JVln33v/dCx46DU/dB4WPwf6/E+w7flxmi6mJGyyNVLkkaA4m
         /OxyBTl4EVF0pvFrQz+2nUEika8swDZ+myw3N5cwBqrYLzumxbC8vl5n/p3UVNDN5wx9
         umgxzomVchXP4Ts7BTC9B/pm7BQk6bmBjNirL0IwKR3kElQMwrcdftmb2mCXGaKmz4bL
         eswVrquQcB+yyUXU+meo639dNTlz/Xi7mUeNXJHnN7StsR1WimQn6qq/+3kPjjpvx5si
         vdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004170; x=1790608970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivh65GK1bhKN65DM2APn3F7RhHRIzPyKv2hl9XfM3vk=;
        b=rMOmSzZ96jjxLWnB9ONCWngxiinPgwHXKb/WBCLVPck3tc4Ul9aYz1wh3TQmPNyYpM
         74PpTMIZYT1uG5TIUAq/U+Yj5ykpy00bthwidptWEfb2G8l//kKp3iLY8fwGoeK8bANl
         3BLc16llfgINj7aiIlALyPpaVd+lJs27Bc8C155+U4P79dXFUnrcQs03Frm1LKhPQiLR
         WUC3ZoQ3U5ISO/1wgegTa5KDVCHBPOCmWvqA5zvcpJb2CRl60j1kRSViJ3wNf/3IVJPL
         w0Mth6lpy8l7wPYHprwO+T7loQHNCMfxZiBHAoiAcuBxQmnBVbc0/emafJ1QsQFKYg60
         vUmw==
X-Forwarded-Encrypted: i=1; AKwUvBysbrmCvqJjrnVM93GNsoGrSc07udRlFYbqjkhp+DnPKMv00B9jgrVmOgzLmZm8N9JmI0yZTzjbDDppb2w=@vger.kernel.org
X-Gm-Message-State: AFuF++kijgR4gGm64HrsaxLpKxy1MvXyhzm5CCA/tOQxxcj5jMbke/2v
	BTEID/nq5J10A8DDN9HbGlzALUdM5IHPktuTTz7JmGoX25rZBRdoIBrmhPmxzFTNsKo=
X-Gm-Gg: AYBFou1aVgWcfzngg6Ol1r9l5l4hQkOuWG3nIN7ddFh2+HtrS0hVbzNKMfXYPA7MXjQ
	h3DOp+T3ypH+N9E0H1o7xHaEUGN0nFj4EN8v7+uaZ14Q+qJaEpUDkVXvCM93VC5I+fr7VS8YyBh
	1yC/ixj2kXCrSjgb/j3PrjEpOtlRPHN/CXg4menI1FNH4B7LqUz0hL3iyr3nv/5l9tF+03zxlui
	HwVzk8P9ce8nTapXKhp44oIxwSdh32jF/PRISLwOeTU6n/tMhZhfKMw1iGGbg1bgh47aHjJ9Sse
	zixoN/AQCmZ/na93/VFo3wcx00E6rvrolxdanEvFm1ie9IjZYxPY5Z02Uq/+wR7yg4IZrWNKKna
	pbjKB5AcA00MnIus+bOeWA0xPT5T4OX6Q+AaLq4T1Xr6fgDWX8XFnTW0KKBq4liF950a392fIMW
	z3S9s+nS3El2ibExb6kTXG/Ov/zyBkZr09G61R2GSvGw1dh10k4H4kVvWng/sL6SI6O6y0knVy1
	4LSHkzwoBTj/2Q=
X-Received: by 2002:a05:600c:c490:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fc573e8b8mr191625845e9.16.1790004170391;
        Mon, 21 Sep 2026 08:22:50 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:49 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 1/8] sched/eevdf: Ensure that vprot will never go above a min slice
Date: Mon, 21 Sep 2026 17:22:31 +0200
Message-ID: <20260921152238.3804392-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ineligible_vruntime() can be after the duration of a min slice but we
want to make sure that current will not run more than a min slice.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a42360ca94c3..1c171cb7e4af 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1127,10 +1127,9 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
 
 	/* If there are shorter slices than se's one */
 	if (slice != se->slice) {
+		vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
 		if (sched_feat(PREEMPT_SHORT))
 			vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
-		else
-			vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
 	}
 
 	se->vprot = vprot;
-- 
2.53.0


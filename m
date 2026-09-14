Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230A377AAC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361830; cv=none; b=jQCnxhMu/S+KCCCTObQsui7z8xQ9sB1p4Yj2RgrjkQud7861TdesNoxEO8xddu09SAp8q5bCHKgldkGx9CdbhfY0SiFV2+m6hWzSd8ImDszB8PJeltkZ8S15Rgbm20dhKgCy/0WjX+B9pRPDJJ0QY8qXdPd+n3l4FVLg9vcXMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361830; c=relaxed/simple;
	bh=pnxXJLcP54Gk5oTddjPOydhAqSO4QjtbmG72/Ff1UHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1YoTytJ/FOXKxbho2hB63DEzVVkFexXXv7znDa/+LPe48mqD+z6q67xSk+Q5E5qTBaonrJoPu8swsfuwDWZvwBk//e5xb6i2DETvx4GpqUvMO54/HRaya1+XEuTmH2Wd1ep8NoG17xm4D8Cy8YvcFDR/GWYTBospJhlFpAk/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QizHqLXT; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QizHqLXT"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb5so1292027a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789361829; x=1789966629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTOIvrzOT5wsDFmFOxury6RlxqMzV8uVFfNJe4lJIAA=;
        b=QizHqLXTOBCqzfqpUJXLLeMFdDeGTpXPwsjQNC//ExfTurg1CsG282uiBfZYJ4Spqf
         ApBl4YzEP6s4ynaFeDUQlPRl76YEjN/YbE45Nf6W1vQY5yFVr2P7aK8YxCHA+Macf3Ug
         7InypJOvKQmz27W2q3Q0saJtxPVrh5xEwugSIaSMED5gNXmXufDFCPiUDyKaiUbzr/B2
         DdKNkgy3GOPpVn+k8U0neIATjMWbnoATigU4pithoyJBFP/C3mmnIVxiZ7mdRnWrz7T4
         pQjz4G/EQydeIKhUiuQ2qdEwPBucrOrhmDznSeYvzGOuUjRN8CMismWYT1C0nOd62OrN
         YLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361829; x=1789966629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTOIvrzOT5wsDFmFOxury6RlxqMzV8uVFfNJe4lJIAA=;
        b=BY8CPPpIlHX4bGIlRDdkTE8XJgr/IVJozHN/hscFSGDFF1TpqQxped+bnGmG/DHba9
         kozO23PPbNQxgbA/4DUX5u79cHYCQiEsRBMrrLwWGbEsPtNVcxLrzPuxSt2dYRRf1uSx
         jAI5MmoIupxnsfzFKfqCcE+YhJCqtWBKTLWPTQtgrtSDtlwy7A7ZeBctmC/J0+iEtu2l
         2Pmll5zw8b+UR3kHDDg5L/OD7g3H0KgU7QeEyMMPbpoHfTLh5mnM+2L7/UmXNFKoG8JF
         niET8+I9XzUkH0N+l5qhZx/DQi6XpiL8FAMTdBlM9qkR87nkXX9k0TxeRhQxw2vdKNO/
         H9bg==
X-Forwarded-Encrypted: i=1; AKwUvBzC08Jm790EKmuXK1RVHq7TrkP95a3erMjE3Bkcbfg5giua7gGHpPw4klUEL9Cb8EXCPzpZrncRa9TnFoA=@vger.kernel.org
X-Gm-Message-State: AFuF++ltdfvBSFCzXxyyYx3xtVFLd48a1AsZAItKv2dKO7ClLOZW2/kp
	m6/QeCaTP4l30Ffwwpz05nd2RVujvT1Ga6BA2teBY//hb6u6PC5Ndpk=
X-Gm-Gg: AYBFou0NsDR4XpmxHHpbQ5dTnRdSkYE3rGzso5GJob4MAk5X5wGQ0Ltz+X7lbz1G+Sd
	Vpr4U+BZp4NbUpOtvYjW0+KWW6eIW8yf+xqXR/mIhGrl6fVGozZcMLCS4KZaVwE/xv+7RO35871
	Y2/37HaiqgWz6PzalBkKVeN9DmbIJNSWZ1XRujnKzv5B5FVSWoAOuiTWtSMSAvQPpCoJ6jM8V2U
	e/MPH1yEIbJsM7dZjGv7wvAf5UtKgDyLoSl61LukJOcOP0TBA4AHVVLFC0j2REwdBzMntW8FQa5
	+1ijVY47kG67H9Xq+lgz7TV17sUmfrXX5MM4OWDBv0J0LkK7M52t1uBBqLTtNcgUbNIX+3Gn64e
	NEW5CT90+ZqJvylb23j3aBHJ6D3QAND9mWca/UGMQzGOZilpElO9hoBxKhYWQiE7yXCc7bWosNz
	+W3ZGGSQ0QuvgBeUgqNYblXfi3BTtTYnqOFKb1A8Gy55o3ka7zoqPc8SHV1NLjL+sR2Zcw4U+Ok
	E+mDJbKl4TT
X-Received: by 2002:a17:90b:1f86:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dec0f9ff3mr2422921a91.24.1789361828915;
        Sun, 13 Sep 2026 21:57:08 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm18824792a91.8.2026.09.13.21.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:57:08 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sidong.yang@furiosa.ai,
	royalnet026@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	triet.hoang.dev@gmail.com
Subject: [PATCH v6 1/2] accel/rocket: Check allocations before use
Date: Mon, 14 Sep 2026 11:56:04 +0700
Message-ID: <20260914045605.381933-2-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
References: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the result of kmalloc_objs() in rocket_job_open() 
before using the allocated buffers.

Also replace the WARN_ON(ret) check in rocket_job_open() with a plain if
since ret can be -ENOMEM from drm_sched_entity_stats_new(). 
That is an allocation failure, not a driver bug, so a plain if 
seems better than a stack trace.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
---
Changes in v2:
- Free scheds when drm_sched_entity_init() fails.
- Initialize ret to 0.

Changes in v3:
- Move patch version descriptions below the '---' marker.

Changes in v4:
- Remove unnecessary initialization of ret to 0.
- Adjust commit message word wrapping.
- Add Fixes tag.

Changes in v5:
- Add check overflow before kvmalloc_array() in rocket_job_push().

Changes in v6:
- Rebase on top of drm-misc-next, remove the rocket_job_push() hunk.
- Change WARN_ON(ret) to plain if check in rocket_job_open().
- Add Tested-by tags.
---
 drivers/accel/rocket/rocket_job.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index f40435505818..704a15513179 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -516,6 +516,9 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 	unsigned int core;
 	int ret;
 
+	if (!scheds)
+		return -ENOMEM;
+
 	for (core = 0; core < rdev->num_cores; core++)
 		scheds[core] = &rdev->cores[core].sched;
 
@@ -523,10 +526,10 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 				    DRM_SCHED_PRIORITY_NORMAL,
 				    scheds,
 				    rdev->num_cores, NULL);
-	if (WARN_ON(ret))
-		return ret;
+	if (ret)
+		kfree(scheds);
 
-	return 0;
+	return ret;
 }
 
 void rocket_job_close(struct rocket_file_priv *rocket_priv)
-- 
2.53.0


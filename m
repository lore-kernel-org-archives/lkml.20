Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB2441619
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454184; cv=none; b=KoVxHdSuBS4/J/6JyNuy4K4WKll733KaMomSRjjxpcqDQwQmh1avI4ZwfqDTIi3Ez1/H5wBQNs+EZlGfBTp8w8Ik8OaMfh1uqDe0o5lLJR5E2J+tJB6f8WPXMVPFbKfCU+Ve2PNqru+x6SaPZuD9yqfg8Ei3EwINWSM8fz843i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454184; c=relaxed/simple;
	bh=L1WdMwl8r798AIHKgDuSol6Int7fl9w+oTVtJlotTiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oh5topZlRrlLXpDMHP4tgjr3HAwHGcJ+dz7T+ZUg9vSKJbUtq3CPKiBnpXxyGkRa07GmMWN76KcYiej8QxFYlwGCERTY8RbX5+UZUZcKJQaSdt69GWO6AaXn26W4yU9+zEN93WDZi77abmDfxhyD/tEpYgzHnCY9cDrUNqFRKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doJaCPMm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doJaCPMm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2512174f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791454181; x=1792058981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEuJYz+pVbgCSCGaEVPneImA96kKSzfy+n11GiKnq8c=;
        b=doJaCPMmRZwHCVstBNfL7lSK1xCjnDgaNEveZotjPnQrA4kcQoXcrUs18njThKz9L0
         MxGFadUW6q5P6gCwrqzKL68JKEW4+X+uajvpfzVEv4BMYG50CFrKgOfA2IKCkNg/ItOB
         ULU6WgQnmET53ntDJZUR5lO5kt3PyDE8vMe5HnpnjleUpgBKWf77jnzCCDbTiWisL2Hp
         IY3Bw1ya1a5GkUZuDgHcGpR7LW/Uil1kfmRICLTeVI/6H7L78B1knatSJ3/I6qtGNfAw
         cSjAApIwqxLop9N6TU7Ypg07U5vYqAbufiFIpGOmS5IANTc+NIe0PNsUZaq2F646Qnwr
         e73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454181; x=1792058981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEuJYz+pVbgCSCGaEVPneImA96kKSzfy+n11GiKnq8c=;
        b=074TqkoeukIaSAY+YY8vO5rxD+Zq47eDgpisiLvThrNWsXqDrlQup2HmH85nakMh3N
         fUoS4l9y242Plxx9/FkxJc5iVBHnH/ir2A+F/HCN+jH02pbMKME1pwaoqov9lomT3CTB
         kETciRWABEfk6k82nReC2eVdG8ZcXT83GHOi+e23+EDApw+AwLF22YHgb7miB4532pHI
         DCjr5JMhvweR+9tfHaBLUt2t66s4/BcvYOJ4Ho0HUYh7GhYsU031pf+HRISsjANpBuMc
         257gX/eMR3H8WYF3f6+cMfXh81UGldZQsLk8YACR9kuEHOGPi3anizJ2f5aeDA/jqEpN
         31yA==
X-Forwarded-Encrypted: i=1; AKwUvBy3AASwPD3BcUfy56340xFcVYKWby5e61k01+iIZVWdATcCKWOeEugOaFgve53dN4EbiYBpagb0Cgy5H3E=@vger.kernel.org
X-Gm-Message-State: AFuF++l21gW1zd275KWPydiBRS8FiSNl68PBLRGPs4rWCQIEBRc6ldJV
	Y17/RnRQE43J1AvQFSCplQxr1oQhajr3gv4h2mWaGCXJkKK4J6se3czA
X-Gm-Gg: AYBFou1lKwAGw/2e3fLWcFQVPjz498FXjAWlZyQAKVHHCCv0MUsYvvBVuAJ5ao2XD83
	IZ3S9aUDMgPtSNGsdiCubfPm8GERIXrStNgkGDENm0RAZumZAi2br4uHmLATIe9zDsErFjOvt0M
	mGj5P20FfIkhiwHel6Vzg9l2uVmCEbFQGyMLS1H54/el9JOqgH4MHg+mLkk0HhjJgRJOba720dU
	0swOJUP7MLh0GjEbSdkysbHW85K9i4zTP/kdTtQgwxcXQfDlI0wYR5HUNQR5TxYIhD/lOCA+TJs
	CZtSBtuegb5I/HqD3wvasV8Gv5t+FYDX5xZrL7H46b+Y66KQnAh9HoNg40EsFoR5rf+DaAB3+Sg
	8RZOwb5NraAFquizpYBQwWgCIgos1GQwg74lk7/CYWUX0Kf3FpOcZmHpiC9IWd1gjqUFO1G4KdN
	VMKz9Z5nTSp/4c0iJzGv00B/PtpmqIXYlezXmOJBlcezZgK8mSlRWsFIJEe2At/408H9p16L7I5
	UT0APJ6eAbVQR3RlAJoalQnr4la3dQl
X-Received: by 2002:a05:600c:524f:b0:49f:d6f0:6f24 with SMTP id 5b1f17b1804b1-4a1800d3d38mr84852165e9.2.1791454181336;
        Thu, 08 Oct 2026 03:09:41 -0700 (PDT)
Received: from osama ([2a02:908:182:d1a0:b456:28a3:bd59:abb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e3356sm52932505e9.14.2026.10.08.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:09:38 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akash Goel <akash.goel@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/panthor: Fix TOCTOU race between GROUP_REGISTERED check and erase
Date: Thu,  8 Oct 2026 12:09:35 +0200
Message-ID: <20261008100935.3059587-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panthor_group_destroy() checks the GROUP_REGISTERED mark and then calls
xa_erase() without holding the xarray lock across both. If the handle is
destroyed by another thread in between, and a concurrent GROUP_CREATE
reuses the freed ID, the first destroy erases and releases the new,
still-initializing group, leading to a use-after-free in
panthor_group_create().

Do the mark check and erase atomically under xa_lock().

Fixes: eec7e23d848d ("drm/panthor: Prevent potential UAF in group creation")
Assisted-by: Claude:claude-opus-5.5
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- added Assisted-by tag, no code changes.
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0493858e55d7..a343c5180e01 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3770,12 +3770,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
-	struct panthor_group *group;
+	struct panthor_group *group = NULL;
 
-	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
-		return -EINVAL;
+	/*
+	 * Check the mark and erase the entry atomically, so a concurrent
+	 * destroy + create can't make us erase a group that's still being
+	 * initialized and happens to reuse the same handle.
+	 */
+	xa_lock(&gpool->xa);
+	if (xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
+		group = __xa_erase(&gpool->xa, group_handle);
+	xa_unlock(&gpool->xa);
 
-	group = xa_erase(&gpool->xa, group_handle);
 	if (!group)
 		return -EINVAL;
 
-- 
2.53.0


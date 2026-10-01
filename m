Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08736F414
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861998; cv=none; b=Xex7oI6KH4Wgk7l1rfIP4YxpHuV5EplU7Zx8rMpx9Ojbr8/dVA7Rx57tjwQ7hZYJq4aW8FG6u7+H3BhfiGqRtDkjtYijhgGH3defed/5joMOV2J9cF8O2re5VHmHUSjOy77HdQ1y4Qjm+XyMy4Hoyq3SXJBMzKwbTzjmTVf29vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861998; c=relaxed/simple;
	bh=O/D7ffGv777cg8gylV68kHjlhKPHuL3PjmlsKjvsJRE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fyWleps0Q24x2a3LBcUJBPK4c/VxQK8qlGSWldLX3CH9pBHrVNG+bPlaSfRHej4STp9+SwMuZDvVxay8LHsWgdBQmNvUW8uiC4+d7Liy+6Rwa26KgQng0iXcnrEi9Q7+2mPFMMXjAytuQV9H5dDdWtQDOxRVDE97aL8PNa+LdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcxA20px; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcxA20px"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3868239a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861997; x=1791466797; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3/yY7EGLa578fMnsnENYv1TYQDj2Pi2TjDEnt2TLl9Y=;
        b=gcxA20px55erCNJBbIsMCZyqhWBwCjO4eqQMNmndp/w2voFxENmAvB0XcprDuzGPPY
         S+XauZlJVZyWTKdtX1MnMZYv9zYKPgmqB8uSNSTYtjGYBqXDiq6N4fvMw9BXaVvtQpn6
         dSwwEdh82YrBNeZ3c3qBVzQd277LLN3FBRfdP2DMGELYn+rCEJTD9LEKrEjEKam0ID+J
         mH4jxLS+IqUU8nt5grtt2xV5cyLlGHwXY11Bs094RhRQYkqZW+/07IM//I/QQccsoOdU
         mmYJajWsDZqkzEw693xn5iFZt653M+PBedxd5ZBx44ElNyX5L4BboqY05AnqX5MskeI9
         I+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861997; x=1791466797;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/yY7EGLa578fMnsnENYv1TYQDj2Pi2TjDEnt2TLl9Y=;
        b=BMTDYtV3nu4elMD7bXdDETTWth/biy2pfsMISPwmXUBreniI3TLMy0osGVsCRGHz6W
         Z102ktfvTvx2UQaVJI/N+BMkLWE8CUW+AnktEXqseozODBj47zFS88fLkw8IWOToDOWN
         0eothcs4dezl2a7MjOhKJX/ARUSgWjDCXFEgSh9u6q6GWrY+rXpGikuMiu7MxeJO5hvQ
         tYjJVLw2ifKY48LXNU2bu6dmfKvkhMmCKB8ErVicunVhF5mr6XWmibhwBCg39ICwYOBs
         8253jq7da0594xWMUJopu6k9iBJnvIaeapExee/u2uLrp1izAehmdkOz2kRFy4HUj1wz
         4zDA==
X-Forwarded-Encrypted: i=1; AKwUvBxudehrGXyye/xt+2nFhKdktVsO5SePfmuIWpYbwMgusNGKiM2eBca3D8S0PoQXY8YHiUKLY5aPOkZMvj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/DT7y5si4VgtSkZDbggg+nz58iOMY+4p+KOw8i/LiTMrwam+0
	eDKhlisTHDwGXCDNN8k5oM3DKaJnK8sK7siQoIVNNoC8EiFLO4esxXae
X-Gm-Gg: AYBFou2x6M/1cBm6jA/TmruYHfBckJcV3msNO/SJ5ZjTncQgxc0y8uJ5JNlvrqy+zm2
	DlnGGf5Z/JLUZanM68pNoQ/PjogS+hUOrHHzcaBryuX9gfmEhCsWRvhnfZ2ZHiRoBUtYBcg7iTF
	bmGyNkzAX5D4hKXevCtqhkNa9ETeuy24QwVfG+cBGUeFelQ+1VjBHsamYuEoki9hc5tXR9K5xbH
	RbxbjYrCuRysUsvJZrMzPnpaKNimTvEBuuamH9/1igpHITqGLywUmqMY56Y0+C2b7ZyFeGVAybL
	aGdnVCKXDwWLUuG1Wh+IG6fM0fVyJLDxo8yJS1uuPs3d/XDgZWtR1bGOlUuTaUiX320U6lPFP1p
	tRHHK7PfbzRjWGgBb0l0olh8UznM2UbVOSD5JGnh/gRDi0sxmvMjubu/+3BQHaa9uaKwTkBiXu1
	1VxFXuFku+i2e4yIBqUpZs9re69u0Hk87tXwa4rRBL+y3DrEZAnp2JYzoeugcGlWY=
X-Received: by 2002:a17:90b:1c85:b0:3a0:ab20:9e97 with SMTP id 98e67ed59e1d1-3a4d197a3f7mr3920815a91.15.1790861996631;
        Thu, 01 Oct 2026 06:39:56 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm4673435a91.17.2026.10.01.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:39:56 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH v2 0/2] drm/imagination: Fix pre-existing bugs flagged by
 Sashiko's review of a VM_BIND series
Date: Thu, 01 Oct 2026 22:39:11 +0900
Message-Id: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9ivmoC/22OTQ6CMBCFr0K6drQ0AsWV9zAsOqXCGAukxUZDu
 LstxJ27+eb95C3MG0fGs0u2MGcCeRqHCOKQMd2roTNAbWQmuCh5LSqYgoM7vY0HBWcuq7KViCg
 KFhOTM5sUA7dmZ//Ch9FzqkgOVN4AOjXoPr1aZ8GS16ffsVcnZ09+Ht1nGxby1Ph/Q8iBQ3UvM
 JcKa1mra2cVPY96tKxZ1/ULWJP9MuIAAAA=
X-Change-ID: 20260927-pvr-fixes-a-40876d8bbb25
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

These two patches fix pre-existing bugs in this driver that a VM_BIND
series depends on. They address what Sashiko flagged while reviewing
that series (see Link below).

This series is based on drm-misc-fixes, which already includes the
"Fixes for map() path" series (see Link below). Patch 2 is built on top
of 0a8224058a58 from that series.

tests/imagination/pvr_vm_map.c, sent separately to igt-dev (see Link
below) and not yet merged, tests these paths and passes with this
series applied.

Link: https://lore.kernel.org/all/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com/ # VM_BIND series Sashiko reviewed
Link: https://lore.kernel.org/all/20260926152341.783867-1-gye976@gmail.com/ # IGT reproducer (not yet merged)
Link: https://lore.kernel.org/all/20260922-mmu_fix-v4-0-12f1a871456a@imgtec.com/ # "Fixes for map() path" v4
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v2:
- Drop v1 patch 2, already fixed by 7b824c293a6b ("drm/imagination:
  Propagate map failures correctly from pvr_mmu_map_sgl()").
- Patch 2: add 0a8224058a58 to Fixes, as requested by Brajesh.
- Link to v1: https://patch.msgid.link/20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com

---
Gyeyoung Baek (2):
      drm/imagination: Fix reference and vm_bo handling in remap()
      drm/imagination: Size page table preallocation by device address

 drivers/gpu/drm/imagination/pvr_mmu.c | 25 ++++++++++++-------------
 drivers/gpu/drm/imagination/pvr_vm.c  |  8 ++++----
 2 files changed, 16 insertions(+), 17 deletions(-)
---
base-commit: 4d0e2704118511e37790641d591454354e7c0d6c
change-id: 20260927-pvr-fixes-a-40876d8bbb25

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>


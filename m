Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EB442086A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187456; cv=none; b=HaIaUHwigDFi+FJoxAW3sVFVsiLsR+4p69eKlDEGNZ4I4UvrQwgSBNZbaX6Y5Z5K0OMkV8Szn9HiVHMsV+bwPEaridJ8KL0k5oCUO3urrRb3n6zZTbiKc2nwxGDgBTNRzU2SorZ1enFahsOMx2O2hr52FC7SuAZjoNJfiMZkMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187456; c=relaxed/simple;
	bh=hA6pYyM4Acf809wKbnybKMapbg6x6maDTR0EMyBe+Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrgjDkluhqQrElSzidOZLWIqZ2q5nHAsphA4gQBlKS6A0B6LAlUr4F9k3YX/g5vqzhbhQpeAWQhd+twNpErf6NX76gywnTu6VZv2my9YPqWzXOkULG/QKbJ8Gdnx6h6+oOWkThmtS9P1UfNndGJVa7em118CmF4GuzbAuiWP1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUVIAbHZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUVIAbHZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso41926725ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187454; x=1788792254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VT0MoepU5ZagANU1QfNRwm7KYdNf4WeZGjYR7GBCaMQ=;
        b=rUVIAbHZy7uHj1I1n+hGDs+n6X6YTXj5Q5Esv79KKdbmqaqQ4aj08FnjhU7bwbu3FS
         NE8tgSPvk04t0lPmR6r4ojHZhAoUwI347CBJlIu18RuDURoYd3q33T+I09U7Ffowixj5
         zBRC1xNf8Hi2BaTchnQYTbPk8ccXTxdp4U4CZSIIrS66U0i+myXDcBQUKMgsi8Q6nlTA
         irg2PVi/E2K+Yrfk1VbdstYQpyxXdcBNMT/M1PWKcJSr8mp494HBeFCNqSO7M4ddwfOF
         QXpKd9H6/4FVBI6vFhoHyyJoXrPMUODcMbtZu7X5xAb9lXzddmP0srzBj5oEv+3jqNfI
         y5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187454; x=1788792254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT0MoepU5ZagANU1QfNRwm7KYdNf4WeZGjYR7GBCaMQ=;
        b=TMwZJdF65TAXY74CSeHEMCtcja8cPvwcRpTb8bxqFR+fRCe0IcO0bgIHLpECxIEazO
         662iAHp4soU+301OeGk9mGqxQn6k8pHqP0wtlF/KtoK64dbbv2Qn5aUuPal4DyscaYnN
         LjkkAJPMz2gAkPvYNIDA7QUYzmMT8s/faH//FoIBi6x4g7nvcVwfoBMwWpRoRiZ4YZtq
         SASN2YEBY5MzCWsuP5yr60CkRpQKrUR/lL9O9lJrbZ0RySYOY5tYA06XXuZUWmlSi1G4
         ynpVb9yA4LiHWa0t3dmPeV2FgoZ/Mnms9KJ6WUOkW3giCUAz184/4HWDXGbyLkROjhgk
         xdoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW6SgTTCGOg2Zk1qkEj0Mj84/6JyFY+52B95lxao53hU1ArMfAFT35WSZUTmQsJn/M2yvehsSAI3n1neU=@vger.kernel.org
X-Gm-Message-State: AFuF++m4AFIQdzPQ7eszSAOJylsIm9/Yj2JqBymPdUJF8HaXOaEKVnDx
	h0pULzlQvQUVYjkC2X8fYCcks64q1o+FtDXbg+hrcoljvjJDR+DdZN7+
X-Gm-Gg: AYBFou3xnZ9BIDbaUKGrsr9e4+43qtFCAtGPRu3mbzFKiJYEMso9TmTsB316cq2Pan5
	FBGZwWaZtOZ143in6AfynJWJu1PHrmgl25l5+ox0xVPIQqffC+9bHlFFLt/3mgsUh8AFru+Ypu8
	/3tdcA+8kd6WpSO5FcRaYzevEqJzfveiS47Brq9/jMwAa5LxdV1fvtJYZ/S5uyZ4LGvdBu0lA0B
	dSFKISemUBGK0mSCnMFFMYUuVhr6+EpA8eGtyCMvehNQf4JcZMYTvzFLHgkk/2Gc11ofjudyqNd
	Lr2njfqLqL5Ut1zSOorQBnFpxdFDF4LXruAnNDp/bfzZ46nNCoLRKngWWjMKygStdeM/k8ACrXd
	+YHYaim30cuKdibQJXLZfZPB4uTicfAJTDHyws2QrCxXiFMNk5WK4eDh4ABoaXKzcrXfUHL3Bbl
	PcbSkwR/NDNq7ktLVA4MMTk6DXFkTqeQR07wBiUPIinb3Cj/jBOAsXuW7aBa0/4RLiX8Dr
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-396d0d4c42fmr44338628a91.2.1788187453935;
        Mon, 31 Aug 2026 07:44:13 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm28403095c88.10.2026.08.31.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:44:13 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] drm/fb-helper: use strscpy() instead of strcpy()
Date: Mon, 31 Aug 2026 20:14:05 +0530
Message-ID: <20260831144405.320914-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() has no notion of the destination buffer's size, so it will
write past the end of fb_helper->fb->comm if the source string is
ever longer than expected. It isn't here today ("[fbcon]" always
fits), but strscpy() is the bounded, always-NUL-terminating
replacement recommended for all new and existing strcpy() users, so
convert this one too. fb->comm is a fixed-size array, so the
destination size can be derived automatically.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 80ca785bdb26..175311fac2e4 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1545,7 +1545,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	if (ret < 0)
 		return ret;
 
-	strcpy(fb_helper->fb->comm, "[fbcon]");
+	strscpy(fb_helper->fb->comm, "[fbcon]");
 
 	return 0;
 }

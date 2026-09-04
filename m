Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A62419FBB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502564; cv=none; b=YgrI5Ix5loE2+qCD+sshL6oNCeW2jeRr45LpF7mzLCvi5X9ktMxpGBzGwgbInkg5uohbBck9DzRr3FhgaJRcSWB446sKr3h4v/CuXqj7LcMwDrY44RKHoAsAxMDfy/CZcdPnUmAQi8x3IxE4oU+T169TJWUZeWMNMeLoCAn9xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502564; c=relaxed/simple;
	bh=d+XQMxfmtF37dFBwLnZYYwWxlVcCUb15+TV0NlBbmF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbUGFmMFfJPwI94AJsDW0T7X7HVXBNDd8rBZ72cttov5km52hspg0W/KlI+1X/X27t7oQkbCy6xEF+KI5GiYFQ0jr8A1g++LsIjsXVmUxanEDw44NIzr7jOMRSPKvkjhQ10yINAa6NiHnIzrm1I9IKglKkK1Pc59ZF3eacHyCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGPOlgJQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGPOlgJQ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-85339ed040aso487186b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502562; x=1789107362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KbzS92DGnEavUtbT3swzYfSA4NDGZ/nU8LrjJMa9/B4=;
        b=tGPOlgJQzHWoXGrwKqWlm288WkZdRO29wjLNqTbTv0xlH7yss9GPoyGYPltn9ENH3c
         URcog6d1cBLpE5BhZVRXX8UxcrZZfRvV2yh180n8M8f+7Dk3fdIWQlCewenu6vKr21J0
         RNgVkLmvDkakag1VgnxZ2Ar0BiswL0dvMP22wxBXaTN8WySmx6/i9FgbQYXqISfRN6Wa
         D1aqMqDd+s1hoXWMeQ1/MSTxQbKQC1OARDA2l396RyLihYvfzmY9qkboMW3vKihoBPvM
         RAguiSb5XsvgMAg9Cn+/4IZkf90P8UsHl1LwXaE+sS22uDaqnvtvQSzaAnh7tk2LL4Xo
         SFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502562; x=1789107362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbzS92DGnEavUtbT3swzYfSA4NDGZ/nU8LrjJMa9/B4=;
        b=WgeFlTM5kxF47fpWy1nN115Zh5fU/4NSuzxjTfZYLbE2C+U7C4lGf/v5WoUsRKJ+KP
         u5GU3c3NubkRQ6llyPv4fmMAOLky9cj7h7nwv3Ni8I+ugJUTtpeIVHNkCTyc9u0uSV9h
         9LYSk091tYC+3Nr6PtKGkX1pHOlrnbWxkDpIOoQgdB8i5ggMEBOCB51sDAqmbGb8AmGJ
         xDSpBf4WGIMZ9pI32G3ZNZ7KDuhj28/XbQjATjrFvgzo5zK+Gu14i9hEdRpOZ+8fa8Rl
         hZ+zNzxkPOTNnQLxvSAkO0RoMWp59XfBAnIKOw4isxDz+snknvGEpN1cqqgK4sLS3O4v
         NyqA==
X-Forwarded-Encrypted: i=1; AKwUvBwGUa6iz48vZCNYbsWmJRAJcyRqpFzle9pvzIOEi/gHrkjyeRNJTT+IJDWdHyQJEoUP4J8qzKgEaXEIk7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mSjslWDbMwhIHppqNYSRh+qLfpsvjVhQRvJ1uszPEOXD6tyXgP
	jbmPwLEwDfpRJkTPgWzxwzdg1hmrWwFImNBYyrhhnCDEAgjnaMhXWqe1
X-Gm-Gg: AYBFou3loE0TzLS61b/G4LZOuGTOt3GTEcX2bjQIt6Xpgu08dyYR3Y22Pq/fhHtx2X3
	XXbX5L47Zv7+hVkslHdlzPRarxHmBC7K2DQ1ihvJXiaMkByirqP5iTat3HcbybW6quMrfECFwcz
	i+DppGhFMrrM9Y+AnGuiXCHlAOS2hhs3DL4EhNLY2tULWFEGzkwNuCceNsQVLPJI/wzmKvbAo0Q
	Hyhz2gdRcxR6o0eR14oIkTominNbynoeoSpdcDL6Pj/5YYmE3Pn8wAMrwnnieD6bCOZo5ev/uT2
	X0uwDvJl4IBzpaWJD1SHmOtwKSVVW4RwsXTMAw/JrxqRmJFH2ZFQbMy8nAKixmgT8qKE5S8w0J7
	HKWpGhCEtcxMkw6PUJj/1fPrtcqO4sSwWBTYzxlm+1hO1TT0Zu+R9In0mm4Hh8ebVnDZy6Z7bXD
	klRM3aCpBITwaTskghEj5CGk/1phC1epHZK4XgL0acMmFF3mrGb3W6DPft81GdWp7YgSNnz5vQh
	zOhQFE9Ulg=
X-Received: by 2002:a05:6a00:10c9:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-861660e3dacmr5209555b3a.3.1788502562476;
        Thu, 03 Sep 2026 23:16:02 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615332dbdfsm753216b3a.42.2026.09.03.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:16:02 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH RESEND] fs/ntfs3: fix valid_size not being updated in attr_allocate_frame()
Date: Fri,  4 Sep 2026 14:15:56 +0800
Message-ID: <20260904061556.939195-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the end of attr_allocate_frame() the on-disk valid_size is meant to be
updated to the value passed in via @new_valid:

	valid_size = le64_to_cpu(attr_b->nres.valid_size);
	if (new_valid != valid_size) {
		attr_b->nres.valid_size = cpu_to_le64(valid_size);
		mi_b->dirty = true;
	}

but it writes back the old valid_size that was just read instead of
new_valid, so the field is never actually changed even though the record
is marked dirty -- the intended update is a no-op.

ni_update_parent() spells the same read-compare-write out correctly a few
hundred lines away, storing the newly derived value:

	valid_le = cpu_to_le64(new_valid);
	if (valid_le != attr->nres.valid_size) {
		attr->nres.valid_size = valid_le;

In practice that path, reached from ni_write_inode(), re-derives
nres.valid_size from ni->i_valid on inode write-back, which normally masks
this, so the visible impact is limited.  The assignment here is still
wrong though; store @new_valid as intended.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
No changes; the fix is still needed on v7.3-rc1 and on the ntfs3 devel
branch, which currently points at v7.3-rc1 as well.

v1: https://lore.kernel.org/ntfs3/20260701061451.385659-1-zhanxusheng@xiaomi.com/

 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206ffa..792838676352 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1995,7 +1995,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
 
 		valid_size = le64_to_cpu(attr_b->nres.valid_size);
 		if (new_valid != valid_size) {
-			attr_b->nres.valid_size = cpu_to_le64(valid_size);
+			attr_b->nres.valid_size = cpu_to_le64(new_valid);
 			mi_b->dirty = true;
 		}
 	}

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.43.0


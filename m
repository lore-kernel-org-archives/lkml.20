Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BDA331EBD
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737068; cv=none; b=SohxBLn9ALcRM5DLjRkl52WJ+QL8zB4pU3AfrL0eteKigIx9AGFcY/0WSydnDLnq3furFQE0Dx4eaaUpPN1qa7EORwPb/f4bX4//aCROZ1kOX7UoR0Ta5Kn9DqqH6X4trvwZk7xNkKitWmfZgyHWwVaFK81f4lx9NUd2jaX7riQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737068; c=relaxed/simple;
	bh=aVMvet5N5gGV3jYtyEyrISCIw1Zkk++BV+ffJirUST0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+vdz2IcO6hKxGOR1EXMPg0PzokRMgzCi08nI1AhT5N1/9fe9gqWi2JhUR6aNuTxASf7svT2IwiJu9H+cDAwjJU+87a4Md73Q6VCvOE6hOl5UrAfLqlSZyei8KmalDBuFIYmEnCByUh9ltZRHJaWJMM7UuIEpy0L8iWN7+/u74I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEFYUfiI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEFYUfiI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso6148685ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791737066; x=1792341866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGHkGbWaY1GHrAj+q2ZWx0R3E1TtNOA2ScwMHNrb9/4=;
        b=LEFYUfiI8QPNO53TRlIIV1GmqUzMW2ymvFiaH6zv+64T/ekmYlpsmfTbAwCOanbuXY
         xHV+ohkNmEaDMFbbxKkvJV6CibWYZIwP+JWAUGpmtJZIjzN1Kk0CwP9cbfsJAAD3KN6P
         tC8Js1TBDPfiB1cA077Fa+wE+Gp54l3P/K01EpM/GqGSA/rN8fY3tNdFkegPhR6LpSzq
         BH3V04xs+H2HhjanapQA8m+CQzliMyi9RvQiJp8hZiVblxPNgXpWiRISUwl2en1XdOEs
         VeS9JvunsHoWwe8QilCIr+R+CsfIDqzIhYVpw+JyUKpk2v7CYnFVo9+FVysBmeZF048f
         vy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791737066; x=1792341866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGHkGbWaY1GHrAj+q2ZWx0R3E1TtNOA2ScwMHNrb9/4=;
        b=izW/RF9uOA5ZqyLow3Zol/snrijweN1ohn6EZARteSdGLiPA7aof7PAhHbb3ojIYR6
         M8AJijp5/YhXy5ajXQnlxrJthOpfzL+FUZCzQmbvhkfuQYB6G3pcT7PkBOg/PTYChNlA
         xmXJKpu72wpCp7teChOnMnw9PAQAhovjLebW8vXTeJwtPwJwXq21tteUTUqm25rjuxNd
         JoxIHdUhPtXJTgci8x8rR3jr6lzTSxCfYbnEpfKpKpgFDTpWfIKJtc3PqsMFNyruxC84
         qeuRFGlvegLPb4OeXRAZVfGsP5h7q4rEunwiySBSN7JudBnIYbTUzB3r4PPn9brYihC/
         91Tg==
X-Forwarded-Encrypted: i=1; AKwUvBw7mJcsK9+6lvOKe8zlxbqOLZ8sk/qC7au5nhOfReJI2P128agyJfA6l2FbcPyi+DsGkx2xnRVd3VDbibU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR6fsEIvZZIK8mIsGc4hGP5gK+eJOWSxWNBzm1NsqCqXT8b4eJ
	qoxk/+ZibTRtJ1jxe7vk11G8+7MW+mQ+QpEU/k0mUKBpAUy+oQ2OiVD/
X-Gm-Gg: AYBFou0J6tEIKNwZOyYzAkjsBwkQLa6vpZTBoEjwL3hkJBMs02tAXROZy05rbYXlK8G
	juuU1frJUOSOT2fuaZGWXfiToLW1GKmDJp4yH8oHcTJ88swAKXZ3oZqjExeMCceDS8rwrJxPZpZ
	L0vWwe4KSgc7HxY+ncXp7Tw57kbioyZCbAk/pD2HgFogiYa7V9DX+QdGjTSZU3l+3fJhC1NnAoe
	GnZ5isjW6Zj/4ivAtnLj64Wbby0zJphmAjx8aXQ1otn7cRfcCV6bubmb/3wUNa+S/hJ3D6/z5Tb
	0SK6+7hxlw6RJAEx2d4/wG1yLjK1TFi28dz60tDE24LI+OS1xSk/BCODOd8E2rr14+UMGLvA0f/
	3tFxlXskWMwCzMJLcE5kT738TqS01Dz+r+/jEy0Q2SlBMtzfjlWk6C8f+e/+CRLFn0wh8YplXY9
	u/LR7Eij8F/3TykcPGMlm5E+5coxboEC7ifNrjw8gs3QAaw+AnPjZO3RYqH337C8R+GV8wYwBIq
	n4Y6sY=
X-Received: by 2002:a17:903:22ce:b0:2e6:18c4:89d0 with SMTP id d9443c01a7336-2e8427ee486mr63798685ad.5.1791737066088;
        Sun, 11 Oct 2026 09:44:26 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422fa91asm32769435ad.81.2026.10.11.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:44:25 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add BOE NV140FHD-N43 panel
Date: Mon, 12 Oct 2026 00:44:16 +0800
Message-ID: <20261011164417.151770-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the BOE NV140FHD-N43 14.0" 1920x1080 eDP panel found in the
Sunniwell Z96A.

raw EDID:

00 ff ff ff ff ff ff 00 09 e5 f4 03 00 00 00 00
13 1c 01 04 a5 1f 11 78 02 3f 62 94 5e 56 94 28
21 4f 58 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 c8 36 80 cc 70 38 14 40 30 20
36 00 35 ae 10 00 00 1a 86 24 80 cc 70 38 14 40
64 64 44 05 35 ad 10 00 00 1a 00 00 00 fe 00 53
54 41 52 52 59 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 46 48 44 2d 4e 34 33 0a 00 97

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index ac815729aa83..ba981581f3b4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1972,6 +1972,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x03f4, &delay_200_500_e50, "NV140FHD-N43"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2e200, "NT116WHM-N21 V4.1"),
-- 
2.56.0


Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2E233958
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842081; cv=none; b=Cuh9bDmxidfUG9OfH7V1lxut+6oqpl0C9Bx2ll5/0y2KjyFQ6PUqy5TNp++yMyleEp3dpK0cEecrsAPWzFumyR6ZrJXoFcidIOsmwkD0PGTVNSx55+S8A9CX4YEN6hHIV6KF8NDzd+f+/Kl+ppAMep3guT3HAk8Uc3Arm7xRo/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842081; c=relaxed/simple;
	bh=4Qz/vscKrFKJKXW/7cJ97quWQtZtjd/PLHgXcvpvrSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=szqr2Gdiwx5Wetaf6hMAQKeIhV2q20IPzT7boFNLVWRPsSiIhKSs9wTnWWtbWI4R7vNoRnpLvq96SiiW2spKPV/rG/6tFUaQXqvvr0k20G58NlQcWEUzyHHfRnPDlj3+Dm7rqDUWmB/Qyvq98abYefA4uqfyJf4M0g6rFT0utaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRKEBfcQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRKEBfcQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d58efc7356so26324645ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842074; x=1788446874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbEkvagZ9qeyC6jVzXtKZoIKK94uFwUXLSPjBHZM3eg=;
        b=gRKEBfcQv/GbsKy792xm55YEDmcKdg5rOa+a/+JMC1KntLyNHjc3Ee0Ea7i47dRKZh
         s2w+JlhuWuA0at744Nl7CyrNTSWfAjpsPBjKBc4knJ7oTcpNbg9uoh3c+s6R/VsT1RJi
         lPj6ZgMeLiBUCTHYCFbaUyxnoI1ifTYF5ufyMdQESXyyOoc4AST/UAJFpVEswdXIDAK7
         g3NjBdA1mHIH6oDlv7hUntqUFdNJ5fnf6N2uMtQea7zGMO6x0vwFYS1/i8DYvwQxs9TG
         M7lS7ep6O12UqJ0aIe6AU9i5ka7c0l/+jFT9AarV0hgXc9du7PJNGcBVw4govGIvLfDM
         hLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842074; x=1788446874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbEkvagZ9qeyC6jVzXtKZoIKK94uFwUXLSPjBHZM3eg=;
        b=QUtR4OP1IW8biETEwGB7ZFROR9iq+H1YO7sd16d9VhhRE8y9V+BB4j1RZaRpKY3CvW
         +eoMFUCSv4HTL7jfL1rQXh+06n9aRfAFQPAvkbybYOjduCGZirvBI9+agkUVIJ1cvUqS
         +lU6Jfdw7r00EuBMSWHAedFa8QiDmFj8BbTI+Kavmr/pjK0gnXqUoq9SLjIhVhzW5rZy
         0gKJFO846IDnmHq1lwugs3NHGoBlPcNFPV8bE8Zgz6U7lACkvuFMHHnuGW0D96e+TaTR
         SKwV5WsaLCvpxRNAS6lKUwSX998rsiwnY2MKv+LyzY/JA6QIGjfurr44qSA+vfvakGNo
         k85g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7DhpGQxWyfceF6BqVxPMvihSvDOYLnIXMyQ8FwW8bScAihteB1FIkyE6AyzoY5hv1mkqULlhXoSgHzqo=@vger.kernel.org
X-Gm-Message-State: AFuF++l8l0sglNhs83yq3wDtSsVmsm56nCmm1t5CnjtHSwnuv4ozCOrB
	pUzzgl1/AGLh0e1RqVhwXFtfMOSylTMaYBdUHNtTeL/HiBXvB00WDuNI
X-Gm-Gg: AR+sD13aCsh/a4xnTv/LUN4dhLL435l9q1BnubkUL0cWKNrNkiYOG+0ywy4qBMUSwTU
	dtlK1zns5reFeslY5vylOc6bQ17JIq5ChwD8F1RhkM66LbKh/wlLJu2jou2XAbrz3pjyQYe33Lr
	HVGu3RlKRd80DgZzVesKC/dMRrbLiSJBq8yKqTPAzsBEykgu/p4xXHcFVcL8C6VeQ6MJUnNadky
	oF0fynRTWccvWl02SB0a00zfsAGgORklijk1KMgYgIKNW+HzHZ15i2hwMb2jEP1e7K66WHIdi7P
	SOaIbrAfqufBofVUqBOX9mJDpWDHLqaGn5kAq5TkQ4d3rxqCEi3dJn4JxpX6gpuN6WwyLyltqzB
	5lZ6v7hyabZyhrePKEd61+jza5i9g7mOetRs/0aP0F31Nw8EGOTFmqzf59W4ZeMscFHHMiKqsyB
	E9bse3sQI23aEj5IPhEZ0rHeX+4OE5PmA7bMBjT5Gh2iOGcwVcFsQjdd4=
X-Received: by 2002:a17:903:2383:b0:2d7:71e:575d with SMTP id d9443c01a7336-2d707af8a58mr304661165ad.9.1787842073561;
        Thu, 27 Aug 2026 07:47:53 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c2bb7dsm17953815ad.71.2026.08.27.07.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:47:52 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/ras: drop redundant memset in amdgpu_virt_ras_get_cper_records()
Date: Thu, 27 Aug 2026 23:46:13 +0900
Message-ID: <20260827144614.487229-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kzalloc() returns zeroed memory, so the memset after the allocation is
redundant.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c
index 1e83cb5064ff..f021719ff0a8 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c
@@ -298,8 +298,6 @@ static int amdgpu_virt_ras_get_cper_records(struct ras_core_context *ras_core,
 		return RAS_CMD__ERROR_GENERIC;
 	}
 
-	memset(out_buf, 0, req->buf_size);
-
 	for (i = 0; i < req->cper_num; i++) {
 		batch_id = req->cper_start_id + i;
 		if (batch_id >= overview->last_batch_id)
-- 
2.43.0


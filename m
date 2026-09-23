Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4453E30F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175029; cv=none; b=Fud9BtTY5R6XlyrBKr1pVSOddSCNquIHDxVYq7xFFascRmLFJmAUPFZpXwYGIebiqOjr5nmRNYZ/CbYwdwYL7fA+kYFGxSD95w03CggDn7moWCKUDZMzhV5yaPeEDOyPpESBECN/2MD8boJvTa12F9CvxYbCr9MEVBsfhxMPfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175029; c=relaxed/simple;
	bh=wAcpb8FMxG3Pjuh8I92KzTo7L8xDGLxAUi2zZZPdxUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3xMDdpjPr0u8Vw33csKbEGHhQmupPtk1UIhYBdAcrgbmXqnl9n61lyr3WqQWzeLhNMpf/2TJHLf6iYB125UYm8FgcKV25YklZ3SavXm//YWq2Km67taFLKVRtGpggYSJRCjAhyiqob3cdZLfjBoiOw32P0C+veJK4nhre2yD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3or+UdL; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3or+UdL"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so1234151d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175027; x=1790779827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eD0K6ebb1ULiIBLcq7FlBP1Yj38L0of+tai0gbVPhVQ=;
        b=C3or+UdLtnf6ZHmrK2DnPiICvc65MxbcAXJ5TAxaiw122Aa1CNPpZBBahB1gxb+7W0
         ufGcEqPinAzAU6n2Pl0anAnA13IszvLif9otoOPbqUJt3+nBAmMR7/AGf5PVy6JwNSd5
         gFbRY/tHYVAtAnb6p1kMr1DXdUy/PHD5eU+J/yedKFjbll0XS/TPwuhpwFDpnHzkluJ1
         LdJsmm+c65v2wZryyuHytzFbB4NMjAqLwu5UD7w2+mC5vOBLP+tTbysaFu2gl9BV4iYp
         1UG/TykIoeM2Pl/L3WSzZZqn0FuhTj5PKIE+qkT5tBw32BImLfW+T1ZRKkITGsWJrbpA
         Q1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175027; x=1790779827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD0K6ebb1ULiIBLcq7FlBP1Yj38L0of+tai0gbVPhVQ=;
        b=F7H9oYWQlVg+oK02RSamFMXU+NNWijk6te3OW0XTgiuUFQeva4GCwU519AT5Jdhwwn
         Qg6qjzsG+9bi8jY1ugWD4O2cLgqwknq/mSH+NeJ6VqL8GedluiabwD+4/gqrHUNuiYrR
         pL5qnsbcLIuygeXo1X8FZsiUDJ/h1f/XbSK53bUd8UWK3h3DKIH0Qz04S40vo1SmhXrf
         VKVilVfWZUlaTZgQgxvPsibW5AAc04uJq65FlTMJAQxA3i5oIgM/sa9g5lUR/3Ovc1zR
         DFNtmHbRh5gI3vGf5PifYmVsvgjyAP9toEawnH12eoABbtNafV/Ukx3xKFbJbq6m2Su3
         Svfg==
X-Forwarded-Encrypted: i=1; AKwUvBzwlRmVjI4VdFfIt3d5luvXbiTL5iUZs3pao9CQjljFU3a+vtUAXL/c/cxeeENsblEbSEIaRRCFt5T7l5I=@vger.kernel.org
X-Gm-Message-State: AFuF++lpD+l/T9ZhSYrzObvAVeKVBa07hVHGVzgCOuXW6BShSQmFKjNL
	n0oKk9ZAbLVJIJpeB4dyKwzKM6jsNsm+e7HF3Q7glfFweASTmfPMFg+K
X-Gm-Gg: AYBFou1C9p2dCfZGzK+usBwnuZwpaNDKoZr19eM2K51XhVoQ5/6+Ad1pwDy+fTQayoC
	GAAP2x79+vgefTU3Lu7KrXaSm6F7w3CbYn8WgK5H+tcubF7lRPzIUv1oC45S/Ik4+BIPj3Ej03Z
	ZnQqT3x5IXRyNsnrImuamIBMon8u7Zeyk09YFdgHUzKZGOsa1hfRRGWWTzjO/i6ChOGCppa6w96
	mtFMHtxzCKvS6tbbunRTIjSd9UcHjnQluL/o6HHw0E+vYUea0FTGGe4VCte4WAEecrLsBWkibt2
	Ap9ZWJ/dEcHfQiHBxnNfLpRn8cHxriimzpEl5H3SJpZAhXjmIIxUD4SYdlRRdk+l3gCJWyz9QKS
	KPHLYG9boFi6eFuGWX+SI33+pFDxPHAqWM9MrQRDqXonZO1blROzY2IgBXEjUiC7FFZ8wG4s/JT
	cDWQIwVVedrK/zQUF5125sLcLK+DZulcXTaPo6Y6KITSROS8FbBr1bIoqXQbqJznqldFFfqJVFg
	w==
X-Received: by 2002:a05:690e:b89:b0:66f:c1bc:4028 with SMTP id 956f58d0204a3-672d5927cd5mr1726179d50.85.1790175027355;
        Wed, 23 Sep 2026 07:50:27 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d6ab6720sm1056729d50.0.2026.09.23.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:50:27 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/qxl: use correct offset when stamping drawable mm_time
Date: Wed, 23 Sep 2026 11:50:18 -0300
Message-ID: <20260923145018.1244740-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qxl_process_single_command() maps the page containing the current
release slot and copies the userspace command into it at the
release_offset within the page:

    fb_cmd = qxl_bo_kmap_atomic_page(qdev, cmd_bo,
                (release->release_offset & PAGE_MASK));
    copy_from_user(fb_cmd + sizeof(union qxl_release_info) +
                   (release->release_offset & ~PAGE_MASK), ...);

However, the subsequent mm_time stamp casts the page-start pointer
directly:

    struct qxl_drawable *draw = fb_cmd;
    draw->mm_time = qdev->rom->mm_clock;

This writes mm_time into the release_info header or whatever sits
at the page start rather than into the drawable that was just
copied. Apply the same offset so mm_time lands in the right place.

Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 591b026..e7594d1 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -188,7 +188,9 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 		 u64_to_user_ptr(cmd->command), cmd->command_size);
 
 	{
-		struct qxl_drawable *draw = fb_cmd;
+		struct qxl_drawable *draw = fb_cmd +
+			sizeof(union qxl_release_info) +
+			(release->release_offset & ~PAGE_MASK);
 
 		draw->mm_time = qdev->rom->mm_clock;
 	}
-- 
2.43.0

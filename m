Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923518;
	b=vAVa59XF6otTUzEicS1KOVN0k5sIoUiRCn0u5ApOKbzD+4hR0py/AqVcmLC5GWBq15og
	 g08yeyV5d+wIxLyctM/lHRlJ8a7KbjorE4tZFf8tAHSmzkjf1Fj5A+TewpUGLY05PQPbb
	 50QjseaLvieO4XaeiMxhm7nxSwHv4EV9YkVUVuPSvayBqXXioiq6tYz5KKbBmpRzgXpo2
	 Vt6xSjSgF5pDOOFGpHgmjjZmYucyroKMW85xFjNG3dIPJC5A/mYQTjdheP4tDGm9NVHd7
	 eHvePOklCLPNDXUaiWPEtDItPyBFS9lYtDPLiWGFtTLhatSWl/EBfl9Md5wVLECKXTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
	b=MRy3EKCf10El4a5MXuZi2DMS77lcLmkn4LbNriTwO38u61yAu/7QGDwmHgbjoaDGOgSH
	 qSXtMpDNZAk+ZQq7mBivzowa5ueXX9XeARQB9SP0FTvfypMwwKXzHfwd3L4/sCV5tbzWe
	 hvOfHxYUfcCZ0nmBYaSu76I+RavF/BBOeOxW7jSsnGBrTMmabAEL6s8GH5pEgWeqDVs0x
	 SlqDbKst1j0abMdrHJSR3ZraPBicdL43ARDQqOXsI/+T2U7wEKbc1eEYkhYuv528fWLyq
	 dtvH/vJmE92wHz7xvPtIexP/TRlBAJGancSGcGz7GhxRv53x8JJbD3FPLR5dQESZIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXyGxRAb;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00139606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00139606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXyGxRAb
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e977109392so28274795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923517; x=1795528317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
        b=QXyGxRAbPPpbsgRWmBLcuTwVo15oXwqkHupxVLTSdRtvZxcG5n9B6ynVkqfTK40jUK
         v4bif8x+jUXBQESQbOCyNfe7yVAC5daxCic7Pg+YdxKGPpSbH5kFxYARbszrdUvgh5GP
         sK1GWxaixWUiGJejZVNdQmr8rUSCzQUrkDFEOSYUMDi27NEtfE7J6n931VhIrG96AJyg
         8kaI7FUoTvB9tiODUXK4XiZ4+FwQozy3YnWb1CH43Yvtxffb+UEEGVe17v3nbs7QSto7
         MvXNzpcKDB3gVghHvMBw2tqGG+I/Ytne4gS2kO9TYhf5D4rEsEXHfdZ3EA637APPDRbv
         +G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923517; x=1795528317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
        b=qbsmlAR4IPBIB/WSsZx/TN4nPX8xouXUiFacOFlT8IfRV8SwfS2E4rKl4XOCx8g7TB
         kLgynJB8tnplIQizxCcKpTSEQWM3QRuqq8bt2Qf/JXEGqA5hbYWeIaC3WM4N5XkAX9eo
         eFsQdMSH9K/r26bdebSu8mva4Y3FTZmwtGe+3s5cXBOjaNI9E0NNYuSPPhsVYQ+fgkf8
         F6UjMQIRLicGi87ndIU56XZ3ecCXcRrAL1HSCBmk3nLpOqFt8fbEL0Dqt/fOXiFLbAFB
         hCx51NrMQRQAeZfJuzs7QKcBAEwu659XE6vFb8zNkr/hAwcccsFi5udwzual3+t17GfE
         ZqYA==
X-Forwarded-Encrypted: i=1; AL+hErGYvan05HJrrriMZ4K9uSp+uzek6gjs03x19qx0Tb4MsUYNnov0R/Fv9ENMLQc8bx0hQGQGZyBZb0KKsLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fPqsiY0sQGaybF4uAV2hVkBUzBzHy1pNf54hFvJjpU3wbp79Y
	eNDA2eN/Rswjo15TDmPUEzzxKzVVlR1IvH6fcIllHc8jfjntnanuo7qj
X-Gm-Gg: AZFdTZfdZzhviht5VHVH7QdfwdnSVks/saGNiItwu2qJ3j4sHobIv5m41OpmaYuXY3Y
	7TKgghrI8WAnS5ak4OxJgcZpHqQvStUZGtG6nEBMDHGJNIQNVJ7BrfaJS8kskVvYAJs2LlGqOxu
	JXrdESelxSiQfNyPPhg4gYOfgaxejLNXIfNEfHeqjPRB2SGiJsxS3Meg7wMN+e+4SlZ9MTu73DV
	FirASi3Cp5lLyG3+RQRYy64FHmNB2skmRdeCt4UQ9eLjvcpkk+FtTvQOJQvAuO3G2a/Fnvw+TJJ
	dx4rXk/mzNW9Da97l5xbXz/s0w8eIAc/kBsWQLOQx0Dboy7006mQ6fVz01cSUl9FGFfNm/K1QUQ
	Vx0LlpFZNgkUQUKXZM1pjmm3nb+uDxNwsdapvAJcSFhNrTsgtvTaQd0Cc9qm8gq6ENzPB5gGQ11
	gRA7GycgPlAqrFQoExQl+x8mw2NRXxUEtoebN2C6MqdTc6x781luY9mdtFldbXozc4bDHpf5AmW
	Oewm4M9e4Cc9emt+ETOpNSpvjfSfNSJB1PzRHz7Kj6SHh9DYAKV25Is6cgfJmjyHWqTCB+7Utgi
	fZ7dahPsS4Ti9yRdNsjz+J/GW894Jlq0qWJSlhQknxGWILJ6lg==
X-Received: by 2002:a17:902:fc84:b0:2ef:eaa8:9b59 with SMTP id d9443c01a7336-2efeaa89dc6mr10152485ad.48.1794923516856;
        Tue, 17 Nov 2026 05:51:56 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:51:55 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] fuse, fsnotify: handle embedded NUL names safely
Date: Tue, 17 Nov 2026 22:51:34 +0900
Message-ID: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

FUSE READDIRPLUS can instantiate a dentry whose length-bearing name
contains an embedded NUL.  The fsnotify name-copy paths then stop at
that NUL while retaining the original qstr length, allowing event-name
buffers to expose uninitialized bytes.

Patch 1 skips dcache instantiation for these READDIRPLUS entries while
preserving getdents() behavior.  Patches 2 and 3 copy the full qstr name
into inotify and fanotify events.  Each patch applies independently to
the base commit.

Link: https://lore.kernel.org/linux-fsdevel/20261115210952.2140036-1-graypanda.inzag@gmail.com/

A custom LLM agent assisted with initial discovery and reproducer
setup; all root-cause analysis, patches, and runtime tests were
manually reviewed and verified by the authors.

---
Changes in v2:
- Follow Amir Goldstein's review: preserve FUSE readdir output and skip
  dcache instantiation only for invalid READDIRPLUS names.
- Replace the event-name strscpy_pad() calls with length-based memcpy()
  and explicit terminators in inotify and fanotify.

Tests on 23c62304dde2 in QEMU:
- Patch 1 alone: READDIR and READDIRPLUS getdents64() returned normally;
  the embedded-NUL entry was not instantiated, and FUSE_FORGET returned
  its unused lookup reference.
- Patch 2 alone: the FUSE READDIRPLUS/inotify reproducer returned the
  original qstr bytes after the NUL, with no stale slab bytes detected.
- Patch 3 alone: tmpfs FAN_REPORT_DFID_NAME creation and FAN_RENAME
  reported the expected names, NUL terminators, and zeroed alignment.
- All three together: the above FUSE and tmpfs regression probes passed.

Junyoung Jang (3):
  fuse: skip dcache instantiation for readdirplus names with embedded
    NUL
  inotify: copy full qstr length for event names
  fanotify: copy full qstr length for copied event names

 fs/fuse/readdir.c                    |  2 ++
 fs/notify/fanotify/fanotify.h        | 12 ++++++++++--
 fs/notify/inotify/inotify_fsnotify.c |  6 ++++--
 3 files changed, 16 insertions(+), 4 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d

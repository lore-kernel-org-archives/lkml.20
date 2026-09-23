Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B93D47BD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139380; cv=none; b=iFEcLPlRVwH1mlrmSl6z9SNh1m2wa/sxtmlQkifjf6OjVH8hO/+NCaoeecfAnrXGAmIf42wNHKCyGE5gFMKeTCPGIcDjmVaExwZVfy/F+fcr6jC3NZXJhq3Mfixd8NNgDuVU2WJF2pXynE9FRPp2qqTqrln+JbsaAG31ZL7hexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139380; c=relaxed/simple;
	bh=XiFSpop+KGxbUcWP8n6c2tXURjWzEe4pDG4YB8Ah2sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLM6v1hJQ3Psm9ZUwuhylnQ+glzo5S2pAv1PvD1hWNFzhCi4VJA8IjiOOCqccYiJBZ6wW/ourqlqUXActow4Tw1Haz7facpgnreFwgtDT8cefyGzOZNFpJtpRmmVbRnmnafp6DJqH1F5E3V+gawi5fsJefvaGSoV7Dlyh2gjUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sG7Tywyc; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sG7Tywyc"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b35611so273309b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139365; x=1790744165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1SOesHNHdnwoiL8FAjnK92erd43AfuOxzvjh4ET6B0=;
        b=sG7Tywycf0MvELghPdBzbwEFLfecjFUWGph5YbUJa6s+9FwZNMX7eCgzwjpDpjvzmG
         emRk0bbKxjzNI4HQINInPG9IDzdVKiXbAqXRpgBVA7OLRKTzgoA+OEY87nC6epTI+3My
         uGT7AWXVQTyCKEfFA7ljI+ZtDxByzJn3TyBsxwnVgnZ620YdnM/M3igGCXuIxHrKLeRU
         hyl6hhuHGGvwjUrS0n1/bVjNbNW0/BHn0PxX2O3NOqM/hoaD15W+Z8WhEYIiX4sOFPiU
         BH45yDwzuV8KefmvOfgvKnVxhsJ0XscfKHN7Yx6OnKKMoFmc7e6QPNOui8isXPoIN7Nh
         Uoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139365; x=1790744165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1SOesHNHdnwoiL8FAjnK92erd43AfuOxzvjh4ET6B0=;
        b=GiZfP103b0/zxXaVQ0OGF0n3NbA+qEwMa//uaepmGC4FaKMmyScOjyo1i2J2IJaSc6
         wKTKhz+pBQmE3B2m3HwNuMp9nNuxsHcb2mITO88AFQamgRXFjHvnxtuaQKZ7J5StpGfE
         IYPoeIFJjdjUwC3+NIhy0PU1bqIxJOZ8yEKtVD8VinTYNDVrnMxr2tYoF5HIV6J1vJj1
         1cyGqy+PmQoZLcGUysgkRv0pvnP50TTpum7MYcFbf/YibbRoxLGKvMFyyrtYVWMEhaij
         33OAWkaV08nQTOR5Yw4k82mfJwuMySOFHD2u0bdxQoanwzp/RxqE026flxssl/txO1Ob
         4TTA==
X-Forwarded-Encrypted: i=1; AKwUvBy3A75ugepE2kQuS/8oiRe5LqkD6LmtO4nWn/LYJ8f98ynSd4kfDcqAI+tO1wg+C4XNc5WtsVIDArs0kJM=@vger.kernel.org
X-Gm-Message-State: AFuF++l+MfnjyJj+plrloN6M9/B8Q/X5jqTfMD5RqR7gYShQgXGhhwv+
	epgmi8Gyh3K4Ty+EtPy7yEWSBOVljF96YRr3eVJIfPwadPP4NHs/wZWR
X-Gm-Gg: AYBFou1zTpTRXy/XZx0u6QmkUA/kKKhkPpS98Z/53OGo/R0v0d+M//d3NiDRbyVMThN
	4fwgkOB3ApLFAexcTZqvmOYxVE0QUq8tdnGct8CInMfL2i8rY9NlSqSq0F5ZVL0iCovdlr8aFe0
	lq7oydpCeYSt+XhCs/0JD4eVE6B/eF53r5qq87n1XGl2fiIqaxaKBz+JwQDVLPVKqIN5PfAOeKc
	5bSlActTHo+V4Ib0gLiUBELlrR7JzJLPE+/Apow8JH8nPpq9tvLeDsxw0XK2TqYbvLE1iYPQ+bu
	3gzlyFcQeWwBwCj4+ju2bDsxiH2LlcmWRCH6/YsL4M2+RI8YtkhEuwDd+ivazhpgKhAhA5D+wuv
	mDe6snhFhvlk1NSJroEGw9BkNOF2Irmpd1Ex5BDuNbjsXaduP34p1lZvwfyubdABMpjWOvfIc0X
	1+xAibp8/Bpui5qmgsVbS9mlx10MHgzWEg7cOBCzXpGaNy8Ikt4ENbnTg9dOLvUy0fFt9c5ehWS
	V30
X-Received: by 2002:a05:6a00:430d:b0:874:706d:9631 with SMTP id d2e1a72fcca58-87d1c9b91b2mr1467960b3a.35.1790139363769;
        Tue, 22 Sep 2026 21:56:03 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:03 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v5 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 23 Sep 2026 11:55:48 +0700
Message-ID: <20260923045551.229259-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out, and the one where a GSP log is
worth having.

Patch 1 gives the module data a DebugfsData that owns the debugfs root,
replacing the static that held it. Patch 2 adds a gsp_keep_logs module
parameter: when it is set, whatever the GSP wrote is copied into that
same DebugfsData and exposed under a "retained" directory until the
module is unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v4:
 - no longer reset the pointer to the module data; debugfs_data() takes
   the bound device and returns a reference tied to it, rather than an
   Option<&'static> (Gary Guo)
 - set the pointer from the module initializer, through the binding
   pin-init makes for the initialized _debugfs field (Gary Guo). v4 said
   pin-init gives no access to a pinned field there, which was wrong
 - rebase onto current drm-rust-next
 - reword comments that no longer matched the code, and use the current
   Assisted-by format

Testing was done on top of drm-rust-next with the TLV firmware images
installed. On a GB203:

  - with gsp_keep_logs unset, no "retained" directory is created and the
    entries disappear on unbind, as before;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the contents the live entries had, all 64 KiB of each readable;
  - binding the GPU again recreates the live entries without disturbing
    the copies, and unbinding it a second time replaces them, leaving
    exactly one set behind;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL, the driver stays unbound, and the logs of that attempt are
    still readable;
  - with a failure injected into the Registration instead, the module
    fails to load, leaves no debugfs directory behind, and the next load
    comes up with its directory intact;
  - the copies are released on module unload, and repeated load/unload
    cycles leave nothing behind.

The parameter does need a value: the Rust bool param ops do not set
KERNEL_PARAM_OPS_FL_NOARG, so a bare gsp_keep_logs is refused, where the
C bool would have taken it.

No warnings, oopses or refcount complaints in dmesg throughout. Each
patch builds on its own; built and checked with CLIPPY=1 and
rustfmtcheck. checkpatch --strict is clean apart from the MAINTAINERS
note for the new file, which is already covered by the existing
"F: drivers/gpu/nova-core/" pattern.

v4: https://lore.kernel.org/nova-gpu/20260913183734.134307-1-vladazaharova2018@gmail.com/
v3: https://lore.kernel.org/nova-gpu/20260912071842.622696-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 247 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 100 ++++++++--
 4 files changed, 347 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: e1a9f41b896f0d57eb1165dd8a4c7446be6af638
-- 
2.55.0


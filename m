Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AC2560AA2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992770; cv=none; b=PcHGVB4dqnqyt1GCaXzmunUzAgdHL3zi1gWmsReEKiuzzGL6Ttzs4Lrk7kr5NqFtDBwRlF1egpXUEY04T0ciGKhfgVAjcwN6tn1pFMMUbbUQWFzebvrzvMn7/dDS2YFjTGfWJOjZU2736wdPxwUJG/F6hhRcWh0oCTg5H1E6sjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992770; c=relaxed/simple;
	bh=nWe/k9FLePuIunsVevsIKBcKBQYbwAkGez+IHcMgm+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reuf/kT44OjPTblih3H1kvO0XRR4Erl1Rj+YHmGOMj/iiBawQVWlMlTqsapOOcj3ddMjLKnOROl0p2r08Yau2NUTg0vXPCeUzY3Ut7Krws7aZ7bJxpBEnRP888lSXfx5HtuTywPbLyyZ2mo5IMLGn3//rHAHpQXLeiv6bqMAvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhuCpz5X; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhuCpz5X"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so2645609a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992767; x=1792597567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=nhuCpz5XIjmW/GLZGvdKdubNtUyJJ82xBIzkCHKSTtS+LjoOEMTwADMEwO+2mkz+dO
         nL/fJv0Ymh0AN/gZN88E24fpoXNE1F7c7dQEfls2fNnJ0IDTCVn9531t0nM4Ajk45qFg
         90k2gzUGge9gcI+ASLEfqM/71O9oGxvXgfrFJesDUIr7nDE8hOorBD/S9LH0CGoXZ/2E
         jsnxIljAVC2IxqEvzSqxsiIyAUYqpr1nCbZoBW1ZiVaSKbZPve52NQb0X8EbeLxamKG0
         R9m8OyIZb3nOxayXBH1HP0fTOSARkuEfTu8O2vBFQb999CuUvj0eRixpihemWTtr5kAU
         5DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992767; x=1792597567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=dCQwXe2pabVHWYJzIV8sWnIpTQ31LxTyDpHtMVDFDtYxxc/ssMOshKK7uCDiXUoSqI
         /RJACgWLWnKdXwxG7r86qn7z0nrccaFk8a7T+j4HDnVowGAFQ4u3DlMfSlZ4ujchqEDU
         4nZ4qmyvLqBnvFQYIKHeV2A3ZJnAyDmGjxgzaJNE4aKx6Q56Fmm/kYUo5nXUMeJuT/2/
         iZ5uYFQ1pjzNpEI51uMKXe4sICJeqXW6EJnskN8H63Cq5d3iidQVjKrxTehVaVeK9FkG
         73xqDWw0BxcKN10I1SHlg+e0LqCZ/6P53kM2tFt0psSCtRw1DRdRucy43ti9i9aFwC2M
         R6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxAQsPrxTUK/tI16lW57MTcRptatr+IqPcc4B+LBmEWhfGC8QEgh4ip7HURB9CAiKUmaYABSWcpk8+7osY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk4XPvD57Czj5ECqftwP081d5hRk99AhKfsWolWduUtv5v1OJK
	mBhM2GF2okhvbxSHxvYUmjaGh2lY2ZyqfJHjESXwRQRsDX6W6FnMMMQY
X-Gm-Gg: AYBFou1yFc2ZaWukToHUxkyJN1rlMhl38ryGoOr5uB25Jn1uVZ0LF9EeBYIP3+wWmGq
	h81YbEd4sAR+a01mR7Cts89rf9bXEMxVuWI/lTT9lONHM3bvdSW4wq/t64EXAi3BY1d31IJ3xaP
	w/C3miuY49tuS0NOkZSlyAoOV4zSRQ9/HS+Vd2XOy6TrSJC7uNhe8x4bvTUr9MPGxwyvI6dts9b
	4mKj44kyEURd0K3+TZmZK4anyWpkO6J/fj97By9x4G1pBtQkIdTmo+cHRCc3jMvpXFldLcM6XRi
	jv1+5XTdwOBUOsbBT4T3Ypl6q17wT8Q0tXvZ6E2mBvlymGwyRDca2APQaA2y17xIIEXAj+o7rjb
	265ktZ6cKhtmA+798owizAMyHLZ9ZgGHbzyLo1ZXeHO9HoaBjygL+B7OoYuCPTJAjyteON7/8AM
	WsBoSVx6bfwN06PvLmL9MXXKntr1Zfo3beOPMYujunznG//Gi+cq+5QCrVBBuVaq91d+FR4uZ3w
	/e2
X-Received: by 2002:a05:6a20:a11f:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e16bec52eamr10308336637.41.1791992766832;
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
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
Subject: [PATCH v6 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 14 Oct 2026 22:45:51 +0700
Message-ID: <20261014154554.231015-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but they are DMA
allocations of the device, so they go away as soon as the GPU is unbound,
and in particular when probe() fails. That is the case todo.rst asks
about, and the one where a GSP log is most useful.

Patch 1 moves the debugfs root into the module data. Patch 2 adds a
gsp_keep_logs module parameter: when it is set, whatever the GSP wrote
is copied into module memory and kept under a "retained" directory until
the module is unloaded. Patch 3 drops the completed item from todo.rst.

v5 got no comments, so this version only carries one fix and a rebase.

Changes since v5:
 - keep the "put" pointer read before the barrier in the copy, rather
   than the one the copy reads again, which is not ordered against the
   rest of the data (reported by the Sashiko review bot)
 - rebase onto current drm-rust-next

Tested on a GB203 on top of drm-rust-next with the TLV firmware images:

  - without gsp_keep_logs nothing changes, and no "retained" directory
    is created;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the full 64 KiB of each buffer after unbind;
  - binding again does not disturb the copies, and a second unbind
    replaces them, leaving one set;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load, leaves no debugfs directory behind, and the next load
    works;
  - repeated load/unload cycles leave nothing behind.

No warnings or oopses in dmesg. Each patch builds on its own, and the
series is clean with CLIPPY=1, rustfmtcheck and checkpatch --strict
(apart from the MAINTAINERS note for the new file, which is already
covered by "F: drivers/gpu/nova-core/").

v5: https://lore.kernel.org/nova-gpu/20260923045551.229259-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 255 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 101 ++++++++--
 4 files changed, 356 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 5a1b7121a6c4db6c0239d3ac3fd1c2bb33a40025
-- 
2.56.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F572E7162
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262380; cv=none; b=ujUuydr2Md2bYsdfbYAUhnQy4oqb8sNSLeyb+9OV53tsdG3e7yo7nKXDco/y+ehxtk6VWzuKdyp1pTMyoyiP6Z2jBdEM610UiCjFINpeXPvJa9yy00tBlMMESZw93nu8GUntaVPIJHj3u8DGlbwpCdHS0ncyA5Rb3k80Gkdpq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262380; c=relaxed/simple;
	bh=5BRAI2mjiiwdWYknuhUNvmuD+TSUC4TBhnYkEEFLqBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EKOUfaZMGuorfRPVPczhZknUk1bbJURdFQVDRFMIDRO5AcvfV7xquAGI8oKI2bWGW0jvDr2iNhDRJQfrwAW7M7xQSxB2CqQ1RVieUWWL6Gt4uEgQnRQHiZibEKqb88uFRPY0qUUIv+K65gzK3dZD6sxRIi6ObZENlyrHfcT2/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij9ahLo6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij9ahLo6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso1983435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262377; x=1791867177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qa1bAuBiY4hv5m/kE0JClTqqzG/RYABtp9TEFFjsc0o=;
        b=Ij9ahLo6x2BJ1ROPrE259VV2xlk+mJ9oIt4hm2duC5AVSc2LlHQ0ZSHHdb7KEFbFSn
         xR2h9UnSOCzemk16HeqHvZRnSAxzhtLyjcDthtjarBulGz+heSFHHDHrBUZ5HB5Nff5X
         a9M3r5iWmG2GYhUmRQv+/YYe9zAXp5tXteGNU8cvDOj2NFh1ytQDFMMxRgBeLL/y4Ai3
         KV5bKvbv8X1wupYfD6eA+FyrST+Xf4FLbG0nCCIep1DBZB2Qb7ibjKc8Vs3ehZ+9jfwH
         QIvOESk3zqqxRPwJX1p+5ldtois8yy37AGPwELLdRDQmLhmNFTYFWDFr1B+dqgTQWvGy
         qHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262377; x=1791867177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa1bAuBiY4hv5m/kE0JClTqqzG/RYABtp9TEFFjsc0o=;
        b=sDjRmfpiB9cvT8V9ENkmSy62vICwIsXuCgpbJeDZHOVSd5HPFbC/TDajHrg9vcLdYW
         /SVhq3Lhusu70K4nE6GVyrvt9VHZxXTI3HIUQ7gOcfqkBeEwVaPuhVNVtmAwzDi9Eqk+
         RTdh+Ujpqh0Nr6ghlX/IcQxThGjNsuz+XUcfN0iPb0U2QuWO7r9Sh2z3DpRXrLnK27mb
         +BB7pwaac2sXrM5RRieCw533eQKKqhIhDbL7s+w5EQ8jcBKaXEQe1T4LsyBWWfdYAla5
         xzMQw7ikZNj92Hq/RXH6BgLZBi8k9LnqqyWdn304hJk37EeiM0zt/ujXAZIYqreK8axS
         u+PA==
X-Forwarded-Encrypted: i=1; AKwUvBxFM2aBejxijb7cBjKyAYhqkP4G/m8FZIQFXF4wwBN7tZrU9a7Fc/ucxvomRtcXKbMKK/hjNl1X83hZQjo=@vger.kernel.org
X-Gm-Message-State: AFuF++lNZD/tHIZojN18bzVhzXFsmnG7hSMTb2Xpz4vnsTpi3lDg1fTa
	/dWvWwxm5+DPSuOFu0pYw+m9vfXHcX57N0tu7dths8pcxfGDQVVowSxO
X-Gm-Gg: AYBFou12lVpUBoDa02RNiDJW6iiLQAzv+kEIaP90BgValYywrKqcBgTN16bSE+7kRbh
	bi6qsguzcZzMer0e42BkJJvdxGQ4f80vgcHkr9+nELjTW9RcSGW3Uco717OW1adRzczXUzWfBie
	hDQdr1DqTRTw0T/PVTAwmMF+IwpLQ2Wgm0+KkIz1N6FPMdqhBHla2De4IGTFFlq6THkraRgX0X+
	jHmfRZdoe+lfhqM6SPEXu5KLuxfgpPxxhAFXk8M+Mh1YJ0RATlK9+qURDNdc3m1RXpmd3uuOI9R
	8AdgMtS/0n4k3gjbnL1FfDfcp9NXo8xbm2GtkfjU1ZtXPG1j7uR6kUdN87Tv4DpHTuemitm8MVY
	2lKmR6CvbDurRkGE82+mAehI0chB30pcQP48QbaNm1BzQ62KI+pHuyyrpb5HeGqK6P80qIKUbBN
	eJeSb2BL2CEyBYhVvQwxtieiajAlrsLrH1Kzg6gVbs6+Y2yaHw+RCg7Mk8MK9i2uB4q/AxChXAZ
	5z06ecBo6Ijq9THoLxNlfZ+L17qSIxsRsqLjxej/LjRpFWjSVTHZ2Ye/EbRdQVwMCbMZSNybJs/
	NDCTSjRb8NqOjLirg8Q2t0imB6ySwWx2LAQ=
X-Received: by 2002:a05:600d:82c1:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a17b536decmr4681335e9.7.1791262377155;
        Mon, 05 Oct 2026 21:52:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm72322225e9.11.2026.10.05.21.52.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:52:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Date: Tue,  6 Oct 2026 06:51:34 +0200
Message-Id: <20261006045136.5911-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
slots from a per task stack of 16 entries. multi_v7_defconfig enables
both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
affected.

Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
end of the page. On 32-bit ARM this clears the wrong fixmap entry and
the mount dies with a BUG a few calls later. syzkaller found it on a
multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
first mount.

Patch 2: ntfs_check_logfile() maps the same page once per loop
iteration and unmaps it once, so a mount leaves three entries on the
stack of the mounting task. After one mount the CPU it ran on can no
longer be taken offline. A process that mounts ntfs volumes five times
hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
mount(2) returns.

The two fixes are independent of each other. Patch 2 was tested on top
of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
are below the --- line of each patch.

Changes in v2:
- v1 carried an older copy of patch 2 as a second 2/2 by mistake. The
  patches are unchanged.

v1:
  https://lore.kernel.org/r/20261006043810.5393-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
  ntfs: fix kmap_local leak in ntfs_check_logfile()

 fs/ntfs/logfile.c | 11 ++++++-----
 fs/ntfs/super.c   | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 14 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0


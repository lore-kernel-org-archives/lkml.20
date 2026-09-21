Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C3405F7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996713; cv=none; b=YgEPh+hLNSH8xaoqH3+6HZu90iTrgWIGyeth/Zx3OfAfmLmIU9Kv4X4zgBd3Q3KGqH6dGD+p6Nq83QAMcuPR5tVFSii5XcJqXQSfgKnAtfs0smJ+MRxCzq3j9Xkun1r4OL4CrusFhv3y/+mO3bG8gJXGlEjDGF8n9cHTRba7TI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996713; c=relaxed/simple;
	bh=Xxmnfi7u48R7Kd9gTL3svJsqiPG9vLBLE0o+aliDHRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=duLHtdw2QRnwPzgUgDcsgSzjCN4XBsJHOl4JyXHvBbzgbyoxLQtbVQ/lppsPKiLalGXSia9GdBgb8EySsKwLV5Qi+T/FBVlODtHDRNXhdrm0LHwvdDv+wSadoicSiZoxd4M3GnJm6L2PfSoHeJw/hKXdlWYJpssFiy4WkJ8bB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1FsHeiK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1FsHeiK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1544335f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996709; x=1790601509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLXxJpO62SZg+/+LfN8p0j/MPIgPoypDyyyAsTbLZEk=;
        b=o1FsHeiKA3eysQI5GaHZUguMjYgveHjVuzvhw+tyi8bJy8e/p4g130mcBQ3zT3kMXO
         DMKiDh7R2iQ/nJ6bTSFiHdQCj9XDqEqftoIPxIzHgB73GcC1kPI5QTPh0vHyGCxt+2re
         E8CC/pHxAyXZ/sI2wka7qO8ORNjV9iG4mk5q0VU7hnXeVzAkoY4swvx2zzOf4rl+QAO/
         /8WR5uWrP0RKA8E1FseM9yuqEnHeFT+p+PzgDTgAExZbSFKhgVbs0OG665n5g+40S37u
         oPv+qDVEQNZZySj02W44gZT3Xevs0HqHAL4KTQQrjyxsOFy8tM7dYEIvOfFPuRVlVhJX
         +ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996709; x=1790601509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLXxJpO62SZg+/+LfN8p0j/MPIgPoypDyyyAsTbLZEk=;
        b=0/dDixpTJzGHKVkKjGaFHRP0D4m4nXA20DO9p6dXv9RBqjoMIrTU4qKby/E646sGL5
         HmYDvFt3B/50r/9oC9T7hJOAmTnk1fPlhqR2ZHc03bxX8NMTWqUNgQ2F9u9AoDvf20O0
         /17vxYNwadg1Ii3ydDvluTRc/bSh1TkZyyf90N8A+Dryo0acBQD3JcFRYpZoS8duOyQs
         ecK2YFJEuY1EfPWCutQPrUYNvIcfIZMgd5jUQeOgo2PRs0rQZwmt5hyt0uYUjUi7BeoY
         oJrxV1qea78HzT09/r7pcSPBybhgieQzAT7OfPKBXzIgMKlf0zvk+AZYsWcHPvYXI+QB
         mCnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7jQ3jRmgEQXxZ1DGtW6++o/U+qfTy2Pwo3zltwF2vq2UJVVSFaFMIeesnlOFB1jpmmYm2Y1B8XrUXrkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++miSTkk62TRjUWDifpvf0F6aGSO1lsaLLVsXCvzXQ4nS3kiGxQ/
	Ms5c+hSNjHGX8Dr/mL/c1w+VhAbDL3Q1FkCQvXEZET/Pvr5qraBQGU+B
X-Gm-Gg: AYBFou0rASE7vLoU7uyPxEt0SWgzNzoKKChq5NmC4kHBANUg8GHwte/B+OOcJHXDVCj
	D5kJk5jLG7PlzQNodGTys2mfxA6cDLws+NbV9qjPOaVweEIQq3T/45PmKA5NFeVyInCt0A33jrW
	5dPO1vgTcQ3uXO+fCByztCIIXw5KnjKbc+G+iahkbHgAIFHdcsjVjPzdGQzmvw7pli7tAMVOsu2
	sZgYIh+TXFkadWUoQdgEJbTFNnW5PCbesFehi33slrNQoqika5t5cWL1e4spKtg1m6xRNyTj9rN
	IXoUZp9OS6SJXgWy0zheAEHNw6dzGIlJY0SOTur4s1wS8nDROWtqQIGT5Arb6qkkhYvGnS5s2XI
	MdfC/46W+lI5LnWBiFQ2loR/c9FcoW9z2DE1IWTQEp2IfZAzacCkD78JDki5ZYkxTI6exgcpo5F
	dhkWJNcHX5IEvfEIjop202HPnXVtXsbz8uGOZ1FNML7f+RjB/oKs2e/AeXxs4Hts0lpkiqtXbiZ
	FhJywFBKjH1xe9HD1gpARe8GEmtCqX2nA==
X-Received: by 2002:a05:6000:2302:b0:485:af9d:cd1f with SMTP id ffacd0b85a97d-4871e37b88dmr14650398f8f.51.1789996709116;
        Mon, 21 Sep 2026 06:18:29 -0700 (PDT)
Received: from osama.. ([156.223.80.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm22198797f8f.11.2026.09.21.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:18:28 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v7 0/3] drm/panel: Use managed helpers in DSI panels
Date: Mon, 21 Sep 2026 15:17:54 +0200
Message-ID: <cover.1789994813.git.osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts straightforward DRM panel drivers to the managed
MIPI DSI attach and panel add helpers, dropping the corresponding manual
detach/remove calls from remove paths. Split by driver family/vendor to
keep the changes reviewable.

Patches 2, 4 and 5 of v4 (Samsung, Himax/Ilitek and display vendor
panels) are already in drm-misc-next and are not resent here.


v7:
- Changelog is trimmed. No code changes
  from v6.
v6:
- Drop panel-simple and panel-dsi-cm: both run extra teardown after
  drm_panel_remove(), which devm would reorder.
- khadas-ts050, tdo-tl070wsh30: fix build break.
v5:
- nt35510: keep manual attach/detach; remove() powers off after it. (Luca)
- panel-simple: split into its own patch. (Luca)
v4:
- Use devm_drm_panel_add() instead of drm_panel_add().

Osama Abdelkader (3):
  drm/panel: Use devm_mipi_dsi_attach in BOE panels
  drm/panel: Use managed helpers in Novatek and Raydium panels
  drm/panel: Use managed helpers in assorted panels

 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 20 +++--------
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 19 +++--------
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 23 ++-----------
 drivers/gpu/drm/panel/panel-boe-td4320.c      | 23 +++----------
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 24 ++++----------
 .../gpu/drm/panel/panel-boe-tv101wum-ll2.c    | 23 +++----------
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 24 ++------------
 .../gpu/drm/panel/panel-chipwealth-ch13726a.c | 20 +++--------
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     | 20 +++--------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 20 +++--------
 .../gpu/drm/panel/panel-feixin-k101-im2ba02.c | 19 +++--------
 .../drm/panel/panel-feiyang-fy07024di26a30d.c | 19 +++--------
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c  | 24 +++-----------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 33 +++----------------
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 19 +++--------
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 23 +++----------
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 30 ++---------------
 drivers/gpu/drm/panel/panel-lg-sw43408.c      | 22 ++++---------
 .../gpu/drm/panel/panel-lincolntech-lcd197.c  | 20 ++---------
 drivers/gpu/drm/panel/panel-lxd-m9189a.c      | 24 +++-----------
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 16 +++------
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 22 +++----------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 13 +++++---
 drivers/gpu/drm/panel/panel-novatek-nt35532.c | 23 +++----------
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 19 ++---------
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 25 ++------------
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 21 +++---------
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 23 +++----------
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 23 +++----------
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 16 +++------
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 23 +++----------
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 31 ++---------------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 22 ++-----------
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 23 +++----------
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 16 +++------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 20 +++--------
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  | 19 +++--------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 13 +++-----
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++-----
 .../drm/panel/panel-startek-kd070fhfid015.c   | 24 +++-----------
 drivers/gpu/drm/panel/panel-summit.c          | 15 +++------
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 25 ++------------
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  | 19 +++--------
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 20 +++--------
 44 files changed, 183 insertions(+), 751 deletions(-)

-- 
2.43.0


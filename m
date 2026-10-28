Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205975;
	b=xOCdtaVlwtTxEdSa2p5Un8cDzDU6X/29+FWv4exRVif0l4UKF5KFZwWjsgKocNGFsUn7
	 4oAMpKxEM0/HFTsM1/qVvcQw3e6RQUdR/biIS2VI0CGZlDN9TZIqNAu2o8nqhaDqrcadh
	 XWIn9Q8OCwm0WdSHdFOt3Rvl1CtVgTLrKEhS37TW9pCBJ7dHAJr/oU7Ae3zUAe1jvCoHv
	 pq1Pvz/Xs/M12BizIb8wcQMHOc1EWlf4T9X9cNTLK14m08/yRwJP3WbjJfi3rUFi6FZ0L
	 J6CECry+a1WJBP9LNn05J6G7W2O3u8Mcgt12GnE/9qmV1hKE4Iru9+GXydlsB08nYNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OLaMbaoim8E2HPY7c41mzNoySwNHbusfNb0WniQFAAE=;
	b=NE7TqmnZqv9kSMlw0TvOrOMYNTm2/7OHn+2ZhVhZXbRVcO4imybJyp6HIThHq9/sO4xo
	 K+1zfA3Cxom6c6yEWKeYKtmKm1V2PDiawPkvHF4FbK64Xf90oWD4xTMyhK94UtHDQ+FMn
	 fHeQD0YXowe71srvaz8gpDbXo1oiMLLnvoaszYm05x8ZjiU9NBf0SSMhjI+QeCfA5uFAA
	 qm9Jpj1iZy40ocvNBbJuorH4vwA8BPk7zQem00Fv92cyJcZZNAUiXsc+Qu4hfgWEwNzaG
	 qv9GaUEC/rNdnnUiAK5gIaL8aI+BVvUUvjBrZt6CdI81KyG4AxrscrYzUv8w0q90gJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcV8eKk2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA7606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBA7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcV8eKk2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso2245967eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205974; x=1793810774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLaMbaoim8E2HPY7c41mzNoySwNHbusfNb0WniQFAAE=;
        b=FcV8eKk2i4Aoajnujzdjo/B988+bFT4O7Dm6IHFU3dzdZ6ORZ1OP6t+nywsvmKfunG
         f95oRD+9UF+1kZZeAYlZEILQjr5b64GDslTWbWhsWquY/0pjqzFRy9f2LP+dsIjtT7fQ
         d2RQohHx6ERX7Qbftz9xaeIXPbLC7I85stD76cFh6gv1Hslf03EFnPlJHUa8sKb7QAul
         GpF7uaGxncL4L2EoMTl8TQn33ajy3Mv9i9n+KtbPBe9YEuXFVLSoIznLMcmxlJjLnVKM
         VNo5fS3h4J6FMExq6m59qRYraOiVEhOpo9NiEe8S88ajWM3H6NEBe7j0Ilc67kTLqSab
         ALFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205974; x=1793810774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLaMbaoim8E2HPY7c41mzNoySwNHbusfNb0WniQFAAE=;
        b=Tq1/i+AasU6p8SutxKE8ANP+TY5+PAzf7gd7dAOfMR4/QGdye2fCphcm2z5EftCLZa
         CpQ5bJgD9Ki66dznmxleiVYel4ay7bYHRT6uiPNkBkEKId9ZBtIK9ybYon3yLmSGAuCl
         TZWfBYLFflMVZMaI4bKP7qiHyiSesrmSqzjSWPU6ifch4oip+YKSkeKlIi3WPijWt/E2
         igL07od+u+Ao/xUqqPKoHvPgtwGVv9tfoggaev/Gug3/1dJGqc8p2tSrDb/FF1A5yFat
         FPeNPuA2Nhuqwf2Bm8Ah8h5Yd9Ire2iQELQEPjGxFZqqg5JBYYk1jm51DBMRnOcTMcOz
         jlHw==
X-Forwarded-Encrypted: i=1; AKwUvBw21gwrQtqx50Kbt6pF2u50mjw3WolA0LqaEKNfTL33SL75ttaAYuLXQUtg1q4OiwlF/y9HcuPajejzA1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi5VLODm86409CcVlryNwxDTHV/4RmeGr66DvosEyQivLp46eg
	mF66s9eskPW79zVWVQseY2tYYYNnLaAOgOZPQZqFvuqrr3gZmjJ4z+FA
X-Gm-Gg: AYBFou0wBembejZO8Wau78GUYM0O80XkOhLe0V+JajJlXCMSJpJU2Fs7z3eGww6jGNZ
	BP2d/scsIYAXGJfOthM7InnyHZQFrRdvBDo0Em9Baznr4nFyip0+qq/s2rSi37YX0NyntZ385WD
	dOMDRThPKN5cLWa7pb/jmjXYLLzyEW4WfyxLshcuapN6NoDUvquVA/2YdAantGqspYeiCuiYvGT
	cu0ZX7AQL5AVKnJniDOxJ65WyAfwfYn6PZPFoJ4iwfjFThdtHaabEtc9CRhokLU4aeH4FT7hzzc
	NH3YQwSvVP7OnaeVRYTqxcu/gfTfH6yKjwlGAsbYwTvEv1CoZfP1L0DhJyUSq++Cg6gQCeL1gO7
	wd2ZV52unRNa6suWbi2O7zqoq1astycPl+qpqawedFSH58IOzVtWnF6bw9xjOkLTGGuoq6LZbjT
	w4+QvEbBzxtarognMBso3I1nORZBS8FXz8V2K6G3dCBBRWIefbKPwsThAb07l5rRMuXc7hyR38u
	85dE3cUfICwIx3P08zXqt4PFl8X4+NrYWsYSjqXe3mt8HjGsmyY1PES9bd/PMT0eTzOyajLj7EI
	gU15M+A6WweFx5WSctOOEO9YjVrS6TOEUZh6ZCIFifKscU1YVNFU+Q1JGIgD+3NclHECAzvuIJ8
	QMRN6gWisu02b4jRW
X-Received: by 2002:a05:693c:8803:20b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a2010a1bdmr4195933eec.25.1793205973745;
        Wed, 28 Oct 2026 09:46:13 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:13 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/vc4: dsi: Make failed reads visible and recoverable
Date: Wed, 28 Oct 2026 09:45:25 -0700
Message-ID: <20261028164539.3471833-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
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

DSI reads on the Raspberry Pi 4 (vc4, DSI1) can fail in two ways that
the caller cannot handle:

- A peripheral that detected an error answers a read with an
  Acknowledge and Error Report. vc4 copies its two bytes into the
  caller's buffer and returns success, so the error bits look like
  register contents (patch 2). An HSTX timeout can be reported as a
  success as well (patch 1).

- After a read whose bus turnaround times out, every following DSI
  transfer times out as well, until the display is switched off and on
  (patch 5).

Patch 3 rate-limits the error interrupt messages, which patch 5 would
otherwise turn into an interrupt storm. Patch 4 serializes host
transfers against each other and against the bridge callbacks, so that
the recovery cannot reset the block under a transfer or while it is
being configured.

These patches do not prevent the timeouts. With video running, vc4
does not keep commands within vertical blanking, so a command can still
collide with active video and time out. That is a separate issue; this
series makes such failures visible to the caller and recoverable
without a modeset.

Tested on a Raspberry Pi 4 (DSI1, 2-lane video mode panel) with the
same changes backported to the Raspberry Pi 6.18 kernel:

- 5 minutes of generic long writes from 4 extra threads with video
  running: 45000 writes, 582 timed out; each timeout was followed by a
  reset and restore, and the following writes went through. The DSI
  interrupt rate stayed at 147/s.
- 50 display off/on cycles with 2 writer threads running (the case that
  locked up v2): no lock-up, no warning.
- 250 display off/on cycles without extra traffic: 245 panel inits
  succeeded; 5 failed because the data lanes did not reach LP-11 after
  power-up, which this series does not address.

Reads were tested with these patches plus a change, not part of this
series, that stops video while a command is sent: 2000 of 2000 reads
returned the expected data.

Compile-tested on drm-misc-next (arm64 defconfig, DRM_VC4=m, W=1), each
patch on its own.

Changes in v4:
- Patch 1: new, set the transfer result before completing the transfer
  on an HSTX timeout (found while reviewing v3).
- Patch 2: add Dave's Reviewed-by (unchanged from v2 1/3).
- Patch 5: keep the interrupt handler out with disable_irq() around the
  reset instead of synchronize_irq() before it: an error interrupt could
  still run during the reset (Sashiko review).
- Link to v3: https://lore.kernel.org/r/20261026191618.9430-1-henryzhang62@gmail.com

Changes in v3:
- v2 is not safe; please don't apply it. Its recovery keeps the block
  usable after a timeout, and a peripheral that leaves the data lanes in
  a bad state then raises the "data lane 0 sequence" error interrupt
  tens of thousands of times per second. Printing each one starved a
  Raspberry Pi 4 until it had to be reset.
- Patch 3 (new in v3): rate-limit the error interrupt messages.
- Patch 4 (was v2 3/3): moved before the recovery, and also taken in the
  bridge pre_enable, enable, disable and post_disable callbacks.
- Patch 5 (was v2 2/3): only recover while the block is enabled, and mask
  the interrupts while the block and its AFE are in reset.
- Link to v2: https://lore.kernel.org/r/20261019174930.7237-1-henryzhang62@gmail.com

Changes in v2:
- Patch 2: restore the registers in the same order as pre_enable, and
  call synchronize_irq() before the reset (Sashiko review)
- Patch 3: new, serialize host transfers (Sashiko review)
- Link to v1: https://lore.kernel.org/r/20261012190249.3167-1-henryzhang62@gmail.com

Henry Zhang (5):
  drm/vc4: dsi: Set the transfer result before completing the transfer
  drm/vc4: dsi: Don't return error reports as read data
  drm/vc4: dsi: Rate-limit error interrupt messages
  drm/vc4: dsi: Serialize host transfers
  drm/vc4: dsi: Recover from a timed-out transfer

 drivers/gpu/drm/vc4/vc4_dsi.c | 180 ++++++++++++++++++++++++++++++++--
 1 file changed, 170 insertions(+), 10 deletions(-)


base-commit: 650385a0fd0ea6475a17d39a20ec90470c7a4c67
-- 
2.47.3


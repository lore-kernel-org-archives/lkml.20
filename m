Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509592;
	b=Xk5QJzJLFq/NzgUZkY/pl+bIsU2VzTxYJdIN7h+80cwhB9FVahpr6DazCKF59hSea1+/
	 ic1J97UuT0ri6m4StX+13Dqkm01YUpzaZacSNEI98rFH3NArk1LIV9m8tagC9ukLUUn65
	 hoVGGxekSvHgYcxNMRjKylZLqEmEgUjUI/pG7ERjqeP7JPBGzmG0hgwuDGkdK8lS3FdBE
	 cpEdmMGFSJ9Nz2ZqZZNBjrmAWrXYeasfu0FMmbKl+QQ1HBpu6uo/q1j9JLCS6fzsSAvUr
	 44IIi0Do5++lgaqIPcXCwKdf64zpnNfGzpdeVpC9CtGrefoeW1z7GAWLWchS/UfnMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Vej13u2jckucyDYWl6nd0WIjVU37Ltm8NkmLR/CfY0=;
	b=GGu4GVSbhuY1O4/BfN/zsN52geVUxpd1ly3HfnKIWmcYtRmrq5bV6MfFmDJ0WLJxYzat
	 DDj8BYyXr2ooS3lo7xnCTtAoATRdFczWMIBbbQlj7CFgNMEtXY3Vc1E8lJV4aCkUUKpeV
	 JTUlJVIT91DGTvUBAU8XJY8xSc4/xXlvqyvMKgZAxu7M4rnrjhJz3wl8klj5lGlzzF2ic
	 Sb32Gwds8TwhI4TdgNA9DgMhHh7ZXo+UbDKsZ7FiN54QP98FXEaEqwz10MUwVYkkyBFmi
	 4cWAiqLuCbfJczTrGnCtQw4Ie0vXrld+FtNUwpbqH6+tWPK5o6T5kNpYOSTGgWi4V6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=igpoyU3Q;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63572606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63572606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=igpoyU3Q
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so17585825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1792509590; x=1793114390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Vej13u2jckucyDYWl6nd0WIjVU37Ltm8NkmLR/CfY0=;
        b=igpoyU3Qq1gpF/a70YiuJkktl8f/IxyTiNi5402/II50CBDw/6SXMChBnnPd3lFFvv
         /Z6bHoPxnXMDuhyZokJq01Z0wJ1deB+INgK1/ryvWjom7N9F7tRDUwMHmajzmSUMSl6+
         83UybO98VeFg0w9YPCPBKK5NxS8DJUZFQT/xtq4eSRMiLYxVWkcwr17RsFutgAVf7zaQ
         A7fwJusArk9zDh1ZJ+lXcgBBipwbfzIiRJ1bnIR9fF9Mow1qWooIVzrc/zGv8DfrLq7Z
         3E2cxuH5q+Jb36wioWw0ccnqNvaM4FkpyhpY31bYreLJe3CU69cWVvd6VCDRSjpLVAfa
         Cfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509590; x=1793114390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Vej13u2jckucyDYWl6nd0WIjVU37Ltm8NkmLR/CfY0=;
        b=VL5otrAvRx7vHM3AiPB0A0AZKPldktO0s8XqYjtf8CUYYAu6sgv66Mb5jjYVzBtlJZ
         eG7bbEK95KlSxwPg1DFDAfFAQ+4ywkZikFBK0EyTSY++yM4OqQRnqpi+P+BdAg9mxkWW
         gZusO6X8nRKKkdnm+Q3VZq8IfVGgN89b6EDkWVJE89MP5d9k3yWLD8v0e9/NOKdknwgj
         TGjRTMRbrbLZ5Y/Rm66eh3sA6EWqorjUX0b1xcuAW4FvbVziVlrYdbnUtqx1Qwk1V5SO
         lhSQuVCLQD2q3Z6E7ZystmtV6sxNcT3srDBCceUQjPnvpd+0ipk283M0pjosh1inAsdS
         JV1w==
X-Forwarded-Encrypted: i=1; AKwUvBz+Or/NHjQlt/npl343FX19P2Xp9yM+3OsWbrBhiXL8iypwqmfCqTBIRlwfIZF09hdN7nZbuU70SZHWyUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzXzII4AJCGz2Wq/RPSx2CzUWzw+4a/za2sjXzq0WO0MeG/MQk
	F8XEf2XahZEsvraVMI6Pcn+lhsZtQUrfIAbljKnw9DPrZGnetcT+KkbR55eXfI8kePSuVyMTwWK
	ikxNOa9qSY2sm7dwTirxdoRR8qVVX1upcn3CrXaonZYSkeKa/m9Qh5NqhJtChfLIuSDXmzKG0Gv
	x7MMN7Jq0tjcPH/VU/tAsyp+fghNcubyBZOvh5Voss2glo+Xg+dUltF0uJm1E9+yZ7kaeqyGtbi
	smblKj2d+hTWoHNk6k=
X-Gm-Gg: AYBFou3Sx869Cv9z4FSLUqNNs90SDe5di6uFc/ajJnOYoDtZCVkUx38Uj6s6A8QPRPE
	qjEcnCtSQ4F+gTS91gtwADEPfSd88mAuQi6JNvM1tGFLy4gYknGh1gKIeH207oIzcXFyuCuoCHC
	TuAuR87oZ4Ym91eLn8b3GpKtzNqd7N3tk5weLCws2HZ4CfjGN1+cBjPveDdKUC14alwx5+sc7sF
	9qLJfMM36hNzHikj6GbZQs5FS0oJIh2qtKHA9OSj4GWJQw3cZWZAM51eJ+ZyUs7I8MlAmuXaH3L
	8DYlAkiLMwpf/OgjfjLRj05owiixR/d0KcCmqfMNGfLsmTpIOKegH5roK5jCiewGcw3VtU7EUE5
	mIUMgiJH5047CfCpGMMSXpv6rujueob6OAfhQri4etibRJUMIvXlXzlyulKDQG+xU6N8CtqaIAG
	rmqDDjsAKs+8Tus2z2EUuGrdZQDmezgn5cyCfGyHHvwq1GQ+AGnOGKXlIlaKaM2V8g4IpfaSZ2Y
	/UyHro=
X-Received: by 2002:a05:600c:4f47:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4a1e0db8f0amr235245705e9.3.1792509589526;
        Tue, 20 Oct 2026 08:19:49 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d80sm7410663f8f.26.2026.10.20.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:19:49 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/vc4: hdmi: enable scrambling before the TMDS clock starts
Date: Tue, 20 Oct 2026 16:19:45 +0100
Message-ID: <20261020151948.83459-1-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
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

HDMI 2.0 asks the source to set TMDS_Bit_Clock_Ratio in the sink while
the TMDS clock is stopped and to start the clock at least 1 ms later.
vc4 writes the bit, and enables the scrambler, at the end of the enable
sequence, long after the PHY has started, and clears it before the PHY
stops. A sink that samples the bit when the clock appears never locks
a 4K60 signal from a Raspberry Pi 5, while laptops that follow the
order work on the same sink.

Patch 3 is the fix. Patch 1 is needed on BCM2712, where phy_disable()
was an empty stub upstream, so the clock did not stop on disable; the
Raspberry Pi tree has carried this since 2024. Patch 2 fixes a
pre-existing race in the scrambling work cancel that the fix would
otherwise make easier to hit.

v1 was tested on a Raspberry Pi 5 running the Raspberry Pi 6.18 kernel
with the same change applied, against the sink that showed the
problem: plain enable at 4K60, 1080p60 to 4K60, 4K30 to 4K60, a sink
reset and a sink power cycle all lock with zero character errors. v2 is
compile-checked only so far; the hardware test will be repeated and
reported in this thread. Mainline was not booted on the Pi 5. The
BCM2711 path is unchanged except for the enable order; I have no Pi 4
at hand.

Changes in v2:
- Add Dom Cobley's vc6_hdmi_phy_disable() from the Raspberry Pi tree so
  the PHY really stops on BCM2712 before the SCDC bits are cleared.
- Cancel the scrambling work unconditionally with
  cancel_delayed_work_sync(); the pending check skipped a running
  instance that then re-armed itself.
- Enable the controller scrambler at the same point as the sink bits,
  before the PHY starts, instead of leaving it at the end of the enable
  sequence with the sink descrambler already on.
- Drop the extra usleep_range(); drm_scdc_set_high_tmds_clock_ratio()
  already waits.
- v1: https://lore.kernel.org/lkml/20261020134941.631907-1-lucas.tanure@neat.no/

Dom Cobley (1):
  drm/vc4: Implement vc6_hdmi_phy_disable

Lucas Tanure (2):
  drm/vc4: hdmi: always cancel the scrambling work synchronously
  drm/vc4: hdmi: enable scrambling before the TMDS clock starts

 drivers/gpu/drm/vc4/vc4_hdmi.c     | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.56.0


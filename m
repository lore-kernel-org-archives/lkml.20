Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19942D592C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249027; cv=none; b=t8qHrOFXgRtV13uxLw1t05EDDurtA1pCaStRoDTNQHt+kEIYRB3T4I4wvafUV+xPzaOgyr1WUD1BA6rRhn/SvdCs3cyXwfQHG1TFjI91ZC3idvdi6DfuUWWoW2OAvyPHKu8qwQkrdBwa7RHvM7TxQ1fJyCLOzUF810ZBTwgcSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249027; c=relaxed/simple;
	bh=V0m//0BePu9K8bXVScZ93KCgFEBxnZwn/T+75hu0Jt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0d3rfsaxEf0mLeVS0z0b6cHkqA0QK7Cc87kxdeRUENovIm8nKd7VLSP+1IZFbCfJX9kwlhh+HTsk2EpfZ/8j5PzX1ovtFvL1SNSkgUPwLlQ0CPZZSmUy9I20CWP+Q8ms0T8aoUTWo3y/KRFgzvbgcmEwYenRS3BdW2+J4BvfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCoswlss; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCoswlss"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1057376a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249023; x=1790853823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvO1Qkk2Cc/fKI8T9OqiFoCZ+Xfk2+7b9EWzAp6ijiU=;
        b=VCoswlssL+w0LmTtzhPJpQNiRzwxEoOwi+NGUhr0u5j3kH+wfMjoa3VXTqZzqeoYwE
         ef+U73DTnaCwDHucnOx0Vmh+TUWdVaqTPCvYj/h1vz2Q/27pjzAmSxt6FPl6Ilmseoda
         3+ki4ShunUnPZEAyGpOrhCY4EzIWCy03O+3o0G5hZakCLUfJxWAd3GxyXcc4ooV549Lk
         HQgHO0PPhhYhQg0Z7PguZyyHwLEL/4bw5RGfT2kf73JA65EzXdSMrbVUSjh3k6tx0/f7
         S+TfPrK/KFwUAW3EWmGasfAPyJuwCMao5wolCm8p1IkegdZTo17R7lo41hpRVZTwMthy
         zkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249023; x=1790853823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvO1Qkk2Cc/fKI8T9OqiFoCZ+Xfk2+7b9EWzAp6ijiU=;
        b=GBRo5opE6QrUi/eg9cxbWH/kw/aEgiuLemBcENkuRAiCmaz6WxI1u/4fWajwDNE4GC
         vBDaXEs7PTOWjD2Y9q4hGcKasHkez2r1WeelRAcJxiU3wzs5gVFy3XJaeK9mMcbkSqhr
         T8e1geOgq4L3OdNvVFn2y/3RJbdEETyWo0X53jzo8l4h3EKA6keHmZti96rSSS4zvFEq
         dhaBpJJ/Kyl4Gpq1QhJgZX+VQB61/NzMlASLEJ48Oxc78J6PsNhx5245CEo+LsmcINje
         71d9A0sfxGTJSE17sCXfbJBsfo0FMhiAb8c4vUTM8MhGamPOV22kEtvl5Ceh/6UJbUzw
         dyUA==
X-Forwarded-Encrypted: i=1; AKwUvBw0E+JSQU5cAKaYkqzL0yZ2Ck/GmFr7Ma+lvUoFwHkR8MQtcGVypzTQTUb5/I+EuOS/2p8um3bkXPJGxM8=@vger.kernel.org
X-Gm-Message-State: AFuF++lcBlkY3hw0jxUvOCJtkzlWAVPbwASiVfLCV7Bwm5NL7kE0p72+
	PpC4mJR3Hz9AcxmMx26yUNQoJyMFZiWBKZilD6Nk26z3q70NZw++rGiu
X-Gm-Gg: AYBFou07TFPAnikKf676iI43QroxdeaeUAPy3G8rKfofHd2JeNJIVdl9NKC4IR8K23c
	8XMdwGA1rDDyf55JT0xFbNTiIiJ+n2flhDZ6sV1s8NGV/kMOMVZgda1wTt/0+DhpFHCp5NfHrjD
	v1ShoUb1UUL3JgZtsgwsYGctkucNxENxSre4iFi5EMdghyGOEMZ+XZzOMQaGjTWIYJfe8viaQHs
	+spiL723MlOBidjQvhzuLNGTkmsO1K//EvPHfJSbBboGzwbQwh8T7m2uAnyYO7JoYnmjZ7IG5kc
	GW2U0VYDJd1zX6relA6Bb6+AsjeC17OhrYUZJf7lh7e9pbfQAYt4dG2fv/Kh2syPZSad3l6HQaC
	34FYtmDYtxYqoBA4VO7cH6Uc7ljwx3gVRFPH/jyviyqEtbqZ7S4MaDAfK5FfZczwCw3nnkw320r
	kciSC2bPGszJ9BE7WHcyw9XqqWySXusatWoroKNgGzIOV8TARQCIumTkOe7ACKeCkX
X-Received: by 2002:a17:90b:524c:b0:39e:1310:cb36 with SMTP id 98e67ed59e1d1-3a0985bce17mr1718584a91.20.1790249018445;
        Thu, 24 Sep 2026 04:23:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 0/3] spi: balance remove-path teardown in three drivers
Date: Thu, 24 Sep 2026 19:23:26 +0800
Message-ID: <20260924112329.1566051-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several SPI drivers establish resources or runtime-PM state during probe
but do not perform the matching teardown after successful removal.

Add the missing unmap or runtime-PM cleanup in each driver's remove path,
following the cleanup already used by its probe error paths.

Guangshuo Li (3):
  spi: fsl: unmap immr_spi_cs on remove
  spi: rockchip-sfc: Clean up runtime PM on remove
  spi: bcm63xx-hsspi: Disable runtime PM on remove

 drivers/spi/spi-bcm63xx-hsspi.c | 1 +
 drivers/spi/spi-fsl-spi.c       | 8 ++++++++
 drivers/spi/spi-rockchip-sfc.c  | 6 ++++++
 3 files changed, 15 insertions(+)


base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


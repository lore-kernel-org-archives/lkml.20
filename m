Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528793;
	b=yqRllIT0WT6Xh2FjTIUSJEqrvK6bo9yb6mb5pV8pc9/WZay7U3exTsDWFP5QsOfcPTzr
	 6HVjafcwpQETD1HiWJRolmHE0tEkCCM0DliAyvhx2hcJkAxliceNjZ6kQdR0ngCEthix3
	 twjVJz28pzYwEUT13ajW0r9/hFXjIJL/4oi9ThY3zR1z/4Q6vKFjt40Vy8NSKZxQ5rOyS
	 buIkw+Lt6KXuZ0xJJxnq2F/95F1ZSQ9gTHvdiZtvGmE6MG2kprHJABxqTc89pKbVVKGyv
	 n4+ocoPqH08ZJ9gZZM3Mv4YENnunh2sBbWoJLvDfQHBLg12rVSdnV0we+0HAoM82/pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
	b=ktoa/+AoMZdrs4v0nhlBdJaq5qKZYmn0anmNzaRvIZVmDm+6FYKGU5w6a07SnCvAtV2D
	 bp38vQ0hGzi91BjbPJjTqmmuIK74S+rTjU6hM1wS+/qqmBgBSCwjrSIHJ2UEPOfIRuzRy
	 mMc/JGOwq0mHyBHToQc1u0WSk9zVIoOkr1N3tALrgHtvWDm3XlG9wOHNLwKMRIXrvwYad
	 GwAohe0/vPoU+ZKNevnq9cz+5uWp+LHe6pSaZxvfB0v1nszWPXFLydnhKYFK6OiFB8wSJ
	 GB+gWf4+NoHcF79Pk/BaajrfLkvYWNngZe6UKlRGYr6Z4mS3SBZAHd6uVgBQOL8cMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuXLBJj4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDC606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECDC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuXLBJj4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22855e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528791; x=1793133591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
        b=ZuXLBJj46sgMBE9x8Gk6ifw6twa5jmlOsicpDnX4Av6p/OAg1Djc1Cwkqo8rE0t2Qh
         H++gYz0eyNkuK/ORdEUtey8C/fWfjw2QdZ5uzeLEGVQarM8A/JLh6A4/ORdUj1GfkaQ9
         bg5XZtpzzXKqA5tQj4qOHE18O0PedfnhhfzPdssVvRioJa8pZ+HBeaYTEPU+IYoUs0je
         WM2i4WRHjPHv17vmr13Y2KjIrPzLAx1b7BRT8fBns/c9UcyLhUP6Z52VAxQVAYj0QdZ6
         w7KrTJV+V2b2ShFC6jPAPpoD30u+uj+xo3fKxkYsvDhm/5ofdakfjntqfeBZqo0oKhaX
         9VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528791; x=1793133591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69ZsWlJYKqcYYqFI8rMOizWSH2P8Ln8H/nLJiISKOi8=;
        b=GsyNm8cwv695s0lP114q9Bnogd1GJ3egT07eumHjiSSJfw6Lzo+HnACKWldKjSJr5P
         hyzCgRiDjDss0h6m/lpVwuMoHUUamcOK1PEqkCe9V9pCzAO0JOySKox396+sCJOndQfu
         uViRk+gJJwUrAwEA0vixPQlTRgMZ6jfA9P2FGE0GRsTSfdE46WpCCPhwJxuj3LtGfg/g
         iry5fKZEUkCWX+ygND3+YPuRclBZoWhpeDGT+iejlp8XFKeKKzp02hEvY/e2aTKSY9N2
         JYVkeSZkNNQ0MsPdIX1ems8z7Gsn8SrhEZo7gDnU1xwfmCC4AjgC/Eem4QV1h0VZ/1PF
         1naA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ6lpv381Bel44p29aniJKrVYT1WCjl8E10txBKRS8WBwm1tdbk7qw9hkaZpsyDrMB6kc9RkInm6ebQyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWwZ1ufh1QjcXPY5E9UXooQnjZW4BiXAvSdIKE0MPx4ljUoBa1
	+iUMYVdvpbqOCxu4b31lwakPPiGwiJLuOPimO4SmNycBzMI4MPNlxsnt
X-Gm-Gg: AYBFou11NAmY7dJCCxxvkGklZKf12L2TCcNqXtphgrayrSzQwn7RngBcMemDzQQw93z
	vW8G+GhxOwmgLeEGtBNfUVVVcz/wi6+gzifrLfYD6T0D0J4GSfhDQ+nWWViQeZfn1F9DUzXyJZ6
	lWEdOuXmGcOXG5iznOjF5813lEaoWPY8czRke1fuD8Tt+M4o1XdKFsHNuCj1cxciRfVW4IHa2jD
	+i+NMRaZkM+Ydc0yGaQOxzgUgg3VqGARBBGmL+NCIhrQdjcb3M3TM0gW6ZSdZCB3WXWDijCUPWG
	pkVpnxPktG/fxwOfFoR1d0lDeA9iK2sJLc5hg0l4UWSFKL5Nw2HLQTuhph2RLh7qWm1WJY+dZKz
	IWSyrGHRGqYWR4qe1spnnIxnk+ouznebvUDlbZ76jvVyFMT6sKh460dWUZRWKJ5s3kkqasbRqY3
	YpaBUFOAUUkRUN4QMGenSSlbKKUsIjjq5vJGAoHWzE93s9r9LRo7xAjtOMgQvsgoEzEsjrUIcpE
	A==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1dbdf1a18mr238063555e9.2.1792528791378;
        Tue, 20 Oct 2026 13:39:51 -0700 (PDT)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:691:6627:6830:68b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm90720295e9.6.2026.10.20.13.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:39:50 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v1] wifi: brcmfmac: skip bus_reset cancel when the work was never initialized
Date: Tue, 20 Oct 2026 21:39:13 +0100
Message-ID: <20261020203916.381637-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

When the firmware request fails, brcmf_pcie_setup() releases its own
driver, which runs brcmf_pcie_remove() -> brcmf_bus_cancel_reset_work().
At that point brcmf_alloc() has set bus_if->drvr, but brcmf_attach() has
not run, so drvr->bus_reset was never INIT_WORK()ed. cancel_work_sync()
on the zeroed work then trips WARN_ON(!work->func) in __flush_work():

  brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac43752-pcie.bin failed with error -2
  brcmfmac 0000:01:00.0: brcmf_pcie_setup: Dongle setup failed
  ieee80211 phy0: brcmf_fw_crashed: Firmware has halted or crashed
  WARNING: kernel/workqueue.c:4409 at __flush_work+0x318/0x338, CPU#0: kworker/0:1/10
  Workqueue: events request_firmware_work_func
  Call trace:
   __flush_work+0x318/0x338 (P)
   cancel_work_sync+0x6c/0x90
   brcmf_bus_cancel_reset_work+0x3c/0x54 [brcmfmac]
   brcmf_pcie_remove+0x5c/0x124 [brcmfmac]
   pci_device_remove+0x44/0xd8
   device_remove+0x4c/0x80
   device_release_driver_internal+0x1d0/0x22c
   device_release_driver+0x18/0x24
   brcmf_pcie_setup+0x58/0xc94 [brcmfmac]
   brcmf_fw_request_done+0x14c/0x198 [brcmfmac]
   request_firmware_work_func+0x5c/0xe8

brcmf_bus_schedule_reset() already gates on bus_reset.func for this
reason. Apply the same check on the cancel side.

Reproduced on a BCM43752 PCIe module with the firmware file absent.
With this change the same failure path completes without the warning.

Fixes: 43b25879f004 ("wifi: brcmfmac: drain bus_reset work on device removal")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 92ec269f43b2..a3d662348711 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1186,7 +1186,7 @@ void brcmf_bus_cancel_reset_work(struct brcmf_bus *bus_if)
 {
 	mutex_lock(&bus_if->bus_reset_lock);
 	bus_if->removing = true;
-	if (bus_if->drvr)
+	if (bus_if->drvr && bus_if->drvr->bus_reset.func)
 		cancel_work_sync(&bus_if->drvr->bus_reset);
 	mutex_unlock(&bus_if->bus_reset_lock);
 }
-- 
2.53.0


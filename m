Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D9444AB60
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982639; cv=none; b=DvaRe05FzyMxcBnNE4J3/SHJYinIMmCm8fZKdHHfxd28aTnSXYEGOoROlH3YhEzvmPXD4zOUmjm2quLXS16rnnl23+6qR66rqzEoX1Ko+rHwNR9TKvMoFROo7SXjPtA9yiqtRsMOciLvFK7R/3ZqydnQupk9lSN28p7URlhgNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982639; c=relaxed/simple;
	bh=jLiVYCzU9XqV+htTCVnuYwKsngIjE+6DEv8LgLWR4Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAqLeJGlekxXt/rmzSRhH1moa8+OjABcffFXWNHJdcXqbcMl6yvlCLwU9D+knLMXGAXgYtWVHZqqwhVOCd7lWsU9b8jx5iZpV72p8/y8lkU4iVhljLVL8KECWWIsctweoNVB0Yp60Wzxii5Ni86Ew6fWDNZE+eYcLG0db29Nzo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rL07sUjW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rL07sUjW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so12299f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790982636; x=1791587436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRs9IGmfM/2d5PI+ovE0R9YCIOMiaC1TxtPRmXk+24o=;
        b=rL07sUjWdo414RM6bz0Yhv1ZMx4Yl+IBbsyGANLo7YAzcXxfjgyDJ8i+PVY3xbNird
         A/sWNU3OAIiUpWatn69RpdyN6pBomkGcmGPRYD8co1EEKGH+Gar5hxF9TnvdlLEoLu36
         Tvaq8L6wCE6gu+tQENCb5wHnMCEvJ/Qzk8E64XfJCdARic7noYRcatnH16i4MI1KgkKi
         Qyh9aUv+BmmhiiVz97rhJIzXv8q9G0TW/nLk7WdPfu51DNYepGkeSkA/LcGpV2nLtFXk
         +zBi1cyIfRmiYoUks1BBxfYOeScrFXEP1XUqmHitXMh4tA2AqFG1LlxKdWkR3TX6F47l
         SVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982636; x=1791587436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRs9IGmfM/2d5PI+ovE0R9YCIOMiaC1TxtPRmXk+24o=;
        b=2lcXQxtrNvK+9thiDDSv/onvO3sxvQT6VVwgHqs1cEzCQomR5QFxn15xOCzcQzWjUs
         TEabGybeIwBwWuLyCYil5HQ64hYKWqnNa3ymMKcMHSj+kzUYR7M1AVQDwIiMW3wyAogA
         9X8M17EjecFdM4NGTDdr0hUz3FL+AV89EiKyvSXMZrWNroiB8YMHLvVYB6qpg4YO+aYC
         pHcju961nkZ2DMXJ5kZvipXyd7Ox+aYU5F8IjZRBITkYDbAMcQZdlQWuEKtPQl73PsTD
         BLfZjP6gfF1PChR2OyTWyIGushpvJRLm0128s93hBz8Bnrumy/FWJ2c+7/oaDNqhSI/q
         8nbw==
X-Forwarded-Encrypted: i=1; AKwUvByXahJxyJowBa/zR4CoFx5CiV4mOgmJZ/JIzew72q2HSivT6vPISFNrPU4cX+ngHn4bo+WKC/gNR8sZCSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjh8V8LlK9zCAP9bGwl/1SLfyI1ZE0sL11W0grEdOzBQOIxRPH
	GrNwOZLXqVKPdA3zFTKnXh7OgQ0Fw6KJlXYm72Bdjgrpy3cDtkU4O1SK
X-Gm-Gg: AYBFou3pNvSg7X8KHq4VMrtflaj6+Q5hG4F7e2xhV4lElAx1zfKTH8Bz0h4pk2qvo/F
	UGcM/wgyfHpIZH8AmiAc3CHp8kwnNETonFwNRACzvLPSWF2fdZZsoDDfwoRb1QC21tLzf19NrXM
	oq7QCk0HF1na4YCp5ICQChdLE9E54eMpDr6m/48h23WCTETSIF1hxXrR3Q3N68Afiih7kXW/4ZJ
	mpblnHr38koHyNGdKRMxi09UwTrlxqlS35bG7ZAl3Fko5JrSjo9J9PC5mDarKz6vkz84T5+sPp1
	6C8o2Ixd/xJxwYNQEQFIRcXMFIOsNg18zkbL4BBWjDpZhZKN6iOTIhIHn9jyvxz4W8uPWbfucdi
	/MGKp7ofLFdq+tKrQ53ZvJlQE7/79uZe3rYBamteuWzXQXYm5Ws8kXAGYzG5mtBOVLBaRlymrd+
	5lSIwu8oivUjUPHbDigMlwRJXwsT0TF1U3ymcXuwfzTz6pQF52VeULtMfmdeZI3ABeDaxnfxb79
	/Fp0q2swjZ4MaoEnv0A3YPA33LkybSG1ET6rMLKe1ObV5vBOLucsf3395KTsl0m8XTxh9OC3xkk
	j/IjBRURir6kH+gwcGX9kg==
X-Received: by 2002:a05:6000:18a5:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-48c4800ca92mr1087430f8f.51.1790982636197;
        Fri, 02 Oct 2026 16:10:36 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:ce47:40ff:fef1:ce77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm8372266f8f.16.2026.10.02.16.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:10:35 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com,
	abkarada <abdurrahmankaradag19@gmail.com>
Subject: [PATCH rtw-next 0/2] rtw88: recover a stopped TX queue, and notice a stalled ring
Date: Sat,  3 Oct 2026 02:10:11 +0300
Message-ID: <20261002231013.11792-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: abkarada <abdurrahmankaradag19@gmail.com>

These come out of a long thread about an RTL8821CE whose TX dies while
the link stays associated:

  https://lore.kernel.org/linux-wireless/20260826162514.80580-1-abdurrahmankaradag19@gmail.com/

Ping-Ke asked whether triggering the driver's recovery resolves the
stuck ring. Trying to answer that turned up patch 1, which is a real
bug and independent of whatever makes the hardware stop in the first
place.

Patch 1: for a queue stopped by the PCI TX ring-full path, the flag and
the stop reason are released only from the completion loop in
rtw_pci_tx_isr(). Resetting the rings drops the pending descriptors and
frees their skbs directly, so that loop never runs for them, and the
stop survives over an empty ring that will never complete anything
again. ieee80211_restart_hw() therefore cannot recover a device that
had stopped a queue - which is precisely when you would want it to. The
patch records the queue mappings that path stops and releases them both
from the completion loop and when the reset empties the ring.

I can produce that state on demand by pausing TX in hardware, which
freezes the read index while the driver keeps submitting, the same
shape the chip shows when it wedges by itself. Same script both ways,
only the patch differs:

                              without patch        with patch
  BE queue stopped after      1 s                  1 s
  doorbell rewrite            no effect            no effect
  rtw_fw_recovery()           ran                  ran
  BE stop reason afterwards   0x1                  0x0
  traffic                     none in 90 s         back within 2 s

In the failing run the station reassociated twice inside those 90 s, so
the link was up; only the queue was still stopped.

Patch 2 is diagnostic and unrelated to the above: there is currently no
sign anywhere when a TX ring stops advancing. I have five captures
where the hardware read index is frozen while the write index runs on,
with power save off and REG_TXPAUSE at 0x00, and in four of them the
ring had not even filled yet - traffic was simply gone, with nothing in
the log. This warns once per episode. Checked silent across 180 s of
saturated TX, about 600 MB.

Patch 2 is the detection half of a patch I sent and withdrew in
September; its recovery was a doorbell rewrite, which I measured as
ineffective and which is gone.

Both build clean with W=1 and pass checkpatch --strict.

Abdurrahman Karadag (2):
  wifi: rtw88: pci: wake the TX queues when the rings are reset
  wifi: rtw88: pci: warn when a TX ring stops advancing

 drivers/net/wireless/realtek/rtw88/hci.h  |   7 ++
 drivers/net/wireless/realtek/rtw88/main.c |   2 +
 drivers/net/wireless/realtek/rtw88/pci.c  | 128 ++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/pci.h  |   4 +
 4 files changed, 134 insertions(+), 7 deletions(-)


base-commit: 7cde94dab0e74434ccc0a387d7ad373fb3becda0
-- 
2.55.0


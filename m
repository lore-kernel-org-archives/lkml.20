Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC83112BD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925698; cv=none; b=IsKGY84Cacyfdo3FO+/YC98vKgaBiuSffIAicgUlS8trjI17DChk6QRkFL3gA65TfWYrhr1NPBgCjZHUmFsrAYIrdYMIjjbVQ+uGxzsw88jxjTDbqFwPOEcvhDa2WGC5Iq6udzjo/wENxIDtHDOd8k1K1FxjlIBe5in11fAtfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925698; c=relaxed/simple;
	bh=96bEQfNZZwaKOM5Yhd4+ckhHbu0d/gXRQJN9ySpQI9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSQhrurWY71rl9qy/EswBKEmbQ6gAHXAVKjVCrqEDKKs1wAG3pKDaVIKnP5hL8ggtKCKAnT45TZNFh9LtNMN5bna1RjjApI4E044H8964tNTMcq/WMVnT1ePaV/86lI8ji8CLEUq3/d68mOD0an7Tts311Y1AVUUypUycHmGBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTtKg72d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTtKg72d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4536977f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925695; x=1791530495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=nTtKg72dTU7Acv4PnHm/btLFFZ19DBzsZEnE75cg2fx+V3NYx1rJIjlvSkDL2jf1rX
         t2ePbp8T6An1QKDDyq14HchCxS2IPSBKpkDVMUhidjmlzFMUSzW/aVhx05nYI5raQoC8
         TM3PPsDgXMbISLLTNX6SRtLsBZVqgu1k85O5a7GxVTQMkfeyrltM+aNnBA4J89yYGxWa
         3snMDd7iZ90anJC6cNSQnpSl6EBdEIFFRgNCECcDiryQSesXyxuxUYF35D3u7+181suX
         hHDfA+ibDdLhznG75CHfP/sRkr0uBNh9NPlm6eNPaXekS9XZkBEAYfQAbWOk8mh79efZ
         sjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925695; x=1791530495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=2PskU07BAwEgnDKCcGUI3ha3izE90iRTqcj5spp5BvhQdmWvxGNIQCKZO+D1YpllfW
         xOiRmSZ8/Oc9PtEZzFtuRVTjx76/lCSMtldP5qcPZFD5/ecyTzNrcMYNfxXHw/mux6yh
         mb7MbjxKLV8WmXUpi8mZ+LEKDFfRhNFBUed0EXPuUZI6QZJsp5FCxjG0ndBEgcT7At/Y
         Ux4UUa7C2j59bhTlyWs+Y7eEIBH8VxNPMQNkdtWEs8sf6lbaWHKd4IskdB5pUn2/3mUj
         cIZW/1Z0LjLfIC81XPQRClP++nO4S3t2Ve7IxHP3lKVaxQDAYkEpep8PVcWFTQhml/Ol
         2rMw==
X-Forwarded-Encrypted: i=1; AKwUvBywmU4emk6L1evwKvFusG1UzzMU7rEyr344s84VvdSCBmrTwTAOZ39b69mVlBV0/sVQkQTBeFL4niYC60g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5YHGf6Qe411Q5qQ2XICP6SSrZuKO/O7fGF5A7ScmcR0htyzzu
	egKcLUeY7wbn+gAVdJl0pqKpDWKkWxO7LOKlEFPgigXz7EeO/dcsDF06
X-Gm-Gg: AYBFou3q0NXnYWxnkASGBH4wENP+5pegkv9HLtoQBQYDBWXkHygFIjdrGMj+4BSbAf4
	7zZ3SiGURG2wJUMzaqWhQfAAJNOYQGbjr2ijhSxkIrpRDRQge7jdl2mVvSdyiTIdHAMqeSUWnap
	S34HVbxkMyifgXQY4tw/xC6VJJMHUdhn04KLkAtt1tL+uU27QzFEyQqB0wAjzJ8s4h6QTv28uL5
	50mKPdOnNNS1lBRQKCY2WZCEsF/uAdfOOMcIh7kRhP4eAhkCja3SJ+m7VpEvqmi2qlBcPQ7OQS9
	O0XL+R8mxgm+EKHg+nZRSoC/76AOFWll43G+gvC2qDduVzx35BiIxRIkcm/eFqgV0oBgTKC2TzM
	Ncq7Q/75XgNfVbVh7ZOoc7p2v89wOPftL99HbhsB1ZiJjdT7KrSYxjRu5tHqRANO093235Jb7hr
	dGKCa1Z9MSukp6yLo3G2lgOO848HblYNaz8jMRP7D/UKUJaMRPBHLh6VNZekekqCXQ6A==
X-Received: by 2002:a5d:5f05:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b126f5423mr3564843f8f.1.1790925695200;
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Convert MediaTek GPT timers to OF probing
Date: Fri,  2 Oct 2026 09:19:25 +0200
Message-ID: <20261002072115.169250-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While chasing a kernel freeze on the Lenovo Tab E7 TB-7104F (mt8167), I
stumbled on the MediaTek GPT timer driver. This driver is currently early
loaded via TIMER_OF_DECLARE. I noticed that on mt8167 (and I guess mt8516
too), this driver actually fails to probe because its device tree
declaration depends on two HW clocks, CLK_TOP_CLK26M_D2 (13 MHz) and
CLK_TOP_APXGPT (bus clock). However the driver providing those clocks is
loaded later in the boot process, leading TIMER_OF_DECLARE to fail with
-EDEFER.

Patch #2 converts this driver to OF probe, fixing this initial issue.

I noticed that other devices avoid this by connecting the timer to
fixed clocks instead of referring to an actual clock. This approach
may work on mt8167 too, but I think referring to the actual clock is
cleaner.

Once the driver probed successfully I noticed that even if it was enabled
by the boot loader, the kernel would quickly turn off its bus clock as
the driver wasn't actually requesting it.

Patch #3 enables it and attaches it to the timer device. I wondered how
other platforms made it actually work, and noticed that mt6735 declares it
as a critical clock. This approach might work for mt8167 too, but same
reasoning as before applies.

After those fixes the driver probes and works correctly, but I would
occasionally notice a crash at boot inside the timer interrupt handler.
It turned out to be a side effect of the bootloader enabling the GPT
timer at boot: an interrupt may arrive and be handled while the driver is
not completely initialized.

Patch #1 fixes it by requesting the IRQ but keeping it disabled and
enabling it after the clock source initialization completes. I sorted this
patch before the others because it's actually independent of the latter
two and may fix (rare) random crashes on other devices.

Please note that all the changes apply both to GPT timers and the SYST
timers, but I have no device to test the SYST ones.

The series was tested on the Sony PlayStation Classic Mini (mt8167).

Re: patch #1, credits for issue discovery and suggested fix go to
matemiller992 on postmarketOS forums. I am submitting it upstream with
permission. Not adding Reported-by or Suggested-by tags because it was
requested not to share real name.

Unfortunately, this series did not fix the tablet randomly freezing during
boot. Any idea on how to better troubleshoot this is more than welcome!

Luca Leonardo Scorcia (3):
  clocksource/drivers/timer-mediatek: Fix random crash at boot
  clocksource/drivers/timer-mediatek: Convert to OF probing
  clocksource/drivers/timer-mediatek: Request and enable the bus clock

 drivers/clocksource/timer-mediatek.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


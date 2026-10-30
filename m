Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371446;
	b=f3UMeAi+mlBRnYw/+uvV/EmdHpOqpY8YC7pJL5rHBT+tFWvLtLHK8WswpnxBrCOprLqb
	 azqlYdnLGmPuxLHPN2hN3b//vRCn2gfCO60giphz8MojnlBav7QUb7tFsfOQr3KJPEsz5
	 +0RMUWbRH4dN52A6izBIKZ16X7sxS1HwjrzGqXJmR4uxb9mpoyv7NrT4OO+MnXvp7rUG6
	 EJgzyeMAWv2Z9FStDcKELKZ0R0HykbR0r7TZp0q1bW3zRboX83U/T1XJpecDlIfXx5p1b
	 O3M2X5hYW4ehehzsAMx6oP9MS2f5njET5BWydhMEuq96fhOHFr90AjHCABsPRU3nRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xf7sf8+0BwKqj0uvznPLe3t/Q+q+kU1XLoWKn8dO4RY=;
	b=T5ibwZUes9G+AsBYdMFDS1+4BcYdO8TbcwmzXsKXJ5G5RI4bRUN9+gPoTzJJ28+OScCI
	 SmB0zjep6Sqg4lKwmEnb8u248h0vfr5v/DT5If8m90+HJFv7kXadGBo8nm6s7qBK9ekk0
	 +Rjel3GoTLcuqY0t1IGYZYPttRLDCzPr49uBYdFRufFZMr6n8x1j3QL0cnEgR/YjC2nTW
	 Ly0GetUQPUu3p0d38ZnigFu3H9V+ZgEAMo4Pz0ZGC6g0CTBtgy54uPYgFgmtaPaOj9Pf9
	 dnsnQjZlhr6Quxf+/ghBpO9vk/WX8kcW+OKyxtsSORXIfyPnMDnE+TIGJGISEYA3hFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX0K5KHy;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C54606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX0K5KHy
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so507312a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371446; x=1793976246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xf7sf8+0BwKqj0uvznPLe3t/Q+q+kU1XLoWKn8dO4RY=;
        b=FX0K5KHykmEqt5iwTWU+A1+yWSk4kOv8QVMCKR9CrTK7GPZC+gKOxKprFCjUwjFBeG
         PpFoJv/KlTZRynAwU4I3aSGMpHdQUjj3JEPJ0pNqX5hVrnJ66uUwiC9JiGwIUO9/Vqwl
         UwzHcmi+eN9Gv8gFrtiZc87dcncs2xQrmFboft1pamiSF92+zoeQas3RGTVl1UvqFZSr
         fFfwt2NE47CVQom4/zFMoujIzOyIXpv7clD8AZHWKgVDXTG9JVuYnQxaGHWrL8HSCelK
         WeUWAWB13wRJXMfOriHEZQd1X29vepKKxoKk1vdRl6Qrgwjl/txVy1YS8Yolm1efMH4G
         BYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371446; x=1793976246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf7sf8+0BwKqj0uvznPLe3t/Q+q+kU1XLoWKn8dO4RY=;
        b=O/GIJuT8O+RaxTq+n506dje+WJ3uJnn7yRipjQ8Ehs4HtdeNDnUoEbNg6TUQ2K6EAd
         L+9JvCGBogvcGoyFAKL6TT6hpbl7Wc/dTfGcYg+zUwkI/bbmoVcBEW4NcspkZGrJTpJ8
         jcdLQAUE7vEcUfNtgj7PkyBHoDBDIxA54c1HzaJ7nfTN68SybNHwYjikmctIz5j0bm2R
         UAM4g5M+2AnwITKX8I+4nvkvQQ5PaZwYmhEkGc0C59qOEBodJJbcUZ18WlFYmXtvjR2o
         c6LnzMC7gWfVyX/IMQAPBmArmlaghsJqV5qlQzG/d7gVtaW9T0YUoEOg/SkVbfxM0b4f
         Ft+w==
X-Forwarded-Encrypted: i=1; AKwUvBxgWwHjbeOvcis+Oj2hzgdx3WifYbipQ19tSNgCHCv3qNU/oH6b6g7aFRAjO7U9TwBTxYytY6qoJXQhLGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYITO4xcm0EmHc7J8LRFdWWlXhW9zEpSX1MecqHdihKBi6wVAvvG
	bQ702a6e1TuJGDIoTAJgnykE/q62xozK20aYxDU/KJDX5KzDTWNqxe/q
X-Gm-Gg: AYBFou2V5Z+U3cYr17Vs6TnTFhgp71+N1JV5nI0M8eNRw3rP6nowtRQHwLJ/NHnykQy
	Rylp/uiQfFLzaVetm03uUo3VOJc6+kLYOwz/JeGz0KMlkNftJCsY3rFkBLjJYookvnMJV0cCaA6
	nLH60isx2ji98d4wAQ1u3y5mLs47Qf04XlABt5uzhNT4aLGi9DJ1E75WlO+mQepeBXSQpuzStyX
	mrXlX/6mTvW+Zh39kJGi3lSXD22uZFUwKT1qNGOE4lUroG3g7rXlioepxXmW7Pf8O+YMFJFV6f8
	L37Ud5SP9Lm78pGbhCzVjcjC9W+o1n401YsYd5QXOr/qPkmm99p8a9M4woCi6XXR2Gpe24f4ZYF
	T7gAoxOl8r3Bo1sQ6fZhxkWM/KXqh1C2fGv1er7H6CmVFoBVrJF01eFwfh5Ey3T4UuaYlBVXlO2
	zbaHKqFa/yBhCkNk+0YU/nHYEFUoHSilseSJbehVHyVrlQatgdswNGNAoWf3qf2SLmOgeVpnWEr
	KhJZIbwbG47NsTEFBrMg8SkEc1kY4OsohpnVHSg0xUKGagZSeqtVKEOmRqaKc1xQyHiBRl+cXlF
	ThmnFBwzOrGzb9S235rd12Pz3Q==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr1798961a91.37.1793371445790;
        Fri, 30 Oct 2026 07:44:05 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845d5e62sm4610922a91.13.2026.10.30.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:44:05 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: SMP: Serialize root channel updates
Date: Fri, 30 Oct 2026 22:43:55 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v7-c26e53b52c260063ab6a-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The SMP root channels in hdev->smp_data and hdev->smp_bredr_data are
used by HCI event processing under hdev->lock and by SMP receive
callbacks on hdev->workqueue. Power-off already removes them under
hdev->lock in hci_dev_close_sync(). Two other writers do not serialize
with these users:

  1/2 The force_bredr_smp debugfs switch creates and removes the BR/EDR
      root without hdev->lock. A connection confirmation can see a root
      whose operations are not set yet, and a disable can race with
      power-off and release the channel twice. Take hdev->lock in the
      writer, and skip the deletion when power-off already emptied the
      slot.

  2/2 smp_register() replaces both roots when management powers on a
      controller that is already up with HCI_AUTO_OFF set, while HCI
      event processing and SMP receive callbacks can still be using the
      old roots. Run the registration on hdev->workqueue, where it ran
      before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for
      power on synchronously"), and hold hdev->lock while it replaces
      the roots. The caller waits for the work without holding
      hdev->lock, which HCI event processing on that workqueue takes.

smp_register() still warns when it replaces the channels on that path.
This series only makes the replacement safe.

Cen Zhang (2):
  Bluetooth: SMP: Serialize forced BR/EDR channel changes
  Bluetooth: SMP: Serialize root channel replacement

 net/bluetooth/hci_debugfs.c |  2 ++
 net/bluetooth/smp.c         | 38 +++++++++++++++++++++++++++++++++++--
 net/bluetooth/smp.h         |  3 ++-
 3 files changed, 40 insertions(+), 3 deletions(-)

---

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680784;
	b=ekhJZureYck+kZZyIqgmR5j+Ai+H+gjZwTVyqc9iN9ynZIZUPzcGH6adHP7oerEwMoDr
	 ceGKW2ZKkMptvxUqYXqmQJRz2K+mRE5kdgmYx1d2GHYdo0t/BSJv8Zb3oECRcqWg1ID8B
	 i8jqTcBJoy7ET3jmkXbU58V6j4vKO7SxQBuAvYmMBs0RTrmnIoT0Bg3/Q8vEWpCar4iBF
	 Iz8kY1pqOkgSXg1L6Uu5zs0R23svW7zIhER3YC7rNX9Yuj4sodYU8K4D7UmPbX7ciTnfv
	 mWZ26c3/915Fnw6+x9IVk2kmqXPf1KcZlq4n5zS/WBqJ4DNr6YBRgjxWfE3yHcpq6yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
	b=RX2/AcgGUdmHswCRr4Kl4O5j7dPUrqjuiZO6a/wKf0p5tgL4gb3Cc+PIGp2pOAqde2OA
	 aXl2JMBgdroinSgNuIhxj7lIsaPJBFJHTbqf2O6BgQHgKQYIvflIdggEpMjvcZ4eCZ4np
	 rNIlr/fu4CZOSIVYS1hWS/rHlLgFs9S+HlVAaY7Hjx8Y9Zofl503MFxCpvqI4ttWRslOi
	 RSTVkMQQGbS9Nt+QQK773+xHTwnR3Rcvv8F0sEOBGoDo77BX/7dlUFDM3YY9LhCGUSF8V
	 +PlHsP/NyfUbpebdT1hJixjPJEy69X8+smjltnL3dAQQRL8VbxrmkQ/crmxq/mnFx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fa0SUHcn;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fa0SUHcn
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1557612a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680783; x=1793285583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
        b=fa0SUHcnoB2u5mbE2SSv8H/0b1nFQsuzZyLD3+TeW7sIATt8Dh0A7bYHTB1Ip9U8PK
         HVarkGjVZpn/dFyTItarF/7d9ISBETsgXfuvVkT+O/kPiQtOkDqzVfgwaG1wJ75RCHko
         Xdidld6eriO69rqTYxYrq5kDrNLtZvbRjz8mOZRLuz+8lDsv9Rb1YTJdOrVPppDxyiNA
         uMMWL+KpXbj02/VCiuXIPxpuvFLSG7xW00mMibsnnJmKWH+hlayEp4wADXKW16bnL+i5
         1lff51pKD4zBEW8+RGFJAcEe2VHsFL6mrA0ys7STq52qHImc9oaX96awcf61rcvFXbF4
         7BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680783; x=1793285583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erW9orlZqBORYTjT+M88JXzd4Dxh2Crq+t6//rkNNRM=;
        b=W3qLc21kn9rGRNMHIaC+i66bgaRiROBwxoW11MM3qNTWVnD29tsJS1GT+upgciHQfr
         g008VHAxNQK3CG+BLrebVBlilKfrvqmmzrsr3SDwbbTQo1tCC7I8MT9NxRRirUyc/eJr
         Sa36t/i5/c4WKqW9Co7/0H12ByQzCGhXWPQCDUTDn/exlz66T9iyDfsqBYgz74cgb0EV
         7OHC7qCqY1sd++09rMm2BguQGRnZKMaZTr2ziea67Yq/spWWzpGoVF57c5LTU5yp/v9b
         yz3VZJ0h/13agRBzQSr+7UqKG8TNUL2AWz1UyADSa2rGJ4KQ7VtIqLygWo8m3c7pD4Wi
         1Tlw==
X-Forwarded-Encrypted: i=1; AKwUvBxohPM89C95tB/bK7qzmwPQwwwfXpUxxGs4C0MdSbkX97Bwoj/yMDFWqg9gbyGBas1DMccKgmAEv6QyrYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHh4AJ6nR7/B35Zw+6lhOQL58cFHo5n4jdC7bO24fgHSE8wLxR
	Yl0IWsyCvt60gyZMFCEqBiK8KYs+xC/EU6myDJGqdeNs7PcNJPZKuyVW
X-Gm-Gg: AYBFou1rD2ri8tVKMOhgWR6XAC7RH/dbFiXifvm/ROSliDQvg1PZ4qf7vh+HJuToXFy
	cEf0S5Kls9L2P3z+5FZ55NjxkcNNSbQjPfr/kzqUkNtRHSdRdIH/76FIDtLtIAXcmGYe9nzuuWe
	nEMWHxZB3UbV9qfOB9rCaaVWrJZS/x6t1MQS01gaWbuwd+9m4bX8jMXcsamsI5HCJvwa05ubQlO
	YktzSrIOfy2a/oNrUoToHg4hatxo2TmGL78kvTCZFJon6xA4kLNQ7T5imtqETzDXrvg41vXi0RW
	iryD2Gqf3cxeuzKhTGNnOf+RYjXSSx13Jb+a5ufLZDJ/+h0K4XQDkX1+B5BP3Tbk5T38GP0Y+mz
	JwBgPptJGHJD4ptYx3B4BuVXFMHeN4gBBamRyuvPE/P+x/+XQyN9KWeV+lT01nbLvier5mZUzak
	CskV9y1KHOK2xcGElSGPNi3BdeH3XVvs5I6hcy5V4tx+8Y63Y9tqXy/uOEn+lFCnyrU7TL3uu9c
	KrNKXRZiBaOYpZbEVd2/czWImKizGGpUpnNnu4ElqBOCdWkpm5K
X-Received: by 2002:a17:90b:55cc:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ad86f1bd64mr4828172a91.10.1792680783448;
        Thu, 22 Oct 2026 07:53:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:03 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Thu, 22 Oct 2026 22:52:52 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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

OPL3 can receive a fixed-duration note before its timer is initialized,
and the card-owned voice array can retain channel pointers after either
sequencer port has freed its channel set. The delayed-note timer can also
remain queued after the sequencer client has been deleted.

Initialize the timer before publishing ports, clear voice aliases before
each channel set is freed, and shut down the shared timer after client
deletion has drained both event producers.

The first two patches address existing initialization and rebind issues
identified by Sashiko. The third replaces the earlier native-port-only
timer shutdown with shutdown after all sequencer ports have been drained.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 25 ++++++++++++++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 3 files changed, 22 insertions(+), 5 deletions(-)

Changes in v2:
- Split the initialization-order and stale-channel issues into separate
  patches preceding the timer lifetime fix.
- Clear voice channel pointers, state and delayed-note flags under
  voice_lock in both native and OSS port cleanup callbacks.
- Shut down the shared timer after client deletion has drained every port,
  replacing the native-port-only shutdown.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045230;
	b=PmRQGz/g/WWkDCQ8BBz93Gxne22SSg7LhccWjvehppc8CmdkJILriKVJ2+iugjafDCvu
	 II09C0krgBjgaRp5Z1OW7pOLtjMXCRExzwqJLmygvpftAHZBGLbtU2efM9AlS0mR9/A2w
	 16tQAM/0b7Xu0MEzArxB+SA/kH93PAvnavXRn29UHJ09B0kI1C+zr6GZOgg9PUMXvIG+t
	 0LNU4L+AHaI7VA8zXR4TYjf+R0TCqkm202/mtyDvax/jW4xTVq2WVsJCWJum9Mq2y3etj
	 04a7HQvCXJnlTVXhIKxWSPKaT3ctkGnJ9lytHRKbNpuHQXsbGBNdej6KWhlwKflGJrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0iRlvi+Z+F4TqdsB35h6njgSQLh3RUiQ2w01CN1aXJI=;
	b=bDO6hE6CtgSTavoIkpUXuaOUsX0vtlW69jO2ukUPZe5ziQBOCI4Z2qf4kAG8HJiGJzpP
	 CNWO1X3hInDUFY1y6u1r/vA3JTg454CbNr0BF4g5g9wGVSlsh25F4/hqK03TfIXFDU/ki
	 jTc+m5YhtUsc0Ihy59/9y0y/QI8UMnny8n+avjXejIap7P29RAPcWdFjhmqig60fKpSxA
	 RudF9/e6FNcCcC8cIB/aqeJEN2F73UNQIC/0l1AgOwxH8fu4hvWjjCruAzYjCovVGyZke
	 S9JpGFjNCvk1AUZaDDvBAEIZ0/V74IrjhLNd+eTEr4tU/lAoRQaOJofoiD9XCMniWKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=MoNGNyu9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9F606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D9F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=MoNGNyu9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3443595e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1794045228; x=1794650028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iRlvi+Z+F4TqdsB35h6njgSQLh3RUiQ2w01CN1aXJI=;
        b=MoNGNyu93eklLeo/Jqt5SI8H1jvTI9Tvdzu5nuNxu4ceKHjwVvH06Cye4AbXDPuInT
         AOrTbQoqGuTQAZ5s6zbV5HtIXfdf5uXJ0ojMLMFVuaLhhgMnr77hU/q0laPcHx0n04H6
         QibLDntpIB67fYcr99vUGP7aoZn3fuJCn4qG/HQ+eIBpFzucasxaD9SMeWl11o7CtxAY
         qkqhNA1n/r05CChFGRMjBL63GrAWloegwUPPeCEwCIrZv7VMdVS0i8LoBoSR6kezKXc4
         aLsPtEtIJwgEzAR5Sn85Ona1UqKEKjISN6VzlIVQCHv3Ou3vHOm1oA5Sw8TRK/sFGzPA
         fZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794045228; x=1794650028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iRlvi+Z+F4TqdsB35h6njgSQLh3RUiQ2w01CN1aXJI=;
        b=hHqUE8FnbJkXxmV6twx9OD1MLIxlAXM2c/Oczxa0qUz0EDv6UHA8YoPtKfNcd+xeMy
         +2NtljdDYRyzt+rWtJFxklNOWXQ+qaXrt6bodxf/WQweVPfaUxPxVo1z+CFJu2WQ6dZG
         s5M7LhVKTfxfXPfZkESRQz/i0r+mYhT8RMnWOJ6/3QM7TS0xl7seD7l96/qm3MTMZ4yY
         yIFBazpVAVnIdFISMqUZh8RZZ/bmYAAZAA5R2gmvV3F0mlfdnju2omrqD9RH6OXQf6o2
         T+IkIPIA8po8k27DGDGb6otW+eaB0GZy8lj5nPakDnn9xNnHx/1DxL1jOlqbdBVRMYZX
         m/OQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6lCiyhjEnkArbg5O06xSuQmWQtZvWjNbL7UlrfOK6FLhzcPbjVX0B9SlvI0mA+7bHxtdnig5pLgajYho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/twfEXf7JNWbnHPTVWlQ2EhO/jSGJxYksb9QuG3tIDmxpCnJTC
	eNNnxaTRNYV2OT61UZlvYXgljGci0k8jsqxxbrRIa7Y2LJqmWdPW9/KF7Uxc4BGwVaM=
X-Gm-Gg: AYBFou3KZuY59Zkm1ATcb2jb6bv/ZCT3ArfABPy0ec0kMYBVF2AFW3o2WxEr3YfR0ki
	9C63NPJ9TJyDGmAQtgUgGbusDAVMG6I72aauA9/avkSl9QzMf1PvVWKQpp+uo9G1xlZFq3QKkKc
	tJcR6nIqgHvcAApHMv1t0ZYp86tKFfsHwPfFXpHJfhbslqhzzG0OS22WSq7hU6zNqysqkjV0KbS
	E/fyWDUlLUakWcsFRQ0XK+nXIfosWP4KP6Xfaj6gaVcKrkOK5pY2WGLszdOcB2igyCC1TrNuILD
	SuM2ZjDActq+1D51I3UIrIm+AKvedi2BuJmtWQxLOhxYwdLyuITQ7D0/GH1K1eZDvNLUZyyJu+9
	EVd07Br/i6hRGY0O69+U7YTUvIvH4nhvcUNqlpDnaW/Ov7E/dQJgXQRkCL1JsEBOG5cQq7uRajT
	EKx+LsrV4kDwo5EIp9/EN25RsGZ1hLKl9rECOD/AHMAXrSyaAHwqjB6egu7niQ0bhIO+Axz1BQW
	DhYj5PHb8zh2QgX4ppRwQkK01EkjEZKwhzo2ADVe9pNSrcIcIqV5Sg7ZCf8dqPBzj3w5FajoxyR
	T0ENBYxXiMB13JA2UQkp8UwNHam7YUXvOrNRU5aPVEfCCQ9ncKymGoMQT2yissile7Hdn4Q4RA=
	=
X-Received: by 2002:a05:600c:1908:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b8190ec93fmr25969685e9.1.1794045228607;
        Sat, 07 Nov 2026 01:53:48 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([185.57.101.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b8af10dd35sm37607545e9.4.2026.11.07.01.53.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 01:53:48 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v8 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Sat,  7 Nov 2026 09:53:35 +0000
Message-ID: <cover.1794015622.git.saravanand@crusoe.ai>
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

On hosts that partition their CPUs after connect time, the connect
time io_cpu selection can place a queue's socket work on CPUs owned by
another workload. This series lets a control plane set each queue's
io_cpu through /sys/class/nvme/nvmeX/queues/<qid>/. Patch 1 adds the
core helpers, patch 2 the nvme-tcp attributes.

Changes since v7 [1]:
- nvme_add_queue_info() now calls kobject_del() when
  sysfs_create_groups() fails, so the failed queue's <qid> directory
  is removed before the error returns (Sashiko, Daniel).
- Rebased onto the current nvme-7.4.

The blktests patch covering the interface follows in this thread. It
is now nvme/081, since other pending blktests patches use nvme/076 to
nvme/080.

[1] https://lore.kernel.org/linux-nvme/cover.1793800758.git.saravanand@crusoe.ai/

Saravanan D (2):
  nvme: add per-queue sysfs directories
  nvme-tcp: allow setting per-queue io_cpu through sysfs

 Documentation/ABI/stable/sysfs-nvme |  31 ++++++
 drivers/nvme/host/core.c            |  12 ++
 drivers/nvme/host/nvme.h            |  25 +++++
 drivers/nvme/host/sysfs.c           |  90 +++++++++++++++
 drivers/nvme/host/tcp.c             | 167 ++++++++++++++++++++++++----
 5 files changed, 305 insertions(+), 20 deletions(-)


base-commit: 687f3014afcd5826fa3d8f40b445f647b5a379b6
-- 
2.56.0


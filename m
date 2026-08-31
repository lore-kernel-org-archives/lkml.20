Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE84A2050
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186704; cv=none; b=X61tOTadR9nl4dQNr36dK5JCM2T01iXab7i1nf5Xrb1yYub+lhDHQnX1tu2C972jl9bGgj8JOmyV2U3qi0DEZhSe4y4C3fY7OL+KvxSy4NEaodlunwFvfPakmK/Qz2USGNXJwjxMh9lm/fjtV40MZ+VgIHoS3c2ado/CoI1zPQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186704; c=relaxed/simple;
	bh=kaK0aH74Qi58txlPAy5w3sfoQZuIxN2QNza5PBv/HDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eJkYMpdtii3YGNqFILEUQxUNbMoNHNfv08bF0g/vH50sVMzD/zJdGqV69Orz3TGtWYlhF/zAYFanZtW/2pSuwn0jLvC+fGaIl7Yxw6CTkUFkd2sVYg6aqXo5liRBkcJg3iuAFUvfJcRhm73lTBqI1owyBgeIfNw0xgT1rMoV4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESVSTQID; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESVSTQID"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so34700525e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186701; x=1788791501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUYFrpKNt6IgGZvcijxJF7MWDCddgrnldhyZfo7UGic=;
        b=ESVSTQID6CPw+mFnqfcIxouJmXmkP4VtLtKbujk7ToV9aGGd/AJYKNAD2rV/o8PXuE
         SU2Dpp2SOV9Z350KjTgaznFUnSrzCapxmEyxcnpnQb6M7xfCEk5v8BpnbKESjt7tRB2Z
         Uq3ujX3VIqTQDVo4Ltyxc1wL/MKObGBcnnBzGF3VgVULuceNZUN4KG+lze4C8U2sk91W
         s4KUBLEdXHyFsbCnfPn+Nnv2nqGUgAtvdJFiMf396qRj595w6rgP4hJaYQcjmh7lC+CW
         IWsgRGgK0zzno8iMx1m9Enw42CA0Yb057tjXPJoVk5+J3wtmGDYNDf9Mn1bToJvKlfYa
         DV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186701; x=1788791501;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUYFrpKNt6IgGZvcijxJF7MWDCddgrnldhyZfo7UGic=;
        b=IpNx6MU/vdvjQ5OqvenjDEc3AThCiaFDej/jW0X+tGOXny+5oSi3Yqpos8sqKMb84v
         AkB7FD1ve43Lr0wfIckfGda7f7Hg3hG2e7zFMbkdP4VgX5fpjm0lSsCAy5XcEjy3pNhT
         Z/LqzcpY2S91B1RGrFMGmavYDEQ2NQev8kQM6e1gBU+hfMQJLJIGLokbg42TrmTU9Nfc
         rh6MmDmI895Ca8Mfmy+WzMbOtRThgkqz4cYQRUDl5NYvkK1MSZij3C5nfNm0SA2uLpTq
         Om7ulgk/dVvck1oU4XZlKUi11r17hMKnfRHQQWkJF09rOZGlOgS4Rc/cK2J/gumisr6Q
         wAPg==
X-Forwarded-Encrypted: i=1; AHgh+RowRX7D7ZoKnCMLcHK+tYKL0qVo8vj0itFjjWbgcgsrpXDjAVRwoangbBggDl0owvPxEHBh3mdZMlLC6K0=@vger.kernel.org
X-Gm-Message-State: AFuF++n0EqbDcwubBVVMYFCWCRLGuQOiMgW33ZR0FrbIm2AdSCKd/4Ph
	Knt8GdFZeEjdgZhXE/Vl5ACYh8+LCm9v9qxGQg1SgUMF0ruFZxBrLDOYQcVoTxeIjqY=
X-Gm-Gg: AR+sD13GlDzol2qIIOAvFWdHf9Wj4yC8Ki2GFD8StltTNvD8RPvMk8uFulIPfvV0VHW
	YHsm8Fg7F16GXdtYFQDfV71CEfKtHQW2NJ1k74Bqz9Z+nwR0/lZ+DgBbtgS1spRx6m3yc28YH61
	kjT1Mi+JjAJwA8oKQVR8VM3KfkCyS8kY3DAfa0y1tBLZjByeBrtG/yF7RVd+HXdShOj8svrk7Ip
	nCAhA2YqxtD/3018vWFFh4VThse7sfmM3HGwHv+aRi/AeZX3kJFo4Pft/dQhWt3nbFvuhyDPWNU
	yVLmSOHtKhokvqzVkh49jkOcqm4H+6N64/S+YFkM0O6adFu3e0BqKwqR6UZzu9/4kphs+yal9/8
	dI6X2kyIY3TkJFJ2wtVmCBjNyrfmDaLQKt0Yndm8MegMD9LceU44Bfs4DwvBZbo4Dah7Zlzbr8b
	vzs5WGRyMA5oF/K2MzOWIHIuMge5vi6wM6g8u3Mwota8amMFWiS45AzBqVh3YqEi/ZaY8ee3lXB
	N8a2KlFWQ5xXJXAVIhhed12
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr362296585e9.7.1788186700961;
        Mon, 31 Aug 2026 07:31:40 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:40 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 0/7] docs/abi: align userspace documentation with implementation
Date: Mon, 31 Aug 2026 11:31:18 -0300
Message-ID: <20260831143125.151360-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation and ABI alignment fixes found on v7.3-rc1 by comparing
userspace-api docs, kernel-doc blocks, and uapi headers against the
current implementation.

Patches 1-6 are documentation only. Patch 7 makes GPIO v2 return
-EOPNOTSUPP when EVENT_CLOCK_HTE is requested but no HTE provider is
available, matching the documented behaviour.

No functional ABI changes are intended beyond the GPIO errno correction.

Iván Ezequiel Rodriguez (7):
  docs: futex2: fix documented errno names for futex_waitv
  docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc
  docs: gpio: note lineinfo padding must be zero filled
  docs: dma-buf-heaps: fix CMA heap name typo
  docs: vduse: align documentation with current uapi and driver
  docs: ioctl: fix stale NVMe registry entry and note N conflict
  gpio: cdev: return EOPNOTSUPP when HTE is unavailable

 Documentation/userspace-api/dma-buf-heaps.rst |  2 +-
 Documentation/userspace-api/futex2.rst        |  4 +--
 .../userspace-api/ioctl/ioctl-number.rst      |  5 +--
 Documentation/userspace-api/vduse.rst         | 33 ++++++++++++-------
 drivers/gpio/gpiolib-cdev.c                   |  2 ++
 include/uapi/linux/gpio.h                     |  2 +-
 security/landlock/syscalls.c                  |  2 +-
 7 files changed, 31 insertions(+), 19 deletions(-)

-- 
2.43.0


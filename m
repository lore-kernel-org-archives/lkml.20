Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0843D3D10
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449048; cv=none; b=P5bnMBQOkSWcwPIiGOlV6Mxc3S+lYjLVwHh6fprdSK4P2i/+9fR87tPfeMORXrvV4GCK/2Eg4AWGJePzS3/VN8SRMY4qjDEvHa3w4lb0a75W2Qc/rd3avT347ZyX7AB3YaiYNMpd9buIjGPos0c6D/NHbIV+3aHwkkPasN2hOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449048; c=relaxed/simple;
	bh=2KIhFcZHqJ9+pe8RaJcUtCeBjZwM7wSmim2j/mLmpTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO/SH96hJTkvhsh6VHk0F3CUvwI78dVlETN5kfnPOgrt6gR/1Mz65kvuf9DzcPDhC/WBBbpOTPr3LEMPmTRWXXeiI8aCC0MCx4vATeT8+uMWX80NNHICDCG2jAoYyxny+G5F/NKF1IZB/NkFZ89Lgih4l7E5+ULBacMmAfVXwIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbTxtD+T; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbTxtD+T"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8241a56cd70so2392939a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449046; x=1792053846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9QWLs+iWZ+eZ7ZEkdtW4NIWcT6hdsnE5DwV3JPb2uE=;
        b=DbTxtD+TmQid9ghTuxQWGDDNvbT0wWEm33RelILuV1n4mS3VlyqerXksgGODbAM8j0
         +kUckM1ag5B5RguB2fBLzoCwCEiJOyrjAta9nqu161ItG6V8ZGKrweN0JzHmsldQBWaK
         j7+JNX4pKl/w7TakZeR6qi86QRGJIj1IMK4dnFsj3NfRVW0YN6CzewHm+U5jl1HOUk7Z
         D+dzEHkVAgfRtgo7u5CWhUZn35ABhRWkG746zEP7fdPklw4x2q17tAIHzbzHyqbiINqU
         D+SuLRqOv4icInaTDKpeHwDPrMNZpdGeuE+HGTiOWtW66bxiCKn5PIXbJmrWF8WU/bzM
         HW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449046; x=1792053846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9QWLs+iWZ+eZ7ZEkdtW4NIWcT6hdsnE5DwV3JPb2uE=;
        b=F2mozdENkqg1bJdzLjBxvaHVURSFdKw65F+Rj5R3d0FcrvBJRxJo6tLRa/sfCRsPc2
         WbM5J3fGk6XMop9gqaP8XvAOw6rtTckhvYuxRxvqNwGc8WFTY/zKPwjvoZlE52We9gXt
         SQ9k4GOwLNUChG6ZV3GmEwaDUFfHdCMI//AvOMA6LF/xik7yk9Ywk71P8UXc6OtKEuWD
         wdrhKAEtsr5tc5DYz5/R97R/5nuv5ebTYs1orbRph/psMYsKv53Dg6rolx3GLRQE1CNc
         AUIjD04+JKW2Ly2QXF/QNNdGDUoQLev0xtxn9tVXMscyVZV1OE5HMOdpRVufKxl3fl4m
         cYQg==
X-Forwarded-Encrypted: i=1; AKwUvBx9b8mIObJd7SP84JAM8uDgN0kDifxYbXnc2Xysmppc+Z5++bmsjwRRunhQa5WpURQPUs0symDorg6WWdw=@vger.kernel.org
X-Gm-Message-State: AFuF++nXUZI+0/Qs20ym8sjmwfRvrCwQ7Udc0nSdScPhU2XV3o7dBmWr
	jEB01DpdlARF1IZ7Sym3LxqpQiirNIsFTtjTfTSnGyLbBH0BXtiu1thp//Ckmg==
X-Gm-Gg: AYBFou2BK36VuSCIKxxeSCd4WD8C2Erzn5o/amb2WJn8HY8S27NN0t5qvd5S4yzb1Fo
	oZWuW0A08ZOE0+iroBbFgBBLswxuXiYu9pLls3quMhJH66hXeUAfMyFfZ/CwBfuH+Lw5TayCvQV
	VU7veml3+WjimK9HeqAkyCqvst7ngyi1stGr/WdOoYTjah/UrwkRPAf4A5JkcZwPpxCiw/U/vAa
	Z8/+jbjzZ9rpdWJP4IVs+cCOD4RHAELL6lFy4g45YH781L8X68OuhB09qzKHNb2ZT92kgnCpjWr
	zRV+mxGtkwxjJa2OFBJeXVvkbuAIirIHvOn6r6Yh38r8B6lgAuab1Ey2mxGHu6fD/zFefqY0xj6
	mTbl56fpbgynCHMwJw7gTuIrS1r7kiD/j9DNJs63evrq8fePEQYSZI99vjXet+hD1paX0dFs5U3
	WGP07OaTkg7MYCpGYVSYb1Y/k4lNykHUtNFIL0EMntAImTbQKpPQKCmkQc1bBqm8ngo+sIjv31P
	5TXvzw1GPjfXgJPa/I=
X-Received: by 2002:a05:6808:2e43:b0:4f3:890b:5fec with SMTP id 5614622812f47-4fc464799d4mr4704509b6e.25.1791449045853;
        Thu, 08 Oct 2026 01:44:05 -0700 (PDT)
Received: from omarchy.home.arpa ([66.69.194.205])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49032c44sm5375407b6e.10.2026.10.08.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:44:04 -0700 (PDT)
From: wendler.david@gmail.com
To: james.a.fairweather@gmail.com
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Only use parent drvdata when parent is GOOG0004
Date: Thu,  8 Oct 2026 03:43:51 -0500
Message-ID: <20261008084351.7680-1-wendler.david@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222855.23707-1-james.a.fairweather@gmail.com>
References: <20261003222855.23707-1-james.a.fairweather@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi James,

I wanted to report successful testing of this fix on another affected
Chromebook.

Hardware:
- ASUS Chromebook C223NA (BABYMEGA, CORAL)
- Intel Apollo Lake
- Omarchy / Arch Linux, kernel 7.2.5-3-omarchy

Before the fix, disconnecting and reconnecting the USB-C charger could
cause a kernel oops and leave the system unresponsive. On this machine,
GOOG0003:00 has PNP0C09:00 as its parent rather than GOOG0004.

I built and loaded a locally adapted version of cros_usbpd_notify
incorporating the parent-device validation and NULL fallback described
in your patch.

After applying the fix:
- Six consecutive USB-C charger disconnect/reconnect cycles succeeded.
- No kernel oops or system hangs were observed.
- SSH remained responsive throughout testing.
- USB-PD negotiation reached 15V/3A (45W).
- The battery correctly reported Charging after reconnection.

The driver also produced the expected diagnostic message:

  Couldn't get Chrome EC device pointer.

This was a locally adapted implementation rather than a byte-for-byte
build of the submitted patch, but the results support the fix on the
BABYMEGA platform as well.

Thanks for tracking this down!

David

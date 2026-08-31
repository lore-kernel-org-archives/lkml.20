Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAF46C825
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189671; cv=none; b=nCIPkL+M3VqxMmBTa6Aw2eI7z/zikiw33+YqtQISXjOE2Ifl4Odd8+QJ2sor5qA6hFt0HbK+kP0CeKtx3B0HbfQUGP6w2HWE0kwkZpbefRsFiK3slUQv1U+IzfjnyVySkLMUSBOMgJ1cWOJQkUsy7B1z5h5fcZkTfNoYYetzcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189671; c=relaxed/simple;
	bh=I3IR3GBHdAkVdNiESsyYvrip0q0uu2T6kLFw5nY8Hio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u70JSF8v+o4uDJCo7IOiEGIo5iKNMa/z91qJnBkprn1837ZhBXewrV9WNzgIbQxnbs9V42JGsNuc/l8XGC4p2M+Jdhw0PJVz7YlM1QRX38M+ixUIo6quGC7wHzYjLAOa5TyrLnulg/qaS/CJr/S6XTXFfbRjAnyq3tS4RVQwWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkCL/YRx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkCL/YRx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so28113845e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189668; x=1788794468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Upu5Sph9WjD5dUvZLJCJ1CVmGjImMqIfnouv4erWVM=;
        b=NkCL/YRxe0THu+EQa4D3X21RcS6Lr+FXqoG/ozqCCntah4y08W37h9nOUt1bRkmT9r
         IERuY2Bh355v3WbGOYH7zUsMzWNSNWvsD4Bv1FxGs1pyTa8+igGnuZakoAv3XhQHx6kr
         EzHqFaVbfOboJNY9wX564biV3mOnCZGc0lxcNN3JGYSlk30plp8sQiiOwxTKwsrJLRj+
         F7MwQGUUeqZL5GZ7mqe6lCFUO/wc4d+V7AU9EKt2G0CHhT9EZQK33j2wU2J9OMmYzViG
         a4+WX7FW8zFTv+juPIEe+9G2eQJXa+2rZRjubzYhmzoYS9ljUQlxYeVWp1k7jhLhjcj5
         NzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189668; x=1788794468;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Upu5Sph9WjD5dUvZLJCJ1CVmGjImMqIfnouv4erWVM=;
        b=rkOJRzo/rtTKcyjSvikqBzc5U1aENvAexhcxDwn0USOHShST4QRgh6Qb0N/YD59Y1j
         FsbXHH2qYfLtRjfgf05N/tU9/V20KIZJMjHkdgajGo0oGnc0ynuTqJ8sB+QX71i3b2cd
         h6Zot5oer/Nvknw/XVf/wZUhoet1LvJeZvF0kG5q6e6Ny31xzAFNlouZB/2Lsx9ON4ec
         01dINggfC7c9CPkORkZWj8IFn3euH0Y9Gd3R60cBKt5qHlg0jkm2iYrCtrBZOeqNb/y8
         H00tQWPY9QXVDYE5QWvfniRZ/JZPGZyrTbvO+UfERkpPCOtL/S5ebTFz5XL9plGcEsh9
         rblA==
X-Forwarded-Encrypted: i=1; AHgh+RrCNQoeIJqEHNYwK+inskkOqEI3dpuXlW+knOm8PRrqHpj6OjUrcKeT7KM56tGbSWb5kkbbWhazfZ09g88=@vger.kernel.org
X-Gm-Message-State: AFuF++kwHdujU3PXvfY0w8bDVSfiNEA6/0fOJ8xveHksFbpLNB828DpK
	XiFqVoB6+vAf6s63AZv8lNNy2JnMayDcZup4FupOUp+rGeL64+3bwzxj0nAGAVeCoQw=
X-Gm-Gg: AR+sD13FSnKWBkodWPVPyMZVAVDm42dz2jNyqbeRBc4jJu1Pjth4XeJoJGwUR2hnBWs
	OffxtxbN1ETpLLg9G6bT/c+1lD7NJl6cMFWywrG2/teivPhPh8FKh/In8S3al1FyyjLr8vEa8Gx
	LjyNymUNZSJvcY+tNI+GdWk3XiVCXFeTTNsQPgnaw6tmr4+tcaOJjg/KEm3dPGDhBc7daeboIlB
	VyF03i7b4zhcJKS25i536qfECormNBtNpGUru6WVVxSrRr2Xy970QzJFxNfZpaJ9ny7AwhYoxzT
	68AECyeslZrN5dIhuN7RdabJ+nOV1L0fm3xSnt408cd9XRnsd6LIYUbQwWPOTqjX3i6LCha3tXK
	xY3DVALyaH5UNQ6EgK9T1LN+3mzJR20mvI1NnmKz5UarYXfT3cMkpWNB27WIEzB4ehfM/N3zAR+
	Y2WBqTnFeDCT+NT5yiJlr/iwnEzzDjihnG6jtNr9ifvvOio/OL0ChehMgG8eHjN+zy2V+iKjNkp
	/rwCuAza/LI5dNoaTWKIv+4
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr332472335e9.10.1788189668022;
        Mon, 31 Aug 2026 08:21:08 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm528166815e9.10.2026.08.31.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:21:04 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 0/2] block: brd/loop error-path cleanup
Date: Mon, 31 Aug 2026 12:20:42 -0300
Message-ID: <20260831152044.166353-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Two small error-path cleanups in brd and loop.

Patch 1 destroys the brd xarray on allocation failure after xa_init().
Patch 2 restores backing-file GFP mask, clears lo_backing_file /
lo_device, and re-enables uevents when loop_configure() fails after
loop_assign_backing_file().

Base: v7.3-rc1

Tested: built bzImage with CONFIG_BLK_DEV_RAM=y and CONFIG_BLK_DEV_LOOP=y;
booted QEMU initramfs smoke (ram0 present + LOOP_CONFIGURE happy path).

Thanks,
Iván

Iván Ezequiel Rodriguez (2):
  block: brd: destroy xa on allocation failure
  block: loop: restore state on loop_configure() error

 drivers/block/brd.c  | 1 +
 drivers/block/loop.c | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.43.0

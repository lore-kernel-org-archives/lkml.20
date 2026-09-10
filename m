Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811058E2C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065943; cv=none; b=sMEkvR+hrbc8GUo25fOg9HVrkjq6Uz2Xh97tJin/uRYb5yl482MYKkDps21lc9i6sYf31rz8RpJ5XgzHsAxjpbiz554t5G690MVN+uSsxzwAxB390MXaTEkaKOnZK1X08nbe9gkXedlC+4PIAqYsv4B6MRLh5Ar/ilb2EmSIi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065943; c=relaxed/simple;
	bh=6bfa5/Kow0MUh/gFzvMYkVRlSGVVu+nikP/pqtML6p4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a3q90mrIeTnt6egCYn/wchWyQle4CjK+QB0sQisI9Bfh6Ry3MiuCqABa5vw8akywsFjpXPTm6+6xzoWd/R7f8ZXWJ7z6/t6roQH2mfzq7Tv6t/gulYdPC8orgHsAxi8Yxq2ctAhC14hFyyifKz9SuQT+H4el/QlGeIOdRJYmJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXxPy6q0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXxPy6q0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso165515e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065938; x=1789670738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFwsI9simMxQb02NAezYgKw4f6SO8os6Tv0e8NhfUjA=;
        b=sXxPy6q0SBm2PG9WZ6KALejDq2eXolvRgVAkje5rSDbnm1smSg6WtB2toYSVkrsNX0
         tS2L5LRsIYsRooPTNqcxVkgioc8Vq4WlWnpO6qfKNG4E3nJqX5nH4bJZ242avNtCdRJ6
         eYBARoBhiiJEjsXskEBVp9eD1TKGY8qW5ry7oJzPAjnOvKy+d+IzLWe2mr79QRg9Wtdj
         KjvMENcvHaMxIqAYSFuw+s8SkBiYyqwJqDegi5p/Urzdd3RQY3fWu5N13920OJVH4J/B
         IorbnboXmkY8V0HGM81d97WfFWqeUC0YJA4m4NozvAj1HB3B9CTfR3GRUCKYCydITFP3
         YFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065938; x=1789670738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFwsI9simMxQb02NAezYgKw4f6SO8os6Tv0e8NhfUjA=;
        b=JT1UOg8H8zjKKqTC35hC21z8ynRuL/aDzbeu0GwfIsS3j8PvnMC2+icM9cWGzDWh3X
         4evx3sE2BJqMk+7/7kKSCUEzkeu7jERxsY5ahdWknAmcP6GOVtx6XfgjIjB0mbF+MypJ
         RAWaKHM6d2Acu7r1iEcLDySRlFqXdjZ2zQG1V4u5AlLBXxFteffKqS25E6h2zkfIK1pQ
         xtJSOYkeZfajv35JbVr9aOxAO4MzgF1zOe/9fFZNNeB0v4CM5h2MElhUMU0vFQeqOa6+
         X1N8RDXh5n6Po8Hb8pjbKToOWNv4DN5fd6LAgBTXzTkXtPU4rByOt5ihrqLt/c2VHuj/
         ZxNw==
X-Gm-Message-State: AFuF++nCdZwKXvk2hkDNBgXwCwt0c6eb34Hzmfzl6cU7bi+abh/76MUd
	Cig1TGjA9u0DJZh2aWIdmpYwkX+r35D+hFjXmqDmW+OD/xI7vIX5B70K
X-Gm-Gg: AYBFou3teSmNrqrL2wWjJDuTFDUc/WoaSc7gTtBavoxdLq51PyEiOez+TEt3w0xoMSP
	9I2+L59+us6ZBvCOlEXEYpcFOXavoKkToWCGKU654jw00dREJxgKp/elB0cBPMD7wBbyIPQ1JrV
	5Nx21RlgGUbotK7LIx5sgnLKDPO5VQfQtRWrobid+44WnG+0LbprEpmXssEuW7gdD9ErCVgFRCz
	S9naaJTv2920ehtWlIMz4LNiv8ADM+8+BwvJG6mOqmlqD5YxV/+CPPVpZ66FrnschOVice5sApw
	fiHZh06Pd81vRs9PYDdh10B21ajbFz8zKQcsd3OwLX1YFHZDjRwzFjgaHhoBNvzlm8C1ZYVhfu5
	hGub3XTTo/Jif+5uBKvgOg2eqo7vyv9l9X8aG/ihoIIRZR3bQA7PJAnD47FI6GOXkjRycW8hnXV
	zoFn7A4kz2w5gj/9nEbrRXOIVtxc5aEHt/mpBE8dN5+fPijVDm/IaqWweFDh/kIMI3xB9zhrt4h
	kjiFxVB5ggeKONI1Omu
X-Received: by 2002:a05:600c:4e47:b0:49b:910c:76fb with SMTP id 5b1f17b1804b1-49e619c054cmr3478415e9.2.1789065938294;
        Thu, 10 Sep 2026 11:45:38 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm18760055e9.14.2026.09.10.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:45:37 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH 0/2] mtd: spi-nor: fix the unlocked restore on shutdown and remove
Date: Thu, 10 Sep 2026 21:44:50 +0300
Message-Id: <20260910184452.895485-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two threads can talk to the flash at once during reboot/kexec and during
an unbind, because spi_nor_restore() is called without nor->lock while
MTD users are still attached. A busy flash silently ignores the restore
and is left in 4-byte addressing, which is exactly the failure the
restore was added to prevent; a restore landing inside a read corrupts
the rest of that read instead.

I reproduced this under QEMU, using a flash model extended to implement
erase busy time. With an erase outstanding, spi_nor_shutdown() issues
WREN, EX4B and WRDI; the chip refuses all three because it is busy, and
each one still reports success to the caller:

  the flash was mid-erase when spi_nor_shutdown() tried to put it back
  into 3-byte addressing, and refused 3 of its command(s):
  0x06 (four_byte=1), 0xe9 (four_byte=1), 0x04 (four_byte=1)

four_byte=1 is the mode the chip was left in, and so the mode the next
kernel inherits. With the patch, shutdown waits for the erase and the
restore reaches an idle chip. The reproduction is deterministic: the
workload keeps the flash busy continuously, so no timing window is
involved.

Two caveats on that. It runs on a 5.10 vendor tree rather than mainline,
though the path is unchanged - mainline's spi_nor_shutdown() has the
same unlocked spi_nor_restore() call. And what started the investigation
was intermittent hangs after kexec on a Zynq UltraScale+ board, which I
have not tied to this race.

Patch 1 fixes ->shutdown, which every reboot and kexec goes through,
and is marked for stable. Patch 2 fixes the identical problem in ->remove;
I have deliberately not marked it for stable, since nobody has reported
hitting it and it changes how long an unbind can block.

Note what patch 1 does not do: the restore still runs with MTD users
attached, so an operation starting after it completes still addresses a
3-byte chip with nor->addr_nbytes == 4. Serialising against operations
already in flight is what stops the restore being issued into a busy
chip; fully closing the window would mean stopping MTD from accepting
operations before ->shutdown, which seemed too big a change to fold in
here. I am happy to look at that separately if you would prefer it.

The patches are independent; patch 2 can be dropped without affecting
patch 1.

Itai Handler (2):
  mtd: spi-nor: take the flash lock in spi_nor_shutdown()
  mtd: spi-nor: take the flash lock in spi_nor_remove()

 drivers/mtd/spi-nor/core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)


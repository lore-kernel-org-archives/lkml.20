Received: from mail-oo2-f29.google.com (mail-oo2-f29.google.com [74.125.231.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037DB388369
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898137; cv=none; b=GBz/Q/wfEWFYXeuNPc8Yaa/ETbgTb1OapAM6Lz/9G+zaVqEvmpxfwj8FtuuSlt7+0XrcV2odOF33ggTNHruE1M75+rZznjtOrPYjNp5CrSwCGXlayIr1j0egM4wBxI2/4bAUZGv1+CB56YgUdW2rBYBxqUiVEu//WJfotRJUpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898137; c=relaxed/simple;
	bh=/kMit8CUDaP2BflI6bC+09wX3fqJwv8fLnZxYfqIkgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cc39TX6FretGuaU65S6O2gbF0shs89kBt9PW+DpWzhUQVhgv/eC3ilHMQzp65RH1iyxGjALFk05BmHzIxBW6qWTf6is3kWIhenDRMzf+/V9oqN5BOAtpVsgHvCQc1pH2+rza0XlflOsU9EJWDfdJfXTc18vFiAa0OgbIJJl8go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tamu.edu; spf=pass smtp.mailfrom=tamu.edu; dkim=pass (2048-bit key) header.d=tamu.edu header.i=@tamu.edu header.b=GzgtppxI; arc=none smtp.client-ip=74.125.231.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tamu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tamu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tamu.edu header.i=@tamu.edu header.b="GzgtppxI"
Received: by mail-oo2-f29.google.com with SMTP id 46e09a7af769-7fcc35eeb48so215322a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tamu.edu; s=google; t=1788898134; x=1789502934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cpZBZiNkX1boADxTuU2IVraCPujz/4cVmGXwbGYdtrg=;
        b=GzgtppxIDL/LhxXRbBfnTCRUpuvgQ9f9hlAu2dLKdN3vqY2Tk9jNIlNX11ACGrSXwQ
         FUNtmXfyRVRbo/qRL1Lxyd8sUb2mpmQzlAP3wHQbClgGDeuIZZTEPnxaogPLzaKJP44v
         kWGsvTNzbeNmPEjtf9J8Lv7Jqpt0kenHQV3zKWnylPYfDwZVajObpvUFJqGAzGTxe/2L
         M9978pleCh7C+Iw58Eh173jQPq9oIbq3KlaBbLeFP+qUVxZoKKQYwDgkyqjUEGNYlaNw
         11tXwDBn6t4e5pyM5pnPgx7DPN7AunkojkjaixANUlA1CnmqO84C0DJG8fCnq419otOn
         tvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898134; x=1789502934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpZBZiNkX1boADxTuU2IVraCPujz/4cVmGXwbGYdtrg=;
        b=rUhW8rqdN8B3kt3iugivedpyZKi0I+vY6Nxi0ajkZ7YQlS+u5pCQPQ1LAg9FtXdGrG
         hzLq4vJwezG5jFT3xMbYcOgdBTAMT0mZtkUqSEatonyTwSgSVa66va5+C6CSymnTHxpa
         zP0iJJAs+mk/qQiwg2NoBnv79Rl9oLpSuFsVBd+v46bnEnhEKvX0mV54Km97J0WNy17s
         9jOIblJWgtlu2KQjTRLrJ9J7qX06YUnipurltALaLmddhWxeYpIj255/3TQzL3PapAZw
         MQ/RjrqjIhtfdT6l/YgpTA9bn9t/tYJSKxDYhf/1q9/bznh2E5eUjTvrtYaZwqtb1U9z
         CrVA==
X-Forwarded-Encrypted: i=1; AKwUvBxOkuq/06WiqKxUMEE7IBloO5qBnYMIQ4dQiySocyAeWpNZT5VXSmx9uQTDXr2Ef6CegtF0qpzEIffCAkY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2qwlw2jS2NnnuQfX9stbSkX7/Kkq4e5hvXlM3ERLXalkk9JPc
	U4cJBxCie2c/m2/EIP1FgEaYJVM1AcY3KYGGjCEdyFvTuj9TJiP+94S91Wr1BbvnPbg=
X-Gm-Gg: AYBFou1H3gZz+hJYJJ/rekJD/rlr2PQBIepMNlGdjc6ODH3FM9avI76XH7zkQ87V5tQ
	MNr35e7H8++Opxc7m3NPMYndxPoXIkdYg2KoR9vnkZcxRsyb8YbJ/0gXVw1Li/jQMvMwcJsZyRl
	Tfd7UiFoO81xW32ujnT4ZiLJWTz6HYC/vVnG0XKyr4IGg2aUFHLW2L/CVFJcb8C9qY4BkWC0fDn
	CKXcXjylXjKOKaNHwaHDjJVJoFNcelGUAh+JSO4crpJfikwXU5AHhq5dNUlACwwUZtWknQDyFRm
	njDcktsIPWafWO4ZgXDtM9TePHkg3ttAo0npxJZ081zfVPq5eW5wpANHeDA3pPsAhr39Atojnl/
	gbOzOTAwmqWBL8lgo0hOYNu31qar+44v/FBtdG29ig7J02gDWGtD5RxHm3pWNDZ9F9NzNLlYXHC
	nWWi8MZkNvj7xVnLZrgwnQQ8Mh8QTL+0m/dLy5c2YMAw/RGFn2WAid4vd4101j5u3XizxMfVbF4
	3GwIEJw331ENwRkwjgC+2VIEtu8bu9DftfPRZtmb4Yuub1QK0eDdvUI5Z9He6JFm7URzLc=
X-Received: by 2002:a05:6830:3499:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-800f1a35138mr1966540a34.14.1788898132377;
        Tue, 08 Sep 2026 13:08:52 -0700 (PDT)
Received: from fb.keuhufpvur4u1eezzhu5ttlizh.gx.internal.cloudapp.net ([20.106.51.18])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f5fsm17086281a34.8.2026.09.08.13.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:08:51 -0700 (PDT)
From: Qingxiao Xu <qingxiao@tamu.edu>
To: 
Cc: Qingxiao Xu <qingxiao@tamu.edu>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rnull: fix geometry store check-then-act across lock scopes
Date: Tue,  8 Sep 2026 20:08:43 +0000
Message-ID: <20260908200845.405112-1-qingxiao@tamu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocksize/rotational/capacity/irqmode stores check powered under one
Mutex acquisition, drop the guard, then update under a second acquisition.
A concurrent power-on can create the live disk from stale geometry in
between, leaving powered==true with config != live disk.

Hold one guard for the powered check and the field update.

Signed-off-by: Qingxiao Xu <qingxiao@tamu.edu>
---
 drivers/block/rnull/configfs.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 32c10c3f4..66ef91b3f 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -174,7 +174,8 @@ impl configfs::AttributeOperations<1> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
@@ -182,7 +183,7 @@ fn store(this: &DeviceConfig, page: &[u8]) -> Result {
         let value = text.parse::<u32>().map_err(|_| EINVAL)?;
 
         GenDiskBuilder::validate_block_size(value)?;
-        this.data.lock().block_size = value;
+        guard.block_size = value;
         Ok(())
     }
 }
@@ -204,11 +205,12 @@ impl configfs::AttributeOperations<2> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
-        this.data.lock().rotational = kstrtobool_bytes(page)?;
+        guard.rotational = kstrtobool_bytes(page)?;
 
         Ok(())
     }
@@ -225,14 +227,15 @@ impl configfs::AttributeOperations<3> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
         let text = core::str::from_utf8(page)?.trim();
         let value = text.parse::<u64>().map_err(|_| EINVAL)?;
 
-        this.data.lock().capacity_mib = value;
+        guard.capacity_mib = value;
         Ok(())
     }
 }
@@ -248,14 +251,15 @@ impl configfs::AttributeOperations<4> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
         let text = core::str::from_utf8(page)?.trim();
         let value = text.parse::<u8>().map_err(|_| EINVAL)?;
 
-        this.data.lock().irq_mode = IRQMode::try_from(value)?;
+        guard.irq_mode = IRQMode::try_from(value)?;
         Ok(())
     }
 }
-- 
2.43.0


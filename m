Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8F3F076F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197530; cv=none; b=Ib1WAqBY/0HdEtNN3Ogc+QAb1s5uv16JpoBuhgF5PW9CeZdWSVpuE2yU44iuU82JoGw4GExwWTvKvI1G/neRLNougIMJWj2izU0YhIfzCY2VDEsb+gkTI2l9baH19oHqQ+zaEozQ0ZQ4UdwbfHpfNw9VtfB/dqA4eUCaZjbGojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197530; c=relaxed/simple;
	bh=icmX+e8eV5T7lwdK+/Ae7/ixgFSBDIOa2J3Wav1g/+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmPpMoBjhMKcL83NwH41W3Z23j6AXv31iSWxRMOeut3v61jzHWBjW8BgCr2/0VEvacne8BjovffO64AaLXpFZsi9OIPrlahR/dnHvS5GBMU0zblgYcbcy4pEMHyDPl478fJ3fyW7bayK9lOQT14VETlmtAJSp+wC7OjReGennu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7IP7bhH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7IP7bhH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso2466918e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197526; x=1789802326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=W7IP7bhHg4v8425hAcrGW4dD+vnuuEWnKcpWjpBdN2qfJSMSkUBPy3L04e0FQq65U8
         KGJ8KJYP5qQnTjXvXcyjIv5wFW4C6HIJimoiDJnuKbVxzWMQJiZuCMOdKwrwFyPo1eE8
         WkZbfSlanz42qiqaU0jDaiX6rHZjmP2TLFQ5YrJwz9H4WN3vTFQ9j/keyuqdAnwWJ2KU
         19YNL7W1TRl/kTm9DFGtq2d4hLGNK3V0AbejEwpUALAt4QHbO805HbEtvdTn1L8CLgL4
         zCWdX++2l+YllCJLwT9PF8a4PgscF250x9d+KtC1KSjoj910mBc4nf5vy5YuC+IPZ4NG
         6DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197526; x=1789802326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57Wx5MSpf2ecnCSxZA6V8UzQ9jEpIiGdt0LOaHjR6Qk=;
        b=kDSwcHLCnutxzNQ7Lg48rTGc1Uprm6HHiLEeQoQ8EFUUnlKSRDyrxQXTVPrgVKvDFm
         3nR1bO497mkRl3jXR+eFOJRgf7/TAWoSVJ0BMSn2+GBnGhuoYLmicc2OnNpS0gxo4OdF
         f+dd58FvHz73mtLrmh3AVbo8eerlU+m+HSY1mPC2hK3pyojV4r/HMavUS4zq1luDar+H
         KQlXpIeNcmREUW8P5WCy6ndH1Dq0DJqhdlKEgWOo68P/nmp9RoByLE7YUI8BkCz1zYDl
         GwhIKyBAEEA3I7GgxxRObgzQM+cwjGFEhhr8gmr2j9QC14g+4am/Z0JFfQh/mrKSFTbD
         XwpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/t5YJtnH59A9bGuegF/iesBTJXeIPxMI/SofPzkYPDkNQ2edStYNw4WJ9XhqS88UmIlW8OLCMTeynmPA=@vger.kernel.org
X-Gm-Message-State: AFuF++mTntB1XS3vYt+4bjsu+kQ8FxV+Bo523bJXtC48qWzUGGJnqghQ
	M+xgTmk/fLnG5UmU64QYO+oek8hQCKS+YDw4U8G3pcP9XriZgVKV4UMj
X-Gm-Gg: AYBFou1OUiw0uwn+wNv4cmTu28/5tBvXrjb6jDKeslYXKiCy9pK2j1lXAhQ9XqoXxM9
	PB+tnE0nkgTvTSikzZdtUshIdI1roSGPRErRTpuGaZW9og3VPwvChRF4RqDS4Jj1MpLdSu3gHdd
	JDGNLxw7mxwLny7nObUXMg/L9cqsvAc0XhMtJzkXt6N66saVB9htoRyb7sIvs/WW46dWa7+SsA2
	1+C62BxEicJWPY54VHnSgZODVJJm0IwpfuwGWr1CkFJqJGMnMgwRZG0FLPOlJg1pnoktYcUBvOY
	2fF0Ae33zVxRvQRjOWUQq6UZMNOmuJ+nOk/F8eAAkRUPtxoqOYn3xUwrHFo1QNe1xkeqVTtRweh
	DQiIdDiKd4YguWz4J8eNVg7GTGVCAJW2gHlJA5T1KWBsG4KE/RsX6OEJ39M4ROR4UfVSSwB9gni
	MHyrTnN4/h1GFOM/XxS7X61UGjZyZdEWZGzWwxizUFplEXfEuXZx2JSxVDYv+qJNBfyG4aNt/jD
	OUWCg==
X-Received: by 2002:a05:6512:2246:b0:5ae:b7ca:33ec with SMTP id 2adb3069b0e04-5b8a02de7eamr1453366e87.9.1789197526260;
        Sat, 12 Sep 2026 00:18:46 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:45 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 1/3] gpu: nova-core: build the debugfs guard before registering the driver
Date: Sat, 12 Sep 2026 14:18:40 +0700
Message-ID: <20260912071842.622696-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init() creates the debugfs root, hands it to a static, and leaves it to
DebugfsRootGuard to clear that static once the module goes away.

try_pin_init! builds fields in the order they are written, and an
initializer that fails drops only what it has already built. The guard
is written after the Registration, so a registration that fails leaves
it unbuilt and its drop never runs. Statics are not dropped either, and
the module is unloaded right after, so the "nova-core" directory outlives
everything that could remove it.

The next load then finds the name taken: debugfs_create_dir() returns
-EEXIST, which Entry keeps as it would any other pointer, and every
debugfs file of the driver silently fails to appear until the machine is
rebooted.

Build the guard first. Drops still run in declaration order, so the
driver is still unregistered before the guard clears the static.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/nova_core.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..11fe1d2858a9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -47,7 +47,8 @@ fn drop(&mut self) {
 #[pin_data]
 struct NovaCoreModule {
     // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // then `_debugfs_guard` clears `DEBUGFS_ROOT`. They are initialized the
+    // other way round, see `init()`.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
     _debugfs_guard: DebugfsRootGuard,
@@ -61,9 +62,14 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
 
+        // Fields are initialized in the order written here, and an initializer that fails drops
+        // what it has already built, so the guard goes first: should registration fail, its drop
+        // still takes `DEBUGFS_ROOT` down with it. Nothing would otherwise, as statics are never
+        // dropped and the module is unloaded right away, leaving a directory behind that the
+        // next load cannot create again.
         try_pin_init!(Self {
-            _driver <- Registration::new(MODULE_NAME, module),
             _debugfs_guard: DebugfsRootGuard,
+            _driver <- Registration::new(MODULE_NAME, module),
         })
     }
 }
-- 
2.55.0


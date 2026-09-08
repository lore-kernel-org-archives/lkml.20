Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690556B84F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890104; cv=none; b=NmGfKXIMZGqycB89tTmXl3p4Ce/90t41CL3VwMyyv2vfeQAk+pLWNvdzrNsT21Q9bg9j3wWJTmZfqWPxx6zkOlSz/6oLWyDyvjeD1glqZit7pZU9VgXCM0wVVE7KeLJgv5FRb4HmuildyeJiXXiH6kGAnGeawiWsDgXukw9bUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890104; c=relaxed/simple;
	bh=WEgSelgW6dSVZwR7873ma3ZTENwuh5Q4mLYDRSu3THI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFh3tYJ8qM0GFW2pp1B5tOCLDtG+7P5iT5XfufigFkJl6AU+2jYn0MBZG7eWEZZKoDIgSw3i7Gu9PfvrmB1QYOG2Y569VVLcSBL1rlSF2uM+p2HDXLQtvrxLkLN16ALnWg+p3MQiic5pbXnDTuEmb2OWV0Yw2HPsteNEQUOE05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfkzoo/A; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfkzoo/A"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so48382501fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788890100; x=1789494900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3mHm6ZqbhRQ6tXzMkeFKmTWTzRDfTiWOZtRcgd3yZs=;
        b=kfkzoo/AZElw9KpAw2f9P6Y/dQ0SkyixkcnueVCD4dBsxCOpellhgEURzPhpf5qe3v
         i/7xGqvEfUDFM3sO+/47sbTQEUmJqG/0a7b79YhJCcuQrinVyzJF2X3V9bOsyBP1urm+
         hspF0yf2iCcLPSFunwWmWSFeiY1/eG/jBwI/jw8HuZAlI4DkD7zXR0EqtqAgyp1l/L6Y
         jiDPRElwgyqS1BNMvA5tv0Qu1f+VT73+mYkKlghq/Q7Xf8fOTf3RFxs0zsI1DIa8giVI
         q4ZzQ37CnzuIiR1/E5yMYiFIipFofaMJCpCaPzdoQaYWDSuKrkaB3M17KGQ0kUpOvruj
         WUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890100; x=1789494900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3mHm6ZqbhRQ6tXzMkeFKmTWTzRDfTiWOZtRcgd3yZs=;
        b=VuEXnRyvMSQ6QfbTvzi2X97/je22olmI0xEs7gcu8fubjxNuFcLIOr7PSj2ZQn/Veo
         aUmr2K9hc7zrOZgqybz6i6O739Fk3gQDj1jul68WMrza6DDscjOMALq2T7BWyYQ22Jkv
         YgF9iBtg2c++n6qyyNJnSA8wbtkQ4S4vX7l4YpPoB8GWi79CHhJVbvfgP1Rarjo52urS
         FcK7vNzP3B/NcIoaLflrY8Kr9mMIIbvHQnWn441P8HmGcgAoK9hjDuk3lOPH4nPeoe5K
         yBcnnrqqaxoEMe81zH7abaU6OEZg2pRrcMqq4wF7Gz+3fWvL7BYtAm7kMCQ6jNDcndnl
         xrbA==
X-Forwarded-Encrypted: i=1; AKwUvBxyj7f3q+oAQSXaXOUQMeG173YuZaTnRE2/1XZP0F0EjNIx7RD/fsLcEtXVRY/AnhImkdg56eRreT9hFBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lX9ITPfz5uv+YA9e75br+UEvMSX14NS8jAvbf5PMNJBh6IzgNN
	xcN8PRwTnAKQDKHiVQ/PurqRKka604SVtDuveYMwdFmBc1CCtaVNyHMx
X-Gm-Gg: AYBFou0ObswKMN/26L2keb9xj0Vv1C6ajAB0+mkjedP6sN335XqbSWeukQAxe4Vr05u
	E6L9ycWPwGpaWQF7xCFvMjGlF78frbCnQMoJQLcsIBo2NDUO7tJ2Na7ojV9geUeGEed+uxli++A
	pmZ/9UtFBcTBjrVR66gQ900YcP1sSItykJ5vZJe6V4yrUqOGFG+huPeqazW0KW3Co2ZwenKWWLz
	Vm+sqhcB3CsgAp7kQZVPOnt94CefiiIOdDAiKBUP/Oj9fdNMR6dv/e3LyWb9puo6aIFcTfJAQZ2
	SVA4d876p0e2waiD+JKMFoTsCJbyJOGn6JaHpeyRuhcKRXKSNpLI4iHqE+IWLCOqZCU/3Z8R+Vf
	mk/ZgPLyAF5HGG8diFPBwtJqw3/Bi9nY3nURm7ZK+L4VIoueABe5X4B8TXucEvKZbo0zlzWIj24
	hrLUCui163HwVoIJqQd/K09O83394ix0RTi/EjNpEebuGL8yFXyrUEPxkZn9CUJbbPN46Rc06HB
	or7KuwxNBFS
X-Received: by 2002:a05:6512:8393:b0:5b6:1836:8082 with SMTP id 2adb3069b0e04-5b6183683cbmr7614121e87.28.1788890099983;
        Tue, 08 Sep 2026 10:54:59 -0700 (PDT)
Received: from soda.int.kasm.eu (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fcdf9sm3172156e87.46.2026.09.08.10.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:54:59 -0700 (PDT)
From: Klara Modin <klarasmodin@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Gary Guo <gary@garyguo.net>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Klara Modin <klarasmodin@gmail.com>
Subject: [PATCH] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
Date: Tue,  8 Sep 2026 19:54:27 +0200
Message-ID: <20260908175427.47207-1-klarasmodin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the commit b67d2d039f64 ("drm/gem: Add callback for when handle
count goes to 0") added the handle_free callback, it did not update the
rust abstraction, which will cause a build failure when that is enabled.
Rather than just adding another None initializer, use
..pin_init::zeroed() to make all unlisted callbacks None, and remove the
existing None-initializations.

Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to 0")
Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Klara Modin <klarasmodin@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 80d8f524f9d5..af8274134a71 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
         free: Some(Self::free_callback),
         open: Some(open_callback::<T>),
         close: Some(close_callback::<T>),
-        print_info: None,
-        export: None,
-        pin: None,
-        unpin: None,
-        get_sg_table: None,
-        vmap: None,
-        vunmap: None,
-        mmap: None,
-        status: None,
         vm_ops: core::ptr::null_mut(),
-        evict: None,
-        rss: None,
+        ..pin_init::zeroed()
     };
 
     /// Returns the `Device` that owns this GEM object.
-- 
2.55.0


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457513C1411
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505940; cv=none; b=MdqBCAl8nFQ/7tzpCsJjKXv4RIyX92mcASYHemE6vrjqV6EEGDtQW3IRK9LYi+UgKT5+Hg6CNPzYH9OMrlqplX3Y/r4Hs4uMd2KSj0f/jqEb4cz9w2AkanR9+JLlnkCJyiiS78gfHGtiqfPpwbG4RRRx5X3o0x9sMoon0Y0o6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505940; c=relaxed/simple;
	bh=homsJuCQjKnZ0xNxouQDRH+hnm4JjTgYjqEZCArzYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3sWjgpVdvZHFMSAPwKoHHYA7Ut8rKd/WskVPP6prG53l103PoZvFr7eW7cPJUcFspnPoCfFYUoRQOErU9ZAMXcTaaQVncuvhAFOJjcHaJINYhEoVWpkVvLysN+dKPdq5QvBNoRcaytsILhc6FL9N7UGo4v+FUrlDNLoNKSr+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQEdWXFm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQEdWXFm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so11192325e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505936; x=1791110736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=EQEdWXFmy9ti9tUZ6xGQ5Xrd78VOiGMy/Ymq4O0XQB89MelfjgsM4Y1dW3yIJhy40X
         6HyKTERfAiF+/6wO4rs8cvgKpKDu8qcAq5d8PGZNoQDK9cM5N3hUDKxqE7HRCKAmhDjW
         QoVshXC/2OQLun4RiEsUmCUL6X39zojyjPSAYH2ACHHg1PBajhWgok4NarzuMmkzUICO
         +ktaX8BeXYvkiOnBDs4lUtqb0GHze+Hz7h13I3uvHiXFStBoEfYKmAapWKOcfUREX+Hl
         aGv6omBzA1D1uINsJ3YqSzAeFqECCOdyo/m/a1+75BVtzByqPpYj0lpqXOaZIfYpSUbJ
         +bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505936; x=1791110736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=XdYHerC0Ym0K2QA863/NQ//efA+HTJS1ybNkb26+4d+8SEZ+5+ro6gXS7ab1sVpJ4M
         3xdSAcLLz4ZpI1l95pHprtmAE5tjSAhWWaiaVUgF4vzNjbGVGE7e7DNq4h+ut2lHb00a
         fN4h4FUqzjKSIqTu3k+YOFcgR10gOeq3IM7B6cw09dmn+JhC9rF4jCDz7gwNkIb90Qsk
         doCVfv6ZwD28JLILuF80SXMBM/z3SwWrAorNE7zPdMR+57wvKczmk6dWwyV5caNK8kmb
         Vjfk/Euq9CZUeO+AvIleJy1drLdE0mWR4A6AO2ahgG5qfkwcaFOjLoCg5+Dou1WQ+dzr
         3Dqg==
X-Forwarded-Encrypted: i=1; AKwUvBzf/q27FeIt+wEfIlZc8sI3QaeV7Mgk7z2RB7UxO8JRKNKER5Td/aQlDe8u6omuNi3kw+9UEAMyzRiLwJM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQqj8KpuSPigpiyk1N6wLp2gb0ZtCeV0RAyicRDZLIS5yIoSfd
	k0Il3aIewm4EuVs+Ve9+f5QPwHC6gvX2jhwUUxQpzBLVCgiLx8WPlT5V
X-Gm-Gg: AYBFou3EKRMtBbOSb2E0YIqLSQENs+W5mby6WNxMQ2ucW+cOCGRHVdZwOjRd2ux3VI8
	l4CHA8CYYtI2m6N+sNhvQ4UFCw9oW4XPBHePczX1B6wsfPMa8236EaR6ysKZr4Berbf6nXxySAL
	48Jia2dSTaUEL/0lo6yC6v6eI5RDMx+1i/EtvZbXLgdtEBRZIhzq/EJFKtNKN++Cg/9gkblom6l
	tgK45xqvdAi93GNtXmsh5F/javEo7bQa5KGbEBwim6wpfqEVl3J5+8EiZz9+tJvoLKGtZU52AXz
	tbpaBWcycjJZdi+DbugBKwvELO+ZxPG4b8/y1k1x4d2Iag2uAdiSbCMwTclaF1XzhMnB2c7KySF
	uc/obLOHAU2sYosnXDkiRk/1gHKQlyEASDPCkiITjonhq3QDz6xEfKId3fbU/acFqgYQ/NfZA+O
	FAxDpNgjA5V6PEIOajqjufyYAWw2qjEvvv3IP1e1f44nXIhTeMrkPrPnKvlMUREps+TGMM61Vrc
	IrvE6Yh2cMKkSsuIJHWy09F2zbxoLt+Hx8IDsTVtPQZR6JS/WH0FmpVgzqGfp/gGNQ=
X-Received: by 2002:a05:600c:3b98:b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-49fe66f187cmr202438815e9.21.1790505936299;
        Sun, 27 Sep 2026 03:45:36 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm46005195e9.14.2026.09.27.03.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:45:35 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rust: serdev: use DropGuard
Date: Sun, 27 Sep 2026 13:45:27 +0300
Message-ID: <20260927104528.103881-4-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
References: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the serial device bus implementation
with DropGuard.

Use DropGuard::dismiss() when ownership of the private data needs to be
transferred without running the cleanup callback.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/serdev.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7f8d..dd43b159b461 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -13,6 +13,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mem::DropGuard,
     new_mutex,
     of,
     prelude::*,
@@ -21,10 +22,7 @@
         Mutex, //
     },
     time::Jiffies,
-    types::{
-        Opaque,
-        ScopeGuard, //
-    }, //
+    types::Opaque, //
 };
 
 use core::{
@@ -174,7 +172,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             }))?;
             // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
             let private_data = unsafe { sdev.as_ref().drvdata_borrow::<PrivateData<'_, T>>() };
-            let private_data = ScopeGuard::new_with_data(private_data, |_| {
+            let private_data = DropGuard::new(private_data, |_| {
                 // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
                 drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>() });
             });
@@ -204,7 +202,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             drop(active);
 
             result.map(|()| {
-                private_data.dismiss();
+                DropGuard::dismiss(private_data);
                 0
             })
         })
-- 
2.43.0


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB938330C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444010; cv=none; b=g7ShBVfS4X4hzPnJ9MetZaka5K4j9Ru/AzrwlCIrzuJsrdYuU09aeX4cggoA4/g8Op0WCcVwc7H2kaEmpmKaUdgv8mgSgpzmQy3vM98uozODXXjT8e+qTTOMTp3VasrsVSQkwl2XKvbqoSPFKgr7JEO7C4LHyGBKu+eD55D+Eu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444010; c=relaxed/simple;
	bh=kF13SbON5k5Arvp0ikMg5xGDnjZmmTCAm+geeOVzYi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cI9/nyMeJ8p54d6MMTqNgKxAQsn67hcUqhF6B7O1VBM2yyrrIloy1Y8YMHYcCw3MpbLf/YwYr5wWsWFMk8FVGkHSket2ChtDQHLSTT2LDJIzqfC3lhOY9bFbd7Y4R8/sB2slZmV698DakeIW612U9fIYrAOUv+widzE15YIrjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io5hzDwL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io5hzDwL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso4882905e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444003; x=1791048803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JwW6U3iTEHgPApFOC8Hbz3JJt/r5iD7r/z62SOkAVw=;
        b=Io5hzDwLZnNhse/D3h+ME/+td4XWA65rfniDJD+4WPNsQKhynYvNhga9dvh7JRtLOI
         nQuKuKKHSh9LRl1kHl00BtugSq7BpGM3FoYo3r0uXGMkoeQT+tAo73H7JX7M1uQuwtHQ
         r+3DJHkaliXquVdamFUIMd4ulRMboXGgIfXsOQy99M2ZugNPFaF3AIPAwx8Uv0NePYiW
         WanRUq15FDo0ETwrweB54kpDY/RRidmgXYiA6s4fEdix/lDAUyZ5ysqzUsfHmbeB+Sz8
         ryVwcVgKayghLGnf1H6ir36FoSZoQF1+CQvLpt5vSkpx9GKrPw3YmjGKrFVDDDbg88xd
         O64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444003; x=1791048803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JwW6U3iTEHgPApFOC8Hbz3JJt/r5iD7r/z62SOkAVw=;
        b=Rq/1szHUHcu81PnEjN/R2BSQAV9ekIFo/gCctpFrg2Fy7bEtJqwm06B8+WrdeXxZww
         TnPSfwKHNYcVDLTA+6rNgnMI0xXPd2VGIhcuumHiULK5CBCNECaEtF6gRigzq8UD9AZb
         72Fv4uPPdGs5QqbZRqE/LQmLOXB85C4R60YigXTeXlFBJZ51/JlTc62n+NBsMYIx4rp5
         ZPx8Nmo6/KF9L7IQuCGe4xQf2Yr6Rq8Y/TDPn4ruZylgFbf6kWKot9G5rqQOTE/BXgrw
         p6HmUTeiNhG4ivl3AzcdfogEHkLGyplW0HXVEfr2OzKAvqMAwqRE+9WlVDuU7zxiS8Zf
         +ORg==
X-Forwarded-Encrypted: i=1; AKwUvBxlijFqg2AWETFUS/4OfSBKydVsVd29wpTJcdomXru3LYhZ8PFsk6KVroop1XP58GZfKjuNbolIazx2asA=@vger.kernel.org
X-Gm-Message-State: AFuF++kBon9ybt6H5oUFqWebo7mwjTPRpH8wzBB9cewVGQmTaFVR9Efd
	RuxyzDLvyJCZ7nLW4380mWdASjadje8cLJ7yRDTldynUamZmyHNO5a5S
X-Gm-Gg: AYBFou3iV1r2QkcS5LPFupjt59Vn7ytTNdoNkulrz2Kyez2e3hur0f5uXyUXE+fXaEt
	IXdI81GXNEItv7X/kxQkrdwQ8ydEikOkBNMS4FhUJ1EVu5i50dLg2AuC18wwfm/q1OIkTxrm9xi
	Hq1jX1hK3hBwVU8jfQAZWk9bWoZB8zgr4XdVrnSWO1/BRPLl9fV7ezqPhz/bETrTMxPRG9FbLZO
	FUt1yYznPA/+sGqK3CVc1TwKKbq/4xfHJtq7MSLVm2CEUatKAI3igEl0fJbYMtFk0KOqIaRhzca
	Sl898SLQ4yMBSPABbXhZi6+3XEWBisf8pyxlS1v/RnyynqEzjZse44GunoGOY+s3xZ7dKNbMKiD
	e4Prpe6drlPgQ7f4fGJGzqfycnZgeu2U11BGatV+cxyVd+DAN463efv/GrPeLu2cTFuTtHnghBi
	N2yUOU/JTzxDWebwNHuX5hLKkStgamNPZc6wEOyV/vkV9vl5CqYG7mP+fgF/CgG5mR7bsvyhiGr
	kPK+WKA2OeakH0/E9EkD4mQprXNeKQIFjdx7Vh9OY0o1TG6KpsBdgI4zEM3qJJXuak=
X-Received: by 2002:a05:600d:8482:20b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fe67bc264mr118603405e9.29.1790444003312;
        Sat, 26 Sep 2026 10:33:23 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:23 -0700 (PDT)
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
Subject: [PATCH v3 3/5] rust: block: gen_disk: use DropGuard
Date: Sat, 26 Sep 2026 20:33:13 +0300
Message-ID: <20260926173315.56772-4-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
References: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard instances in the Rust block layer generic disk
implementation with DropGuard.

DropGuard provides the same scope-exit cleanup behavior while using the
new Rust kernel memory API.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/block/mq/gen_disk.rs | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index fc97dd873974..d9019fbbb361 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -10,11 +10,12 @@
     block::mq::{Operations, TagSet},
     error::{self, from_err_ptr, Result},
     fmt::{self, Write},
+    mem::DropGuard,
     prelude::*,
     static_lock_class,
     str::NullTerminatedFormatter,
     sync::Arc,
-    types::{ForeignOwnable, ScopeGuard},
+    types::ForeignOwnable,
 };
 
 /// A builder for [`GenDisk`].
@@ -102,7 +103,7 @@ pub fn build<T: Operations>(
         queue_data: T::QueueData,
     ) -> Result<GenDisk<T>> {
         let data = queue_data.into_foreign();
-        let recover_data = ScopeGuard::new(|| {
+        let recover_data = DropGuard::new((), |_| {
             // SAFETY: T::QueueData was created by the call to `into_foreign()` above
             drop(unsafe { T::QueueData::from_foreign(data) });
         });
@@ -150,7 +151,7 @@ pub fn build<T: Operations>(
         // SAFETY: `gendisk` is a valid pointer as we initialized it above
         unsafe { (*gendisk).fops = &TABLE };
 
-        let cleanup_failure = ScopeGuard::new_with_data((gendisk, data), |(gendisk, data)| {
+        let cleanup_failure = DropGuard::new((gendisk, data), |(gendisk, data)| {
             // SAFETY: `gendisk` came from `__blk_mq_alloc_disk()` above and
             // has not been added to the VFS on this cleanup path.
             unsafe { bindings::put_disk(gendisk) };
@@ -161,7 +162,7 @@ pub fn build<T: Operations>(
 
         // The failure guard now owns both pieces of cleanup; the early guard
         // must not run on this path anymore.
-        recover_data.dismiss();
+        DropGuard::dismiss(recover_data);
 
         let mut writer = NullTerminatedFormatter::new(
             // SAFETY: `gendisk` points to a valid and initialized instance. We
@@ -185,7 +186,7 @@ pub fn build<T: Operations>(
             },
         )?;
 
-        cleanup_failure.dismiss();
+        DropGuard::dismiss(cleanup_failure);
 
         // INVARIANT: `gendisk` was initialized above.
         // INVARIANT: `gendisk` was added to the VFS via `device_add_disk` above.
-- 
2.43.0


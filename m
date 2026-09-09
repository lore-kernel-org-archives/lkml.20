Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A731AC45D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924816; cv=none; b=VmFStJQWetBmv51C9w9Kq9iUQmvQEIrW9YBeL0Jb0hS3Do2OPQyRYUPQ5UA4tyDk4XCjc4exYr1pPBTfLoXDAQNjVObPqG1wvLlvtYWhV/Xvu7k/yYqFDkZRU4B4Q9OTJWRYRx8QP1m51f7FxlswIkJgRhWPqI2kLWsSN1V0VNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924816; c=relaxed/simple;
	bh=9i9o/ilOEdPdQ52LKqv8CmqkloNbd+8uOtKzKeA/MzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhBTp1C9zS6OXTbcX48WvwvXzuLt9huZlAF9j88ybJn1t8lJjzBsiJz/9JUdM1fch74xzcNMyrfGlNp4fkSM5+JFFnxL9wMY6fockpfzPAL/1oz+7/WL13cBvtxrJZyZTko4ZTjJHF/WS9d09EPfWd6D1dlTGNhihMMqRQULzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBR0pSH6; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBR0pSH6"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cc107c451so34243206d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924813; x=1789529613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=OBR0pSH6PrcBnMOMmyAzZAbqbEZORF0qBmvtKA/8LfqGZjBZRnfrhl/RcCYeTTNU9C
         9jWQtxLAvzFmH6dsQ72iwO+ag/cQs1YAIoLuGU6F8jEkD++BEApcBY1jUmuajTk6ExxP
         CQUAQcBbexEVS58TbnVkcvhF2g2Tge64s4q37vy+KwaolCdFxPEOkRQ7evLTQQfUM+jk
         Sk+MfdYu8hETlG57Za6yJ5SDd2Ck6CuNtuYkNeeH65hRYCrfpj3UvdSaiQGLVJFM9erz
         2lZslfdKQSxUHP5Fqs13FQIHC7DFIqrPad058D1fXjg6pdcldeUBqFoHNTUpdH4OPmVR
         n+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924813; x=1789529613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=jDHw43v+Kskcg2h54g5wgdEic06bxVMcbhLrZY0KQsMwwpR+kizg633mz81nhK17W6
         gOwJk39CpK/EDil0wtiEnfGcJ3ETSo0lqh+Ros0t+LMY985UBGxFlfcJ/OkvYVl7NGZJ
         DaSEzqc5uAkBHAhAHWjoqzBIcq0kT0QV6BrTOOQ3hFaasv8SX+h+L4BpzyN7VZQAjnnt
         jlWaZNfGxnbLewJ3AJRLo2SaWZwxicym0yHZZO4lUs7oDsF42ZmX37VfrIh8rbLzhx8e
         YyzwT08VMiUASH3sOdPmFKjbUiKl5HL43GfvRZZ4dgt6+7E0CSRV4oISJnArqASRxLOG
         p6+A==
X-Forwarded-Encrypted: i=1; AKwUvByqYktnncdIYnsdLSWJ45gSCOeIztjDnti+3Atou3Zs9hzC96x3xhPUeXRat8kdrVHKOssdJvLYejBYwBA=@vger.kernel.org
X-Gm-Message-State: AFuF++l/AelDKv6Ud3KhT7yyy7vF44wcIrTQ6vtQR4cuIDsHeXoY/lU0
	tJOP8TCBNw23DQ4mB7U+j6mEhWqY+Qej1Qy4BTTovDpTzbrQ0x4m7J7n
X-Gm-Gg: AYBFou2zk5bD2B4D+gyMijwmpz5WNGc4rFZ9sdwbfX+QQyKF0snauHkiFlmkM3sGwUg
	+wbZushlzUg9Jtp7Qh6wN6wr6/DS4uBiPaAyxq5JsyxzL9cHjIpv8P9H1F1Q/zYmWquxLOBvbmF
	Xii45JcxjF+WXGT0j3D0BlHVPXEWH+KXbLYkTteSriSduROl44I0TOUAZL7up9+wg5xR825P8a3
	ElgGjMZY5cZgp6Q2kX8qQO9N9xgaGizp0TuW2FVmhf69rS+4rYVQnEvHy9gLMigX3XaA71cy+ex
	b3upFlOy3P8v+LeoUnXLqKnB+vt4tenQoOMxh1SgOVRvDNBJcrQBCTBcJyhwy+qZV51KC4QUJRs
	aMdvUMLRV+eVhjZYPssKZ1BTs9oNrZX6n66fQjplPVtsiMwUA89nRPK+35ElE5hGEIjgSFr88Ug
	khuzHmCnTJW0R6A9STcKRW0ndBUp240rm/Q2NRjak05nPEbF+PCtYG8nRSE3wDgnDMAgBAFA==
X-Received: by 2002:a05:6214:2b06:b0:910:345c:57e5 with SMTP id 6a1803df08f44-9103efeb90bmr420056646d6.37.1788924813465;
        Tue, 08 Sep 2026 20:33:33 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106ba5b95dsm11910696d6.21.2026.09.08.20.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:33:32 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH] rust: auxiliary: validate DeviceId name length
Date: Tue,  8 Sep 2026 23:32:46 -0400
Message-ID: <20260909033246.2779303-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
`auxiliary_device_id::name` array without checking that they fit. An
oversized name is caught by the array bounds check, but the error
reports an out-of-bounds index in the copy loop rather than the
constraint the caller violated.

Check the invariant explicitly instead, so the failure states the length
limit rather than an array index.

In a constant context exceeding the limit leads to a build error; at
runtime it panics, so add a `# Panics` section for it.

Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abstractions")
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/auxiliary.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 60dfbec8f330..1f3ba86d6d96 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
 
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the combined module and device name, including the
+    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
+        assert!(
+            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
+            "auxiliary device ID is too long"
+        );
+
         let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < modname.len() {

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.47.3


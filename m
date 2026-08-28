Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27373F1047
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924165; cv=none; b=ASPYYfZRwWn2OsC87DgcmH8dqyJBkwBgrIR7mKFT9iO3MrZmC7id4ZN2ASmrFjobm++zdwrV+Gr8hzxsUNshIiIsbMroCzae7x4TNQm0wi50gr0X8h+Oz945zefjSbnj2FcQOVuNRNp0YPv6kQDUjnCAYosQLqtHbg+FpkMR3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924165; c=relaxed/simple;
	bh=WCsR9VCM6EM/pK1Ie9AXB5kKv/5eMuARZV77BgwnBOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPYYVnI68XE6rJCnBXfFL9NFViDV3438t61axEK+u1Ne5c1Q+26UB9CIfQpXeBWv+C87mtOtKozJGViusvYLMyxMDkFkSnnjh4dhfgidewvGOihE+gT46t74JBaL5XM+fEh9muKM8eX2dTHFcFBDM/vZgUVY2zG390gsyZsoDME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUNoP16t; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUNoP16t"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecd7216cso975239a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787924148; x=1788528948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7azSlF7fLt4GUE1gmyR6tXZBKTYryqmZmntQXAjAiN4=;
        b=mUNoP16texYk9hocEZ6fglFeMwvkdPFbKvp828u4lO20e9/kkkKLtKei9xp6f1voni
         puh8GfYkWqRNcOHf/z0Pm9kA60STe1XNLrulSLhJ5hqh6KkDE2xCpRT62FuEjHHZRinO
         wkuAHdjoCzHbe8KkILrKXVKi5Ji0cPvP3LcQQN41J4+Za54zuD9C3Zdsh9NQspW71L2f
         iAAzI978UrIh4UbC2ewBVtBrddVIrm+Sm34tpK3nLZOyFuXnRTKIBm8zOspX5SZnvjek
         HbsmAPyoJqIxljlb5cjot1t78KcWv/hDZN7LuGrUaYMnfBxM06AXj/wYVVcvFmgSYh8p
         15Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924148; x=1788528948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7azSlF7fLt4GUE1gmyR6tXZBKTYryqmZmntQXAjAiN4=;
        b=XVKCaqr4iG5Oy0A3Z8U0UAOAH3ow9tqkbzu5EMrshHN0AFXiHCAhLrO6kGYwPYpQXC
         cNla4ta0gzX+ivF8lUTJjIhO4yaFesGDWNjt5cC9eiUiQVAgP3hjT2TsjzZHGJHoU1re
         k/JTGWIJYSKQCi9KLHV8f0LRBCe12eJn9kwkzCjv83dYVtNWLfTZcy2I9wQ3HGsf5YJd
         eG3eHtiJMgz4cjXzErtPShN0cxCvCAJXcTffO1+IclkcyAUuas00uUJghYSThT/MP0Zf
         SOVgxGkmIvEuufUr/JycOfhcEVF3f3SCK7CWDabnNJFiOlrhDZB8SWTrAxiwPq3RSGZL
         KTdw==
X-Forwarded-Encrypted: i=1; AHgh+RpdgAO5BS/gL3evhEf0div9oHCJd54Tyb4n6Z07kfXMiwwg/VIb/kpRRyF3ZQhiuceLDSEp1kmux+RPUIA=@vger.kernel.org
X-Gm-Message-State: AFuF++mW8yka0bsVtutuKuwG3J6JX3Wkb/4n5qSIIXxhkcUmKEXh+uJX
	5lfzNl13mTJKohejGE1NWOTUM87I+M73BDoUxz+hUos/+OGGY5JF3Ggs
X-Gm-Gg: AR+sD10eBAh5eOfYjMK3mLGYuGPgyDGOV71TAbROhyUkmJPkHZvylS9GGcuOCPefpj1
	w8w6KqCJZzVTX94J5k6zx8ddiU9w1b3Aj7U/1zs4jx0Q+Gkp8YxsOzUiCRpIAcSP+8cftpr9tNZ
	NDmPfndOfa8Ok5PRPMzRYJTkcYyzN5P5miA2ffr3D0NEj/zzApgemKCy2d0vNcilkNzZw7gTWnb
	3eFcDiFRQZpfACFh2el1RGv/dVjiQ+MRYy6pK72/8JWlLkzcr6Kv7OXLz41Qh6e0VqPime2wKzL
	zfeGWw7ac5Vf7aWDwl6UgEAziUvtf8bd0fNfxrHoyXm7z5WT9lElMXkWkV0QCtc0rar2nmaLVkF
	sgBqHZ96y5LKfjybrvUmLRyYOjOElTuITTn17Uo4g9j5atVJ1Bo8DlUQPEiJhvf5mc6AN5B3Ogt
	YrGNcDXEY4oVKuH3mIkBioNciLC86BFxr4/1B0ZwvDU41lcRNclD62GGLviwg=
X-Received: by 2002:a05:6820:7088:10b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1c67552ccmr4582468eaf.22.1787924147643;
        Fri, 28 Aug 2026 06:35:47 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm5949083eec.28.2026.08.28.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:35:47 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
Date: Fri, 28 Aug 2026 09:35:43 -0400
Message-ID: <20260828133543.2259029-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
that `start` is less than `self.len()`, which panics when
`CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
has a `# Panics` section, and both document that `None` is returned
for exactly the input that triggers the panic.

Update the documentation of `next_bit()` and `next_zero_bit()` to add
the missing `# Panics` sections, add the missing blank doc comment line
before `Returns` in `next_zero_bit()`, and simplify the wording.

Link: https://github.com/Rust-for-Linux/linux/issues/1252
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Simplify doc wording following feedback from Alice Ryhl.
- Remove extra empty line between Link: and Signed-off-by:.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260827150719.109145-1-georgeandrout13@gmail.com/
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80..b51c8a96f 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// Returns `None` if no bits are set on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// Returns `None` if no bits are zero on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3


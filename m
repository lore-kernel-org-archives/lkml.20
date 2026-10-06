Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE13ACA51
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313817; cv=none; b=o/psJcsWZTyiutEIfHH7ScKHQR1x9W9rDLmEWeXSD6xQNICb4RNfdEc6ozopx1PPo/pz6cA7hXjHwME45AVZJyD7h/3SD6SbB3bAxsjTeNmlajdW8at1HOj+yspjPgJmn5U1qpeXVzyMbzwJ36E2wKjCv3zQf9W8OCfuALWhptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313817; c=relaxed/simple;
	bh=9k8rOMpfl4lx4MMtjFFzBXCOzbuU0yHxSaqijtCRdCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSH7VnYK6IqD0Ay5oglntM9hCegYKzysQ0PKJ7eEcgnMpaEVzYzL4Ub7d/8BzwS0A5ULkb/iEuu2/B1zrrgKT955H7p+LZ2HWWcDq6sGW33lqrE8aDc8O3HdGyjEHsr6eGZwRBzFxYvm9rZoXXL7ZM/uJIQFO0/7kW2oI4n+Qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU7MWsce; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU7MWsce"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so2266962a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791313816; x=1791918616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwS+VeF/0gYJy6xip2ea7FssZatl0AsyXhjpyla0y/M=;
        b=YU7MWsceWeh/fo17B1G6MyAOMdx5D+PwWX4ZNHG/lsOTTakW+iN0aQeJ/74ZpEyADd
         rg+2AoY/q12X3W8Hu/zHx6rxnVh6M6i6oMgFVkY756xujxaVlgbuypIxJX0O5F65DM+s
         oOxIE2w+51a7UtWe6pczjdZAHSh+lhtf5C5Bdh9rS36UxBAAZTZrn82R36K4TAVxnk3d
         KUeHX7D5OMrjnT0u6Uu75nNMZJQZpX3ReGnf3QyeEYMWcyBeibIBiQEaZr4InmqU6Q0H
         NdXsz6d8lU/YjGy+V2b1ajDVxl2ZNGjwjTOzRLbkseYQsRegFybzudNSbKMUoXJKHA94
         F68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791313816; x=1791918616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwS+VeF/0gYJy6xip2ea7FssZatl0AsyXhjpyla0y/M=;
        b=uvP+ncg3iWVIyLZhmy0UsWVFbdG7NmrHcE3bELdQOjLUO3+9W05GOfnPrEotAMP/b6
         7qieKjCp1pFVEQxRsziYEk42n9pZpSCzN2PVJWO0nVKsvREcpmcxjM5j6A9404f7yy6o
         Pw60ueBlh9wlmnA0EGGSMjw4BiF/9CJz4+8l6z13gDr9QwUrkPEjucsda6Tla7f66hUJ
         BCe5K/ZMXL2vKeNuQISkufQBtL/sshXtWC7dux87bmlvCIwyPLbRRw3MEAOJ7q305EqB
         e64f9Jb8ieuNv7Ucbescp9I5zr8uYQczjNOaJVTI8tnWMQkstxyN5hFHJG2ItwNboQf2
         RqGw==
X-Forwarded-Encrypted: i=1; AKwUvBxAq1YFFiQ+vbYjfrdMn0HgfeF+ENrFwchUgLyWtcGDkrer18cpx+iTmNJMA6Wz+wT3HNgqgpBApOqrCx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4GccK+MInLiqHa4wa5ZfOFprIGk+Et5fpB7Z4OL9Iwo7o5H9a
	gGcMIvl8GCJiyrRr6ifq+Bd8XZlegXtJMPn1fZY156faLbfv8U3wV/AA
X-Gm-Gg: AYBFou3ZTuKu8K87s2NGSK0sIv0IuBO51Yc8pPLgIG5VjkeeN1NoPTSCFwzHMmfPZY6
	80/QqCD6JJmdTT/J1cT/d22MWCNv8jBtt8qTNehEFf7qqL0uq3tUf18vV9cCCI5WzI4xw2hDiM7
	c7xwqERAgIcQGQmXjdg4m8NWWtppxmZIWUcJlie2TZt7aNKZ01wM0sPMGz0NH4Dx3r1ejEScT4n
	Qm+BVCr8Q943fFmmHVz8KRBAO17gcyZ7aaCtqDM4at7az247Sm4tCUWbSyo/k6VVjzqSYMLTaFN
	j4s1flCqfHvAQDTA7JORZ2q4TcvKZLtOwtjBC3T0kfYarmNz5BdV/CK2C/PPZ7zAG8CbRLKslWt
	+CvGi2+3IDEd4jdqsUN/vluehuQPcdea3rSesF9MhewndqF0lUL1s8lxTZIrCQuu0Hw1cCJLKwO
	EcId3bAV9tJ98im7w3HZAM1v6Usg0NKb9kASqK/5iKT6YplmMWz8PWYlYJ8iPMAUZrZAhjdcwS2
	fOjxT3zhWBzzt1zQmFFhT8v34lDBV1FumHxoFyI0yOQfHC6ZmBaSr1c4GnGyRhy/ZXCNYJ6sHhD
	0eXJz0rxQbh+Rm341p0U54nAKYJ6fbjfgKVV6cviNvS5iXgQqCKNI4Dlkw==
X-Received: by 2002:a17:90b:5108:b0:3a8:13d6:f748 with SMTP id 98e67ed59e1d1-3a8a1b03ff2mr128299a91.42.1791313815892;
        Tue, 06 Oct 2026 12:10:15 -0700 (PDT)
Received: from ip-172-31-0-244.ap-northeast-1.compute.internal (ec2-43-206-105-212.ap-northeast-1.compute.amazonaws.com. [43.206.105.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm11459562a91.4.2026.10.06.12.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 12:10:15 -0700 (PDT)
From: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
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
	Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH] rust: bitmap: document `next_bit()`/`next_zero_bit()` panics
Date: Tue,  6 Oct 2026 19:10:09 +0000
Message-ID: <20261006191009.143707-1-miguelcorderopamphile@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Bitmap::next_bit()` and `Bitmap::next_zero_bit()` panic when
CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is greater than or
equal to `self.len()`, but their documentation did not mention it and
stated instead that `None` would be returned for that input.

Add the missing `# Panics` sections and clarify when `None` is returned,
matching the existing documentation of `set_bit()` and friends.

Link: https://github.com/Rust-for-Linux/linux/issues/1252
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Signed-off-by: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80..5da8b12fb 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is greater than
+    /// or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is greater than
+    /// or equal to `self.len()`.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is greater than
+    /// or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is greater than
+    /// or equal to `self.len()`.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
-- 
2.50.1


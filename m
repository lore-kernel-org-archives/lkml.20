Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A846D084
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843254; cv=none; b=NjNquuFpMQIQ5yAn0rzBxtCh7MarUKyUfc7gK0SbfObWOfR8v2Wh0658OljWqiKqqPvSzxrTaA0ga6x3kWmC885iJoLY+bPujqz6W3NkhW4NBbz+VYT4/X0OxBz2hFnQIEm3U2LxzaEizBrvZSZWMiPH9Jtk3xz78tCLVxMkIxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843254; c=relaxed/simple;
	bh=+EfZIk8UyxWw+/QmIoE1JYEi6QngEVZyASlJwP//w6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGsmPghjW5kIerrUrG7AmV+/+/E8NGMTrTss9edLJoegrGEy6IAPObtPoxqNmKNqTnYHBvdsOOYaFP+h1Kxj4l9/A6D82BkgACNqpeuk8caZB4Hvx6RkiaNFMqnIBeSDNvefK71St3ai6QEvhsWzEy0WGTjnw6dRqZ1uq0Me/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMl7v1gC; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMl7v1gC"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-467a6834028so18106fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843252; x=1788448052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZAtu4jfJrkcL5si1ce/uQmymWR46x3S6FScFRqvh3U=;
        b=IMl7v1gCcuFJgA8iacy35QKyNuXBIks+FCuCc+RfSQLE1JwrDbDe1tT4n4Jas0tCHs
         UMWOlLtsUFzST0a7yWY+vMbircoUVGQJG4952FhpcCo0tgq6w9x0q8X1l6tWdidA4DNI
         muZBkhyENNEj4K1plHtoJdJl3IRtEYrqFwwLYppCrLURLeTWCA/1wfnWoms885KZzXMN
         RDOsHUshcvQKpuU1fFVIhDa21QcTR5358Dw4PzUoxGO0PJsJa6ZLdx7kf7fnb4hX3Kw9
         2Sr+XTIKAJ8F0kDRCafmI67KlZWIuulPQknSEFBYHJt5WACsGz5o/9h4hQL43vUnFBdk
         6arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843252; x=1788448052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZAtu4jfJrkcL5si1ce/uQmymWR46x3S6FScFRqvh3U=;
        b=KEOLMsNIg6VTwtCFQLs5qA036DHpOYA4V54r5/80h6UlEEeOnMHVHVo1oSJO2PV3j6
         Xvc7Vz+F2e5I+hEv0jZNGpv619dIIgbdbKwUqou54HW7z0QTl1T2EHaW4BSH4KQakBkX
         ls+VKGoLzCfCcRghcxsTxBdUJkFnb38XFF9cS6mJLsOhxa+++XaaPLBgmMTE4WVrrC2n
         BuhHqZN6fBGippTmEnbjvlO40avr1elrqXusDpknIJkkCOvOvy7ALhXpEs9EC9e8Zyaj
         lGn2S9hFTY+OPqygfVprV/XaP2mwaM8Bg2coA5sXsnrdC1383CGbWWIx4PGnxP2M/zqz
         0nwg==
X-Forwarded-Encrypted: i=1; AHgh+RpV4zC+Oxr3MB6vTyyKxJYiOhHOS5/gcjJRsrQUDkXXFeW4s74kJsfn2BGKl4RhXLzLea8L0IrYOqpcCCY=@vger.kernel.org
X-Gm-Message-State: AFuF++nG7MRX9C2HRSZ8CoMcot5cCqzztKDtypmIValVCPRBSdtxudIU
	QRseD6ULwPfl/fZ8FMUfWAO/qUVke6OvA/cZMIujuh21AfgG1dvwLH3c
X-Gm-Gg: AR+sD114oiGU+gObuOdavp+JXvnJMrQSK/Nl0UmFIrvoapHpgi+WveiOujmgvZBRbNT
	8bNbIMFw+Xrc7FWk89U2e48gbjM/eaN5A9ef8pDLj1kkK4DiPXV2brg6saTzbn8Ze2gQNqd4bZL
	0QseVSqwSZymfo7rO6FJBuHm4GSVqiQJVqR+S20l/z3fpEkRhO1UcKmVv4L4XnnDo4dp1iTGbZj
	5idcJQn8yJLDHsRB4wiJOqpvX4NEDg91HXu+hdrxTqwfFQJIJ8uJXSHufPUzhY9hzoOZEnKcD1x
	BIapgb9brZYo39//Anl33X8PSvxAp6AWltm1dsNl6KTExXs4xr6nzPnxIpC7XdEVxX3wn9f3zSK
	GuCLJleoxaJvWrmUYvLTc/OglMidb6dyxdQGxSFENVxmcHc5+7PURoApJg8/12KwE61Cz39Muhk
	o7m0ElcxdBmtz3EB1O3YlJUkGE020DowatiKva+f84MwMDdkOYOnlkXLr+m+8=
X-Received: by 2002:a05:6820:1504:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6b1ba667ec1mr3109057eaf.14.1787843252159;
        Thu, 27 Aug 2026 08:07:32 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a907c682sm17009944c88.15.2026.08.27.08.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:07:31 -0700 (PDT)
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
Subject: [PATCH] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
Date: Thu, 27 Aug 2026 11:07:19 -0400
Message-ID: <20260827150719.109145-1-georgeandrout13@gmail.com>
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

Add the missing `# Panics` sections and condition the `None` case on
`CONFIG_RUST_BITMAP_HARDENED` being disabled, matching the style used
by `set_bit()`, `clear_bit()` and their atomic versions in the same
file. Also add the missing blank doc comment line before `Returns` in
`next_zero_bit()`.

Link: https://github.com/Rust-for-Linux/linux/issues/1252

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80..b33f7ce5c 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// If `CONFIG_RUST_BITMAP_HARDENED` is not enabled and `start` is greater
+    /// than or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// greater than or equal to `self.len()`.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// If `CONFIG_RUST_BITMAP_HARDENED` is not enabled and `start` is greater
+    /// than or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// greater than or equal to `self.len()`.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3


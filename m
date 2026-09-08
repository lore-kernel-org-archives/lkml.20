Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5F3B42D9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899551; cv=none; b=Yth09KhM3K43FDcSDsHROWFG2wQhz3CpQM2f5qRdNB40dtRA0ow7bS89kixIgs3rdxzB7hTx1tebSzPWuM+DB2oyVYCSQdGtWPyPNMLWe5BNtRr590l5VdeWesNTGU8sxhJaUoYV3Ab1BxSoeZ9xH7lcdKwRsMMN/EQuQOnm8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899551; c=relaxed/simple;
	bh=FWhpj9vK1Ldc5YrEXaIJia5AF+nsKyUciE2D2XEf6lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5+ARhoNT7hVhEinIDPW0T9mnM3lztiRfQHCdLVFm86e3W3J1GjnzpmDPpzeujSG0IYB+NsuqqmlydC9Dn8QpBVdPYjsDu6WXbs2cbQ1hcpcn8Z1Law3qAxbmhpL9jdp973lwB5LzSqKyQE3pHRDD9VptCsANx8ax8n2CsRI45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXwrG636; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXwrG636"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9399798cdd2so222498585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899549; x=1789504349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=za+wuIfq3+qQspCDNaDw17t8tpWBTd0I2bcbC8c7q5Q=;
        b=oXwrG636T4NN0xTsDqgj+W1Ps/RSgKbz25+2lAyG2wHA0OruGipGyPyngDjOW2WlHJ
         U/oa1WJs63UvjGZGx1iy6ktfvAh+GgYnggYPxEFtKZzBfGe5LP5uVwh+pcPLjdTZy9F6
         grDYdsFRDOhuDfSusHVPRJmuV0A7n1jgvG5W424bXhXW05uvwX5eTCQUTK1h5ANE5umA
         alD4mAr0k2aE6kAKPn6mSZqiHRegOr4DOs32MwFGgSK9RUY3P0MJhFvrOY+92+pMPY0U
         lPEmiLf2x+Ggus/VjYj6UTXgnTYrr/bDrEkXMe4dsHhWUsmbBQGpjFLRxuTIUOjF+dS3
         67GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899549; x=1789504349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za+wuIfq3+qQspCDNaDw17t8tpWBTd0I2bcbC8c7q5Q=;
        b=nigVS/S+JBgl92uknXxkhB2LcHNEtF6sJodB8KEv6qVVdWPKsR76qtsfn8gZ2Ps+sK
         b4DX7IbFvRpfeDKqH3bHiO0TUBrRQRcFnibpsznkFkydNKCINhA/aXs1VBO33a5su3wN
         fO1sqrGFXTJyA2WJsPvISbnkWmUcek0AsUbMwmx2cgZt69wO5dKMJb81QgHc5xYa8NXW
         AfYyTEWSwdTREicCtb7wDaoPGhK6z1SYhdmVN5DJCI9Ta0MFXQM6Mxml+Bz46R5vrfnH
         79k0g1Edv8sATTBCy7GjVplZ5cjV/9SWm8C/zKUEXxXesGYOS4ZePd1Fv+Zn5OawMB68
         vYLg==
X-Forwarded-Encrypted: i=1; AKwUvBwjmJjTqpMLpjyKQXguXSWBoj7lIqv+mZ4NTCgICG4Q+A1hy+kH134JxzXXpG3yeknrQ5eAxCkkO/RpkT8=@vger.kernel.org
X-Gm-Message-State: AFuF++mu3D5m7VEAPt1Px7pYaFZrBPW/31ipdG5M+gQlgQc5wBGyfNIe
	IlEW5Qp2X3l7xQHYxow9MwzYy3ZBwCgg1A2svwgkHgE1IUH57McSQa4c
X-Gm-Gg: AYBFou19UMR6kMdAD/aay5tHA8Kl2SNZR0QUAAi0hbr6GeHiqxJ1OiaMoccAFUkjvXK
	BHTBo9dVc6nSWeqZqlq8rkW60h2uIGob2600KIMsD9SMk7EzGEe3UDm9RJawhKtAEG0isyWSw1W
	YmcS7+xbZSjPuX1j7Bk3nckbg5pTOF/u+4HWNeAVX04VSeQRt2/OoPLo73dn1/ns6Q4hvv3XEm8
	dGHpDk/ngCVCsYKQyrRhq1ouFvB8p3a0lRP4/7HruUAJo+yX3nv1MFW1dZxhQoL750DsYlgOO9U
	lYYjFYb12+O057fm7Weg2bQuQUPdVks5srzWzxZgnvpnWMK2xTmdnPLs03ufPONaiKfUH1pT56m
	qsa1rjuaTlx616aMWE9zV3evhlXEVITETbmbh7cidmg4efvmyzUUU78rOkRClHMj5jYRA3zrVEJ
	owUqI/QiQuK+3lbKKUO+HBqLygGHMRWAa8Pmd28ZMBvETOudIwWAzeE/z+AOBO/fjBeRBNpQ==
X-Received: by 2002:a05:620a:8ac7:b0:936:c026:be61 with SMTP id af79cd13be357-9398036fbbcmr2132977485a.13.1788899548747;
        Tue, 08 Sep 2026 13:32:28 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f4b3csm1219948385a.5.2026.09.08.13.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:32:28 -0700 (PDT)
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
	Eliot Courtney <ecourtney@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: id_pool: document panics in `find_unused_id` and `release_id`
Date: Tue,  8 Sep 2026 16:31:57 -0400
Message-ID: <20260908203157.1271219-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
calls `Bitmap::clear_bit()`, both of which panic when
`CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
bounds. Neither `IdPool` method documents this.

Add the missing `# Panics` sections and state the bounds requirement
on `offset` and `id`.

Fixes: 2cdae413cd3e ("rust: add dynamic ID pool abstraction for bitmap")
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Use "within bounds" instead of "in bounds", following feedback from
  Alexandre Courbot.
- Add Fixes:, treating the documentation hole as a bug [1].
- Link to v1: https://lore.kernel.org/rust-for-linux/20260829153442.20799-1-georgeandrout13@gmail.com/

[1] https://lore.kernel.org/rust-for-linux/CANiq72mgZg-QBy4gwzHmD4gJm4wScktfpdDtyZt3Zijk83h2CA@mail.gmail.com/
---
 rust/kernel/id_pool.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 384753fe0e44..ae6960d7f638 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
     /// Finds an unused ID in the bitmap.
     ///
     /// Upon success, returns its index. Otherwise, returns [`None`]
-    /// to indicate that a [`Self::grow_request`] is needed.
+    /// to indicate that a [`Self::grow_request`] is needed. `offset` must be
+    /// within bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `offset` is out
+    /// of bounds.
     #[inline]
     #[must_use]
     pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
@@ -236,6 +242,13 @@ pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
     }

     /// Releases an ID.
+    ///
+    /// The `id` must be within bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `id` is out of
+    /// bounds.
     #[inline]
     pub fn release_id(&mut self, id: usize) {
         self.map.clear_bit(id);

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
--
2.47.3


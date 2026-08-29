Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0666358373
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017690; cv=none; b=HZMKs5qHEryF7APlNWGI3JD82dTRgMlF5WqPpvJjNUaN1DHxmlCl4+DykdGR3i3g6424CDucd0B2Bp5HWJF8k/LQyMCitpBLBbOWl1y4KUK8/7leRS8sHuECvcrbx2XNL0cFhSv5956tehTeRGBfusO2BQ9/9zuO8QXZSmAmGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017690; c=relaxed/simple;
	bh=dQpS8bcH8CRgltsTPv9YRYGMfmW0Rpoj3u9jqx8e+y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gc+qAhjUFZQUJoVbE2xEX8fCb5M8ksuZliAJFjl+LcLw7J7N37tb9Q9ZkrrVj72/4/JO85ooQQsoaHviZBeXcKTISNC745TsHCumYyzFe0r7r2J2U/btvxKo81b5R3ZLvmwobF78/NDhmn6qZu139OtKTf2fLW5jCgr4bWXHoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oG4VbsvF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oG4VbsvF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2073379a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788017688; x=1788622488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHs8vnCpPDwNyoRpbGWeEHXuEK7fQBuD11JiWHnaukw=;
        b=oG4VbsvFLzvpYlgJZLrPSK4KQxoTkqcIboM63iY/NojCoLVM8lhX2kg0TtSZoOPDNm
         +P5Gl3HOl8SlJS/ZAyCPrCOWQpBes1K6Wlohp/AbEwIjtvx8ZlJqUI16N5Yv2ast6Y3N
         8nD7sOQzhYNJVUnyl5a8XodUFYcKPX+low2Ov8kUgnJPwr/tNyGGVsXCQkJLe1Pzuj4v
         qpEW7ksWRGQ3fSAmuJAkOmaMyB/c+dQgZdmqm8+YUjavL1yFDCYkaiT///mvK9if9Eno
         k+AS2NBOgUYGtt0YKOYbgbQ4ynLXpHakDCo13tj0pySYCppbcli8+Rf9VDPugtzW+7na
         OQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788017688; x=1788622488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHs8vnCpPDwNyoRpbGWeEHXuEK7fQBuD11JiWHnaukw=;
        b=SV+q1XApqBuiI/qTS5bmqtjYOHs8tKCeThIyJutW/HWVZn/DKOAB9leq87dFiwa4Y6
         cOlIhVxCKRP6ZoZ8M311loOvAjJaykIij2vyzlHobB2yJWS4XSGmfbEG9XYL9mBs+P1T
         WAbi8t1n2CIJ12W9goP6Rli3kbj1sA5beTRZiQWndQ3gMgdWQxeqoD+flZEvs+vOJJvu
         +jRHvH/ZLvd/Gz6lZNpQNwWdzWHQLk7sbGgbxyCPd5IrAkf1zsVkVWHeWQ/AfLvw0xpx
         vZEQpr7U22Id0U13LutFUwNkMzZVVcOWP0r3i/divrr+wZWvYdgS62ODHyaqrI6D/iWk
         9ZFg==
X-Forwarded-Encrypted: i=1; AKwUvByKLmmhroIkf0TPt+geaf5FC9JlmFwxEGJhXZgH0j1uStmHg3YNDzoykdjC/E8XzO0z8nsyeq9iqpBbxvA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFO1DZhm2DldM09EmkGN5W/RoAqzhpKRFhVfqWb6H6qEYZYfKN
	rivje/wRXUdVUd+oWrgUMM5tHDKAp4htVxGsBY6kTqWWui1ApbOrxw9O
X-Gm-Gg: AYBFou0ZGcx731FnigPGjqSpKnIeANazTFngtyFtjAJhfyzzLE1+I8zjN150Dqn1FHR
	w8mHo43yPpEaCA34fGAXoXHN5NnMhn0jR4fPtbOex58zwa3RnP04G0cgC/D9BJlO/AKzD3cmBdG
	vkE1G7tTYf3o6AB1G1437o8gxZEu6Ue+cSW8mckg1lfVPh6J6H34QEv2nBZH92zk4QJDrXC5/Ln
	vVOBgS7TlzDT7NPDCB/FkDcjKXiL1v/SW+FOxLuJN/390S8RD5Qqns9JFw1tcOq86JOZ39tkirR
	mPcfLkQeC45Y1d8CaaNgz5YSLS8eJk6MdJvznw5UZazjkfUC88o9gTOynB2Ak1VF1lgYxzsAywH
	2TFDBifjfWNJWUvZMgJqjkm/XYcbOs/m5YpZCIMKuGRvWg+nIas7KrudOWiFmPAcHrskCcbntzF
	pAQyFLWGuKM1rvP3Yp408R5GDo+cBeouQvT9XUKbmmmJDpfl5SPu0giAHhTLY=
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr25415299a91.14.1788017688155;
        Sat, 29 Aug 2026 08:34:48 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm13145472c88.11.2026.08.29.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:34:47 -0700 (PDT)
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
Subject: [PATCH] rust: id_pool: document panics in `find_unused_id` and `release_id`
Date: Sat, 29 Aug 2026 11:34:42 -0400
Message-ID: <20260829153442.20799-1-georgeandrout13@gmail.com>
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

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/id_pool.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 384753fe0..ae6960d7f 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
     /// Finds an unused ID in the bitmap.
     ///
     /// Upon success, returns its index. Otherwise, returns [`None`]
-    /// to indicate that a [`Self::grow_request`] is needed.
+    /// to indicate that a [`Self::grow_request`] is needed. `offset` must be
+    /// in bounds.
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
+    /// The `id` must be in bounds.
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


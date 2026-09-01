Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343837D131
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224817; cv=none; b=LyJTQH+OmlqXSq3PHzfqh3qdFo1gCYvAKdl5PxCkgeEwhDJq+6JEOjTfijKt9f/lFs4ziZS0uiTQLxXjWhVh5Kinuuh+q3Vya/VU+dyXAEs0QbEBB2EiHYPei5QJWUbMZN6hlz3N7iFzB50xjRSYpDBhQoTtbJ43JTL9oRyHpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224817; c=relaxed/simple;
	bh=7Yw8TRdsC8iJj4zKIDBj3vysMEmn/ITvAglewvj0fLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSTOBDkLpD4gZBBCe0ENKYJnp/3M+Cr0u2V18VYHaLFRvteCHYkiO5OdBKZlNWxpdySGg72+i+TBtZJRmFlOKaHCi9jF4xT43AUsXoyZMHW3jyhjRyAk5/jiCwT5p3OehJYBOvHw1xpUFPfo/SihysIW4BIwoWAmODaNHCbe530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6xOKA11; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6xOKA11"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e7391839cso447349a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224814; x=1788829614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uiz6c8lHl0mIc3Nv6bMi5cOROWKCJXWfj0lE81TYGfE=;
        b=B6xOKA11WJKxu65gr0+Eo+Iyjosqjzcw6ONOIKWZ+sS4pk+1h9yL3lGup3YQISDg/z
         irW410TFAsrUzP38hX+sez7x2uJ04GH/cOVK8h0yV7ZUqhB3fF/ztuUudpnhdNK1atW1
         CTxBMvDvvuHhLHu8+OYW+GNCcY6Ij2BdE9ywcFcOrRVOC72W1xY5NTJ9S2+jC6lhO7kb
         k5TT9p+jcnub7Ief5RE6rXcOOA1suNtQs707UmAvqvysAL/lR2OsjTXh2R3OmvsDs81J
         2x7JUKaDn3VQRiUh1wgXsUzZO1yo5Sn6hg/PglZuJV33v03aRji/whjoapnJB3mlWLYU
         gUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224814; x=1788829614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uiz6c8lHl0mIc3Nv6bMi5cOROWKCJXWfj0lE81TYGfE=;
        b=HLFHtCkKPSTwctni02/xiTk5A6MvDsLXaUatSnVM5ud5Np2f+0H+WKWzTveQNbtk/Y
         oLbEMLpksleRX1mu2mzRxmnRwC4hdM+mcKZFnKB1yuaQ2CTaoCsoLezhU2YpAvJEgR/B
         mRUGa2EzTT/UuWAONmQeT6/1S9gEtgBWi2vqjjQ66SRCIRhfI760HrS6XjkV5i5ecQ5k
         huBusk4gSvqfu8BKU71FulPBV+OM9yfBt9elpInhgbt39qgxbHNij+iZVMK+YceQiA0w
         qi3xCPu+yKZBboyMVej0J/SBnnZaw8maRDXjbT3WmwztEn6M3XkDoEIap/vMwxRhlL3K
         xjTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn7byTSj7yPwUqaPTM6YUPX1WsqGDflA2L85SjKgQr8dMlys+3lTgxIRwmLIZ0GF+eDJ1ivnQZizNewpA=@vger.kernel.org
X-Gm-Message-State: AFuF++nLeUxjnMYRXWHXOQxLbT9NX4++u/x9jcJ9dcYBpOQHkzLbmQgA
	ROpVY0yf+Ody8yWmviY8ItaApgNPuVKJuf8rYKevX8AGZjjIzgHsvOa9
X-Gm-Gg: AYBFou2Uby4vbT26h9SdNjmphHQeIXu5Ksd/bSHGbLCD8rGBkRw1wB5lZU9Gd94YKop
	Qrv80hh+K6MtzHJ7Oold/sBcJWGV7+aELec5YAiL0jKQ0YlXOh2FFq/wlQMgl0wbAZ+BxxL2BPA
	/RsF02+Ui9xfsIK39Ykw/ZpJQJ1zRvh+kpRA9OQgMuaLJ5E/q7Cx9FmH3v6sn0/yfyDmfbf/7IJ
	CrD31s7u1FSqjk2Bj2Xw4Fw+jV/MR4yIVZ+Uprrxt8Pi1UZlcePRhXNT04GKO6NMwAd/wUXKHl+
	ND6sOjuCZqdql7h6vdbvVUaJuMRYTBD5+d1tKtrID4LU14mEH5h2KRlNHvzLJC/Cb6wjgy0e3rg
	SxZlE4OIW7SY9IUGHADF065lh0SO9HiMqmY7+9XH0dupB8uMoKtQAx78JnMdcZ+NUvY3nWEzWcr
	OtggdsiDX+V0zxFGgKwQpm/gd5n/EO44xUjjMebpQ9X81pvyXMo5dfJbP9HHfVb94ENB4K0M1MV
	GOahA==
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr49611662a91.14.1788224814428;
        Mon, 31 Aug 2026 18:06:54 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:06:53 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com
Subject: [PATCH v3 20/21] rust: allow extracting the buffer from a CString
Date: Tue,  1 Sep 2026 11:03:46 +1000
Message-ID: <20260901010347.2614656-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

The kernel CString is a wrapper around a KVec. This patch allows
retrieving the underlying buffer and consuming the CString. This allows
users to create a CString from a string and then retrieve the underlying
buffer.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a556788bcc5e..3fd8a218547f 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -870,6 +870,12 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
+
+    /// Return the internal buffer while consuming the original [`CString`]
+    #[inline]
+    pub fn into_vec(self) -> KVec<u8> {
+        self.buf
+    }
 }
 
 impl Deref for CString {
-- 
2.55.0


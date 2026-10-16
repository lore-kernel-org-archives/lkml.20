Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB54C9E1A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157441; cv=none; b=GhzezyUAaOQuCUbEU+DZgdHid1us2NVuRHPsQBULa2qc6glM0EWa/e62RX+DxMvueXuhC5DT7HsVPnjxXwrDKQyMwf1LBJRdDjaWHc3T+sgXwDhW1Bz6wbD44lZUBrpiPgw3LFweZ/UDNOKPrFQ1UmIpJQhdgPqwwqJE5IQz1sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157441; c=relaxed/simple;
	bh=qUrICa2fJYEZ0c4HlX4XWuz6lEudJa+Feo5dmOei8es=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VYcJUHYFR6HJ6r0eBMYfTwFvCiOXcKPKnaitR3He+9DAHifnwP79jd++3yXtXdnWfQCpV4Fs+po9tqAdk+L/RX7kHCz+WEgOrU3gCkuh9eURwuDZ2ZcUN1Y7D/TtBH/JlTdDUitCsZ5uwDloUMDMMX98sqczZ2u3KXdOlYyU0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mC7Zjj5j; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mC7Zjj5j"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c430f0f01so2250839f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792157432; x=1792762232; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8wT4GCcFRppH1S0zBu7HLXtWLx9V/jDPupw6jCnXnA=;
        b=mC7Zjj5jmyBIh/H6Mysyp1mAIYBSOT/iFhMvCQOxHkAE3QQiFNODqxKsOE2fVrephJ
         HpeaGnG2edjw6Xvi+RuBVBptqKwaQJ0DpzjvH8ue5rPwmLTugCWLuGoTkem2NP48s/p7
         819dlX2tsJ6Ds5jVf6zmF2coWhCBPt2w4N68yrMhuotP5xjBj1ziGf3iCopb9rLMn5oV
         KoCsdY8ZSocgZ6gMDhCR05BS4WiJAPGF2/T+li9WFhbt8wL0kUwC5/mC0Uy8HFElp/k3
         rkZDCxlMpY+hUYhElUDsConGekZt+MvOaMbdBf+fIldYNXEJ9kqGtGHbDjoRY+pdZkjv
         wuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157432; x=1792762232;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8wT4GCcFRppH1S0zBu7HLXtWLx9V/jDPupw6jCnXnA=;
        b=bcechdYHA+yGfL9vnYZ2C/ro8IEvPmVh0SiLjO/eRUp2KwFTndYOHm7V4u46X035D9
         trd1Dfts1hVT05/kUASCxFpGS9HbBl2oGzlA0Xy5flXKklL5Dl5hnAKN4O0tMaSNhSgI
         4tytlYIl3AogNcIiTU9Ga076FJ+unNIHvtDIcUErJ5xXoE/zqXOZi2bRWyoDrZ/qU7xK
         Vi4UGVPIT3dx3Slwf+ZQSe/ZiGWPQK/aaqrCXwVS4+9jkxLSqOZrHZI7uPyy/GzAzJ7j
         gDd8UkYty4kQagzG5ci2rjRo6/kITdUjzNVSbuXciCuc5M1F7Aa9W3ZHo5bPC+Mxa7Lm
         83cA==
X-Forwarded-Encrypted: i=1; AKwUvBwae+w1Zt+N21Su/td6CcxqEVBui0hG/YOR7tdw6LGpcujyWsmdv1KoXujm7ipaIa100RndqSrUV3vGtf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaxFhU7oTbkWkb9yaTeovg/jIkeoHVjMeXjCdCJQ0U2mZbq/Lg
	sejxLSW+BuLyVR/2+FQctTUdmjzYz8CoSepIdaOB/7OO51M9hFrM1VGhmICL058XbexG10yZVjq
	007qKe7ag72JgUEW9pw==
X-Received: from wrbdw8.prod.google.com ([2002:a05:6000:dc8:b0:48a:f5c4:6e9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5a08:0:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48dbaae719amr32819816f8f.28.1792157431452;
 Fri, 16 Oct 2026 06:30:31 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:30:17 +0000
In-Reply-To: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qUrICa2fJYEZ0c4HlX4XWuz6lEudJa+Feo5dmOei8es=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0ibyWL2N2fGA3+Ni+RZIZOlpvage6FEJ+K0Eu
 6UZFAEbPuKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatIm8gAKCRAEWL7uWMY5
 RtinD/9ksgOmsOB7zF2RRAoNzyBkQ52Wl6+40EruO0uNuIhTxDs7XqrMPHmYQBfqXzOuTEneSSB
 LeCzrC5q8vAuub/SMASW5rAeIZk8LyLBq8/0+shRJiaNEZxGZjUPpGdwpb5LQYpZ5G/9LIlztFR
 IJ1+m+yQzdR7Cufaax4/rbTTWvsOQur3Gtz2bjDe8UsbaFXnmicKDY7h05IxpDpTSwlR33NqJr2
 ey8kRP1uem1ZCMpY8IgLFecU5tHGXZ8Sd8c5kTroR8O3gnOiaHQcZVZdY8xMh2zw2oY65YCLE8h
 ao/mEIh3AugucnX6paH91sCgCVy4QvIfYIxzxY0ip/7i0uYqvz7xOipWDCiJ+xAagjRRHbFVEW1
 9Fw4XgOkTOL1sICaLQzpwAIXSu9VNSLuyliuZJ37mlYGKhu1LiETkpPOU03WTYrd/d5FoJ1rA4E
 J+8a+sg170GvEjxD5gcT+nxWQkANZdId5HKNNel01ejw/0jF4tRTlAjYXFSXYEZ3Qs/AjANuuJo
 04LzhqmA4sQB/hE9QBaPScqWa5CEV0I+pZ7ec3YBAqH8B3bbj8yQenf9gfeo/jvhwVRpkBC17oc
 5Y4gtixK1RsRJiWfnHXRNIMeBrBKQYNMfdF63FH9yBMBtIPF1bJcasKmUUrSCbLnookn+xyzl0L fSj4M06e6kkhK3Q==
X-Mailer: b4 0.14.3
Message-ID: <20261016-binder-memcg-v1-2-d659b8ae088b@google.com>
Subject: [PATCH 2/2] rust_binder: charge allocated pages to memcg
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"T.J. Mercier" <tjmercier@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pages allocated for a binder VMA are currently not charged to any memory
cgroup. Thus, use `Page::alloc_page_memcg()` to charge them to the
owning process's `mm_struct`.

Suggested-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/page_range.rs | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf3504e7..57da47243967 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -27,7 +27,7 @@
     ffi::{c_ulong, c_void},
     mm::{virt, Mm, MmWithUser},
     new_mutex, new_spinlock,
-    page::{Page, PAGE_SHIFT, PAGE_SIZE},
+    page::{MemcgAllocError, Page, PAGE_SHIFT, PAGE_SIZE},
     prelude::*,
     str::CStr,
     sync::{aref::ARef, Mutex, SpinLock},
@@ -399,7 +399,16 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
     /// Assumes that `i` is in bounds.
     #[cold]
     unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
-        let new_page = Page::alloc_page(GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO)?;
+        let new_page = Page::alloc_page_memcg(GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO, &self.mm)
+            .inspect_err(|err| {
+                if *err == MemcgAllocError::Memcg {
+                    binder_debug!(
+                        FailedTransaction,
+                        "page allocation for message to {} was blocked by memory cgroup limits",
+                        self.pid,
+                    );
+                }
+            })?;
 
         let mm_mutex = self.mm_lock.lock();
         let inner = self.lock.lock();

-- 
2.56.0.212.g129ede20d9-goog


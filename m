Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686859;
	b=5S+wydNd8q+ivQpmAH3yes6y1aMZrYZvP+PQ4PIezxgoBZnsC/c7mM+K+2Vxn/QQUQkf
	 mc00uda2CQdAU/FO6ITS8I7S432po3jQ33roVMh4dEsEzTi6bKPU/PzGfVAqN9WvQtyI2
	 T2PEHhX8Sd7wJqRKHSSaZJOQg6WSsD2kH/StfE+T9TScpFISLBRBAbZAQsK7Iumso+i3p
	 EpJ+yRP8clRx89ymS58lUnUm6vxpIHWnmAa2cTbqyRIHVQxzGDgoai/rGDE/XbzJwfyDJ
	 Y8BtdW5vIro00BlpHLMaIsqLxU8nkXdJlIzQe3Pt1jHCj8mjzHsHSQ/tMCANQ7tWkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
	b=0uB++1qw5/UFH4lzCnhsEHwq7uUv907YMPZyxJFepgYoX76VWBbme+0Onv5CKUW05Q+j
	 RrwuQ1ssG/Nz2Op3MNy0M95Hc19Q2ghQrmBAtZ0jcyGJGcUvsoWn93slvmvgaHN8xbJgc
	 L48XXP6x4fij/4zGVhnxCttj61igJJ84nzR2WGb5UyO0H1HpyhasUrgMsMZbQeOaHwWtT
	 AuiIo9AtWUwNz0cHMcws961wZ22O1dswJh/sviJC8WQvDt27rS5CK7J1FmPwFsHvh+vjC
	 G9+fcazfqbegZQB5GriU6EC4Tcr9o393rmTnvUoDuGzDmwyzMFI1tRLe42ttXmTkEvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvfAUSKj;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B94606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B94606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvfAUSKj
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adff684a52so25841961fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686857; x=1795291657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
        b=IvfAUSKjFe+lIwItADASVZx37xao2k+85nJ7ppGs3A/dDclCCLxikwEy6Z3VdsHaZV
         y9AzJxLa4EF8tWxeEZvG9ctnIzRUHMr7egjQ1jQpf3UIsUn7rE0n/xAGz88CIiYO6n8p
         +DMsf7/3OhbEjupQ3Hjkw2ttPFTiA2tcMg4VHaRDB+GCFLGtvqPxWNvgd8lsMkTG0KMP
         Gyo8ViqfJqR3w7O6JUHJvw4Ue6e9PmGssyG7kTpaw6pbbrjnV14RA7P2uRGP4RpiMRKX
         3LpndelVu8Fgd5VzWtgGaG5iSmiynimUFYvU2CvXekRyEzQ11JlDoIxzreJZoBwz58FY
         Osnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686857; x=1795291657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
        b=SwtoCFrSjcTRxYi2OGGrGYPALEEuLIEMO9JZicNI6lt+J5Cj0Bf71Coa0WYJo78b/P
         eUg62A8htyCo2NeINsMlD3X2fR04gqx+5jMvD1kz86EMhocv+2gvfZSXXOPBr7kkMlc4
         TDVP4wJxRnEG23wnDKv6vu7Elmh6mqqV74lFE7f82KSinbqWtuQguSMw9oYOtrGsjUCC
         mpd8kgRWjeAOi+JDFA9JFj7LhI/gBwqyKKpiQg5Gr0945bj8IaGhoSn1OEIYvJ7mD7jy
         3NnPL2O58UswYcIfycbXl7f04idzlf6bY4kv56P+Q7XyW1kKjRNr8fInrDnYJTluJjPF
         mGpg==
X-Forwarded-Encrypted: i=1; AL+hErHIrBN3TaOKvLGH59M2j/+YE6rwhz/8E86JKD+AWPltW27wMlMCRhxxm0eY/suX7RNuYOs49VE2Dk8EJ4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GVHQe9CN5ev0kIsbBE3OfasyGQEoco8cyWFqsbcBiLAWI1xhs
	WxuTjAH/u8P3nX67NUKr9zLftETCKmBaggjweljbkdG7/MxCEUFEwz7i
X-Gm-Gg: AYBFou2HIj3BX4WiFOQ4OhlSoiy5yCmJ6yUVNlRvp2QLKmV1h5piuG7gYl46SOqVAAC
	W5Wcr3gwiNxfLam7QKLoYCuPvvZmbyOamQYpLpJJKBVQDX5WaBbv1TqvD0VontX3yZhq2936NJN
	bkMR/mHy3eVS9CI2lt47vqoDP+K7OGoEsAgMHnOCWdV4K14LafjXqJoBMxVKy1nPZVp5TTI9Z18
	k8co9HZCZLKgS44Ra5olNN4+4pLTD815/U7qhvex+7NLU6qSyqnYEDoJWkbLGvrKwpMTxfX53qh
	HwXG7nEG0oS+Lpzv3WwBrHXpY2OSZlNNsr4vPjIhTOMeDsYXyqrLK8L4P7TaDJ+dRkdKzp3c/5h
	9kUTR0KqcZa7mI8Aqeu9wDNcTeZxa2mRj071eXxEyHAVUjHXlMj4bRBC1yMX8hA5njIZbe7XmIR
	mXUTYyiXZeoRgAqyudC0dvXQO6Ygu1BT/0B2LNvg2VcrQxtPWDQ6umM2SUHndRHZgd1KKCLI6m9
	lZ678OpumB6VgsvNbOWXQzVqCnZbWbj6rFAZl4QKOklfTTApf3dibHLAAPyB2md1UI49wHKhKBY
	XZQN4uFNgS1hkzuqGhjNn0EKIq33afQrl4rE3O8=
X-Received: by 2002:a2e:be24:0:b0:3ab:4e70:6959 with SMTP id 38308e7fff4ca-3ae1c0008bdmr24199811fa.19.1794686857016;
        Sat, 14 Nov 2026 12:07:37 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712da125sm1891070e87.1.2026.11.14.12.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:07:36 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: sync: lock: allow fallible initializers in Lock::new
Date: Sat, 14 Nov 2026 22:07:00 +0200
Message-ID: <20261114200703.33229-2-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
References: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Lock::new() only accepts an infallible initializer for the
protected data, because impl PinInit<T> defaults the error type to
Infallible. This prevents wrapping a fallible initializer, such as
Opaque::try_ffi_init(), in a Mutex or SpinLock.

Make Lock::new() generic over the error type E, so that it accepts any
impl PinInit<T, E> and returns impl PinInit<Self, E>. E must implement
From<Infallible>, since initializing the lock state itself cannot fail.

This is needed, for example, by the GPU buddy allocator, which has a
TODO to move its gpu_buddy structure inside the mutex.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/lock.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..26c071088b02 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -128,11 +128,11 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(
-        t: impl PinInit<T>,
+    pub fn new<E: core::convert::From<core::convert::Infallible>>(
+        t: impl PinInit<T, E>,
         name: &'static CStr,
         key: Pin<&'static LockClassKey>,
-    ) -> impl PinInit<Self> {
+    ) -> impl PinInit<Self, E> {
         pin_init!(Self {
             data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
@@ -141,7 +141,7 @@ pub fn new(
             state <- Opaque::ffi_init(|slot| unsafe {
                 B::init(slot, name.as_char_ptr(), key.as_ptr())
             }),
-        })
+        }? E)
     }
 }
 
-- 
2.56.1


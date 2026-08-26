Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497E463B96
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762258; cv=none; b=fYL/UTmMMP7orkej5lJh1Evp10LSgUsRuo8VG3+dZm6mWfPFXnycXakNPp/Vb7IxVnDlBDf97uMGIrWnQgCV/91Io7T8EfqgopTuwjyQSBJr7CWmzDR5nhE7xuBd5oPHHcJdFqJ1ndwRK6Kh5pxfWg2/xYRtyJ1owXr6IKBPIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762258; c=relaxed/simple;
	bh=fysDNVWUuO78nym/TFKdoO0ItGD8Mdurf1UqAICYgn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nECbKu9uGTJRdM5wmvlfNe3m4YWvAc5Ye3R/TrijYbZHheObfQev1TEiGjt+3fZEAiAm/khysJoY0gol/9myW8paSs6s6gUGGmi1zsT3gCG8JPi/DROWGRLIbitV2kqNS4JATuc2hAS40b/4/h6PFCD4V/HexVCZD7newYZHC7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=d256dyr9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="d256dyr9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49800c6a846so9415425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762217; x=1788367017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkRk1iaOzdwQPEjbMkHe3YM7CcoWsAQlRLu4eqxZlx0=;
        b=d256dyr9s2t6PUXqmjmZprPriAj/byicXLyJ5B+9J9BEx1cG/OpCCnvH5284Jh7Fvk
         ytW4UYFtX50pL2jppAquccIDRu/b0VUBFu7iuvOPTAK5wQaaVBt0IAIsy/KxSgR8fYCC
         ABhncw9alrbW7Zr2AcI217a0Cvm+eeJD+pl2JwwwiCDJmZTSqpAQbrVOzIqKNxwoj3NB
         pKQHeUD63Mntspss2LWSvKT1dINvGuorKVfEH0ewvlx6pa3XreH+ke8ous9Ookc0s0au
         bvVzzlrpxHH5Cd6xL+hF+sM8X7CrCJ7cB1b4avTrMoym8+fVdTb1SMmWglOO1YXZtvyv
         WQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762217; x=1788367017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkRk1iaOzdwQPEjbMkHe3YM7CcoWsAQlRLu4eqxZlx0=;
        b=n0LaD3G5lCUh6pbERQfeMJhh56ISwCEg1HmKqs9YYvyWI6uKLQ6hPMUld9RY3D4r42
         BVHIh++AueHTjRLfIaOkiVqCsmnxgM4QZOvNb2IJ21HtSmsKkklGgi4elYOhKtCEdK4j
         puMMxSw8sykZ42XphMmJOaI7lKuWYkkzsZ1hoBITmdHvazNCACe/ilyU2pm6/MLRyX+/
         g7nFgqxdxEMpda9l51iTwxV4n9J0AjDN0s2YgBOLrFWPfBXWls9UoDU3GnpI0aYBfGc/
         6eCDqWdv/SV5d5NevD4QLdsdvSfO/xafTnHzY4PRmQzzjfk1Qh/OXLWzNq1DyzF18Dqh
         J5JA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5xFtUO/T0doKO/wa7DZEzRpcmhWvnndw0qj0kHGt0oxITmz2R4w82dFpmrCywof4hV6HPhQQK74G4zDg=@vger.kernel.org
X-Gm-Message-State: AFuF++k/x/hdwiGX+Zbxz2bKosbGSgphf+eBzuSxhKl1OwnwUg0C/E+G
	QwIYtRUTSeTntakOlv8Edi8wKzlxjh5OFGX65X7jmJqYq7/WCkb2nJId/45EwieJ+g==
X-Gm-Gg: AR+sD11F9/c4ANMfHLHlMJZzmuyoCF4XchO4AWSJLdo7FpuE/EBW9Ki4bkyASKAmPEX
	9xRfCvi7SsR66dluFj1EXB/AhkeZWEY5jnalVv/XlvKklyVXQ822HUwajGkwKs+3sqH0IQpyIaa
	4JtPCphERlLgJQFuAyNaFy0lQ3jAiIUYKnNGYfdIm7w54LzavOyPNFeb3N51/ITRnzQZtY9LRPX
	zjfaTc/K+GOYWSj91SWDvJcKptdXd4Mwl7J4+4tNwlLF6zUm0BYrOyukLQ34+94/ii7o3+doGR1
	Tm3wJHZoijLany9SRLE8PLYRYrtEQe9r1BXnVc4qrzvq+8liK0fTD5jcnkWzSavc/c3gEJdTJnl
	gqGzr9nEzfG1R3e3w49TdrsWfcqJZT9HPpGH5Wr98eJBriTMb+12Oe05noiujuLdryMBx6m5UqK
	genDu0LL0lwMZlTFRmdNi3QzpLwrsgF+JbuDcf+lbCv6NHMG6NvzPQBn+x5XEiArjSnXedk1sIM
	DTRpO5oAxp6DTgsBXeWpx+xLyQ4quSoH6lOqh8NAaRZz/U=
X-Received: by 2002:a05:600c:811a:b0:499:db9b:f253 with SMTP id 5b1f17b1804b1-499dc6ec214mr84001985e9.3.1787762217462;
        Wed, 26 Aug 2026 09:36:57 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:55 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/23] rust: drm: kms: walk the CRTCs an atomic commit carries
Date: Wed, 26 Aug 2026 17:31:53 +0100
Message-ID: <20260826163359.4998-23-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A driver enforcing a constraint its CRTCs share -- a bandwidth budget,
a clock source, a fixed pool of scanout engines -- has to weigh what
every head will be once the commit lands, and a per-CRTC callback can
only reach its own new state. Reaching the others through committed
state answers a different question: it prices each sibling at what it
is leaving rather than what it is taking, so two heads that both rise
in one commit each find the other still low, pass individually, and
break the shared limit together.

Add the walk over the CRTCs an atomic state carries, the Rust spelling
of for_each_new_crtc_in_state(), on both the state and its mutator.
The CRTC is handed over alongside its new state because the
driver-private data that names what a CRTC drives hangs off the CRTC,
not off the state.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/atomic.rs | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index f9f91edc89c3..24daeaeca075 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -142,6 +142,48 @@ pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnect
         None
     }
 
+    /// Invoke `f` for every CRTC this [`AtomicState`] carries a new state for, passing the CRTC
+    /// and that state.
+    ///
+    /// This is the Rust spelling of walking `for_each_new_crtc_in_state()`.
+    ///
+    /// A driver enforcing a constraint its heads share -- a bandwidth budget, a clock source, a
+    /// fixed pool of scanout engines -- has to weigh what every head will be once the commit
+    /// lands. A per-CRTC callback that consults committed state instead sees each sibling at its
+    /// old value, so two heads that both rise in one commit each find the other still low, pass
+    /// individually, and break the shared limit together.
+    pub fn for_each_new_crtc_state<F>(&self, mut f: F)
+    where
+        F: FnMut(&Crtc<T::Crtc>, &OpaqueCrtcState<T>),
+    {
+        // SAFETY: `state` is initialized via our type invariants, and `crtcs` together with the
+        // device's `num_crtc` are invariant for as long as we hold a reference to it.
+        let (crtcs, num) = unsafe {
+            let raw = self.as_raw();
+            ((*raw).crtcs, (*(*raw).dev).mode_config.num_crtc)
+        };
+        if crtcs.is_null() || num <= 0 {
+            return;
+        }
+        for i in 0..num as usize {
+            // SAFETY: `crtcs` points to `num_crtc` initialized entries.
+            let (ptr, new_state) = unsafe { ((*crtcs.add(i)).ptr, (*crtcs.add(i)).new_state) };
+            if ptr.is_null() || new_state.is_null() {
+                continue;
+            }
+            // SAFETY: every CRTC of a `KmsDriver` device is a `Crtc<T::Crtc>`, and a non-null
+            // `new_state` is a valid `drm_crtc_state`. Both borrow from `self`, so neither can
+            // outlive the atomic state owning them.
+            let (crtc, state) = unsafe {
+                (
+                    Crtc::<T::Crtc>::from_raw(ptr),
+                    OpaqueCrtcState::<T>::from_raw(new_state),
+                )
+            };
+            f(crtc, state);
+        }
+    }
+
     /// Return the old state of the first connector routed to `crtc` in this [`AtomicState`], if
     /// any.
     ///
@@ -282,6 +324,16 @@ pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnect
         self.state.new_connector_state_for_crtc(crtc)
     }
 
+    /// Invoke `f` for every CRTC this state carries a new state for.
+    ///
+    /// See [`AtomicState::for_each_new_crtc_state`].
+    pub fn for_each_new_crtc_state<F>(&self, f: F)
+    where
+        F: FnMut(&Crtc<T::Crtc>, &OpaqueCrtcState<T>),
+    {
+        self.state.for_each_new_crtc_state(f)
+    }
+
     /// Return the old state of the first connector routed to `crtc`, if any.
     ///
     /// See [`AtomicState::old_connector_state_for_crtc`].

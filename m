Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021614457BB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761745; cv=none; b=CAiD0NnMZX0K+CPqbzXvyu1IYRhf/yWHdSEKNGERuiC/F3xoU7B6oeprLYbOcHg/QTcsAMbQf7iUruJtHLeX5taE+4beMpl8mWGDip89BJtSV5rGbLDt8cv6Hrc316JOZgGk3V5hM5n/fEs8PqrXjMM6Zh+jK6kLDi92XOJM5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761745; c=relaxed/simple;
	bh=7nEFdhJnuwwLBAV3UiM1W1xo3GofuDusUz0fRYnHP94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8nPyIsU5jXs1oaYZdSWOnzcGP7V3IoqHcrBrMmc/8aEHTm5dxE8d4ogA1bLv78e2kpXkV/BEBWxvv4RIqKng7l/x3I/AGut/egJIUZNZrqLo4FjaQfkvm7Hjs6i6uudr+wkHPVfc+BSnsjvrX10+U2kNx49hS8cAGMHB4ugSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LT7HHk04; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LT7HHk04"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499840a2575so6638195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761742; x=1788366542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b9iSxFAhd+25NIrkOPdMG6vXzNwXPeGADBa8TYMNDc=;
        b=LT7HHk04sQIN5OEvZaJLhosa7e4iFey4ai2YOa52LBDlUOivvyftqqPuBx6pzZX63a
         BgNJ9NGZ5Yy7CR9OcFRoP5AMnt1PZqySX+MuhTo0mnIOY9H3TlLqR5lKGpgtbwKbe0bG
         yqemCo7UlYUIg1PR1qpU+/wZxgejLjf7ybqyTMo2KFjnFq6KlgZ53qh4rQuNkkqlXQL+
         Var9nfLhOK58s3mYnwQZUao59WufM2/YkY8y9Kbpkgqv/InSIHbgHB4vqruXPazXuinI
         i7ZyTXIdOGbWUo8Sh7AT4e/4Xf1x/gg6BvMGPJn+8jfIZROMUnOgKJdkSJZfhT4ZetDa
         236Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761742; x=1788366542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7b9iSxFAhd+25NIrkOPdMG6vXzNwXPeGADBa8TYMNDc=;
        b=nUqMKk3+cb45En+oas29Iwkica1meXf7Aptr/X2JiST5pXblXBT2v9cEG0zu74DbLH
         QF7LP+EP/Dc1HPmK9QK6XkvVQMOju6S2r60nAW/4CiRkPwjfrz8OXCo5k0zEAxG9WY9L
         1vlcVWwYG79UB8Pg+yDvcIQXW+AYnXUMQfka0wbOj4njtDhqCywxGyfh8HDiekQJNi5z
         Myw+XasmnxIkNZ0TnzDRRCgIT8ERLJX6u2hNrnsfj2zs5HPAbpsdMTM0pO1tFyK/KQqA
         Iz7VKU4PtLRAWXpJGucA8lWGQVy/VeoVpUcYLSN4K5RsI7W9Ti6tgAR7kBdfUbMYwx4P
         Fhcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr047jr7KzyEOBANof5MCE8oQrl4dleGS9DM1I8Rz3H0lO0CrOhX8rulUwImDYhtRGcl8nAEX0fcu8iwV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nOMPwSqvgbq8mH9Et+uOFyxdgtQvuCNvSbGi812iSRM1VDSyQy
	/UxgVD1L/KN7Bk5wLH51oWtubTEtCEFuK1sUzi4bJZbaRwtvJzDCB4WdyQuPOjxtgg==
X-Gm-Gg: AR+sD11O+lsL4VEIvkWea6DO/XH12XPm4kWRqS2luOg8UNSjBUlYeKMeIs4umMjw+cN
	4eQw3DlkzOEJ7HzWLj1CrAYI1tPbxySgHjCgfdXZUkvxNDdR2/83Z8qPnOo9iSD4/1m/x4Qxnm4
	2QW1uYB8ib8EeUFYpiwhrk5VpNUTtUM1R92C2DPzdzTDaOyRS/yzPnA4fCq92g4QHWHwZOdIv9y
	FhTQFxw9rBrcUEPp5KaNcdhWJok9WTWj9l0WYn2lTG96j1QeNAPsZekY+QokdPYziKFMkyXJssO
	e841V4VevS359yI3llrO7tlLTifphKkVQAKaFugNFKyu4ZNb+ZvOxA4XAh6RGYpD/Xeb6BolbSl
	Q6wKKuXd3SAj9Ehkwbp3Rp3YKOVSFFCClgIUXKjxHFln7xlkDS1CfZyenv+19TzS4ZVRJSMmXo0
	92YD3At3ns0TTMiUZp/+2LLE3Ra1s7FlR6WwkEfBwwjpKfFL13hKS9G9e5xOJolT+dk57s07s+o
	BXVUh1b4+rvOLUOFOm3L52oq97t+TNOokax
X-Received: by 2002:a05:600c:8518:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-499dc6f553emr79461395e9.1.1787761741748;
        Wed, 26 Aug 2026 09:29:01 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:00 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] rust: sync: completion: add single-shot and timed operations
Date: Wed, 26 Aug 2026 17:28:35 +0100
Message-ID: <20260826162851.2497-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose complete() and wait_for_completion_timeout() so Rust drivers
can coordinate asynchronous completions without open-coding access
to struct completion.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/sync/completion.rs | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..df4f6e11ef37 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,7 +6,12 @@
 //!
 //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    time::Jiffies,
+    types::Opaque, //
+};
 
 /// Synchronization primitive to signal when a certain task has been completed.
 ///
@@ -90,6 +95,15 @@ fn as_raw(&self) -> *mut bindings::completion {
         self.inner.get()
     }
 
+    /// Signal one task waiting for this completion.
+    ///
+    /// If no task is waiting, the signal is retained and consumed by a future waiter.
+    #[inline]
+    pub fn complete(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::complete(self.as_raw()) };
+    }
+
     /// Signal all tasks waiting on this completion.
     ///
     /// This method wakes up all tasks waiting on this completion; after this operation the
@@ -111,4 +125,13 @@ pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
     }
+
+    /// Wait at most `timeout` jiffies for one completion signal.
+    ///
+    /// Returns `true` after consuming a signal and `false` when the timeout expires.
+    #[inline]
+    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> bool {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) != 0 }
+    }
 }

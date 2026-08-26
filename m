Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35633455194
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761766; cv=none; b=pSMzZ3y6y4mGWc8zlq9f309tnKIDkFgX8Sl2jqaCZ/3fVdX2YSRl104GtikpmeQZFUxjffyrZlAj2tnkp9y9JCcfQqjKynnp56PzO40TuEteesyJ44hhHd2ZApF3fcT2DhMngZZ4QejwimlGq60Y13+upf7yy7ndJ8TU4R11BOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761766; c=relaxed/simple;
	bh=2a+l/bg9QWyBOLHkCZHI8Pi4V2rYdgego3Z3LFFslgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSTjBVFbpCHdNb6RvAMy2aO3k7ueqsInDuterrLpvkuaz2SCyLLrmwA2jEnbRfYQ6EzpRO0oSYSExabFG41Rd8vU4FB3LYtBLkWmZVM1gC0Kv9/lvc01J7wm+lm2aFQAIg86FWgL9usrUGhTTZ9wq2OtW2uIqDEAGyzXUzDUOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=hDE7w/Oy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="hDE7w/Oy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so9465805e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761763; x=1788366563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SB5XLaLKiqlALpfDcolT7jV5kFgT3pCfwpT2pD5qrYI=;
        b=hDE7w/Oy748jFnpZB8jevvX5zs7/EAmRAesOecFx/7UTNbfFN/i1gii+dBwemzWzDW
         FZ4ytyCPLL+Lvn7LjN6na8RQbbuGsWUu1nHvhBm731S2a94cpsRagU2V0i2p2c11fmFj
         IH0J/VmqWQCmV5fEURVGTP81ofNjvVtudaFEp9vzHbsPX6SCZxrs8pSl4+bsPNNww23z
         cS+Ege2zQdHMTpUbZMAmt0WEknWW4TPDSr4PRLsFx4Jr3mSGa/er4HrbBj8xxmQInVw5
         flSrCULrVQ9/mPuVUblj7IFgLO+q5VDsv1h5EhY4nF21iHUdpggFK9tygTVismlmYkSy
         Scjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761763; x=1788366563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SB5XLaLKiqlALpfDcolT7jV5kFgT3pCfwpT2pD5qrYI=;
        b=k9WSmHHWunVyLrEPbBoKhz/42BHBEJY0dCmAiEiyyNYRlYNT/kQ6rHAhy9Xeqhlagc
         0i8PP1IzBmFV2AxDZU2pgUJgKztn7y++S13aG8EmuJn0EcyrqMP1jDAQ5/94frKnEdOr
         Pfnoc56hkKQABq7BR7Aautvw5XKvEHqPHbYVv8atAeXrqQ04vg7Fa7UES1Ayhtw4wPA/
         /UGu/4At4LUPksAAUdC3CjDgoCRm8zRC6M4QH7eJ8d7ZlBBgxIPk3I9jWcOBLXXf5Xdx
         qkr1pMjWWO0uYp28P2lBs4u+mZaY0cXM9fDlG1f18XTzkz4dnjzGjJ0a4jLTM9YCxT2T
         QraQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF3INf7bW4InDiiW4b9VDNi1BPPvFzU3yuYZxDEOibgH8BB8wJajDDJ48jmz1JevvWDsvz8gsAqyP/zyI=@vger.kernel.org
X-Gm-Message-State: AFuF++l62pUsNCJkoQ7MzET465JZwkp2JOECWObS21JbNkHzH4m/XPpd
	ZnQffvgGOhmYdnoYzME1wwjQW1lrXdvVw49qXnub+r5MX6VwAIGiu5Gl7Gru3mwHig==
X-Gm-Gg: AR+sD127OYnPeiITcEwtNDH4620R5wSLIrDXhqBNIPQpwhfkB4R5zd0uyEExzBz1qL0
	s4fK8/cCv+JYSmgune9yqAwqSwXi547zwyly1po02VTK5Yf9WiZYClRUrfTNUVtxCbCJXe9PdW8
	cUquTDeH6vGT+Sa/0Nh9wz+pY5ZSAYYVgVzrZ5qMneflzRKOxqJ5raMxUjyAD4acxAX7nNR0rmA
	efriBbWHs+i26TtwMve83unM3h3D1OQ/RuNTuFTPD5Xw19OLVyWL9QyvtaqTizlFZTp3Hd7cTzX
	VsE06HwmXkWzGa9UJaEnF7SO+0lpKyRso4xV6SuZTcok7YZvYq8JBTHE1T2xeSQ0lHX9bw82k9M
	N3F1YqdFoIIUYO9bwBwFzo3R1ktyNiTeMZ0I6xNm1teIIhRMMSRWY27uOhcO8TADCmzvh2HjEiA
	VrCLc8KIFXnWR28gTOD96kKaK6v2+bpeivSKHjO8z5w1f42yhRV6Ihmae2f4feyLv8Ym9NcO2D4
	QBq6E2RZlxdDB0xKBq9OywSCzGcw127gNas
X-Received: by 2002:a05:600c:470a:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-499dc72266fmr75165625e9.10.1787761763371;
        Wed, 26 Aug 2026 09:29:23 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:21 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] rust: time: add ktime_get_real_seconds
Date: Wed, 26 Aug 2026 17:28:43 +0100
Message-ID: <20260826162851.2497-10-mike@fireburn.co.uk>
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

Reading an `Instant<RealTime>` is the wrong tool for a caller that only
wants a calendar time in seconds: it takes a full nanosecond timestamp and
then needs a 64-bit division to get back to what the timekeeping core
already maintains as a plain seconds field.

Wrap `ktime_get_real_seconds()`, which is that field. Document the property
that matters at the call site and that the type cannot express: the value
follows CLOCK_REALTIME, so it is not monotonic and can move in either
direction.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/time.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..a9922f1b493d 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -129,6 +129,20 @@ fn ktime_get() -> bindings::ktime_t {
     }
 }
 
+/// Returns the coarse wall-clock time in whole seconds since the Unix epoch.
+///
+/// This is the cheap counterpart to reading an [`Instant<RealTime>`]: it reads the seconds field
+/// the timekeeping core maintains, with no 64-bit division, and is what a caller that only needs a
+/// calendar time should use.
+///
+/// The value follows CLOCK_REALTIME, so it is not monotonic: settimeofday(2), NTP steps and leap
+/// second handling can move it in either direction.
+pub fn ktime_get_real_seconds() -> i64 {
+    // SAFETY: reading the timekeeping core's seconds field has no preconditions and is safe from
+    // any context.
+    unsafe { bindings::ktime_get_real_seconds() }
+}
+
 /// A monotonic that ticks while system is suspended.
 ///
 /// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,

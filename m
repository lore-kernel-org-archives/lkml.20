Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20899313E1B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881943; cv=none; b=RE8cahaFwd0EH4sgRBC4iajhoTWjKeLO0nDIsXschkaXvlrl2NWQahRAAyNyT2VLOOvaZIYuOLZf8mNp0zfXJbsYw0lZL6jIAejUef/u+U8gDTHvKMVWIcwEZHTGohq7XWAPY52317TRZxAieCu8UOe4XMN1JfhP25ZT84VwSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881943; c=relaxed/simple;
	bh=WXS6vakLdU7L83PfcH4phfkIOBuzvYI+wtSQFxoREIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9q31KezS5FaiHDSZr5Gc1i0Hx9ttVrNrTw73KJqPG0L93FoVckNhgqihIVhdrgOylaYvxh4jiX7kNON9zHNFHuyk6I7aFaekrMcTQS882vXt4cF3rkq1We9ZQSfCOtn3gdhfkvsxS77ih6wJP+DLEEJ0BYj8xccyMOyaOBUrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKNg1r/e; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKNg1r/e"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so4913975ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881940; x=1788486740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=PKNg1r/eippCTUc3wVCGegxU6+X75Vv2kPLek7o0HE4P2GhFQItj0kV3CY70UZXFpr
         eTZ3/YtLMxdO0Jd4IGLK/PTq/Azd4Zr055bKsB/AOjZNFvR1u43yePGTkCS2DWtJo/Tn
         E+6z+cvCoSHKkrnn47Mtt1GP2Q82wsqSVP5TvkVRtki1riGfsT9d9Ujx8fzQ6M0DjNyi
         bMAQpON+YsP1JIgU0cJl0tetsP+xWUORaCTdZmrOfl+6B0ejNlPkY7KRcJn0KWkKDthW
         sTmV1PdA68zsLSJeIsbFWc2FkBS9udnR+Ah5toP8Y1zJpvy8rbmcFYKiZTzHSXZywIuf
         iKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881940; x=1788486740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=AZsEgCSTs2a96f2VHoCt56Mg79Pe3cCLoiEdfNCjS0BH3sInp/Nu2Yo9d8Yztv4UuW
         NgPfG88VtxpFBcYGe/jmg3hFv2qIzY44KkkyESSVlRo0fA/23Wdw7SubvCmRTfk23it6
         WeE/IXvwmICiENj7MUK7Z4zBloBFaY4YoS5phYOzLWkkzRbZVCfgI8k7Qf9iXSqqjTcp
         dAOht5mBAMcxID/P3jPyK2B1I+oGI03eXoTLLa13wQYw+SCxFwRzv9cXrC+w3RSvDAnJ
         aDbk7HUuQAsqRK6+kkuOzteYRrode7u0iHXt5sl55cFvyow/c5BkTcO1xdnXO5nA6Byg
         HFkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0N5UwpE+NJvHDnQmze9nFPKeVndiXDhcKotdUrjRDRiP3/iiuklA+z1tx0bsBH9FLiWSL7RdBBrr9Kb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrDNDvc6pNI4fM92yo9bFJi9FHVjiyo8qOR2EGIv0zbM/IkuXh
	x8A7eQiYLrFmB8ETHTH1wZYS11ZGAo/0rlVfFKDAzwEKLD+H+0PeuHRc
X-Gm-Gg: AR+sD128W4OGzZyMJ1tCtnPcYBuw2Ct+1xB0DNhpfhdUVUPbN5PdwkHTKNJ+Vj0jemI
	w3ebIXE6wSEtSJ8LWFvAEJxYMbP9puXl1rdeqWFYNH49WBKeo8jX2zKNKAM+UJZ0zAzkuVPwq0Z
	TnwpUvTSUylLDGck5TOJseFrVDZ0bM+eCXf0LC9i4ny+oljGOTtTX2r78JWAN7R/PKP/GAf3J5K
	XrFcK///UDwidIRco9z3Fnn3U8rOe6y4gVIN1AhYrZFipL/5ZXqbSzjbjWhiXFTcLbw30mrbGWf
	l5nX7VhDoS8Tmrhg/Cs6y5Oo+sjKTN7yIuAfzsQdsrjv2055B2sRnbyDIYO0ZbgVSmOVbaQLZCe
	OX4o4Yl5koXT6qkxHy8DAZrdvFQZI8778E+Q+fWvsflgZtPDvKzn8sbzGtc5XiM7cusqn7v19BG
	GWrF4rtDZhDsg58jfQYXvdDJleOwpD3wluV9FR3fgYyyjpCnGecRG3ZclQlBF7yvwLRTx74Wuxx
	pSmVg==
X-Received: by 2002:a17:90b:2cc6:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396d0d92cffmr7286955a91.2.1787881939600;
        Thu, 27 Aug 2026 18:52:19 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:18 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
Date: Fri, 28 Aug 2026 04:50:20 +0300
Message-ID: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
causes consecutive messages to not be properly line-terminated.

Add the missing `\n` to all four formatting strings.

Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc printing")
Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >= 1.84.0")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_print_main.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 682207c81fc2..01729e87d6b5 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use kernel::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }
-- 
2.55.0


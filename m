Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760679;
	b=OfWNWP7MKuMwqcq1mPnxWK5ynanyuuI2muM3ClYBECa8iEFdW4sCI1vTKr9lIi57i9MQ
	 C6kEJk+KoZm+7VIF75YoSd4/bIoBbUVeSmXBqXvP1jWi8Dpq7LuoLqPnVlMaMgUmOeWtb
	 j0YD1SONPtm7A2M303SzXSioUhfbFXUlg1rXKYIOoRHVZjzdRPDwvGA6Efmfifl/3/FSt
	 8+cEWpyfIvLEXVar71K6R32E9p1bKwyUoerhqG1qnxp32EsbDT4tpHkczgpjGLTqiZmWk
	 7BxsACVb3qGDK+/7iuEP6z3Zlb05pbX8F8P5GjiCrfpybgo/pSCh2Z69F3scU0mT16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
	b=b9js6D7CHY9d51/KjI7gqyXIONJZei6VvFDG8eKj/YdFNZ3+w/1TgTPpFG72/6vsZxKY
	 EJW2ekzB4rTW8cB0xNm3znYOihBNV0FKTTr+sjNgxhL5jqj2HRnWupRr95R7+K7izCguA
	 oMTdXoz7DOFvblHkHDPDQx4znlCAksX7hSpSH45YVH10EPEj3ddA3oa0gDDAbPsTvmw8r
	 m+5BlEK+2o+LTSSdw9HSME235dZIHeaynvMKcIEDDmOBZQ6pbK6tJXhue8hUel3RQaOr9
	 jnhZMJvfuy0eJgyo9GiU62v6W4gy9plocCOiVNBhMyXpW5n5f1gvZfFMsjlZps/uWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lody6JOY;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2403E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lody6JOY
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3adc8668936so227837a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760678; x=1793365478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
        b=lody6JOYmoR5Ixf41CrcWzhJx7o1D5JML/EyQN9jrlJH3u5aECQWyw3U4Hb8STtYoD
         E1CHTWPAWSiLuzioHSPhqQ2mwanOGgeaDkB4qeSQVW3sCTg1FxDp1X+o/nFw0Up0rQoc
         1Vl2rvrIWgelIA/aP5M9oMsi8x1zgxoK+S6GDPLH7UeHhb5FwWjcEK+TfMSjZO4SeJw0
         KcDu5u0/yELowsCoi314qQqJlVsMt2JU2AnVZV57wj3FnkLDJjnTHxsuOtT4CEssv2p/
         xomWbtGma/06G7aCzjTdaFcCwUrmCo794208gPOT0mdV/iHfrLv1yLlqagaDRe8ceIoy
         FR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760678; x=1793365478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2cOO5Qmzsel13rD0d2Ch8Hy2dAKGNhwuzhw2PgQ5Ps=;
        b=awAsG5rZiXkgRtjXWPnvEALwiT/E1GVbnT8w049Al0ZuT69Wa879ebMlRMJKAZXLnw
         sAC1IdeecvH+PqfmxMAIRrodSMaJGiBRmxn1geZnRb6dhMwLgYqZYD+7xXtq/hOdh0oZ
         A+aXxlhAEABLP/eKQa2ZF042UOHrEMra1joIwiGINSDvaFNC6fx+1MtSI//DlTaZ4sQ7
         MBge9VNcxCWd+DeZAkbl9tLjKerNXyINauyyLn+kuxtY+08vyPCFCLtxM/kXC7in+23r
         hr703wkL7zfxDR5WrrI8frCMaX1n6FO8OjCn05keaQvp3Ui8dPAYOnC03dNQMb39qlSN
         BUqA==
X-Forwarded-Encrypted: i=1; AKwUvByIQKPd4BE/wR36EeStehzajLFMg2F591zsYvlj32fP1Zv5ErUb8PRbyPk+DDGmrM+umSCC3FggPI8oy10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZIMgtIvRC7c0A1riVYuklGW9fmf9rBCUbPnl6/jfOW7hLTtjF
	K9cmhGpFQMwaVsG8UkywiRKXOxhZfwTk/nGWrIk3oNV9qFy07JtBNcI=
X-Gm-Gg: AYBFou3dCM3j6H1fse5eMOp7o7avhqLNVZcVovasCcZSY3w9M8eLWRK6H1qkeXtgEbD
	5M+uT9QzjmG26XYXCUw/3m0PjyV3gQDXKJx26wEjxjt4fGRxquHUtP1OM/iiUlhi5veSoYQDn9S
	UhuXCGcDdutzE1OcfMfms91UeS/v0wt0xL100SDCPeY4glTHAld7PmebBJ+YuBPV8lqVFPJNRpa
	H8C2gvd2IKK7eD/Z/9PW0fxYGZ+4Q/bmkHvzUY+hhb5Q5RUrrsGQ5snCweB2VsHIqnBvxHsz3h/
	ad6urOJdu99p6I1HRP9qEeP/RHhIFNmSgk7gmn8QICbH2gE+JwjrcpqcRVbcy7vSoYtgjwKYJQy
	LudfyCPeN86B5XO2PlCexjOvmO3xBEfRiSy0T1vWchhKKJMZbHSQ9msVpyMU8h5lTJLyTuHxMK4
	T0RlFXqjBkM4l0/+kAWRrdJQFV+o3B+52d/QFPxMy5Hh/rZMX1qJADcfsvZS6VpgUuvJYRMTHJ/
	FU9ikJppFtirjurKrw3P8XRUC/iDULbFPF+QjuU8RXLljsIK4Wm2M2AG1sfexixWZOOc7GfVNwv
	Ffxu4VMIEA==
X-Received: by 2002:a17:90b:3810:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3adce09fa89mr1966572a91.55.1792760678220;
        Fri, 23 Oct 2026 06:04:38 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:37 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] rust: time: rename the rem_nanos() divisor
Date: Fri, 23 Oct 2026 21:04:11 +0800
Message-Id: <20261023130413.178487-2-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023130413.178487-1-chenhan0017.work@gmail.com>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com>
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

The argument to rem_nanos() is the divisor, while self holds the
dividend. Rename the argument and correct the documentation. Drop the
architecture-specific implementation explanation from the public API
documentation; the argument type already states the divisor's width.

This does not change the function's type or behavior. It is a preparation
for documenting and checking the invalid divisors in the next patch.

Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v3:
- Carry FUJITA Tomonori's Reviewed-by; code unchanged.

 rust/kernel/time.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5ae377e70dd8..16b44e82d2ac 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -614,16 +614,13 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
         Delta::<Jiffy>::from_jiffies(jiffies)
     }
 
-    /// Return `self % dividend` where `dividend` is in nanoseconds.
-    ///
-    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-    /// limited to 32 bit dividends.
+    /// Return `self % divisor` where `divisor` is in nanoseconds.
     #[inline]
-    pub fn rem_nanos(self, dividend: i32) -> Self {
+    pub fn rem_nanos(self, divisor: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                value: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(divisor),
             }
         }
 
@@ -632,7 +629,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             let mut rem = 0;
 
             // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
+            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
                 value: i64::from(rem),
-- 
2.34.1


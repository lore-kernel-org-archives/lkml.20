Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868002;
	b=q5xhPzWZCdC489JWUFeozShcgAgaBdVXTsEV50EqRhCWIQSUA6mZ9BLdfXHGoU6nORzR
	 zI7XOosriM1VKmAcL7m+TZ/1xLDh9g/sDjeWGhwMhIxNXwx9VDcy37H1k/f2V7RSqluVY
	 gyu2F9cX5mM8te8MDAaj3FVnW5Aw1xhvIgxUY8rI6Ld12rLsws27dui0QS6DsiR+3WhDV
	 TOl1USzXrDpZf7c8zOgkMQWxM4QTzQNsKWvBMfL5bNVNo2efEKQpJaywz+MDmBpUB+sqO
	 wGf6L+drcm5uB8D6yJcQZFNAYIfqRXb5FPZOW6yn9kKVWQwvgCfVarLJfVCggGpKWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AUAa/aTX2gQGn0y9d61clIoulhc/9id9r2iYUHc+3j0=;
	b=C7VL71qtwbJ/SxJlKlrGwxmoCD8EEAYbn4Spf7H1XGEkzwbmUaopi6tZ3SuHZ4zys8f6
	 e4wY8NH8AJh6MbnIcVkd20ydWERNThhph7VBsB8e5ObnYjklyz/FbxMnuNKsm/LfLWkXv
	 LUvFtOS4hTC8gJ4YoFVn5fgN7PT8WCMuYWsXdaHYidFd9tPv6cb3aCO4Oc7NZaykv2W2U
	 qQKk/6tgHG/UUWCJW/n69z4Mcz06jtaJlvWpslZRzZu3Y5WrpUocytCug3iWe6eTdenub
	 g0UQj3Hs55O3ogMwJNbH8mFQDs6P/rdad2Z0yabpavcohHUIPX7KMm+b6k2oyIGmkOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=y9PmSvqC;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90424606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90424606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=y9PmSvqC
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jT2XH1B8dzlpHwl;
	Mon, 16 Nov 2026 22:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1794867995; x=1797459996; bh=AUAa/aTX2gQGn0y9d61clIoulhc/9id9r2i
	YUHc+3j0=; b=y9PmSvqCQAVYDWP+xI4l2O097SF7293ct75Owf9Sfc2j0KBzop8
	tEFoWR8NtAVSCxgrwH/Od8PON6ldaQTFleILunjAkG6OVsxfvZY7VKjyrjCzkUwA
	/ZZJ/X1zswJL6Z39DiawZ00QKUrJby5YkTD28vtkmkj9TD2S+XbUTWu6xo7V7hpH
	wLxi5X13u2mZeOm128z7TLWCD2Pes7NVeARM1YjvEs1LlDesv2P3o+Q8d4XU/XVk
	Z79N0EyHq68+5P+5Bx9gCr0hS2mozNv7s+AZx64UFP1xusOAHBoSZkj+9uQHTneu
	D+FekRX1kCgJLdEcOaMiLCxsQ9wpx49ehkw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MrnEG1oWLE38; Mon, 16 Nov 2026 22:26:35 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jT2XC3BQvzlg7KN;
	Mon, 16 Nov 2026 22:26:35 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] compiler.h: Support 64-bit bitwise types in is_signed_type()
Date: Mon, 16 Nov 2026 14:26:25 -0800
Message-ID: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace -1 with -1LL in the definition of is_signed_type(type) to
prevent sparse from emitting "cast to restricted __le64" and
"restricted __le64 degrades to integer" warnings when evaluating
is_signed_type() on 64-bit __bitwise types such as __le64 (for example,
in tracepoint __field() macros in net/mac80211/trace.h).

Use a 64-bit all-ones constant (-1LL) rather than a 32-bit int (-1)
because sparse only permits casting a non-zero integer constant to a
__bitwise type and ordering it with '<' when the constant has all bits
set across the full bit width of the target type. Ensure that the
constant before the cast has 64 bits set so that sparse's
restricted_value() and can_order() checks succeed for 64-bit __bitwise
types on both 32-bit and 64-bit architectures.

Add a KUnit test case for is_signed_type(__le64) in
lib/tests/is_signed_type_kunit.c to exercise 64-bit __bitwise types.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/compiler.h         | 2 +-
 lib/tests/is_signed_type_kunit.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index cb2f6050bdf7..2f133a7c3885 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -326,7 +326,7 @@ static inline void *offset_to_ptr(const int *off)
  * Whether 'type' is a signed type or an unsigned type. Supports scalar =
types,
  * bool and also pointer types.
  */
-#define is_signed_type(type) (((type)(-1)) < (__force type)1)
+#define is_signed_type(type) (((type)(-1LL)) < (__force type)1)
 #define is_unsigned_type(type) (!is_signed_type(type))
=20
 /*
diff --git a/lib/tests/is_signed_type_kunit.c b/lib/tests/is_signed_type_=
kunit.c
index 88adbe813f3a..b9c8f7da45e9 100644
--- a/lib/tests/is_signed_type_kunit.c
+++ b/lib/tests/is_signed_type_kunit.c
@@ -18,6 +18,8 @@ enum signed_enum {
=20
 static void is_signed_type_test(struct kunit *test)
 {
+	typedef __bitwise long long bitwise_long_long;
+
 	KUNIT_EXPECT_EQ(test, is_signed_type(bool), false);
 	KUNIT_EXPECT_EQ(test, is_signed_type(signed char), true);
 	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned char), false);
@@ -27,7 +29,10 @@ static void is_signed_type_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, is_signed_type(long), true);
 	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned long), false);
 	KUNIT_EXPECT_EQ(test, is_signed_type(long long), true);
+	KUNIT_EXPECT_EQ(test, is_signed_type(bitwise_long_long), true);
 	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned long long), false);
+	KUNIT_EXPECT_EQ(test, is_signed_type(__be64), false);
+	KUNIT_EXPECT_EQ(test, is_signed_type(__le64), false);
 	KUNIT_EXPECT_EQ(test, is_signed_type(enum unsigned_enum), false);
 	KUNIT_EXPECT_EQ(test, is_signed_type(enum signed_enum), true);
 	KUNIT_EXPECT_EQ(test, is_signed_type(void *), false);

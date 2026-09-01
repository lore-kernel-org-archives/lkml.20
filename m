Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26944494822
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285930; cv=none; b=FRUuXX7kYAIWWzxIDBUoKLMWpii6fc/QRFm2sq4lg+VQR8WZts4hHoABcAN7IHrU38Vb/o0bsHXtCRfvIzafm5S05vaFSRw+J20TzWFgnuh+fLdhvJQwI9OZOxVYNC0As2s0OlmSnBkVUyx416m82EFeg8dcW6Tw5yt0BsL9Rsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285930; c=relaxed/simple;
	bh=z3C34BsrHSMi2y7Wt4votuBaML+q4BgcrzyroXVN5mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xsf9YSKYKrrJEg9U9I4NTpbNqrcyIhQc1OXF/rLmShbgOfiGwfh4Fx7gVkA8b3rCy9iovDiv6bfYMENb/xb9Xj+syc0b2txDgCUUozwaORf/IRckxsykCrMDSkMy6CNnTgngq1w02T8Bf83LEUivMBfLyb+aYuXi40n/xUHJk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=E7Qd10nw; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="E7Qd10nw"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hZDL04cp9zlfqB3;
	Tue,  1 Sep 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788285922; x=1790877923; bh=UcvK0M7vO6rQpKZC0FA6e/mp
	oF8Rhgg41MhurqsyWK4=; b=E7Qd10nwtnbGVgt2NU7qMWk4bATq2rM/KPiYybFa
	PHvHmuOB7kBJZ8RM+7Uy9KI7U1e2yzi24a5y9HCQavpNSyhNBJr2mzO3QMa3KVAs
	DzXXvkiG19GMnnDqEdwmOtpshvrD0XWXWJ4tgBB5o81lzjaIhWq+KZTu5lGCNPTl
	pilDagyNGziPYO411BLKZb0PpZR7jvJttRwP2yFJHSsDPUyeBCFEOGJMk16ekuxT
	s4WmWTb0lOyOa8WrbXY1lRhEHTGHHrcwl+AdrRK+am5sq/1Mecq25nF1YWcLIoW2
	aSotbJKE5v0DfJEv+OLVOegCvsM8PquYsalkpcij9D4Dyw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9KMc0q2iCxB3; Tue,  1 Sep 2026 18:05:22 +0000 (UTC)
Received: from [100.80.227.50] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hZDKr02MjzlfqB2;
	Tue,  1 Sep 2026 18:05:19 +0000 (UTC)
Message-ID: <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
Date: Tue, 1 Sep 2026 11:05:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: David Laight <david.laight.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260901092043.7feaf5d7@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 1:20 AM, David Laight wrote:
> I suspect you need to change the TRACE_EVENT() calls to remove the
> __bitwise marker.

How to remove the __bitwise marker? Removing the __bitwise marker is not
supported by sparse, isn't it?

How about the changes shown below (should be split into two patches)?

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index cb2f6050bdf7..54c99a25caa5 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -326,7 +326,14 @@ static inline void *offset_to_ptr(const int *off)
   * Whether 'type' is a signed type or an unsigned type. Supports 
scalar types,
   * bool and also pointer types.
   */
-#define is_signed_type(type) (((type)(-1)) < (__force type)1)
+#define is_signed_type(type) _Generic(((TYPEOF_UNQUAL(type))0),	\
+	signed char: true,			\
+	signed short: true,			\
+	signed int: true,			\
+	signed long: true,			\
+	signed long long: true,			\
+	char: ((char)-1 < (char)1),		\
+	default: false)
  #define is_unsigned_type(type) (!is_signed_type(type))

  /*
diff --git a/lib/tests/is_signed_type_kunit.c 
b/lib/tests/is_signed_type_kunit.c
index 88adbe813f3a..b72da7f6084f 100644
--- a/lib/tests/is_signed_type_kunit.c
+++ b/lib/tests/is_signed_type_kunit.c
@@ -22,6 +22,8 @@ static void is_signed_type_test(struct kunit *test)
  	KUNIT_EXPECT_EQ(test, is_signed_type(signed char), true);
  	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned char), false);
  	KUNIT_EXPECT_EQ(test, is_signed_type(char), false);
+	KUNIT_EXPECT_EQ(test, is_signed_type(short), true);
+	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned short), false);
  	KUNIT_EXPECT_EQ(test, is_signed_type(int), true);
  	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned int), false);
  	KUNIT_EXPECT_EQ(test, is_signed_type(long), true);
@@ -32,6 +34,13 @@ static void is_signed_type_test(struct kunit *test)
  	KUNIT_EXPECT_EQ(test, is_signed_type(enum signed_enum), true);
  	KUNIT_EXPECT_EQ(test, is_signed_type(void *), false);
  	KUNIT_EXPECT_EQ(test, is_signed_type(const char *), false);
+	KUNIT_EXPECT_EQ(test, is_signed_type(int (*)(void)), false);
+
+	KUNIT_EXPECT_EQ(test, is_signed_type(const int), true);
+	KUNIT_EXPECT_EQ(test, is_signed_type(const unsigned int), false);
+
+	KUNIT_EXPECT_EQ(test, is_signed_type(volatile int), true);
+	KUNIT_EXPECT_EQ(test, is_signed_type(volatile unsigned int), false);
  }

  static struct kunit_case is_signed_type_test_cases[] = {

Thanks,

Bart.

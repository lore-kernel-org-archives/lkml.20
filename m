Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649955;
	b=y2npgbJOmfcpj1VmHDIwW1ptQpgVQKWhiwRdKyAbjQmOslaw7V6vKRNTfAqzrfiL1nGB
	 yNr83RxwBRAI7hHWwTNNowfJ2FANufJ1s+RmtmpdbCmbntWS0DmxET+zsKON+wR4jT4Zi
	 s1fFwTYGh+l1fcSWlpoJLhKA8u8k5gEA6e82Qfjlm1eViVNUcpn+lK18h9q9pLtMBOh8r
	 rf3MdaH0f2gHANwj1p30F3x88wtrzqH8izpBAX+pJxNaoF4GzJGn9l1mZZ72//G7yBYA1
	 6tnxCJTTdwB8KXuzhbjep1Qg/UeYGbuXj9hZMMhKiWby6HQMTIMNY9Amnru8VQrLpiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K3dX0Z+7iQfH+A7/bXaAKsuAXOV0MvVIMYmA1OuBCYE=;
	b=18JVCUXEMffCio1zbtilJdwURfv2OU1/7Q2arVHz+HLwFj3T6OzBw9KBNihmh02AKCiG
	 ljVNfA825xgYRyhp9fpzlPtPGjupGFMgVhosmSdfIk70MlFeWIDTtqtaqBCG0ze11ri/3
	 6lM+xntLj1ErVDv8VNQUJaqpCjvTwkdfotLz0JNnG+7yUSP3BLNeoLr7c4sEAGxzOLN9z
	 BdiGf0F/M4uqxEZ81+234bolC+Qf/ABE7GhsRiXJBY+lKMHhuKREciSgrjUYWZR+GoMft
	 r1MxEPykaLAJm3F+r8ii5HP2beeBG2zp96V+CkP/JP3GMz3KN9hObXe16WCPgCSHLEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=SQJYEmRt;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84DB606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B84DB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=SQJYEmRt
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-00ARyj-B1; Mon, 02 Nov 2026 21:05:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=K3dX0Z+7iQfH+A7/bXaAKsuAXOV0MvVIMYmA1OuBCYE=; b=SQJYEmRtWuXqoWopqcMTueF8V+
	0CVVx/dyet8IfqjNA5pSHBoQi03xZi7QAGBcMuFpHpFhUgE4fMJaoPQi+D+AW79JjsI727UWIqiXh
	Ljyc9YWtzeAgZWwXGdLf5fsWGj6Rgthiw4TZe5ylP9IGtD+4qR5Do4JcM6ZWB6hS9Er77ePOp6yHM
	H3/Xvx2nc2YkJ0O396tGheBlxL0Lx8l1dOfiB+SJEA+yjjjm0raIjyUX3avfhUVw3fEX8a+08GciU
	Ulc+QK7iBCxhQXZ49A8V09JVscYhQ2JD/8suLUlxNmUmh+FWDCMxUHoW6r/LATqniaHEGvEQWv4ig
	tj/jGP1Q==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHo-0005iR-T1; Mon, 02 Nov 2026 21:05:45 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHc-00AUIb-Ts;
	Mon, 02 Nov 2026 21:05:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 3/7] random32: Fix tests for xor -> add change to prandom_u32_state()
Date: Mon,  2 Nov 2026 20:05:18 +0000
Message-Id: <20261102200522.3337-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261102200522.3337-1-david.laight.linux@gmail.com>
References: <20261102200522.3337-1-david.laight.linux@gmail.com>
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

The test vectors check the result of prandom_u32_state() against known
values. The change to prandom_u32_state() to add the four values to
make determining the state not completely trivial breaks this.

Rather than change the test data fix the tests by adding a local
function that combines the four values using xor.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/tests/random32_kunit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/tests/random32_kunit.c b/lib/tests/random32_kunit.c
index 0b4af2b09c01..ccf439686fda 100644
--- a/lib/tests/random32_kunit.c
+++ b/lib/tests/random32_kunit.c
@@ -136,6 +136,16 @@ static void prandom_state_test_seed(struct rnd_state *state, u32 seed)
 	state->s4 = __seed(LCG(state->s3), 128U);
 }
 
+/*
+ * prandom_u32_state() adds the values to stop the generator being linear.
+ * To avoid changing the test recover the expected value.
+ */
+static u32 prandom_u32_state_xor(struct rnd_state *state)
+{
+	prandom_u32_state(state);
+	return state->s1 ^ state->s2 ^ state->s3 ^ state->s4;
+}
+
 static void test_prandom_seed_boundary(struct kunit *test)
 {
 	int i;
@@ -144,7 +154,7 @@ static void test_prandom_seed_boundary(struct kunit *test)
 	for (i = 0; i < ARRAY_SIZE(test1); i++) {
 		prandom_state_test_seed(&state, test1[i].seed);
 		prandom_warmup(&state);
-		KUNIT_EXPECT_EQ(test, test1[i].result, prandom_u32_state(&state));
+		KUNIT_EXPECT_EQ(test, test1[i].result, prandom_u32_state_xor(&state));
 	}
 }
 
@@ -160,7 +170,7 @@ static void test_prandom_taus113(struct kunit *test)
 		for (j = 0; j < test2[i].iteration - 1; j++)
 			prandom_u32_state(&state);
 
-		KUNIT_EXPECT_EQ(test, test2[i].result, prandom_u32_state(&state));
+		KUNIT_EXPECT_EQ(test, test2[i].result, prandom_u32_state_xor(&state));
 	}
 }
 
-- 
2.39.5


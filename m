Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2D384CCB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477620; cv=none; b=dGnjaVaq5n/SEgLrXnY7OAxJ0FN3GlSJi4Ihk2fydENEcP6aiWEWYn4WHnc4fvHIRgb2NlU0YFNcfQVh8zGPs+1vuv7h4FnPSkGW7VozQbFft37Ae+bWxEI0Mx41crs6zqHadgYSdh//mOrzxNycj8QE+B9P/VDzsDoKaz9zKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477620; c=relaxed/simple;
	bh=qQebyK1qn4QyeS7i87/WFVsOqle2tm+F7iu/hTmqx94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dQV/TrVgK6glfeCCZ8c05y4V149r8UKaN+mFQyLya7Z3l4L7MpnzmLjP6Utin1DTs2Vm2jkwjuZJjT3kDmnfz/hs5QQNM9UD6VWkXf9V/t7MT9yzaZZCYY363T/5Z6tXY5pT2jlRq00RXyYRxAWclIhC9+QJ9JpG4hdvPFt8128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9pPOiGE; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9pPOiGE"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-825b40f8a26so1574214a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477618; x=1792082418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4ia65KqaNKJzRA1TMQYjYE+pIU/sZEdHWr8kBySgNg=;
        b=A9pPOiGERJZGQQKK9p9iqHdMwY7W+E2SyLKe/aWZsOfOj1i9/tYiDp5qD8wCgRghaB
         nLkLAyq7MZkQb+Hd93/mf+JQh6R+M0oyUlXzHC670PGXYfyqxYEQX/SqecFENXCydQUG
         cz3t8kGGv4n6E2NZBT8jCsUunC663mqXOHyqJmPhpZO+gJEm7xVK1gnc00h4bfWgMIh3
         9IF5lWsPh1kEda0Za5LsS78J9CBv6b8pKuRolBN0FEk1oBWMfsT0kEAGEASZX6vMUnEP
         4d2EiDCrur8px88FxY1GK8jqIXk3oaP78ndXU4ZTaHPSmjD8cYR/3em+VYwA4EtoADGa
         Atzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477618; x=1792082418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4ia65KqaNKJzRA1TMQYjYE+pIU/sZEdHWr8kBySgNg=;
        b=BpwmB8Xi2JxiikCJsev2A53EmEW5B8kjSw5VFKl2dJDprpl4NqQ5xkes4APftZvulP
         dM/Tq7iJafefXbT+z0QGOqpy8dWvKpuo3pUeTIi34ZVt5mL7K7uPFFgRaUds3tvlo+An
         7a1C2kpbN5jnMq9UUD2vscB89iVWjyApmkd5tRSfoZ3KHadGopZFk4cuv3RY7gg1Skse
         bb3stvJgv9tixCAsqWevi0A4ytut/+3dgShAmKS6nD5pLjoNSo2F3ypevxt5qXVlDljb
         fFHcmBwZ5wUQD38N4OtvJxmhZvOBtcC0zxlEW+/KbNugUZtIgu85V2cJwpNqJ6dps7fx
         kOhw==
X-Forwarded-Encrypted: i=1; AKwUvBz0p5RIUQTjhIouXyOpVTSDq+uelTknn0MWTobm6R/Plvu8Gshbf57V1taZfdX25VRY5nXgkIRzvoNVK+o=@vger.kernel.org
X-Gm-Message-State: AFuF++kzO15k1EPBF7DoO9zNemLeyj5RtQibcmtcnC5gAuXdlwJtrkSO
	GXdR77ORVU1vnBQlRI0X3W9N4xGtDD3uJlyacuRomFuuSzu98X7qRZlM
X-Gm-Gg: AYBFou2Eh0SkoK5WK5sx42RVtBUoi02BbOsupMqDfRJTSWvhEP2GPMjOKu5+9hhVG/l
	z4TmJa7Dk6k/7A4ts0CcBm51rjnWWAcfWGZLVQGwu7LQt+ih3ypIaNPs9Qecrqc6Bn/b4rAHGBt
	jB3l1/u4lrzDXCtDjWqFZIeY3doQmIJXdPE8lq3OP9uNMU0KJPK/KoFqjhxTgzoyzFmiTb+zM1l
	EQBgD6hJQSIQOVcw9nAYmEGpBKVbt5Vgdk9rirW41U97JtUmmytqRIUoS135RGj3Qo7VIMuhxLf
	ipnQ2ozcj8e4fLvhwGM9n0olhEHCCw9dH6duN0xaGJUh66GLHsfxK574H0ggLxcHU6LVKaGdA6c
	p01qVi4mmGqP+ffS4Vxkir/ER9qd/vsO5yWJR7YuX+ZMQl5nYFXsUOm2oSgCKNF2r7tEG30UUFd
	txZhATAP/T1TMoelDE47L9eOGua4ctdVrVD+JZLAfCpveHS01tMjDJlOwI23wvEGQRcJfujYFdN
	FKNGioNYTuA
X-Received: by 2002:a05:6808:1b93:b0:4f4:6421:5ee8 with SMTP id 5614622812f47-4fc4646ddbemr4919307b6e.42.1791477618420;
        Thu, 08 Oct 2026 09:40:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc484f7366sm6562275b6e.5.2026.10.08.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:18 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: dhowells@redhat.com,
	akpm@linux-foundation.org
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] asn1_compiler: fix heap overflows on small or token-dense grammars
Date: Thu,  8 Oct 2026 11:40:04 -0500
Message-Id: <20261008164004.3668307-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tokenise() allocates (len / 2) tokens on the assumption that there are
never more tokens than half the number of input characters. That doesn't
hold: single-character tokens may be adjacent, so "{}" yields two tokens
from two bytes while only one slot is allocated, and a 1-byte grammar
gets a zero-sized array. The tokeniser then writes past the end of the
heap buffer:

  AddressSanitizer: heap-buffer-overflow
  WRITE of size 2 ... in tokenise scripts/asn1_compiler.c:407

Every token consumes at least one character, so size the array by the
input length instead. Allocate one extra, zeroed slot as well, since
build_type_list() points the stop-marker type at token_list[nr_tokens].

Additionally, build_type_list() iterates with "n < nr_tokens - 1" where
nr_tokens is unsigned. A grammar that contains no tokens (for example a
file holding only a comment) makes this underflow and read far beyond
token_list:

  AddressSanitizer: heap-buffer-overflow
  READ of size 1 ... in build_type_list scripts/asn1_compiler.c:753

Use "n + 1 < nr_tokens" instead, so that such input is rejected with the
existing "No defined types" error.

The generated output for all in-tree .asn1 grammars is unchanged.

Found by fuzzing asn1_compiler built with ASan/UBSan.

Reproducers:
  printf '{}' > a.asn1 && scripts/asn1_compiler a.asn1 a.c a.h
  printf -- '-- x\n' > b.asn1 && scripts/asn1_compiler b.asn1 b.c b.h

Fixes: 4520c6a49af8 ("X.509: Add simple ASN.1 grammar compiler")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005085707.872193-1-lzsx618@gmail.com

 scripts/asn1_compiler.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index 4c3f645065..1ae89637d5 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -349,10 +349,10 @@ static void tokenise(char *buffer, char *end)
 	char *line, *nl, *start, *p, *q;
 	unsigned tix, lineno;
 
-	/* Assume we're going to have half as many tokens as we have
-	 * characters
+	/* Every token consumes at least one character, so we can't have
+	 * more tokens than we have characters
 	 */
-	token_list = tokens = calloc((end - buffer) / 2, sizeof(struct token));
+	token_list = tokens = calloc(end - buffer + 1, sizeof(struct token));
 	if (!tokens) {
 		perror(NULL);
 		exit(1);
@@ -749,7 +749,7 @@ static void build_type_list(void)
 	unsigned nr, t, n;
 
 	nr = 0;
-	for (n = 0; n < nr_tokens - 1; n++)
+	for (n = 0; n + 1 < nr_tokens; n++)
 		if (token_list[n + 0].token_type == TOKEN_TYPE_NAME &&
 		    token_list[n + 1].token_type == TOKEN_ASSIGNMENT)
 			nr++;
@@ -773,7 +773,7 @@ static void build_type_list(void)
 
 	t = 0;
 	types[t].flags |= TYPE_BEGIN;
-	for (n = 0; n < nr_tokens - 1; n++) {
+	for (n = 0; n + 1 < nr_tokens; n++) {
 		if (token_list[n + 0].token_type == TOKEN_TYPE_NAME &&
 		    token_list[n + 1].token_type == TOKEN_ASSIGNMENT) {
 			types[t].name = &token_list[n];
-- 
2.34.1


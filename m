Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936146;
	b=p7/cgJN5yFlvvGbyVv7lIU37Co35p7Wwn3uWhgvvM46+nHOuq0AtrJXDQ9/bnIa4DaY7
	 J/bTTPyzDopRHiY/ZL8IX38I4CdOhXY6rmrHOoL76GQuY/FzG6VoFZo8tN1vEPbq6Sk6l
	 lHIusErSDjVYKy2TQ3AgDtv+doQdhMQpkhGgFBltY9Klc3K+OD8P4NTnft1PpmjsOR+Kg
	 AuEayfHxPWa9e9GrfThc0t9PiQv+WeQA6kpccQWTmh6v45HyBmf361OZD1IuFote7+z6n
	 wdnfMSIMYWzpibYx3AUfZaO/NM0z8KKDb9YFD7r1dtyT2buapIfiSy+IERCXCvieUcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BuMdsy7WLDJTbG/fzLpGZSQEU36QGPKXqBoedqSItWQ=;
	b=alr4JLM3ERfrdB8VoosncqHH+W9mnwi6Y16DZ0T6WJlco2ZzeAPVdTwKVLq2Lqs42xR4
	 t4Grz+Kppz7HzV7C1q6d3ie7lWXyNJGHmRAygzxqxDuVJRqWfSKWwaa1nocG/m0+yqdgt
	 bPBoMOBbWato5uVpipw4HlmxotZHcnp9cqU7L+4ZyrDOhU7h+Gy3ELFbJEYIAnwkdaxS+
	 tVZR7J4puVmyhXmshShZw/lm3XgAUEzHvACNidmlHS3fSyF89jjbUnH7Jp/JvLL91Tqf/
	 5oEMw6kMQ5bF0tnpXkDJXwUysBTdhomOZ9qU/gpha7AZdRdavPfqScUatFVrFUlKL9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKEXXhqE;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A65606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A65606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKEXXhqE
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380c17707ddso21339eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936145; x=1795540945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuMdsy7WLDJTbG/fzLpGZSQEU36QGPKXqBoedqSItWQ=;
        b=EKEXXhqEYtkDyyCbzaTFMv1pHbbEa9atg5KKnCz44ZSFb58AkrVbN4Yb3lQwZGMxdz
         pD7hhzcFQHbxmN+jKn9rMuiTHe/2W0S1cbHPLdo988zC4cjp9C4/YbDKZ90AuXJdh081
         pFC868PLRaANA9j/+lJYjtKU79MJt2NRvzFemHE0m8VjM0gELZLfl057bEmAbAKLVAXT
         AQxz74Tjc0MLGSdr8AcFOJboIyE8rCQb16qM91hr9HF7rec+ewv6mKbRkV0KEUp5rEZu
         d/w+F/f0cX8uA+pVZco7yT5G1EAWT7I/3QRqN33b5WAv+Blcqw0pK4FJ6igSpgEROPav
         717g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936145; x=1795540945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuMdsy7WLDJTbG/fzLpGZSQEU36QGPKXqBoedqSItWQ=;
        b=jjYC6OOe8jHPLIHujeYhJ606PEgxXarwjLTsRUIEymTWI7U+IEacA9bEkV/4KIg/G6
         zJkhFjjax590ca+kqr4lKmO4MkC9OHn2YOo9ohe6bUGogThI3ZPsEW6HHMtwOfOwXEiE
         l+YRgl2gpJjIuHRZvnGex5u8LEv4efVYd+1F1ESJoyOO44ftf/w64z1K+s2ShXXolQlT
         yauuvDp9BtrlVvRCgjeKoYHGmVhzSQMRrAABr088WUUKjD7bgsx+gNwSCMDs4vku9FFe
         2lZlP90ClmSmHX1rwT0TBr2szpI5dQTdjqUYRrayKcnyJZI6bRUMtpjXNplzyf/+HYr3
         X9YA==
X-Forwarded-Encrypted: i=1; AL+hErFtonvFidV1vL0iNKPjaQRqU0XFlSIBR3weRSSkp3zQUsE5VBCgISNIhfoGh3oUBauePLJAQhfdnvxWSpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HoblzDqPWX7217skywlpxPFSatrkfeD+Om93l2cyrhZaWmwSD
	nDj8R0JJ1Oycr3DebBiYGAsW67rZIEZCsBWRibWxTdIBNCwAn/RIBAEt
X-Gm-Gg: AZFdTZex17ojDv3TE83WOodabjkdwKrXUXzJemMOWY9fahR1/KX3HD2bVnSYlMoM38a
	tRBi7IUJBEo6J0OYXS6RyFa1jm+ntpqnCGxaubwqwQNU4h9HiALlomathe9MtQcW/UiNGxNEDaU
	aiyN2qpLuZNmFX2ym+rQzsCJ7u1666kUgNcGoeiLJlIu0JshvGe7cVV7exXWS1JeehyQP488Mbf
	LcbpjCZYKbRaoZZpjq2X/Rb3ySRfbWFm/opdXMVbmGN8V2rVlqaBmvSIPPAKQqFa/Ak5i8akYlR
	LEbW1M4ZFGa+mHWqRuSyrVKGaI0ZP5Dn06TUHJEv9IkIGewjYgRMFSPg2EJFZXzTltJsF+YXH/k
	eYuHZ5ATgF7RoPsQ0ptCLEes3GTUhVaV62BoqdUdBUOoZdzWEf/qv13U5ieXdBpvM+XbGOK8Plv
	rtBkv83Be8+UKFfBj3x/obTAwUlTM5mfqFdUCHCwLgJ7kopLlqjsUVG1WdkH1QXKBIY+OzktYOJ
	YGdPka5EuJ3f3LmH7EMlKIa/fZ8CdLo8A3S2SohGIL3LtsO7GiLWBV/0T5MsMWeZ/dAN8TUzVQX
	5wGt+hCjagwG60wNkQc6evg1ybFNdMNOI4oaIVPjjqDKrhhCy4K6+2A=
X-Received: by 2002:a05:693c:2113:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3827aed1f65mr225022eec.0.1794936144774;
        Tue, 17 Nov 2026 09:22:24 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm45963480eec.9.2026.11.17.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:22:24 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] mm/damon/tests/core-kunit: add test for damon_call() on obsolete ctx
Date: Tue, 17 Nov 2026 22:52:19 +0530
Message-Id: <20261117172219.26725-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

A newly allocated damon_ctx has call_controls_obsolete set, meaning no
kdamond is available to handle call requests.  damon_call() should
return -ECANCELED in that case instead of queueing the request and
waiting forever.  Add a kunit test for that.

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 mm/damon/tests/core-kunit.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 43e2f950f8ff..13315291f69f 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -2481,6 +2481,24 @@ static void damon_test_last_region_quota_reset(struct kunit *test)
 	damon_free_target(t);
 }
 
+static void damon_test_call_controls_obsolete(struct kunit *test)
+{
+	struct damon_ctx *ctx;
+	struct damon_call_control control = {};
+	int ret;
+
+	ctx = damon_new_ctx();
+
+	if (!ctx)
+		kunit_skip(test, "ctx alloc fail");
+
+	ret = damon_call(ctx, &control);
+
+	KUNIT_EXPECT_EQ(test, ret, -ECANCELED);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -2525,6 +2543,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_rand),
 	KUNIT_CASE(damos_test_esz_goal_temporal),
 	KUNIT_CASE(damon_test_last_region_quota_reset),
+	KUNIT_CASE(damon_test_call_controls_obsolete),
 	{},
 };
 

base-commit: 72e1cd73734bc4d52affbf7896389bf3814bcf9d
-- 
2.34.1


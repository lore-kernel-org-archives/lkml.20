Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826573;
	b=I1fdSNyNyz0iJGT07ebJvcuYTk/M6+7aCrQBPXzTcV2TE21MDeXo/riRceju3ik3fkWQ
	 9OKc8F4aFH1U2aQKBBMtvtAhNqUrmngQXZw4hgqAB+YRMmkHqZgxl1dEpcN3KwxQkVlo6
	 FTke/Gidv3lvyq6yOTCLs39PVxSJSfg/T4TOMYteQrAKVQ92ZE3Fx/R2J47Bwu/zV65r7
	 ZB1Id5R5/LpPlI02oBD1kXGhjEtHswJrAqJ2YVjzW5HamrhLP4iAeLgfQ5xKrqIXNDvA2
	 kbuwWx3zylaf40L4+ho3QrDz12gfhddLmYrIQ/kP+Q+Gf2ojPSCiwVwQUKppuWDWS7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
	b=QUt7oYnzp+hqTiy7kANzQydCIMv10TvHNNX94qAmFNRjauDvJ7E7TcDl+eBZQ39fT2Y7
	 KEd5f8cAhH7UkbHCST7vsULdTAgIRRJ6yQpLhHU91Q6zrVjksLN6hge6nygRn7S0eV88n
	 TrXD6W8zbHColcJTr1M9X1moOcFHXqVyh6YzBCJKuRGt24M2d/4Cu4vYuma1IutgTJ6dM
	 vB4I7o0/wJ4pzPuSuhQGkdHezA681KJ6rflVwJ6g3BIgsayGXPbbSfWjTMTy2QN10j88B
	 Yl7OOUCW9iBTzUeU47puqr9e8U1Ol4moF+3EZ3fL9IHXslprYZnCltPqXHH0CKdIlBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNleuUFv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45C607E916
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD45C607E916
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNleuUFv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so9651945e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826571; x=1794431371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
        b=yNleuUFvXKHQO5Qgbw//ExknATpNsOSVaC3K/xU3oDknAycNLKqEzInKcKsAtr5EPf
         Qy8MqurLXPEku7zhwKGhHi4YCR163qp3/bmpBefEtKKjbDV8x5iwk319b27zPIsZ8BQC
         GQCzghEJHgG2piORnYWKLx8CwtHDbKmbwrRs3TtMEu443e9gggfO78/v2w4vdRQZAC1o
         0hGj3M1pnqz78vq/OKDi632mKvpzbuxRPbH5pe2SbA3h6whxFEhwwGwztbxcCWvFzgx7
         6K3aCYxbxH2qvQDVbouruIm7cCVVkB/GHlsvxSHaoXZM2hYIOpO55EQe8GAh6Vq7cPOo
         4JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826571; x=1794431371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
        b=c494FoK3DGQtAtFxAYKsMQmADfIrznfgZC7pwECXR5bZC9FbqwG46FaGvMuIFVzlZs
         q7Aqzdg6RHfw2rLG7iD8KzPU2r/c5FEZqaxSYPMB7tdkjy74HbCielmve1w3RkAWa3JT
         RKp0aDIzyoPFZ3TFZA6spd3t/1yATGEn36yD0Xs9QrPrAHA31/8KNa6OzsG8ksDcXn23
         4STovcjXMKclBJ7+lGcC7M96jYY+krJhIz3jIkKeSMNlVCGipAVda4LPNPXixIgf7NH8
         T9Len7lBG5Zuwk48G+85MVL+D5JpA8fDptqyE+nNy/inIrtCrLxd85NDrHGvflspEw8W
         A0bw==
X-Forwarded-Encrypted: i=1; AKwUvBzjB5hzug345E2nzjdhj587N6DYhmUpTnIv8ace/+gxyIaVN8qfHfueCHm+4cp7PZHKcIdf+NcsZ5QTzLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vv5pimgtDkyMsQxwrMgsZaK0FqNSfXv7qSe9vFxv5UkGvUFwx
	BuAl4ucpEc9z5f6vBLs/xKM8rCfrWjV2e6NtDj14asfuemou8Xw0va2P
X-Gm-Gg: AYBFou0cVejKt9992MkD01u5TAjQ8Ii/DB4fX1YrCrv2v/KXwrX8TWhVhw+N9FuiU5G
	60KLyCYS7E64h6eAOwJlACMADpxUY6bjCzUlZg0KmQxodcoNTk/P91fQgeMbyi619bLT3aG4+fq
	dWKnbrzzfm0Z1Sbbu7iNOv2eHlJ7RDnvTjCm9P8ME1pKuV+2AapxSJ0oAfbalQHN67KGxnf95nK
	V0/Vbdl/8RBsFSljrGuYhtuGbhvRg6xv5pBQRYuSSGYMd5YmO+np0702rrxkKBVszy0LNt638kA
	c4MO5D5VOqCqhV//COxohTuk+sRwjRMl8iXGMO1sAeMYp6HyhE1N39RUEvH5itpBKLbvBg4q2SK
	uaANdFbXDIQ5PZQOt2ZrbeXAdz5mqcN3VN8epq5xeLmO3uQUZtRFFgRLOTY3bi4qTpXhuhbHiEB
	GOKb8W894BLIs71WM8KQsKMeou1jcG9Bu0i0u9ur7utHbLig2S7kydZ6SeEAJq59dgBV5Uzwdru
	2Sfnq2E8eQwjuPmipfqHwm7EOqCrAOEq/dU4EI2IbXstbM8wEgHkLmgXAyOW+CFrGXBzouxtCXG
	OvAQXe+wWzh4K9kTYrwU0D6lqPJWDpj+1Hg6F0fSB5X1OIWhW6+Lcg==
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr390832275e9.3.1793826571178;
        Wed, 04 Nov 2026 13:09:31 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm5654419f8f.10.2026.11.04.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:21 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:02 +0100
Subject: [PATCH v2 16/27] selftests/landlock: Check errno for combined
 VERSION and ERRATA flags
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-16-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The errata test checks that combining LANDLOCK_CREATE_RULESET_VERSION
and LANDLOCK_CREATE_RULESET_ERRATA fails, but not the resulting errno,
unlike the other checks in this test.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index a6d355807dab..9a1d5b8aacb8 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -136,6 +136,8 @@ TEST(errata)
 			      NULL, 0,
 			      LANDLOCK_CREATE_RULESET_VERSION |
 				      LANDLOCK_CREATE_RULESET_ERRATA));
+	ASSERT_EQ(EINVAL, errno);
+
 	ASSERT_EQ(-1, landlock_create_ruleset(NULL, 0,
 					      LANDLOCK_CREATE_RULESET_ERRATA |
 						      1 << 31));

-- 
2.56.0


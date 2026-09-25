Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669D3B38BC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355446; cv=none; b=lGZjLrp4ZRoPvKodLB8H8Ozy7vHqg3du99rQXFdGrpkO0E1IWRCLiioDyvhjN3TNvgNHBOIAqirRQZC6gppvLmTfg3nuthuf1l9cmDq0yFf6FO4KVz8lVfuqr2tQuFpA8BrTWuuSw7pl7IwMBaNQ0ZsXDdkyXTxPl0n/M6X9nTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355446; c=relaxed/simple;
	bh=bnR6oveAJAqKO07GD5pI21LiZ7qQfCjA4aDACb15Zvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNo37HhNG3YCP1gZxxyWnt9k+MKtj6fohl/HU5HoYX5bfEcgrVAqQwJmQoqb1lwZ+9B2aJczeIVGJZRItpLiZw7XzQTc/EOWkiv7LQ/bagWBlZL+PDbg/etETI8VtCGPMWB4GytaPwCgoHq31h+4jEAsAqD1DyEd8VTPCzUC90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4iSbiwP; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4iSbiwP"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso69292f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355437; x=1790960237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8+c8IwhstQAab6428QQht/BXHi81y8rJ08Qk2bhaG8=;
        b=D4iSbiwPHB62xbGM/xv2tvc5+r0rvtS8b8UCvDL/dlxZdgo9EFM7ghIqoyXXr+wUXn
         ODBgvO7qL6ju9CMPG1Fl256/05MOw3eHKbdnqCimLEe0hzQPC36aVHwVuNskKBklKme2
         KyRrxKFBGGw3u0DdSI0XRxzdSNqXcavd3JPV9wftqPJVapu0lJHqlkdTTi0TDDwmEd0K
         jxEkr0NpUBu6wjdcQlXJjlwyGmB1qt2aR4+Au7cMHTv2wfI5Qo4foTKdB1zNncicvELL
         mIdyROgHaGFkNHdXUxG0hA3fw24cmqHSQucczAQOtukxx7jDuquGNJr/TQo+TYYJ/p4z
         0h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355437; x=1790960237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8+c8IwhstQAab6428QQht/BXHi81y8rJ08Qk2bhaG8=;
        b=UCh0Gz3eTrIeHCAOmN/OBRZ4PZsTH/F0qSm+EhSAY0M5fjCjoqDeP2B+5xYapaoEnj
         4BU+YILfwotTNlW44dikqYoSDsD5BJnJfI0nlTQhRUPGklbB8JAbo+mwAVV3MhIEv5kR
         2sooq7YSBg5NJOc/FMoZlGNg2xUDvIv3XK9D1ZodH5tT6MzmWLeXzzKFO4tKcELaf+nH
         WztUMIWq3ycuZg/jpiKYxdJh/8Onw5XuYZM3ip3KpDUFsCeYu0jNTN3sURzKv7zy2Byo
         hSAjGNQyMEEAC4t/jGGJefdJyGwzmQBsapi2bobjkFQr0N0wsJUcf+SKgL8VaDnG0oXk
         doew==
X-Forwarded-Encrypted: i=1; AKwUvBxLLOwKKScq/SQTAri2ZVThB+QEVRJEhY0fc5mCP199dKCxkHtJ0rl+Tg+mvCmiTE8j1gm1h2eVckXJor0=@vger.kernel.org
X-Gm-Message-State: AFuF++noF0G3fbxR8aczCSur2uak8oQzoRLD2TJwTimEgUcm6D1Ak1p6
	CTV1JitekFZfGOLueJyNoVyTnnmw3OrGA3ZP+xqBRCLu91JXZ5MhWyTT
X-Gm-Gg: AYBFou1R6GCNtuzzBhFCnfjxFUPZQjSmkPeqVj4M3s6faXoYQzjYSZdmfKvQevw89+7
	pg4lQ2xher9bwJsofZn9bmFgDGX5cfcgjNY9VABHeUIgWuv0ql4psSjdgTkA4i/a0JlClKbWqom
	CtxM01eUvFXnTgDqudV/ERPyrWzEbulqwtwYGKvk6cjJ+fPQZbDFwUnw8qF1pdNl8QXmh9zcrzT
	BOWuDXdA366pMgoy0zrOS1HQi/VlB0fjP0oShZYY2Dkae0cLT1oGQr8+xxmzDUDBur61U7koP47
	NcKRZSxbLAV3ltbN73Q46dEhRxmsKikpCGaW/cmmvL8plpsFD5GL9MHrdkMPW8nz64TfdokypLl
	Ulbm1Mgt2dmNe6rbWZdaLZ4YyhFlz/gZ6L6BbXeLab4tBZIoey+pDP+qSep1imupjCAYdYEFZhS
	JziKlkcERT84ubwX/iMTcZe1q0BVzgzpEn+LqtEKvVYKNB5Lmsu4+V2U9HKZp4XO0dNTFCAMoSm
	9nk9uGVCOj8hViY0rhlmAn44e854jKPCtmi8yywfdz9nn/hrNdttgBke0vwClpGimh73lQ5SvJo
	GevMz/sIPb6bzwsuHt/t2OtQefFkaPNbN1KjiRvNzzvz7I6fuE0GknpUL+pFz6azMdZjpLLaftX
	NwnMPW5Y9+2UqrtHp
X-Received: by 2002:a05:600d:8653:10b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-49fe70151ebmr83676225e9.9.1790355436835;
        Fri, 25 Sep 2026 09:57:16 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm8020363f8f.21.2026.09.25.09.57.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 09:57:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] time/kunit: Add time64_to_tm() case beyond 32-bit day count
Date: Fri, 25 Sep 2026 18:57:02 +0200
Message-Id: <20260925165702.51677-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925165702.51677-1-kmehltretter@gmail.com>
References: <20260925165702.51677-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing date range test covers +/-80,000 years around the epoch,
far below the day count at which a 32-bit long wraps (2^31 days,
roughly 5.88 million years).

Add a case at exactly 2^31 days after the epoch. Without the preceding
fix a 32-bit kernel returns tm_year=-5879541 and wrong month, day,
day-of-year and weekday; with it the result matches 64-bit kernels.

Assisted-by: LLM
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/time/time_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index 1b99180da288..8b718767b3ba 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kunit *test)
 	}
 }
 
+static void time64_to_tm_test_wide_day_count(struct kunit *test)
+{
+	/* 2^31 days: the first count that does not fit in a 32-bit long. */
+	time64_t timestamp = (1LL << 31) * 86400;
+	struct tm result;
+
+	time64_to_tm(timestamp, 0, &result);
+
+	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
+	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
+	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
+	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
+	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
+}
+
 static struct kunit_case time_test_cases[] = {
 	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
+	KUNIT_CASE(time64_to_tm_test_wide_day_count),
 	{}
 };
 
-- 
2.39.5 (Apple Git-154)


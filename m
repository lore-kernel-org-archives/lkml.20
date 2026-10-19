Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423271;
	b=YMuQWr1YqLQQWFbOH5ogghQnkPzxxGmNfOHSl1Xb0h+YObbSAbNIUCey91BUtEOVrI4V
	 fbQ2GMX4ZJgp5KL0pug2GFcxWt8d+lhy+Lr8vjlY/B+rfYCWDcGZxfPuVpiKnmL5drbTk
	 dpaqH2Btf6SUBOmAVxXaGRAcIR1Z6ZKDmae614r6J6IJPwkHrl5YvTnSM7zENIt5V2qNw
	 FumTBJSXCidrkhfGLvz6HFPtzSW3Z98Q60cVU6VyDNskl7VybM73czh0Q+WFFO/uUlam2
	 igsCNDvm6qRfUL6IO6bC7ipc6ejvTD8//SzJDsAUB8jfJc5hshVdgDFzsa5vMqdWw4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
	b=x9zHB3TuDgPswtCpoJtyXoEG3uvK4rM2WAjysw4gzUu3bbKqH+wJ8LWBhslInZQSeC6Q
	 QqW4pVol6D56TZ56U7ObGQwa/edAKSKzfmzNwAgAcFRYZgJPD5rtI+kokwJ7n6t+PZY2L
	 yOiR5CsZvz/Wm58PrZ/GGvDGYaZnuhMkcXQ3NIlUmec0Ib/4wPWzwxoY5psHupC+eHjwk
	 ZxFR/ZO3JJ2bkmOe/P+ZmyKOXhtn+ROIed7twstSjX8ckQEicYzYidqAAgMUxfk29t6aM
	 v1DRK63z0nyvW62lm8mHLiJ2J25Cz09DfUI7AlHx+W833v3PeqJ6JUazFc0RYYKdvLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="RLHu+X/Z";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39160A7E77
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B39160A7E77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RLHu+X/Z
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e985106c0cso14990485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423270; x=1793028070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
        b=RLHu+X/ZCgfkGNAcpJZzmVb+NpRYJOKO905A5pUHlK/KmK96DG3K0O6Ciu65WDhi0h
         0HIUnI9Yq6Q2BZmh1Upu9kkyS3/Ds/m6PLJSuHyroGhFOFnLfUsCRSMJBZYR0SFALkGw
         IrxfV1LMUCqXSkE3YhB16pw61uIKY3bRE9N/yF8OZAQA1hSdZy4py2sHkw9Fy+LLBGYr
         TRxcE1HO8MgQNFjQ+BqHKxe3Kn5ANB88EmfT09SEcrNpJEkN5d/I1rYF0OloKr7g/a2K
         QuXNq9jvX+AsCPhx5SBmjIFR0gwINIIo3eTob5Ff5ap/JFNWTqANrFwdPtT9AZ2o5caQ
         h5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423270; x=1793028070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
        b=bH5KrhYWBOcLPWqUCefFMsKAMvvHPgO7UnNChoBbiz5xaWdqczwf7baCZiljO0przv
         U2Y6WjYXCua2m8us9aGQ31yonzwDiEbRZo2eEnNiwWN6JRYKTGrWYdsL6wkHXn3c+q00
         QqUnAMfsZ20vyPaz43x+H2vBTMk0jQLqEKWS/65sySgNso1PJ9Z8DCQo6qLiD2Ib5gDt
         SYTt/SVXOUWX5BmO71mW3QiERnO9snoGtXpv6FwDWqY1sTDYS9iDsbc+XUw4vZG6d4vj
         usVBUdg6ZvBD/zS2+QoeP2BLJtWCXu3xL5iDaywrcaGO9OiE0ekxT+Dp8GrO2WC2OAMs
         KEpA==
X-Forwarded-Encrypted: i=1; AKwUvBwcqSoM1NMf2bGRNtSsl31PUkjDqUeVbKP5HRSrENg3/6j7rhmGXQtoY/E979D/NeHmYXxK5fyFG7BIk6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYITfeKJERnLr8790lsu4cth0MN3Pw2AYUtTkQDGt+OW3pwKFZ1u
	os+LfPJmrRM6Pt4b98iMLnVmHF2p1BUPiluA56J3abCvirFXVzRAM6d0
X-Gm-Gg: AYBFou2z0EQqB4zHolTDCeGzwfkMGQ5DFQcvi9FArwDP/sSPzGyqhNU8UkfngGMSAtL
	Zc6XAok6H3jvdHhAfPkCZy0TTP6fPuQ8tzvKRXKmuK3NUOBhDC3wDiORWBaZTty0QiYG46eO5N2
	sMAfBGG3u3LtHdaHFsjE0YxNia566CqNumgTFy0YEBlB6cHc1UKv7cqDiuKYPumixrKf71VzN5g
	1923BHnaR+BksY0FpeMyxHAdnpjxs83pYzvw/Qe9K7S78HtrZo4UeOI5e8ZW1w/lGVWeyAYPYG7
	e8Cj8SeGBUtFa3JQ1FuSLlbakM8w2ycpwOiGHxqxZiN8ESTS9GuLyMAEpfGEBI07kGN9wuYgiY2
	b1y+KNBwTncM6i78YHcXlvfcCtjSQKYmP3/lpsv6kvrayZF+LZp5Ek+vHRobstoPhuJL+6PYEKV
	KG+RRskQO+ypFEZirFF+ZCo2A1w0BpkB9qjCVruuKehv37qnKCQNDjI1u963etsWtqqduPWSN3O
	sYz5Q7vaVLQtMXj7QHYI66/SsUt0kmFz0NadL8k
X-Received: by 2002:a17:902:f607:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2e9a6846dd7mr72903765ad.8.1792423269844;
        Mon, 19 Oct 2026 08:21:09 -0700 (PDT)
Received: from localhost.localdomain ([122.43.72.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm2798115ad.46.2026.10.19.08.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:21:09 -0700 (PDT)
From: Junyeong Lee <jylee5498@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	greg@kroah.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/waitid: prevent cancel reference wrap
Date: Tue, 20 Oct 2026 00:21:00 +0900
Message-ID: <20261019152100.63565-1-jylee5498@gmail.com>
X-Mailer: git-send-email 2.54.0
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

io_waitid packs the cancellation state into bit 31 of ->refs and
uses bits 30:0 as a 31-bit reference counter:

  #define IO_WAITID_CANCEL_FLAG BIT(31)
  #define IO_WAITID_REF_MASK    GENMASK(30, 0)

__io_waitid_cancel() marks a request canceled, then increments the low
bits of ->refs to claim completion ownership. When another path owns the
request, the increment remains even though cancellation returns false.
The request remains discoverable by cancellation, so repeated failed
attempts can wrap the 31-bit reference field to zero. A later cancellation
can claim ownership and complete the request a second time.

Use atomic_fetch_or() when setting the cancel flag and inspect the old flag
value. The first cancel attempt continues to the existing ownership
increment, preserving its wake and issuer handoff semantics. Later attempts
see the cancel flag and return without incrementing the reference field.

This makes repeated failed cancellation attempts idempotent while leaving
the first-cancel state transitions unchanged.

Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Junyeong Lee <jylee5498@gmail.com>
---
 io_uring/waitid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 2b756017423f..9ad8eadc5b8f 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -154,9 +154,12 @@ static bool __io_waitid_cancel(struct io_kiocb *req, bool copy_si)
 
 	/*
 	 * Mark us canceled regardless of ownership. This will prevent a
-	 * potential retry from a spurious wakeup.
+	 * potential retry from a spurious wakeup. Only the first cancel
+	 * attempt should take a reference for the ownership handoff.
 	 */
-	atomic_or(IO_WAITID_CANCEL_FLAG, &iw->refs);
+	if (atomic_fetch_or(IO_WAITID_CANCEL_FLAG, &iw->refs) &
+	    IO_WAITID_CANCEL_FLAG)
+		return false;
 
 	/* claim ownership */
 	if (atomic_fetch_inc(&iw->refs) & IO_WAITID_REF_MASK)
-- 
2.54.0 (Apple Git-157)


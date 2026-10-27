Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121455;
	b=oLtXv5aTDHYxJ1fLCgsiIJF2mAgswt1vq0jdqyKSqZvyYv3wxT1DpMyrxvio8wgz3OAG
	 2BqKKosqVblN+YndsLaoRBaO3q0/s/KHDH7ANj/uHG2NvXOP/lMVsG4DV8kuQjEH64fyZ
	 9xxjTi0qjBE/SsFCP2ZZWjDF/XE3VW46BG635NhvGzlZFGYd0H/o3xlUmvx1hq5jMZA8e
	 mxMF5nFTqhCwXi7/gxJ3c4MWbDiPJJ/lGEKhQDZDLLGWqzTInh6Q8mqztWHxlgWsOxuS1
	 dCEPv+tGjUM5VNuZKBeKMiod379zEOZBvQjrP1MfvjLqETFiztX/IBR4yKT4p3zaCww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uikZsMnz/NyOMgTmLiqZoj1Ur6F2M6OswVzpjhz9zcE=;
	b=LI1LD+kMnJFzJ6XgW+PhO0gFuhywMknijpiE6vSKmiwOwBkEIuMRnkdNHd7bstyvN+GB
	 jJPjHEflKAi+MnbyjqYToiQ634bnN+XgKOCLTNoaMZEX69rrybppJsdxtgMA0/hxH/Q1H
	 SP5l+bo9H653jaJLEw/Z9Rsvh3EswDLgbeqVJPPLdTrJWgJ3glmoBUf/tWhRpwFYBIeJM
	 eVmnYtagbgpeWvpbaiwZWByoLEaF9Liu9yEmP6lagtrNQF0dWJQT6yw+OK/YoORnLDYuV
	 QRWUyWvhqo99pHogOkryoRvVmHwjFLNibsRSc6t+9odkFLETHqUBZSkO7aam0AgxVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRmAjFG+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 483EF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRmAjFG+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso541445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121453; x=1793726253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uikZsMnz/NyOMgTmLiqZoj1Ur6F2M6OswVzpjhz9zcE=;
        b=xRmAjFG+bILbgyfefWrvhgWMZgcumqS35Pk34iwPunQgRuY4BuW8Yml86p+O0sVgWD
         4IBCFWmrDYhnmj0wmiOZFQTuS5Hc/GPwaBHK3PeG/O5AyUW7EOAhjztGcKxKnoUWxb8d
         6/muSzVTrIOXGyVEh7PzXGnV5ho6+FYjsfh1s3nMQ+NlLibwaT4+ac0zYKL6M1wcbWIF
         kIQeIaEyrNZcMPNl3WNCcmb5jenTRWYKVXeCER++kcSB6Tuhe8LrjP+mZAlOP7cg04fM
         8uoU6YoOs1CqwRM+a/yMjv+6t1wVjmSi1auUQDoAeJ81712QGwvXGKY5TgKNthpEJz4P
         Odag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121453; x=1793726253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uikZsMnz/NyOMgTmLiqZoj1Ur6F2M6OswVzpjhz9zcE=;
        b=ksxIQCzwICxZ0gVm8EYazIFhg/TIZxHl3BPLTKdp1DsvfpZweKXRVA7T5vdIqxOs1K
         asVMgpmOVa7EVMj94R7oYCxWIVjgSQ2beK6u+fSsqAuYkjBWERND30lzB/EfYqlneixI
         vfgH2vaVpcXOXJ8NZe/PkDk0m+zB++XwbKtHbijN6y/pi6ad0KVBfOJ3panlmmMbGUYx
         TjvHYOhxvxvEcraVqAM2viV3Kmy83C+phVUoqaO/s0HVkK7rKANXdCVV8Xj2WNQorYhp
         3xL5vEdq3sts3qixFIHhQqb9bCMZyyrITQnjhSQ/mPgE/2lGE0Koq2s78s8G6Svua+Du
         GdLw==
X-Forwarded-Encrypted: i=1; AKwUvBxSgHlkEiS2+/h3OH7vV8EDPGPRGgS+Qu4zQnsqU0hxqAeBE17uih85HSj6RGhAvmEavyPSjGkTREdoQjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLaDWibcz8S2p7VZqWxxfphUZ6/omq4LmYme/ziNikuZo+SIKL
	pOdNjLJM5eZ2AklfkJzucdjhnShJyl6mRmwQepPUTFZvlkWYPFVM1ZMN
X-Gm-Gg: AYBFou3Xj9tl7htGyX/CbHg1jrkywgbJaHDfWjLoFLVBuYWHmLkkpJRyhbZr57fpxbY
	t580ET1dt2znza0fq6wx9ICDgi79Txua4yUwYeb8IrjpbJeqZZ+1LBKP5IVK9tl5TjbkvFzCRyn
	9an8Ta3Yg1xJgxttMME4t/DU5+09v0AtpfAcvdOMmQDY3S3JyhaNIYiuS/0aORwiRXgRlggS2wh
	fF7+3kvYTEEi2gL6BpRUTH1Q/UUDqZDd/aOYrpaxUPHOSJdhl7VVf1yCnPtkFJ5UPMQ2MC+ysqb
	IV8ENLDf9WhKNlG4cGSfxgvMLyGgMkLo32hQucrKsXpByodE/tIIr2aU4EKjGWqXIaZF61sjH2j
	QRD47oCtc60iNnsW95YAB57+Ho1aWQbcsp4rlYr1Z3a2FgXdgH4ajQTW6/PWzS9+1tGr/UP51k9
	EHUYdJw03SjlTVciqEsFjLvFZ0qx06YOGzXmWEI/k7015Aic3171xyO/MkHdftrdWog2wj+qNho
	j1qVwV5JXQwh0OXBzgvIRDtI2tKTCcKh9QFejt8j4DZSvXEtsrE8DzaV9p6BzlEjZ89Hc4+0NUn
	W5Mvmr+tgvsFGpv08w==
X-Received: by 2002:a05:600c:3f06:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a35ac99b9dmr190327005e9.5.1793121453233;
        Tue, 27 Oct 2026 10:17:33 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:7887:1744:66c7:cbb9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930c5b6b5sm3015175e9.12.2026.10.27.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:17:32 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jonathan Derrick <jonathan.derrick@linux.dev>,
	Jens Axboe <axboe@kernel.dk>
Cc: Rafael Antognolli <Rafael.Antognolli@intel.com>,
	Scott Bauer <scott.bauer@intel.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] block: sed-opal: reject invalid method status tokens
Date: Tue, 27 Oct 2026 19:17:30 +0200
Message-ID: <20261027171729.331186-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

response_status() uses response_get_u64() to read the method
status. The helper returns zero for an invalid type or unsupported
atom width, so malformed responses can be reported as successful.
Values such as 256 also become zero when truncated to u8.

Validate the status token before returning its value. Report
DTAERROR_NO_METHOD_STATUS for invalid tokens while preserving valid
status values and the end-session special case.

Fixes: 455a7b238cd6 ("block: Add Sed-opal library")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 block/sed-opal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 79b290d9458a9..1eb68ce33647b 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -1167,7 +1167,14 @@ static u8 response_status(const struct parsed_resp *resp)
 	if (!response_token_matches(tok, OPAL_ENDLIST))
 		return DTAERROR_NO_METHOD_STATUS;
 
-	return response_get_u64(resp, resp->num - 4);
+	tok = response_get_token(resp, resp->num - 4);
+	if (IS_ERR(tok) || tok->type != OPAL_DTA_TOKENID_UINT ||
+	    (tok->width != OPAL_WIDTH_TINY &&
+	     tok->width != OPAL_WIDTH_SHORT) ||
+	    tok->stored.u > U8_MAX)
+		return DTAERROR_NO_METHOD_STATUS;
+
+	return tok->stored.u;
 }
 
 /* Parses and checks for errors */

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0


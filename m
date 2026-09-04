Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AB46D2BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518315; cv=none; b=rHIFzu9KdJ0qrVpJy7z2tJaZvJNaoPi1CF5xH7QMsiIFNoVreGyTg+H6VsWvMEXdk4WzGXoE+cCCXtKv9oFwqR3hTBVZQknZ4bcz+jx9UrkKSXdYI62hqB4stGcfJfhgOW3sXOWrWzdpPhtLDQMoy+hxjCmZGhSYhuNh8jB5fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518315; c=relaxed/simple;
	bh=SdRR4fcKxcRTFw9bfWJRp5SlS6dI7EoBJe2ABZ5ulMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASboay7ZZr/zPKWEvKFfLPuswMONRqToTkrMSEyyKDhJTRjJWdfNXKnYvmkuGJF4+IQ9uGgDlSw3HEIl601i4rDBT5GPOhLX0hqoS9IBaHGBquCajLC54n/jBt27lfw4hcCZ9j+H0y95MJvqe0jCrRpinBgvwbhehFGM+TD/H38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Rj4d9A; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Rj4d9A"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-395cf2535acso937539a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518312; x=1789123112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bp/UiAEsf0pmjXU3iYT4sNFD6WOY1SWoYTBFGtvNsk=;
        b=f0Rj4d9AVG/k3pJfxMZ8A5shyFt0rYzP0fcplpGcxxwFvgU8XWU+FDKvGCR+ZpsvjV
         GVzZriWdwnXkRr/oRDjXElamex0nPkYhJOy4q7iGtkLgwfhO44I5CM9nLAFpsXRNLWhL
         UCEWRizgCR18LdV8eArVKmfojPcQO+9IgeUngtBjvouMP3Z+l/7ORy8fU8szWKiWFa5j
         x9n9xE2si3BHSEnXsZTlVl9QXNnfZM22am/DAPaifsO2bbFAwpVqcT3N8coC+VO/bb2c
         99yJ4J7mU6ZMqgZWwEhQyQ++7IHZkzL4iGn9p+MIzYjAP/NpWNkpmz1xVH+Zz2T8djkb
         5Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518312; x=1789123112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bp/UiAEsf0pmjXU3iYT4sNFD6WOY1SWoYTBFGtvNsk=;
        b=mEHRSjRUm69WyMdPHjwgLnCzmRqhecUUJh7eM2MjiV3qs7ZmmJ8bmkT+h02+C5Vdpa
         0fVapjCxh+hY0u1v/aKRH610W0fqEy9WyAo0USNfQjxPleE29Z7a+3SkXfG8eT7oOzXc
         gys/mdzKtnfCX2SmoFRTD8Lmdp0JTZfKBQfqKvR95pYIX7VaXB37tQ1M+NH8DH1Yo68k
         2kEjwrXUUStnhNRi8m6nf7zx73rvVklPraWb+2h+AUmeQzrkr+TUIYVpt0mwMtmO5Mw7
         jAFWEYY7ifkLR5X1TgKeQh9ratrK+t6XNuuP/arvJfaSHnrXObB5YGorC5QLU0cfXPTW
         tptw==
X-Gm-Message-State: AFuF++lm68H5GqL+cFqgTwcESHnS1PUNkpRHxGHMo/ezJwMnZWW9jerY
	GbdMcfSQRlPLYg4k6i2YdTEoVTEkb0Kc3iJRwhkcW8rtWnBrueESGWqp
X-Gm-Gg: AYBFou1HeUIdyXhgFVO2Q9XmqzSUW5s3DSL7010aJ9P1z09mN6AWQl+RszH/ep1bHQE
	qr3/RU/miaOrAjbP7jVsp4ui3Dzq2+eLKVljcPmiZKkHFJFYpMTbd/uUYj3Ytmn1EMHBRtvofFZ
	mZyWsquKxY+hgK1CbJBslt8zhbHfk1uL3eT3oW0TuNwK5ntYkxRkaHR8j9eBCpEURnaB36JYYUe
	BJN1qgRejBED80olzEFyEKvvHVXqV5CM3TEG8reoRVTGIaYoJNUBpiBvUYSYCcf3FWdoROyuemy
	z6Ac657AiAE0MJUcWnH0z/wlM54DPMPaeSossmALyYxQTtWfGeBRSMAGOO25skpx25SsrKHjHiD
	BiXQS8NpHee94PSYiJeN7HY3DdFrNZOvecBoMY6D/NTXOP1IyOF7Jv0qMitxoZsFt2NGchb3PT/
	7pGALk4t5FdDuYvGTo8R4TzY+G+0CHslWwi5kojtxNDkTlHqnTJ8f3w1yGReHdmy4nQbyAVQ3PZ
	M1hbuXJR4VGM7uVOuYFndAkxpA=
X-Received: by 2002:a17:90a:7784:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39b2b1f52c4mr2665889a91.26.1788518312101;
        Fri, 04 Sep 2026 03:38:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6021835eec.12.2026.09.04.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:38:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/2] iomap: fix typo "metdata" in comment
Date: Fri,  4 Sep 2026 16:08:22 +0530
Message-ID: <20260904103825.8752-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904103825.8752-1-hemanth.selam@gmail.com>
References: <20260904103825.8752-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "metdata" to "metadata", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/iomap/direct-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 8b4039d16ce8..b70f86292049 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -505,7 +505,7 @@ static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
 		 * We can only do inline completion for pure overwrites that
 		 * don't require additional I/O at completion time.
 		 *
-		 * This rules out writes that need zeroing or metdata updates to
+		 * This rules out writes that need zeroing or metadata updates to
 		 * convert unwritten or shared extents.
 		 *
 		 * Writes that extend i_size are also not supported, but this is
-- 
2.48.1


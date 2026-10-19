Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429934;
	b=dt/0g9Y4+G+SgP2n/PFk0168hgVs51md708r2I+H1tmlqwQWg3QfCqITcs9E2p9UjLCr
	 fIOnEfYpdge39c95tN8GjaJ+uzjPEP16OlP81ghTJOtWK8oul2r1R7oRlUAt0HCr85ySU
	 sTFLVJshiJf/kwkz/Bo5j3FXd/MF2245AlfICDG7+P28pDjKnCN30uwh5/kdo/IJZwyaW
	 5Ml8A9ROALp5ce1LsBIdbdA44qQ4pIIFYE6oFncfFIVezajApTWzRGhxf7WUSrGwTGWKX
	 SJUC7Tc3MUkcJVqAatgLwjB3scnXy3vWYsjgx6MfJmQNmd3HBJ8wLLz3svg51RfvkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
	b=fV8Q5wzmjl7qIKCNJ1We6/+KzO6eHiP5iSNxCdEouFL4a8dOWprPhnQNxjVQJRhCiiSw
	 UwDTv9/7Bp7fWj0lq5WzYWlIOfxuvUVyfyUCuBAAJnhHnhqVXfu6UWuYTwWv6IPdxE011
	 yx6zrWvHoPFOijOKYTOxULjoINbNDW0Ly2g4IOtnCgYtDC+vG+ShrJmPQmjB5NGG/U4n+
	 PghOxlPCk9D4Y0IB7VbYWJvjX+HmOsYbfGnGqCxraWtctA5iiZSCk66jRdf63TIPmUSL7
	 Xd1Hq6UmJpW8Jmh7BpPxSVNm3tegH2vGw4xOinYeceJ1aEo3lCNkS9HE55arl2BQ02A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rs+IINv8;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A8606A335
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782A8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rs+IINv8
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91beb36fcc6so15513726d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429932; x=1793034732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
        b=Rs+IINv8Uo+hZJT3YE39Kmz26IQAlH6dRyDbzyySNky+H3Ni9TN5xhTkyRn5QcuYhP
         2vN7m9R/1Xt46k76AXo9EXqR++vmoi78dYd5cSFme9Y3nZDYVqITIWItHVyThfn1DB4b
         awwOjsoO0Kqo1XMIaO9QoOkCmFJSMOl5tTicC4HGI24n3qy501m2sYzf6im3g+bRBYEG
         hkbRlDCmn1fXcyKl9cRdQhcvupU45rHa5OUJRxpuk/J3rtvEb/0HOnO13Kg9fmTG3foG
         SUnMh1fyQHg0NkLqgf9JPmwSSmEtuRAyFAiaQnwukYFKIPjfmqQxflkagNpS1JBz4w2y
         ROlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429932; x=1793034732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSkebjJriJxD8huVKtJ/dZPvDeRsYwUsy6nc9NLY9s4=;
        b=2qbu/ySDjDYx4KMxclUPVbx5Z/5cyoaRZ7c4yuAyfhYy3obJMIuhm9Il453Rc+Emeo
         3seAaZFCLPipSgm7rWckC/NTgg65fcL6rDg+kQG6sdBWVvBwXgIi9nAaBsj4pdPYu2jc
         QW0GT2udx+BJwqOwj/QjBMXkB4F4pBWpCU5aNuKk7vLwFGT9suG+McsewHcZ+atUkXw/
         MkCJf/+ZLKH90vtcZKCBzxSGAa6dHwtTP5kzp6xH7RQVb/RTk3JgdrOpUrE97bSk1Fnx
         9glJ1+fn+5lPKp1urP/zn5bSy6gF3b7qHwUWQ2XRYWcJMIhl9mIvU0aNyMubbjNVu0Er
         sYqA==
X-Forwarded-Encrypted: i=1; AKwUvBxe0oDoqZQqGuDlFsUQ3caFY9YsLaIxWcq/v/ZImP9vSmrDkjy+B0k4XoJTg9VSxvuq8uu20rQ9UmYmmDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAdgORF65ZsL+G+zvagUlsF+TYUNcSvTpCKYXg5QUm6dgQ5nkG
	O/UH0SN7XZ5WnOsTqDvC3UR1UG+txNctgKN8gulVTDO5EmFLmVBqcOOXZp67Hj6VMtQ=
X-Gm-Gg: AYBFou2fZZtLMesK22SmCk/V5uh1NG74krQTkWlj34kdT4UJ+KqSp8Qx/JzaeQQHiSH
	iowbiFlQkJwdlmHHmMg87yUwVOtpi1qddmJDs1ZsZV2qx9B700GjZ5KvoLCtRM5nKBB5TN7M2+j
	hPRJwLFGNsh9wYkdjGPEplm9KMoTIaqbp/N2OjHmbFh2uoXzGqzWSguOuFsyCvsj0/3c0QMpQ2p
	xcr25KOzhe8//t8ugdXa1sYa4JlfQt7ZO+YZ17nWD0jGSc/HB9yFVLIRGAaiadagxXYp6Ia9zSq
	oUD4xU1l0fbkbWIewkcnuwYG7YKl0TAxtZu15dCtvnqxd6TRS/SCxIkoGnTsdnUq3qcffdd87Lb
	3DLTMgxVbyg5bmCmcCECub/Cvm4HDGda/nSaLveTk3Xd1/irVA6sxYCKlQZWNTKELSL0/tp0ZUl
	XK1QimLcojdJFfI8uVMyZm8Trk/exk2T28YEA71M9xONbBMU9ZQkajVEqqEbY+95P+kjZn6Mqu6
	vG1MvUtzUEG2/5EiQzbnWjji6p9IBOemRDLjgZ6bhw0Gl6RCLbsHbEaEmLZG/eCnpvnm2sljLEk
	DC0OhmEkJuL6ui+FkPO+nU122jD4drSYtjmT5UItlA==
X-Received: by 2002:a05:6214:dcd:b0:91b:9061:b7f7 with SMTP id 6a1803df08f44-91bdf059500mr152667696d6.20.1792429932077;
        Mon, 19 Oct 2026 10:12:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH v3 2/7] selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
Date: Mon, 19 Oct 2026 13:12:01 -0400
Message-ID: <20261019171206.3331374-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
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

madvise(2) accepts a zero-length range, rejects an unaligned start, and
reports an unmapped gap in the range with ENOMEM while still applying the
advice to the mapped pages on either side.

Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
an effect the test can observe, so only MADV_PAGEOUT is checked for
paging out both neighbors, and only if MADV_PAGEOUT can swap at all.
Both hints' ENOMEM is checked first, so it is covered without swap.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 5d451d409937..8cbbfd4c24c4 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -141,6 +141,86 @@ TEST_F(madv_cold_pageout, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* A zero-length range is accepted. */
+TEST_F(madv_cold_pageout, zero_length_is_accepted)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+
+	ASSERT_EQ(madvise(mapping, 0, MADV_COLD), 0);
+	ASSERT_EQ(madvise(mapping, 0, MADV_PAGEOUT), 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* The start of the range must be page-aligned. */
+TEST_F(madv_cold_pageout, unaligned_start_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
+/*
+ * An unmapped gap in the range makes either hint fail with ENOMEM, after
+ * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
+ * an effect on those pages that the test can observe.
+ */
+TEST_F(madv_cold_pageout, unmapped_gap_fails_after_advising)
+{
+	bool swapped = false;
+	char *mapping;
+	int retry;
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_EQ(munmap(mapping + page_size, page_size), 0);
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+
+	for (retry = 0; retry < PAGEOUT_RETRIES && !swapped; retry++) {
+		ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+		ASSERT_EQ(errno, ENOMEM);
+		swapped = pagemap_is_swapped(self->pagemap_fd, mapping) &&
+			  pagemap_is_swapped(self->pagemap_fd,
+					     mapping + 2 * page_size);
+		if (!swapped)
+			usleep(10000);
+	}
+	ASSERT_TRUE(swapped)
+		TH_LOG("MADV_PAGEOUT did not page out both sides of the gap");
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(mapping + 2 * page_size, page_size), 0);
+}
+
 /* Neither hint may fault a swapped page back in. */
 static void check_skips_swapped_pte(struct __test_metadata *_metadata,
 				    int pagemap_fd, int advice)
-- 
2.56.0


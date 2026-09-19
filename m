Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305F4825CC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817130; cv=none; b=CIQsoWSp4es8SHM6nMfu/8PunnYsXakQRmLcZR4N4SCr55H+FxAKD1FB74GU8xbUEDkDSaVa4PmbZL3s71uzf5eMFEJK6H6sXGRT6FAugaaE0NoeQchUBILSgbb4t/2f1dciW5sLBEsHLXTbqtpofZvwHlgaGySTwIX8AbGz7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817130; c=relaxed/simple;
	bh=rE9OUi7jrnVlYKHWopy5VH5lUwuqtjviy/zKmYm+HAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCh/QPSf6yLkIxtZIUvBB8NIIW4hu51vaOZZ/UlZkix8KZLtoSI5AEDd53smN/p2MZ8PuQk2L8bfVdLzD3XjPeAAMzWT357L7lkp/MgLAbVGoLtrf0bm13qcoqySAYHUCC9O3hQh88cBYjw4gb0sk1HOfmxGdMRivRlNyiozx5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ35ng/C; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ35ng/C"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so14152135ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817124; x=1790421924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGkK4uRxk6Nr5v3Tq2POt0GXdP4fUGbJEIfY/ItE10k=;
        b=kZ35ng/CB+WCoHReloczVtYgXePbusg9q71J0/HeVomyS9vZA9ffi27HOzv3S19PEw
         rikVswL6zQciNS4taaHJyE7WHtf/DQhmFgzXnQ5cH3JptxBmzby07lYOzj1fLsPzQfF1
         DKhzBENQhKMRTJmdIHrff96XxeczK9TTD2HGeSEH3uxrXqcHqFcyD6/5hi3+zqCnc5MA
         O9B3jyq9/tnAM9WlMidBeNqzzkR6TsYl4swq10DU7QBHIlvkhv/+xqdvDRVbfBqbKbpQ
         SsHf1nNxqigD65gIDbkFfmF9wb+lLL7Kji0U+OUcAtU/Zg/IByjEgvAdBd/xq/JmYVDF
         XO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817124; x=1790421924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGkK4uRxk6Nr5v3Tq2POt0GXdP4fUGbJEIfY/ItE10k=;
        b=jtW/u0azyOne1ZjqT2dCLbJLLlnqgEE7Ni+UhPj5pEq+cU5jpzKsOpG93iye9gQjse
         rDhSbsP64/ZJN8/7uGSMCoyPmrxxvG6RwZrWkSDZ2oyfwSW4HQGhUt66PIXfjUHa8qRv
         XCp1faQGyIVobKzFPw9/r9mmTbX4adwETEfIM9zQdK8Ka+rOT36M+Yhf6LeinLbp8LoB
         UimqmXfbUazpCyL0vvv3x3AS39dgd1daAUz5gRTWQiY+jobwYVeHzWJBxW9OjLt6a931
         T3VIhamZ3KnRLTXfoMPIzOTLbQ0hkc2CWw2gc24fVEuBRq82dd+Twubaz6yD0jd8DRlL
         w9/w==
X-Forwarded-Encrypted: i=1; AKwUvBwzWAhMXUfjnLsK90CebI/Wo4if6OzRwodxu+C8IbF7hPH+5jZca+G5DQvmDfXzNRS08bizt1xYi0bVfOM=@vger.kernel.org
X-Gm-Message-State: AFuF++mbPRtVVe7mQU5ixxGbA0juxAPu3OIsOfSusECiucAMN0Du6foV
	wtDMIRYYjMmmHKZ1wbk8zoH+dNOXYIkqgHCujcWPVRQD/jXpZL5r8N6k1tNVUo4P
X-Gm-Gg: AYBFou2hbzqyMPHM7xsrhX4KKo63E+XJJ/tzjWOQvgEpLnJX+tEnBy7hwCv/izbbyVK
	rwcfwlIl7jhwFQpibeCsb8vMJ1ca02z0MZx2HU4LqtFKnC/K2aNs3rk+3yaQbOT57PfTQzhR763
	QOcpNBUnapQa1TzPo7HAOMDFzUwE/w4cluHOsiiZPgsYUMKyYVji987La0WVZ42/ehUI7JPXEqj
	Px8h+IWOZcOPs1mFz5OMBI8mXtz2LdKH577HCu1T4qh5t3tthFl9/V84gQOS5oX68vi3cHAqcpy
	I4uGapyIZMLO+RcO75ssQjrTvYUOlSINVHUhIZos/Sud5Xn9raewgp2aZ3+Lj5aWBLiW8YwB+LR
	914Sf+S9yBhF2rk/5eggn/M9fTxk4QJOVeF9jV8x2N4YJVYACJiAUjOhcLZX0wjlGRsZiwvhYrY
	Wxm0wgnDE6sOy2ag7nqInYQHRytx173aHQssdSOGmlVGqzDTtK2XUaN5+dczKEQ4Dbv26v4RP9T
	R7c/nZPRwPLqVroICIo9vsEc6CcqdtT22pAL9zbgVIOhp5VOyD4TTSnZh0A0o0I6gMJMY4yk0TV
	NBvo3A0Twg==
X-Received: by 2002:a17:90b:5690:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e54cfabf6mr9792500a91.24.1789817124232;
        Sat, 19 Sep 2026 04:25:24 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c164c18sm4238694a91.1.2026.09.19.04.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:25:23 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] io_uring/bpf_filter: Set src->bpf_filters_cow in io_bpf_filter_clone()
Date: Sat, 19 Sep 2026 11:25:23 +0000
Message-ID: <20260919112523.3872581-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When io_bpf_filter_clone() clones a struct io_bpf_filters table from a
source restriction set to a destination restriction set, it increments
src->bpf_filters->refs and sets dst->bpf_filters_cow = true, but forgets
to set src->bpf_filters_cow = true.

As a result, subsequent IORING_REGISTER_BPF_FILTER registrations on an
io_uring instance or task holding the source restriction set bypass
copy-on-write and mutate the shared io_bpf_filters table in place,
corrupting the BPF filter rules of already-cloned rings.

Fix this by setting src->bpf_filters_cow = true alongside
dst->bpf_filters_cow = true in io_bpf_filter_clone().

Fixes: ed82f35b926b ("io_uring: allow registration of per-task restrictions")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Resend as plain text. v1 went out as PGP/MIME, which I now
understand is not wanted on the lists - apologies for the noise. Also
add a Fixes: tag and the Assisted-by: LLM tag.

io_bpf_filter_clone(), the bpf_filters_cow flag and its only consumer in
io_register_bpf_filter() were all added together by ed82f35b926b
("io_uring: allow registration of per-task restrictions"), first
released in v7.0-rc1, so that is the tag. Note d42eb05e60fe
("io_uring: add support for BPF filtering for opcode restrictions")
created bpf_filter.c and has a later author date because of a rebase,
but it predates ed82f35b926b in the history and contains neither
io_bpf_filter_clone() nor bpf_filters_cow.

To be clear about severity: this is a restriction-bypass / filter-set
corruption issue, not a memory-safety one. The refcount is taken
correctly and there is no use-after-free; the problem is purely that the
source side of the clone is never marked COW, so a later
IORING_REGISTER_BPF_FILTER on the source mutates the table that the
cloned ring is still using.

Found by code inspection; build tested only, no reproducer.

 io_uring/bpf_filter.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/bpf_filter.c b/io_uring/bpf_filter.c
index c0037632b7af..4a21511c4811 100644
--- a/io_uring/bpf_filter.c
+++ b/io_uring/bpf_filter.c
@@ -253,6 +253,7 @@ void io_bpf_filter_clone(struct io_restriction *dst, struct io_restriction *src)
 	 * If the src filter is going away, just ignore it.
 	 */
 	if (refcount_inc_not_zero(&src->bpf_filters->refs)) {
+		src->bpf_filters_cow = true;
 		dst->bpf_filters = src->bpf_filters;
 		dst->bpf_filters_cow = true;
 	}

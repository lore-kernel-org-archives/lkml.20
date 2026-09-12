Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086737C118
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211152; cv=none; b=nji/rWBKi0e5QFXMetHhjSebkwGscThjvB9CqjAm2SgZpVnXrye6avHSfX75N4HXYwhXNPAZk5PoGs6wR7DI3DIu6NZtirwpx1Y4LR2ns+aC0cL1jAzA5/49bwLSe8wkD5LjeUmFM5OUaMJ0RoiGcJrMmirkHLVF3UchMN8eP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211152; c=relaxed/simple;
	bh=U8dyeE2ZjfwoSNqhH5SB3JRkDp/E32wGLTTzgffWgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKFi94QeuU2SGi1YnioIfGMMO+7g2fS5j1IllnkcGeTtck6hzk4l6mwWm16QjHzlgB4zlHBDZnJuZG7bWFyeYr5q5xsHQzHfLOeVrRg1NvNedKT7z47AXhVYG21KbjlXq81OlQzLlUQXzU0mpG8tw6iYBJ9inbAMX2B3198i11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jLA/aQWv; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jLA/aQWv"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cc107c451so12480566d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789211150; x=1789815950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ea2NflktZJdbiCBZKoJ2b9G1DxTKGyvVgfDXxJDHwxs=;
        b=jLA/aQWvnJb5+Kjnqljf+Bx7sfbJa5WKhYuY4xZvlYNQ3TI5fmA9i02WrFHZaRFlY0
         /b4TedtI26OywsNu7OrcBKkNt2OQXU1qxEzl2X7Ub8eBup/z0THRUufyIDl0KodJmiSV
         86+CoC4DFDI4+uW5mcEubx0U4qwGH7o3yG3eALZunXcFdOph5Alfq/Do45HWweoK7k2L
         WnUJnsXrClSMBY7qlppmm/e5s0nvox42yndEr96YDa5i9YB5OwY1rpLzrF++a8TLUXgS
         jSIZEZnXwM2O4OrbjGWsc12p4lv8WdQNRYCZRjtvAS5y9D7frbuQGkso1FFLdGA7tihZ
         f0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789211150; x=1789815950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ea2NflktZJdbiCBZKoJ2b9G1DxTKGyvVgfDXxJDHwxs=;
        b=X0RKAo7HYrURyTBXCaD/BaD/Toe8A2yf2aCCBBmetZuSlZObRd8H0Byw2ZEy8hncta
         ox9b/+CFN5KQL6KE87LE0Cr63s/x4yNiSp8AeWxcmxgFVrQkiULKImyw1VFqVLLHIgvS
         vsFtXz3/2A5ZpykADEbwcvSXQJJwliO7/a1b9wYpvFsxMxkqz5+jdWJpfcCzpVBQfoxN
         EHmJpKDONoFBBO6yebgPhKmUeIfenwF2/XsahEgQNJ6Kr+SUPROh9c1zShRTM/05eftw
         QgMit+MIhaJ1X/TYjdMb1qV88/8wTT+j/ESUBHVZQASDIDSShqF+XhBRbCPbhBdOvnrZ
         u9+A==
X-Gm-Message-State: AFuF++nzhe91n1QOxwKTx8zE6jvG9QdsdFYDATMtSdtLcMwVBF85hepu
	5ty2ch442xH9Ob1GMLS3tYK3viA+rBu6YDKWgwrNjkB0vFt36q0/dRs3uswpZnwaqf2w6FFhwZ1
	lpeg+
X-Gm-Gg: AYBFou0j+70GjCROd4yi3DGO5hvubMhtvlJlLYHNft9CR7UP0HCad7gzvdcskkBqVKJ
	16zgFrj6JmJbFgOc+ttxA6ST2ygk0BVrmgAKR5K7w7k2V8LbyykyRUqViiqCoyXo9Uq93AbXcwH
	Suit5Q1cHDc2eJQcVitK7+Qkz7b8Ysticx8LBesda2KfxemJUW5nWOFbOcZzn7pe6vqBN41P62h
	Yysn3XK27pG5FMY+i9zLdXnzJ9fG6GDPfAswGPlLFqcIQKdwRfS4Q6AVLUdBMyr0gKNL+7tv4Fu
	B2t5KxJuXErnvxM/9XGgt42MwI6mSvKezUNWnO9vBZDjPP2uy3K9U8v9q9KtY1cjHUJGIfxPZ9o
	ACB39fay8qL1cK61lRPKQfEV2XXpf1az3lggtXiKQHg7Nk4rce1rda0/nanzxhetplHLbfWDOTz
	71MpFuwpTM3uHyMt4PoBD/DeL67BtXvyvc/IAe0K8mCcAQSHsKKdMaVztg7tsEFK3QFQCH4EKgX
	NtVuezp85r1kBzibhG7H5H2SDp49bBUWD9D1I0zmpIOpPX2OrRpVk54EgL3
X-Received: by 2002:ad4:5d62:0:b0:910:3455:53bd with SMTP id 6a1803df08f44-9121210328emr111288646d6.35.1789211149924;
        Sat, 12 Sep 2026 04:05:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120ef650a6sm44575746d6.0.2026.09.12.04.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:05:49 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	sashiko-bot <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [RESEND PATCH] mm/madvise: use folio_trylock() in the cold/pageout PMD split
Date: Sat, 12 Sep 2026 07:05:40 -0400
Message-ID: <20260912110540.3203010-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD or MADV_PAGEOUT over part of a PMD splits the THP in
madvise_cold_or_pageout_pte_range().  Two threads doing that to
the same THP create spurious failures.

  CPU0                          CPU1
  ----                          ----
  folio_get()
  spin_unlock(ptl)
  folio_lock()
                                folio_get()
                                spin_unlock(ptl)
                                folio_lock()  <- blocks, keeps its ref
  split_folio()
    folio_expected_ref_count(folio) != folio_ref_count(folio) - 1
    -EAGAIN

CPU1 cannot drop its reference until it gets the lock CPU0 holds, so CPU0's
split always fails.  folio_trylock() makes CPU1 leave without ever taking a
reference.  The PTE branch of this same function already does this, as do
madvise_free_pte_range() and madvise_free_huge_pmd().

Reproducer: 400 rounds of eight threads calling MADV_COLD on half of each
of eight THPs, re-formed with MADV_COLLAPSE between rounds.  From
/proc/vmstat:

                     thp_split_page   thp_split_page_failed
    before                     3186                     860
    after                      3200                       0

The short before count is rounds where every thread failed and the
advice was dropped for that THP entirely.

On failure the walker returns 0 and nothing retries.  The PMD path becomes
best effort when the folio lock is held elsewhere - same as the PTE path.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry%40gourry.net
Assisted-by: LLM
Cc: <stable@vger.kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/madvise.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index f75a9d139980..ae3d7127d87c 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -419,9 +419,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		if (next - addr != HPAGE_PMD_SIZE) {
 			int err;
 
+			if (!folio_trylock(folio))
+				goto huge_unlock;
 			folio_get(folio);
 			spin_unlock(ptl);
-			folio_lock(folio);
 			err = split_folio(folio);
 			folio_unlock(folio);
 			folio_put(folio);
-- 
2.55.0


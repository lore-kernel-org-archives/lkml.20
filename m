Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D630C637
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791154834; cv=none; b=LU4JrgrFF1/7S7m0zhRvK40rFXH6aJQOOthVAzElTdQPjkCJ0Mwiy5EKSUUTqR8rPONLyJBgVn9gSiwqRoIfbmC+eSeVWrzX7hLsji+0tZBjpIu3wWkgQuPOyN64VuMxu9cmKTt82X7QKM7YU4tuSo6mbxCAlsJA/A2fiWvUaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791154834; c=relaxed/simple;
	bh=5UBAOPofpToLQ7Z5Z5ErYTHCoh4xA1BPRqqUx9u13a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2KL0grz1ADA5Fjf7pTP68yDfAbo2hUKOO/1FdUfsYwIv8n4u+f8z/9VqJXjLOcNV91/DLsslO+j7cl9N3itW9mjzpT41Hdc5KbB7MpD/EJwIG96gEEf7hKSMMjIPLTtQBcCIMWNZt3/724xyl5OuZVP/BbWDbazJfHmf5Z0Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iN7MS0B7; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iN7MS0B7"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a17033920eso4973135e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791154831; x=1791759631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/9bjhbBPUpWaue8GUHQjnboGL/2wNmsZKJPcvc1aM8=;
        b=iN7MS0B7xc4HZA73M/ftkYC0QUx3ZJB8JKXGjNx4StzbEzHj2u/OYrNSdtCzTtXSnU
         +5NC+JBd0+4NXexXLnok5RGrf9aw1Vfk28Zztp0U28BdChkEiXsK/mPgurfp8iigIikL
         tJ4kAvilyYijiu5/0d86NqUsG6Z6c/qba9nSjj0Iy6myC3B8mGlmNBHyXr4cUiUqar6/
         aE0isYja1Y/8dGH0W4u19TmH+VQ45GsQHmL7rYIZnD9A4GuPIKp6FrvulWn0Gp61pKXe
         WdKq0DYlZ9oUVcknLCUL3ZTP6KOcTG8zHwSs8RnItB7ay2sk3QrjEhH72g/godXgOxNT
         +7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791154831; x=1791759631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/9bjhbBPUpWaue8GUHQjnboGL/2wNmsZKJPcvc1aM8=;
        b=gZGXBENk2TmVMkw5YTJUu7hmHSW64MmgemcNyWfwTUcFz9bDZpqa5v2epcayUDjAnc
         bkeqJGAYUoQuxgVr7ocslgsxsrDryPU9IDkAfU4BPAsqV1PJKKhfLdqbPfzNkB6PjPJf
         pLISitJEYtTMJ3Tb93f9cg/k2pqZcc6S2a7RybFKp3aU9CxY2AugGlWVqrMMWUa380gX
         xoROWbTncMyPSjOX1qkat0+aSmSwGwrZ9F4fbvuLDxeApo49b9+3fGvtiwgzrdyQcBUy
         +zTbFn8ORUiV97qGtmGsFpP1fKyDNlOQA598z8CoVE0uuz38vIYMVsbBe8imlZM2PkCK
         kOCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRub8XJWV/4K2pSQgtzZ0OGugsn80DJqLb+AgW6QajSfv5Qz9oUVTOhXUSQiFQBWaHTL9OWbpKUJR5pLA=@vger.kernel.org
X-Gm-Message-State: AFuF++lkrvgKZNJhiikm9wAoFaOeXVlp3XK0JntS5y25xSnuc2YLqjo9
	amnui10StylXaP8qP5k/MyvClazZ4UMEHpNlwM7Uaf4TdaoESq+VQm4g
X-Gm-Gg: AYBFou29/F9NzkYjDx4DCEQoWEix2/51RYUdaHxPEv+b1WoQbuzbL+ce8bcOTo+xOTy
	ucoxZ9igam8Biw91wBAqJ8PuS8Q7VXPANPFWKtA9gxICTM723MxHdJrrczpU6IREwRebVNO20OV
	ZAdOWHgrkwuXB66HaNjYF9atblKJS8f7u30Fja+SE6VBtDTmSBS7qZIFEuMAcycdyIUG0+iCiVZ
	I010SnXLfuqfUYmzS57DJhkTidWSGnMRPj0KyiEnIK3RCsR1Tw/wP+NEIuljKBczqyVmNZbtEax
	oi54VuUGpndZazbFN8K7iFIRIxGBVrVHspdovFrkEUPRj6ynIAgkV+pFUtsB4KPMOW/3UHGU9UH
	2Ryr0igH08nrOP7wdLokD1ovGxS7i1JxUzWKYRHZOWGmjmcAJYwfQQyfAqGv6PSGBgN4jP3RQK5
	c7uNoKQmmeNYlDhrqJiyvBWyvbHdW++rXlBdaAkqrQStpcEl+J39bFyMwUrNsMVvHRtclQhEPdb
	EjnRmXkfttJUcZvelNe8pS0nkl+tKYDaTT3tvhrE9PNP5TS/1UGcu4RnTaDaDlc4EHMJRq5mw/B
	+oSiGKFs6p/aYtvIDvR+fIpVNmpzXMN86A==
X-Received: by 2002:a05:600c:3e06:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a16d3d5c54mr70770065e9.29.1791154831127;
        Sun, 04 Oct 2026 16:00:31 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm240046315e9.10.2026.10.04.16.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:00:30 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Guillaume Morin <guillaume@morinfr.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: hugetlb_madv_vs_map: fix TAP plan mismatches
Date: Mon,  5 Oct 2026 01:00:18 +0200
Message-ID: <20261004230018.190880-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqgUdbtumaO8RiIb@bender.morinfr.org>
References: <aqgUdbtumaO8RiIb@bender.morinfr.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plan was raised from 1 to 3, but the HugeTLB setup check that may
call ksft_exit_skip() still runs after ksft_set_plan(), so a setup
failure reports one result against a plan of 3. Move ksft_set_plan()
below the setup check.

Also, when the underflow check fails, or munmap() fails,
test_underflow() jumps to err_cleanup and exits without reporting the
remaining results. Report the munmap() failure as a test result and
skip the final HugePages_Rsvd check in err_cleanup, so the output
always contains the planned 3 results.

Fixes: 827149aad495 ("selftests/mm: hugetlb_madv_vs_map: add underflow test")
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index 1d111f42dd59..5dc44ff0a377 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -169,6 +169,7 @@ void test_underflow(void)
 	/* First unmap, this will close the vma */
 	if (munmap(huge_ptr, mmap_size) != 0) {
 		ksft_perror("munmap failed");
+		ksft_test_result_fail("munmap failed\n");
 		goto err_cleanup;
 	}
 
@@ -203,18 +204,20 @@ void test_underflow(void)
 	if (waitpid(pid, NULL, 0) <= 0)
 		ksft_exit_fail_perror("waitpid failed");
 
+	ksft_test_result_skip("HugePages_Rsvd check after child exit\n");
 	ksft_exit_fail();
 }
 
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(3);
 
 	if (!hugetlb_setup_default_exact(1))
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
 			       hugetlb_free_default_pages());
 
+	ksft_set_plan(3);
+
 	test_madv_vs_map();
 	test_underflow();
 
-- 
2.43.0


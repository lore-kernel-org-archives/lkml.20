Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052E488226
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164892; cv=none; b=pZHbGpMkniNDp0XWe/t8rBn2XtN2cNqHf/XOGI8Z7OtirVvwVzR93+tGgg7hKVGPOUzox1mH1p931m56VLBGnQC3SyiGWbejAOS+jKnUQviPAYGKIcgoZr912bdl+bask7sJqA9gK2p+Q5c7yajWLVOEap4ziHlDgbfCGndqPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164892; c=relaxed/simple;
	bh=46JLE2djcEBHu/e418tq2dWGc92hKIPjTY95HQc1KFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJ9wWogREnAKyPWT7A91J2FCnvqq9QAyDIUhyw3ik35aow43svyoy497HYuSj8NVEIjz3y0zuU/hDhw2IFVlf+A1+wfI0bTyYTM/3kE0QdfG6cKsd2Dl9rN9whtsPi+eyDzM4R4g47BvBIiNG+3U5Ft6sc4zbBPDvNv6LoAMNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GM20skbp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GM20skbp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so1288351a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164887; x=1789769687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+6FszybKpenSJZy2BI3hcOtPumB191OQOasiZknYb8=;
        b=GM20skbpoc+0uLE5DAJCmZBQHxS9vqugMxUb5S//OL20BD7r+NVdeEoTb942vpmsfK
         ru0wIMmidHRYp2oRMnvMBIoJMtajZo2SG4zE+FvQwh8/CjIkOWUD9a6Ws4u6IRzd66SM
         JBvS+XqXA5cQHjEJvL4oHGW5H4Y1b5J6s0RzEFH9L1fhV84FFOcKGTQMfwYAm4tSzgbO
         Bj8t+PLrhh97briZQOlMKi2zjISpIAP5jIcYfQa6h7OQaECEc3XZDFF6sIgO3wnoaWiD
         dyEIBGhyesLfvaOkaL0JmOTRvcdeBsScFlZtixKd1P1uvvKUrBM664MGnDOqK3jw2CW0
         9hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164887; x=1789769687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+6FszybKpenSJZy2BI3hcOtPumB191OQOasiZknYb8=;
        b=ACvetMkohEImXsbZ+vt/SKSEZb5BWjHyVR9KdZbQOB5Ncs2FFmHRYQoGF6yJkQDv+q
         5lwGLQlO+qfIe9hXh+1kP0w+jBYkKX5F9/u0w6FWBYSNAhvMQsVeJsnJQXVYfoPkEl+N
         zZgo74dqWdVApTAz9vvCiJW88p/WN6dWOc/nRXZ4E6md7W+MvgE9Rj9fsKfPdVVnYMQb
         ZmhRjvEqcxxXYrqU+FOhTVj3jBrc0ecY0oPb4uY16X/we0xlXIWRhvq/Tam42cvSh6TS
         5E66Pe6jWSNMxDX0S1HwBDP0sSu/DHiG3PY5vvc23LoUW/o/JqoHfvomIlhvVYAQdYmB
         58YA==
X-Forwarded-Encrypted: i=1; AKwUvBxHUTGkoVFpOXnDPjvM65WYjOSjJ3rAzbF9R+f1dH+YrxT9pu3MhWBTqWBry7FA9/RjepsWDpZFemftIpg=@vger.kernel.org
X-Gm-Message-State: AFuF++nFf13CtgWoLlY25zErBrHEbEfSflHwRL4MFfKvI6FbhT/U7hLa
	ILun4FR7LKhFKBEyjfd57VHqoWGgkxPG8RKGnAK8Pa5G8H6z32hQU0dMsX0a4w==
X-Gm-Gg: AYBFou1cp5Vbw0dQZ3OxJMM0zry/O/cDIY7Mzt0u5lv6h/EFNCVtiKkNdoWU/1lB26K
	BlvOJsM3tZq5nSN7YhY83Byw5S5nY6A8LqlcRZpZpFWpWWqybB1GJHs7X7dDfU/40X2E+d57iLM
	wmoAf5G2rjm8G/9l6TuGjVqOOUheMvOau4GGXs0F43pK1VRMsMRykbStciLn2SBytybMDb6mJ0d
	TKK/kvTnp1F4jPjM/GN0km6ENhCKxa3uZGnH+EkYyh8s40IM+bcpVU8Uz7KEPGEkbb4dT7TxYoK
	3bMrAj6wdlnVErfWDPCAd0yk2jh0LAM+OqRTYAIyA85Fd9+M8cNYjyzyMiAxgjPnqc7Uu4lK5QJ
	nJ5eme4LXE9Q9uldBVKirDnyscOzCRVybK5ZTm5/2Ov53d2NiLZiRsJjIHc3pjacOFwpvfK5xus
	mdPoHx56PKxDP3liuC8+LSUWleSoRRzi69nRgELWBOoK/RyerK/kmfjfb8uh3oCR/1vJvoGFkBx
	VEXAy4=
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr9789091a91.24.1789164887357;
        Fri, 11 Sep 2026 15:14:47 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm10174839eec.19.2026.09.11.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:14:46 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam@infradead.org>
Cc: Yury Norov <ynorov@nvidia.com>,
	Chris Li <sparse@chrisli.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org
Subject: [PATCH 0/3] Catch automatic storage in IDA and Maple Tree definitions
Date: Fri, 11 Sep 2026 18:14:40 -0400
Message-ID: <20260911221444.1523311-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 0day report [1] from the region allocation benchmark exposed a lockdep
initialization bug: a stack-local Maple Tree used MTREE_INIT(), whose
embedded lock has a static initializer. On the first allocation, lockdep
rejected the lock address as a non-static class key and disabled locking
validation. The IDA benchmark had the same issue, masked because it ran
after Maple Tree had already disabled lockdep.

The fix [2] switches the test to using mt_init_flags() and ida_init().
This series adds a compile-time check to the related DEFINE_IDA() and
DEFINE_MTREE() declaration macros to catch the same class of mistake
earlier.

Patch 1 introduces ASSERT_STATIC_STORAGE(). It declares an unused static
pointer initialized with the object's address, requiring that address to
be a valid static initializer. Patches 2 and 3 apply the helper to IDA and
Maple Tree definitions, respectively.

The helper is mirrored in the tools compiler header. The existing automatic
local IDAs and Maple Trees in the userspace radix-tree tests are converted
to runtime initialization. The interval-tree span test keeps its existing
mt_init_flags() call and uses a plain Maple Tree declaration.

For example, an automatic local definition:

  void example(void)
  {
          DEFINE_IDA(ida);
          ida_destroy(&ida);
  }

now produces:

  error: initializer element is not constant
  note: in expansion of macro 'ASSERT_STATIC_STORAGE'
  note: in expansion of macro 'DEFINE_IDA'

File-scope definitions and static local definitions remain valid.
Automatic local objects should use ida_init(), mt_init(), or
mt_init_flags().

The check is limited to declaration macros. Direct uses of IDA_INIT(),
MTREE_INIT(), and MTREE_INIT_EXT() remain unchanged. The helper cannot be
inserted directly into those initializer expressions because it expands
to a declaration.

Validated by GCC and Clang checks accepting static storage and rejecting
automatic storage The userspace IDR/IDA and Maple Tree test are passed
as well.

[1] https://download.01.org/0day-ci/archive/20260910/202609101106.771b567e-lkp@intel.com/
[2] https://lore.kernel.org/all/20260911155244.1406122-1-ynorov@nvidia.com/

Yury Norov (3):
  compiler.h: add ASSERT_STATIC_STORAGE()
  idr: assert static storage for DEFINE_IDA()
  maple_tree: assert static storage for DEFINE_MTREE()

 include/linux/compiler.h            |  5 +++++
 include/linux/idr.h                 |  5 ++++-
 include/linux/maple_tree.h          |  4 +++-
 lib/interval_tree_test.c            |  2 +-
 tools/include/linux/compiler.h      |  5 +++++
 tools/testing/radix-tree/idr-test.c | 20 +++++++++++++++-----
 tools/testing/radix-tree/maple.c    | 12 +++++++++---
 7 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.53.0


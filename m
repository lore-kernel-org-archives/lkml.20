Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E703955C1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477649; cv=none; b=QH+zv5PFcjjyJMezRP/1IAFO3Y9rBhveK+YvZIZq4Gl82VOivmPuIbbip96PpL9g3TA7qg5X665Dp+LJERCwexvC2XKEbyeLDVTgfUYhZmJ9H8Bk+rgBXNEiU9FYdsNKxQg4aTQGQsT7LIzx1tOGImYtU4LZeOqjCSEdKWV2oa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477649; c=relaxed/simple;
	bh=Wry/tfYuTC7rWptBdzvZECOOBl9/wiK4tYyVY5TUF7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BzdBW3LuI1UmPvQ9QQy5FoZBuqw6vBGSa9Vc6GOzm6/yxlTwAvkqIGgpOBvxGxnxHTZuQhV0+qQeUuxpR+po1oNOoW0qahuLtOqRCB+kq+llLMZAii/PU0+vkG69KsJEPCGv1pmB+3t8ZABAF0+iwlgmhmAhk7UXvX+C/9EmVT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0DkkHOe; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0DkkHOe"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d7a9e2eb24so3056914eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477646; x=1792082446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQBUbTgzsBd0hnhaOE1QOAQqui1J5m3YnzwTsujlUWI=;
        b=l0DkkHOershgQ9qVF2QPqH2ggvR64hFRYyPml0MAb6M6kIlRGAoQ8s5vaa2F7rJcbH
         2LB3ttpVPVniDf+8W5vVde3CzSdhig5iHj5Q1E4p1lt/snUgw9xNhEiC7RxMjfvUqERC
         9QHJ1r3ye5vEEuwdtS57fbHnr9uU073HljgbPch7vc1pEw+Fn5BDG8aKF6c0BSa4EufP
         wRr+6xTwOFIBKH/2fmghToLmEBj6RKc8HNY5c+kGkMJ1Ee+YcTruinzHcsA+JsqBs9hu
         KwcPLaVtS5n639BWAVEMC5WI3nmzBjufC/DnsJgFGnyyoTuwZQFrpTBFukTPBJkKFzdf
         SsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477646; x=1792082446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQBUbTgzsBd0hnhaOE1QOAQqui1J5m3YnzwTsujlUWI=;
        b=c06KdQrNu8EoghA+h3Rc6INSldI91E6lHsUVputO2YRxiU+qsaKjml37RQA5DXjizD
         CvhU/9JaEd+LuBUwc3o9X+Wiby2A3/TSTTgcLG3nosCML1IiWKDYWa3lHU2miPkZtH/n
         2vdYt9a+auAR7XHbbkbkEP5fs4Bk38ycEO7pzdC8dor+rL1y9W2vdg65/u1XEDB9L3Nz
         s3UEsFZFjMf6zhHd9Ypj/+vfQnGx6RhxMzVjX9YqgRAJNKhdDijvBGGMbe5ya4AOsrZD
         c4Eoa5JjMOPLHHwMFs5yQ1xcO0i8rebOSxzToqg4WemxDhpEzsvYz+nYCcvK/x7PMvbK
         GK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBVHIsriz17kNQM7XHWdOuOgLPXf3filcZG4+WkBRr6u9BK2V4EGZkpG70Z/Bx8fopWrghFljv3KRdyHg=@vger.kernel.org
X-Gm-Message-State: AFuF++n/hpo4GPyDNxy80+QMa4k6Z77EUNd5nQejIipRBHYvix6C9ChB
	3gvTlr5YHxGcf/4ALfjySXk9J7M4M23mGba2Igfv28U99uiDCweYk0dT
X-Gm-Gg: AYBFou3VPtxA2eP+/wIvy2sGimsagnvwUVzURPO+pj7v3TuD8v8MiunT1lKJQ1a8LSH
	kZNOE+ezDHiLi115A4UlC3Az6/YqNkMjndmdQnBNCPcGiwquqZN7lqqErhuhv3iFD/mdSNiEvNW
	fAB3NzauGdqOgynU1ulE6uk6TEjAh3yLvy8c6I2HNERErejqmQ0ycu+62aRFvGGbsM8zsfC4q4u
	fo8/Z5GsaDisbdxNAQFjjWvAXA4nyjNN2aPZX4vrab00hEOXpAhfu6QWtlSX+N3qkJ3IXtGqQ02
	bhHYYWCLj0KRZ2bX5eI5t9sY4rxje1R1yOkPjd40IxicVGOckyZxFRrKyv6xCuh3SR39he6X5ls
	YZ92H5V53I1BQwQRcNIKqCs3rWfip5EZ7SL/ddt/vZQUvqkdl/yz4oq5m9YMtYHEUZGGG1DEHFR
	CBvDjNqe/q8ij0znBHrCScU+/hsjg+VkWt8NgDKc3AP9l+L+cls4fmsKzJ55pw66QLiJEzGm98C
	PMQZNsA7Rf7
X-Received: by 2002:a05:6820:c44c:20b0:6dd:9790:7dd9 with SMTP id 006d021491bc7-6e7a8050f53mr3686761eaf.80.1791477645795;
        Thu, 08 Oct 2026 09:40:45 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:45 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] kbuild: fix memory safety and UB bugs in host tools found by fuzzing
Date: Thu,  8 Oct 2026 11:40:27 -0500
Message-Id: <20261008164035.3668885-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes bugs in kbuild host programs found by building them
with AddressSanitizer and UndefinedBehaviorSanitizer and fuzzing their
inputs. Most patches include a reproducer.

Patch 1 fixes a bug that also triggers without sanitizers: a declaration
such as "int a, f(int);" makes genksyms loop forever while allocating
memory (since v6.14; earlier versions silently recorded wrong types for
such declarations).

Patches 2-8 fix out-of-bounds reads (fixdep, modpost) and undefined
behaviour reported by UBSan (kallsyms, modpost, sorttable,
tools/include byteshift helpers), several of which trigger on every
normal x86_64 build when the host tools are built with UBSan.

The series is based on next-20261002. With it applied, a defconfig +
MODULES + MODVERSIONS x86_64 build succeeds, and for genksyms, the
symtypes/CRCs of 149 preprocessed kernel sources are unchanged.

Changes in v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.
 - Drop "kconfig: fix NULL pointer dereference for defaults taken from
   choice members"; Julian Braha will fix that issue differently.

v1: https://lore.kernel.org/r/20261005104050.1786222-1-lzsx618@gmail.com

Leizhen Zhang (8):
  genksyms: fix infinite loop on declarations with parameter lists
  fixdep: fix out-of-bounds read on a comment ending with a backslash
  kallsyms: do not call qsort() with a NULL table
  modpost: fix stack out-of-bounds read for unterminated PNP ids
  modpost: fix handling of short reads in read_text_file()
  modpost: fix pointer arithmetic on NULL in parse_source_files()
  sorttable: avoid pointer arithmetic overflow when locating sort_needed
  tools/include: fix signed shift overflow in 32-bit unaligned accessors

 scripts/basic/fixdep.c             |  2 +-
 scripts/genksyms/parse.y           | 23 +++++++++++++++++++----
 scripts/kallsyms.c                 |  6 ++++--
 scripts/mod/file2alias.c           | 10 ++++++----
 scripts/mod/modpost.c              |  6 +++++-
 scripts/mod/sumversion.c           |  3 ++-
 scripts/sorttable.c                |  2 +-
 tools/include/tools/be_byteshift.h |  2 +-
 tools/include/tools/le_byteshift.h |  2 +-
 9 files changed, 40 insertions(+), 16 deletions(-)

-- 
2.34.1


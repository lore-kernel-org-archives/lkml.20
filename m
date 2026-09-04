Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AD47253F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518955; cv=none; b=iCG3AIIgUTDgbSpMvSDSRgD0eJJckwNAqO3BlJVivlyTh4PBglXPnQNK++UTyIA3hCmjsHXOKr+hFvxIep8p8GwgDShdA17L5j+Bk/YoE946+Qmf5HUSVjdVO3wJDVEQ1JbPFQax8h/cYdQBPXwnuauj7Ga8OR9G2vyLET+E4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518955; c=relaxed/simple;
	bh=iKth7BJy1uthvxEACs680JOFz/m9paU85MCOsTMqZvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmx1qszGRlCahgsydBVIUZAyJ1I24RueqvfHS45Zr4ymqRFlDfc7ybN4wbIY7/WhqIFUH/P2heL32m6pRVx4/EXfpI+gvBrBsG57xwSiIES3LKXGZtTzVTn6GTCfFfb8EwPZi9gojZr+9bK1GGM+a2D7ZGLS0L2tVJzQvZmhMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxIfByIw; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxIfByIw"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so712806a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518953; x=1789123753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAgJqTumpyreraIZq6WtdLEDqlTs7ahuD70n9o2YsDM=;
        b=IxIfByIwDB3EqWQjXNVZ119WxlY8if8Z59uQIZKj+MS0Urz9533KuEgX7aRPpRrIwn
         c1QYfIjZy3jGEoX+nL9qlsZl/VVqyFfAHXOi7cj5Bm3eZn1iffIjEuauc1Ju/f1AwTu3
         vMctSvuJc+uL1AEJKR/eUSPlsowOzgogZom8M8gThfSGqBPNy6/haM9+v11yWgbokqVT
         8cOOQfun1+OoE7u4ID3aJKiMIch2awbDOVs1dfx7/pHzO2GgtBgeZmOGXK2A57+6hrDO
         PS34OuyQviUaYim/CDFMYVOY1DePomJdrkH+rbaAEhkFnkuFbxrgJ4d/H11NXQHLnSiA
         WWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518953; x=1789123753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAgJqTumpyreraIZq6WtdLEDqlTs7ahuD70n9o2YsDM=;
        b=g9hc7m91kt5iCvxXa+CfIaAR55j1fb2773b/gjEx+BImClutKwkESJR6Ah1cMm4cbc
         L/Q9MQ6TQn2fIo/2Eq6tHQ03NFCh846lGltI4cm5xBdXG+i3DFLqN1NqQpimDS7zZXda
         dZk/zZYy9S2bmn0XwJOmTdx1ATXAljrFpntDiZu5leu3hnoCpdUVRdvXe20tYvZYW6zI
         DN5qbeLZLjgV+8q9C52dow7lNCKhy/BPMTplSOu+ovg0MR8HoE5u6g36CU5dQFCoTktn
         TNNhGTdmJT/q/UV14wvgFa21xh1Mo1fwOeUaH0L2XIQVtKrRaCsF5MVq3g8BZ5qviJaW
         UYaw==
X-Gm-Message-State: AFuF++kjO2o0LMDgBXbk9Pk9jIyVK5Ie9WVH9iCOOqDrP9SRrPT9LcZ+
	Mn5n08eiK91CADDIgCpd0DsSyYkPoduUZAEO6GrvgGh/0mpgsb10Qp+FgFGsH1wnkFo=
X-Gm-Gg: AYBFou31vSVMBdRHrGi4r2SOEubiTssmQUQex3TejLv8dTfOkjF4kBCiHi6Z89a8gij
	xNGid9/pc3Z2/IuYu70ju0trvlApklKjyaTP9y0rxFJDekjIhk8yOd1lY9Ej/+Lcr2qVxijJtZs
	58p/PnVbvVIbHvUtLMsF1OIgGNsPm/AnBFvgZkY6s3M0vtcUtx+dGhw95H0KNVb6u7YKD6144lX
	+z21F/6Zj3LbPNrYl/UxexzpYie8GaD8llKUJPsm+6i1AW5814YgHKiikUfJAStbOFUbZe+Syrq
	jTFyQXqfRYVbADmlf8vDNb4bgs/CYSTzp7q0xQ4BB/LPrWFBwmuNSURCquF6rOCmhd541Xo1JqG
	M5iVGWT1ZlMqM3e7/F/0Gjdf6TqzDhu8BFxZC4HlkmiAagQ+EpYSKYZcYhxfCdl2fiA1fatJTcB
	psxSop9CniG08CWqEpmwBtcDd0bEIkoX4I6RNx8KrRdZ+ajwosDDFNx7cT7GSCTGgDozSVkELRf
	Y0IxPTN0Pl3KoU=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr8546381a91.17.1788518953532;
        Fri, 04 Sep 2026 03:49:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:49:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] lib: fix typos in comments
Date: Fri,  4 Sep 2026 16:18:48 +0530
Message-ID: <20260904104854.25272-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104854.25272-1-hemanth.selam@gmail.com>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 lib/flex_proportions.c | 2 +-
 lib/rcuref.c           | 4 ++--
 lib/textsearch.c       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/flex_proportions.c b/lib/flex_proportions.c
index 012d5614efb9..21d074dcec2e 100644
--- a/lib/flex_proportions.c
+++ b/lib/flex_proportions.c
@@ -54,7 +54,7 @@ void fprop_global_destroy(struct fprop_global *p)
 }
 
 /*
- * Declare @periods new periods. It is upto the caller to make sure period
+ * Declare @periods new periods. It is up to the caller to make sure period
  * transitions cannot happen in parallel.
  *
  * The function returns true if the proportions are still defined and false
diff --git a/lib/rcuref.c b/lib/rcuref.c
index 5bd726b71e39..55f7796703c7 100644
--- a/lib/rcuref.c
+++ b/lib/rcuref.c
@@ -4,7 +4,7 @@
  * rcuref - A scalable reference count implementation for RCU managed objects
  *
  * rcuref is provided to replace open coded reference count implementations
- * based on atomic_t. It protects explicitely RCU managed objects which can
+ * based on atomic_t. It protects explicitly RCU managed objects which can
  * be visible even after the last reference has been dropped and the object
  * is heading towards destruction.
  *
@@ -147,7 +147,7 @@
  * All reference count increment/decrement operations are unconditional and
  * only verified after the fact. This optimizes for the good case and takes
  * the occasional race vs. a dead or already saturated refcount into
- * account. The saturation and dead zones are large enough to accomodate
+ * account. The saturation and dead zones are large enough to accommodate
  * for that.
  *
  * Memory ordering
diff --git a/lib/textsearch.c b/lib/textsearch.c
index f68dea8806be..3ac47026d6ab 100644
--- a/lib/textsearch.c
+++ b/lib/textsearch.c
@@ -60,7 +60,7 @@
  *   to perform case insensitive matching. But it might slow down
  *   performance of algorithm, so you should use it at own your risk.
  *   The returned configuration may then be used for an arbitrary
- *   amount of times and even in parallel as long as a separate struct
+ *   number of times and even in parallel as long as a separate struct
  *   ts_state variable is provided to every instance.
  *
  *   The actual search is performed by either calling
-- 
2.48.1


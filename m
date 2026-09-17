Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDC545DAB;
	Thu, 17 Sep 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652884; cv=none; b=tX2xJiDge12D/u1ZJd1U8J+7oNvaKhSr0taLs+StbDfTjlpjA75kfnKQ/u6WugPAS1fau/3wCcgj7cj0eYa0/6q1/uBd6BP/92PtlhTrUNBHIODAaUkDR1O/gBO+WqavuYNShlMKcR6qI40IfrpWBAa+o76aQH8JnUdi8tgz6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652884; c=relaxed/simple;
	bh=p24D+Y5mMAxUcwtK7qfgEk0iOjQX9ouDJmkvpzS+HXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DniurPidcg9szPXJgrW7VgFa8b6jWEBU57Bsn06q3svO5xces8qKoIcJ/FAS411RRfvMdgscfQMfy2AcZ6hIxe46wRn5wM+82Tuoiq7hDSyMvL6Stdf8QVJA6Cj52/YYvRJMw+6zxIGVelOTocIOEJ+dAVKLjj5WXSH11J5Tef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=AS80hN1X; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="AS80hN1X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=nPjOXpzA/XnC1Tb4O4aCY53qynGLKUHPRgytpT1S63A=; b=AS80hN1X/D0p5tmjULL2+XTpFU
	SwHLhpq05pRXs+GrgUJcXEKZ8WX30VStxQ9nFXOHZAZMLiwwgL+ns512tTOFPklYXp1NXsVT7b+Sd
	QOqjx21GroC0F9lTIHv1sf6AJjaK+c8Xv+LA1haXEeCjH6IN2LmAXL/UJmLkafBkUAWuS82aLTDHx
	I2YC+YNVLjU0GYqmwcsvqs70aT5N+7D+qTruLNZ7KLgwboc6DUIHNkHZ/gJiyY79CzohoS/Ar6ffZ
	x1t74FqQmLLKCR62SXe8hxw9ig3Ua/y9fmAbd8zjS2M8vRZCq4Gk8FgFfeM26m1kUPqGxDSR7X3Fu
	f/6c5BZQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7CSy-005zBf-15;
	Thu, 17 Sep 2026 13:47:57 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 17 Sep 2026 06:47:36 -0700
Subject: [PATCH 2/3] Documentation: kmemleak: fix stale statements about
 scanning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-kmemleak-doc-v1-2-84fde6d1f749@debian.org>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
In-Reply-To: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852; i=leitao@debian.org;
 h=from:subject:message-id; bh=p24D+Y5mMAxUcwtK7qfgEk0iOjQX9ouDJmkvpzS+HXs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqq+970Fp97dAda87X6OngoqU3eRhC2dhmhroPo
 xigP+AGHgmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqvvewAKCRA1o5Of/Hh3
 bWKqD/4w8CiiSkOwxv7iO2uPBGQ/tekba9aTlo2+PySjYKXcHo100mEBxl09ukUdpjObFFkB4xG
 hBS5f9+G44gxRvry7D/ciz9QoBylUviDYkkRahoxdyKSUNAVIXd31JDGP9zd5ukQREQa7872TH1
 iMJFUYYgo1185Y5A4EwxtT5CRwa51CJoVaGIhtWkR600C11v7uzjo69LKi3TW2u7/XvWYp1LHxB
 zaMv+ga46OOmvnLQi962t+5jsEgYVIxm0PpdaztffKfMPheFQKE6COYPY1Ju3+CEZPaL2d7uut+
 q51fic9sjP+lHbqIH3CsiijWSLM9W0c7HJhsbKReqThxxcmRy6AJ94vgIHarlyEQymomocrmBMe
 QuULRu0r6L4fezH92SXyHyK3CnAKboPsmHYfmZsUnFvtKSzS7j8doRjlPLo7ScwAA+J/relfETo
 O3Im8ZO8vlrUsqy8IjXGN8fX9y2gwekfSA23tkQG4M85dXsMZuWHR7nOp2+Xg8IcxpoByt4SZtq
 d5r48CTCptw97wuJ9HV0QqLMvIvOTEFRHphZ9CksLhJ68rZgBHQ3F+zpDnPqquWkWfgU66C5O05
 PxI3Lcy/9IPWwQq09nU0Q5V4rJl7SumCAjphf5WZdRaZ+eEYYREH8n2SuLVP37BeRrHH6kyLxSu
 S6HMBQ/GBjUI5bg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Three statements in the "false positives/negatives" and "Limitations"
sections have never matched the code:

 - task stack scanning is on by default (kmemleak_stack_scan = 1), as
   the parameter list earlier in the same document already states;

 - MSECS_MIN_AGE has been 5000, not 1000, since the initial commit;

 - scanning is done by a periodic kthread. Reading the debugfs file
   only lists what the last scan found; kmemleak_open() calls
   seq_open() and never scans.

Fixes: 04f70336c80c ("kmemleak: Add documentation on the memory leak detector")
Fixes: e0a2a1601bec ("kmemleak: Enable task stacks scanning by default")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/dev-tools/kmemleak.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index 8dad7647742d3..b5fe7e671d0f8 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -190,7 +190,8 @@ reported by kmemleak because values found during the memory scanning
 point to such objects. To reduce the number of false negatives, kmemleak
 provides the kmemleak_ignore, kmemleak_scan_area, kmemleak_no_scan and
 kmemleak_erase functions (see above). The task stacks also increase the
-amount of false negatives and their scanning is not enabled by default.
+amount of false negatives and their scanning is enabled by default; it
+can be turned off with ``stack=off``.
 
 The false positives are objects wrongly reported as being memory leaks
 (orphan). For objects known not to be leaks, kmemleak provides the
@@ -200,7 +201,7 @@ longer be scanned.
 
 Some of the reported leaks are only transient, especially on SMP
 systems, because of pointers temporarily stored in CPU registers or
-stacks. Kmemleak defines MSECS_MIN_AGE (defaulting to 1000) representing
+stacks. Kmemleak defines MSECS_MIN_AGE (defaulting to 5000) representing
 the minimum age of an object to be reported as a memory leak.
 
 The ``min_unref_scans`` module parameter requires an object to be seen
@@ -217,8 +218,10 @@ Limitations and Drawbacks
 -------------------------
 
 The main drawback is the reduced performance of memory allocation and
-freeing. To avoid other penalties, the memory scanning is only performed
-when the /sys/kernel/debug/kmemleak file is read. Anyway, this tool is
+freeing. To avoid other penalties, the memory scanning is performed by a
+periodic thread rather than on every allocation. Reading the
+/sys/kernel/debug/kmemleak file only lists the objects found by the last
+scan; writing ``scan`` to it triggers a new one. Anyway, this tool is
 intended for debugging purposes where the performance might not be the
 most important requirement.
 

-- 
2.53.0-Meta


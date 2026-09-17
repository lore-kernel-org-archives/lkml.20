Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33754DAC0;
	Thu, 17 Sep 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652890; cv=none; b=Kf0YuXBz3dFhlf5tBBJafArw2PZEV/VIPMvpmrH0uSIqI1fdrw0C+wdg259gtNfzS5a2YLftgsl1DhZL/Cji5rryiQxjbuWk6csMekc8zd5vk4jnV9j5XUu04QriliOlt3BfYxOn7+oYx5GiPuBGamKAsgIUSxXoKUOK6+LGLTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652890; c=relaxed/simple;
	bh=+q6xDl34YUOS8Avf5cU8XdLmZVvvs+tZYTzpjpHrFfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8hMVkQl3fvSjB5mXo311wXQxOuf+xZ1pP7P9vBh3Yz6BGqgOiAg96gnzgf7f/R3yS7JUg9qRww4+zOfrpGpUDgf8d6a6HcRLfNQiAVeJcfL9h5XgzyurDiNiV3H9b+0y0QSPKn1AHrx+fBqcicvoywlXKlLMqLZkTO5BaXTKqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=AJQr/362; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="AJQr/362"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=FJzQcNI6ERpoXaAHSV1A2WIicaI84oaHobrpffLzFwo=; b=AJQr/362+8Dn/1bQmS3G6lbGp9
	TQhbJJirbYuCXe79pG2OsxmjdEIi6JcALZvo57jSw1uhKe9RFGPJw30oEcnRKXHHNaAzFC+gTUHhj
	KDHi01VMQK1ej46sFVY5tYAPnueEnTfkRUcWEWxUEYBqtOZDOjeuXLT2SRSD2TOZY0r+H/Dgcib6C
	fAsu9JS0QREFQk8gteX2rDKndhp4XeGbolWPn0WzntUgO8z76QlUyIZdJWDemmsVZfgzJsvSiEhcA
	LHUNlW3wPsyeXpd2njRns35wwSaIdUjo5pa40ulSxNPEYVVj+7uMKgC02Oqd6PnXCIoCyippBQNZl
	TAgrazaQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7CT4-005zBu-0p;
	Thu, 17 Sep 2026 13:48:03 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 17 Sep 2026 06:47:37 -0700
Subject: [PATCH 3/3] mm: kmemleak: raise min_unref_scans to 3 for verbose
 auto-scan
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472; i=leitao@debian.org;
 h=from:subject:message-id; bh=+q6xDl34YUOS8Avf5cU8XdLmZVvvs+tZYTzpjpHrFfE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqq+97HiS12bKDm59NAUX6612dYs4+CKNi1kW0B
 Sye5XuP6jWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqvvewAKCRA1o5Of/Hh3
 bRXZD/9gOr2ZVF/m47Q7MyVKTJ/pd5BoLlLNCHSYpmV1T8x5aMO9Pc6TVnsLOVtlO3cpWIA7+YN
 fanPS0vkin+q7U47J2sLd7XHMVOEGmEE7Qr0MZ1c4GcTZpg/edkYDZgQ2Rjtd/wigKKdyl0a44/
 3uKSmBukPPCeq+E2F7yx87ERv5NANBYmU1crrR1O3imSN6PDVWiZtXM7Y9PtByrSc/bcJl70Q/5
 zkpns8QDBr/QgSclq8oWGlva5LQt8bZIqRKz+VwngVR97OOX7y1H6KSBZGQaCmyhEy1AgvjDEMT
 f4FVVk242Z93y7HdXp2W9ZHNhdcenhDoQrlTJcqsrpFQRv4fTt8tfwD/IuNuX9Rfv7XIO5rBxEq
 UIDPmahLS9rXcQk+pOSSHV4cGogL66IEPC52bGcRlPNyGdE2rcuJr7CqtU6gWYxMLtuhQwZcYW/
 gT05/1Rz8p39fm8ccG930jhfh/uNteROrYxEE8r7Z1Uh0yp6smXjt9IavDkHyt4ljbz4QDVXN1g
 bX0kvFKB0eDTlPw8R3o9ct57FyoqFTCE/3PFtB3hPCuwrevYTfdun50E3AFy1uaKaea1UiAprJH
 4/o+AWUdDBxBAn9QuWm645trNK/QV2k8aZ0JpS5oqbHLE2GK23ba6FYH/FeDn7LYNdbcKu8+bgb
 EYLTQSDazJ6jmAQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

CONFIG_DEBUG_KMEMLEAK_VERBOSE sends every report to the console, so a
transient false positive there is broadcast to whatever collects the
kernel log rather than sitting in the debugfs file until someone looks.
That asymmetry justifies being more conservative than the general case.

Require one more consecutive unreferenced scan before reporting. The
only cost is that a genuine leak is reported one scan interval later
(600s by default); the value stays writable at run time through the
module parameter.

Kernels without CONFIG_DEBUG_KMEMLEAK_VERBOSE keep reporting on the
first unreferenced scan.

I've been running constant upstream kernel with
CONFIG_DEBUG_KMEMLEAK_VERBOSE set, and I am still seeing some rare false
positive, that goes away with min_unref_scans=3, so, making it the
default based on my heuristic.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/dev-tools/kmemleak.rst | 2 +-
 mm/kmemleak.c                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index b5fe7e671d0f8..c0d3293723425 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -206,7 +206,7 @@ the minimum age of an object to be reported as a memory leak.
 
 The ``min_unref_scans`` module parameter requires an object to be seen
 unreferenced in that many consecutive scans before it is reported. It
-defaults to 2 when CONFIG_DEBUG_KMEMLEAK_VERBOSE is enabled, where the
+defaults to 3 when CONFIG_DEBUG_KMEMLEAK_VERBOSE is enabled, where the
 periodic scan thread confirms a leak on its own, and to 1 otherwise. A
 value of 1 preserves the historical behaviour; higher values filter the
 transient false positives described above, at the cost of delaying genuine
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb2..5d0daea93c471 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -238,7 +238,7 @@ static struct task_struct *scan_thread;
 static unsigned long jiffies_min_age;
 /* consecutive scans an object must stay unreferenced before reporting */
 static unsigned int min_unref_scans =
-	IS_ENABLED(CONFIG_DEBUG_KMEMLEAK_VERBOSE) ? 2 : 1;
+	IS_ENABLED(CONFIG_DEBUG_KMEMLEAK_VERBOSE) ? 3 : 1;
 module_param(min_unref_scans, uint, 0644);
 static unsigned long jiffies_last_scan;
 /* delay between automatic memory scannings */

-- 
2.53.0-Meta


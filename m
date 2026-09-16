Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D73ABD99
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524583; cv=none; b=nGH8G76tOlMBeCGNO3fRS07XSNqurcodJKtOvYDqOalw5EH6F07dgtUJjAQiGjMOJap2ror1KVx2yTHa4/Gv0KJI1y/gKE8VvbosQ5/smx5qOybvnmrCIl77gklf3iSm+hh3xyjA4L2vS1fDoEWcIx39hRVBS7FMxNCZsTeGtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524583; c=relaxed/simple;
	bh=GST4ISMHZzno2P1PtHld+0aPdYxv52LGSW3WUhkl/i4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jfl70G/22Mal437l/7GBJbg0HebBEBzqJGdIlwsgh0gXdUlANLikmdp6J0RdZlMXRO6AdAAuVam2a2fSwTt4ZAWGYSgl1AYRSi2eg9C3IlEOEduC5ClZmqV/E0DdGxutzDo4bsUPFC4xAsUJdxztSZtHVjoMir5Owc4ogBemj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VYszj0Co; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VYszj0Co"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789524569; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dwqpCx9lH7Ym6+m7GkBa69o999ileLX/V37t+mEITYs=;
	b=VYszj0CoX2P0uOj0Lh3vf/luC/yLoOrb1usJMrSNJPqmU4/byIB8jftIYl30Q+t/+gV/TfioFbpSsMGDBUqWxP8ftG2+waY6E/cpbi8pnemmUYbVdBztKjP5J8/zP/UX8KSNXTTZy5XOFKo8yM/rMgPEtnzhsOYcSACg5c+Efek=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XB3TS9o_1789524568;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XB3TS9o_1789524568 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 10:09:28 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] checkpatch: don't flag ACQUIRE_ERR() assignments in if conditions
Date: Wed, 16 Sep 2026 10:09:21 +0800
Message-ID: <20260916020921.3480730-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACQUIRE_ERR() and its wrappers, PM_RUNTIME_ACQUIRE_ERR() and
IIO_DEV_ACQUIRE_FAILED(), report whether a conditional cleanup.h guard
was acquired, and drivers consume the result directly in an if
condition:

	if ((rc = ACQUIRE_ERR(mutex_intr, &lock)))
		return rc;

That combined form is the established style at the 49 in-tree call
sites under drivers/cxl and drivers/pci/tsm.c, so ASSIGN_IN_IF fires
there only as a false positive, and every patch touching those lines
carries noise that reviewers have to wave off manually.

Skip the check when the assigned expression is a call to a macro from
that family, matched by the *_ACQUIRE_ERR() / *_ACQUIRE_FAILED() naming
convention of its wrappers. Plain assignments and near-miss identifiers
still get flagged.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
Discussion leading to this patch, where the false positive showed up on
a cxl patch and covering the wrapper macros was requested as well:

https://lore.kernel.org/linux-cxl/20260910094017.4032170-3-kanie@linux.alibaba.com/

 scripts/checkpatch.pl | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..fbc500bcfaa1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5777,7 +5777,12 @@ sub process {
 			my ($s, $c) = ($stat, $cond);
 			my $fixed_assign_in_if = 0;
 
-			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s) {
+			# ACQUIRE_ERR() and its wrappers, e.g. PM_RUNTIME_ACQUIRE_ERR()
+			# and IIO_DEV_ACQUIRE_FAILED(), are intended to be evaluated in
+			# an if condition, with the error assigned in the condition:
+			#	if ((rc = ACQUIRE_ERR(name, &lock)))
+			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s &&
+			    $c !~ /=\s*\w*ACQUIRE_(?:ERR|FAILED)\s*\(/) {
 				if (ERROR("ASSIGN_IN_IF",
 					  "do not use assignment in if condition\n" . $herecurr) &&
 				    $fix && $perl_version_ok) {

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.43.7


Received: from va-2-45.ptr.blmpb.com (va-2-45.ptr.blmpb.com [209.127.231.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30754EBAF0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787818; cv=none; b=ErU25qFhxk8jFM6n4veXNu1CAzvhGoMq4KKYHT6HsvDSU9H6MGbzpY9DxfKK0/dGYXzMM0QgCGU5MwSfi1cxmwyFQ3NJtjO8MZYzKXpCQFIC+I3QbvmvtSOZNMBf2K0nq30Op55P/x9kU3VYfq7m7FqjMVTiyGXEetvPatxLVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787818; c=relaxed/simple;
	bh=2o94ag1pxiGFvCcZUHhrnuOMseH5CA9gXOP1T+w+3HM=;
	h=Mime-Version:Message-Id:Content-Type:Subject:Cc:Date:To:From; b=hqniliZrfk+hmw1t/e6yaKyzcLuTR70b31ip1JmHJVwN56SG3UtINajIv0P3YwS+CRXNi6ADLEjj9N+P8Qsnll2s3K9OBYb3KUorcDXM97FOPTgLXWaWmqeVc56P5658529AKj8+Ywv0ZVBkiPC8niIY+Gwx7pnEbj7uihRpZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=cN5YcfSB; arc=none smtp.client-ip=209.127.231.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="cN5YcfSB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1788787798;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/GpHCbXtNfscam0NFW4Yj3UiXi2iRdayHHdEYII1B8A=;
 b=cN5YcfSBFpq5HaQbS9NffZRqS9uUML/XWMMi0KyLhLt9XlLk9/k6UbEFXYtfm76n2mQx54
 x9zRybKldoMApv0XFIfgmME9NX4otSgJqaEqIWt0cTJ2S//QtlMceYqESLHZafr1VEvQ8m
 sqjMYOxKJZx3U1XUkf/w+35EqBGTSYMvxN1HPA0gl9a1gmYUyuivW8qzNR1vNN7VA5IOtt
 loNXHRl2BV5tQa0+LqIWHgaYYvP440xB4IOiHCQmhD7UO96cc54iPGS7tiz//kpV7De6fb
 v9ZFr+fyW0HTJPZ994guXNdS1ziZVSvAv1rX2DY7ie+mfu/7yPQeoJ3sZOTbLA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Jin Li <jinli@lanxincomputing.com>
X-Mailer: git-send-email 2.53.0
Message-Id: <20260907132853.3596858-1-jinli@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH] selftests: core: Fix unshare_test on systems with max nr_open
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Jin Li" <jinli@lanxincomputing.com>
Date: Mon,  7 Sep 2026 13:28:53 +0000
X-Lms-Return-Path: <lba+26a9ebc54+1b672f+vger.kernel.org+jinli@lanxincomputing.com>
To: "Shuah Khan" <shuah@kernel.org>
Received: from ubuntu ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Mon, 07 Sep 2026 21:29:56 +0800
From: "Jin Li" <jinli@lanxincomputing.com>

When nr_open is already set to INT_MAX, nr_open + 1024 overflows
and causes setrlimit to fail. This happens on systems where
fs.nr_open has been configured to its maximum value.

Add a check to detect this condition. If nr_open is near INT_MAX,
skip increasing fs.nr_open and use a fallback value of 1048576
for RLIMIT_NOFILE instead, which is large enough for the test.

This fixes the test failure on systems with maxed-out nr_open.

Signed-off-by: Jin Li <jinli@lanxincomputing.com>
---
 tools/testing/selftests/core/unshare_test.c | 38 +++++++++++++++------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/core/unshare_test.c b/tools/testing/selftests/core/unshare_test.c
index ffce75a6c228..dcc61488e4dd 100644
--- a/tools/testing/selftests/core/unshare_test.c
+++ b/tools/testing/selftests/core/unshare_test.c
@@ -42,18 +42,34 @@ TEST(unshare_EMFILE)
 
 	ASSERT_EQ(0, getrlimit(RLIMIT_NOFILE, &rlimit));
 
-	/* bump fs.nr_open */
-	n2 = sprintf(buf2, "%d\n", nr_open + 1024);
-	lseek(fd, 0, SEEK_SET);
-	write(fd, buf2, n2);
-
-	/* bump ulimit -n */
-	rlimit.rlim_cur = nr_open + 1024;
-	rlimit.rlim_max = nr_open + 1024;
-	EXPECT_EQ(0, setrlimit(RLIMIT_NOFILE, &rlimit)) {
+	/*
+	 * Only bump fs.nr_open and RLIMIT_NOFILE if nr_open is not already
+	 * at or near INT_MAX. Adding 1024 to INT_MAX would overflow.
+	 */
+	if (nr_open < INT_MAX - 1024) {
+		n2 = sprintf(buf2, "%d\n", nr_open + 1024);
 		lseek(fd, 0, SEEK_SET);
-		write(fd, buf, n);
-		exit(EXIT_FAILURE);
+		write(fd, buf2, n2);
+
+		rlimit.rlim_cur = nr_open + 1024;
+		rlimit.rlim_max = nr_open + 1024;
+		EXPECT_EQ(0, setrlimit(RLIMIT_NOFILE, &rlimit)) {
+			lseek(fd, 0, SEEK_SET);
+			write(fd, buf, n);
+			exit(EXIT_FAILURE);
+		}
+	} else {
+		/*
+		 * If nr_open is already at maximum, use a fallback value
+		 * for RLIMIT_NOFILE that is large enough for the test.
+		 */
+		rlimit.rlim_cur = 1048576;
+		rlimit.rlim_max = 1048576;
+		EXPECT_EQ(0, setrlimit(RLIMIT_NOFILE, &rlimit)) {
+			lseek(fd, 0, SEEK_SET);
+			write(fd, buf, n);
+			exit(EXIT_FAILURE);
+		}
 	}
 
 	/* get a descriptor past the old fs.nr_open */
-- 
2.53.0

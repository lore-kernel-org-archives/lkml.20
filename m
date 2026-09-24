Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE246485936
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251810; cv=none; b=QXw3b+K9M8cDnWHmLfHytkpHV1DfUSxdvxglw1ZuEQVSBghKLBlcQ4kdcqje9bhjCA5cYhM0Mio8OfCXb9JpVnZzHDVenBC9GQAUclxZiJjBnFHWXnGSe780frCnWFYbvM12ZE7mPqKdL+0I0beY94FuLFQVJAHm4ZsRsJdas5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251810; c=relaxed/simple;
	bh=eUWJsg1zsooAzgeGfXboVcrvWw1eYTP66U9U6sf0dKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwFFJQZBk7OyfikGar3cod5QXTzToNQpbHSns2usgeQmSQwkzH+hamPfS1gbhV+6OUQyB85ZXpNIGiTfA7Wg4gqRGUC4HMZTTzqZbGvzl06m3dOIcIzC9ng6VCXrZG6qcznSTqCyaLNf+VV7lIxF53nHcI3q5pHurMqlolpXG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoQ5Oomr; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoQ5Oomr"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6bd42f1c01cso1134252eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251807; x=1790856607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ax0qVloBz/Ob0q1phBWfblEo0M91ubq93T1eoxfqLyQ=;
        b=NoQ5Oomrxv9m8QIPWmmIjfAWgy4WwnLz0cXIfO+h/er4WLkWm+9JqTOzqyKBDdPh8B
         cGh3PuhbX/sB0t1nTFXEBS/swnpnKwCJGTyioY4bUwUqs477FvUdWROEBYq8KdHs7Gtw
         5vKV7EFHxjuYy8GlJaWHH+JURLA9tnEbepFNXGd70XeKZSzNSzYNVAto15HZ3Rp8EkT5
         d/8bddadpkgrVBpVFf/tSXK1E50QBjeP/HuddcwnAyBnDAtVszIUTocXhJ8e3o0I3VZK
         q3VNmAWdy7dn/SGyQ03GX3nM6Hm2QIdDeIxM+hg1LEMJlj0dnWoMyBYnhJQCqqghQdt3
         yhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251807; x=1790856607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ax0qVloBz/Ob0q1phBWfblEo0M91ubq93T1eoxfqLyQ=;
        b=GSBzd3fKJWHwKF4LSPVxn20viX8sfBKMJszAKtZOiSfxdPWHan/0yq9pF2MiuVo/GQ
         fBKlkOGpaPjMQqgT+xDDhUZtCNyhPmeR8yU5H7cr5x7lemELcpknL5dF1D3zpotmIztQ
         xrN6z+iXczSNDBVzsIzwwYH8Iii4ErDZKCBQEccoyy5+U7abDjsU7wctvmqkH08BFnEf
         aPPXNqYyfmlT9i9Jg8dZF8UkyZHty1f6Ii9kXbQHpls9ENZeb31U+99L6dZT6DlmS/QC
         L/z8v1lz7mVf3J/X0KeuowlsldjAJKYhvs2LWe8dlJfwtCuQrOziOOaUQVhd2d+JgKuX
         cMmA==
X-Forwarded-Encrypted: i=1; AKwUvBx3gAeVJmrariiAjAiq470Y5MJWWkmwHaK3z4qGmHgEz2wi8QLKHwqKI+HxyIkohwg/2Fl8MgxyPIIig5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nzSA9xAQm6GY/Zldt4oRB1OBHLbo/i0UOFtm7DPZAn5SIEoylZ
	b3K63dq5sBmEpqN6bWvlNp1cu2UvF/GuohgE1v83ZDQ32KZI9t+T43Vb
X-Gm-Gg: AYBFou2VPgelAKkMnkN4ycgX8DG4TvaiCISFhJH9i3rMAk3CjXhtmbAn6h2HaeQYAKE
	QjosFWZJhRblg+c8SsWGENQ9NcDPrcwmsPF0Z2p8pJZAxBegEeOeEacAhzXJNc6bJrAAFzfHu8l
	Q2xzvK/Q2mivrMvUk8EK1aQ570fOggrpH8yRnNLNGpoHcu73UxZOna/XmEN7fDXsRwldPz0aoFR
	0JVYR9yOwrlzMrtngOVcvvb9iW//zq8O9IKhnZP/yu1uE0641IRv2hiLypymW+2K/gso9gwI6Dn
	GYeN2IDPYDKn4qgywCIHHfRLXYDnRNFdmu4yIRf7LngJ6pw2gxQcIi1Jg8cRlAK3AB9PLJ+nVBN
	FIaUEMkVrSAEbivC6xVphl7b3uqJgbfaln8NdUt7IGHtzG4xyWLXF3JDT3mDQ8Q2nSGpDeQpyha
	RKyhNul/+GfUzg4HcdzU6dE4Ob5ChHUMw5cRTnLi1iB9giJUiasMe3T4Zwr1762iz+7oyCrkk1g
	wSUk1iT9Dz7TL5wlSBc3+6MUeq34jwITr9ZdHBP
X-Received: by 2002:a4a:e90c:0:b0:6c9:d43e:a703 with SMTP id 006d021491bc7-6d43f4bf666mr2265425eaf.33.1790251807333;
        Thu, 24 Sep 2026 05:10:07 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f94sm5018070eaf.8.2026.09.24.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:05 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests/nolibc: add a test for errx()
Date: Thu, 24 Sep 2026 07:09:58 -0500
Message-ID: <20260924120958.23698-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924120958.23698-1-danishkhateeb03@gmail.com>
References: <20260924120958.23698-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nolibc-test does not call any of the err.h functions, so nothing
noticed that verrx(), and errx() through it, printed their messages
with the wrong arguments, or crashed.

Add a test that calls errx() in a child with stderr redirected to a
pipe, and checks the exit status and the message.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 37c11a7fce23..1447c2e39af5 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -32,6 +32,7 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
+#include <err.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <poll.h>
@@ -2223,6 +2224,51 @@ int test_asprintf(void)
 	return 0;
 }
 
+int test_errx(void)
+{
+	char buf[100], expected[100];
+	int pipefd[2], status;
+	ssize_t len;
+	pid_t pid;
+
+	if (pipe(pipefd) == -1)
+		return 1;
+
+	/* flush the printf buffer to avoid child flush it */
+	fflush(stdout);
+	fflush(stderr);
+
+	pid = fork();
+	if (pid == -1) {
+		close(pipefd[0]);
+		close(pipefd[1]);
+		return 2;
+	}
+
+	if (pid == 0) {
+		dup2(pipefd[1], STDERR_FILENO);
+		errx(42, "%d %s", 1234, "foo");
+	}
+
+	close(pipefd[1]);
+	pid = waitpid(pid, &status, 0);
+	len = read(pipefd[0], buf, sizeof(buf) - 1);
+	close(pipefd[0]);
+
+	if (pid == -1 || !WIFEXITED(status) || WEXITSTATUS(status) != 42)
+		return 3;
+
+	if (len == -1)
+		return 4;
+	buf[len] = 0;
+
+	snprintf(expected, sizeof(expected), "%s: 1234 foo\n", program_invocation_short_name);
+	if (strcmp(buf, expected) != 0)
+		return 5;
+
+	return 0;
+}
+
 static int run_printf(int min, int max)
 {
 	int test;
@@ -2287,6 +2333,7 @@ static int run_printf(int min, int max)
 		CASE_TEST(scanf);        EXPECT_ZR(1, test_scanf()); break;
 		CASE_TEST(printf_error); EXPECT_ZR(1, test_printf_error()); break;
 		CASE_TEST(asprintf);     EXPECT_ZR(1, test_asprintf()); break;
+		CASE_TEST(errx);         EXPECT_ZR(1, test_errx()); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */
-- 
2.55.0


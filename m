Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914649;
	b=HdOl25d5TaQnw9F+ZTES/R/QxPOJk4c31dL4+v2ZQXP1fYD9eluGkOpKG11Dzz9ZY99w
	 DsizT/tIq7g7suoMTMMsZVUIjbBqtAAJL9LSN4MiV1i+GS9kyo7kaNNQ14n00fLhz+fiQ
	 ZmbdWiv0Ayz/9sd2eqQLhOzBcFggixGkksHPaNZwjdVpQxSGntd7NC28wcjeyVGQWWZ6q
	 rrj0G2dXrVkKjl9dxFgvjwFkLXQJ5OeYKutxihr4xmIfQMtI0RHhbp74kdHdGKEtfhJVM
	 dfsYf14cOeGt4ikrmRhJ4m62kJgUU39ypuvCJ5DzoW9K5oPtk0TdLb+e2W/qzzmEvCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
	b=VdSt9NCa+5bPybwAjqFiGgImeSne75c7Xx9WQrN2AKBNZh7FHF5bQSF0oPTY/q74GZb3
	 +5er/rNCT5j7vdA23nlxjjfbacPBY4F/kEldw1DduyLSAlAK+57Q8bJ0CZZqbbjXDlg1d
	 mQqkDYEmq39EyUQm3EA7xeLP3+BIVwfLsAQRS73d1TcGvcX1FlKhJfuKUfmmvuIKwyNw9
	 W6oDqSoM+6ree+RiWhbUn7Z2S3LniFRbM9iqmQ2kZ91CF5owwa9ELp6m1o4/ciJ1Q7rja
	 Hp2PvQFhzEBMwS4Jc8pVBe3qVk6SdEaYRT3smsmKAVJxzB3gYJCUH3GvJL1rELuj9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU9D4xZQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169D606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E169D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU9D4xZQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso3365192eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792914648; x=1793519448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
        b=ZU9D4xZQT9lRNzJIr0ql9vXLWN16FNvjZngwe3GrKVd/CkwklZ252VjyPTMyxakg9o
         iacgLUa6eSniXyNb41gMlUTdOtXLYcpdyEMYWEi9nrr0oOzXXSPaeJWbgAcwGXJCcjkM
         Vt+d0vAVPMVhR4/Ywl+vs22ZZbKY2KRzAcdbzVkv5iltNWMglPoPuxxZuTZ3dTclNuXK
         s0yQlT/qzXD3IyFmDukHYBfDX9Id3/D0dWEU8dA5tFBcgE0a7aWc5+a8e4wTLA4mJwIr
         nFXzrg/C5StE0K24XJoBbv40rP3Zvu71CA/gm4JFmbjQqRSKf9QcgOizACAZkxUZhO6/
         SQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792914648; x=1793519448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw8iT3vjQ6v6/N4nQ3kAFOKgih6vtaYdBPaT8XNpq84=;
        b=2JgcZ8ZRToypMhFyiPqXDHwK+XnLrUbdsxv9JUBha+z30M4k9szT9bgBZwJhc/t6KL
         oIIhYoJjnTUVAzDKQsHu1/fy7euAWtOdQYeATN0qXB5XzvCQvfhudhOq+M9Yjmir9ckb
         ndrDvzDzYOP1TFT21WOi4rZELJ863pfua6dBmU0h9SZOcsB7qCCMZq4plMhaz4i11DsM
         iIiFTLv5IQsgfDzfSEDsRcJYRM80OnGevfKtVcnUPQOsNZGCk+/BpDNw2l8QY+EryO8D
         MCofNpbsqV5hmTa1RqL1Lq0bV0YN9wlwiw0EDah9D12Q3YCzSWWnBfpmfG1I0JvTZPmh
         aZjA==
X-Gm-Message-State: AFq9FYLiV+t3REeI0JQgfqZZxakCm4RV5N3RpR6EbX4nDZK2EK4nYvjY
	xrXOy3K4mAl6TJpLPLR/SJXrLa0UNr3Vr2mar3PH4XMA1eVJEdM2GL17
X-Gm-Gg: AYBFou27inwpJidvaqAE78uF3r4rjxyFcsfp2qx+t75XGywq1qvkdgGShNVqK+5XJeK
	yn/sLZR8Z4e+CrX4p+W0YI/k04hi6oloGb5aLcjTuyLQ0PmteHvJrBP1oISPm3d1MqcvTj+zg7F
	/0Anw7lzRoQeaF9eZRhw5gXoiDBZNAVxjQg2KvYc1csh8vdZWRPVkSPsxjTbkTXSyEsqotKyVji
	64AmkygTa/BY2dIMMIkPxBaKebudIHIV0Ks1P66m+TunquwMKBiN2wh4g38X7OED6Exz7LXoj/N
	5O3ac/sR4MxogvSGnu3P/UYPfjWkofXJzX4Wypyn/BC1gfbzULA0eycYTZWg1+v9W306fNBOeD0
	YBADtKxy5fRJ+SGgj4IRNXUGWJTF1f92JjpZ6nM4DSsbFSxYQrK5SRPzIJPvkOoK2e+RjVQKO7K
	9fttHDaOPitKTWXA40khCM4U+pU/am+HPN9NKSKEJc8EvJD9kugWNyfwMQ7IeoPo+//v6zvi+19
	pr37ve9IPIjmvQi+j3EHwrAX0qFa/FOHUng/UrItkHUiHwjwrut0Kc=
X-Received: by 2002:a05:693c:880d:10b0:35c:ceb0:8bf8 with SMTP id 5a478bee46e88-369e849280dmr5082964eec.9.1792914647783;
        Sun, 25 Oct 2026 00:50:47 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c572bbsm14791299eec.2.2026.10.25.00.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:50:47 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Add missing spaces after ! in probe syntax tests
Date: Sun, 25 Oct 2026 16:50:42 +0900
Message-ID: <20261025075044.1750113-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing space between ! and grep. Otherwise, the shell tries
to run !grep and reports "!grep: not found". This always skips the
conditional checks without checking for kernel return probe argument
support.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 .../selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc  | 4 ++--
 .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
index 384209968325..70751573e8de 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
@@ -33,7 +33,7 @@ check_error 'f vfs_read ^$stack10000'	# BAD_STACK_NUM
 
 check_error 'f vfs_read ^$arg10000'	# BAD_ARG_NUM
 
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read $retval ^$arg1' # BAD_VAR
 fi
 check_error 'f vfs_read ^$none_var'	# BAD_VAR
@@ -100,7 +100,7 @@ if grep -q "<argname>" README; then
 check_error 'f vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'f vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'f vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read%return ^$arg*'		# NOFENTRY_ARGS
 fi
 check_error 'f vfs_read ^hoge'			# NO_BTFARG
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
index b0e6b80ccb01..06efa67e01ff 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
@@ -108,7 +108,7 @@ if grep -q "<argname>" README; then
 check_error 'p vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'p vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
 fi
 check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
-- 
2.43.0


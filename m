Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6914A1E05
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328214; cv=none; b=M39vfaUW4fGXHjWdSj2CC3Ez6fBIsK0KJS9lHuu11NAiCy3NHEvVHUim3nHcQOqSG0l3vc+1l8FQEcjBYtl8fUhL5KpBESVWWHzzZ4MPMF2VCp69rjCNPx0k7KlwGv0Rx54QMnQ6JhSkxeCzxG/enCcHjOQsafbkz1y3NzkHF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328214; c=relaxed/simple;
	bh=PksKvJSYmolkgiySGOXytWOGhgc2e/1kXd1gcpQcOvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlWsLU0k4oLv+GkFmxjQjaxAjc+ixylkEsVsuPWGrX3piue0R/C+ofImxM9ZQKlIGf7rr3z78dU3MMVOgGeQOkKi3cn/Ky/9BBzj/ga5HQ1PIlbhUp/T18oNDA8xdWQV+bXkA1vrDGZw8tXeOOzCQyPXMc8ZJ2L4OZaCjFCRSp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H57z7bI3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H57z7bI3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35d0be18c71so2522326eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328212; x=1792933012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/T5q56CR4R9vbTCEnqV1OrpsFX4ExiSjkWfLjOv1KM=;
        b=H57z7bI3rqLOD7Q+RAwrDxoIYjURL/DrGIuSAwQEks5jQ+0N1RTCnpq9SekJ8pdWLT
         u+OVD2XgLwC4RL1D4mCgldrADW9tP3qufK62xph4DlLNic9PgAwgnQrSECg1h5h+tSai
         f4USRafC5ElF+uUoCL34I2HiD+kjeHbgMz0A+xtSt1QWr0ywdw35cySNZVOMHgWhGzIU
         7DndNKRH68QjTtGMrMdmL1awp9SlALDWYhasVgRvqvmYi8Khtdl4GdeqXoPuphwRrKJW
         uYDvhkk+fffFrbeRdfV4xdrtPZ4k8dWktRsitrmBw3Yqpc2vJM9c1OlvflN5hobI/qBl
         at+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328212; x=1792933012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/T5q56CR4R9vbTCEnqV1OrpsFX4ExiSjkWfLjOv1KM=;
        b=ZEa8rq5Si+YcMXxPx054RUD1i1PvQrUJyB4hCxYSy4etWqSg2OhmHQY+Pd5iCI4c9y
         zM4c37XdnH+bChq5sVyCVWA0aE8dAN9eHSxlKrPY0KbtujegZyzcC08dQPnk/djF5r2d
         2+pjrjSooE1ruwsbOWUUO1M2VHVgasfmb1+091DOAbAKWFPO2tojnX+Y3nR7KwtQuvhz
         at9SODN6wWXwE7l5r/GwuSBB11f7VXGa465oQbbyne/Pw9NSM4VuyQ+z44w/31cGIuRF
         HOvFRQ4i6YLv1+U6dwdW7U0gYhz0l+jD+LoVsY1gyiyukiHHtn3Xa8CLqJ6Ad/AqUhFa
         qbtA==
X-Gm-Message-State: AFq9FYIUJZ50ISzdMZaWRSBCRFzIKR4YZZ4zvbGAhwG45L2zSkoqghy/
	z6UGmwmZO4FYmp9sJh+9irmFMzPld1oH87hx8BPpoKTFm2z0k1SAUF6UnzOHyedg
X-Gm-Gg: AYBFou2s3exsSVjFZ2MMGHOkXovgGbmU1f37tSi1WkzcVLHu3gR+XX2jA8PyqapYQJ5
	HOPaBQ7yvzg5aF7JfgG/NfFpgFBdSxJ1Pvg5HzshbnStX7EFimc4dgmUT7oFq0pFMj78wLrFgrF
	sGykm8pgywKhjt8C4M34zmjXMgEh9r/6PBkeenxuBTq/cis3qGx6x0wPWCzXM9Je54nlzcdKl0R
	nxqpO/oqye9RDkrgGPoqPWvbsw0fDwCveY+CVYzMXlBVow5XRZ092ISZLBLloSvHdP+jBUu73ss
	eJC4yl6Uw0TTDHme/Y/UlNaKMoRm9y/q1eaLP41w3oYiumANo81Ii4r7hrNwEu4s4You7ZdNxOe
	FI7N2BRX/GHIi5JPF6TCshkDlQgE71tQbECvgRjuWS9X6IR7cpfXtdpc8Xnb/3uuvdKZiYau+VB
	COsbmgd5v9rs0SWo2cjdpHolTmeC5JRAaHT6kdbqi8VopIOgEt1X400nOFUYuY2F/0V2fycEIoL
	p4KbN104YUimxdXQRWJVNAYFDVbV0mUO9QnQY3+dA==
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr13479073c88.16.1792328212122;
        Sun, 18 Oct 2026 05:56:52 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:56:51 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 1/5] perf/kselftest: convert prefix.pl to Python
Date: Sun, 18 Oct 2026 09:56:37 -0300
Message-ID: <20261018125641.23064-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018125641.23064-1-breno3011alves@gmail.com>
References: <20261018125641.23064-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of tools/testing/selftests/kselftest/
prefix.pl in Python 3 (stdlib only). Same unbuffered stdin-to-stdout
processing, same "# " prefix behavior.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 tools/testing/selftests/kselftest/prefix.py | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 tools/testing/selftests/kselftest/prefix.py

diff --git a/tools/testing/selftests/kselftest/prefix.py b/tools/testing/selftests/kselftest/prefix.py
new file mode 100755
index 000000000..2bf16b37d
--- /dev/null
+++ b/tools/testing/selftests/kselftest/prefix.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Prefix all lines with "# ", unbuffered.
+
+import sys
+
+
+def main():
+    needed = True
+    while True:
+        char = sys.stdin.buffer.read(1)
+        if not char:
+            return 0
+        if needed:
+            sys.stdout.buffer.write(b"# ")
+            needed = False
+        sys.stdout.buffer.write(char)
+        sys.stdout.buffer.flush()
+        if char == b"\n":
+            needed = True
+
+
+if __name__ == "__main__":
+    sys.exit(main())
\ No newline at end of file
-- 
2.43.0


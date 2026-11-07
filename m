Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028652;
	b=Bu00ea7yrz5vQ70wIRLDHUGOSSWCKvN9MtVqhNU5nuZu9lX9RT3cTLj78iVUqJPaHjWS
	 9+a/CY2AR9tDbW/2MGmqyl0hjQ5qMQab7RTQGqtC0PgkTcWCOq/0irjxA8xxuQm9v3pMv
	 5kxa1z39tZ8PQSfgoq/I0iI/nSO+VWRID4W3O252I6T4m06pmlqS/24gHFyG54xItedhl
	 e/v6KhpoRdmCBNEQe/KyuCnLuf1VMlNq8dcD8w/Vduuel3ZqUwp7sO0iCpShcUb8iwEAF
	 87tEIivAxPXeBGGt0okMETCKYzY6q5jnzQuZEHvwJz0mSIrEwObJxUECfGnOB/8yy1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
	b=oTXNiuMX574WNLdRvHHgHXqFaipVONhHeNfn2KyU3/v1zQ6GNCEwEg6g2A3PVFLHWqR7
	 FqDl01j6FFDS3z93KKr2qwyjV9iqD4++oRuo2oxmusQTbkr57RoTDSEml1P1JcNXA3P5C
	 Rrgpbo8HexVEHqmz/SdcVoou+KGKqyZf11IlCA+r91Nd7+s9O8ze+BNqdgUb7VlCcJi1p
	 4qxV+6kBfoX1eOAeC0zoTY47RBZatdtixO3TsmMnZD54whO5gbmUOjxBbMKiyQRFOPZug
	 GpMQuKZvVhKi9m4zk9Bqe9Pjh80IRuwl7bpIfFZ2f2nSrp58dKvgcLN14We3GlNTsrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfCNFqgs;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CD606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfCNFqgs
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-370a1bc464cso1326787eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028651; x=1794633451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
        b=YfCNFqgs5ptX7/y1e5eZqrklQ5J5QcziyQY0Zwzny3iWpwe8KXdKr/vfRo7lYjq2gz
         Hq7IBpo0aauTt27MrfleSQJmQvda0ZCUGMfKqRl8Z7Yp+bhYYQxCGftDRwNvzPZlXG3g
         H00hL8MdYQEoJLapglwe2tmYi39UpSuD+zpVZte99ild36cvusWMOjVMsXFYJ8zRqq+0
         te9bb9JNes2UThkOfAAI0xko/ZQRLiRtzzZ/qWrW2d9xtekiLzcX/RGUxrn3GzGg7yrt
         Gdp4xWx6Tu9RmbwU3qLnPatIEPW+20tZJu+ojp5nFlXz/iPe8SlMsaTSv7ZZKjY/033n
         aKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028651; x=1794633451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sF0UOsiio986g30iDrox1EkIxmIR+gJ1qG6PTCrxja4=;
        b=xTrm0stTeK8LhO6BVvb/kMO3ScZw4K/5Im3q0RTeT9eQ602bFEzEgJQbs0lJHj7R5z
         jMX3kJY7xC6UarVTBKlZHqHYPMfGHnlWZZfTYFHpZ3bu2XiFintrWpCmilt/oiyx5e9+
         JFIcpP5ZgNen4JuMJZcQ0vCEYOVb5spMqf2wDpZTqcB83ljHZrcmssgJo8kGUMmC/YXA
         qyuc219N6FJwksUdqquu/tjtuNcTxwgPZl4jYSCwVGgN1AM3+EEDlV6YCKrur7eyoF3x
         TprcTunm4Clw8KuId5slLsKUxGOPHKl46jma4BTqmo+l/Hpjz691vOANPZtX9zgKbVBk
         Bamw==
X-Forwarded-Encrypted: i=1; AKwUvBxE7/9Jy/UXPN4fcH7QIngTZvvYTqqCA+KyWHC85sUTq/Bnz9EQAwjObpqz0FpKXOXCoMkwmBhNIHSfuVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SklD9b3mqM9jOoSFVaAprq1xXOobBFCxhhuDsLwn9cBdRB1tv
	E8hKTfhFL8tSfEcUNLE6D8gdqnDCjlJ8cqWSmNVkxc9PYVzcHOC7R6Jv
X-Gm-Gg: AYBFou3yLOG6gyag2E1qZmDLa5sBGcxLUP7iCjarE3bs2OJ1Inwf4lzREUpwilrvs4H
	INGUDKeAF+TCvROoISjxeT3C2qqVp6QHcEdqlhNWRO3VqxZaH8ZiwXrflfjCJvXeWgPxcZ4jHU9
	yEX085Cll3Wo92112vPUwYFKCX3plMNsrBLkd6cI42dSjsI031wpyrHPxO+dpXXhkSO8zA40CGY
	1NIhMcPvjeTsgI5eFrqyVnm0NIRRSNUBYOvYHj9NVuo/OTQ7RkJ75LtByJ7stOEdrI9dSNimmoz
	oxtmn7M2lW4SKyTFnCOKTouJGKTzekdeMagrBiq5WGv2EffFGfNceWjL2vUJBNY4mzfw4Onw7P2
	CfEg/JKRTTXRrvA3BobO5N6XAvH6B5wToLtd+4h0MNv8L82NQEvGyRFVe3iwEAdO1IsZTHVG1KK
	3EkdpUi1Z31ZDt2LTyXxpvbjrdvo6kDinf2eemzJ+9fuXoNWo8vMjJAyzSkcNz0ZytnqF6JjzCN
	f90uHzYP+nX41pCug4WgVm4bS0ZMWh0WyNhIh+nR0v5fb/8JaUhdfvd6V5vdU1JHzbAMRe7W4IQ
	QUBkOpetReL8HsngmLP8DHC/hnv9b4n8nCKLzDG+
X-Received: by 2002:a05:7022:1005:b0:1b2:42ae:94fb with SMTP id a92af1059eb24-1b25d32fe07mr7188206c88.37.1794028650847;
        Fri, 06 Nov 2026 21:17:30 -0800 (PST)
Received: from SHAN.localdomain ([171.79.50.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm12135641c88.19.2026.11.06.21.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:17:29 -0800 (PST)
From: Shanmugapriyan S <sundar25sengai@gmail.com>
To: mchehab@kernel.org,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shanmugapriyan S <sundar25sengai@gmail.com>
Subject: [PATCH] jobserver: Handle read errors before claiming a slot
Date: Sat,  7 Nov 2026 05:17:07 +0000
Message-ID: <20261107051707.1311-1-sundar25sengai@gmail.com>
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

If os.read() fails with an error other than EWOULDBLOCK before any
jobserver tokens are collected, the error handler falls through to
self.jobs += slot. Since slot was never assigned, this raises
UnboundLocalError instead of gracefully disabling jobserver parallelism.

Keep returning collected tokens conditional, but reset the claim, warn, and
return for every unexpected read error. Add a regression test that injects
EIO on the first read.

OpenAI Codex assisted with finding the issue and developing the fix and
regression test.

Fixes: b2664a90c171 ("jobserver: Split up the big try: block")
Signed-off-by: Shanmugapriyan S <sundar25sengai@gmail.com>
---
 tools/lib/python/jobserver.py     |  6 ++---
 tools/unittests/test_jobserver.py | 43 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 tools/unittests/test_jobserver.py

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 7e94635bf..c8f220a36 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -154,9 +154,9 @@ class JobserverExec:
                 #
                 if self.jobs:
                     os.write(self.writer, self.jobs)
-                    self.claim = None
-                    warn('error reading from jobserver pipe', repr(e))
-                    return
+                self.claim = None
+                warn('error reading from jobserver pipe', repr(e))
+                return
             self.jobs += slot
         #
         # Add a bump for our caller's reserveration, since we're just going
diff --git a/tools/unittests/test_jobserver.py b/tools/unittests/test_jobserver.py
new file mode 100644
index 000000000..eafac510c
--- /dev/null
+++ b/tools/unittests/test_jobserver.py
@@ -0,0 +1,43 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Unit tests for the GNU make jobserver helper."""
+
+import errno
+import os
+import sys
+import unittest
+
+from unittest.mock import patch
+
+
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
+
+from jobserver import JobserverExec
+from unittest_helper import run_unittest
+
+
+class TestJobserverExec(unittest.TestCase):
+    """Test jobserver error handling."""
+
+    @patch.dict(os.environ, {"MAKEFLAGS": "--jobserver-auth=3,4"})
+    @patch("jobserver.warn")
+    @patch("jobserver.os.read", side_effect=OSError(errno.EIO, "I/O error"))
+    @patch("jobserver.os.open", return_value=5)
+    def test_read_error_without_claimed_jobs(self, mock_open, mock_read,
+                                             mock_warn):
+        """A first-read failure disables jobserver use without crashing."""
+        jobserver = JobserverExec()
+
+        jobserver.open()
+
+        self.assertIsNone(jobserver.claim)
+        mock_open.assert_called_once_with("/proc/self/fd/3",
+                                          os.O_RDONLY | os.O_NONBLOCK)
+        mock_read.assert_called_once_with(5, 8)
+        mock_warn.assert_called_once()
+
+
+if __name__ == "__main__":
+    run_unittest(__file__)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0


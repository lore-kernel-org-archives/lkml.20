Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213937E5F5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324261; cv=none; b=QwgG4Ca1IvKWEzbI2FxmPVgAi+ERas9TuN5PTxuvB6OUDUZVGZmJvxQQZNmahb3OnGiQxu9WvYagYi8JOlI0GCNZoB6gx/ZJ6JT4FWLLoo2LievPRttV/y9uUwGMUqeQmCn32WeqByi6BaGqnoNX9hQrY4NpBI1je7wMxcla2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324261; c=relaxed/simple;
	bh=Ob4B9ErJj3laID462V97S9hViHqoVwz3bwMMUM00Zpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD1iQepVFU7RbEh8NDlddY2lR3H5uCTQaBGFWziJKA0Iki9fB5PbIrjWYjDQwLjtLh98NQnqiHNmOohQ/NRQ4+wzmJJx+QeXquo+HQ2/5iMRZ39QFLqIfFM/OvyZJCOtJScEymCsoUP0igZe8XT4oMjTR1fkpC+swurbxeH41oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ae8TNcjF; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ae8TNcjF"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so1793810c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791324259; x=1791929059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzSq1/SWKt6eAAabhC/1HwXWrHReiFjmvFQFuOMGH5Y=;
        b=ae8TNcjFTlYYqs6c/BfvrV+19T50T9XXK11GlCNgxoFc3oZRuX+hZuYv391nWsesGH
         qvj9/wNqLoqDPktCg6wtjtWE6u477K/n7S5tjrpKM0aDd4IjDJ+p9oQ6OLaj3O3oh93r
         tHmXcJEgyWNUTEZ/r+cz2sCPtqZACxaUUOm9yCXGRwHDVpECkF/lAHRj5uVFPKOJgTrY
         t/L1WiF7DKz/mo3q9tNH+W3JzoNioMmz+F6VCsAxm8FxKR29fPzr7d837bCTipW62mnk
         J7vPzAHVMstGSDGN0XDz553w5NiDPoNlEIqpQbOomUtmmNgzxyrMgNqyz1zgzDQ82vse
         eCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324259; x=1791929059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzSq1/SWKt6eAAabhC/1HwXWrHReiFjmvFQFuOMGH5Y=;
        b=A9gKn1q8xd5wnEqOpmjea3jaWiphlMrtYE89V5itIToQk1EqgzyCSpuuKvocBpnHWe
         aezgrEarJeLMrcw+cPdbgKUf0GoJTYDU/rZEPAi8MuzfccSWzg09WmKelEydKEOpX12n
         D2drMbuoLzfGoCQIJo9LlNVLCd6zX9tvffTUbTbDDLtY7o01MJNUf+2wNCjADpjV7xL9
         fAX35exOFWsNVMFsQVaAvhR9cQ2+VpgPrCcr3sOAmH62gYN4Uaos7KLXijY6wSFkarHW
         6TUls0o+mOtxvzI0alaDmfK4LbsAzccUWDDYhPI266LMGBk4RUlariRqX7OpesTxco9E
         ripg==
X-Gm-Message-State: AFuF++muOzDLkgAAJf59Olg0DDgUdtJrF9BbNCpfOZJ9voWP5YGlfvdb
	QeV5l5Az17vND9bMlmZ45AW91TetpLUp7mtj+BCLNanxvSRZCdCrfAn9/bTzGg==
X-Gm-Gg: AYBFou0RCbpwiGoSlBiNkA7gs4eBVsGV7WC0sR7b0SlbNoyDv3sqhbKAVjcfBICeQ3Q
	eBxSdqs/dKBRw4j927wkoxhbBndM0XvotUVwgKooRZUPi7nxHefrPF7vcp7E4INuY2NNePRWxIa
	Jiof3/UdSGA5mDAADFLGUsyjL2imSlDYR0TXvR4cqfAC1RFAvoBSSjhoeqKCh+cpp3XLVk+dchL
	l53BQEXSa0kwCWH+mAbVsm610WLEsUiGvLrlxfTrshXGyXSqO5PUtBd+V84FLeaTIMRDNR/hvgl
	VGuKXLxpxlAULXEXuO6505m9ETsKnlzC0sEZNRr+vkQz89fgh5jasEAZg4QLdjSg0am2oMMvEf2
	Bpba+gCuRRckzjsYj7nocVLCXWN30aZRtWWzK1fkv/chKY1jaP4lLUjzNYkRMrtjtZDLA+yat1h
	4rtfdDmWuyj8xwqNdLw+ncnnZBEBfzSEpra3Lt1Ty13Xl/cfyXRUM5isQHhaNiURDug47CQg7PF
	jiD52WPVD7+KSrDqFERNQt3ZjcaRd/E+3kbWR6/A0eDbDq/LJdzs9Ham1OncbuRVrkBKNWxe3Lr
	WkincI/T9xlvx9qQsclojJFnt+l7RvTTzME8WN5bOX/Di74dXA==
X-Received: by 2002:a05:701b:2302:b0:144:f4b9:9be4 with SMTP id a92af1059eb24-162055138dbmr198266c88.15.1791324259380;
        Tue, 06 Oct 2026 15:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2401:ba80:a119:c570:bd30:a4e9:73e2:f35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm1493545c88.4.2026.10.06.15.04.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:04:18 -0700 (PDT)
From: iamzayn19 <iamzayn19@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	iamzayn19 <iamzayn19@gmail.com>
Subject: [PATCH v2] scripts: bloat-o-meter: avoid shell parsing file names
Date: Wed,  7 Oct 2026 03:04:08 +0500
Message-ID: <20261006220408.24310-1-iamzayn19@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20260927081322.26a44ce0@pumpkin>
References: <20260927081322.26a44ce0@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bloat-o-meter receives file names directly from command-line arguments,
but passes them to nm by interpolating them into a shell command
string.

Use subprocess with an argv list instead. This preserves the argument
boundary for the input file name and avoids shell interpretation of the
file name and tool invocation.

This is a robustness cleanup for direct bloat-o-meter invocations rather
than support for spaces in normal kbuild paths.

Signed-off-by: iamzayn19 <iamzayn19@gmail.com>
---
 scripts/bloat-o-meter | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
index 5868a8b..72edbb7 100755
--- a/scripts/bloat-o-meter
+++ b/scripts/bloat-o-meter
@@ -7,7 +7,7 @@
 # This software may be used and distributed according to the terms
 # of the GNU General Public License, incorporated herein by reference.
 
-import sys, os, re, argparse
+import argparse, re, subprocess
 from signal import signal, SIGPIPE, SIG_DFL
 
 signal(SIGPIPE, SIG_DFL)
@@ -31,8 +31,11 @@ def getsizes(file, format):
     if args.prefix:
         nm = "{}nm".format(args.prefix)
 
-    with os.popen("{} --size-sort {}".format(nm, file)) as f:
-        for line in f:
+    with subprocess.Popen([nm, "--size-sort", file], stdout=subprocess.PIPE,
+                          text=True) as f:
+        if f.stdout is None:
+            return sym
+        for line in f.stdout:
             if line.startswith("\n") or ":" in line:
                 continue
             size, type, name = line.split()
@@ -49,6 +52,7 @@ def getsizes(file, format):
                 # statics and some other optimizations adds random .NUMBER
                 name = re_NUMBER.sub('', name)
                 sym[name] = sym.get(name, 0) + int(size, 16)
+        f.wait()
     return sym
 
 def calc(oldfile, newfile, format):
-- 
2.44.0


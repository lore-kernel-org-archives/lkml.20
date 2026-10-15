Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3A3D7D89
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031067; cv=none; b=QmhsNlkcNLl7WJ30xeErEFrivXpM/7oXMiFV6MouNzw1ERGo1JM6J072PFrH6Tu2MVNBy3SqBYrqw8pMmIuehNj5WJAOVssn4rPbsXSZGVMUhZOz15ULv8FzTnXyb8mhFY4/1xAEelulY9q9ENqsILouKcWtBKb/9cMsA/NLLag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031067; c=relaxed/simple;
	bh=KFkTlUboSzZbF/mPRaunuRcT5moLJ30RQFGCjhzRoJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6KLsN96veNEKi2eL8dkNGiitvh5qbWVm59vjKiat6sZ3qR27AykakisPYoEuxaCAy42AxufVqBEPvwe8elNQLd54gQirJVlHwbMPqhyxniSoUVYTnz8sbjDnZUVPZxOfAHQ/FrUSGb/2TwSRaRs9/13k73locLTf/gnnur2/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTY+Tn0I; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTY+Tn0I"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2621755a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031065; x=1792635865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RiRTtTPlWRafdFL0/1n5rOtzrGPreou1ymHMTLM9OmY=;
        b=cTY+Tn0Iz8z7D1fixzWeQW1MCKI3cAHOXvrvzFiKiIEmEj2GDpED2qeOHVkMe68Cp7
         6qoG+g3DHpqiWcg6y9j2Jp5bChz5bmdo3NALvTqvCfUanDaHVhlv3Gk1RKNZ7lB+uJxj
         qaIanFC43DGuhqvuz9ilFm7VucZd/DS3L1cHAmzXWsr+vVouulVfYRvmZ5MUbnx34WYK
         pHa9kLm+kF6OBd0/w8JDJNumez9F8R4k7eZjJZM+xjl42pgeui7HKJGJMcY27KvLH+cM
         FZLEqPY1InI+w3gw/jFWcX0Fka5qGHt7BqnICCZXKQEC5MW6teQerBgqEWPSMMhIAikf
         zPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031065; x=1792635865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiRTtTPlWRafdFL0/1n5rOtzrGPreou1ymHMTLM9OmY=;
        b=NLZ6hxIZg9uswwZuqtMydJkTLNdoRPtiJcHizjNu40mokk9AGD9pS5nWkiCW1EgNiE
         Txe9PTnBnDhhtmJx2B94UBNM2lHRK7BlzWAmtps2Jlzefpw4u+UT25fS18a5CBPFvqg0
         NWxZGEt5IGgxgHXLDz/hDlom6oIe7PZy0AOqw0/GCECDJG6ST2SYpTzdUCkBZVLvh3cm
         VNjAXJ/yjd+SU9UB9gmBo9ZpY0dD7OPH5QzZLuLwh0A/hPTJ2xzGIn48PECVZo2VsPpa
         A3g5FQMs4ax+INPKM6d9LrxbZAyzFE02C0pXLb09ublfEUuScgK8y1yR7fRSdR7b0YKD
         iDbg==
X-Gm-Message-State: AFq9FYK4ioq5Yw/kC6h2LsXfu/nkeqqbb6T8XMGn8eh5rsnvk5YEbOcD
	giwB3AS5DfiJRKRz1r7sqiVxKHeNsiS1Q+yY0PLRGAcl7woMGHb1xDzE
X-Gm-Gg: AYBFou0cNnBEjVS7MkaXaBfIQMkufvq7O5fETQbKTGybZL8WDi5stC48UX9FS3LdO9j
	rPjtI7z4b6FIVDSfQbbe3GIMn0gT2oDcDWi5gmLt5pj+c3vGCLyT0Pv+QjIomuyYk1xAXJokJYM
	h3K1juZbZTxgES8ddVj/1bYeqOoT9KBQ0sep/rYSe9gpfrHd8mfQkGhXXMV872utRmJ5lXSRhLx
	t4M4ms+z0rrGv4zAFjCmkGk/+xFtmqWz8I9VKSxSHceAj6jHZ/VePUQZMYsFabuHlWgaL8hLa7J
	a7Ax1F/ZNUN3vtNhcmMLILieiqyMR6Xlwgg+QTaCdVDWzUAiB7msoCJ63bsyn4Vqma58r7Ih0+7
	ho4FfBQw/lNA2tn218B9ZATsVJ7jl9o1Q1GE1DUCDmd7DjmYzxMJA1njWoNtTKou4PL6N7yC43h
	5rY3HzePrQwe0Rn0hl8lvwULnjT87AJCKECeb7txo4tKatOygVxNdCiMC6vF2S+8BA9aXI
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr9429218a91.41.1792031065580;
        Wed, 14 Oct 2026 19:24:25 -0700 (PDT)
Received: from localhost ([211.249.71.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm1944388a91.4.2026.10.14.19.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:24:25 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Add nice dependency
Date: Thu, 15 Oct 2026 11:23:39 +0900
Message-ID: <20261015022416.43534-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests use nice but do not list it as a requirement.
Add nice to the requirements so the tests are unresolved, not failed,
when it is not available.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 .../test.d/trigger/inter-event/trigger-onchange-action-hist.tc  | 2 +-
 .../test.d/trigger/inter-event/trigger-snapshot-action-hist.tc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
index 55ab0270e5f7..04e6db2a734d 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # description: event trigger - test inter-event histogram trigger onchange action
-# requires: set_event "onchange(var)":README ping:program
+# requires: set_event "onchange(var)":README ping:program nice:program
 # flags: instance
 
 fail() { #msg
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
index 9eb37c2fa417..64bb0dca7e3b 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # description: event trigger - test inter-event histogram trigger snapshot action
-# requires: set_event snapshot events/sched/sched_process_fork/hist "onchange(var)":README "snapshot()":README ping:program
+# requires: set_event snapshot events/sched/sched_process_fork/hist "onchange(var)":README "snapshot()":README ping:program nice:program
 # flags: instance
 
 fail() { #msg
-- 
2.43.0


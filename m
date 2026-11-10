Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268888;
	b=Zv3Ra4vnBuXRc9zplBnDIjXGID2VbykE5+13tXkW/DbdCV/EFUwq7/d/szwdJEsPfWau
	 9MYP1VAB6vv1Gqh10AlDqBsMhnijEvjOIvo0kqXaK7btq20sXe619nUrVBI8H/EvARY1d
	 gm/UDa9f6Ap3MEcRW3uhFnO1MsH8UVeGqxHx7GZa1ZJfq7PGBFwAJ5SsjjVxQ9jEhIeZd
	 TXaQiUnjtS8jqyyvd5UDUunpN9L8TEaqv6NS7yOqJCndwAcMomWsm9BHJ9S3lrihF2/np
	 1avCn8UX8WTMx/KBAwjUDu25HmoUBqpUzlA62KRNNXG8cNQvA34/HHPdbeIZHBFaw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VK1Ajtb1JXJ00kJiwUwM1nXOM+V+pGWIbXtB6G+Jxho=;
	b=WznMOdprBYv4rVk4JDQQxKUyoiZQojOlbdJaSbg5eLB3kz9prqIx/w3s2NpmqeO0+A69
	 Fmi5VtafjvIBgETonEaCPkHkqrniEVsXVP2XC5KwgBoVgTgfa/sH3mll1ak4RIbCNFoc5
	 w1w9r2Rdtl2HiAH+CJjgt/t/iYsNQP8WO83HQbtogmXcxXiOcZaQxKFyaaQFzTqknZxxu
	 zn1dzIBG3WyAXaJN3usUfz/zH9++TT6+FI+B8qUly4NCatPwnBG9diPj1/U4zx1KVqV4W
	 9hRR8R1Aoy3N5H8fMjg8mFDP7y/0T2WWkdxqzkUt8DsFuiIY5oTqtpth6q10BdkibwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tb0O/r9O";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940F606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E940F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb0O/r9O
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85ac281604dso836044a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268887; x=1794873687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK1Ajtb1JXJ00kJiwUwM1nXOM+V+pGWIbXtB6G+Jxho=;
        b=tb0O/r9OyvoAv0KHGRmVWCywslO6XIObZiqHc2UYQhw8FrZu/x/l3YHOAIFQIlqow7
         kg0gC9zDUMhnqWSq6bkd7vZPt2gcr+l8fdSGzDeGWzO4PWytryT0PRWFtXJFmpusIwmk
         wPCb3zTlf81s+5v7QHLBY0rWxxDhFLcz4XDYe6qZvwUNkdC2JIwoz3E2vs2v+QxoOnqF
         1+WHooV6n0QXCXotvew0elleVd4UexfxHgpC2Nu2yau+VLq1PqRVQ5itgTRiQFHlV9lk
         CnwUB/Hj0WCJ56O3HRCB8hL9X/kMTw9x8EbNbDD7UR8Yi2ZOi3jv2OfVpWLGmkE0ybZ0
         8IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268887; x=1794873687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK1Ajtb1JXJ00kJiwUwM1nXOM+V+pGWIbXtB6G+Jxho=;
        b=vAAXu1cGJ7PfAuydQO00NDP4Fb0aEzokqsQnl9zwHr3GTsWwW8rKk2NrpS5cjCwB7A
         TJ7vilF3VdJAElXo0O1AY9C1Q7z/be3kzCyH6dCE0UtXoNVPA8poHcgM/dkQlSdeCpcP
         Qy4TjstuWWdPVmOaKNriaa9q4ccC3Ohe02fqYpLRnE8bY4zB8NnLTxy5WFT0Nk3mL5kn
         WtFLf2GqRZ6Av81qfNmrQHxVXvNZ2KvpVaXvqmoxFzBErpYA8kScxMpvcr6lzF+IfyEa
         VUlisJJrSZP47K4zJQu87dsrcbPbyefK8K/vNNEcodvRx6KnR85aftUh4h6IRnoh0ymT
         2yIQ==
X-Forwarded-Encrypted: i=1; AL+hErEi4ivzNOOKKxy1yBW53Z05ljgERWJ5K3JKee5mmoa+xxEpcdMj7AmVonWrptQy4f+P7vqyTxzN6Ta9pOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B3sqESJlOATaOsHp07Lsvzy5I6UnWtqbAlvgzIPkkWvuoU8Lj
	o/hk7vm909GwLuSGR9AMeoxj7EvTLWMw3qLHB4Nj2nUk16L0rH9Mk8J0
X-Gm-Gg: AYBFou2MfSMGTrpa2ROyq8xV9j3PyVz/Le5Ht7LCPF24t3KreKgen4Mkd4emef1W1hu
	wI1kwEwx0yMVK2xj/Mn+43NMto9r14za2MOwcYdVzOkk6RU82Gw8lW2csF7Ax/qYttuCYCXaKrC
	tAcp/aKlOT3O4I9tctGhgg5msGkfdyjkBO9s7YJ596qkUx5BQQ9V10TVq8AUGpbxY8Yg38C7pKF
	6bWXHOCYzlCmTVXzh10CLJ/APncweYZdTlqSroThbdPjkAWCUD+l+UzScXfJemHijdDeQgcpgEn
	OhoZ5MBTVyWIDz0ZskNOuafXS1c0t+tY9mR7eVoCZbqWd3pqawBHvPJ2PWW5Q4SG+MQYm8+D31H
	Su6ATMBOq7nOAXQOPQIqmzjCAbQ8yWKyTmGG2mtWXbFZ/K9Lz0GEmhSUz+iX0qBBEnrFQoKY+wp
	+2mD081g6DbeGnWG8F/8crCUWCpxvODCqiKWQJXJWl/nSjQT4tZLX7sANpzi/soOy+z894FMja9
	EgAevCL53xoKueGIlBwGrYbxtJEyFQeTbqHBvR3UABrjG6xG7qhRPUg5IgMKHhvdxtRctTMsgZR
	TXNkhFwVyvXxOYgNfMHbF8vAX6lkGgh70FKcYXF8+II=
X-Received: by 2002:a05:6830:314f:b0:845:3cfe:5f1 with SMTP id 46e09a7af769-860dc70cd52mr843968a34.5.1794268886839;
        Mon, 09 Nov 2026 16:01:26 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm625492a34.4.2026.11.09.16.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:25 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3] tracepoint-update: check the section end before reading a string
Date: Mon,  9 Nov 2026 18:01:17 -0600
Message-Id: <20261110000117.1720256-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
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

for_each_shdr_str() evaluates strlen(str) before checking str < end.
A string section always ends in a NUL, so the last iteration always
steps str to end and then calls strlen() on the bytes just past the
section. This is not limited to malformed input: running the tool on
the vmlinux.o of a plain defconfig build, as "make UT=1" does, takes
that path in both loops that use the macro.

It does no harm today because what follows the section is another part
of the same mapped file, but it is still a read outside the section on
every such run. Check the bound first; the loop is otherwise unchanged.

The problem was found with ASan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
Changes in v3:
- Dropped v2 1/2 ("do not reuse section pointers from a previous file"):
  Kbuild only ever passes one file per invocation, so no real build can
  reach it.
- Reworded the commit message to say where the read actually happens:
  I checked with an instrumented copy of the tool, and both loops step
  onto the section end when run on a defconfig vmlinux.o.
- Rebased onto v7.4-rc1.
- Replaced the Assisted-by trailer with a sentence in the changelog.

v2: https://lore.kernel.org/r/20261008164117.3670267-2-lzsx618@gmail.com

 scripts/tracepoint-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 5cf43c0aac89..c70c0b076554 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -74,7 +74,7 @@ static int add_string(const char *str, const char ***vals, int *count)
 #define for_each_shdr_str(len, ehdr, sec)				\
 	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
 			*end = str + shdr_size(sec);			\
-	     len = strlen(str), str < end;				\
+	     str < end && (len = strlen(str), true);			\
 	     str += (len) + 1)
 
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


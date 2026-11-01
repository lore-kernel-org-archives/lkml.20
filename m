Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491214;
	b=NhZCCU111GZN7AERA7+NX9mRY3bW/v7aHL2UEdCqOg+4WVIJgf0I0l++/guKLTW3bWef
	 TltLA5qY2ts4S5wiFJvty/cI+jBMVL/CxvOhiK8GMqcQzpQEHM4HoFgafjjeKgkvxMJvV
	 TUdAS8jhHEOuKOtGKp5ctauFsZQN6wkwpEZ9lEh+u3u0YYdZGUYIayUrFDOScpAYHytSc
	 5Vt+4bLLLat/ytLLOPfuaUJBvzktY1WGrl5AAhBEgWEX3WE88+FarMpp+pskU1OTQ8j+9
	 KoyNKhaOiug37sWoxkZIs+JaKABqOQfR0UhNIVE+isZrL3O4iuHifYyrpwe8TJ69P9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491214;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipbSCeqsv5rcmRmVjNWozKtLW2tqkGo29kydVBpqVm0=;
	b=aX1873bM7N4ZWGzPbo2Q08nbp0qmY2TBMJRoysW0u19lB61PzmWZqsA1PiCoh1S/k0ot
	 1HRJn5jdTYGyadJ8h5OzJSDfZarkjuLLsGu7DjlENRjp+g/ZEy7q7AIG1M+joMArW23zp
	 fXotb9ehy2BJpg52YIs08YuMigYGI3ORXYHpjz8nNXxf5PsCfTs/CIV6gcpaXsujrm301
	 HhAleKDMqVrYjoTqh+HpDGQ0NLPQRG04R56JJhyj6VxTgPdAb8J+9Kw/nMm+WXbbwc60+
	 BdbU423Nk8lLURCCB+yW/q1J8PumCaEkeJYCH70dXkYWBXRVJrZQ+E+/hnOkNQvU1Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQnU9Abp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDC606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQnU9Abp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852C21F000C1;
	Sun,  1 Nov 2026 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793491213;
	bh=ipbSCeqsv5rcmRmVjNWozKtLW2tqkGo29kydVBpqVm0=;
	h=From:To:Cc:Subject:Date;
	b=RQnU9AbprTVdQ20yL0RkWd13+WFyfU9c2kj602b+GbVTdrLNJd5fEyOSJzWvq+mgd
	 KSzXcIeV1/D9u/PZ7S5Mk9dTaWDsBgw5KZ/yBMOU5jxJ3TddgzDDjtfFnkWf09UENb
	 FaN9Dsk6IU087BI1SX4jFxoXdyUtxEjWLkH+MuBrHl1l7VeVcxSwFaE8myMo79kKJM
	 UF/tNwUpWa42Yd+Et+oKjrqD6JvIx1+9hyFNCFhKVKtmjMONOcQo3jbUL0RcwdZJ9g
	 MK35LuNzxmuZXvGcjRppaffMlw3pSzBO6wYVzFTQtBQsRXZbXPofKVUb8u8cmdeKKe
	 AVbQOYm7EHBUA==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Avi Weiss <thnkslprpt@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Fixes for v7.4-rc1
Date: Sun, 01 Nov 2026 09:00:10 +0900
Message-ID: <undine-1793491210495917491-179269aed50bb5fc@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Linus,

Bootconfig fixes for v7.4-rc1:

- init/bootconfig: Pass init arguments in documented order
  Parse extra_init_args before command-line init arguments in
  start_kernel(). This ensures command-line options take precedence over
  bootconfig, matching the documented order and saved command line.


Please pull the latest bootconfig-fixes-v7.4-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-fixes-v7.4-rc1

Tag SHA1: 3f9fe3c18f3bbbbf8b7ef9111d133051f9d7d890
Head SHA1: 278b2abf660a3e0991eb9f16f11bd9e9514a286d


Avi Weiss (1):
      init/bootconfig: pass init arguments in documented order

----
 init/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---------------------------
commit 278b2abf660a3e0991eb9f16f11bd9e9514a286d
Author: Avi Weiss <thnkslprpt@gmail.com>
Date:   Tue Oct 27 09:37:20 2026 +0200

    init/bootconfig: pass init arguments in documented order
    
    start_kernel() appends command-line init arguments before
    bootconfig init arguments, while setup_command_line()
    places them in the opposite order. As a result, the
    arguments passed to init do not match the saved command
    line, reversing the intended precedence of options.
    
    Parse extra_init_args before after_dashes so command-line
    init arguments are passed last.
    
    Link: https://lore.kernel.org/all/20261027073719.4010659-2-thnkslprpt@gmail.com/
    
    Fixes: b66fbbe8d482 ("init/bootconfig: Reorder init parameter from bootconfig and cmdline")
    Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

diff --git a/init/main.c b/init/main.c
index 31f2bf54976a..4efcb9956c39 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1028,12 +1028,12 @@ void start_kernel(void)
 				  __stop___param - __start___param,
 				  -1, -1, NULL, &unknown_bootoption);
 	print_unknown_bootoptions();
-	if (!IS_ERR_OR_NULL(after_dashes))
-		parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
-			   NULL, set_init_arg);
 	if (extra_init_args)
 		parse_args("Setting extra init args", extra_init_args,
 			   NULL, 0, -1, -1, NULL, set_init_arg);
+	if (!IS_ERR_OR_NULL(after_dashes))
+		parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
+			   NULL, set_init_arg);
 
 	/* Architectural and non-timekeeping rng init, before allocator init */
 	random_init_early(command_line);

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>



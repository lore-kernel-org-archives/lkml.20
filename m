Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA74756D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149325; cv=none; b=nw3kgpE4TgZCxlfsZlwJptlooxhDSL7EClKumTlOWYx7WP2zjJdpC3t9LpD28P6BfPWjgRvIXPK4U2yi+FoOlYUtmJ3ydvtfWN4hBxPsRYuSnPvZFwZXRSSKW2J2qZen1LsLtFjlqyoa/0wdICsrjOXDzaTRW1ov2kJ7xmcjFAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149325; c=relaxed/simple;
	bh=lHE4sUTVgDDW55gWzB8XJw6yDKJtXI8Pr3q8CA2c93U=;
	h=From:To:Cc:Subject:Date:Content-Type:MIME-Version:Message-Id; b=daPYPAmYVBpzwoZA1bBmsHgDUmpa9fhCVtwU3gNxSQE+PJ06hvVKuLkHfrSltxL4/tz/82NucQJSiwCKVzT2m/FdM8SmIX2JZr+8iehiz2L52vHsznnaIGO9mNw6fx3FPIklOQ2WzNuuhbiiemCdeFlnx8te2oZ8BKZvba5YCd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiX7H9W5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiX7H9W5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B59A1F000C4;
	Fri, 16 Oct 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149323;
	bh=4tdBIl/6prCw3gXURtrP3n7yBrltZqqZgVtgR0aXPIk=;
	h=From:To:Cc:Subject:Date;
	b=iiX7H9W5lKNO32D3nliPOl2Dtz/ZPIau7CcDRF4VkrJdrcAJzg2FYKa35K2DLxK6J
	 eqyBYtGJ81YHIU5oAbsx9ZC1uLaqLBdhU9OGxIiMs9q633FQxvjBePoiKpJNyGijGG
	 jm6jjTjuvh77IqNr2a4ukw4YPOolSxmy0vr0PvNoeoFbxGruRl4nxvZLsW4xfqakAH
	 9ngy11a57sxMtaAjRDKcbokJceHLvrO4LzNF+wdru8G8iGQq85B/hAxsT5U1z5pUP7
	 wZyufeMJLwCA4xrsYfTUjvMyK3iqyJtQOdpPIVLBnY9rhNaoBnTE0tVYP4pRnRCRQo
	 w2QtGQaB0SP5w==
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Martin Kaiser <martin@kaiser.cx>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.3-rc7
Date: Fri, 16 Oct 2026 20:15:17 +0900
X-Mailer: UndineD 0.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20261016111521.6B59A1F000C4@smtp.kernel.org>

Hi Linus,

Probes fixes for v7.3-rc7:

- tracing: probes: error if BTF is required but unavailable
  Fix to return an error instead of NULL if BTF is not available when
  user specify '$args*' meta fetch argument for probe events.


Please pull the latest probes-fixes-v7.3-rc7 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.3-rc7

Tag SHA1: c66008d494387045766f3bf87c3feecdc3fc0423
Head SHA1: 66c658033d842bb75f81f20aaa4a378fe47be1a1


Martin Kaiser (1):
      tracing: probes: error if BTF is required but unavailable

----
 kernel/trace/trace_probe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---------------------------
commit 66c658033d842bb75f81f20aaa4a378fe47be1a1
Author: Martin Kaiser <martin@kaiser.cx>
Date:   Wed Oct 14 10:37:40 2026 +0200

    tracing: probes: error if BTF is required but unavailable
    
    traceprobe_expand_meta_args expands probe arguments based on BTF info.
    
    Return an error if we have arguments that need expanding but BTF is not
    supported.
    
    The params variable is now unused, it can be removed.
    
    Link: https://lore.kernel.org/all/20261014083838.31020-1-martin@kaiser.cx/
    
    Fixes: d157d7694460 ("tracing/probes: Support BTF field access from $retval")
    Signed-off-by: Martin Kaiser <martin@kaiser.cx>
    Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
    Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index 804442b2f7d2..88518c5322a5 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -2287,7 +2287,6 @@ const char **traceprobe_expand_meta_args(int argc, const char *argv[],
 					 int *new_argc, char *buf, int bufsize,
 					 struct traceprobe_parse_context *ctx)
 {
-	const struct btf_param *params = NULL;
 	int i, j, n, used, ret, args_idx = -1;
 	const char **new_argv __free(kfree) = NULL;
 
@@ -2305,7 +2304,7 @@ const char **traceprobe_expand_meta_args(int argc, const char *argv[],
 		if (args_idx != -1) {
 			/* $arg* requires BTF info */
 			trace_probe_log_err(0, NOSUP_BTFARG);
-			return (const char **)params;
+			return ERR_PTR(-EOPNOTSUPP);
 		}
 		*new_argc = argc;
 		return NULL;

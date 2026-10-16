Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C10384243
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161096; cv=none; b=Rw0ohBdELMW8py8d+mn/G2m/XnpviSxt4t2zgplqVqlpvQRNaZmZRXDwCZclTejDLNXd9qUjYuCKMxcd6eSbLG0iN/VPvL2Z02aLhErgtdeq5eB+MgERvFRSTlOgxJqDEVhZcwXc0y8PdUSxfvQ3RN2qO82aFmwOttaXxsaGNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161096; c=relaxed/simple;
	bh=qS+dKxR4o0EqDp9zptT1X6HwNso7Dl1qt7TsEybXZKY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=T2TmvrBM2fVsU9qSApJS/sO1I65TQYoJiBZroIkapW+X9hzNXiQyt5lINhDXgojKRPJf30P7mJikqlj0FNPfMKdMzp0IcZcUTqNb/5B6HMTXvkgJGSRUeuRpsCgGCiWjbSKXh1qlQrSEJWfLvKazprCoL8RAhnCzio/X0eqTiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL2TI/ZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL2TI/ZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3601F000C7;
	Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=cDUkQqJsvRL0NYDifJz9gJjDJgTQtNT2nNT5F7Onjto=;
	h=Date:From:To:Cc:Subject:References;
	b=WL2TI/ZBPmLIIAA4Ecu0eGO8I17QzOdNsodp9emRC00ZR2WLcTS3hPzczO8AooNw8
	 z1vXFFZfFd8Ea9OgNXNSiuCQVTzr78RZTt9NOzjre4go8qnPEDP3FXza9LuVuj7lk3
	 zdA7Vogg9PxL+Vf5kBt4gkmL4lPhIjIuNmgp6v9DYbJ2clLtngxGEJhPxQVvmHH/CF
	 yH3NRuT9kIrwzG6m2NP2QpT71J5SdMvhbFt3IovvdOwVCmjeGmXtsvQja+YQwXIrIv
	 1fCxJVRKVs4l3BIqdF3UzcuFjPgvT8w7TWWhJf49iTB+Txc0GM/Kw+EefQ/APF9iY8
	 QnqfdhuagN4uQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy6-00000000XhU-2jLc;
	Fri, 16 Oct 2026 10:31:34 -0400
Message-ID: <20261016143134.458842046@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:17 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 02/18] tracnig: Add proper error message for glob use with "within" filter
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

If a user were to use a glob expression with the "within" filter, it
currently just fails with an errno return but does not update the
error_log to tell the user why it failed. Update it to use the parsing
error log to tell the user why it failed.

  # echo 'within ~ "*_read"' > events/kmem/kmem_cache_alloc/filter
  -bash: echo: write error: Invalid argument

  # cat error_log
  [ 4676.606481] event filter parse error: error: 'within' filter cannot take glob expressions
    Command: within ~ "*_read"
                              ^

Link: https://patch.msgid.link/20260821233050.488131029@kernel.org
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 89f606643388..b3b13700abce 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -118,6 +118,7 @@ struct filter_pred {
 	C(IP_FIELD_ONLY,	"Only 'ip' field is supported for function trace"), \
 	C(INVALID_VALUE,	"Invalid value (did you forget quotes)?"), \
 	C(NO_FUNCTION,		"Function not found"),			\
+	C(GLOB_WITHIN,		"'within' filter cannot take glob expressions"), \
 	C(ERRNO,		"Error"),				\
 	C(NO_FILTER,		"No filter found")
 
@@ -2027,8 +2028,10 @@ static int parse_pred(const char *str, void *data,
 		} else if (field->filter_type == FILTER_WITHIN) {
 			unsigned long func;
 
-			if (op == OP_GLOB)
+			if (op == OP_GLOB) {
+				parse_error(pe, FILT_ERR_GLOB_WITHIN, pos + i);
 				goto err_free;
+			}
 
 			pred->fn_num = FILTER_PRED_FN_WITHIN;
 			func = kallsyms_lookup_name(pred->regex->pattern);
-- 
2.53.0

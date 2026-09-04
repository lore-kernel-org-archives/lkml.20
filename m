Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6C433BAC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522755; cv=none; b=DCZnKu+X6YgCYX+jV672Z1ITVgcQ9l9tXAksJZAjoCGRWAs9FbjFd747hw2mQQ/VzySufARSJwg9KaHCQXk/Pl6J9XWB74/bUtJGgbL/J+rPZdLu5nEaRKdoncJ9tBQg66FX1PgQLTRMmZkJly0LJyvZZ3sPey6aoYaphI3AcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522755; c=relaxed/simple;
	bh=0cRPNGUUMVs652Weqm2FqKFcES2/BnKPbBwu/G/hbrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCr3G0UWy4KDPS0/lk41GBoPU4Az4m3qVubOyLpivM7WXUkBGdX4lr9euaDeycIn/ZXlyXzKl/z+vRJ0M/jJFVtKjvtPR10ADA6GP0tsiwWy3ykQVqGP621/bm8EohBbi1Vi/KFoluTzSNBZvxV7IlS9RmYd1FzMpjqzs65hQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itv1lNso; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itv1lNso"
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6b1b8f5a1d5so233140eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522752; x=1789127552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNeA5dp3MaoLoW8Nl2YTeA3YpJEcR4eHsoLJr3ftU1Q=;
        b=itv1lNsoL6kv4yXnVXeeOLUwetzqgBDRrzNyvQkeDZQ95pMRaPA0tEP5U0ADKNHukF
         gH28+ZiTpVOOwRtw0I8qZDRP5kVyRi6N5OzziZu1N92ZG75TI6HBFVoYD3mTk6ZltqlV
         ds4iwk2u1XWtixXFyayUDYDA0JgFjKMGOFBHa74+UsGD61fQdrgKB1ugwR6AnOKVJ7k/
         H6vQ9AebReLlYwW72OuSwrqbfy+W7AoC7eRbGd6U4npPfhkNKIXSejuA3jJ+E4LJtsIC
         ifxGLsb1e2PMJREZSnmzQgaom9HyTTY1J/XvUDFi70ZtPcB5Vt3YEEcP5vO/tU/qDY6+
         WrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522752; x=1789127552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNeA5dp3MaoLoW8Nl2YTeA3YpJEcR4eHsoLJr3ftU1Q=;
        b=L6WrRAPxB6PBnm6qzX2++S/1Jp+Bq6tZSkl6KdA5LW9Gl7WSrjOB4DUpDounW96Xvq
         q2qo05h7u4BNf4NDE7gageeip9gacUZIGUi5EpaE/skCi+sVnWH7pAPQLjvIyEHzTePz
         BWjk2zlyRjoFz6bGHOFCHru5WqnyZLWJ33itv1F3koB6DZFI1AupXC+D1riBpb2K+9nm
         1yYAkKlke/J7TeZWqY8Yw1K0LFKIStQdb5tDNiKfPyM0/JCI0LjmG7gEQHntmf65cifP
         nBY55WljN7Mx2tQSFJolq5mdGkr/U1GX6CKwQ4rLUg7Dqvlwx53f7vD5l2uV/A1xIiws
         lWYg==
X-Forwarded-Encrypted: i=1; AKwUvByume6Fss1bHuGD0Jz0wnF0iRGNlqcYL9yeQtzXMqwjcvc8pLGLjimWAIFFwrP+SG5A5JNV8BDwbnlPfKo=@vger.kernel.org
X-Gm-Message-State: AFuF++n7qa+bsTnRSv47IXE/JWrqu1mpbChcqvZjb6uf+Vd5sFiEZ9UU
	5rfAzulSu+xKiBhyEU9++j44k2ORZ4P9luugx+1mczEIMtkl9Xqeh/Lz
X-Gm-Gg: AYBFou3CCVpOtu3OBwT8WHBfh1tt7IvuL+TrrDQQunrtmz+03RlMYQTfeLn8tlnhxKR
	ijWt2AIk+k8Acv0YCi336G84NqTT96w3DGsahiPEvLcTfQvgOxbXsicRGzIMekq6PgYLnD1oBbB
	/pYoz+fnTTJAMiPAC0NtOpUoJ/L4DnNnH868nBBVOLd233paXzdckC0aO4zXDGvIqRyPJGvHfsU
	GuxPyHaEfjdUI7K4vu3DFDMDevqVfvuSiraR/xcT5FLO2gQqyG7wbXO4ublp/veq4GQ40gW2BHy
	P0o/AGifvTIH0VKTvSVn6Z1JzyQNMA4yQVuojIWN6sWnsDWKlb0iow28OT7YQbe+IXTprLWBtyB
	Up8vdKLBbf5x8aVHFNROG/RzpC+Mj6DYoYjntW2vvZIVQKhJE3t6yflPeqoEYJT60W5oFVNXRCB
	bhnaEq/afw3/q11nLMbcw394pgQrVGNtXtwSE0zmWzkE+5AlqA1DIF2q/CEJuHbMtn0oGZMddzm
	F9CGamCCrEuPl9j3tExtfMUCw==
X-Received: by 2002:a05:6820:603:b0:6b7:46fa:168f with SMTP id 006d021491bc7-6b746fa1a3emr2105916eaf.36.1788522752198;
        Fri, 04 Sep 2026 04:52:32 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6de03fa6asm3146452eaf.12.2026.09.04.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:52:31 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Beau Belgrave <beaub@linux.microsoft.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tracing/user_events: Don't destroy fields when event removal fails
Date: Fri,  4 Sep 2026 19:52:23 +0800
Message-ID: <20260904115223.2976446-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260903182903.GA62-beaub@linux.microsoft.com>
References: <20260903182903.GA62-beaub@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

destroy_user_event() destroys the event's fields before attempting to
remove the trace event call. If user_event_set_call_visible() fails,
e.g. because the event is still enabled and trace_remove_event_call()
returns -EBUSY, the event is left registered with an irreversibly
destroyed field list. Any subsequent interaction with the event then
operates on an empty field list while it is still fully visible in
tracefs.

Move the field destruction after the call removal, and splice the
field list back onto the event when the removal fails so the event
remains in a consistent state.

Fixes: 7f5a08c79df35 ("user_events: Add minimal support for trace_event into ftrace")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v2:
 - Restore the comment on detaching the fields before removal: removing
   the event frees the field list memory, which is allocated and owned
   by user_events (Beau).
 - Comment why the fields are spliced back onto the event when removal
   fails: the event stays registered and the fields must be recovered
   (Beau).

 kernel/trace/trace_events_user.c | 26 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index 93cda2f6f2692..f658c3a77aa7a 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -1122,10 +1122,9 @@ static void user_event_destroy_validators(struct user_event *user)
 	}
 }
 
-static void user_event_destroy_fields(struct user_event *user)
+static void user_event_destroy_fields(struct list_head *head)
 {
 	struct ftrace_event_field *field, *next;
-	struct list_head *head = &user->fields;
 
 	list_for_each_entry_safe(field, next, head, link) {
 		list_del(&field->link);
@@ -1502,17 +1501,32 @@ static int user_event_set_call_visible(struct user_event *user, bool visible)
 
 static int destroy_user_event(struct user_event *user)
 {
+	LIST_HEAD(fields);
 	int ret = 0;
 
 	lockdep_assert_held(&event_mutex);
 
-	/* Must destroy fields before call removal */
-	user_event_destroy_fields(user);
+	/*
+	 * Detach the fields before removing the call. Removing the event
+	 * frees the field list memory (trace_destroy_fields() is run on
+	 * successful removal and kmem_cache_free()s the fields), but the
+	 * fields here are allocated and owned by user_events. Destroy
+	 * them separately once removal has succeeded.
+	 */
+	list_splice_init(&user->fields, &fields);
 
 	ret = user_event_set_call_visible(user, false);
 
-	if (ret)
+	if (ret) {
+		/*
+		 * Removal failed and the event stays registered, recover
+		 * the fields so it is left in a consistent state.
+		 */
+		list_splice(&fields, &user->fields);
 		return ret;
+	}
+
+	user_event_destroy_fields(&fields);
 
 	dyn_event_remove(&user->devent);
 	hash_del(&user->node);
@@ -2212,7 +2226,7 @@ static int user_event_parse(struct user_event_group *group, char *name,
 put_user_lock:
 	mutex_unlock(&event_mutex);
 put_user:
-	user_event_destroy_fields(user);
+	user_event_destroy_fields(&user->fields);
 	user_event_destroy_validators(user);
 	kfree(user->call.print_fmt);
 
-- 
2.43.0

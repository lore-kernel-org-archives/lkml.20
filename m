Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912784B0482
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785076; cv=none; b=a/P2Ip3Aa5IhFJb1qg41pHYjnhyHOvV0tpLXgcVJSsuNQUSN4izrkxo6fdkJGt/N87XLgZnOs9CrkdxZOr4uwLeAblBx/1073h3w7vVPIMtjsCOAnXxjQg0D18KtCFdwk8JWU3iDpoX8RqjBntQNfR0d95Njw1ISM99ca9txc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785076; c=relaxed/simple;
	bh=cb82owCkyv9eTPiidRl7fi6WjoARbD7uipyHalof+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kjpq2V1hPIc/PRIl6VPLRf3sO7kMf5MWtlZAv1+nKEG+OOYHYhf9xWqbN+ytuepmKxk+qQjS3qW9rR/xemYp9DulDgUFLesw2rBhLQgWcjrp5VQ7eGHcb97wHTanjcO6qNPBy23A35pr7JhR+sVxOaY8SQK3Ym9tUw81DTrJE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5MH1luQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5MH1luQ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so26693355ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785067; x=1789389867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zuer2L8ZOWoXDvEIlrCmYHiy2ZHwREenfR+tvGUOzvo=;
        b=G5MH1luQBuvpmQq98E+OXwWHLRy38tJUUbPs4gcqgt7E9h1PQotS+vnyTuTYogNliX
         SLP5MyHl5hzLkY2g5PV0jdl9HkIvK+RUNr3UeqXhIZefGJRYpaXQhGwalm3dQNNnpfUk
         1lDZYG0jY2Q4ErQdCO1ynXnFW9rQK8MW0kGTAaK+G/KOVO3DQ9v+Erlm+s+XfLH4LIC/
         d8HYgisxzbeKPxXJzFhByv474iyGgErbhsTAxFf/ucOstIbtRc4z8yrKvrQmf3/S/G+i
         KACK774JlxfQnOYmzvroFWN9kBbIiIFdqLg+zzUTf4dxlpusHi/0UjtNmMQUtbHKg4xN
         VTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785067; x=1789389867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zuer2L8ZOWoXDvEIlrCmYHiy2ZHwREenfR+tvGUOzvo=;
        b=Gh7pYd3HOtu8xFNgt/aQbOV+ApzDkQ3c1Q8lQf+dot4cHZoRycdr9LLpOVcp7k0AXZ
         oMRcKJebp8JeyjTMqRk+2KzK6XyPfiPyQ2JCYDrI0VETKzRrD/a3hcf35lNtoCC340uY
         BiJZPkkE9sORHIOcAqfvoZtSjOBJePv31rpvHEZse1Mz5m8DyN/MgCk6Rh85494a3yaZ
         BK5SeXsnBYO00MDyCIDnnT/OEk8uMiQkfG0cb0zYxERFhQ3DT+Bj9wh8cY/ReQ4X/3iu
         +xsZJxXE2sbJWuiVswVajattXwsjrQtB2srfh+t+9Sh9wuGT2fB+x+KzFvqeUYVcmvnn
         t/DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxib9QLWY8Fgz/S7WEXCRFT8vXKOvXhpiXjj0DQ8eMWCSzAC8BIOcD1tKlIlrTnX4JD5jK8NrsPUsvM9wg=@vger.kernel.org
X-Gm-Message-State: AFuF++nMf0xuq9I5ZNp1gDn+Ton3aqHfqPag02w9VbS6JMCxcSMjmJuc
	8hPUvrBnGhtNgnM5FGj6y8e2HKzGSa7QZk/MWt7eQaYDIV4wRm7c/fE=
X-Gm-Gg: AYBFou2CnkdVYKNZr94wQdMJXWOYPI2gIwe0O8lu3O0GYxHebcHEgTCWhJXUUT94KDO
	syTpB/cuNx8aaeJvHdkvEEABDWQiZLxu9WKevvG9WtExXlcgqC0bBDxb8LzsRKfbaRaEgy6hTzS
	R+nrmeYZ7HQt/n7pAaYhTc72xBCSw9JccW7s8w7orAAn20ThkKdFh7dfOMmXV9Cy0zVQrU6tgi1
	sXcFSxgFpopSDoEZIC4cvY39wKS4SVjF0j+VeL9EzS2O48qzYCV48KgTzbGxE8S7yneGzvb5Y96
	tNoGzORviYrjm1sSDh8h3tGEVAaMoXM7qFBFacykE0Czyq4BFvQRHjFxL+glCyVBSbzSU9nJOn7
	EYN5tba1qDZ91Fsf3aAh71K3/bYRy/M8E4/Axdy86SUcpCVZyQ1AgWruySuhsvtGjI2pyXw7qqp
	maiem4RIthuvlBwk4fl4nUGY06ticfCN3Us2EDujvvDqekHPpa8n7A2AwMj74q3g6MYux605J7j
	SiCVO66NTGiU8es
X-Received: by 2002:a17:903:22d0:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2db12674f20mr322398945ad.21.1788785066605;
        Mon, 07 Sep 2026 05:44:26 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm45350955ad.63.2026.09.07.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:44:24 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH 0/2] tracing: hist: two named trigger error paths that free a published trigger
Date: Mon,  7 Sep 2026 21:44:18 +0900
Message-ID: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both of these were pointed out on the list against an unrelated hist
patch [1], and both are the same shape as commit 6f86bdeab633 ("tracing:
Fix bad hist from corrupting named_triggers list"): a trigger that is on
the global named_triggers list gets freed without being taken off it, and
the next lookup by name reads the freed object.

Link: https://lore.kernel.org/linux-trace-kernel/20260907092944.3950E1F00A3D@smtp.kernel.org/ [1]

Patch 1 is the init path. event_hist_trigger_named_init() saves the
trigger under the name before it takes the reference that can fail, and
does not undo the save.

Patch 2 is the enable path, the one case that fix did not reach.
hist_trigger_enable() removes the trigger from file->triggers on
failure, which is the only handle hist_unregister_trigger() has, so the
->free() that unlinks it never runs. Leaving it on the list lets the
existing unregister do the whole unwind, which also stops out_free from
touching a hist_data that hist_register_trigger() already destroyed.

The two are independent and can be taken separately.

Reproduced on x86_64 under KASAN_INLINE by making the two failures fire
from a debug knob, since neither is reachable without an allocation
failure or an event that refuses to register. Same kernel and initramfs
either way, one boot per case:

                                        v7.3-rc2        patched
  control, no injected failure          clean           clean
  1) nested init fails                  KASAN           clean
  2) enable fails, new named trigger    KASAN           clean
  3) enable fails, shared histogram     KASAN + panic   clean

Case 3 reports in remove_hist_vars() rather than find_named_trigger(),
from the out_free fall-through described in patch 2.

After each injected failure the same name is written again and is
accepted on the patched kernel, so the trigger really did leave the list;
on v7.3-rc2 case 2 rejects it.

selftests/ftrace test.d/trigger before and after: 45 results, identical
item by item (32 passed, 3 failed, 2 unresolved, 8 unsupported). The
failures and the unresolved results are there without the patches too.

Donggeun Yoo (2):
  tracing: hist: take the reference before publishing the named trigger
  tracing: hist: undo the registration when enabling the trigger fails

 kernel/trace/trace_events_hist.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0


Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C488390200
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619992; cv=none; b=pUaqK8WvmaSIGN1LMcdFYv6ZlGrZfdby854xhf0LNzJGMTm5PAYASB/Io2fKfyhpL7cTHWrV1Lsw90hMjaU/n5VcGVMJj7UoHyNUtxki/45iyD3DlnQNkpbMFO1RywSarLkBGofJ8mPVlZ3Hc/9M2ibhtUI7EctMqqRqOUWklu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619992; c=relaxed/simple;
	bh=lRKOlDQ8umJZTg3FSzW0Rr4KYkJ8OL5VaTSO6fLlblo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=InJXl/9R6oSDV22qWtRPP/uxEIMF4ESAmq+yrp1y01vVLYvFNYimUlP2axaAXuMLeIDt+rU47tU0GPdk/n5zRetqghbDDtQ2/vZsC10X2T8baxCBBY0tE3scEQ/ld10x+RjD0kZZHiSIJvrp+I3u2usO/npvYGxgvjNiYD5pnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KRiey6Rk; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KRiey6Rk"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so739867c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619990; x=1791224790; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcQRCFFdrrvDKqPLX56RorRyNSAs/FHweIcyglmIQnU=;
        b=KRiey6RkvW+Yk5xJ6awLbfJCKs9BIlgWRdOqA2VKiKFOZrm0d+N1jKPwPq2ToywqEe
         WTlBQGnlTlsjBTIgwQlnx7NbviYa+czUq47pAAbTa9xOQP+STwPslIk+reLjSlYuavF1
         KCd8NvL1muISZzN8foPKtPRjaXwR+HP+87AYUaRWLrVPvubRLNbK+sRuQ/e+YAjuME8i
         KNs7qWXJJyol4S5i7AO9aqaasWK790ATpEO0NLFuhn1nK20xNEmz6af+Hm9fm8ijCITf
         wayad0BwXgFqqxTn3rFzo73kBE8X+pLdV1fuaoGRBEfk+JAikzCVy6xKPIb9esubSqeT
         SVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619990; x=1791224790;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcQRCFFdrrvDKqPLX56RorRyNSAs/FHweIcyglmIQnU=;
        b=j+AVit4UhHQPvefteRhxf3StBy+FOC3t07Axq8HTx3V/WZqw3d4IT+vHWWR09HVA1K
         vKM8VGc2Z6RnpL/taVnTCW0qdH03sPx9soq4AvumuNgpvOwd0dD7lYqxmKfwvTNA5tK3
         ojJsJkgbXGU+kbKrzX2whpmno1BhoW0OhZnsl3IidFCzQ4Htb+1LXWsXo+OgQSejqrQN
         94Nzoj46PGDjeJj03pnuI+xyN80scv0XkOJyG3UHUUR8uzbJDqjHTvmG6PIelk/7FKy+
         x/sUrOdj0nTVwyWbzUqNPlmL7M+J26vCvyCfgNQAx+aGN1051nulaIDmaiJpWQTUxBDo
         9CPw==
X-Forwarded-Encrypted: i=1; AKwUvBx3ilrpH1Yj7GNL5HrKL7fUVCThSlKpRegqx3MIFfNWYw+OtSuos9r987DZmUVLVe39eqwFFvyP8z0emvU=@vger.kernel.org
X-Gm-Message-State: AFuF++kz3w2S24XRg+kEzHaUKlhZgE5yRlr5NE1TJP4N+2gia/talnmW
	O6V2ynWAxeHvRcBqthAB1Hbf49gIWioXXjCszes3F/4G8DGaeoyeJO+znVyrM2IOHHqO50NTw2A
	b3oLQ3qgn/A==
X-Received: from dlbro1.prod.google.com ([2002:a05:7022:1581:b0:14a:a05f:b9e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42ce:10b0:143:5c63:23bb
 with SMTP id a92af1059eb24-146ce4958fbmr11365206c88.11.1790619989872; Mon, 28
 Sep 2026 11:26:29 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:47 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-9-irogers@google.com>
Subject: [PATCH v6 08/26] perf trace: Stop at internal fields when walking
 syscall arguments
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Since v6.19 syscall tracepoints may end with __data_loc char[] fields
holding user space strings, these aren't syscall arguments.
syscall__scnprintf_args() walks them anyway, printing the extra raw
syscall arguments at those indices under the internal field's name, and
trace__bpf_sys_enter_beauty_map() considers them when building the BPF
beauty map. The internal fields come after the arguments, so stop at the
first one.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 1ffe824ba670..35d39a3fe803 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -2647,6 +2647,9 @@ static size_t syscall__scnprintf_args(struct syscall *sc, char *bf, size_t size,
 
 		for (field = sc->args; field;
 		     field = field->next, ++arg.idx, bit <<= 1) {
+			if (is_internal_field(field))
+				break;
+
 			if (arg.mask & bit)
 				continue;
 
@@ -4134,6 +4137,9 @@ static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_machine, i
 		return -1;
 
 	for (i = 0, field = sc->args; field; ++i, field = field->next) {
+		if (is_internal_field(field))
+			break;
+
 		// XXX We're only collecting pointer payloads _from_ user space
 		if (!sc->arg_fmt[i].from_user)
 			continue;
@@ -4188,6 +4194,8 @@ static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_machine, i
 
 			/* find the size of the buffer that appears in pairs with buf */
 			for (j = 0, field_tmp = sc->args; field_tmp; ++j, field_tmp = field_tmp->next) {
+				if (is_internal_field(field_tmp))
+					break;
 				if (!(field_tmp->flags & TEP_FIELD_IS_POINTER) && /* only integers */
 				    (strstr(field_tmp->name, "count") ||
 				     strstr(field_tmp->name, "siz") ||  /* size, bufsiz */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


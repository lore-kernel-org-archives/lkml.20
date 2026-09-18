Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79234AB1D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740441; cv=none; b=drbl5l/cGnutpDbUyL+BfDEsOBF1WBXLJ743Fp4DKbrFUBC+LUMvAEO7pjvYhX7D61Wcfr18jUfP+UmeKsqG5pWP8+q/P284SWUuEDH25bMX6ca4kJT++5UgHoRnM2C8fo91Yln75uIUDu/3m+3lwdZjsD291f4Elz/DB5fpoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740441; c=relaxed/simple;
	bh=xfRcv72oCKsm8YUT0mkCYR1SUgwh6LccLr5w+CCj9fw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z91pwD4831CMIsVBsqUKEIqwqqmSqJmU379rQTEQVi12iC6awmytCx4pCzo73guhn8Huxr0Pv+MHX5ciRpL1yRr5dS3gxstTum71yj+1yTR0G9bYTYqiATbSjsa6eW0hDf6wQY3sKi7F9JkE4svUwmKPVloeEMtdsIwBGn/zCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qv4gXwGr; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qv4gXwGr"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1258295a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740439; x=1790345239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlPkoIysHywTuafUe2+1T6G09izkhe5W3SzFqvJ/F0E=;
        b=Qv4gXwGr0LLY16LepvOOARkvfpzsSSJf5meYpC1plP3csArvp5tOoFrf4aJWcTfLf+
         YjX4/+XKbVguL9pGAW5HQqHCuMhjECDLQVgxWEX/eA0C4HUpHJQUpNU0j5lPDRNFDysc
         qUdsI+M2aLYwiFl0lxeFuAEqE/801z+A2wYca8AQV8h7Jma8kbcG7vQR9AVlVa2GTH1f
         aIR5DEEz5XywpZkEdD5GiTgH71FDY1PK9pBiu6oAIde+n2Lwrs3MvzFeTVt8bN4u8OBv
         zQS58FaHjo5ZrF6g4uYbCFpeIV/UgDa8Zjrbp96Aewxu3iSmvjjSmHh+FxVsYp0Pj9vk
         VlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740439; x=1790345239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlPkoIysHywTuafUe2+1T6G09izkhe5W3SzFqvJ/F0E=;
        b=YkQMecwKreZ/GsbFMJ7WVUiPVw6fHSyBUFrcaCXhvxZT53+pyVOqYZN3vClKfy7gwd
         RPIjP4wlv+li9V2Wow5dPpMZWoFia4A5If7IMK84F/rJMH11jC6F3h5sa8JGJorKBitp
         430Y83DPy6f+/NgGiKU761fMU7S8fjGHYiYEaUYIGxb2KDZD9FPaE82EpwiLrIFv9vvS
         Ae/gAvucaptr2S9czONnOUaao3skxOD9RfsECh/KoibzVeqJ7ukstn5e5Evtx7Srw3X+
         wBS2vgPStEpTkoesFRLZLjHi2+AxhE9OQRyip0Q5nuG7na6+c7+vtAEKPnn2JMnYb+WA
         fNkA==
X-Forwarded-Encrypted: i=1; AKwUvBzktpUQUpy6K2m2jHmBmvfY9XeJCagXSEI1DIdf2XvJ/t2WwWSlaKKm2W1kldlh87wNXdVOX/CT2fzSY8k=@vger.kernel.org
X-Gm-Message-State: AFuF++kgppB02/aWXYD/uTyaoGQ+/pemmCG7EswjkkdSqJB61sB67fHq
	KKFNtfOQj95fmSjj0Muq57ew8IKTMo49g995G3jn0kj2heTkp9mPc60Gxa24wDUPTVd34PygUNi
	cmT/3l8DWZQ==
X-Received: from dli23-n2.prod.google.com ([2002:a05:7022:297:20b0:13f:c1b7:470])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a45:b0:396:669c:b5f6
 with SMTP id 98e67ed59e1d1-39e35df8001mr10687351a91.12.1789740439153; Fri, 18
 Sep 2026 07:07:19 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:48 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-6-irogers@google.com>
Subject: [PATCH v3 05/16] perf trace: Do not set unaugmented BPF program on
 sys_exit map
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In trace__init_syscalls_bpf_prog_array_maps(), the BPF program array map
for sys_exit (syscalls_sys_exit) was populated with the result of
trace__bpf_prog_sys_exit_fd().

When a syscall had no specific exit augmenter,
trace__find_syscall_bpf_prog() fell back to unaugmented_prog
(syscall_unaugmented). However, syscall_unaugmented is a sys_enter
program that outputs enter arguments to __augmented_syscalls__.

As a consequence, when an unaugmented syscall exited, sys_exit
tail-called syscall_unaugmented, which interpreted the exit arguments as
enter arguments and emitted a duplicate, corrupt sys_enter event into
__augmented_syscalls__ right as the syscall completed.

Fix this by:
1. Returning NULL from trace__find_syscall_bpf_prog() when looking up exit
   augmenters and none is found.
2. Returning -1 from trace__bpf_prog_sys_exit_fd() when no exit program
   is present.
3. Only updating map_exit_fd when prog_fd >= 0.
4. Clearing err = 0 when trace__bpf_sys_enter_beauty_map() returns
   non-zero (indicating the syscall has no augmentable pointer arguments)
   before continuing the loop, so a trailing run of such syscalls (e.g.
   'perf trace -e close') does not leave err non-zero on return and abort
   the session.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 2fbe1bca511c..2c62d38b19ac 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -4123,7 +4123,12 @@ static struct bpf_program *trace__find_syscall_bpf_prog(struct trace *trace __ma
 	pr_debug("Couldn't find BPF prog \"%s\" to associate with syscalls:sys_%s_%s, not augmenting it\n",
 		 prog_name, type, sc->name);
 out_unaugmented:
-	return unaugmented_prog;
+	/*
+	 * Do not set unaugmented_prog for exit: syscall_unaugmented is a
+	 * sys_enter program that outputs enter arguments. Exit without a
+	 * specialized return augmenter returns 1 directly from sys_exit.
+	 */
+	return !strcmp(type, "exit") ? NULL : unaugmented_prog;
 }
 
 static void trace__init_syscall_bpf_progs(struct trace *trace, int e_machine, int id)
@@ -4146,7 +4151,7 @@ static int trace__bpf_prog_sys_enter_fd(struct trace *trace, int e_machine, int
 static int trace__bpf_prog_sys_exit_fd(struct trace *trace, int e_machine, int id)
 {
 	struct syscall *sc = trace__syscall_info(trace, NULL, e_machine, id);
-	return sc ? bpf_program__fd(sc->bpf_prog.sys_exit) : bpf_program__fd(unaugmented_prog);
+	return sc && sc->bpf_prog.sys_exit ? bpf_program__fd(sc->bpf_prog.sys_exit) : -1;
 }
 
 static int trace__bpf_sys_enter_beauty_map(struct trace *trace, int e_machine, int key, unsigned int *beauty_array)
@@ -4401,16 +4406,27 @@ static int trace__init_syscalls_bpf_prog_array_maps(struct trace *trace, int e_m
 		err = bpf_map_update_elem(map_enter_fd, &key, &prog_fd, BPF_ANY);
 		if (err)
 			break;
+		/* Only update the exit prog array map if an exit augmenter exists */
 		prog_fd = trace__bpf_prog_sys_exit_fd(trace, e_machine, key);
-		err = bpf_map_update_elem(map_exit_fd, &key, &prog_fd, BPF_ANY);
-		if (err)
-			break;
+		if (prog_fd >= 0) {
+			err = bpf_map_update_elem(map_exit_fd, &key, &prog_fd, BPF_ANY);
+			if (err)
+				break;
+		}
 
 		/* use beauty_map to tell BPF how many bytes to collect, set beauty_map's value here */
 		memset(beauty_array, 0, sizeof(beauty_array));
 		err = trace__bpf_sys_enter_beauty_map(trace, e_machine, key, (unsigned int *)beauty_array);
-		if (err)
+		if (err) {
+			/*
+			 * Not a failure: the syscall just has no augmentable
+			 * arguments. Clear err, or a trailing run of such
+			 * syscalls, e.g. all of them for 'perf trace -e close',
+			 * would leave it set on return and abort the session.
+			 */
+			err = 0;
 			continue;
+		}
 		err = bpf_map_update_elem(beauty_map_fd, &key, beauty_array, BPF_ANY);
 		if (err)
 			break;
-- 
2.55.0.1082.g2b9226bbc0-goog


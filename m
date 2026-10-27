Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082994;
	b=VOlDM+at1s7OsO1lV1PnhloHGX9dT4w9zippEt+YqVlC/b9HguJYA1TEju6eyC/IgA9v
	 zjTYEwmZomlFMJ0SA4ckcuhi/KkEYWrff+lY7GvEeParbL3yvdLIlfvTrzyeSvlMtgiuC
	 E8ugs88DZAlinxNvo3YkdVH015hncCflPehKXEU+2brHrQMujejm+ziAJPlJhl0tOVHjY
	 l4QyG5M0A9Q/oFncOSl2g0k5B+1BVbc3RbjXwmaafE50+yoKBrw+gin5v1MqqPreC06sp
	 bznAkhYNKTCCqVNb49k39qGrvkizRynPIrzFVtifAbF3inzYYZiVZsgea1KuU7GsSew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
	b=X8Lm2FDgrNUAa2jOShTRKXc5lmnzSag4lcn3EUb928KisbrN4EBkntcodsA/hdHSrXkQ
	 K4EoUkpXpKaeXZpAz0pnxvkLbtXwhAwIv8lfSu63sTSP8K3gxLdiF+6ZROeA4SW1vq2Wd
	 ppa7Gh5xSno695ggPZLpyC6otG7FakpKEMx/8cRf4Nzt+qFx2mJ7MvjNa4p687Xi9lMkr
	 0hmKZsaicxnfCyWaWEtQ1vCKG8x1mZPCbQUzHUYzpWRUhm7rxI1hBxbeqMqAlRXfs2a2r
	 VwDPbUtK3p28Br/0/p+Pu0kqxqEn9Wv031hzyGPhlvUW0ZpMqfgaTA4qXRgyWIXaH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4449606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4449606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2722941a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082993; x=1793687793; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=CSpdWQ5sW1tM9TEYi7fzC1hlNCiQyd5Sxmr/vYfmVU2KSb+XVcPTsiehoQ5jknIMuF
         JTP6RgKoJAV/cshortkM393JqA4eFHgzst3osKjj6xSzVB93VoeGsdI/7zR6ZwdlpbNv
         ccNchm+EY8fwa76i84kMtlSxGKBXE2C6bXW24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082993; x=1793687793;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=D8vomGcTNth3ZlxWDkTQ/vzdHC7Ek7dgmEXJtz1YbbAAP1mqNBa3G3cIDssPjN2YYi
         +S2ypGIIFa5Huh1pNFszaLqnPPbvxGC3Kw+UvGTbkfXWtUcVpl6SLZHcODSZKJh/Uoth
         5pJuVF5MwF2BsDGot0yoh7toDIXbCa+HqOBWYKs+68/xdaPsIlx2TzWio9RQ2Sa/GamQ
         G79mYf66/ldefLfWnwpVxbDey3VtIbx7TMLPgk8FnQrwx++r+Ohi5y01OSRYVFho01LP
         fTfFh7FkLbaulf/Htai4atsj6RvRjJTfKTOPF2t3JZN5FesXLHp5anO8LpjA3Q8ms6rp
         ClgA==
X-Forwarded-Encrypted: i=1; AKwUvBxahL5PSgBqn8j+rOrwTx+vhSILl+wpPdMeU0nnfmX+Zva3SU9AuPsIE5yiEeHGCf1IK434cvOF054mRvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBshxDTchU/jq/l4m5SDJrzByUWoocYyc29tPZdr1FKWqFfyiT
	QPgriQlRl5oLKtbnYBUWzwuV8trcHTD2UgCXbho/nIhmssOFV7++yVJDatL4vqDf9O0=
X-Gm-Gg: AYBFou3P0JFmaj0knYgn5fbgN6yoKH7kvC++wJBQvRF9wxw4zZO370Is7WopUtXKr/I
	zoaQZ8fDYkS4dtR3qbTJMVIPOxOyTqY6Bwe5NV/oN7RKSoipzsASPYOewp/vW/MCPw0bRFPgPZ8
	/IFenR0tFLe+PMJ3pZRejkfA+cEuCQpFZ8bt6/oVPA68VOxNEpiLrsBw5EpKm6LqnrkYy3TPuqw
	6EzQca9adm+O81O97oZKXccLEFKTBi5sI5g/9d2ZZOEZXG49l5VEeaV9HXzUBmw9WSaix4jEcfW
	qB+tc1T6hUCwlMh66ZtEODGds53XvqAgvh/a3oWF+I1UrL65Ml1ejlpelz8tLY0Avuce8DUr2OY
	nKKe25Hjz5M9g+P/F1AyBbBeK/NiLaRoLdDeq+353j3/qfWB0G5qpYlfZC+N2F2LKJ7kZGjDDYy
	oOBn0nuNmpV+ydSzFSxosQAg4hGynsUgFI7M9LhXizwvNfONHNf+Z2oan8d2TL0KQ9iE3x1l0KC
	ClMYE0gXBPZ2FcUPDykdIeR9q6Qc0gko3cALx8zTNcRqvwlBUryYPdlt80bDu4gZBJ3jrtKkKkL
	uMmTnRRTBvdjhOwHUH7aDWWkhBqBiIRKP+/0K4Anyzq3spltxzYWownIgo53AK565pA050gn0uk
	orR0xXWLOZZD+1/sv8vWrUTI=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr6210081a91.18.1793082993200;
        Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40456f65sm2331529a91.13.2026.10.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:28 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler
 stack end check
Message-ID: <7c4627a57202b505bc03837680f6b43c2683bc07.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

There's no existing test for this, so let's add one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..929a60db00d6 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -854,6 +874,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.54.0


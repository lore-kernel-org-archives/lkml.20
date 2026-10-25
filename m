Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965903;
	b=lzmGgbncPBWhte5Gj7epbkeWoHXMzoRfUC5OVTwrfw6EH5PX2v2Ehd3HSrMFT8/NG5Pd
	 Td0DD8hKR+5v/qh+bWDlqsGlmqgSukABpdmSm4DWTcBwE5HjzBrSkb/28u/9hOg8D48Jg
	 iaMaI5PReDgKzAMM3kqlbb2ke1Rr3pFUzRtKspw76tQ1tleqftwJ2kNR5UgThQBGGgNLO
	 gNGxsU0vKna6zvEbSfLsi7QsTND4Gvj0unoaWItWkGx4J0uApCHXYdsMKse7KVOUCU8CH
	 fwDvF7RPzDoQrrkIswCVCgrPfjkAwVupgvykH5lgOfQVh3PmRlzDwLGaugCcSc4AcEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=aL/VaqLWH9lnIsP5naB5jHKeC9px7R9A0oK/nE/LFOM=;
	b=ASQu1YxMI1i7YgDUJWaPIPaRQDEGLbrBAE4ptzEpeaSQ+GN8POwvoIgWfcvVN3FM03Uf
	 2jKv9UX2L2EryVVgmiRfSzrPhKIzCPc/x8Sb5xiFJM9LlaMhqCOvKsGRMPx9TYNlGPAfD
	 Qb1lgj3/VUNjTI5pLE4TYHPk5WlBqoiwqzSR2fGHAwZkfPgC8II92YEyb0ofVMWMLuzbB
	 GLKCduZdKejcK6GOncu8EBifvULiI/dOljn+XBgrDpWWLvPGT77zNDrls/gJswWXQIWEe
	 aHjfwE46+mBUSmokTmhNo5Kpgash16HDBOgMVLRJzMhFa4ly5ctQm+y/+vL9vQn8AkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD9B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD9B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so2661107c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965897; x=1793570697; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL/VaqLWH9lnIsP5naB5jHKeC9px7R9A0oK/nE/LFOM=;
        b=u6UwIPrCTQKmmEBfMsxfOJL1fS1Cbr/zEvTWGruSs32PgfFfXLjdbOFNj6BLfmJW+D
         lbISytdeajDuLBMimSGk4v3f//jZGAJ4CXsHLrVn1HY8OtxwLjjacAjIvnQ/KZHBTE6H
         idpBVhHYKUSYbb7V3HljoM8IRepbubMq6MwFSJOfrzJDotvifYgy0bT8R89v6HVHWSGo
         YJhvmZu9zzAtFQ903Izot/Op/TY85fhaBcqnCH7uiFhL06Zsk/1upaWTsM5Hqazgtfhn
         ha3MB2Ptr0vWrqUt8jtVuqdCjWUIkJDGOEVXj9vNwLjP8+e75ih9jTa9mHDfJfakLf66
         P20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965897; x=1793570697;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL/VaqLWH9lnIsP5naB5jHKeC9px7R9A0oK/nE/LFOM=;
        b=Wnm+d4hzAHR5GU/6i0qtQwhQja2qLHTmngeYF7CyDsMANFR9KcILSSAYGvN8/hLaR1
         9Gde66ggfPBu/BQYI/LLmK3JqVpz/FnXcQhkoFhOLecrUKh/sfDlAJISykXcuXdIxpwD
         yXR0TP48V6tgbq5YArpRMRqdlLSgT3UAni6Tzvv906Q+k/oGsDozEagFSH2G85DHFmhY
         xaXwcSXpM73/8EngGNjuhtJDQHY43itgSAJUxxvydZ5f4HDyQ22Ha4eCQol8leSWdq48
         FriP3PqjQnraqScQudtu/sesiMS3pl6Z51AhuOXqgt46eyu6smHR58HrVbLZtNq5d0Mn
         +ySw==
X-Forwarded-Encrypted: i=1; AKwUvByNM+Mi+gq+ylgS6QaCCaBhqQ9NfWknvBTaavfBpJ0Fx7sXtF7Nm/rbNM1tYTTZlJ48fEpb0VHdp1FNEsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3kVFur+JP0KDnEQyNUo4h8M5cOlz4ex/3F7YD9dXp5J93eqe7
	t7IVom2n4Pgm0K0VCsyN+pg1nAICxiEpFqdB7F6HZTwpV4mqLuded9dFWnrAgKql9Cw+VWXT5Fn
	uEsOB+DDzXw==
X-Received: from dloo4.prod.google.com ([2002:a05:7023:a44:b0:199:4f68:8e41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f06:b0:166:3e26:c4b5
 with SMTP id a92af1059eb24-19935be7e56mr7748009c88.18.1792965896672; Sun, 25
 Oct 2026 15:04:56 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:49 -0700
In-Reply-To: <20261025220349.1244499-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025220349.1244499-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025220349.1244499-7-irogers@google.com>
Subject: [PATCH v1 7/7] perf session: Check lbr_stack for NULL in callchain__lbr_callstack_printf()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

callchain__lbr_callstack_printf() can be called on an evsel with branch
callstack enabled even if a particular sample has no branch_stack payload
(sample->branch_stack == NULL). Check that lbr_stack is non-NULL before
dereferencing lbr_stack->nr.

Fixes: febea9ec382f ("perf inject/aslr: Add ASLR tool infrastructure and MMAP tracking")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/session.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d9d06337933f..a58b4fe44b62 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1302,7 +1302,7 @@ static void callchain__lbr_callstack_printf(struct perf_sample *sample)
 			break;
 	}
 
-	if ((i != kernel_callchain_nr) && lbr_stack->nr) {
+	if ((i != kernel_callchain_nr) && lbr_stack && lbr_stack->nr) {
 		u64 total_nr;
 		/*
 		 * LBR callstack can only get user call chain,
-- 
2.56.0.307.g5fe7bd680c-goog


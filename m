Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815112;
	b=szKwvccFpWPfr9f7CE03GptuwiB7yWSeK32dB//7R4Su5muK6eTKxTWcfOzVSHiQwQY0
	 4bkLWb12Farcl4kAFguauN3MaDKe/jfN0vRqKNUmhmb4A+fVzSzHH2ROcr8qd+642K/EB
	 xnyyrixss6J67V/H4SB6k59kx1EJj6RcTzEeCIsa1rKK0vepjo5xHfRL1wZFc0wlVc6yV
	 IFC57OmuIVdWZ7yxPzV2cQMxBry2DPmQhl46bHyBEgyukuO9nk4PCAFQ+Awo0CfmWt9BH
	 YK0AhEzXgQt+oYzu4THPwGp/T55/4DXAqG7zSDkVQ6+7Xx1duR3Qjmj/8uEyFSwuojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fi+3u17y7wvoAtVtKo+5P36PWlBbkMmWpTM+zRtf1CI=;
	b=CaNNTRvOCwZ2sfU9khjQzp/UzTyqmWQ9hKW+6y8AHu8ZZ0BFyk+o2W2eKQHMsAcl9qBA
	 Po3vnqBx3f9EitIGE0MYdvZDJ7hWoBi/mUDCkd5f3mt6txJBpXwMxAhm2jnbscoym+D9e
	 Qv7uJQ3faeaTs0ktFVi4DDhpI3z8sJ7MPVEcSHW70fFPNDNCmPb0jaQL3Aex0tRAQDQQK
	 sjOJC75QrjJIRaL/InmpVs3w2RycSodxtQS36Kio9dGEuJE+4G+M+rBjHdN8jASVMP42r
	 rgGQwBjxyI2HBR1PAqCAFEp0C93L+2B5onYiy52LSy3loxV7QIzXcJatVvvWM0F0h6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L8gvW0Ia;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE0606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEE0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L8gvW0Ia
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so3147326eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794815111; x=1795419911; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fi+3u17y7wvoAtVtKo+5P36PWlBbkMmWpTM+zRtf1CI=;
        b=L8gvW0Iadb94iA+kpPaV1ebIqatTEoVLO/aSaAvQihWHzsFQbgZVUbs68KH2FCvL2J
         mvztilRzHT6GgNAwMRWm8I6AnwhwRRU5/N70QXVIKmYGBYFEpWECMBh6fAz79nTIamv8
         xPA7es+6x5frYqRdMc0mrsQ/81jyurduyHj64zPBdUyk4uS4ygQLLkBtlF38vX+WtMR6
         ojfjuSzAVLA54i92t8oXTKdkLI3rDaVbgE6KGGZWCPLuPP/d5Cp6Yj+6xytnFPor1IaJ
         b0LouXpX9wzyk5XFDlXeebDUcE0OCa1t436du7eF9UTffN6s24G2rIZXGKPEqHD90nEn
         B77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815111; x=1795419911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fi+3u17y7wvoAtVtKo+5P36PWlBbkMmWpTM+zRtf1CI=;
        b=kL6/zVdrhOTeL84qXCcV/wfByCu5zr5wex7EAiPOpcbcMJaF2orcavS+SrVEEbNEs2
         nDz+SC7E7dIBdxT7E4vz6+66dCDaLD/NhOdrtmyDHZhsVo+T2ilk4mvzZ9PrJSqt9hC0
         kHU+Omy53eO5Znwrf4mYdlVE/RENumxf1/Rlk0lysmHmnkEgfj3oIiQnhiMWiSE9JFCk
         0CfAEizLz1IvW9xAwxdpZ2OCYqCD6qu1ZwEriqMkJWCS+5+YpXFnj8CUaD3CL170y27a
         p/2N4p2tzzw/Tcm1cjLMtWZdsjs+zx+468i9IOHrF1/wPFXMCR3u7UUh7c+yaMgt5ax4
         /IUg==
X-Forwarded-Encrypted: i=1; AL+hErFlvL3z90J4Ku2grDDzaqUY3xNxTBfmSI/bYGLQJip++fu53rD7NKMTxW4Pc5NTICxLXksqfrE1MBxUJcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z881HtsAf1Xp/o+UDUZGy3yaM8YukjuWRRC2nynuQvdPjhLTR0v
	btvOM3EhDtdKonT/1Ts5p8+mE159U4n51Fdvk/YvOUPL38QsTZhTYsqOVzpmFGi0KOipOysYyID
	yv7o8R6MrPQ==
X-Received: from dybrp12.prod.google.com ([2002:a05:7301:460c:b0:355:e5a8:715f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:cc9e:b0:372:2ed7:8f89
 with SMTP id 5a478bee46e88-3796702a36amr9735755eec.34.1794815111073; Sun, 15
 Nov 2026 23:45:11 -0800 (PST)
Date: Sun, 15 Nov 2026 23:43:57 -0800
In-Reply-To: <20261116074414.3174737-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116074414.3174737-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116074414.3174737-3-irogers@google.com>
Subject: [PATCH v3 02/19] perf/uapi: Factor perf_build_id out into its own
 top-level struct
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document struct perf_build_id as a top-level structure in the perf_event
UAPI comment and add it to the PERF_RECORD_MMAP2 union comment so future
sample types can reference struct perf_build_id directly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/uapi/linux/perf_event.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index c49fc76292f7..deb7c42d109b 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1099,6 +1099,18 @@ enum perf_event_type {
 	 */
 	PERF_RECORD_SAMPLE			= 9,
 
+	/*
+	 * Build IDs may be present in a number of events. They have a
+	 * consistent encoding of:
+	 *
+	 * struct perf_build_id {
+	 *	u8		size;
+	 *	u8		__reserved_1;
+	 *	u16		__reserved_2;
+	 *	u8		data[20];
+	 * };
+	 */
+
 	/*
 	 * The MMAP2 records are an augmented version of MMAP, they add
 	 * maj, min, ino numbers to be used to uniquely identify each mapping
@@ -1123,6 +1135,7 @@ enum perf_event_type {
 	 *			u16		__reserved_2;
 	 *			u8		build_id[20];
 	 *		};
+	 *		struct perf_build_id	bid;
 	 *	};
 	 *	u32				prot, flags;
 	 *	char				filename[];
-- 
2.56.1.703.gf848ed807c-goog


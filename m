Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621754;
	b=KxqhsPVa+sHsGAhFlOk7vGJ5MhFx51U/lYgpWuPA75hVlFLoBHTWReukkpzSI5EsZbm4
	 rPav2LasZqlpv6NFZzqSk9l944wPB9l+ogjIcRB5O70fqX/jgwjd9AXFWqUtKqEXfft38
	 4s1QcrhLModlT7hZTC6NWguO8NCKmnlFUV8bGlkVktm7zFxDoLWY7DmTLS/jfgEn1VlZa
	 baf4gGHCf1XRs+POL+06k55HXAwVpM5qCeaqsZZFZ/7qfO8tclYhs0IgeqzuAkwKrwB3V
	 CHiA2q1CRkLGTpWHt+boBGclgD0OzdekD7SiCOQe/04cikyfYAstVXpBpCKKLjt/bAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
	b=cH9B4jnDrQQv31X+IiJDng8n+JRg7RkfQy7Lz0VG8tAf9J0t/0w81qgSvZkFtAtoEXtE
	 AoFmCj2OXIaH3f6w36rMP8rxyEVPKwIx4NbVTJpsItmBe7eE8b4xl6vUj3b18IUlVc0UV
	 w45Mb2o+cjzqnOCbi2ut/mpcqBGDSlUuXlsUdmOjS+c0yB/SmlpJ4LJbt9fxeG8FQiUgR
	 s7Uupe6ha0ztzZg6r2SyLVy4VhtNHo6RLP2od7Bi0BpuCgsF0uVleptgGVVwtK0dI/xuW
	 yC4C6lDeq3wzLXoScLMCOxD7sZsKJZ4Srw9nfpul3+EEOuTrX0/FUZw0YYZRSZBQuJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z4VfuZWa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F2F60A5BCE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F2F60A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z4VfuZWa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29635565e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621753; x=1794226553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=Z4VfuZWaT09oEzAUUIgkXpGeB9E92LycV8HBgJHRxL/tTgrdXbB3SiqZKXq28sIEHV
         rinm6bhZ9rBZg4ut+jSBwZsGEghXii0u5ZgJFbJMT6NY1l+DwrrEJ6C2kGLFiQ5nVl5s
         TZt/j3hWFOXDCVpERxmeDrYoezRVvglYWY+nSZSzzz4sed+8dK4qaj7z3dSO1UzUYPUC
         QScMDmbymPqQ+ptTQNPjpzPuY5yNIBgrzkoalMNL8ahKvMJDNY4gX2pD/3N9B6efthlo
         1HRxS8QnUKiE1Tha+7ZYnhY+6mlU8Usl3laBLTH1rI45j6YDU9fLTagsc7ZFml+Hcrxp
         riUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621753; x=1794226553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=DiiI/aCUjAvjo4bOmaq29AImYv+kJZJYv8bpBbBZwbA0nsuyoYLh68UVDL+IMdeVAM
         Fy1MnuTQP54dK2O3knCqxiLMjAzMpIzVqOL0iCLHqK7wM5hH+h4BFF88YfNqzsq94rg5
         FxYjJZgxm0VfWbxUw23b54AYcZLsf+DHZfs4S3k6PHlcIWWfu2He81xMHGoE4+avbdIY
         MheM/gNXRNzfdRUx+i9eIEJij20dGB3GloOvJbEAv/ht45J31pHkiVzN5S/8M6lfPpnI
         XzmPoDodxPkXskEcgzdhB9fuEPp0pPEge4Pn85enB0klfhvBeRSLHXvE7/FpaUYJoBqg
         1krQ==
X-Forwarded-Encrypted: i=1; AKwUvBxltvJl/AM1oOIHyv/sS767QjnAReXXE0iqsc45hnBGw6w/lNFnglJjfVKl5nA7+8JVABqe841A/cn9OfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pQWX2Jo4nRU2SoMRKjPW4y99eZOW1AJIIuHv6TJcSMopBnaXM
	lKO3UP4G+tXNjHp7c7joCdPVMPVFMLtEC6sCIeLYPQBWZrro3Fndk2xLUpgmW+/2x10=
X-Gm-Gg: AYBFou3fCbkPIrkntZXhU5PWNI7zbnuFPAKOuG0sDGJOGj/7ELd0R3WyibOjUSIYGrr
	OoHT7X5kfE4MKJhxjRGfZ7E8ZgHnaI92v7Jo6GJn0JBB8GrxetkVE6ilAM1RKuo7XOyxgStehRi
	jTUAz80r/AqqTawD1Yep2kaAh6CU8rjQPMeBWr9uOZBIUPnJ668bYB1sffP2L3lxQ86KmElRlXY
	HCuRzCkHEF1zOX5rMyFYBI8BK8iRztJoNFBLHQb/faVlOTa0IvLvCbWItt8WgBt0X7mcowBCh7g
	uX9O6CJkG6hJqUG40/0xDRzb4Y7xOT52+ZJDVsb/Uoh9yljICeqpW7ul5q/P3oRykuYct6ZrNn9
	Dwusm0SbOE10TAC/qJGzNWqtMgsZ3GDMJvOPODwjtoG4vsiFvV4eycYfoQu9vqEtcZBSIh7RyC4
	hTKUCZSbRN8rzEZ4UZb8QVyDdSu26+8jxAks1kcJKI7HRuNnZi+m0qzD7d8G+dpp1E3hM80VLr3
	LC3ygxQOdSSaSaG9h2AmAzr4RwA2/OcrF19Odl1xI0J19UM4nZ+vXt+Gye1Zcco6RlZKtwCX3VF
	BEWRe8NBXclZdQpySAFTlCPuiqXCSsjP
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr230066925e9.27.1793621751493;
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:21 +0000
Subject: [PATCH v3 07/18] perf python: Expose sample instruction length
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-7-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..525d34ed08dc 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -215,6 +215,7 @@ class sample_event(_sample_members):
     sample_data_src: int
     sample_insn_count: int
     sample_cyc_count: int
+    insn_len: int
     type: int
     raw_buf: bytes
     dso: Optional[str]
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 60dbe2dad5eb..d2aff058eb89 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1380,6 +1380,7 @@ static PyGetSetDef pyrf_sample_event__getset[] = {
 	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
 	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
 	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
+	sample_member_def(insn_len, insn_len, T_USHORT, "event instruction length"),
 	sample_member_def(flags, flags, T_UINT, "event flags"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{

-- 
2.43.0


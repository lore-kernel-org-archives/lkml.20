Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026484;
	b=xuaDApHDLto0DAAPg0UphpAOPOmvhvKBymSdcqYX9xLTHb56w1vuyauL4LaqHGBjEAIh
	 PDv1+VPDSPgJDAbC+o3yRtOsHJNe/X4KaAnTPh0pLmvUeVvXnBj2Ou4Ybj9oz7PHVDZpH
	 Cj6n4NFH4lghhb3docOLlEe6CR6rKWavHQL5B5wRb/vyNN/q0rICbQmjQMtU9GQL+0mY5
	 xOB/H2lDv+GdznpBd2TnImTTj6dOXGioPHAlB27c0eeTtD9c5Xw2l/FBZeX0UWV5/LUb5
	 FLT92a2FZjTQpgN8YTLgjlZLB2QLxYhrhl492zUnJ9lEchUsslmwZkindtmEaelIDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=bhIeVdxbCQvAtLfzgcv7yTTbFSpDpTi4GxYPfp+aPnaxlHsCG154oHPtinK6aLW2GyHs
	 nqwZJmyBm0QfVNqg50NTfsK3uzA3Gd5PdTq4cupYsCwOR9mJu2xXhTCrBPZJsO2VkLa8i
	 6zsgJsYHmzddXKyjyLTljKbEpw9V398+ARffTo3tz/o3LzT9UUFbvJxyTFW0OdDV6DasH
	 epjt1/rFKt4SnU3f2A2ND3Oo5Ifg6Pkf9QvmKHF5mbDeZFKL9HLfXLz5RZVV890B8BEeD
	 yUcOxeuVsideQEDCseOrEh00hSY0R1WJ8tnu5/yvv9VPaCZDQMWXgNoNqhuYOM+dPIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BCjZplEl;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80968606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80968606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BCjZplEl
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2163486eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026484; x=1794631284; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=BCjZplElqqSWtaFxAjFUeGqdp9Gav6nTfkCMGBeM4NxtVHBzecqISlPmQJVal7qYUX
         HV+bIE9gBe70Dg58WFu3Tui4XkzXuQ2gN3YW1EYRRrAuZfLLFeL6/Li2QGp6GF0zaXMN
         Efz71a2l6CuBntw3IDd+nJbeFLj7a2HseMCtHaVQzwyXu7LYbDRZjSyhHJCx4yqg1wr6
         xlNsJmI/znkf5iCXvrmd4g8csk4hqZhNDcoPTadYqAX3IoA87+6Loezcv+jGECEaX1Cf
         A0dsMdTtVjaxobSxnqInlTVtZzOjuxQXgxj/5RzYt9ytiT3uOy4nIxSFyc6eEovT/WQr
         CG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026484; x=1794631284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=rF1R9zkE8YvR80zFOTdJCFNvjy758zsIEiNgxxMx+WKba3U1pTPJ7/WAaOdHlABKcm
         HCB4L5FbFo/9zq4xY7Pf0lGjyNQgveCLNjkWNZHgDnunpUlA7qQNXdPqtc6Yu1tg14CL
         TksS9+ZBAT5HHhqrFzdzKA3vHreCBqo5fhFioSIEomZzQQPtunJkgSDqt2xkgW4yFODb
         i29Rng+B1FJQrZxS+Qh2XHAro+ESkxTFdKAn20VHZzy2vXMGsP/fVJBFyWinsvra2ulj
         LTZ1cOzLtnIlOF0741ISF+50mIMo0urDHLPzJHwCYY7FbuSAym23fCmCNvGeoB1xRu5t
         tFZA==
X-Forwarded-Encrypted: i=1; AL+hErGMkg0MDZhYQVf1VGOgy2HnfzNZGm+bpLrF8fLJDYsjweuWJ9MeezUlftgjEq0ijGL/GYURPgbN3K0Sjrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YpmEiTecTNFFIZZeYar//NN3atYFIDb+drNNnverojLmaLcRE
	GcB+7cGy9ThcCJnShQ8XOlRNIfDWptJ/0dnLa8UO9YKssKyiNp92Jj1P+TdlMHuHpTbQQFizi1K
	vdxudYcXyqw==
X-Received: from dyctb4.prod.google.com ([2002:a05:693c:39c4:b0:369:45ee:40a0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:78c3:b0:36a:1904:60a3
 with SMTP id 5a478bee46e88-36f75a2ae65mr5587829eec.15.1794026483275; Fri, 06
 Nov 2026 20:41:23 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:49 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-9-irogers@google.com>
Subject: [PATCH v11 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In machine__process_ksymbol_register(), set the binary type of non-OOL
ksymbol DSOs to DSO_BINARY_TYPE__BPF_IMAGE (which
machine__process_bpf_event_load() upgrades to
DSO_BINARY_TYPE__BPF_PROG_INFO on PERF_BPF_EVENT_PROG_LOAD), and update
dsos__find_kernel_dso_cb() to skip DSO_BINARY_TYPE__BPF_PROG_INFO,
DSO_BINARY_TYPE__BPF_IMAGE, and DSO_BINARY_TYPE__OOL so that
dsos__find_kernel_dso() does not match ksymbol DSOs in machine->dsos.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c    | 3 +++
 tools/perf/util/machine.c | 9 ++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 1574c8885d78..fbbf98c4ccae 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -475,6 +475,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso, void *data)
 	 * is_kernel_module() treats it as a kernel cpumode.
 	 */
 	if (!dso__kernel(dso) ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__OOL ||
 	    is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMODE_UNKNOWN))
 		return 0;
 
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 076d167380f2..b958c6935a56 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -769,6 +769,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_binary_type(dso, DSO_BINARY_TYPE__OOL);
 			dso__data(dso)->file_size = event->ksymbol.len;
 			dso__set_loaded(dso);
+		} else {
+			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
+			if (is_bpf_image(event->ksymbol.name))
+				dso__set_long_name(dso, "", false);
 		}
 
 		map__set_start(map, event->ksymbol.addr);
@@ -780,11 +784,6 @@ static int machine__process_ksymbol_register(struct machine *machine,
 		}
 
 		dso__set_loaded(dso);
-
-		if (is_bpf_image(event->ksymbol.name)) {
-			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
-			dso__set_long_name(dso, "", false);
-		}
 	} else {
 		dso = dso__get(map__dso(map));
 	}
-- 
2.56.0.455.g6c5a503b38-goog


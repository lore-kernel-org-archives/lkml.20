Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825976;
	b=lf01Ni6wzywqh7Wk3MhPsCFTJvauqwFJefohT2ZmMYQs2vVS6inwZZs0ADEAICKPFBpX
	 eScvkcLf1fz+lN5nx51OmZfIDL2Ft8fHmqr5+KCvkEiu+xgpRSTwSsvrZtbEbtCkzOOZn
	 jPYg+JI4szg8XMG8sob/r7RcfVK5pA5qwVlXwNoOh/KVQrwg8t4g2jgbvGn0/yU55HU9W
	 Lypl3/twiPtYHYGxNJhRXuVKnF2NIr3J1WUXniaWqIckQ7lmv1lzm0n4YF94AD8vSVn95
	 dSkhNUKUYih3sh0XLKJ2QhYsanW05+R4voQTMZjOVIAVqRApnQEFE3bGq1FPvrqlDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=JGxPcGcrz0cEygUm/xMCWT4lSZhvgeAtZWaYwkiKjFdviDX6lbIxzT2Z6OctPyCgKGQf
	 D1B1apPEPZW8bISGxqSx+M5Xo03UMoAVlbKjY0t/LvxYuYY+0hFzLT9cjimxsPwYrjN8V
	 UenF+FulJ4ANjltm6etPwIPZOdkfLTirzHnk4G5NXoEDuvFj/nf/okk0Cfb5lLuoLmlSP
	 ZsQrRNGpkuqRfbjRP6vyPfjF2BXPBjT7pdB0i95lOOkqkpJwy0B+R2Yo1mGhu9ZhG5FlC
	 GVV3XUz1ssWNbozmoK/QwoVkaWKPBOuqI6va4a0/KnmxWUzjiWpSm3tEHar5d6i/trA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nDAM62lI;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08460606D172
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08460606D172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nDAM62lI
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so1361506a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825975; x=1794430775; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=nDAM62lIQ8NbNsJL+tf2Dzwhvn4xbKxKPf2dw2UNumEgfXSxIIe8WLKUYsWiByH8lO
         6euqFRYZs/8VBDb9AZhjZFYshBs4ZR8gCl41nWKPRcLft4PX9qZaoNhmWFTxAoUap6St
         zNyjUMTCy2pJmBEjxdTDp9LmP1BJEaux8K3OkFFTZMTtADrwuru7TOn5gYdabINQBd6I
         hhpSeF6HbXGrjJRymc4Ze7o4nW0TKKHvRhpmkc4PC9ULG0Z9YqhlAk6Vm6/W/lipBj44
         tXbjuKmUjsrYGVFiHqIGKdzfi/vPb3GDw9oOVPYYNeMWxe5qOzA18q57LRZvDYDibIoc
         UMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825975; x=1794430775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=IgFekbO0821dZ6IatKew2GI+gC3NrEuMKM/A5IcAoY1/KqQUpRUp6KHP35adltw5Wj
         xGPvwN6Chow3SUxU9iswtJwkqobBX6CjnIo+cD/mMd78vvQ337kdBGzDIIIzHVhlRwqG
         Ghc7g8xwxZk3JPwsDbtfVbbVoOijI8vAivCOyqjjIPtK7z4hG0jmiSdvO2YaT8tig0Vk
         tJ/XVbekXhqxV/GHh5177+UJdYc8hY3upS3H02K8aPSkP8McNroFPRZuxgrFY7rFkl6+
         3rzf46skD2lqorvI+ehE/o/nktUy4BA8f8EldEGTzbMWGhGnWBNxVEhTX+H+G0zYqvs8
         PP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCRW60zX/RSRmUaXcKslYVPUixC3HCEMKBrkJzBE6FZogRniwKN2cSYL6+cWb42Hx5HcfC3d7jJYC1hRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lDzfSz4G62q+nsgMT6tOgsJ/PKqE7RbVk6YqkDc5AhllZubjX
	+FwQNcz0r9GRVKm+JWK+8JJo+2fAE0PqkDPFHR0mroe6+RFYYeAsquQ5lnmFyQQTLnde7kb6SYA
	pEEKsMDzZIw==
X-Received: from pldr21.prod.google.com ([2002:a17:903:4115:b0:2e9:b079:3771])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e749:b0:2ed:2305:5244
 with SMTP id d9443c01a7336-2ed23056137mr7115475ad.46.1793825974846; Wed, 04
 Nov 2026 12:59:34 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:58 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-9-irogers@google.com>
Subject: [PATCH v9 08/19] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
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


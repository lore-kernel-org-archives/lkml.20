Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700128;
	b=xKwMI1+rhxKvE5/wA3zL2lmyfrlQaxrNwPbmf0WVEUAsOKK4zKecgmHZ4onRrHKwRXTv
	 yfFt6xnknJkLQlasxitubISv8V6SY1J0Dudx1cItvUEfDUuLZOaL4p6J3LVTtXIOZuZ08
	 UxePD8DBdWyC8SDnNIuAZubWpE6BUmx0JZV32HYbavxdxQC/Yz2qA6EVooH0rd/8UVGRT
	 XzFuV1BCYKBa9pMDAfxP+6ADvjrWzjgm6FzLufKW2anQDt5Dq72VDfLgqi/ratPnyC3IY
	 FMYrbl+nRWo4K7Q4C0ejS8S3+oM5QvBmxRKrHEWVNNGNhr99k0xSEu/lnthd4Huml/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
	b=1tE0CEGxsYTvtyTn57G1ogegzDaYGTCQQi9o2gikGkp1kbQJ4hKrBji18tIj8XCV5sOY
	 onwmnHcr0hUSKrtqdzrw4Jygev36NLOg+4mBYPORD3M9bqBUf38NAw8Q1CMmrnd4wyavp
	 7VAqfLdEMyV3Frn0qW6n8SJwGAnD/NtXnLXhhdmQi94vWfUi1QxifkrOoMYSmNDl4K2kX
	 6ZvdDdjsGnxGbqGy0acg+prm+plTZ0wfcBCjq0qjzkubJ1bZggBgYCbAfpcvABbGECOO9
	 8oBBnsjwiOXluaLN8O74kWCfa7k52VL1Ahf68z0Oc+iRQPX4teEmb6+/FTFveE/yk/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ezStEsGc;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994660A2601
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B994660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ezStEsGc
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so452544eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700127; x=1793304927; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
        b=ezStEsGchfAqfdVSXoS+Ufh869dXjxCb7PcDoezFzqvaSRnBi+9ZUxBwMQvwzoNAvq
         4s2fwBb6Tg4FEKCEju8Fud24wR+4+8ydQh1PRhkFkY4Ff3nM2/JMQQn/kbS/L2xMjYMG
         UxkI1CQQJQ+4V6bWCeOQsHS7TiwCDdnzHvajKSfKHUww8ho1Ip+jQ3/DEBZQgTayt9Ez
         Ia+9pH/58/ht0Px2dP1kaiLsQSs4lIkJ+iJZirrPQbv0yhVfoFXQC9LWDZzoOpEXrRnc
         t2/+Ly59KFUCzOcQsw1QnP28jBF8uM1jkpUwDhXmyQpxyBIvsXUcu5MZVwkGizCLe0Yn
         Ta9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700127; x=1793304927;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
        b=KYVRyWAvresZCKxFh8u4d7qD9nAdSuCVmFUdzxAxYMolXhTM5SmH/UR061tuBo3T7b
         c2PEEzNPasKrerLdjxDcmfzc5BHWqLLdXWecNS8Gm2P0ZLAxm0zj4hpT4oDfhuyntQFl
         7lg8bUbR+wS+rxgSCAFSVoc9SsVAtQXcZNyOEeeLVuOyxN/zfInja83QXuD3wq4wlAxB
         PRZ48FrNZ63dAS5Lzp1xWCwEQGu8qy5eMLB3meczrXmg+9Ld+bY+pbhAaPmBYGBU6TR9
         Bo7MVOLIM4rUoIk/ozAeDlTms62V6pKQGfEyF/zhyUzQFiPYReUx+OP4bdLMwS1+SQbM
         5dTw==
X-Forwarded-Encrypted: i=1; AKwUvBzmQas6diyXWbc8cs2RI+EbQNkBQUiBJxJ7raqHbFqn1q28KCe7dgSjcrQP2kWRGW4FTItmMTF3/mA0GUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9g3/2S/Fl2lCZPlXQAv2dpRsLs+P3+fivC0u/9ximRFe7Tcer
	qq9icbMI9JALB1EkevhgRRMIALUPodZBZmgdeR/cohQLkp0OYM8/LpkhqLFCtha0+ttcIL3ruqK
	+1DxepWv6tQ==
X-Received: from dlbuy12.prod.google.com ([2002:a05:7022:1e0c:b0:18e:11a6:297a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1305:b0:188:88b3:abda
 with SMTP id a92af1059eb24-195c65611a3mr316490c88.30.1792700125994; Thu, 22
 Oct 2026 13:15:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:41 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-9-irogers@google.com>
Subject: [PATCH v8 08/19] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index 40267d3a725d..2df0ce58421e 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -474,6 +474,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso, void *data)
 	 * is_kernel_module() treats it as a kernel cpumode.
 	 */
 	if (!dso__kernel(dso) ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__OOL ||
 	    is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMODE_UNKNOWN))
 		return 0;
 
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 1d9d3bf57720..cb77e82ed842 100644
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
2.56.0.307.g5fe7bd680c-goog


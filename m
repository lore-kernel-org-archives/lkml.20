Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948648;
	b=IjLekURoEFIuYRnrLYg+TiqZ6J6++rmug3qE1u3MXi+KnQY3RGGBg/2Vz4WqTRndqfab
	 6mNnZhTiLuPp4tH1rV35FOfOoMuQd8oEYm78kX0mEtFDZc68aJZDN5BStECVI0aSq8bgX
	 S+KSoycuyZdwlhIqWMnE8+uMmTCph+5/HVBRDXnr2FLO1AMVI9D1zIsMYqWLOOvCZMWnL
	 K8unhMI8HsOm3hCWLICsVii81Vkz7pdeoa8iFEItOgOicRPEPd7aOaR5f8jwItdrXwULd
	 8mRWheeb4dLWhC+Rwzi0/89o/7+XpVVsrTeaXVxu4jCVYqYbjNAshCiuKz+rCB4kZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=UAPs5pkahYEPxIy7qlK5sKsWK5Ofl3satwDCbw3yy9Tu5dp82IIHnpTT9bQl5d3/1q5a
	 3RbUZrVPvFsRqdDD5eF70BsBaDUfS7wIfbVE+63/lV1MInSH5EoizhEFMkY+CuDamJk5R
	 f+A4GMr8wW0GjPKu7smrHZWIjTptWHrvoy7hj9UR9WH7B2usmWre5wZdcXhPmJozCPwkX
	 DlDNNkF4vThtoE5wI8PLacxi0hKqCMax6XEd5Fic/xockElYY3K9l8ZTolYFwPqWs4bJB
	 et/cO/io4douc/QZnLSLtP11dF2UfDFg/4/dK/vwnyAnCAsxTYv5YOkNDV4DRJmDk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="b/186WZj";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C49606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C49606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b/186WZj
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso501899eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948648; x=1794553448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=b/186WZjdUcEGHi11cfLhTmIWiMRf8+y71myAj15VS82yiPGfy4w8LOyrTbFsahmXN
         hw3pE11QO8nEIU56uAl9G6lj3rqD4F/1TvUEZJe4XRVpfibQwATVESP7YCj/+olrc9ML
         mJSCtd/w1zOpKVjkWiRsbAs3I/ZenZCkFVminypu9X+6EdrDk2mROIIP8/OsWzvmBvuk
         Ta85e8IlCKz/EzTT9qhQczGFvsKzozwFMBTjDTZRguoetneAfWArdHnBcMV/R/XwtCdq
         gGgsbI1AZODsP8jNcWyGDeWCdNePNRwamYIymYFRV8ujIBsEQ8rbsnzYg425q+yctOpi
         1IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948648; x=1794553448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=BXwZWijHaacRUTXkcGUpSl45Jxm72I6wcLIgGtujEM/NFQGbA/IRFW6gJ8nCiHmw2H
         uhuCYCeU+dm98crMXTPMKxL+X/YQSrXhugqI1oOafoz+5QdnSlgVhYljCsmNELEEy3pX
         vO8gDIc3GJJVFr4hlM+e1NIo+h9dVGQWMIzvYdkZS/7ZUnGuqyw86jQPYWFJdR7MpQbe
         FPmsKqTBNUdGoKginz2qFxPVDwXLNaBEnzjZjw7eDhW38chnMqzOfai7X2urYxUAkacK
         5A7PNf0z/GSq1aRhKZ6DwMUaGpDVgEMhQLyFDuH9W07D3AMdGaNIpPWTBV3gN1IGvF6C
         1GqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8u+YgXG1RApmNSPDIIemlV05rQ0CwygMpfENRqT1Z3liYWlM3R8MtR1QbtqRYYzKlmSj2+puXir7VM9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rHU+xsV6yaVifSAkx1KWJVijSdBdexoEY1pc7dnlT7GBAiCdt
	k6yafb8mhqx2gSvlCnxytf/xfZjxWbQGXcmn6omc0Ey7GoxSAzQY+vNE6CmaoVD0C5vysZPAyho
	NkyOEWefdUQ==
X-Received: from dyaa13.prod.google.com ([2002:a05:693c:40cd:b0:36a:209:2e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6188:20b0:359:3991:ce1a
 with SMTP id 5a478bee46e88-36de6b52a0amr6511094eec.16.1793948647424; Thu, 05
 Nov 2026 23:04:07 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:32 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-9-irogers@google.com>
Subject: [PATCH v10 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
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


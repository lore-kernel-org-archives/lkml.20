Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FEA5372E3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990811; cv=none; b=INpnTCjkrkxJ0QxirE2U6I/BF3vz8kDl08hh3uzEeUj2LKQfEszbdwJjfUFO09+kezqPvoNIjPauq137vlgxSJs6FSYPugvP000/x6YvD0blWyHX/RVJb3C7MHZFDXe5/ZSwAYXgP5pnq6VNgURW29jNyhHLAJ0HY5c0NhJOyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990811; c=relaxed/simple;
	bh=Kjt0QJCSGByXoOkT1ogX7P6lKoV/VO28TXtAtkuup6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VU1p4UzNhZjV3o28b1zaLHhl9nWiyVknmK29pT5yq7skNf6p3THFGhczMpPjz1o07JWXQ/L/iPyc2mCtdbSYAWKgwwR3atkqIVXc550Vst6oB9uyVpC4O2d8rB3k9hy+gAO1VdD+E0tFfTselvMYW9DJwaPSCo8h1xSNc3+TT1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f32chest; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f32chest"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675676afc3cso4501341d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791990808; x=1792595608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrPLy49Oe94z3Z9uVuonzYqWl9efS/JIcpkVKd750wY=;
        b=f32chestKpzW7moKinn2bwSUG9y4V3qJxcwIF0nXrdiJgYiSzXRaU5bL3L44hhnDDC
         AL9Zwbbs2XuMKStG8vIBnw43HwgikMKRFodgMDl4jjG3yvC2f3r7Cpfp2SEPBKym50pv
         hZM+vrUwbb/aRSuLVOY5CntSF+zApbu2vhrMAjWLZ9rmN+EGgFIVGT6iZ/vJyvZrXRD4
         U2DL10ycgSxbce6MQoPQmShD2x+S6BwER0ZyWSkg2DsmIgUHUfHiv9piw9NEUO3C+Ws+
         TRa9O9l6VBaOOfNKHcX281uC8Jn105/v4kV6G1a0o5SUVkhUFepjZkO4evqAAnF5RJZI
         ms0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990808; x=1792595608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrPLy49Oe94z3Z9uVuonzYqWl9efS/JIcpkVKd750wY=;
        b=C4KUH1ZT4LIkCxPRLzEJJ25Met4JAN91mUGdTCkrQnZmLfT68Cm9q2ccGupxAnp4OA
         btT3Xurluv7eS06CmCS0ATUO1MxxitFoNDSs3Jnwd5PYHXqqTeKTHxgnKrETWACQRq8U
         HBl8PZCm6oDNr509xljvZ8tH9pfHL9PF5NQmbM6oYQc2zSZUXNtIFtzVdaRvKp5Norkz
         DF5Paa7QR1a6/a4ZThI7ip6SaEUzF1Oof/ipJVAeMxPP8z5LOCHdTax1CLJbvgqTVYwo
         5UMXZhziQ32Yjp01EeJ0a+GeXcSVUUhf4WaxCfWnAmFBdYZh17K53G17RS7s+6rgK8Zu
         Dxdg==
X-Forwarded-Encrypted: i=1; AKwUvBylL9dZkW3mQsPWOMprOuFzsv8MCFerMPRrcdgzItcsufK4xPXEA4ehYAjyVWvpt6icaasKo3Ryllvc178=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzjjIRTmQrQd4CzzpOegI9EY65VNS4pPGAIaTQwtwMNij+1LGN
	/7ZGiDp4mFM05W2Sdfn9d86uROxW5uXwm2Slhx/9+WtAs8lXqOewTyFD9OwvpA==
X-Gm-Gg: AYBFou3n5TPKLvULDSMBIn8S5N/Iz3pZeYC4brEw65ddfwkPMm7HIko3d2Ytt5p9ad8
	6Bq9Rpaun5jH0oo9k0Jn3ARBphnJmeqe9iMpnvCckLEjYM0FBo83ERJ0FZZdA++vQhKiLAS//aV
	Uu5sSOEWqb1yW16eFWcyj1e0TPZD7nTrz0qcNl6Bw5zhVVbVJ6TGw2fkeXeLgpJB+mS4tENmza+
	yAK8vzFSBEDIpGj8I6rEIBtXG4qa+IGnNfhTo8lsVqm+rK3FQZGprsdK9fsjofn8I7CgqqsRbWo
	l6msZYwEh8YCUpRxh5ksGI7W+JrHDqBtpQACiE/GvMruW/F8fkL2L4gMJviuq99Rjd9Rkmndy+l
	yI+H8f4vT2fTooo1e3l1WUdTcUkGXNBP3E4gSkh/IuURoEEONv1hxMd9Mw5MmdI2N7nIPNn0xB9
	WDGUTAHbBkLW9nUXzscbw97kZ0NBHp0uMIBQMJFbb1WY2kSMJMeXbcKB07HuGO8fWXfF9gLw==
X-Received: by 2002:a05:690e:4809:b0:675:70a3:71b6 with SMTP id 956f58d0204a3-6793600b1d2mr3413272d50.36.1791990807189;
        Wed, 14 Oct 2026 08:13:27 -0700 (PDT)
Received: from localhost ([2a03:2880:1fff:48::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986ace301sm1131608d50.24.2026.10.14.08.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:13:26 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] perf machine: Don't unwind the arm64 leaf frame caller without symbols
Date: Wed, 14 Oct 2026 08:13:25 -0700
Message-ID: <20261014151326.4142140-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On arm64, 'perf record --call-graph fp' also samples LR so that
thread__resolve_callchain_sample() can recover the leaf function's
caller, which is missing from the frame pointer chain. It does so via
get_leaf_frame_caller_aarch64(), which runs a DWARF unwind. The
unwinder looks up the symbol of every frame it visits, so the first
lookup in a DSO loads its full symbol table and demangles every symbol
in it.

Commit 02b2705017d2 ("perf callchain: Allow symbols to be optional when
resolving a callchain") added the symbols argument so that callers which
only need maps can avoid loading symbols, and passed it down to every
add_callchain_ip() call. The leaf frame unwind was missed and still runs
for symbols=false, so 'perf inject' on arm64 has been loading symbols it
doesn't need ever since.

Commit 29be60c93d2d ("perf build-id: Mark DSO in sample callchains")
compounded the issue: process_buildids() now walks the callchain of
every sample at the end of 'perf record' to mark DSOs hit. With -a, that
loads and demangles the symbol tables of every user binary sampled on
the system. This can send things into exponential time and memory
(over 1GB of heap growth in 5 seconds), so

  perf record -a -e cycles:u --call-graph fp -- sleep 2

never finishes writing perf.data after the workload exits.

Callers that pass symbols=false only want the maps that callchain IPs
fall in, and add_callchain_ip() already honours that by using
thread__find_map() instead of thread__find_symbol(). Skip the leaf
frame unwind for them as well. The leaf frame caller is almost always
in the same DSO as the sampled IP or the next frame in the chain, so
build-id marking loses nothing in practice.

Fixes: 02b2705017d2 ("perf callchain: Allow symbols to be optional when resolving a callchain")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 tools/perf/util/machine.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index f86b3b7df742..51597cddd239 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2989,7 +2989,13 @@ static int thread__resolve_callchain_sample(struct thread *thread,

 		usr_idx = callchain_param.order == ORDER_CALLEE ? j-2 : j-1;

-		if (usr_idx >= 0 && chain->ips[usr_idx] == PERF_CONTEXT_USER) {
+		/*
+		 * Finding the leaf frame caller needs a DWARF unwind, and the
+		 * unwinder looks up the symbol of every frame it visits. Skip
+		 * it when the caller asked for maps only, as for build-id
+		 * marking, so that no symbol tables are loaded.
+		 */
+		if (symbols && usr_idx >= 0 && chain->ips[usr_idx] == PERF_CONTEXT_USER) {

 			leaf_frame_caller = get_leaf_frame_caller(sample, thread, usr_idx);

--
2.53.0-Meta

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793428559;
	b=mS6S6suzLy95tWs34nXKNaW4/7isi5EwKE59clOE9dw4TmsXccV0czaY8lengBsXkJ17
	 jgJfplh1djHOZ2jSScD51SRHCadaaFlkDVX+Bk98Rbi/0dFFRM2nFv3GuKQ1iT/0Powu/
	 L0WOkJY87s1aPppjFKUzYF1wMMA8qxp44M2uebuHeO5QMyPL3lodZmPD+T3qfzNHVRkLN
	 +JToQ3TaTm4RP2RCLeFkrwzSPwPsH90sY61d6iAwM9h7BfN8GRTwp4dmcJDykKzp/aHy8
	 6J2t4qCETwkkZpuhynZPIENx7IEfv17JXwGy9IFGUckCAuYzTqqIfofYWeP+CsP+cvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793428559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NIJgkK/dbVO8vwsNzvrO3xSGo3pRrdpvP8C6zo9SmA4=;
	b=rraBhJd97CxkBurVovRJtuAb0MgzLwECsymNZFg47YGenYEht93WUF1bcZzP14RvxRui
	 dw3M9ifMQNFQ/u8JoLledxT9GhxgzLp53wYLWeGUmnEgsBZhqW8PrnMV3FgCMQfobenag
	 ODyIMmlIMHc1FNLv5lD0IWVDF6eA0BcF7EzoE8yhsHKi/7KxoscDxIZI5yGLySzUKdPG/
	 5NF98Zvr6sFObxax4WjsoS3Lf451Rw+cYvM9MNaLC2RbIUyJQKjTvOb2XLxEQUOqcVtHp
	 Ay1tRmUiYcWmxd05H165hE3662TxwyXzSp557iTlDBUckmobaDDhGRvxOA2un8SMDaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bp5bIi24;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB7606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DB7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bp5bIi24
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so5918561eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793428558; x=1794033358; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIJgkK/dbVO8vwsNzvrO3xSGo3pRrdpvP8C6zo9SmA4=;
        b=Bp5bIi242CbFX+oW/oYuXU8EHCU2CU3ItxDrZZAxC+uKxjMC3kMSOkkqa06sU+PLJp
         gZDJDUV+KATWr/S5+F2XwLpiENtaeRzs2NxO4AHon/xHzmrsnNFOkcXSGqshgka6LjNn
         V+d5MURE343+/egKumGpA9g9tIvH6HUmM6ekY179ucsV7cMR+JflO9hc3d05zgwyqdtv
         tSM/TYsTCBnTwJXL+15FuBKa0RjJE+m3yG3CoHwvbJX75QLZq4xuTdvow7jGrUsaAynh
         wmerRKIq5yrX7paenDRfaCiqUojjT8E/8rPqI9h75z44tjHsAXkRsemP1polz/mP9XgX
         DY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793428558; x=1794033358;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIJgkK/dbVO8vwsNzvrO3xSGo3pRrdpvP8C6zo9SmA4=;
        b=XTtcEFo0O5XgS6I3abS9we66AKfeKvGIThdCUFKpDbybnhiMcyletM26xbHqRQ9MsQ
         6oUJdp1Fw4rVdSpsjktComLqkNBGCfdqBmRbdGx4cmMmSc2gDCRtdpR4PgUh0hxiRLpt
         LxjmjF2kHl02F7N2aD3o3QYL3Jt+eib2azwHLyjXkjMesKpQzQ30TQVWWG4FyP8PqtBA
         e+6da58/tfpCVWx704OxHCLnK5e5ZAELI3dUdCxDMKkKdrkY4EVutqDlPzubMh/w9vpH
         bGxEI7kvgnr04e8ZXsBPAvGLs2bCmTPixDnWAh+bcSOPzf2KrcKeCAXMfzkMb82/IyJ6
         2rbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ3GjokhXyUSqcDDY6iz1kvKkRf0HEzbeXCiWJU/GHMuDF1+/TQyDKJWmVcxmulEh+iva6HMmumRJp/VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrkUhcoZA42WlGnII1rZmbt4h2WuTuB4WWcfaWFyIfXNnpjcBt
	o8+LSoRF60K6CMkWh1H1+IXMz31xM1Zy+qSQ2KHlixGi8D8pEPnNeyQUVKFzem+aIVZBf9YR2Mq
	+wB/P2jcIqQ==
X-Received: from dled18-n2.prod.google.com ([2002:a05:701b:42d2:20b0:191:327b:5758])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f107:b0:1ab:fe29:5081
 with SMTP id a92af1059eb24-1ac5ac4ded4mr5954842c88.20.1793428557302; Fri, 30
 Oct 2026 23:35:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 23:35:47 -0700
In-Reply-To: <20261031063549.1281324-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031063549.1281324-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031063549.1281324-2-irogers@google.com>
Subject: [PATCH 1/3] perf callchain: Fix loss of symbol in merge_chain_branch()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alireza Haghdoost <haghdoost@uber.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit bffb5b0c0976 ("perf map/maps/thread: Changes to reference
counting") replaced passing &list->ms to callchain_cursor_append() in
merge_chain_branch() with a temporary struct map_symbol initialized with
.thread and .map, but omitted .sym = list->ms.sym.

As a result, callchains merged during histogram collapse lose their
resolved struct symbol pointer, causing 'perf report --children' to
print raw hexadecimal addresses instead of function names and inlined
frames on merged callchain branches.

Initialize .sym = list->ms.sym in the temporary struct map_symbol in
merge_chain_branch().

Fixes: bffb5b0c0976 ("perf map/maps/thread: Changes to reference counting")
Suggested-by: Alireza Haghdoost <haghdoost@uber.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/callchain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/callchain.c b/tools/perf/util/callchain.c
index 31c675cbab63..6d5212be466d 100644
--- a/tools/perf/util/callchain.c
+++ b/tools/perf/util/callchain.c
@@ -1092,6 +1092,7 @@ merge_chain_branch(struct callchain_cursor *cursor,
 		struct map_symbol ms = {
 			.thread = thread__get(list->ms.thread),
 			.map = map__get(list->ms.map),
+			.sym = list->ms.sym,
 		};
 		callchain_cursor_append(cursor, list->ip, &ms, false, NULL, 0, 0, 0, list->srcline);
 		list_del_init(&list->list);
-- 
2.56.0.317.g454f8302e1-goog


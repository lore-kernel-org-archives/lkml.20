Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606563;
	b=Os+62M+k2lTGgbhAmbL8UuK6C4pcUlPHeAlVhdzJT1i8xsNWQO+6SQprcJaovHZTDRIy
	 xHx3nWWQKC+US1GHOH0ulkuec5vyxIiKQ5il6hnlx5xfw3+Jrkxg7z1QPn3ffONnOF3kd
	 uClRnvRw6FfooV2wNoNdYFH2QZstFY6lsngy89qzoQ43IArI1yUAwsOBNRwEpREsxeJLr
	 tNhemMTdtaefSDGab4mb146inAdQhcPf2LhSS2owgfSMf7c/tvZ7bS0gBmjOL81fscXSZ
	 ZIdRIKp4iqKzc5z2mTzhWCn7Ysehrl1wV/qqJkTdYwMvuS96B7jURzy6GbzAb53VN+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jLoq5kV747oI2rAx28nt5PJySw6tzJe+qioAERJHbno=;
	b=BbPdPyHAxEhm8uRnh4slg0sLopI48VfF5TVll5eGoW2pCapKt5aHT57EIfHoOWoJhnom
	 OZV2F5fMB/G2L9NC5+ACqCtHYO7G/U6quAyWb768IsF2u1uVBovlXm1kQJAi6O04xgoGf
	 J5eK+zSChBLZHokNWGEFXSwYCkbRuWHOrWmJ7ewnqHccCqZnCCD8cBuP7KAnRQqL1cyMa
	 AraPfGEtQ4T0CGhK2+2Z/PeRuAduGKGTcUmepy6l+fn1jV57fkZLK0lZbJJV9bDvJEKih
	 uzlFh+VjD7V+YSPGtlnH5hd7KzZ56M2q84UqNEKjBB8uo+lz0ScLBrRRy1uWS4s/zsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCqKPl8m;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02945606A8AB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02945606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCqKPl8m
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2168451eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606562; x=1795211362; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLoq5kV747oI2rAx28nt5PJySw6tzJe+qioAERJHbno=;
        b=kCqKPl8mQMq/Gn9vCbOSiDRLlHQutjB1DLZ63OSRtcgjrBcMbWG9EpzEWm+y/FMZ5w
         dFwERLXlWC1dft8SzpIYU/0A9R4UYt6zltGc7LxMvnENKBjs3yI0/badNFnSrc4tCIHG
         MxD1p8YYzG2+jQTTGmT9IZZVF1NDGX3/WpY40zVTvwdg3I1CgZR9+hpudLG6LSXmTnnw
         oz2QJBnpUA18iU9bghAvzv8mc4DgewSGJKE56iLFXmuxw0e6vHkBan3In31d7MeEFDA3
         jmk1OHVvBe8OaoCg9g4TRs526brVRu4XnobPwkWMYssND49puZTovWvyjDrF+wF7RSR/
         /G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606562; x=1795211362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLoq5kV747oI2rAx28nt5PJySw6tzJe+qioAERJHbno=;
        b=jKpqMN7iX295HIWYMSO0wqM820dpVEQbkHKP6OC/u4TGdos9KH/HGKr9uNOUe435y+
         CvhZ6r3aho7RB3qtnB7HpC5PFRNT5d9t15PRl8BzIrx+8WhnUfAkRAGo98SEP7QMNgms
         OjlHpJc9qFmoHKibmuakLpnBmo29VY219MU015s7bfYW94y37fCKKg7ziqa53aQbMTlu
         SCh49nOx/txS/8rGBES4qdfAXVRgJQ4AIdmK8e4xQAbUPcAI2NFX5V8/lI/lDKdRo/p9
         JGRQSk8//qjBv/gm6jr/lMeFDN+974LMSDzh5nVA7lQSypoF4dBqpo3kdN1NWFGZs66b
         fi4Q==
X-Forwarded-Encrypted: i=1; AL+hErHn1VBF2HvO7WfR5k0jarlFMAgMoa+y8TuehDbDkKoiznDq0uDi2WTZzX7ExCBcHVJjeCokEs9UL3AdRrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6VYvMZ0ESfxfOQLSS75KanFXHYv6FA6WCgz70qoX2/5NS8zCo
	Jh/S9L6EEik176C+N8t4CjPUhjd2c1xwditKvQtztejEQ+JBGRU8rCDDg86ASWUamNzA4jIMaBt
	q8k9TA8Y8ag==
X-Received: from dyvp15.prod.google.com ([2002:a05:693c:884f:b0:36c:9a6e:5413])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d115:b0:36f:29bf:4326
 with SMTP id 5a478bee46e88-37960384a9amr2927593eec.0.1794606561937; Fri, 13
 Nov 2026 13:49:21 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:28 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-5-irogers@google.com>
Subject: [PATCH v1 04/26] perf build: Don't check difference of perf and
 libbpf hashmap
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

We want to explore diverging the perf hashmap from libbpf's to fix a
few subtle bugs around strict aliasing (casting void ** to long *) and
use of ERR_PTR which is non-standard in the perf codebase and a source
of bugs such as:
commit d05073adda0f ("perf trace: Avoid an ERR_PTR in syscall_stats")
commit 96f202eab813 ("perf trace: Fix IS_ERR() vs NULL check bug")
commit 9f3c16a430e8 ("perf expr: Fix return value of ids__new()")

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/check-headers.sh | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..846a1b2fa5d8 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -214,10 +214,6 @@ do
   beauty_check "$i" -B
 done
 
-# check duplicated library files
-check_2 tools/perf/util/hashmap.h tools/lib/bpf/hashmap.h
-check_2 tools/perf/util/hashmap.c tools/lib/bpf/hashmap.c
-
 # Files with larger differences
 
 check_ignore_some_hunks lib/list_sort.c
-- 
2.56.1.703.gf848ed807c-goog


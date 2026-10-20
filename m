Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516865;
	b=DOjXSKZAgJ+yhLStgOw0cYMIoZPL0DsN7oMrgeUEg//OpRRcBRkUnaLPQctxL1N/jJ2c
	 f7BEjMPD2olBOZt9kYQ39wJBSKoGqGSsgw2xX5Q0nZEYpD44jfW4eZ80CVH5+hcohF77w
	 369Ta0s2j6k1eoEioSZxykgWTqj7wKbs5w3qPghFbjJn23jcgmtINACmKZEGENd1N9Y4z
	 bS4tHc9VAFEyCq3XEp0rmBvwwI26UjWIWfc8RE3yJQiiLMQb1oeLEbJApiP/IsTwcLbTv
	 d5ytDttVch/8nUPlS5o+D2SaC8iqWQaCkplKnDoyMWPeZMqvRBF1Xi8sym4P2HHeGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516865;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iZFdFP96uDYTqh1wBAzyc0gt0IEZgXFtikLYB1+hBHM=;
	b=HGTbGIlVWpAbSVZ4tx37eH+3nmKmPN1xuBCAa5IjMNuDJkekC/atHd40aDDaQNgA6Emf
	 791LRpJ5AXg6kwXrRo92+kTkWZeQLRktue2Tc9Y8ZcXURlDL8BEikAKN3VML2lmdIQhuh
	 ITYcqPXvRi69969ZaWH0ECXj56sHWZUD4xpdnq+Ewp01ZjayFvqUntX5wrTZoHlyC2lay
	 c1Ao41FiYaBNkuihiN22fLQ8nkPGuIpHoNeRbUNTF9xZwqhi3q3iqMqUbO0tB1OqII6EO
	 fyTiOIQlmWA0AoZP6rzwxenBhntZGMu6Hvo2i+PUFiRw3W62nmFz0wOOiuAdXY8gFIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1g4.org;
	spf=pass smtp.mailfrom=1g4.org;
	dkim=pass header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=mYS1LAI1;
	arc=none smtp.remote-ip=79.135.106.105
Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58DE606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58DE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1g4.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1g4.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=mYS1LAI1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1g4.org;
	s=protonmail; t=1792516856; x=1792776056;
	bh=iZFdFP96uDYTqh1wBAzyc0gt0IEZgXFtikLYB1+hBHM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mYS1LAI1oBKKHdN1cGvDWXM5MeGkQn4ORTOcjADLc6OSzkQ1yH6zNFQcRLFS8GkMO
	 sq5k1vdXCfYFgL9D7nEzwYctyhLT9iBCKhR+9V6hOPfP/ADiWf58AjtlxofQESM26x
	 Im6hJpL6UI3Nd5diYuyCh6fF6YkdSrIxC0CbUQK1W9D9xQkBPXH+uDxxZhYNR7fQG9
	 CLPuJ9gWqjdvRJCiyMywJvMepmPiMgw7cVeX4FTvyEftWzfr/Xm+mH6k7r3LNmGKCp
	 +27yGMf6cnJ/vWl5GeJGJNokJf5nGzpU7jrSO7gE6Z94whxbE1orLdi+9/x1ndD+8j
	 o0xcjvUKzCaDA==
Date: Tue, 20 Oct 2026 17:20:48 +0000
To: linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org
From: Paul Moses <p@1g4.org>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, kan.liang@intel.com, linux-kernel@vger.kernel.org, Paul Moses <p@1g4.org>
Subject: [PATCH 0/2] perf mmap: Fix replayed and skipped records
Message-ID: <20261020171946.3593127-1-p@1g4.org>
Feedback-ID: 8253658:user:proton
X-Pm-Message-ID: 52d143c53149517b08b73c62c2cd99c2b14c17b6
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

perf_mmap__push() can copy through one producer head but save an earlier
head in prev, causing the next drain to write the same records again.

The race duplicates a small fraction of samples but reproduced in most
runs. Across 20 unpatched runs on two source baselines, each containing
500,000 unique samples:
- Replay occurred in 15 of 20 runs; five had no duplicates.
- Affected runs contained 14=E2=80=9353 duplicate samples each,
  representing 0.0028=E2=80=930.0106% of their 500,000 unique samples.
- The longest replay duplicated a block of 53 consecutive
  timestamped records byte-for-byte.
- Overall, 485 duplicate samples were recorded alongside
  10 million unique samples (0.00485%).

The patched builds had no duplicates in the corresponding 20 runs.

The second issue is that perf_mmap__read_done() advances the forward
cursor to the producer head even when unread records remain. perf kvm
stat live processes at most 25 records per mmap pass before calling
read_done(), so it can skip the remaining records without a race.

In three runs without patch 2, perf kvm stat live reported 111,894,
6,433, and 6,838 intervals against roughly 200,600 independently
counted KVM exits per run. With patch 2, the reported counts were
within 1=E2=80=933 intervals of the independent counts. Separate cursor tra=
cing
confirmed that read_done() advanced past unread records without the
fix and preserved the consumed cursor with it.

Paul Moses (2):
  perf mmap: Use the head selected by read_init
  perf mmap: Preserve the consumed cursor in forward mode

 tools/lib/perf/mmap.c  | 2 +-
 tools/perf/util/mmap.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

--=20
2.56.GIT


Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D44A92E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363271; cv=none; b=eDKzJ/pdm4qf3p+YFWLrqdvUbKse9hI6XzI3G9fQ7qc2r1dFfjk9WQEe5/O3wyTl8gOLFI4hJRzN0Ntn0GrL+pagn8XOB5AUNEE2rlzzckAzLkdMlSN69tizzr8STkPHGTqeqmVIO+Zi6j1VLKX5uXgvFAXd32aFf1nRdVLQN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363271; c=relaxed/simple;
	bh=aMcZUshoBOiQaH1i02oZJ7ZYpAJh6r6fqQnmy6TPvdY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T36ZdBGT533KSv/4xFdbOuPImJfG5DEZNlaqmzQZu6ovMEtxfcB7+OhwexJOIKZzLxU8E4rayNh3rl0GoCp9ZrL0aN6ynz+tR3PQyBbHN4IZjCp5oJbLzK2qhucXyFhBeq+Y0aVcXKWSe4EONXso4MKlsGEtE3TsedJhKfdEq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YS11Cbke; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YS11Cbke"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1888370a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788363266; x=1788968066; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFDJw81pmZp3bkGxaweILlNzJoQ/yJsuk6x1thpaJ5k=;
        b=YS11CbkeSyKzmSTTQVGHLsJ1WVb/7uVc8mPnGGP5X6gLCc12Pt5Geg+TMWifKdZtbh
         7sTggrt2xgZ4+HfUJ6PTuDAeN/x2miJfRsWpTX4WbhJLalNqplR4yRG4eSTqyXydPCER
         j5fEmeIwWQ6P0gaS3m6r5X7qEfT/i4Dk+cgqjI6wMTTb1NFHLqgi4tOribA+JPI5JBlw
         9u7T3UfJhS77kIgLdcQZ3ywyJyRI+Db2ag05gj7tjrAeidFhlOZSa8rYRp9gAvhoI4RH
         fMwkVgEgoDcFQ9ijqu2u7I2AfNPZo+n5/02F9VHfNLTcRKRqwhEYVTDkclqJlx1Bulpp
         PL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363266; x=1788968066;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFDJw81pmZp3bkGxaweILlNzJoQ/yJsuk6x1thpaJ5k=;
        b=TljJMjLwPhaTExWxN9Zy0YbGwO9X3Pj7/4raN6M0Cds79iACN5/MRynkn4SKYH1urD
         4VpJyzTCVQBQzTwAOF95o82CAMZGjdR4CZRtUcBTfQwA/u0lSc6hfp3n4jNOemyJga3V
         cuE3KSFfV3T6EL4cp5Yu5xjTdpLV9xvRntzE0Ane8zS7QQ4+NTwfOEibNd5wj3dut8fE
         mO3kmnQSDzB4cYpGsLb5zfAsPVzi9kJeAy0Inc7A0xdzeB7VVldo8O6VLNId1O+32nPG
         o2hyjqRjyrM95VIM/4EbSkOq80d38uU+rka3olceAnnNdpzoJKu4b1or6ceCrQa8txhS
         4MHg==
X-Forwarded-Encrypted: i=1; AKwUvBxln6F/n4QchBMgLDPAzECuXTX4qalZ5GlZ+3eqx04RsXp0B9/AZSVBJJtdtuKM1TOKEpTwHfFWz1WACkA=@vger.kernel.org
X-Gm-Message-State: AFuF++lt4rNDPgxZ8lYagPSjY49dURxjuzTzi4tqk0/LvSwKElnYuy1W
	BdbTf2slFaYOcSzPAkAMPAtkq9zUhxjGb5O6/JF+hq6GWV6Re1IHYMsv+6K1TxO1yneHE4lZohM
	BM6s+UsSvQg==
X-Received: from dybdd18.prod.google.com ([2002:a05:7300:ae92:b0:328:6c15:25c1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:524c:b0:390:8361:a532
 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr8789716a91.7.1788363264826; Wed, 02
 Sep 2026 08:34:24 -0700 (PDT)
Date: Wed,  2 Sep 2026 08:34:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902153420.2069344-1-irogers@google.com>
Subject: [PATCH v1] perf tool: Align structs in arrays in .clang-format
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Configure clang-format to ensure structs within arrays maintain left
alignment inside tools/perf/.clang-format. This prevents standard
formatting runs from arbitrarily squashing tabbed initialization pillars.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/.clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/.clang-format b/tools/perf/.clang-format
index e4cff363a603..7cc11f84da88 100644
--- a/tools/perf/.clang-format
+++ b/tools/perf/.clang-format
@@ -21,3 +21,4 @@ IncludeCategories:
   # Your Project's Other Headers
   - Regex:           '^".*"'
     Priority:        4
+AlignArrayOfStructures: Left
-- 
2.55.0.966.g6673acef38-goog


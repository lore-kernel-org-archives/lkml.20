Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522331;
	b=BPZNEF1unQhw9N5yESh55ZyHzGPWA2loQh5HxQD4xw2BSjQ+Mud7b/xiiorTRkckqvrx
	 hTvq4g4jYug+JI0DB3noxoGbZUMQAH/XJl62DH0yq1i50KiUtOq5stWKjmRxFZSMaqdJ2
	 12EhjbzQa0JFKxxkeXq8NNhz/0Di2VM536OTZK+gEURpeFyYB3XUhPkNPkPPRsdr/cz63
	 RDrHzCLuHu4h50IYgGz3iGh6zaadEAkqZmUbOnUT+ULoRBcIOG3UsM6IvjUbWr4grbwYM
	 75okWCd4n7nd6pNDHgs2A8Mkn/U8LhfBu0/PdP9oIxnrK8bQ7n4Ve/Q2hh2cwGpPwjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=foaFfB88socwxfhENQukeiUi552VaoZHM30SQaS2gNQ=;
	b=FqzGnoW68NUz1zq030eWw5B3PuY1iPUgAyHaT1yXRtQtZx9Ad/IS0cc2uRJbPdEQiXgX
	 prox05OVGPkycjqyA81dQdXf5ZeEb9+s4z+3LavHOll7FCJw7BDgRuWpSHiqt9xPcyh/w
	 q7kTJRpnuP5qR308M5xKsAFyCF8rOMuuQiSbFtMjS5qCa0ZFWsT9E0poG7SRInihXidiV
	 jhxUh2fLlbhcTFZA4PP0jIgSmQHaM9l/ROiBAbHUOiL4xJ7f9Y3GkPgFpX1lVWMVnGKk4
	 JqvfUnes0VIXTStMAsk1e9oarbnV16cIWs1uj83hvbMAuRyabgkM8Gh3haRg9GE8EbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZp+Db+3;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D61606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZp+Db+3
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso262333c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794522329; x=1795127129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foaFfB88socwxfhENQukeiUi552VaoZHM30SQaS2gNQ=;
        b=uZp+Db+3VC61cPzhJevYcj/nYnYq2V7XUfQOTI0LwmsVsGLqBPDYmYJZ7yvmROKePH
         CCQALlbQ0INihRfoYfvgY6FgfOmjywq2g4EyyQiHn0QfB7gB2Xiz9mAsFN8rac2VXszJ
         50oONRfrCZqt8ptVK7F0THgyrd+InnbRsliTTubsMccQT4BV24WsoFCzeivFfFQ/8+dW
         GXVfQgVynCF4TLz9Zzkuhmb6MeWRR+pmgELWdz4npE1pK7kmn2Jmwh5bKM/hj79v9MVL
         UX2rUcPywEQ7aCuHhTKdJQdlUjZM9QWZjpLieX5Vj96eRg/c4Il9UWHD4REqz3U/CncV
         eTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522329; x=1795127129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=foaFfB88socwxfhENQukeiUi552VaoZHM30SQaS2gNQ=;
        b=cIxp4yrhaA/ErLY9l72nQZJxuJ7qt3xRCkaC7Ok+tA5WhP/hcRzaIIBnk1jJc2epo0
         f3vdS0ZEGNP9hQIeQREx75rjGQmmH8CAwNCqmE04vU1nNVO7NE1mckLh+6AXKBF708JP
         Jlu/TDWcApSUgUf0jilFQZKsAQLjE29hYdbpHtpZu+1JnX6ATw8Tv2AF7kh9IAOKzhTc
         yZGPCGw4r3aioAoVHY7Oya1l5NdZeWqDOrkASBrEhIHxvrwazEzAnlhAPVSu6EVnScEk
         Q8OZWKXp3cQtCrKQmDM9xcSo1VsFK7FVe1XC+Gjdrg+uaVCzfgPriRqC+esuimSgMDYp
         qGjw==
X-Forwarded-Encrypted: i=1; AL+hErGhgI0Cu9cOQaZkjzX6cSXXlX1xWKqlpAAHGIDmobMH88udrri83G+cLRJ2jvW5Di7NqlKlQOJUTMF6Ufk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y29a+jM2r0pF39sgliJ21qoDEgKrdeOwMVtTb2PaN0GmmnNSL
	2waUKMn9oSdoYfYy41NF3RX8Is5lYMCSgUVGvoYo6JQn8FuVhOGIJ7NX
X-Gm-Gg: AYBFou05qyDl0tGSml89zaa21yG4UFML9InmhWdAz4SWydhieWdC3kHt6MNl4KMGzGl
	+Kn6FH9H74+cflMDGJBdKtPyEJ8FZzG4nNvOzuzdaVEc03aAKS9ZlMcHuPVaGaoYeEvGvdL+NNN
	X3UOEncEznYSHzW/So+wHnjnQA9e3uQEP8boILIev/4wt9uZcfjcxn9sq0ngv2/GXQBwo91rfK8
	m5KtBORWUNnEiwT8UWtM3hYTTv/ZPyQFdh3Z/gQGpNl3tZmyOPKVKmCPjErTpafS5yzoFSk7p5W
	MGkvuuqP0Fi99/y9mvr0sPUk/yWobCWIFSp2iiTteWiJlb8LOjvcDs4m1xpkC+hXTgQ1xkvsmXT
	TM/2H5XtSUI3+L4uIlUINE2qIW1JH5OTpWFAJ6K+9A2a/m0XUdIYqfkOkW3Ycp9B4ulTU/F0DAi
	ob7ItYwg2+Q6SUBYTUvqve11+9o3oKQK1bPDdXu/cKOZC/C7uww8IcQtryhxzAV5enqEs+n8OnR
	minopptCkOq7Y+hEyEyBlJRLhPs/g0nipu0t37/THqeZxDr4Nz1giHZc6gfLAbneUcyclo2+qu2
	dEL3a+5HkFdSGvJnQUrb
X-Received: by 2002:a05:701b:2219:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b4f5f1f0a8mr3042511c88.7.1794522329262;
        Thu, 12 Nov 2026 14:25:29 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm1718526c88.12.2026.11.12.14.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:25:28 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v9 0/1] perf jevents: Check the keys of the JSON tables
Date: Thu, 12 Nov 2026 22:25:25 +0000
Message-ID: <20261112222526.462146-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173241.197996-1-takano32@gmail.com>
References: <20261112173241.197996-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9 of the check.  The two points the review raised about the argument are
fixed, and the one about the tree is still left alone on purpose.

  - --check on a directory that is not there used to report nothing and
    exit 0, because nothing found under it reads the same as a tree with
    no bad key.  It now says so on stderr and exits 2, which is the code
    the test already uses for "could not run".
  - "--check=DIR" is taken as well as "--check DIR".  The option is read
    before the parser looks at the three positional arguments, so the
    value could be left over and taken for the table directory.

The check itself is unchanged: walk, set difference against the list of 51
keys, print the file that carries the bad key, exit 1.  On today's tree it
reports 19 keys in four tables:

  arch/arm64/ampere/ampereonex/mmu.json    PublicDescrition   16 objects
  arch/x86/amdzen4/cache.json              BriefDescript6ion   1 object
  arch/x86/amdzen5/load-store.json         BriefDescript6ion   1 object
  arch/x86/amdzen6/load-store.json         BriefDescript6ion   1 object

The point about the test checking a temporary table and never the tables
in the tree is right, and it is still not possible to add: the tree
carries the two misspellings above, and a test that fails the day it lands
is not one anyone wants.  Once the patches that fix them are in, the test
can run against the tree as well - I would rather add that as a second
step than bake a list of known-bad files into the test now.

Changes since v8:

  - --check reports a directory that is not there instead of passing it
  - "--check=DIR" is accepted as well as "--check DIR"

TAKANO Mitsuhiro (1):
  perf jevents: Check the keys of the JSON tables

 tools/perf/pmu-events/jevents.py        | 41 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 29 +++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0


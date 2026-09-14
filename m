Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E94D5A1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346737; cv=none; b=d5xKD1czGjHuziFLlO7iymWy/cWFi5qU/nudvdDAdUfS8A4kcIVSNVSwJFwwlUrqGAX+k9sYJ+rrPjmkR00ydtah1Q1EXzMPtQYCuHlpojzO5DDBBLhLufrdYdPTb9GQxJRJvKJVhgtS1/JKWVC/92yBRwp269vbE4rvcIXxaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346737; c=relaxed/simple;
	bh=3vx2QJQpErdCZPn9W1iKN6aBTLz8fQDAQbthjqOGb6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uNzbufipUz3BsTHD/Bdp07+8TMCimVNmINYr0EyLoGEKWgpOLOt9v/wp4S59LUwAijQAwxlBlVaEjSHW29JQcAEGfN54Z8xBsxEh1ZhU3HojKQOI0DEXIjSfDEx6ztDKV8oNC2fzIohaI9rqTHX2cbZjKCEyVkVDy85h6I/dxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=PTeC7Voy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="PTeC7Voy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd6665a10fso3016015ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789346733; x=1789951533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7RGlnM7RppRSNr2XCcE2fndgqMIXT9hQ8em3W/TKFM=;
        b=PTeC7VoyRQIrWYZYDqoHJulVJ7fFlwSWdtSz/u/FH7uU/I4H5z5LWtgmcnQO57xKFV
         z+doOy/pPjJbfEMEfcrrc1YkNm+OtBOYJfCrp3L8o7gczqRUOj84im4+Q7+ZevDkI9Hd
         6p9TspWD/S1NSjDz5LlEhmiXQ6uWtg/8qhxR6pV7YKgoqIznOzg+JcyFm++ltMfwsbsD
         oCQtAft6I5ZIKnzjNjN6Bf5wCbVC2aB0wpdkKhmTBZigyWKu2nTjuXJTf2mxr94NIhez
         /i19NyyqyiCC+sbn3eY6PUPCIlrNPBK+jfYIJksHUQOQUGhPlfYjhw7tqaeiuipIN+ft
         byUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346733; x=1789951533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7RGlnM7RppRSNr2XCcE2fndgqMIXT9hQ8em3W/TKFM=;
        b=JUgbCkwr95tFEnEtQcZRukMlCMVuJGT7F95r1lfhh3Keo1FcDx1aVmkr30CGSLI9Pi
         zp+v6hjxQgjJZMpjn5b84QzEfYQMe6qojAaAW6aPCUhyJJ6WBdpn/9xYCDUn25nWiehw
         yRZIDYRmKO181756FJAvmDC+I4DGNpMaESDNUTuHN/rNYhESWb2nDjQEUY+HnRxCh7ep
         Z0AwpkHbZTkgB3LbdyEcU3566TagqfjHoGQrexoBg/8vLlVExGOI8K9m7bSGJEdeqrFc
         tNDYTC7uiNBXzsl87E6+JurmJB8WoXZ82LX8Pl+iJ3FN0q3edcplGds9TWWgIhA+hU54
         SXdw==
X-Forwarded-Encrypted: i=1; AKwUvBzyQqrRn9nmi6C8u5QRLs4EyB0vJj1oK+oO2LKOWoA0aU9XOlvDbKJZGbDARqT0ffhjJH/NNW/0npVxgbA=@vger.kernel.org
X-Gm-Message-State: AFuF++mnf55FissRqrBYGMC8Jqo1xaKZXmXTRCD+NQ724gCdX/JuHJk4
	anqpZcqAJQFc11CeI/mh46oglxP/cLig/kekTZXWQXy4J8PXuXq+ownbDa8OIYno7Wc=
X-Gm-Gg: AYBFou0hz9vPfJT/aRCfMBdyBB4xpemI0ZDLY9FB8Jin3jr0niogtpOPhb5EAt6DiOJ
	v9oEpZ+S7oJDyME0nRFYzZgXH/Yfjm+8r6waeJfgbJfCfq+fUORipTvpNIeeRy7DC3USAaZ+0Rq
	96zhnlXMIVSgwWmgkizO5bpBwpplJBJ9GwTFpPaZUOHLacSQmke6zlOTuWve8eilI1bLuvrIqHY
	RcA9cJsJ8EjWAiwFJIa7Jwfx/S6eD/L/PZY/sXGgEtIaH1svT19ame7/J+8+1uo3vTz9Llg4R40
	VBXW+lZv0S/LqFVQUABEk19vy6ROHT4n5dig56crLOLXpUFT7Bq+/Xujh8iw8Q7AjJFOtAyMCkb
	txHOwt01cGlZf6NKQlfIK4cuKmtA05nlqFv3bxYs3NXdQ+fYHlxjbPmtM/E+k4R28GG4b7jhlO6
	p7vaGn8gnw3wNJN9rmEvYjhp9SezqQ+3HdplJqkGACuO068nrSzyrTqQO7k5Dv1EsXbT++0zq4Q
	4AbP7mappD7ZiaoyT9Azsy8BzsYcm7ZXQyhv88J+B8+c8IL/PPhpRtn3w==
X-Received: by 2002:a17:902:f644:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2dd6c725048mr6751595ad.15.1789346733164;
        Sun, 13 Sep 2026 17:45:33 -0700 (PDT)
Received: from localhost.localdomain (111-240-141-218.dynamic-ip.hinet.net. [111.240.141.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm32604465ad.12.2026.09.13.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:32 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v3 0/2] selftests: net: Exercise TCP payload verification
Date: Mon, 14 Sep 2026 08:45:23 +0800
Message-Id: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds TCP payload verification to udpgso_bench_rx and
exercises it from udpgso_bench.sh for both IPv4 and IPv6. The test
checks the receiver's exit status so that verification errors are
reported as test failures.

Changes since v2:
- Wrap the receiver command in patch 2 to stay within 80 columns.

v2: https://lore.kernel.org/r/20260911160649.51863-1-f64116045@gs.ncku.edu.tw

Changes since v1:
- Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
  addressing Jakub's feedback.

v1: https://lore.kernel.org/r/20260906145643.219609-1-f64116045@gs.ncku.edu.tw

Testing (v2):
- udpgso_bench.sh: PASS=22 SKIP=0 FAIL=0.

No full kernel build or boot of a patched net-next kernel was performed.

shuo huang (2):
  selftests: net: Add TCP payload verification to udpgso_bench_rx
  selftests: net: Exercise TCP payload verification in udpgso_bench.sh

 tools/testing/selftests/net/udpgso_bench.sh   | 35 +++++++++++++
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 2 files changed, 77 insertions(+), 9 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1

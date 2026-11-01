Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521065;
	b=0NNGIY7O1oQsBfu5apIxY2c8QqoByRpIiQ06xGQZWv42mHdZE6HKCEAeSadcFh7f7erI
	 x+xRMALUQEE+U8U8aPlHzCmNMbMJSwxfLAzM9QPrG27ZrqUm+9/HQ44/az71Vpcnz5b9X
	 uow4Z5xQR65pWp5xR0fn1vkxk1ajYRABKHRkcbDVHPj4DfpbzmTxXCpyRf0pTDMViBLqi
	 9AzW15x6ZTbu8fHzbR57CYpCd221vyxwkbAzR+hkrJm2r6vwFu948BSD2z/iwva00CYjN
	 UzwXCwrigbVTnoU4xqBJTdyXNyBttKDMoLjhIcXwj4KItQnH3WYlJrFW+vBfC/kU9Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OTjm1dRowZIe2r6H1xJ9iOraQ4+BG5KAu0AE6tkBlgs=;
	b=TFf9V8DFMaDkMnYSxb3gmW6XwY5rz/5O5QDHeLHsKWI5hueMoRfVYVSI9matkEwAkT+b
	 Ur/UFuUjoUp4Nf5Xv8lOdVSPaWcbvLbiS2rI4Nc197yHkylkcaUdqBjTmY7dYatNdkShE
	 rX5GaDOSYwtNpGZbfSAGnl8xtmFkY9JoPlEd73Mj90JAkI3y1rb6ZehuzQI0It0nCkaTZ
	 myZbbY7cBuxFcM5CsPBabNCSNlEbsX/B/K03w2JaIvcdMaQoJ5Geg6bjSAA2tAkx/HI31
	 B33kcsqf/HU0SkvIrC0+DtTp3qtxxDAlMoiW+/ovehGn9Uo0nyEuDKqaQRoOPdkrgFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfQN93U8;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A78606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A78606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfQN93U8
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a058315c79so951654b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793521064; x=1794125864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTjm1dRowZIe2r6H1xJ9iOraQ4+BG5KAu0AE6tkBlgs=;
        b=LfQN93U8rZAbvzHs7ZZZcu1MeQd4rZwIEKoFakEJDMEbmdhjfcAfSF1dFYdBcwiSHm
         10i8xSIZoedMZdK8awfK+xM+ziKF2tZkuTMlS8D5Fc37yw5rn9f6obMhu3dUca+g1FY3
         DKkB400y7DJjfsIFWgP54EVaYa5SVVbsAfE4RqQDc3UjfVBcXE8pCrMhpC9qP5pVRI+4
         y6Kng6pEnFZtYQlpnAEeHzFpAhyXlG3hFp2QrB3tQqgA4wpfutlLYapR/Z7p38/blgqi
         KWv1iXY9DBZvByKSBgUnicpD4musrNDMey1kXtq2/AmE3aEY36pWAD+vHhEUHwhkKiPz
         3hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521064; x=1794125864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTjm1dRowZIe2r6H1xJ9iOraQ4+BG5KAu0AE6tkBlgs=;
        b=tLUw4LtYvnXqxlpcz1ylqLQp2Dn2RSkx9CJVd7rmpfHx+y9qGIVhAyEG3XRLhyulQT
         KAHFnM1MS17wBOrDAO6ZlP/5EXJzK2R+nYAL+b/mRtphzcXLTqZ2cHImWlaXrflsKHCb
         jR4LsiFiqsUw+ag1gpPDEVsMYTBQOQskY9+yhBiC79MzA7JolHdoHNlzfOn7/VEqpJVY
         Ca26n/BbHXDsDYb0zrUYsqp90Hr9dzHeBZmb49ZP2PFTVa9sMO5xhEUmour6LkK6poLC
         utnI+V8yWTNjveIoZtkNwVu5b8y/hk6fbQdZJ6Q8Wr5CEu1I0Zdkss6wjHwiMiT3lXMI
         HTDA==
X-Gm-Message-State: APuU4Z/ObAEHDFe3nEvoneP+FR0859JSAuGC37u9idG7J4K6ycz/9t7r
	hffe0xV6HIdgsW86EOBv94/yw7bpA3gaeRmpt5QswZkQOAbjinWeIF8c
X-Gm-Gg: AYBFou3/FJqnLgYnG7achkWN0gZB+a3AzY4u6ZPB2fvazg8oCiump/DW3PTWbeEQsrn
	15gwMki1K8v36BDVoL4Ab+bpDshm2j4MC86+JmrQGY2NVY/LGqpgeSkakTKbnmyzVehwYzqrG4i
	dQ551KTxxrrdsvKetwwY8BjFfiN9uIOSBe5ryyVGBv6IAjU2ulLdX2iTk1ffX6gCGbxsiDrEA6e
	owiTY8S/jVY7vy6pVZ6VvaxoSK+BN0gTdnnCz8U3xtQ76WMSTuuaK0SEEqc4lLyqXRGm6Xiuka0
	o1bXfpR7kk8+8qcjH2Pz6qV8BMyV6ZbSHW2yIngSFgAZya1qtOlvCpeUtA/nF2v1WPxDmzv25uZ
	6z4BB+B/KSzlfq92af02UQwDqPpF1YINAXOowrbzvw56qb/OUlzHfEkTd6SNDUmx4xCZuQgT1y3
	VszbTSDu1JLi3UDKHsA62/ggN+2BL9n1kV1dbseP+TEs5UqEkUAkGF6C2MZpNdqisval4lB3p/W
	xFl3A34rmAVGEg6NlsLwIKVN+eZfRDlctIKkJLaK8LoOZ71RRbclJ3amHBwHloeI+wKqczHfWqM
	JFGq3Io4GNrtc9q33rho2kjRg4vPwzghFS6YJS22q5FUg5xHN105qx51Ddu/7GJUdQuvfzn0QbK
	cbXD9/eaX+rIt6ROQGdSpDcU=
X-Received: by 2002:a17:90b:5886:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3ae896f8551mr5236140a91.13.1793521063450;
        Sun, 01 Nov 2026 01:17:43 -0700 (PDT)
Received: from LDYT9Q2G2M ([2a09:bac5:cad2:3228::4ff:28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm10011455a91.9.2026.11.01.01.17.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 01:17:43 -0700 (PDT)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Finke Lennart <lfinke@student.ethz.ch>,
	netfilter-devel@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Subject: [PATCH v2 0/2] lib/ts_fsm: preserve patterns across tc dump and restore
Date: Sun,  1 Nov 2026 16:17:34 +0800
Message-ID: <20261101081736.51803-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Dumping and restoring a tc text ematch configured with the FSM algorithm
can change its packet matching behaviour or fail with EINVAL. This series
preserves the public token types returned by textsearch_get_pattern() and
adds regression coverage for exporting and recreating an FSM configuration.

Changes since v1:
- Describe the tc userspace impact in the fix's commit message.
- Split the production fix and KUnit tests; mark the fix for stable.
- Add KUNIT_EXPECT_MEMEQ for the exported representation, as Andrew suggested.
- Add tc maintainers and netdev to the recipients.
- Add actual loopback packet classification and performance measurements.
The production code change is identical to v1.

Validation on base 2a500a04d6f969318c05f46aedb6e73fc1963a00:
- The same updated KUnit test and ARM64 GCC configuration fail 13 of 15
  tests before the fix and pass all 15 after it. ARM32 GCC and ARM64 Clang
  also pass 15/15. Compilers: GCC 13.3 and Clang 18.1.3; QEMU 8.2.2.
- In an isolated ARM64 QEMU guest, a tc basic filter matches the four-byte
  UDP payload "7777" and rejects "AAAA". Recreating its DIGIT/MULTI text
  ematch from the rtnetlink dump makes both payloads match before the fix;
  after the fix the restored rule still rejects "AAAA". Every probe is
  observed in the classifier's evaluated/matched counters. Restoring a
  PRINT/MULTI rule returns EINVAL before the fix and succeeds after it.
- The guests have no external NIC. These tests use direct rtnetlink,
  rather than claiming coverage of a particular tc save/restore utility.
- W=1 reports no warnings for changed objects. Sparse has no diagnostics
  for them; an unchanged ARM64 vDSO object has a declaration diagnostic.

A native ARM64 userspace microbenchmark of the mechanically extracted FSM
matcher (GCC 13.3, 64 paired samples per case) measured median paired
slowdowns of about 1-5% for the tested long character-class scans and
about 13% for a one-byte rejection case with appreciable variability.
These results do not establish in-kernel or network throughput. The extra
lookup trades matching cost for avoiding a second stored pattern copy.

Mainline cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a, linux-next and
mm-nonmm-unstable still have the affected code. The series applies to all
three checked heads; they were not built or booted for this revision.
No x86, big-endian, sanitizer, module-load or stable-branch runtime testing
was performed. The packet test measures matching, not dropping actions or
network throughput.

I identified the issue and reviewed, built and tested the v1 fix. OpenAI
Codex drafted the fix, tests and changelogs and drove the additional v2
validation. The added assertion and revised messages are AI-assisted.

v1: https://lore.kernel.org/all/20261031052307.23533-1-zhiqizhangg@gmail.com/
Review: https://lore.kernel.org/all/20261031202211.22f18bca7819dbe2d107d17d@linux-foundation.org/

Zhiqi Zhang (2):
  lib/ts_fsm: preserve token types when exporting patterns
  lib/ts_fsm: add KUnit coverage for exported patterns

 lib/Kconfig.debug                |  14 ++++
 lib/tests/Makefile               |   1 +
 lib/tests/textsearch_fsm_kunit.c | 138 +++++++++++++++++++++++++++++++
 lib/ts_fsm.c                     |   7 +-
 4 files changed, 154 insertions(+), 6 deletions(-)
 create mode 100644 lib/tests/textsearch_fsm_kunit.c


base-commit: 2a500a04d6f969318c05f46aedb6e73fc1963a00
-- 
2.54.0 (Apple Git-157)


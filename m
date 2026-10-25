Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918860;
	b=I3tr/DNOmuRpOTeL58wTxorrgiPfm1uL6dFEsyQ6yFDW8B/55me9yrpTcPjKxBiC+ulX
	 BQrOF8eFGNqtlLC3iV11XeUO7QzcoBMfeZWRDrkYiN2ng6Iu5y+vKqPoImoVEty2v5dvf
	 ptB+Lm/iDSUaOAPzcvv9aLClaci7CbyINUQZawldZqdAyTPw25zdTXLfPxkb8243gMn8d
	 YGc/UgiJWd7dX/GGbRbvn/4lOeJ4nCE2VV5uquK2KAvqIEqqNSv2L9pMeVTGtr5WUV9X/
	 T2nTZtIWAxOgxojlvlQkepVE9nVhEhZN+7GoO3RfixBN67YidyLy450GfnIFJLdsHDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=InzIDyXEr+I6FKQ6MXVz9W56i3VO0fJ2tHFBcvb6StM=;
	b=vx3t1XeFJF+B6q+Agef1Sbs1Q4AM0KjK/syi1f4EWtEJiHvipH7BorS0zhhMQ3enk/dV
	 n7vpSxLs+mGVZ4HVktiPjZU3nhGBjvH1nUCIeGOv2kb26FIiGjAK0+LTjsguwwvVeufNN
	 4pYPZW1s0D01pMZ2FSZzrDXUZ6pUyhMO5MuwsisKNw2qIPwoBh2bjB7e1FSSRgnoNkZga
	 wZt96zQdREkPpdEUObIJGcLT740MvYMPzrNX1co8bEBMimyaMFdVc09vJMhdMJkzkJxKU
	 F8N/lOkwptP6AEsGIkhMYQCGOjjOyq7nZSMjTeAEQ1I2JVX6m/esxuCwJeOO4ezTpVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W6+2wPJT;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCA606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DCA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W6+2wPJT
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so23411455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918858; x=1793523658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=InzIDyXEr+I6FKQ6MXVz9W56i3VO0fJ2tHFBcvb6StM=;
        b=W6+2wPJTpE+MLIPiT3uOv9PiHfVtmlWi/kv0EoiD7NhIs6vGogcZQ0AFkvaZFhnaqA
         V1kpSPuJToHO5p5vgBD5iZIbbxoHA54mXjby0MBgFLircJMYDsG8h617Bbv2c+9BkYjl
         fwSyc93i3pxgErV10ObO3M2eh1jrtvNHCEimL6utJe72B+YcWN6VsrVH5oMMdSf+CVef
         pevaU728H8azko/1P42vRgN1nn3vaErhw48o/aGvBfPt2Aq3cmmXZDIGuEyp2pP2jpCE
         Kahc0y3LPtb3ZH/iIuQfC8GS66icKeOayYxFgQnXvmnMTJgAv7h1Ydd4cIdryDW+EL/0
         6Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918858; x=1793523658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InzIDyXEr+I6FKQ6MXVz9W56i3VO0fJ2tHFBcvb6StM=;
        b=SXIXhfId4ziQjWReKebDud91GuUA7pfM0cSUaI+5c2fGf8Dur4imtAiPIxuvCdpp5a
         H4A2gzN43mUoGQPMpol4Bn4oxJBO2nnEq+n0PqtNLwcgP+Uajmpd9hlg2V/rsWNE+jBQ
         fDVEVOVUeeIJoksMnV1wstepHmB1GkQHoa5IYCpuhtJb/hQCb2ljitZZ4Bkgyp7/lkWh
         7pf/Svx8c3qSPCP4tRgH3CCJqD1QCTc70w0ws+LhLTxSYP6tTBayxQEXgJCSQbMPFziQ
         lRD5kKxJF+OyB0X7LbgWy6Rlu/fwrL783hLPLjIep6xxmdnWSGzEOSaCRiobVF+eVdXB
         HtsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdR/zsxhsdJ7stYWedoNgY/KNwDgnowsCEwm5f2KhrA+9kIL7wUK8etgo3GF3E98pYdbSHtrsb+3/EW30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuQPmhI66Hq9iy6DamNEcLginz5mdx7SRpKAlXQ3wszS0vCN7x
	rThH6W7h15bPE+Uj/ayXoRf16zJmSxPj/tUZeL/wFgdg3WXbDKf6kwtgIMR7EoKC
X-Gm-Gg: AYBFou0ab7xO/aOPLzlRpmnaRDfrrC1h2/+CVxfX9LGyyBlsrEZ8N4v08fvNqsjARrm
	bIz4+CI6IhAsL/3ThFJk+oxq//oYEgFXXekqduC2EAaax/hdfMRadgnl7uV6GlLM4vEQ8FS5LAZ
	OB/6AGoPC6h91Ofqy9pbbrujIYPCCJfMtU1jaEM4alIU1F33jMSfXUcBrQD91/eHq+C5irn+ns0
	oXM9h+99PiF+p+xBhu1OQMb/A3uUbgpcihUoLM7/EUlhdhLeyz/CVR/QxGmjgi5T+fIKF5Sfc5H
	IfkSf6ImPIvN4YCWbPYhdog7Rox5PgJ2RI4Xg0qFZwoXkEoOi5mSwpc5lTC0gV/jXabijc+19ns
	gESVDm68WOPkTQUU0klfAruZPEY/pahrhs465+9+S1Fuu01ZbApWHay+vqetH94c0RvUPtpDHWs
	UrOmzyzSFzOLftBe2tiMwA5/gUtudFTXv+Fgfw1aoDNsM1yPx/b7Oant5VxTQJ7m/0+XgJTGUju
	q0kU1F1wKYdI3lL6WHrizQ5EfVU13HjewVMy7cMHCC1w3t/msjEae4AIzH1NHXS74zWrRyZpyg=
X-Received: by 2002:a05:600c:c110:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a35ac91142mr55780775e9.7.1792918858092;
        Sun, 25 Oct 2026 02:00:58 -0700 (PDT)
Received: from zheweiy-mac ([2a01:4b00:b60b:cb00:c67:3956:189c:b7c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm111588615e9.11.2026.10.25.02.00.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 02:00:57 -0700 (PDT)
From: Zhewei Yuan <yzwlhm@gmail.com>
To: netdev@vger.kernel.org
Cc: Zhewei Yuan <yzwlhm@gmail.com>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net 0/2] tcp: Fix fastreuse cache initialization on first bind
Date: Sun, 25 Oct 2026 09:00:46 +0000
Message-ID: <20261025090048.27870-1-yzwlhm@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This series fixes TCP bind reuse cache initialization and adds eight
KUnit regression cases.

Since commit 8002d44fe84d, tb2 is already linked to tb->bhash2 when
inet_csk_update_fastreuse() checks for an empty list. First binds miss
fastreuse=1 for SO_REUSEADDR and FASTREUSEPORT_ANY for SO_REUSEPORT,
causing unnecessary conflict scans. Patch 1 recognizes the sole,
ownerless address bucket; patch 2 tests initialization and conflicts.

Bind-only results on historical net f4377bf85887 (not the submission
base): TCP/IPv4, one-vCPU KVM, GCC 11.5.0, identical configs/programs.
Means of 3 guest boots x 3 rounds; only bind() is timed, with all sockets
kept open. Each case uses one reuse option, the same UID and port.
"same" uses 127.0.0.1; "alternate" interleaves 127.0.0.1/127.0.0.2.

  16000 sockets                 before (ms)    after (ms)
  SO_REUSEADDR, same                 4256.956        20.004
  SO_REUSEADDR, alternate            2476.914        19.983
  SO_REUSEPORT, same                   20.600        19.557
  SO_REUSEPORT, alternate            2491.294        19.830

Same-IP SO_REUSEPORT measurements overlap, so no stable gain is claimed
there. These are bind microbenchmarks, not application throughput.
A minimal reproducer is included at the end of this letter.

Validation on submission base 7076f684d513:
- KUnit: six expected first-bind failures and two passing conflict
  guards before the fix; all eight pass after it (same tests/config).
- bind_wildcard, reuseaddr_conflict, reuseport_addr_any,
  reuseaddr_ports_exhausted and tcp_port_share: pass without skips.
- Full x86_64 allmodconfig W=1: baseline and patched builds pass with
  identical configs, GCC 11.5.0 and CONFIG_WERROR=n. Existing warnings
  remain, but normalized diagnostics and counts match: no new warnings.
- Full allyesconfig is blocked by the MCTP KUnit static_assert at
  drivers/net/mctp/mctp-usblib-test.c:819. A targeted unpatched build
  reproduces the same error; this is not a full allyesconfig pass.

KUnit A/B and patched allyesconfig/allmodconfig W=1 builds also passed
on historical f4377bf85887 (GCC 11.5.0, CONFIG_WERROR=n); those builds
are auxiliary evidence, not substitutes for the submission-base checks.

Found during manual code inspection and GDB tracing. Codex assisted
with analysis, test/benchmark development, validation and patch text.
Requests covered real first binds, cache flags, automatic ports,
conflict preservation and separate reuseaddr/reuseport measurements.
No failure injection was used; KUnit inspects state after real binds.

Reproducer (not for the merge commit). It gives matching results on
the submission base 7076f684d513 (16000 sockets, same order as the
table, before/after in ms: 4178/19.4, 2416/19.4, 19.8/19.4,
2428/19.5). It needs loopback up and an fd limit above N, e.g.
"ulimit -n 70000; ./bind_bench reuseaddr same 16000".

  // Time bind() of N TCP sockets with one reuse option to one port.
  // Usage: bind_bench reuseaddr|reuseport same|alternate N
  // same: 127.0.0.1; alternate: 127.0.0.1/127.0.0.2. Sockets stay open.
  #include <netinet/in.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <sys/socket.h>
  #include <time.h>

  int main(int argc, char **argv)
  {
  	struct sockaddr_in sa = { .sin_family = AF_INET,
  				  .sin_port = htons(40000) };
  	int opt, alt, n, one = 1, i, fd;
  	struct timespec a, b;
  	long long ns = 0;

  	if (argc != 4)
  		return fprintf(stderr, "usage: %s reuseaddr|reuseport same|alternate N\n",
  			       argv[0]), 1;
  	opt = strcmp(argv[1], "reuseport") ? SO_REUSEADDR : SO_REUSEPORT;
  	alt = !strcmp(argv[2], "alternate");
  	n = atoi(argv[3]);

  	for (i = 0; i < n; i++) {
  		fd = socket(AF_INET, SOCK_STREAM, 0);
  		if (fd < 0 || setsockopt(fd, SOL_SOCKET, opt, &one, sizeof(one)))
  			return perror("socket/setsockopt"), 1;
  		sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK + (alt ? i % 2 : 0));
  		clock_gettime(CLOCK_MONOTONIC, &a);
  		if (bind(fd, (struct sockaddr *)&sa, sizeof(sa)))
  			return perror("bind"), 1;
  		clock_gettime(CLOCK_MONOTONIC, &b);
  		ns += (b.tv_sec - a.tv_sec) * 1000000000LL + b.tv_nsec - a.tv_nsec;
  	}
  	printf("%s %s %d: %.3f ms\n", argv[1], argv[2], n, ns / 1e6);
  	return 0;
  }

Zhewei Yuan (2):
  tcp: Fix fastreuse cache initialization on first bind
  tcp: Add KUnit tests for bind fastreuse caches

 net/ipv4/.kunitconfig                |   8 +
 net/ipv4/Kconfig                     |  14 ++
 net/ipv4/Makefile                    |   1 +
 net/ipv4/inet_connection_sock.c      |   3 +-
 net/ipv4/inet_connection_sock_test.c | 303 +++++++++++++++++++++++++++
 5 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 net/ipv4/.kunitconfig
 create mode 100644 net/ipv4/inet_connection_sock_test.c


base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.52.0


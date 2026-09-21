Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B951A13B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029577; cv=none; b=hmPgS71OCkCW7C/QwbkJk4MKR6hkQHDHfUvMGGng99BZcAX/F2wqMrt2qaDYEB3IzO55Wte7KmT4DGIbdcpmkzRgZoeSlLl7rR/esRRpMXm5oM+l9kAWJ2+aaa/7jtFHH1Kd57xACJ3oQJ9sGNDINBvlFKXrkmqLNe+4FoqMEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029577; c=relaxed/simple;
	bh=aBLxqyZQhOgf3TAzDDSInDb/QDQQM1Qyy+q82xgwgH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vx4wmgyyxbFecp8G7jsKoiL0nq7pGRzI5yd8PaaewvOX8gG0q5mjFcrH0JzJNf2CPDCmebWAEGoHimvVP+qd8BDmbpmClN5h5YuIGlRsKYhcF1rV9W57xul8msm9vmvrIh3X/7TW2/OtLGpsGRDaWhrbfw+RaCUiOUhxB2t9M1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=DUt7jjus; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="DUt7jjus"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067eso332726085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790029574; x=1790634374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kl4CFPtvedlEQovzhe8+gmEaMeiG5otby+pF0tKzS3A=;
        b=DUt7jjusJzKHbyHkfJrLE8Kitpfl3IV+gffh0uu/8x1cFwfeSXTXdtGvLT72cK6IO9
         +gsAq8lp+dFKdx+3S0E7zSs6txQ2TJfkmyDxSTKw3IJXTzDh3fTOrnbPkytD9Bw5YGxj
         /0QwtgwPirrsDRldQg89E7vuy+XmzWYoq9nss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029574; x=1790634374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kl4CFPtvedlEQovzhe8+gmEaMeiG5otby+pF0tKzS3A=;
        b=jDY4gBXrgsM7JdyNhr5hDsYhQLwKHdZlNttNCW8bD6LRQBL/QdJmFF92BFWrBlrxmA
         /uw/u36IDEKELItR1s50YvHBr9MN+38dZNF+mYlQKXLPW0qbvOVz7304ka/mmMrEORJJ
         o+6Edcrg+7F1CFZxiceWNTh5O6wguKAM42vscaDVei90Nd5Q3dnJ4lgTGS/TJW8OYzBM
         DYLxmDp/VUr7qsU2Lq7GJvthjZCEjiEl6xNXQQTDJ1jlMEH66BIimtv8O3KdUptjCH+Q
         6hn4o3qbkMdmWn0MZX+GbAnhQjIpzBJvGpT9ReTiBo0oksMhfEc7Nlz6EBo1Hr/Z7V6Q
         tK6A==
X-Forwarded-Encrypted: i=1; AKwUvBwYqDpdsmfhH+0RUO3DRrYKOI0B1BQ5B7pbCKn0zx8Ng96DY7nGPJey44HCsDYNSpCNgch6P0UnDVTVp3A=@vger.kernel.org
X-Gm-Message-State: AFuF++nQVSGfg4aDo9c5tmDmRaghzJ4jSaUqcdfRFjx+QmNbgJuLRi1e
	jVeRdztz5qmDZ0Y9EXh7fmjx+lB8oeA6GZi418Wvv96dYyB/lmF3GNwQ21X2Dph90As=
X-Gm-Gg: AYBFou0UBSIFrksfjLHYMR4Q/G4F3Zw2eT0aZbCMPLGvJLHIyFxxigSgo1e69IRwuwu
	ryaJkFkbSaO+5DjYwPCaUZ+uG8GIeg2Oa1RxvRYJBEaQLG2nYJZhJj7HK9sKtvmGQS9pigzlAC2
	4C1PVcxkjcjhSa1ardBAuD0cdZwb6KNM9Sne0jJJKR6OYYras3AyojnYZUW8fqyfLngNCx9/aHp
	8/JUCbxkRLmQH17Y8+RNGS2ksHOr2sBR4yUW5U0J4kOe8H1wDC/3dLmCIeLIhgQc6t9nKUwlD54
	FLp6Pt5NRVDT6P69BcoYL1aiGz8ow+avzU6fLGu0J7mn7RNcJoUnIrZCKIklClYwNV2bHTM8zgj
	TY4WaYCNWunvu1HKTda+UY+X4d2T//S25FqaF5K7zFDJMetBqJtGwdf/4itfjezaQ1z9uHOMeOv
	KOOBnchm79VJv1bi5x3L9Qp1axGLBp/37EHwGLGad839aVZfcnIFySJ9rv+SMEN5HGlQCCNCTI2
	o+M1BitpYNVaDfVmd1bf4gzjpnIDNo3QQ25lEiAuBnoGJZS48d0UFkjh5O9AG0K37GxlMEIO1s=
X-Received: by 2002:a05:620a:6f0a:b0:93b:c350:a31e with SMTP id af79cd13be357-93c15e9c840mr255119485a.38.1790029574432;
        Mon, 21 Sep 2026 15:26:14 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bc6f4bsm30675085a.44.2026.09.21.15.26.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 15:26:14 -0700 (PDT)
From: Jeff Jo <jeffjo@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/2] tcp: correct timestamp echo for accepted old ACKs
Date: Mon, 21 Sep 2026 15:26:10 -0700
Message-ID: <20260921222609.50824-4-jeffjo@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux can acknowledge newly received data while echoing an outdated
TCP timestamp. This happens when a reordered packet fills a receive gap
but carries an older acknowledgment for traffic in the other direction.
If the sender uses this echo to measure round-trip time after a long idle
period, the stale timestamp can inflate its estimate and slow its sending.

In this example, S sends the reordered data and R is the Linux receiver
being patched. All packets shown belong to the same TCP connection, with
overlapping requests in both directions. Each illustrated request fits in
one TCP packet; request/response names describe application
messages, while ACK numbers acknowledge TCP bytes. The numbers are
illustrative: TS and echo use S's millisecond clock, and byte numbers are
relative to the first post-idle byte in each direction. ACK=N acknowledges
bytes before N.

  Before idle:
    S -> R: sender request 1, TS=999
    R -> S: response to sender request 1, echo=999
    S -> R: TCP ACK, TS=1000             (R saves timestamp 1000)

                   ... 300 seconds idle ...

  After idle (byte ranges include both ends):
    S -> R: sender request 2, bytes 1-17, ACK=1, TS=301000
            (delayed in the network)
    R -> S: receiver request 1, bytes 1-17, ACK=1
            (initiated by R while sender request 2 is still in flight)
    S -> R: sender request 3, bytes 18-34, ACK=18, TS=301005
            (arrives before sender request 2)
    R -> S: TCP ACK=1, SACK for sender request 3, echo=1000
    S -> R: original sender request 2 arrives, still ACK=1, TS=301000
    R -> S: TCP ACK=35, echo=1000 (bug) or echo=301000 (fixed)

R initiates receiver request 1 while sender request 2 is still in flight;
its ACK=1 means it has not received sender request 2. S receives R's
request before sending sender request 3, so that packet carries ACK=18.
Sender request 3 reaches R first, making sender request 2's ACK=1 old.
The earlier ACK with SACK correctly echoes 1000 while the gap is open.
The bug is retaining 1000 in ACK=35 after the gap closes, instead of
echoing sender request 2's timestamp, 301000.

If S falls back to timestamp-based RTT measurement for ACK=35, subtracting
echo=1000 from its current timestamp (about 301000) produces a roughly
300-second RTT sample, mistakenly counting the idle period. The inflated
smoothed RTT lowers the sender's calculated pacing rate and, when pacing
is enforced, unnecessarily delays outgoing packets and slows the transfer.

Patch 1 refreshes the saved timestamp while preserving the existing
validation and handshake behavior. Patch 2 adds a regression test for
IPv4, IPv6 and IPv4-mapped IPv6. A shell wrapper checks the timestamp
echo because packetdrill does not currently compare that field.

Testing on net dd47bcf279f1:
- ARM64/QEMU, normal and KASAN/UBSAN/lockdep: all 68 focused/control
  cases and three selftest address modes pass with the fix; baseline
  reproduces the stale echoes.
- ARM64 W=1 allyesconfig/allmodconfig builds and Sparse: no new diagnostics
  (patched builds incremental; existing warnings require -Wno-error).

Earlier C-socket repro on net 46bc52d13594: after 300 seconds idle, with
controlled reordering, retransmission and fq pacing, a 1 MiB transfer takes
22.02 seconds without the fix versus 0.38 seconds with it (one run per arm).

Limits: previous broad-suite timing failures and feature gaps remain
unresolved; those suites were not rerun on this base.

AI assistance: Codex generated and revised the fix, reproducers, selftest,
analysis and patch messages. The user directed the investigation, asked
for real-socket and upstream-kernel comparisons, and requested broader
testing. A separate Codex reviewer challenged the code and evidence.
Sparse supplied static analysis.

Jeff Jo (2):
  tcp: refresh TS.Recent for accepted old ACKs
  selftests: net: check timestamp echo after an old ACK

 net/ipv4/tcp_input.c                          |  7 +++
 .../selftests/net/packetdrill/Makefile        |  5 +-
 .../net/packetdrill/tcp_old_ack_ts.pkt        | 23 ++++++++
 .../net/packetdrill/tcp_old_ack_ts.sh         | 57 +++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
 create mode 100755 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh


base-commit: dd47bcf279f1083f09bf5266890b26263361022b
-- 
2.55.0


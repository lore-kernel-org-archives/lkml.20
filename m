Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0114DD3AF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396792; cv=none; b=Rss4jdTBtk7sWg36o5/jWArJ4ZiraYTpoyh8g+5Hd4IOlViqemOKuzKRmO/XLGx7gFNN0tbSmhAFH/rfYI2uZRcFZGsOkQ2fcN+ZQchSpc0hjd6tSncxx1KKUOEDGNyWou67MWThWrcGoOcQPMi9KCLpwHmoXcn45VLz6owdnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396792; c=relaxed/simple;
	bh=x/T2DqdlBD5F/UfxU/ovY6/23a6DBA3cvr6xy3855h0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRfU6lnnlG8Z8U+jtAL4FEOdB1qdf4YrHsc4nnXmlu7t8TE+Wqt7GLmyUtDdWQrofaxZ5xCF7IAfPflKLmk5rLhTSQLc7woSZL9lVyRtpncC4iGWrdmw7oEmwjw7VbnSZVRcb5cZmYmprrzt3nhmyFOsbqyXE/9PxE4dA7bPaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4F31zQ2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4F31zQ2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a772ec8389so17793821fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791396788; x=1792001588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3ZlJwU7ID9cKcEPq14oLFUHhVFnuy1r4lGgSU64Z7I=;
        b=g4F31zQ2I25+P/7fmXo1uenCMkIX0zINLUtY1mxbkeNa6CRSyn+dSVo74M3Skpse+a
         few+HfnqAAQQCqRFWxYHi+7mbDKYlb9xzMwOm5FUrfkcIgaQRQ/qEITHD6RcmFGHo9DQ
         OhuWeXN8dE32xeRIXdo18PhWGsZ5h82e6t5GoWjjOFcwANwB6oQM2V7Xmuk6s49OVb14
         BScFT6vJ+GJsfs04jN+/ANnwHEa/S8+balW+Q6xKmoFVjv+BYla/oUBO8gq0aCh9De6c
         MhKahMxbvhy5plWTmk2s4YnUW7dc+1Pxwwa7rhreIdFfHb2vqWFYMdOprrQc4l3aruwZ
         cJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396788; x=1792001588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3ZlJwU7ID9cKcEPq14oLFUHhVFnuy1r4lGgSU64Z7I=;
        b=2ezB/ND89PH7IFD1yPsZp6m2mKKmLkYKUfO3dGU/83e+PsaaBcwS9F28wwbj/cohbM
         Jzu3pxo5VYnkN+ufHap+JdExmNov7HIMkJVwK5wiRvhoEwG5rcHQoUwEPfjN4iBAB8Br
         PbK4Zoz9YX7xefXvD8OgBmmziTveP4kzhJZ6Iay5eNQz1dhN5hfbOkNzYFRAgKi4rh7Q
         2FsszNnDoZqd7ukH6SN7mLXtHm3vInvA3v8NV6nbOJOzRN0bygCyruzYQ+J8NIPIqlpR
         Z1Xk86ShlBUG4R/RHFzsa+pUZXk5Cy4CN9f2HA7pZksNPk6iM7ZuxwXoexWQKfkTYiVR
         CIuA==
X-Forwarded-Encrypted: i=1; AKwUvBxCMqPuKubKEUYBqD1jP8acN5uijRrgeGTTzUK3YxN7X9WX8wglcrJvfaaGA5/PE0AP1JbmvYF0YCclE4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa5syAsbpiJQ43IZtnIyyrjiGxM8yqBU+4jfmuHgxxVqfHuMgs
	kA5DcctA8DtNcRYeQk22AEu8miX3nlQCZiXDhXf4GrHxV5plqY8vtEF2
X-Gm-Gg: AYBFou2WO/i8nJZzhJ1QetrXQgxXPnYPEtZlI4A7pYLiEbahtH5TQJ2a0J558huIKXu
	DGG8V9BSJHcnW6Uqus17vs7+DiJL0AZZoVZ1+ZM945nOS2aor9XYv7a2ToYx3UXNu7fnFsyFy/P
	BZB/T+sAOOEKas6qOS4CJC1P0mcYyPj6p1tTsKD2jb9YTSdAKfc6LH4Dap0kziD8BpHg2Rw/MKf
	/U1xVTuCxWInTCLnGgRBw4+iw69P5uKwZQEibyYrJM/tKWmHkM1tmLwshvtJMaPds/NExDCn+ap
	5lHRUwJmRxhz47Sscl/htsvRQHhLNoAWvY8J/nK6wN638IITqEppMtt107lhYqEZsoHY+QiZA6V
	nhWauR/kc8spiwxWPsApgHb6KPW0q0Zze+Z9a2rogmS/ed1ZxicXAEjZUWtA1hhLF9dW/hT+5zM
	qeXaby9iPf65sU4TGLsLmpCPb6P8/mNM3pUYHqNydInObPNVCZ7fRoAyEgPrCmX3sqRE6FV5thN
	c163xZDkRNWkMRp1WFwk6J/pumK5LY8X4MHyAHn2gDQw46JSeBf
X-Received: by 2002:a05:651c:3134:b0:3a6:66ee:1179 with SMTP id 38308e7fff4ca-3a9a2cd18a0mr8684231fa.27.1791396788031;
        Wed, 07 Oct 2026 11:13:08 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d59661sm9000041fa.18.2026.10.07.11.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:13:06 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf 0/2] bpf: test_run: Fix false -EBADMSG with BPF_F_TEST_SKB_CHECKSUM_COMPLETE
Date: Wed,  7 Oct 2026 21:12:40 +0300
Message-ID: <20261007181249.352831-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF_PROG_TEST_RUN with BPF_F_TEST_SKB_CHECKSUM_COMPLETE returns -EBADMSG
for correct tc programs that call bpf_skb_change_tail(). The helper
moves the skb to CHECKSUM_NONE and leaves skb->csum stale, but the
post-run check added by commit a3cfe84cca28 ("bpf: Add CHECKSUM_COMPLETE
to bpf test progs") still compares against it.

Patch 1 only does the check while the skb is still CHECKSUM_COMPLETE.
Patch 2 adds selftests for a trim, a grow followed by a write, and a
negative case that keeps the skb CHECKSUM_COMPLETE with a stale
skb->csum.

Tested in a VM on bpf, with two kernels that differ only by patch 1
(subtest results):

                           without patch 1    with patch 1
  change_tail_trim         FAIL (-EBADMSG)    OK
  change_tail_grow_write   FAIL (-EBADMSG)    OK
  store_no_recompute       OK                 OK
  test_skb_pkt_end         OK                 OK

Maxim Skokov (2):
  bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
  selftests/bpf: Cover test_run csum validation after
    bpf_skb_change_tail()

 net/bpf/test_run.c                            |  7 ++-
 .../bpf/prog_tests/skb_csum_complete.c        | 39 ++++++++++++++++
 .../selftests/bpf/progs/skb_csum_complete.c   | 44 +++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c
 create mode 100644 tools/testing/selftests/bpf/progs/skb_csum_complete.c


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.47.3


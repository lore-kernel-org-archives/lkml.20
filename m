Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A447D461
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576896; cv=none; b=RInecjPzl8TAV0EtX7OhdqXP8NBxmwILraiBiz2eEhhBRkbR7K6htJxb3/Vz11tx8QupR7PLcwWOAjBdptreFQfSHOy7zAKsgR90OF0+/3o3+UYkrxNsp+9lqc4FE9GoCGd8dEFP2+U2CwIXnbmkCgn+Rj1bw/r86rkv+lixLik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576896; c=relaxed/simple;
	bh=WFMQZ99UMpZplb7RsBAhDd2v9uvyJrKd1KhsSZExxLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYhFyKwrrEPFSMFrpqN6Dhoil1LqqbYyfK4kqyhIjRyHAcfkDOk6irDoJUO4VzCIT7DK2QBFujz0O9C0x7hIURuLg9vyh4MM2Snw2urTUA8EIVeSItFrDv7+Wz4IgQTY3utblIoYzLMSOZoE/hNsk+Fh+UpcMchhuFCkdcOGdS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=cHRV6qEI; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="cHRV6qEI"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso137893eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791576894; x=1792181694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbJd+F8HdwB4ZwrQUMxv51nPVS5BB9PcOKCpwSnYCy4=;
        b=cHRV6qEIrcaAD3WuIEOu1zfaOUZFKbk9YlmfjlqgxWOhj99TxD1igCSOWuCxLj/75b
         Zo/eRK3WFXtfshTnE+JIjfmrZr76U7B13pruDLbXlZ1mwkBnO+lVvwtfwI1bC40YBlua
         B19t0aTu/G8EuZqq/CC8yKZcivwiQuvfSgA+qv3RkCThD5IgoAf2mf0uRvqzKVhEVCup
         CA+e2bCpRzlfwUM8yIlz2DhcVJNDZxNKQFoIS0jdQUwHkznmXqwkOwra/p4MBYetATYb
         sw6sOxG5zvblvw7SSECBVXpUzUEITZ1Da3Uw0qTwe0aRBZVwQPw8GxqRfoUgdgQNwdyO
         nQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576894; x=1792181694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbJd+F8HdwB4ZwrQUMxv51nPVS5BB9PcOKCpwSnYCy4=;
        b=udDpwJtAPKJGGkuQdqjeD3N4SrCal5kYYB+Nx80vf3qUk7lEMAu7oLetZC/+N3fhKY
         opbMVm1muoqUDhClsr/I/lQZhROKExOjYrkNsW5xZVrpFlhnHLHvEXbbgz2Q1DXHrDYL
         FCHXYcaxMpYw1p2un9nqmprx8TuLrX1dxj2gVQpSqFuycc3mkveY8T21R1eMbpzs+06o
         jU51q0cqFJQylk72kxgcIDs3s6FjFkJwWV1Ce20vlsEu/gnrvKQiOHbPBwCYjiwSff/h
         QNwMM3QWHt8MkGCBRj5gsGZFckGAUaojKJsi6moQP1Vr5YLUd0q5zb1w4xI6dW476ffl
         eanQ==
X-Forwarded-Encrypted: i=1; AKwUvByl5cSOrYkanFfC52EGuxDLvFrtw9hjLIBc4XYV6GS19JuMTfviTKe9hhLmzwA6AXHboX0QsLqWqGUQ/ag=@vger.kernel.org
X-Gm-Message-State: AFuF++lRrWGi8Ywq+TXxLHfC77/lMi0oPq45gXypfYJrfcB2t8+5Ukat
	zEGt5O0YzufiH7nKJ2QTx3fmnQqtq6pGH2r7lFijNsgKsi0l7I7L2dyEUejPlF0yE7U=
X-Gm-Gg: AYBFou1mKT67XNCTelfGheg/6pZdhwBm4hwbQSbq03NM/69zOsgpUTNTgj5zh3iqg29
	TCRikHaoVTwJVcqz+ltkxONrytmqSXDuMdgXYgA3QkygWPT5Esj6ckG6FYzAcCuw3Jrcf7Gux6G
	0iCl4RClPcE78VG0T1YNfUBx8iB0U5jf1kA32S9ZEN+8mCEhUV9hvwb1bvSARFomirEpuzTOyMj
	/Ase+pRqT9xDb17dGdf4ofHVV88ZVBgYerpAkENvgK+Bcs6CEyAjZO1L6dxFMWFEwAh0ymdeiS1
	sYCbI4DeXEGiKHsAC7m7sJPHeM4i9iUAFKGoP+oK8bF5NtCHW3VjTQXkIjh+eiqJ7Yv7Mte3L0T
	ZLGEsTD0y/JWGRme7/DPHdCubSMxm9UPyyO3Iu1PrZ7BHJqRQFoU8Q1AOysM1ML1a9qNNdhLrEJ
	QrWtbKa+qW9Icp7EsuXKnipB/5jOS20xCgZe7taGjmZNTYRbiRHgP0MWaPUHgDRVc0+I8pSIyZW
	scmumSNZbEiMutPguSMPVs0M0JLzfcPZNawDrSC
X-Received: by 2002:a05:7022:2381:b0:144:fb31:a597 with SMTP id a92af1059eb24-16a645d3a02mr5049180c88.47.1791576893792;
        Fri, 09 Oct 2026 13:14:53 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm8275284eec.11.2026.10.09.13.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:14:53 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net 0/4] amt: fix relay tunnel keying and unauthenticated-Request DoS
Date: Fri,  9 Oct 2026 20:14:50 +0000
Message-ID: <20261009201451.1903979-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179141995124.2527009.16759719486523759711@kernel.org>
References: <179141995124.2527009.16759719486523759711@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks -- both are fair asks. Answers below; they are also reflected in
the v2 cover letter. v1 was generated against v7.1 and did not apply to
net, so this is answered against v2, which is posted against net with the
General Query patch dropped (that fix is already in net as afae89de73dd).
v2 is three patches.

How it was found
  Manual code inspection of the AMT relay path in drivers/net/amt.c, read
  against RFC 7450, with LLM assistance -- hence the Assisted-by: LLM
  trailer on patch 3/3. It was not a syzbot report or a static-analysis
  tool scan. Patch 1/3 (endpoint keying) came out of the same reading of
  amt_request_handler() and amt_update_handler() against RFC 7450 s4.2.2.

Whether it was triggered
  Found by inspection; not observed in production. These are availability
  and correctness defects, not memory-safety bugs, so there is no oops or
  stack trace to attach. The symptoms follow deterministically from the
  code the diffs change:

   - 3/3, exhaustion: amt_request_handler() allocated a tunnel before any
     validation of the source, so Relay Membership Requests from distinct
     spoofable source endpoints fill the table to max_tunnels (default
     128). Once full, further Requests are answered with ICMP_DEST_UNREACH
     to the (spoofed) source and genuine gateways are refused; re-sending
     once per amt_gmi() interval holds it full.
   - 3/3, desync: the pre-validation lookup jumped to the send path and
     overwrote an established tunnel's ->nonce/->mac, so a single spoofed
     Request carrying a known gateway's source endpoint made that
     gateway's next Membership Update fail the "Invalid MAC" check -- a
     silent one-packet denial that consumes no table slot.
   - 1/3, aliasing: address-only keying collapses two endpoints that share
     a source address (NAT, or one host using separate IPv4/IPv6 ports per
     RFC 7450 s4.2.2) onto one tunnel; the later Request wins and the
     earlier gateway silently stops receiving.

  I have not staged a live end-to-end exploit run -- the above is read
  from the code paths, not a captured trace.

Fix testing (this part is observed, not inferred)
  The three patches were applied to net and the kernel booted (arm64,
  QEMU via virtme-ng) with CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y,
  CONFIG_PROVE_RCU=y and CONFIG_DEBUG_LIST=y on top of
  tools/testing/selftests/net/config. tools/testing/selftests/net/amt.sh
  passes all six tests -- amt discovery, IPv4 and IPv6 multicast
  forwarding, and both IPv4/IPv6 traffic-forwarding torture cases all
  report [ OK ] -- with no KASAN, lockdep or RCU reports.

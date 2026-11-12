Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499783;
	b=kUVkfbhV5PBaj0NDtUz/SdhMc0prHCNFqRETwdDl0uh3wNt9Wb54SbBgoMk8Q+bszTam
	 UIMTvhKHUpsQVeE5TYYSTGtsbPwsl/iukidr4pKTgQh/YxVVmlx2TaU0r2v3nKAPACSqp
	 n9y4YPErGuMiguDRPv42tzEx5tXGH1YQmNUDzni49171iUlaQguYEPwOL+6XvlLwQZC5x
	 zgkqGoQQ8fG7/Zvqg4qvjZFa6x+B91L7uIknHeSJYbtw3rYUg1+VPliNVg5zKTBBqdQDD
	 dyeDXh5iKqIyZj4E6x1aV7Zve/o1XkrahmH5dar01RsSEMOoSDQ93ZXoNzIuc5gCdcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=N0ZJsqzR/c1fZDYFNq43Ai9ghBTFqYNHBo+RKWJmWtA=;
	b=u7Dt3lMIFfRzqK50R9cgcr8FMpaLEclFBYw6aLq5tu2zIfPH8gDA5TSNDDFE0MUhrPLD
	 LTPTbEw0pqg/JqXiB46MhEgvYVDWjDhuzgOx2wU3VFwJyiPbSovFejV4CUSHvtmdjTC06
	 QvuFq19asKMsLe+eGh0YPeohoLubmMOjf5Dos3eHsE5tNcbw5SXt2y1RVMcX0Owd43efr
	 bLggpsB9hQg6hEuVaO9r6z75JLNN58SB++WLvv8zMmWFb844PwuNmB8Svv9FTtzZwCxEL
	 j9VBqqDmXlaMz0sFJri/c1dPTYZYl7QY1w4fzk57Dmi569x1ZjaGH6sc3HFJ40R2ZwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkqPvzgK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB50A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkqPvzgK
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfc004920so36664951fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499781; cv=none;
        d=google.com; s=arc-20260327;
        b=IayA5EWynD6+QeGzLfAuixaR0NgKQkk4OrQSR5w8ezMBAeMKBaEilpMiuo2xMAkvfA
         BucxKbteiKoA3QlPMlzrOBaGNzqOCs3vSGqswL+cg05swDrWWK+oCZ86y1BUMxOOr0hJ
         r1YsjIq3awkLvQARTZ1sQmuBT4wiUx90XOIr+RnxIFIwI0+GbI5GLF7BFSr9kRVd5Fnz
         1TrpGUiiSNBD27o+kHCi90KrXgfcPnyByZMk8M3u1s66BVIitA2eq6Wasd1Wfo0iYfOe
         8oX/QXDXSFptDGTSBRtxepkEs33GMu4fTKYFYhIJpMdpLgzc20U7T2hAPU7TwaVspO9f
         cy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N0ZJsqzR/c1fZDYFNq43Ai9ghBTFqYNHBo+RKWJmWtA=;
        fh=frPVe+T0vaYQxR2uGkj+SE8Ok8KFwT9xwoOIYFXRfk8=;
        b=EtYj2/LJJkhXjJ93ZwSBq0TU/BubANwv8y19SmfAdHFKKzORW9oGDR00OdLQje9yyR
         5vzHvnWVSa5U+TjnU0qHhKFbkNLo//mFznBAsznjNTW3U2fbhdljlDx3v2m4x2+VJN/j
         WaF64Ju0DIfGuLhDqG75b/jorbsONi/CC1v6jHd1GNMMD01mnS7l/ABPqGDBKQhyZCAh
         NZ2VUn68oFSCv0S31g1s6bT1tiCXa+9liO/qxpz/g+0gS8QbgPw4NVyRt3GfkzP8oILx
         lEkkeJ9y+1lhUoAp+mD/pULjdZ5+KLfrJG37aU3R25XXzUzU5KIwDcMWaNQov+aqls/e
         rABw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499781; x=1795104581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0ZJsqzR/c1fZDYFNq43Ai9ghBTFqYNHBo+RKWJmWtA=;
        b=HkqPvzgKP+XCUjGb45k5wH4PkzaSBqWf6dBWgk0ZPwgu5mjatfBJgkb/nRdfPtnvnk
         WQukZc9APT4+HCR/O2epMXl0JnrGpDgUu5N8LlceEMG0F3w2EzV92AB0m/Rt2YdHYK1m
         fegfo+zKJcpIXvlg2wZBNp2dtyCZaj0FygWez2KxNgsrl2BhZB60F5mRoshL+ddafpJH
         Tu8cZz42LUNEEWud1TRxhMAs5VWIV2aROSCwzvyeJJ7FH2o1AhyfIuwXviocNoyuing7
         GEoJ6L9RhBx84Vpo6/qHHHvDKPFS9fKY02zbltvgytt9IEzYuUEoBek58+LA7SbFoqpk
         ++2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499781; x=1795104581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N0ZJsqzR/c1fZDYFNq43Ai9ghBTFqYNHBo+RKWJmWtA=;
        b=MoRaLbTf6/k89tPOwzHY7g3Fzn1heSRLokLgEgVm0MkIFYDhZGPoqSewi/JWGG5Uzw
         j1bwslqtLZsDXrOoz16zimm5W6D0E+YK7kyttfy8SOJvj46iwxt4JwsQ74/5astEndYQ
         9GYHET0agb+K29Qwb893Ri8FeyhEr9ArxkId8cnUimAyiquvKQMlgxZh4Pdgm5jfDs4P
         4z+A0etp6Dx5Awz1W9nwZfDpbtJk23CheQwXdFi0Ktxc0ExPDwdh2VQ/0vYu1Dpuw0mA
         B4rm4obi4qypcxOc2Kh/thQDjtRKs7QXcicjWlWgpoBU4Baj9OjPeGmjcrCV+sZXiAif
         0G1g==
X-Forwarded-Encrypted: i=1; AL+hErGxdBE2myTq1rUrcEt0jMvdpEAwum7R5ftfdBjxmtwymxjE+PHzMziy9VuVwhuKFlSgOZsByWutcUSc6oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dL6mKxKMw72eHiYS4bJHSDjJUuX7fDcXPYvQS4YUW3q9SPJw7
	kzBHGhkuq5XejLhBrMEaikbPlNhWN/i8wvW0DPHxFFME/SXcY/xeUkISjcHXqp+A3cuasYB5kAE
	sDtCH4T/NwAU60TAzZY23EvVV1HEjsGU=
X-Gm-Gg: AYBFou1E4rRW7CsQ62QtaUFKbZvkBZMrBLl7cM5pwet4qSZuoxrn+N71ZSiY2b3Frn/
	3v/odAiN6VL7DGI60+yBAE9Rp8gyKBB4h19Tmqxt7oJbNhpnPMPglBDUmqpjoQ1vfY4VVP0O91n
	22pfFgazNUfybvxwOUTl8vpFyDB0RhRXtLoBHuKa+Bssv/7EodbfMSY3j9fl3i0+rxpai1JUbIU
	qCUgAgeQvClgBSY91bbnFG8Q4yS6FT5G/1K5VzQ/SnMCCRIbcZd3kow5+4bRqfX0L1dWbBpkKcc
	FpbkQ+MH+yxewC/YEb4r2XrNJ4REBdUvmFzGVXO3U74UOf+U10iitRlSyng7dGVS2JE9qF9GNfR
	DFj6i/u+Ey6ilnrxR9qXiGRhiRfgzh+yttbc95abfjDpMr5bYcNhcFRUHC59nh1tl3iFQJij1A/
	W7guoJVoRWWmC5cFB4gHR/JCGpI9Q=
X-Received: by 2002:a05:651c:a16f:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3ae2b49f24emr231381fa.5.1794499780672; Thu, 12 Nov 2026
 08:09:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202608191340.98574fe2-lkp@intel.com> <4h7zrdfpu3ailx5ajkyqohmcfuxgrk3tn7i7n3dkp3ksy5xehk@xqg5j6pqzocv>
 <179361623876.3.16264907931792312619.redis-ibpb-report@gmail.com>
 <99b9d530-d962-4739-8f6e-83ee5c0e18a2@intel.com> <CANGjgdkmNTRUNebXcUVnmXfx=ofCTmioGw10jZsGfbShG5e1mA@mail.gmail.com>
In-Reply-To: <CANGjgdkmNTRUNebXcUVnmXfx=ofCTmioGw10jZsGfbShG5e1mA@mail.gmail.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Fri, 13 Nov 2026 00:09:28 +0800
X-Gm-Features: AclHuK90H13AfC2kajknsWwbrMWddUrDNgqH8Fzf8YrLwLCTFOXpslvkhInORC8
Message-ID: <CANGjgdmcVPwq0+1ch6wO4_j4iaiyQEp1p90yYg=i5LMyNS9k9g@mail.gmail.com>
Subject: Re: [linus:master] [x86/bugs] a3af84b0fa: stress-ng.seccomp.ops_per_sec
 95.7% regression
To: Dave Hansen <dave.hansen@intel.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Pawan,

Following up on the Redis result, libMicro 0.4.3 [1] provides a smaller
reproducer: single-threaded loopback TCP. In an unmodified
parent / a3af84b0fa00 / parent comparison, native time/op increased
29.84% for 1 byte and 28.76% for 4 KiB. Each condition had nine
unprofiled runs per boot; the TCP baselines differed by less than 0.10%.
The pipe control was essentially unchanged.

To exclude kernel code changes, the following diagnostics used three
boots of the same unmodified parent, 96cce16e26dd, on the i7-12700KF
(microcode 0x3e). Using the per-CPU helpers attached to the original
report, the pre-test sequence was sham / protection trigger / sham.
All helpers exited before testing; the benchmark did not inherit their
speculation-control setting. The test cgroup was restricted to CPU2,
one P-core.

Inside that cgroup, the original 30-second command was:

  ./pipe -E -C 0 -D 30000 -B 10000 -L -S -W \
      -N pipe_tst1 -s 1 -x tcp -m st

Despite the executable name, -x tcp selects TCP. Each operation writes
then reads one byte; connection setup is outside the native timed loop.
The control uses -x pipe instead.

These are means of three separate counter runs per boot. Per-operation
values divide each run's totals by all completed TCP operations,
including executed batches excluded by libMicro's timing statistics.
CPU time and counters cover the whole test cgroup, including setup,
cleanup and wrapper overhead, not just the TCP loop; instructions
include user and kernel execution.

                                 Sham A       Trigger       Sham B
  Cgroup CPU time, us/TCP op     1.68762       2.19800      1.68571
  Cycles/op                     8233.34      10728.11      8225.14
  Instructions/op              20291.04      20243.49     20307.35
  Kernel near returns/op        442.537       442.379      442.556
  Kernel return miss rate         0.471%       13.111%       0.454%

Relative to the two sham means, CPU time/op increased 30.32%, while
instructions/op changed by -0.27%. Pipe CPU time/op changed by -0.18%.

Separate branch-stack samples showed mispredicted returns at
__do_softirq(), net_rx_action() and __dev_queue_xmit() after the trigger;
both sham boots sampled the same return source/target pairs as correctly
predicted. The samples identify locations; the 13.11% rate comes from
event counts, not sample proportions. This supports a return-prediction
cost, but does not explain all extra cycles or its persistence after
the helpers exit.

Would this smaller reproducer and these counters help investigate the
persistent effect?

Thanks,
Chengfeng

[1] https://github.com/gormanm/libMicro/tree/976d502afaa2d9b919564d7fa8a08fec286dfc89

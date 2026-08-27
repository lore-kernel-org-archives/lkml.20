Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245AA31E832
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874922; cv=none; b=FtPMlggDi0MRGYZez5mwh1R5KbB4E+kltL4OjBnguKOXoJ/Rg1tD1t22bJwysKbhBfL+jyyYs4wjKyU4KaOC255OKcIwyCcvou2YZXLJJDnPGXanROtId51HResC/n8B42g6MvSkWoVvYfnZDO+TuC45O2nRWpNPHfYVhEovNBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874922; c=relaxed/simple;
	bh=h27YVKK/TYuusXE6taFKqIAn5VyxSn/kotJtG8PpEoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INceA9IFYoCCgTLBPPxLTTNnU19ckBtwlf+TBXpeU39NNfSvQHAVwRmY09I0N3KFKY3ELaFzINmGiYbDh4jsggq7Fsf+m7FQJG6ib0LcfisAPQ2RKT9acEy1hyUiY6bKp8EghHae8VbgXjSLg7d354Nq/5heUvqgqBKAXkEm1qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0NYHgL+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0NYHgL+"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8549a96e93cso1630947b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787874918; x=1788479718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCfWHkIpmLvJEZNt0kO4ZWyCArHHxMdSOeCJ5Kkvn7k=;
        b=N0NYHgL+c2r3z30Z0QHNoJkQQMqA+eBAyGLHu+gyXUdWzKcKqVzTQYFzzOu0U92lJ5
         +A1bqI4umyXYLfErtoaJr+358x5yyFqGrAdxPwnq1ZYs0JDnO/oWTF6/a4oxIiwvwb2M
         qpn1MLSiEgLeOoCrNq35bMpsUBT5gzQQwd8uNTRqqYG2YdThnjdFopDZEy8/1hcW5bu6
         34UDwTAFSMrH5DSdu74Lk0g4ZvQ+bd5MkGdKrYr0dx2KtaQOfuEmAFN6l0w9b1AVdF6W
         Km7RcGBgrOV9VUEC4QhXWSITtaRc4+lkXnxH6xvvC0heRsk6wMbiXrzdT00isYdcmY7G
         8XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874918; x=1788479718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCfWHkIpmLvJEZNt0kO4ZWyCArHHxMdSOeCJ5Kkvn7k=;
        b=jCvOSOPLWI7WpsjcSelGY+l+E0ZUoZ7dDDUpFm/SnVgt7z1sPtXEhRBkDmtswVfzYt
         WBlLxGVL9JOYomR+KH30UFMxTR8SIwSEus0/ifo2Q0Oik2CUIh1JLkl9GPI/8BHHVxTy
         tbRELR4FAdbs9l8X5OH6cDhJvif3H40pV3q6mV2lDYEqjGlq0DIbWWGSIj2nf1pz4ru1
         L5F926lNpLt3qjU59fdN+ZqLFPRcilo6cayqnyoOPk+Z5YLzJp7UWTEMBHrJLDJ1CWgx
         TnzM9yNx1jqi2mCma/pW9LBAfXMzTaKm9MMlLjonf/FusKh21A+ZU7xLipvw2b7CN/uK
         QhWA==
X-Forwarded-Encrypted: i=1; AHgh+RoWbVmMGKjD++Uz++cjl/JVZtpcpYTKqPa0v5pJ3gOXNFersdE9A39MjYA8AYLKV/VjMlaizVRWpwr1xUw=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqttl8Vmj+9zO4aDZCbY58Ybx3NU1CGemX3Im8ZB/m0mGPn+p
	EEvF7OmIaEBTLgzLVOaZSgv6K6+40WOTPuuI/KhlkLo3flka51Z23vcL
X-Gm-Gg: AR+sD12ba2jRCzC4ghQUX6kpcFtJJh2Q38hWUqCCCs3cpn/YEE/suKV+41vLvPCKWP+
	elcIoDxIPpAzEZGAemeU4euDsNWmXsYNy7N9K1kgO4o9boDxOX72oPPGiTPyDruB+RTwA7Na5k4
	7kUe9vPZ9o1rw9vsLZQjNSCY0HrgXRarCRW9sGeakX5Y+mmAuMT+ICzg9bhuh4qA20p3qIN8CN+
	AEF14UOIMqHa5c82/WGCTl/DYOXeoxhskqmADOzsw0IFZrQ4UPc5LXeiHzwY9sd1XjC6qejGf9T
	dEw7/q3xlvu/0WBoBDYIpPkSqIZoiN1d2hyO4cD9f9+kU0CqwTgtBgzx5HrvjHeeCkzD2hi8eoc
	5Wng0Oj7NK6jLS3L6dTK2KknrctGxdGEcz9q6IMi2BiScH/MQ0eWAWmUXdt9MhTsvM4kVzOuZz2
	cM5nuhDldh5+4VVcuM6MeDKeHPwspmRDOzKuGvo6GL35zrNQWY3OYaB+I7xwP64vJo/WU=
X-Received: by 2002:a05:690e:428b:10b0:66c:d353:948a with SMTP id 956f58d0204a3-66e4c7645d8mr742101d50.39.1787874913018;
        Thu, 27 Aug 2026 16:55:13 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4eb3dcdbsm55704d50.4.2026.08.27.16.55.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 16:55:12 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: edumazet@google.com,
	ncardwell@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: kuniyu@google.com,
	horms@kernel.org,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	yhs@fb.com,
	kafai@fb.com,
	andriin@fb.com,
	ast@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	xmei5@asu.edu,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com
Subject: [PATCH net v3 0/2] tcp: fix use-after-free in do_tcp_getsockopt()
Date: Thu, 27 Aug 2026 19:55:09 -0400
Message-ID: <cover.1787870710.git.blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>

do_tcp_getsockopt() has two lockless reads of icsk_ca_ops. Since BPF
struct_ops congestion control made icsk_ca_ops point to dynamically
allocated memory, a concurrent setsockopt(TCP_CONGESTION) can replace
the pointer and free the old object while either reader is using it.

Patch 1 fixes the TCP_CONGESTION path by copying ca_ops->name to a
stack buffer while holding rcu_read_lock(). It also uses READ_ONCE()
for the lockless load and annotates the relevant icsk_ca_ops stores
with WRITE_ONCE().

Patch 2 fixes the TCP_CC_INFO path by keeping the READ_ONCE() load,
ca_ops->get_info lookup, and call inside an RCU read-side critical
section.

Changes since v2 [1]:
- Fix the TCP_CONGESTION build failure by loading icsk_ca_ops inline.
- Drop the unrelated WRITE_ONCE() conversion in mptcp_ca_reset().
- Add READ_ONCE() to dctcp_get_info()'s icsk_ca_ops comparison.

Changes in v2 [2]:
- Add READ_ONCE() to both lockless icsk_ca_ops loads.
- Add WRITE_ONCE() to all six explicit icsk_ca_ops stores.
- Include the data-race annotations in the UAF series as requested
  by Eric Dumazet [3].

[1] https://lore.kernel.org/all/20260826171344.4133-1-blbllhy@gmail.com/
[2] https://lore.kernel.org/all/20260821182449.79785-1-blbllhy@gmail.com/
[3] https://lore.kernel.org/all/CANn89iKr1ypEFeL+7te3xWoNaK5AFyYQmr+pDh2zSZAxfgNKjw@mail.gmail.com/

Cen Zhang (Microsoft Security FORGE Labs) (2):
  tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
  tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)

 net/ipv4/tcp.c           | 18 ++++++++++++++----
 net/ipv4/tcp_cong.c      |  4 ++--
 net/ipv4/tcp_dctcp.c     |  4 ++--
 net/ipv4/tcp_minisocks.c |  2 +-
 net/ipv4/tcp_output.c    |  2 +-
 5 files changed, 20 insertions(+), 10 deletions(-)


base-commit: a3dee9bb902ee4357fa02e49b415d7724ee0140a
-- 
2.43.0

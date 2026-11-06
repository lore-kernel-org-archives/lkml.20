Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985287;
	b=xKC+nsP+uktiVLIaVWk1ojJ3RbBUa5e01YixpeR5Pe2SSvJ7rUfDeQT1Pr/LPRfa50P4
	 +Me6mPPYDFvJuLKQDe2WlmeEwvs/6XgZeDLoSivJfzZW8PhrWtvgQoSgzboxBgrx3Tw3d
	 o0IDJNyDL0Kg9dsqFggs5yGV99nFPJTVqLPq39VOfEwga90KLZoiv+kSeHcEr3QXYJMEh
	 Hj7zEQnLm33YteZwHJgUoc3DVdVlT16dbrEQJ9Mg5OaxIAyGFJOi8B3aUZmNdfj46YP5+
	 RdyKWcH512eKGNlYOqRQ6bHRWvVCPPrAaxdXsfOTJnrm1SC1pyiZlYWRUG6sJJwWh1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
	b=5KVUoXnIzUxe2fju+Z1IKLSwTXYFnaum+tGoxTAsXVDGsdZtHFSrkVmqETS7vf+hZDmV
	 F49UKoEq5ZS1YJsLD1UDsmnbybsaBMo+9K5XxKXfaRVZvcDUpfX1Erc6l51mxBhMUWY6/
	 u1w44SDXKL5cd06IzXSr5xRtwCFKO5N7cppLq7wLZ91hgYzzikrzxe99R2llUmudOfD/u
	 785FGG11lje0uIuedgqWewvmqyQ8PAeId6k7cB6+gY5332Ny2cWK27tsBgmJlOB3I4XhM
	 2weHj+OvgaBXEb7jtJnWi6KrwRCRgXjBK0usiCG+lF0SUMwpkzBaUuOtGY9uDni1GYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3qjFtiv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CB606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3qjFtiv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6394915e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985284; x=1794590084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
        b=C3qjFtivHTMqEpliOCOxxhF3ZCmOfyL04GUMc2el0XChisOndRclY0s4aMkvcrDWyI
         kPwgN4eUdVa374BsKE1zgaukiYia5UH7uePCYZjv2O6G8Gsi1epwGY64np2/ZquImhLE
         XVwomB8LtcMWnRbJHU2+L4eVPpIiI8g26WX/E3TgUinuWNK5HyUP4GFXTIJZDDQ9LhLx
         6Q8Q2XaM3PF7Xk/Wj2LrNKzCZrAf8OOQRciKrcnbXyGUV37SkBAHaprRDt4Or6dwPwGA
         28vfQbxjxdhaKLGSDLJKEsi9r9IQrCJ0cRk8kZTLt0vyEUabmVsPBcdGGxWkScwMyDfu
         oG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985284; x=1794590084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
        b=LM+4BaieokRZIK84/E9yFWH8b8xnWpgUEfVpY6regY+X8Ayyun5DXlLSxB03mEjwiS
         FuRx8vo9/ploDXW2yL44opVM4Dx9DoeyjpgvPnQt85epET9eyr5rcgatMeXaR6IkSQkz
         mSCCQT3LMpQdsWYHgvOCF31W8ocBiLImG/VA/lIHfdXIA/K/WFD1jEvjjv9CAwXxKO4L
         gxIDhAvIMGZkVIoVmXtMAWQkBzFbc8RFckROZZ1FDhyfwEaOEZ5hrHkaT+F9AeBhTsZk
         BiBgrD6dfeOFxWUZdPUKNLTS4kg+YWcjrg2RIEyMqMx0VKR4Qmozajfzrerga9FVy/tW
         9zjg==
X-Forwarded-Encrypted: i=1; AKwUvBypxGmfgpFeiC7PeQYxyBprnWNpu1CRy0nTEqIj3QmjJV1Mpa6XcnYj+rjd1tYAuEjt8abflKkI2JRMhyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XK9S2kj54M+aI5sX7aYk/5HJCBhv2oRF7ybgTBzxZTgxcVhTX
	A75NI4P0ZEXEGhsk7HwpHBs2MesLPSZT6yYBjEA/SgweO4AJ2bqIhbQQ
X-Gm-Gg: AYBFou1jjKFumJRXZNU8lx6BZC8EbHHx4bBy8Cu7EPn3DTjsr248B/aAKJWxwImGC5B
	GmIK+vzHVnZQOa022QkRM3YRkjCmiOR7wR1UL36ubKYDkcaR7I3bMYI+gi+iU+TmimFsejk5IeE
	wqQY7YL54EdtkJuzWWoaGF5yuKXDEIKsTe3tyc+ozWSljc/Au/nsRlvPPx+sO+XYDE9VWpuxidY
	pPVWMYVfyTQECRDwJavh6AO0W+iUKybBvMNjlEtEwdXXcQDVn6Z7cfLwFYT5MPMY/bwHUPTJrgJ
	rELs3ditU000C064aPf+c2i0meu8gI3eiXLCPpTwTa4kmBAcGQ7o7A+XWQE5JA4vBWLyjGHxHqe
	1CHJJyIe+jhZ8MHAgOSXKoqzWAdCsy7H4QadpwAEunoBhCVCFweJ16NCbzQLb8fYrvK8gGMlIGh
	jVGMPQD2+G1GRo7MPQF4q/Exx/Hgl0w+doEAbn/qHF/eIOl5t1dDkgBr/v7s4kwtPIVGvdmqvEF
	gwkyzTQbi3JYjRQuCG4Tfq1fko7BGOU9jZrQWSaQ8Q1rrPY8sW+BkOs/IEgB4T7EJBUZif5LupW
	8jsde34GZrO40mZQAlbK/B1mTSo/c7PVehVyhkTJjW4vU0sI23zoVy9zJS0S7e/SkNvOTaFe/cC
	9hFIe40w8G5P2PV1CwAiCTCM+4ZrIbRsPY7niFxBgy+D3QjEIAF05UVt5Pey5FQLTxdCLWa0bNi
	OHrfTTLLy1SLHeRgKldASkFHUZHWdS7STWu/fQVT4535XrL+BUmLk5cGkXEuIHOw==
X-Received: by 2002:a05:600c:5391:b0:4b1:4da2:ca99 with SMTP id 5b1f17b1804b1-4b6dd82a9aamr53584665e9.10.1793985284502;
        Fri, 06 Nov 2026 09:14:44 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:44 -0800 (PST)
From: Florin Badita-Nistor <baditaflorin@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/2] tcp: fix false exhaustion of odd-sized bind port ranges
Date: Fri,  6 Nov 2026 19:14:40 +0200
Message-ID: <20261106171442.31811-1-baditaflorin@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Fix false bind() exhaustion when an odd-sized local port range still
contains an eligible free port. The wrap can flip parity in odd-sized
ranges; even-sized scan sequences are unchanged. The namespace-wide
connect() allocator is not changed by this series.

Earlier x86-64 KVM validation of this unchanged allocator/test code:
- Regression test: four failures before, zero after (eight cases).
- Full port-range suite: four failures before, zero after (80 cases);
  two existing SCTP XPASS results unchanged.
- Go net.Listen, 100 attempts per IP version: 100 failures before,
  zero after; explicit free-port controls succeed in both kernels.

Changes in v2:
- Target net-next and drop the stable Cc, as requested by Eric.
- Document parity changes on odd wraps and scope the fix to bind().
- Shorten the cover letter.

v1: https://lore.kernel.org/netdev/CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com/

Florin Badita-Nistor (2):
  tcp: avoid false bind exhaustion with odd-sized port ranges
  selftests/net: cover odd-sized local port ranges with one free port

 net/ipv4/inet_connection_sock.c               |  2 -
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)


base-commit: bb67589c87249c9bc2415ab11a754d6e303774e3
-- 
2.51.0


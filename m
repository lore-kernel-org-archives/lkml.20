Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673891;
	b=aG5M+LmK4qbuAfWr0fk/uPAWyCYzwq5jbo9OViCUMKJZnB3j4NbrXqmsBYPSI1tWqRly
	 H1G1AbZIg5Ob0e/pPsTPqf1PJP7KhzCvRDSPonCwZJwM4bhvYO4raFDMMKvLBW26x6xvZ
	 YhnCJaIRCAGSUizKsrRYYG6uHZJZsFXwbkTxx5WyWRituvLun0s1yb8Fx7ExGgMFgHsEp
	 5JbnA3eVLslTCdsXNBJm3JyXMtzNVk2Aa9ntlG+TTQXC71WeEAEHWEC98mgKhTBOqOx+M
	 0Vqh54n+hzuu1fme2NCzckDUS74HSiu8ztXTP6uzyDqHhWt66lPalInlWGOZjsCZcXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
	b=j6uoQVHr35cR2ihXPAEKw4gyNqnkgUaoslUOsjoKIdWCZEXTZbSnR40BdfPgn313s77X
	 BYgp8FshCN6lu0F2s+krxuznjWId+MU8Fc69thDnwrdVOnr10viJ7dCXBvWrPHL7YpqQN
	 9sS9sT5GYDk0x2ZLQdjXM3/haoX8RIbc95K6apaoZQHNIm9E6aioO/zpYNc2994zFDSBJ
	 xjJMJDQ+edMxCG5uKgTBlDFj/BESYmiBH8U6C2UGIL4piEb8Y4624WrVIMY5Kfsi620Jg
	 3ZEIozdIZ+cIRVZyvefEyPvfkilCf0ja3BcPePYM3Q2I8OKPIivnnLCbfpQh9HSKxZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xv8dAoIq;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B99606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xv8dAoIq
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1013961f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673889; x=1795278689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
        b=xv8dAoIqJM+WMgYNEbWohtk2WvvWf6xcL8KwFxTycDvU6dCf8J+l6J7pUdw+kGxf0/
         F7/TvbL5tcs8WAg7l/fr8uLAk0088fc9hRhSAWPZ/e9NRx7izIu7AVZmBWyuWg3JkEgQ
         zO7kDbCgouQ3md8N+xoogWc1tgfDPhDxkzn84yHHRvlYz+LFKoT0S1dVqzK8i1Yi7efW
         Deo+zezanEta8BmQiSoz/MLov/AsSeRH68QwpI5RTZDp78ejGsltbQ+QMwSiTSq9CGN8
         QXfv4mQBLichr7ay7dZgVxJ6CX6X3KZpFf51uyP5M68YqqfXSqxJyieqRJB6rmDCxye5
         bnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673889; x=1795278689;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
        b=uL2vD47ycvRaS7zI+oJKWuus3SdO2W87a7wk+Slx09d8rjdKTHD4s/nwqbUKQ0SFfN
         0KW9ApMNOMOKmVV8bCif4nDJnTvzMXiKXI/GZnFaWJnx2kYy713TuxnI9ZvSjfnftJ0M
         ScoXaJZTdNzxBjDTsFqM+p39IzJo2yQKrOun26Y8cUo0416V2Kq5Ub10tqpVzhWsDfWY
         fqVBGVHWq5xKOQaeqUJFd6VC5VpKLbYfEhDcM4W5cXM6UMYvCYcLk7feAvmkniemorsV
         jBoFgyHqDRZOmTu603wqqs38kaNWxGhHUwNG7pPRj6adhAHewBMF5yvOL71nuZ4WZp5Q
         qlHg==
X-Forwarded-Encrypted: i=1; AL+hErE1ou4uCRAZVcyHShP6Rq3pw9QRpZLdJ/Ej9dP8c8NtaIc0cfs5GESeUcYSdzaoPTD7bN0o0DbqMi2S2WI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V6Mls/GYREHKMLvOllreoUbxvXyL5ZC1bWLT9ZRBIuT/TySlA
	ZpTQ2iZ1SC+I6TQAXAR7fS5TnyGlph8CjOE/dj640oH5JoJNiJaJ/3EY
X-Gm-Gg: AYBFou2m+wpiar989KBQotZfQpFYww0QV9zuHg/yFe/B5rZ1mOKXIaNBtqpBZK2ekQt
	av7zgHw+ZCYpzgMHzSmPTGQ2JhGZ0DgMT2ZmX7t1KrMAyd9ziHOl/cgQgRPMV4lURBYcZF7SA7P
	MyspnzqdGGHu2P35sayKORoRqRzPymF/b5UwfYf7wtmcfnH4YoczYjpP0uMVvC99pLn5mpyuxR4
	MlR4cDr5fVyjWPS2M7ymdSwnT79f7KhaBKoZ3YTBmaARRS3g5Ka5NHic44/Bzs/uEcppoOkjK4L
	OhhATBQJedwrBbNPRvNN9h8HTEmgN7quo2bAu1SHP73W3DSzsPe+LbHQ/l7lWs7U9fnNQEBSa2M
	vXscxT830m5uWCo0YeN2vZB3rt87MevJQJZO1spnK95ll2kpQ8luQMS2Yz5bdUYEWDe4FJmQjbe
	ElgQDmojEeeiU3EDXaMueeI4hYI5gVvYf6fBwneuU25XUUqTxj27II/n0/1hD+pUNu1FWamYVJ7
	v26OaFwOoCb3yMBL2MY3l/wuuXjsgzMbcQv0HOFutlhe6na2qNwUbrP+X1wcen0SENRTcbN8ksI
	E1WdBgfmIsZpcifvgoqigCAOcA==
X-Received: by 2002:adf:e00e:0:20b0:486:f907:ebec with SMTP id ffacd0b85a97d-49c73ce4f45mr10000926f8f.31.1794673889109;
        Sat, 14 Nov 2026 08:31:29 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm11633347f8f.49.2026.11.14.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:31:28 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hoang Huu Le <hoang.h.le@dektech.com.au>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] tipc: fix rc_dests counter corruption on reinit
Date: Sat, 14 Nov 2026 19:29:49 +0300
Message-ID: <20261114163113.208769-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tipc_named_reinit() unconditionally resets rc_dests to zero while
re-initializing local publications. However, node-up events may
already have incremented rc_dests for peers without
TIPC_NAMED_BCAST capability before network finalization.

The reset discards these counts. When such peers later disconnect,
tipc_publ_notify() decrements the already-zero u32 counter, wrapping
it to UINT32_MAX and permanently forcing replicast distribution.

Remove the unnecessary rc_dests reset from tipc_named_reinit(),
which only updates local publication addresses and has no reason to
touch the remote peer counter.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: cad2929dc432 ("tipc: update a binding service via broadcast")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/tipc/name_distr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index ba4f4906e13b..1dfe8475a75d 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -415,6 +415,5 @@ void tipc_named_reinit(struct net *net)
 		p->sk.node = self;
 	list_for_each_entry_rcu(p, &nt->cluster_scope, binding_node)
 		p->sk.node = self;
-	nt->rc_dests = 0;
 	spin_unlock_bh(&tn->nametbl_lock);
 }
--
2.56.0


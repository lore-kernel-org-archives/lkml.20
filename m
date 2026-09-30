Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD692457E5F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763949; cv=none; b=V/Ebk2JAuA7P0p+lfztutjEe+jKseyGH7H8ljU7ZxWL4IA0ValnHebKsyoOaPysGNET69wUXwDzh51VdDAsIS620052tZIKhz9c1hThhbGlFDGVIKhyAeLJs2weemMgp2BV6R2mfNtOCCL7ky9YaPfy5FJ04RpOvOMpKi32r1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763949; c=relaxed/simple;
	bh=hH5GbE55CSs2nJnev1QSPeNra/ptba/PSPKYUPF6Sug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dY4DNwVc1krVqVjcoDBQ1EaQPelbzGD3GLHgfNvkYjplrvDsTF896HDFTzwt8AjD0PSfCCvRWr49My8CF3QQeYWXEQb2Ac7UhEI3h+FqQqB2cgErXcIdObNVQUaeExSCPJht8/yam8POOFo4SGQjJ8v/xzEQXfTRRUZcbiOKsts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaUBVnl3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaUBVnl3"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so24910975ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763947; x=1791368747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUUeR6/D1C/VDSF27VbMj7LMwknPp14YcDGjPauG910=;
        b=VaUBVnl3OnnpPgM5yjWaLSvbwBmisJqmN3UJ8gAmGMgm6Kc+jvIFmLv5Svi3F3wBV1
         4goONJs9uliNcf0pWZ+dKAv/oMcaBswjHvBEBvBAuLEXFDoPJdCX9AFGtJWhjxpzT5tM
         xVRdY59W2sBOmt/eBrhCnM1taKThw1vUhn3mEpUyzuEQkbyQZyKHqNUn5ye/AsU5Ysy0
         hjpzcQMPdpkCu5l0c7RxuZxUvAqS3B9thLDBNW/gRPKUkl+edGaziPgnXagCIXQor7lL
         P766Lc47rBd+niojPvNxx3wkARZtL4vT4PMerIa4w1NUPe2SqS3xvWWm/cWG7hAI5KY1
         KL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763947; x=1791368747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUUeR6/D1C/VDSF27VbMj7LMwknPp14YcDGjPauG910=;
        b=CQvpX+68FZHJmaXeNVzG0f5EzyMZ4MWn8gup1a6MVoClazbPqvIjM3MHQzbmB0PmlF
         gvYheSQzmL1iYXkUg6XVwToUzlQRB6agUop6EGbqgZZh+NJk0q84IkeD0Z/G4o91iD39
         580WLk1SULq9BYmR+HMWkzktsxb5RbdEo9PfXgJit8KU0Oy/2vtVV85zqfdh5ls48XGR
         jF0+1ZSTtdu+y7j3qiESDSOjizy040JPbvey/l87LzBm0Y1H52JRU70qChXdi9tVxVU0
         /d/ZxZ4YO0O6QnjschfMZLOI7IPMfckLo5PFPMZvqFYfcvQRG4mbF9C++FgvEfhMD4cX
         mXWQ==
X-Forwarded-Encrypted: i=1; AKwUvByfkOfud+aszhvAZI6dKFzn3Xjy4Vgdv8Kk3btXjqgJos70V0vBxnx9wxiFmUiNTQfRUiXfh/XKe3+SX/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYITLDPjSWAGec79jPylIgsRyiFVgqaD8UFXXX/A/rNbRTT8ZC8e
	7MlyF6//QEyEojxfBIXv4j9YSW1kKCnBLHkz+cqLDTivhooEjZmN8ppf
X-Gm-Gg: AYBFou3YD0OWQMGBxPPIouBEkzOg2tTfGG34F+lK7g56WuNgNaedCXbNZLDP98ojvLL
	7Z2Yer6ErTSQtWqRk9dgOGwrFMgPLxmvU+MwCoTE2+ApNDrSqSljkC4HVJpqL1yruPVOVh/imi8
	Ef/nuYq3wZP8NsI/q4SqcOPrWDarb6CrwvfuQo9caQx8rh1SNJ4dFXy+oa1PG4S5QffJ2v52RUd
	bYzsUvOZceDQHXjHZpc7u4RHn5lFr0N7j6Gp2cnMG3oZEV9NdsI1d4JrMqzB+0KU1LWapZwzTDm
	VEweFjuXzhghWGMl9Eq0HXRnR07PiMaWMF+8sZbd+XB93sNufpxxIylDMKK65TRg8zY8nPfrGNd
	YYyYVczPePE2n8puhBFnEfFKSk3W63Q/fUERIcFPH4hNZVOmW76Xv5SoCCM6CkGtuyved/9Um1g
	NnD4BUyuNKQ+IfYc3RdSWDK5gaTR5S0DTriUDqnnw8WsCpIgKNsOZFXQY6/z5nlCWCHXJNFFbjI
	tR/ByEGU2M=
X-Received: by 2002:a17:902:f690:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2e2e49172d2mr7560245ad.7.1790763946812;
        Wed, 30 Sep 2026 03:25:46 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1408bsm4991165ad.64.2026.09.30.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:25:46 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net] tcp: reject net_iov in zerocopy receive mapping hints
Date: Wed, 30 Sep 2026 19:25:24 +0900
Message-ID: <20260930102524.1659847-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After copying a readable prefix, receive_fallback_to_copy() asks
tcp_zerocopy_set_hint_for_skb() where page mapping can resume. If the
next skb is unreadable, find_next_mappable_frag() passes its net_iov
fragment to can_map_frag().

skb_frag_page() returns NULL for a net_iov, but can_map_frag()
dereferences it in PageCompound(). A v7.2 KASAN run on a connected TCP
socket with 64 readable bytes followed by a 4096-byte NET_IOV_DMABUF
fragment reported:

  BUG: KASAN: null-ptr-deref in can_map_frag
  tcp_zerocopy_receive -> can_map_frag
  Kernel panic - not syncing: KASAN: panic_on_warn set

The diagnostic inserted the net_iov directly because the test host has
no devmem-capable NIC. Hardware end-to-end reachability remains untested
and requires CONFIG_NET_DEVMEM plus a supported DMA-buf-bound RX queue.

Reject all net_iov fragments before skb_frag_page(). This covers both
DMABUF and IOURING net_iov types while leaving page-backed checks
unchanged. With the guard, the same queue copied the readable prefix,
returned a 4096-byte skip hint, and completed without a fault.

Fixes: 9f6b619edf2e ("net: support non paged skb frags")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Affected since v6.12-rc1; present in v7.2 and the pinned 2026-09-30
Torvalds, net, net-next and linux-next snapshots.

The existing combined fixed v7.2 build was warning-free. No isolated
kernel build was run. Tested config SHA-256:
f992c9fdb881ca95c467896791c52554719f6204cf06268cd92ac37c14c14f83

The reproducer is available privately on request and is omitted from
this public AI-assisted report.
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 562752352afe..87ef6d5cbfeb 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1908,6 +1908,8 @@ static bool can_map_frag(const skb_frag_t *frag)
 
 	if (skb_frag_size(frag) != PAGE_SIZE || skb_frag_off(frag))
 		return false;
+	if (skb_frag_is_net_iov(frag))
+		return false;
 
 	page = skb_frag_page(frag);
 

base-commit: 54518e0e827f4ca9229ae657022c60bf60f5c1bf
-- 
2.55.0


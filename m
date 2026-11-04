Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766323;
	b=dQTZc1wVVuz92DJaD1+Vh9jV5j9aAIgvxNenKQ+ITpX3yOFWhiqH0v2/F+ze9DHYhFxk
	 RxqIQxg9rICed2WGkaMX5yRlUV0xQ7rmEAhCX/47nN1VCnrj5SaYfSuMl0nZrvtCbz9aN
	 qPPaeXi98P0MNKE7DXxxyeqPxmQGcIRKXXEbUI5HPvlhFO7CxF8WOM/5Eqgvfxwqtbvvi
	 BtDeIdBMIy6coQ++vCcxEHJvi5hL8Np2kebGppoU2uFjzvegtXsXApuHY5W+slOaX6im2
	 8viPuVkE1BAFCQT2YjUPmB9AnY3kB+/LZCXgV3exEanoeZM/rfRot8yv0w2EozbPzQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nwM8x4N6OwGm5d3JlS41smna3YFF3Qf8WPcE50YA1gM=;
	b=wAZp7vkdqiis98FCUA/ufoyyBIJ5QWHOEEts4v8dVpfs7cX026RTg1Cf09/cUYJBKAdp
	 hu0cZlqwvTktTvtR2hP2jSM/iiszrX/TLJHDv0F1x7bd0hqAced4vwksPAWG3l46PvLQW
	 1uWW5iwQl1ES7x+PP3DkrsYduZf4kegQ49H8BMwgtwa2Dnjd9iPLcRfyhnkTFnpmfbzP5
	 WY4uLE2dDmtzsvf6tinzz5bnTEE6hi1qjdSEkJlgZXB2e7kNjBCD8hEDF3/Es8JSAzwXy
	 W6l52fE/bBZRVqDmxyNs/QLqovxMlnr/gnyW+RLQ57/3WAfE3XgfmYb58yJmriCvLrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FzsdmBIn;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE9606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FzsdmBIn
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so541697eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793766322; x=1794371122; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwM8x4N6OwGm5d3JlS41smna3YFF3Qf8WPcE50YA1gM=;
        b=FzsdmBInux90edJhJpuiQswfW+oH9Dv+58K93JodITszdoo0OpbPvQA/8WjpwRYUi+
         AlgEQ1dNJpa7+RjsYGw2fw2H6V/vz7UU8iQPn9Q9dha8uIZSwUk6Z3BXvRSqCYl0matZ
         4G4IlILBUJxHG1x/72criLbDryMsDp2ODl2qU1yvJVnJJNQO8+e9lzFF8m0cnnqX8YjF
         x6drfvOUZP5hWcjUHQ/k/b6GjnWvtsym85rbffdtbsKGmv8RGaNuVGu9soEwT9/sJCAu
         xsidN1jvVo6xqtQTXa1y2lq1MFiuAy5g/gTh32/pX5YdENrHk0U+GDlcDGNzXA5pG9Ly
         ZW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766322; x=1794371122;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwM8x4N6OwGm5d3JlS41smna3YFF3Qf8WPcE50YA1gM=;
        b=phlKL0SSySbgP1EYSTwf5ra53chM0azkf/2ehXzy2E8E/S03VKfeKfslm2S0YUxlpW
         wKEKLnjd11RFbMTP9jEROVgvP7iS6j4v5EBZgqaHxgTjOXLsJ3WeWHxOJf6NGTQAzKhL
         XSZat8EsOt7ZQwU+nBGJFfK1LihnzJLWuP/EZEJZ1dkZvIuqcu5ebhR8HwBkpVdEFEuQ
         1Djm9ZmEzciD2cJf8pJv29sh8UfQ4UPphCy2goLQUjpu0syZ+0LGuqaY2rxRBMtBSDQ7
         th0z40Rh/AwoPdcO9DMYJMtxJAuaLlw6WkUTH08W28qEv4vdcB3BPLvhjKtQOsBCwtFM
         0Rbg==
X-Forwarded-Encrypted: i=1; AKwUvBze2jdU9O4DihwKIAubflK7vmIn+pxPhsXDeY0tCqUuUGat/PR497/jwQbukodOYSlDi+CvwNTnLQWrJig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ndveFI0nNj6PPF+UfZaX46xg3pYf+xJFwWfmu5GKRL1FXSSiq
	8cmEohuxguv9Pyfn4lEDmXew4FnM4QTSK4d9zR29l2/w5E5qMie+Ajn/tvcDgRD7e8W4Sy74Foy
	QGIx5U2QdInlVrhiI94d4lEAXfw==
X-Received: from dybvv22.prod.google.com ([2002:a05:7300:f896:b0:358:2c8e:30e3])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-36a423bec77mr33170183eec.22.1793766322031;
 Tue, 03 Nov 2026 20:25:22 -0800 (PST)
Date: Wed,  4 Nov 2026 04:25:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104042521.3979880-1-almasrymina@google.com>
Subject: [PATCH net-next v3 0/2] net: prevent mixing incompatible memory
 providers in skbs
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Stanislav Fomichev <sdf@fomichev.me>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding).

Patch 1 fixes skb->unreadable propagation in skb_split() and skb_shift().
Patch 2 adds skb_has_net_iovs(), skb_mem_provider_compat(), and
skb_frags_can_coalesce(), and enforces provider/binding compatibility
across TX, TCP, GRO, skb_shift(), and skb_try_coalesce().

v2 -> v3:
- Drop patch 2 ('netmem: store memory provider private pointer directly
  in struct net_iov') and compare net_iov_owner(niov) (for devmem) /
  niov->desc.pp (for other net_iov providers) directly in
  skb_mem_provider_compat() (Stanislav Fomichev).
- Squash the skb_frags_can_coalesce() helper patch into its caller patch
  (Stanislav Fomichev).
- v2: https://lore.kernel.org/netdev/20261102231827.4088254-1-almasrymina@google.com/

v1 -> v2:
- Generalize the check across TX, TCP collapse, GRO, IP defrag,
  skb_shift(), and skb_try_coalesce() by storing mp_priv directly in
  struct net_iov and introducing skb_frags_can_coalesce().
- Fix skb->unreadable propagation in skb_split() and skb_shift().
- Add KUnit coverage for cross-provider and cross-binding rejection.
- v1: https://lore.kernel.org/netdev/20261008034027.1403188-1-almasrymina@google.com/

Mina Almasry (2):
  net: fix skb->unreadable propagation in skb_split() and skb_shift()
  net: prevent mixing frags from different memory providers or bindings

 include/linux/skbuff.h | 74 ++++++++++++++++++++++++++++++++++++++++++
 include/net/tcp.h      |  5 +--
 net/core/datagram.c    |  4 +--
 net/core/dev.c         | 14 +++-----
 net/core/devmem.h      | 22 +++++++++++++
 net/core/gro.c         | 16 +++------
 net/core/net_test.c    | 39 ++++++++++++++++++----
 net/core/skbuff.c      | 37 +++++++++++----------
 net/ipv4/tcp.c         |  2 +-
 net/ipv4/tcp_output.c  |  3 ++
 10 files changed, 168 insertions(+), 48 deletions(-)


base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
-- 
2.56.0.385.gac671c819a-goog


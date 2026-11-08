Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117492;
	b=EGnJPfoil0Ou+4qzjyo8YyHLxgfcwBtPc32UM9J9wDN6BPUy0gkCuEPX3rwir9jsMo1G
	 KsTLX20as+ygoGL/o/3hFf6GX9qzbvL4s1SUjlQBIZ94p90DsgbkUcRtA5K3dUKe6zP+L
	 mjXCZhelDjSjJzwTJM5DC7thPG/c9yRIGEPHJs/peKAfmf/FshSn5XtYIDKeurY/Y3zmN
	 HAuBQ5JuPsNTBHIMGMoAKuMshOAdxsgD1BODss0IM9Gcu2aMIeVBUY+DATfep3/HBhkhb
	 Zjqe7MqDdixLqI0/t1CDid5w5bi6IJkfyE3E2lPDTaqgZPM3muY0xnudAOUrO9YQaWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NudwAWVHsIqQmPrY4IvqXCLbf6QrsGDu0BOJqzkRoQE=;
	b=knvbqUVUJB9NCDoZxAfiwOjlRa1ME6/WZ8XbgPMjzT81NZbydUiIpU83bNphH6CKs/mP
	 c6U+YRJ+9Hv4PmD5rKwTdG1efMUsyhTzeLKEZOK/fbkqublomZgHTFcvJSfR3mtgMCu4N
	 N1hf8uEZb5SkNvqFaJ8svVz2yyD6/oaJ5Cs/BrXfU/JsPPVsQVNTzcG25W6fxEaRptXjQ
	 RyHqiWP+Yy68hN+ByvajaUqUQoTgf2S4UYXbVrGdzg1gccgiJE8BPZz3uTbWHn138AhPA
	 jVW09MJMKmWOCj23p9sQDHXrClkSRznYwWcqQwx+8r9heLwsNyI7aGkNSToE/WJM3Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hdNlp9oT;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2677E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hdNlp9oT
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so451520eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117490; x=1794722290; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NudwAWVHsIqQmPrY4IvqXCLbf6QrsGDu0BOJqzkRoQE=;
        b=hdNlp9oT7RX1RRN+GLOB/VsVJjeitGC6YXOgCxOQ2T72t51C6d5kzUNXMBgKJbZ47i
         jv0SvDmKaiWZQ+Q5WkHbhVu1T+NV+Aq0xgFLQedxqQuE62wv0dztqnqihie4dvGvWbDa
         IqLxg5Rb35sh7/oGPY7EBw8WnC9Z0rsD7PIoZH7i1ZpKNsb87iubGaXAblyA8FAo7bmQ
         DqFx0fwRJlTNvRwmr9TaQuZKBQaOozSQAGvBgiq9WoWKPN75AuywsAgwtQxqk2aM4ctG
         xHsIxYy9dWWQhH3dZTW33hNDPSTi5nimKwEfpvChm7YFf1eqV6fkJIPyl6Olg5JVz+qa
         j8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117490; x=1794722290;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NudwAWVHsIqQmPrY4IvqXCLbf6QrsGDu0BOJqzkRoQE=;
        b=Ji/4QmBamEke6E7dbJaG8/r+nEuNr6mKorAvhcMDqXpMHMuYl35eNNuOegdYcRj5hr
         ZTfAjVpg/7Tj66VgApdpQ71kVLVqrEnVp0u3WKobfZxmU/z/B0WfvqMmbVf34JQPSS+p
         VHE/9yS0Q2glVG9MsX9815FrTG+tYROppLmaqf39FuEbXxLdcWVfeOF7jGuQORRDOWM5
         OxWJrLydjXoYKfR+RsX2o1L2ayHEvcRYuozduvc4BWBRlYBSvbf+aJOMHdo++bQiFLw3
         evVgzaXPmQYGeGFivjq+BEcMlGyUzdtzYu8FvC8NQ/Aw4CEuaZ6quUC1cfn1iyad12hG
         zppQ==
X-Forwarded-Encrypted: i=1; AKwUvBzic5PFdjzuDXlWvokRqbIkdaRXwVHAYdMVTVlJd8uXtZRNs/LmvBVlk678NPXzVEqBWyBnvj9Xy18sPig=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KHiSRj1UmyFzvr8UzBFDftsoW7HPferSircVuZPgJZqAJRgWs
	ejbuWeEeo4RtUuE4mb+EwXMxYRxe9MgvpfJXe4Gp3VShQmzOHE70dqxqKaKrQvhTpps6bqGtO1z
	YojOGOibj/AXaAsM5fR9xLHoI5w==
X-Received: from dlan21-n2.prod.google.com ([2002:a05:7022:eb55:20b0:19b:58fb:b643])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:221a:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1b39feef1fbmr979002c88.31.1794117489848;
 Sat, 07 Nov 2026 21:58:09 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:03 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108055809.2122934-1-almasrymina@google.com>
Subject: [PATCH net-next v2 0/6] net: devmem: support leased RX and TX queues
 on netdev unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Support leased RX and TX devmem bindings when either the virtual device
(e.g. netkit) or the physical backing net_device is unregistered:

1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
   can lock either binding->map_dev or binding->bind_dev.
2. Rename binding->dev and binding->vdev to binding->map_dev (physical
   DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
3. Guard __netif_mp_open_rxq() and __netif_mp_close_rxq() against an
   unregistering physical device reached through a queue lease.
4. Always populate bind_dev on RX and TX bindings and handle teardown
   and netdev unregistration of both bind_dev and map_dev.
5. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
   leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
   bind-rx when map_dev differs from netdev, assert both devices are
   locked, and check map_dev->reg_state.
6. Add kselftests in nl_netdev.py covering leased RX and TX devmem
   bindings across both virtual-first and physical-first netdev
   unregistration orders.

v2:
- Split patch 3/4 from v1 into 3 smaller commits (patches 3/6..5/6).
- Clear rxq->mp_params and return 0 in __netif_mp_close_rxq() whenever
  dev is already unregistering, avoiding queue reconfiguration on an
  already-shut-down map_dev during cascaded lease teardown (Sashiko).
- Drop unnecessary xa_erase() in net_devmem_unbind_dmabuf() and use a
  local map_dev variable in net_devmem_get_binding() (Stanislav).
- Restore ASSERT_EXCLUSIVE_WRITER(binding->bind_dev) in
  mp_dmabuf_devmem_uninstall(), drop redundant bind_dev->reg_state check
  in net_devmem_bind_dmabuf(), and expand commit message rationale
  (Dragos, Stanislav).
- v1: https://lore.kernel.org/netdev/20261103232659.1340283-1-almasrymina@google.com/


Mina Almasry (6):
  net: devmem: pass net_device pointer to net_devmem_lock_dev()
  net: devmem: rename binding dev and vdev to map_dev and bind_dev
  net: guard memory provider RX queue open and close on unregister
  net: devmem: always populate bind_dev and detach both devices on
    unregister
  net: devmem: resolve physical map_dev for leased RX bindings
  selftests: net: add leased devmem RX and TX netdev unregister tests

 net/core/dev.c                           |   2 +-
 net/core/devmem.c                        | 110 ++++++++++---------
 net/core/devmem.h                        |  25 +++--
 net/core/netdev-genl.c                   |  58 ++++++----
 net/core/netdev_rx_queue.c               |  17 ++-
 tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
 6 files changed, 253 insertions(+), 91 deletions(-)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.56.0.455.g6c5a503b38-goog


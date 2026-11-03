Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748423;
	b=G4n/QMGZ1itGHN8n7zru5ENAg9NmzDoxVGft8zYLSevszCsXfc5rpDNfb2wPMDYcyhQ+
	 xq8OZyhmn4iZGpm2eZgP23LTis8Qxk1nHApZFT4AfdAsFtlZ+EjCySmtHkKKbHjXh3YES
	 FcOBG4rjhhQL66e3JpUecM7fzYGVEhi8Klyb3R6cSsswTdwAVEnN8yOoPUOUaS7fpBzX1
	 XDlYXdgNfRuc3NMC91EUtvBS3PQIQje7mjA68TRccr+hWzmfmw33A5d4pbcb42vHw7YjP
	 BsnSrj9cboAVU134AC2YKng3nVOHTwsByp7VBR3OkOk7NRjXqYPp3S8Xw/OJ2KK/m9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
	b=xDFXjpbWmOJCZE6Va6eEBSK4O5s+uroXA6kAr5+f9ls9LlJBaCn1b6AddU52cOM8uk6b
	 PWtWd506D+Oh85ir9RL2nDRTSaRa+PZn4bvM6aU7wWDHf75MfShFdpfZgT6S2o3hYiM4s
	 6gOapBFgAaPDa5Em/E62lvjK0rj333HGSVHDGu6r7cF1se0eYxy79YoHqiF4McSiZ4Qg0
	 2cGGseEhdSnCsusdTeipPIIah/AaIsZfkGNYTnUenRBAUaTQaoqdWvhNGQPQp7RyjSXE1
	 cNcUrCL4ZEWt6nunJ7W9yHlwjtUpgXwgGk5MizoPRj5rpiwANxS2gMXukuvGAasWrRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kMqQ5/+Y";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C4606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1C4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kMqQ5/+Y
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso131712eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793748421; x=1794353221; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
        b=kMqQ5/+Y3q+3svE8pMnZxDPk4dEBWFIZpEzNnbKht5uygeHOSpTFh1FfkhHL4jxNSg
         hs/M4i1gK8tL+d6Xb/h2b8iNMF+Mgmth7XA3bijSxNHkAAPYMwbgz5UKv55ujE24G6/O
         RoDQCz36Ylpau1m0BSKQlLFquBABJNJDb+ftwe7Hdb7pFZvkd00Q/VDEujlMGNlE0YbV
         Gg4mvJtd427alIgL2np2OEjFpwYU2OESTtccko8bdnzKv6D739uHQTWg+bJnet5YWGux
         h7TigQZBiEXh1QQSre7xMft/7cLZETtPzLeA5qcNE2RnlRwfOgyzBAdCkeSURbyvpb9h
         uc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748421; x=1794353221;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYRyPmJZ7VWmEJxbkLyGw/WWdEL7OKIehVLxgCMD04Y=;
        b=gJQZNTirlmFRQCPKeh/OC1DkViJ1UpRIt0/PCSBaInMuSglAqMpmLBDeAZ/425wKQc
         4cl4A5cCWMTYcKYctiq3MBRxeHY9LRLZNuPPcqPk32cMar6kPePpbgNfo6ZIexP/+Luh
         A3r5D++YnYK72hmZnypEAqtZjkeE7iv1aCXS8/YB+mRRxB8T/p9m21gZsXv4Ko3Xz1BK
         UWE4vUersAbd/j0FVD3b8cx86l1qIZPqPvUlQz+6ElGodOJclJnDIzbyrcRCmh9FuwPd
         OBCG1XLONv9fLxgexx34J+RXju3jaRRaGmY4Arr8s8mdQPlLX9VjFOhFZPwuFXkerQS7
         HeJw==
X-Forwarded-Encrypted: i=1; AKwUvBzlYttMSiXTMus/7Ex/yOW9rvUymbqjM70I5SG00aX/ZZnTPum0ADC6amr/Z4fKK7QEMyn1v5dfTAKZlwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3mpv/kVmzaUU8GlTLb6qoLTj8j0HlNZepNAFlqi7XA7XP7lTZ
	a9DWK2JNrevQNywl2RTJTaGWCYGnVx96Bpt6NLJ32zlSYZcUZ140AsdnkVNgPT6FL6W2N7fRzC7
	fFBw4DDOKTepS5vCxWSOMiYrFGA==
X-Received: from dyuw3-n2.prod.google.com ([2002:a05:693c:8803:20b0:351:2266:121])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr19610913eec.37.1793748420418;
 Tue, 03 Nov 2026 15:27:00 -0800 (PST)
Date: Tue,  3 Nov 2026 23:26:55 +0000
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
Message-ID: <20261103232659.1340283-1-almasrymina@google.com>
Subject: [PATCH net-next v1 0/4] net: devmem: support leased RX and TX queues
 on netdev unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	David Wei <dw@davidwei.uk>
Content-Type: text/plain; charset="UTF-8"

Support leased RX and TX devmem bindings when either the virtual device
(e.g. netkit) or the physical backing net_device is unregistered:

1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
   can lock either binding->map_dev or binding->bind_dev.
2. Rename binding->dev and binding->vdev to binding->map_dev (physical
   DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
3. Always populate both map_dev and bind_dev for direct and leased RX/TX
   bindings, and rely on dev_memory_provider_uninstall() and
   netif_rxq_cleanup_unlease() to uninstall RX queues and clear
   binding->bind_dev once bound_rxqs is empty.
4. Add kselftests in nl_netdev.py covering leased RX and TX devmem
   bindings across both virtual-first and physical-first netdev
   unregistration orders.

Mina Almasry (4):
  net: devmem: pass net_device pointer to net_devmem_lock_dev()
  net: devmem: rename binding dev and vdev to map_dev and bind_dev
  net: devmem: support leased queues on netdev unregister
  selftests: net: add leased devmem RX and TX netdev unregister tests

 net/core/dev.c                           |   2 +-
 net/core/devmem.c                        | 121 +++++++++++----------
 net/core/devmem.h                        |  25 +++--
 net/core/netdev-genl.c                   |  58 ++++++----
 net/core/netdev_rx_queue.c               |   5 +
 tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
 6 files changed, 249 insertions(+), 94 deletions(-)


base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
-- 
2.56.0.385.gac671c819a-goog


Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1225785C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600935; cv=none; b=jNWsqJ+pJr76Kt4v/B5EfSgAFYamlzTvuMy6IHG7zkeC2FeKnzlksimuWOlI1WtBsHWUMAALStzMgbMf4iSsWwGlX5RoJFWFs8kbJdSnRU1cg6zNY4ppQUFQEFFChBYRlawtgNoOKv1PMZc4jDMAkWaM1vrCQj40iEz8p/NibOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600935; c=relaxed/simple;
	bh=VMCiLqz8s5cgM7chlWJoua61lHqDxDcPc8Jd9fXrkb4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JB57IdaKh44MH6CHLQ58HuRCXmnlvuvU/zsv8ZEG8TcPqWRYkq8tKt3d6SEZYKk2h8pFK7SknDwDu4AmZQW9ZDXKvAhJDzP/7tMw/yK0PifFGX9HGCMQO1HVK3bO+qdKGcb8PHuvgLhJ4BRBcHExNO2n4GJhmpeD3s4j7WFdmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UrXHUco/; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UrXHUco/"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so553286eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791600933; x=1792205733; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nr/wh3D04jCOdxRooqTq4ckJalsK9oapi786CLs1riY=;
        b=UrXHUco/3NRy22zwvjKYutqE/fV4ssA3HCwJttKHUkuFZmVCczj1C4GGgIPRkcznip
         rSu51g/2g5wkLzKKpxLwfztRfMph+fGSOuvKKqyRwfgapL7j5ZjPoa8Ihb4u2aDGwK7O
         CQv3GWLWhlu4jOK+pXkOI2sz8FQ+p3qYUExCI0Cdpp7hPhGBurhf8cAv3pYigXr+hjMp
         vEfxjiBaheeVN1tIvyDDl12jFXx5HPH+/dogcF4AFVjRON47D0Iscki2kNSduFsdgKn8
         Ei9S7mqiIwMTbPaoPe+XZ4XIIpCf5ywkpNDROCBsOtarZqpMo2ar5/sievTDH6cGtscA
         14yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600933; x=1792205733;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr/wh3D04jCOdxRooqTq4ckJalsK9oapi786CLs1riY=;
        b=r1tRR9b/YFMZGQnmztOu65wcbIu2Wlu920KZaSeonowl33HjYv3td8J6tdy+yAAE0F
         Jna8Z2N9lVdT0q+ZybNwOJJR/Lryk2VE2boy86VPE3DA4QKwxD5NIMqAr9SFMczpndzO
         nwU21Wq+lOzKYb9tDum0y5zKzWET+QfqPuXr5mlZyJxBAvtOI7bHXnwP20hOleFFV5XC
         zkwvc6a0sxUhsUKO3ehWvPT7bD/9OUdsaYmKeNlwUNxRWVwaOb0uFIeTyMgzJ9HngAlI
         oDuz61QRgK4WgskHs4Y260OFzmtZ2EEm/04CDBBgopy5vwNf8jSa23pMSi/O79QhiokG
         8AXw==
X-Forwarded-Encrypted: i=1; AKwUvBwDdxGPpQ9wGexhwIsf9K51MilXFAlznker3mMPDG9k8WVvoAZLGPJAXsnp3WY4GDUybK79YLy3vuY0TWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPHrAuKhDwyG3jIqRBiznewM1uhdaGLUDCB9ixRq23dyDQv7d8
	Q0sHX4n7g0ifWYTP8i48+bi/OMMwryYkKXKS4hqrtCbGaxKrpP0tylmCEXodMRysPXQmNCSAqyi
	3N400FadOhEsgcnXjXm1epPwcoA==
X-Received: from dlbqs7.prod.google.com ([2002:a05:7023:d07:b0:146:59b2:8236])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr4717399c88.2.1791600933127;
 Fri, 09 Oct 2026 19:55:33 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:55:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261010025532.839559-1-almasrymina@google.com>
Subject: [PATCH net v1 0/4] net: devmem: fix RX and TX binding teardown on
 device unregistration
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix two device-unregistration lifecycle bugs in devmem TCP bindings and
add netdevsim support plus selftests covering both RX and TX device
unregistration:

1. net: devmem: unmap dma_buf synchronously on queue uninstall
   Synchronously unmap and detach binding->attachment under binding->lock
   when the last RX queue is uninstalled in mp_dmabuf_devmem_uninstall(),
   preventing slab-use-after-free in dma_unmap_sg_attrs() when the netlink
   socket closes after dma_dev is freed.

2. net: devmem: detach TX bindings on NETDEV_UNREGISTER
   Add net_devmem_dev_unregister() on NETDEV_UNREGISTER to fully detach and
   unmap TX bindings when binding->dev unregisters, or clear binding->vdev
   alone when only a virtual device unregisters while binding->dev lives.

3. netdevsim: support devmem RX and TX bindings
   Enable PP_FLAG_DMA_MAP | PP_FLAG_ALLOW_UNREADABLE_NETMEM, 64-bit DMA mask
   on nsim_bus_dev, and NETMEM_TX_DMA on netdevsim so devmem RX/TX bindings
   can be exercised in software selftests.

4. selftests: net: add devmem RX and TX netdev unregister tests
   Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
   to tools/testing/selftests/net/nl_netdev.py.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>

Mina Almasry (4):
  net: devmem: unmap dma_buf synchronously on queue uninstall
  net: devmem: detach TX bindings on NETDEV_UNREGISTER
  netdevsim: support devmem RX and TX bindings
  selftests: net: add devmem RX and TX netdev unregister tests

 drivers/net/netdevsim/bus.c              |   1 +
 drivers/net/netdevsim/netdev.c           |  21 +++--
 net/core/devmem.c                        |  68 +++++++++++++-
 net/core/devmem.h                        |   5 ++
 net/core/netdev-genl.c                   |   1 +
 tools/testing/selftests/net/nl_netdev.py | 108 ++++++++++++++++++++++-
 6 files changed, 192 insertions(+), 12 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.56.0.385.gd3acb90ef8-goog


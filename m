Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC352E058
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082369; cv=none; b=KzBQJV54fBiEtUlNMEbhsaHVQAmd6W3ZoVN0+o/X+GKsjHd3Kp+deAqALR4xwOqpa/m/uNaFIXmeIFJzH8OkTFW/hBOVfgsx9l9AdpVC09eyxGbsFQv3iUpFl71jVdK9tK5FtSTnOKTyrIKpGvvvBVI6rc7wjx2OK6UaeK3wg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082369; c=relaxed/simple;
	bh=E+zSoTtuwkYhdpk9ljOm3Z9OJ5QmHoC4r8hcYNR5OJM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JBgVyxww/gmQjikLP5Hd/F3RZLKvh6nx3LPnGPYbMdezVOcgK/oVdXzFDz+S7sCp+gEwNRHrYSvaiMy6rF9nnrgAOfYKkuo5HRdGoNIm6P9CJuY5Wtp5XOCsHRvP8ZqXhE8QZpgJkxy1syptzYCSsyTlwsQMqatdsze1iZ1Gsqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XSSUXbK6; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XSSUXbK6"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so123375eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792082357; x=1792687157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DD74npn17j4yI5LDxhcNiaGvijuuU+ohVy4Pfwe/27o=;
        b=XSSUXbK6SPBy0cpT4zSFmyOcz1BG3NJbuSHIHTwgfwg38ivDGGFFtZg57kikXFOf86
         Upbsf6HUZoHOSuCcGY/tdc8Tu6gn4zcSZNrAZKRD/rwYj8WV//kHq3PhNkXBWwU3pU4J
         umYWCJ3bF6htuT9/rw3n4/SABRG0B1OFz4L5El1+nC2EcRo+PTRXk4luqVnpfPmk4j8B
         27LkfEGiUvMOS987K3kCl0F7GFhTDc4yP1MWiECJY3HLisTpHhxMCF7D5HbB7d4wCYCz
         uT2TkyjmSn7NDw2jOO9AIqd81fnJXuABDgz/mrqRAnUeL+2fn4MjXBxyU8433NasJlMP
         Mnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082357; x=1792687157;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD74npn17j4yI5LDxhcNiaGvijuuU+ohVy4Pfwe/27o=;
        b=FEil/XkKfoMNvhRysYAqFuW9YkHzqX1GDzNNsfYAQdDRwRMiXnnqn9xVIi0s3HXhO6
         ggrFdBqwsTI1YctonBvHG47GOznmbJQQuHqMWagr7Zdvk443AmHwAKS28dG/Rp12VXJh
         KoA0efF5pQorrApUIEw6fTeF+PjH9rXawkI9gdaJTr/N05iHaQSEahyp7OZbrYBZ5kyE
         ur2zVBfsbTws+zds7s7rX6+VoI/5u3BlbFdFdNe0UfjTUycgkKQz+Vk39lsNy/aMQibE
         zcg+kJeJ3NP/UWmmqNY8HCH+L/hNfYOoO8IJhKQVLc+nd2TuqyK9IGKT3sL/Vc+5G8vl
         FytA==
X-Forwarded-Encrypted: i=1; AKwUvBzJEBVeK8xk6nC6FnieGWMiVCnOlsEVmuAPwj1hMvTIKU1kQmtKfzz3k5vf+V1UJQiU+CN6VgUCCxRSodI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyYuGcUamvHKuSmeGs8Inff/71k4QwtxionxT7fHpij2eLOQCT
	TDL3ZZoJ1w+ql+4Lbk8qx3hbKok+wugV9JxH+sc0rjTYkfJHApbVF0+mb/qkPVRodmJODJiJDxR
	jxqx3N6A1649MZEsB61yXn2OmwQ==
X-Received: from dlbut14.prod.google.com ([2002:a05:7022:7e0e:b0:152:9a82:8c78])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:6b9b:b0:156:d588:c881 with SMTP id a92af1059eb24-182500534eemr688262c88.2.1792082356249;
 Thu, 15 Oct 2026 09:39:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:39:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015163915.1166043-1-almasrymina@google.com>
Subject: [PATCH net v4 0/4] net: devmem: fix RX and TX binding teardown on
 device unregistration
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix two device-unregistration lifecycle bugs in devmem TCP bindings and
add netdevsim support plus selftests covering both RX and TX device
unregistration:

1. net: devmem: unmap dma_buf synchronously on queue uninstall
   Synchronously unmap and detach binding->attachment under binding->lock
   when the last RX queue is uninstalled in mp_dmabuf_devmem_uninstall()
   or closed in net_devmem_unbind_dmabuf(), and unmap unbound RX bindings
   whose queue failed to restart on NETDEV_UNREGISTER, preventing
   slab-use-after-free in dma_unmap_sg_attrs() when the binding is freed
   after dma_dev.

2. net: devmem: detach TX bindings on NETDEV_UNREGISTER
   Extend net_devmem_dev_unregister() to fully detach and unmap TX
   bindings when binding->dev unregisters, or clear binding->vdev alone
   when only a virtual device unregisters while binding->dev lives.

3. netdevsim: support devmem RX and TX bindings
   Enable PP_FLAG_DMA_MAP | PP_FLAG_ALLOW_UNREADABLE_NETMEM, 64-bit DMA mask
   on nsim_bus_dev, and NETMEM_TX_DMA on netdevsim so devmem RX/TX bindings
   can be exercised in software selftests.

4. selftests: net: add devmem RX and TX netdev unregister tests
   Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
   to tools/testing/selftests/net/nl_netdev.py.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Cc: Dragos Tatulea <dtatulea@nvidia.com>

---
v4:
- 1/4: Unmap RX bindings in net_devmem_unbind_dmabuf() once their queues
  are closed, and make netif_mp_close_rxq() report queue restart
  failures, so the NETDEV_UNREGISTER walk only handles bindings whose
  queue failed to restart. Drop net_devmem_lock: walk the bindings under
  the xarray lock and take the instance lock of binding->dev in the
  final free. (Stanislav) Record a queue in bound_rxqs before opening
  it. (Sashiko)
- 2/4: Detach and unmap TX bindings directly from the walk, without a
  grace period or a second pass. (Stanislav)
- Link to v3: https://lore.kernel.org/netdev/20261014161754.3782346-1-almasrymina@google.com/

v3:
- 1/4: Run the NETDEV_UNREGISTER walk under the netdev instance lock,
  and skip it when the device only moves to another netns. (Sashiko)
- 2/4: Detach all matching TX bindings, then synchronize_net() once
  before unmapping them. (Sashiko)
- 3/4: Only request page pool DMA mapping with CONFIG_HAS_DMA, refuse
  pp_hold on memory provider pools, and drop unreadable skbs in the
  software PSP checksum path. (Sashiko)
- 4/4: Check only the test's dma-buf in debugfs, skip instead of passing
  silently, clean up on errors, compute UDMABUF_CREATE per arch, and
  add the needed config options. (Sashiko, Dragos)
- Link to v2: https://lore.kernel.org/netdev/20261012174300.2338784-1-almasrymina@google.com/

v2:
- 1/4: Don't unmap when a leased queue is unleased. Keep bindings in
  net_devmem_dmabuf_bindings until freed, hidden from TX lookups by an
  xarray mark, and unmap unbound RX bindings on NETDEV_UNREGISTER. Update
  the binding->lock and binding->ref comments. (Sashiko)
- 2/4: Detach TX bindings from the same net_devmem_lock-protected walk,
  which now also covers unbound TX bindings, and clear the LIVE mark
  instead of erasing the ID. The walk no longer uses RCU or takes
  binding references (Stanislav).
- Link to v1: https://lore.kernel.org/netdev/20261010025532.839559-1-almasrymina@google.com/

Mina Almasry (4):
  net: devmem: unmap dma_buf synchronously on queue uninstall
  net: devmem: detach TX bindings on NETDEV_UNREGISTER
  netdevsim: support devmem RX and TX bindings
  selftests: net: add devmem RX and TX netdev unregister tests

 drivers/net/netdevsim/bus.c              |   1 +
 drivers/net/netdevsim/netdev.c           |  27 +++-
 drivers/net/netdevsim/psp.c              |   5 +
 include/net/page_pool/memory_provider.h  |   4 +-
 net/core/devmem.c                        | 157 +++++++++++++++++++----
 net/core/devmem.h                        |  11 +-
 net/core/netdev-genl.c                   |   1 +
 net/core/netdev_rx_queue.c               |  26 ++--
 tools/testing/selftests/net/config       |   4 +
 tools/testing/selftests/net/nl_netdev.py | 125 +++++++++++++++++-
 10 files changed, 314 insertions(+), 47 deletions(-)


base-commit: aa07285705f8d5bac464eb1c5b7412f8e88b91e1
-- 
2.56.0.176.g3575e65682-goog


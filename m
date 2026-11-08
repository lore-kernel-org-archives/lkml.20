Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117498;
	b=dDeQjXZ9GeM1SG0h80jWkYrqPC0xCVZmhBWd360ijEsSH2lCbIxcpk3g9pmxG+Xt2orh
	 JQOULSxZDOlTvmlgc+TNf+/LGRyPl4T2nMkQyJJhFMWgpCTtz/PmnlUhw+UtRgyugErIp
	 2XpK+b5CJN1tco9ajQT2bXyxNIFBGbTeGTD5le56zAl5Say+a2VBdAefLgQ6SMztJKwV3
	 T/gORq9OnZTQEJUDQD//Ryx61BGN4SFGjg3HXIZkomVmGAu5r8OLI/VG5R1MxGRGNnNdL
	 ndMxPcL9zSlsPOLoeij19BZ8i2/sYr2y2jglXAuZJIjDfs8fGsIHaAFvnKLAXDDLzDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QYnZ4f08SwRhsosiiEmUJpp+LTvkBM+gRqSOdQT1O/I=;
	b=oA+QLfO+2dlZhzdiqTyFMREB+VHgBArQtD8aVmFh9VpfNAXUUBCb5q2iIRlPJr83cmmO
	 dkA8JMnaM5MWU5tNaAu9Ch22/34sWllnO7oVSXxN+2aE0Pdnkv3QAR1K9g2xkD0Q6JrGW
	 PcOyBLCk3UhsyfDyIZw8jyk6kvDsZPGmQn6iWRpwVSNYRyj6VQBjwtaFys8L4OuhuL+uS
	 E0O6ModBxypMMzrxfBAsKHjcyVfzfQ8WpfKK1jN3ECVnAXY09NeiDQwKJQ0XvJwQcwYpG
	 1jJnpqCqA22Gt947rDcFhiOR9rVLdnimYw47i0EQWbfuEtaR8nEteXaN8rhVOd8sTjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEJh5ae6;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD1606D815
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DD1606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEJh5ae6
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so523635eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117496; x=1794722296; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYnZ4f08SwRhsosiiEmUJpp+LTvkBM+gRqSOdQT1O/I=;
        b=IEJh5ae6TjXORBvPm/AHJV/MFZu6TKp8f38jWxw3/XUXdqItNsMIL6tPssXu80p0hF
         pHWTg9Y+FCWFl54Ro/L81Pb8WCv1/auLLSpFhQ5KViWkqeVtYdijQ7RCdNTVMWKpAt4o
         eVdrBMhCY1lmMHIAiQ882jbAD67KxopQW3HXK2zXcb+vVL1e2r+pJiYVLGQNNWcnuW72
         KE+0PS0uZJKd0oB1Pypj/5ySSMYBjJAxeM+nNpyE9jg09fXIyntsvj2BWMDUhOwEkIlZ
         A345OhhTPuRn1SxyI9Nem4MijN0vlMXoKXiEgZmANZjtstr2M+Mz3A/zZCIfFefxUs/F
         g+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117496; x=1794722296;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYnZ4f08SwRhsosiiEmUJpp+LTvkBM+gRqSOdQT1O/I=;
        b=g7ecDIqe/r0DoPLQYdoXC5tm6QspdvIZJsJDaIwCSX8RgnDu+HuTRR/d/mm+reqp5M
         twIwkZtNV6XHmcRtmvLpyZPC3hlRM+lM+/1FVTMF6kk+a0YQGkVyor0kUfkpozHViQ+H
         tCZlaqeCbFdZpgA9ygbBZPlbbXaOZ0r54+c1sLdcAy5pKlxNLvEjRm0kskKIrdaF+bGC
         bsQtjFdg3M6YKZnSrZuNMw7YZAcSkHPMGkZLgtb4na7ZqSGL9YoVvMRBUwY9dgcF3Kaw
         iXImfrM1iiwSxmTW9cPIfDXa5elTOUSlZ+LnZ476tOTw+FXVavbjUAzy4QILG93tBPxw
         S/LQ==
X-Forwarded-Encrypted: i=1; AL+hErF+h8RizqqSMK6S3S+W4vBH6pPQXPX18quHodLcL2iq67cTQMHebLN+PLFoWQxs46zp9WTzFJ7hhs0/6zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QVPHGgijFCgHaZA8X2V2hdgU3H4wJJBUMiD1ukP5PSSEaRi8i
	PplOEbXgJ+CKu9tCINF9+gogyh0ZU48LDkI3Y0kt/XjINKSP90M9Hh/q8T7j6OltF8P6P1bIoGk
	SIpKi0QU+x7PzACb5LsaUz0NsqQ==
X-Received: from dybpg4.prod.google.com ([2002:a05:7301:4144:b0:36c:a067:eca4])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:648e:b0:36c:a390:8907 with SMTP id 5a478bee46e88-37255a4e72amr2132546eec.21.1794117496193;
 Sat, 07 Nov 2026 21:58:16 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:09 +0000
In-Reply-To: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108055809.2122934-7-almasrymina@google.com>
Subject: [PATCH net-next v2 6/6] selftests: net: add leased devmem RX and TX
 netdev unregister tests
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

Extend nl_netdev.py to cover netdev unregistration while devmem RX and
TX bindings are active on a virtual netkit device leasing an RX queue
from netdevsim:

1. devmem_lease_bind_rx_unregister_check: binds an RX dmabuf to a netkit
   device backed by a leased netdevsim queue and verifies clean teardown
   both when the virtual netkit device is deleted first (unleasing the
   queue while netdevsim remains up) and when the underlying netdevsim
   device is unregistered directly (which uninstalls the physical queue
   memory provider and cascades unregistration to the leasing netkit).
2. devmem_lease_bind_tx_unregister_check: binds a TX dmabuf to a netkit
   device backed by a leased netdevsim queue and verifies clean teardown
   both when the virtual netkit device is deleted first and when the
   underlying netdevsim device is unregistered directly.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index dd0321c0b463a..fa4b5be093257 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -12,8 +12,9 @@ import os
 import struct
 from os import system
 from lib.py import ksft_run, ksft_exit, KsftFailEx, KsftSkipEx
-from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_not_in, ksft_raises, ksft_busy_wait
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, Netlink
+from lib.py import NlError, RtnlFamily, cmd, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -483,6 +484,129 @@ def devmem_bind_tx_unregister_check(_nf) -> None:
     nf_priv.close()
 
 
+def _create_netkit_single(rxqueues=2):
+    """Create a single-device netkit interface for queue lease tests."""
+    ifname = f"nk{os.getpid()}"
+    try:
+        with RtnlFamily() as rtnl:
+            rtnl.newlink(
+                {
+                    "ifname": ifname,
+                    "linkinfo": {
+                        "kind": "netkit",
+                        "data": {
+                            "mode": "l2",
+                            "pairing": "single",
+                        },
+                    },
+                    "num-rx-queues": rxqueues,
+                },
+                flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
+            )
+    except NlError as e:
+        if e.error in (errno.EOPNOTSUPP, errno.ENOENT):
+            raise KsftSkipEx(f"netkit single mode not supported: {e}") from e
+        raise
+    defer(cmd, f"ip link del dev {ifname}", fail=False)
+
+    link = ip(f"-d link show dev {ifname}", json=True)[0]
+    return ifname, link["ifindex"]
+
+
+def devmem_lease_bind_rx_unregister_check(nf) -> None:
+    """Verify leased RX devmem bindings detach cleanly on virt/phys unregister."""
+    for remove_virt_first in (False, True):
+        dmabuf_fd = _create_udmabuf()
+        defer(os.close, dmabuf_fd)
+        nf_priv = NetdevFamily()
+        defer(nf_priv.close)
+        nsimdev = NetdevSimDev(queue_count=2)
+        defer(nsimdev.remove)
+        nsim = nsimdev.nsims[0]
+
+        ip(f"link set dev {nsim.ifname} up")
+        with EthtoolFamily() as ef:
+            ef.rings_set({"header": {"dev-index": nsim.ifindex},
+                          "tcp-data-split": "enabled"})
+
+        nk_ifname, nk_ifindex = _create_netkit_single(rxqueues=2)
+        ip(f"link set dev {nk_ifname} up")
+
+        res = nf.queue_create({
+            "ifindex": nk_ifindex,
+            "type": "rx",
+            "lease": {
+                "ifindex": nsim.ifindex,
+                "queue": {"id": 1, "type": "rx"},
+            },
+        })
+
+        _devmem_bind(nf_priv.bind_rx, {
+            "ifindex": nk_ifindex,
+            "fd": dmabuf_fd,
+            "queues": [{"id": res["id"], "type": "rx"}],
+        })
+        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+
+        if remove_virt_first:
+            ip(f"link del dev {nk_ifname}")
+            phys_q = nf.queue_get({"ifindex": nsim.ifindex, "id": 1,
+                                   "type": "rx"})
+            ksft_not_in("dmabuf", phys_q)
+            ksft_not_in("lease", phys_q)
+            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+            nsimdev.remove()
+        else:
+            nsimdev.remove()
+            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)
+        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+        nf_priv.close()
+
+
+def devmem_lease_bind_tx_unregister_check(nf) -> None:
+    """Verify leased TX devmem bindings detach cleanly on virt/phys unregister."""
+    for remove_virt_first in (False, True):
+        dmabuf_fd = _create_udmabuf()
+        defer(os.close, dmabuf_fd)
+        nf_priv = NetdevFamily()
+        defer(nf_priv.close)
+        nsimdev = NetdevSimDev(queue_count=2)
+        defer(nsimdev.remove)
+        nsim = nsimdev.nsims[0]
+
+        ip(f"link set dev {nsim.ifname} up")
+
+        nk_ifname, nk_ifindex = _create_netkit_single(rxqueues=2)
+        ip(f"link set dev {nk_ifname} up")
+
+        nf.queue_create({
+            "ifindex": nk_ifindex,
+            "type": "rx",
+            "lease": {
+                "ifindex": nsim.ifindex,
+                "queue": {"id": 1, "type": "rx"},
+            },
+        })
+
+        _devmem_bind(nf_priv.bind_tx, {
+            "ifindex": nk_ifindex,
+            "fd": dmabuf_fd,
+        })
+        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+
+        if remove_virt_first:
+            ip(f"link del dev {nk_ifname}")
+            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
+            nsimdev.remove()
+        else:
+            nsimdev.remove()
+            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)
+        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
+
+        nf_priv.close()
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -498,7 +622,9 @@ def main() -> None:
               page_pool_ifindex_leak_check,
               page_pool_stats_ifindex_check,
               devmem_bind_rx_unregister_check,
-              devmem_bind_tx_unregister_check
+              devmem_bind_tx_unregister_check,
+              devmem_lease_bind_rx_unregister_check,
+              devmem_lease_bind_tx_unregister_check
               ],
              args=(nf, ))
     ksft_exit()
-- 
2.56.0.455.g6c5a503b38-goog


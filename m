Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4B4C9DF5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826996; cv=none; b=uS8r6hEuZd0chiSD4wI0rhX5z6aAlboSBSz3X0ejZXurnclBVeLJwChvVilIwKJnxvKyf0BKqtZ0EBlbcSowJoTlI/JAtFcEqd6BdEgrDGgbj0nkzeJjxFXvdEs3PQTOHwjYawQrGc/EnzXezNKghzHhwEY3Zu0dcrPFW0SM6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826996; c=relaxed/simple;
	bh=6gGUo5bfHG056Upj0Wv3RVCBcYSHTIx2FpNy0nwC6/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SFCcRijFEtVefReb0t8Lk0k8djYIuayxQ2sNcKPU9sqT04x1PVsg0rJxLPrbbij+Hv3+xqtfKOnjXB5SF3qFyVjdsR7Wdj6jJLO5SPClkLX8NQzgUkG/DtoS2QVROsmNQPGLonbDDbK7bWglJjF4O3nGIfkhnv8osNt0cJJOay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CWIzH4aw; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CWIzH4aw"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4727671eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791826992; x=1792431792; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0d9kx5oWqQ1CybegjOdsNGS+P/geGKBslG4tLGyxeVI=;
        b=CWIzH4awYFaa2mmvUonfwfCckiw70n84q+KwhfRscqujCHcAEjCGHCHKHRpt8RZ13O
         WdxAjrSFAWx5FUErFchNOgsom6yWfo14PsZQYXSST5yFKEbRfSUL2thpiYuVhuLGFRdQ
         XBBiDMkXfBfJUbku8XAZlw9emTWylmxpbpnwhVzrU8DZ7n0vIgt/7vUxM/e4RoYKSEzU
         ZFbfyGfrO8J7hBFAau+mIa8jfKn1zYI2xnqV+lpuNzv41+t9gzQOWQ1WnaeUmZKq+igf
         D9xkYkKcJcLK0j7RkTf1YWL7Xhga0ABmZ/nbidJuCU0nO8msbrWLYxohZcBtbt9DjmFC
         0TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826992; x=1792431792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0d9kx5oWqQ1CybegjOdsNGS+P/geGKBslG4tLGyxeVI=;
        b=hp/SLUr012pbJMAhpg5uvsPUtbfwhXG9QyHX5YME6oFkCHskbPWKvX0l1hRj06z3mz
         B+079Y5bP4uwulj7KFXv8LCmV8oqnVpbyTQBZUkXFJ5T9Hf/+h1YwQlrkhv1i6e+Jlsu
         KXywKZ7SC+uRc0DLAvqGOBqujNHEQXbLIOEoQx8H0UaHJDaqHvL6sm519J8mWOdUF5Ir
         2avAz9OZYq26nvJgXwGmHE0R3F7cdHF67QF0Pd/wq7XuW2XU8mgv4CIvtKuICamgwU21
         EFByPc8RPBj75RL3Qi10Y3+WI6pLuhwYSISfYNMP5scp1nRAyAv9c77iSlOm1S3Q3VMM
         GZLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDo28teQ7lZT8q72sbQ0Ua8kcOQGfOmzGFv9zgJ8W+WMlIetfptrLt7ZZ/nMdIdTdan5thuDWrOazErXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuikYa270gNmeQ3oB2/EmAcilSPt22o9FksCkpFIJAcZ9RLYVS
	V8y+CP3WWirZChGtcEIU0ARF4EuAy+lQgxKiv8L/dkjAw6JdpL0OVBf+IZFGKO7C/1V2tzw8fwH
	MiKk/gL+tgaN5rzGx2EJjFncKGQ==
X-Received: from dycnn12.prod.google.com ([2002:a05:7301:140c:b0:359:72f9:2aab])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:810e:b0:359:861:7cbd with SMTP id 5a478bee46e88-35908617e44mr9474976eec.10.1791826988403;
 Mon, 12 Oct 2026 10:43:08 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:43:00 +0000
In-Reply-To: <20261012174300.2338784-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012174300.2338784-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012174300.2338784-5-almasrymina@google.com>
Subject: [PATCH net v2 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Mina Almasry <almasrymina@google.com>, 
	Taehee Yoo <ap420073@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
to nl_netdev.py to verify that unregistering a netdevsim device while a
netlink socket holds an active RX or TX devmem binding synchronously
detaches the dma_buf attachment and cleanly closes the netlink socket
without use-after-free or page faults.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/net/nl_netdev.py | 108 ++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index ceb44c8e1fec5..bad230ee9dcd2 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -6,10 +6,14 @@ Tests for the netdev netlink family.
 """
 
 import errno
+import fcntl
+import mmap
+import os
+import struct
 from os import system
-from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_run, ksft_exit, KsftSkipEx
 from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -366,6 +370,102 @@ def page_pool_stats_ifindex_check(nf) -> None:
     ksft_eq(cm.exception.nl_msg.extack['bad-attr'], '.info.id')
 
 
+def _create_udmabuf(num_pages=64) -> int:
+    """Create a sealed memfd-backed udmabuf fd for devmem tests."""
+    if not os.path.exists("/dev/udmabuf"):
+        raise KsftSkipEx("/dev/udmabuf is not available")
+
+    size = num_pages * mmap.PAGESIZE
+    memfd = os.memfd_create("devmem-ksft", os.MFD_ALLOW_SEALING)
+    os.ftruncate(memfd, size)
+    fcntl.fcntl(memfd, 1033, 0x0002)  # F_ADD_SEALS, F_SEAL_SHRINK
+    devfd = os.open("/dev/udmabuf", os.O_RDWR)
+    req = bytearray(struct.pack("IIQQ", memfd, 0, 0, size))
+    dmabuf_fd = fcntl.ioctl(devfd, 0x40187542, req)  # UDMABUF_CREATE
+    os.close(devfd)
+    os.close(memfd)
+    return dmabuf_fd
+
+
+def _dmabuf_attached_devs():
+    """Return attached device names from debugfs dma_buf/bufinfo if available."""
+    path = "/sys/kernel/debug/dma_buf/bufinfo"
+    if not os.path.exists(path):
+        return None
+    with open(path, "r", encoding="utf-8") as f:
+        text = f.read()
+    attached = []
+    in_attached = False
+    for line in text.splitlines():
+        if line.strip() == "Attached Devices:":
+            in_attached = True
+            continue
+        if in_attached:
+            if line.startswith("\t") and line.strip():
+                attached.append(line.strip())
+            else:
+                in_attached = False
+    return attached
+
+
+def devmem_bind_rx_unregister_check(_nf) -> None:
+    """Verify RX devmem bindings detach dma_buf synchronously on netdev unregister."""
+    dmabuf_fd = _create_udmabuf()
+    nf_priv = NetdevFamily()
+    ef = EthtoolFamily()
+    nsimdev = NetdevSimDev(queue_count=2)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    ef.rings_set({"header": {"dev-index": nsim.ifindex},
+                  "tcp-data-split": "enabled"})
+    nf_priv.bind_rx({
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+        "queues": [{"id": 1, "type": "rx"}],
+    })
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_ge(len(attached), 1)
+
+    nsimdev.remove()
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_eq(len(attached), 0)
+
+    del nf_priv
+    os.close(dmabuf_fd)
+
+
+def devmem_bind_tx_unregister_check(_nf) -> None:
+    """Verify TX devmem bindings detach cleanly on netdev unregister without UAF."""
+    dmabuf_fd = _create_udmabuf()
+    nf_priv = NetdevFamily()
+    nsimdev = NetdevSimDev(queue_count=2)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    nf_priv.bind_tx({
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+    })
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_ge(len(attached), 1)
+
+    nsimdev.remove()
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_eq(len(attached), 0)
+
+    del nf_priv
+    os.close(dmabuf_fd)
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -379,7 +479,9 @@ def main() -> None:
               page_pool_check,
               page_pool_dump_ifindex,
               page_pool_ifindex_leak_check,
-              page_pool_stats_ifindex_check
+              page_pool_stats_ifindex_check,
+              devmem_bind_rx_unregister_check,
+              devmem_bind_tx_unregister_check
               ],
              args=(nf, ))
     ksft_exit()
-- 
2.56.0.385.gd3acb90ef8-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927203;
	b=emHzv9kxJ3iRJOtE5cg7jVX3De8Bi3ubyVlFATRSl4qNrZd4C3hox8uEBd45KfF5G6E3
	 kA+CDbCbiolco4FlYE0/4JJrlOdu7uxVqJR3ce9YmIt7gRcEtWpClCS2K/dWqlcpZFVEG
	 9hYVn6P/5krpjCKHhy0xVGL8smwEgYT8mO/MgWJgatO3ys9AxiFDv0HE6M7gcKTmPQIEq
	 BzQyOWRirJ6hb4fB6A8Uy5iNy07o0X+huI8v6V5jE62O678htoLwT3lH6GtpTAsSYfhnY
	 bpI6F+7F60BiEYVrrPgIoJj1JGE0fcS8L8ac1Puf0P88QhbQC29wWGf0/HbA8dSbxmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
	b=YieBKWf7NvS0LZ6mbd6xejZ6YU8+GTL8TgTwvb0Vdx7NbdpAFxWtALFUzYHvbZaFX5ZJ
	 AmN3k1XOv6LXopzWQQFVZUU0bRKvRzKZ/aYuSneC/Nx/CjMPpQw5uPBW6pl7zJy+jLSbu
	 ePO7hfYQVCoBPq+m0r88R0vSvVKAn3DMPTB7JQ1lDByxuc0N9mGXIoh5XICneWkNlnCjQ
	 bhUBn+vAANPQ/+2EECi6jl98e3RglpOUX5hfYu5K819ra+mt1prhrA4+b/6NaalxyV8eB
	 3qbma7IpGW9VLjni5iLHEkVquR3FlW7hcAJwgQG2DZ7uNIHe91RDnSXHAkhrniWQVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fzb9MBq1;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EB606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499EB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fzb9MBq1
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2829485a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927202; x=1795532002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
        b=Fzb9MBq1nqqQ5zjQ+Wx2/Vjq33FDWcUWLbn5DIgBawulgIj6LpCy5iJd/uWlAO9x9k
         Wrz8JnYfU3Hsfb6nH+cni+gd4X00dOuvLXQf7tzTdblTB5SMd2uWyoDcBcVAnU+S745f
         QXA1LMI79dL3VlgXr0M5a56GkxxvvIuovTWut1uUPQ9ctBxtdezWs96MKudaZQp280R7
         TFzwaPeTNLG82php9XbT7FlWi9zDqwBjRK+nSCZRPcNeDh6skRtWIv4ErLjfK8JttYuK
         G0Dc+csvkFhHmnt/zicMRDo8kJuztfc8rKqcvbXtXWyCX+T1hygJFv/dC9VhjQT2BPVx
         pYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927202; x=1795532002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAxy3goky0t3VPjV6FUpbe6k2gJl15O6ptslh5cvBS4=;
        b=dObdif+3VW+phxDrW7sNNxAEbGg91qmKIbZWv0R4I9rNh3iH/nFYnXH5RaCV3JTj5q
         hDZWE93XN7AohgRuudK34qcPTIGi/KMNBAXbAuW2IwjYIfMcg53pU4vj5S3mBbCUAW/c
         HKxQ1G9E3vbsRbP5hLcpr2ciUigLHmL+syN1dgGqAc6am4QpFmlJOO03UuJB+DEKiVCs
         N1ry9ELSqPXepEYsusQwfdrH+RwJJycSjyreKe0ksmr0LqGc52HVDpbzsm5IaEgB6q0k
         JkEYP3QSmFsKk5o+5C8m3apGwlX8szWMQGhjK9MLLIGXWr52m94i0oA/TtQR2r/pHSNE
         cvcw==
X-Forwarded-Encrypted: i=1; AL+hErHtQXhGQi9oYRHqyoPlWHN7me9+a7q1i8WTtF3ftVMRo4jg58DEimOr+RqAQR7wSJyRUPw1iDAchNJfsKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0+SQDrIixVjg0X+qOhfJvtJWFVcJE69WcpmNUApPeRKBiO1AH
	rRvUnABVDTL0v8gMyEkNrFeTERdT1TcX7PaWgIbB6JTMhYqoB2y97YAfI4nc5EYdcAc=
X-Gm-Gg: AZFdTZcD7Adf7SgvfztK9Da2tU5vltCxX8mC6ELTXybE8qdqJzWuM5dXqEGUgI9LVcM
	iBXYOCcy8TAkyGfMn2Z50cM/yTZVq1StrxblSK1xJi6nzV5W9R9txdyAe+LEajbDgS6lEHjjv7N
	Km4/ZJQoWL3oyql+y7oKz8V17BZaLQrMx22ZeiS9KXc2ETn8bakLW66o1fM4yB8Si/2E/kno6DI
	tanvVYAtAHRzQ1DZ+kRdUvo4uZDIbkAvg71xwkxgBDJIprav+5Zn+pCu76zjGaff9flszkJKrzT
	5+xzc5l1GVZ1Ol6Rn+6PZE9kqdzBiDa7Nk7zh0GPVSp4T072p9/ukv7Nt0TtqHJUYitlACHK7Ft
	WURjsZOGmWPYDWajtpSF7cIMq690e1iEDWQaiOedjbMDqtPpLfoZdwBS5aQhiwmijc9UaUww6/T
	iZRFC17Kt7I4d//Qzk+HGvCl1K3anXS1DXaNEMsSukTBWqUqnxr8/ehPxkbNprf1TCbn3K2P3/4
	9b99P5VMOj5IwTrc+m2HQGk+4TAqjqm9AgX3IexqWKmMijiNzsYLHJv6txhd+2T9/hRT9JvXceW
	UO+nL8gi3Wn88Felc2CUBj3Cx7CRTHixwOkgYceefFmCG8esXUi3cSXSWSsY+RWrOEI6SfJOkXh
	4cjDwx8G6Xm8j52rkID7+5SKjzlZrEEhLUWZR1faL
X-Received: by 2002:a17:90b:3a0c:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b1b0a0e800mr12479951a91.12.1794927201457;
        Tue, 17 Nov 2026 06:53:21 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm6056636a12.21.2026.11.17.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:53:20 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com
Cc: kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: synchronize worker freeing on vhost-net teardown
Date: Tue, 17 Nov 2026 22:53:14 +0800
Message-Id: <20261117145314.1092372-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

vhost_workers_free() only waits for RCU readers when sync is true.  Both
vhost-net teardown paths pass false, relying on the assumption recorded
when the sync parameter was introduced (5efd97e6f0c7) that "net and scsi
stop their virtqueues before the workers are freed".

That assumption does not hold when a tap queue is detached while the
socket is still attached.  __tun_detach() runs tun_queue_purge() on the
detaching thread, so skb_queue_purge() releases the zerocopy skbs and
vhost_zerocopy_complete() -> vhost_poll_queue() runs there rather than on
the vhost worker.  The vhost_dev_flush() calls in vhost_net_flush() and
vhost_dev_stop() only wait for the vhost workers, so the queueing can
still be in flight when vhost_dev_cleanup() frees the worker, and
vhost_worker_queue() then dereferences freed memory.

Pass sync=true from vhost_net_release() and vhost_net_reset_owner() so a
grace period and a flush are observed before the workers are released,
matching the vsock RESET_OWNER path.  Both are slow paths, and the extra
grace period buys back the races described above.

Testing: QEMU/KVM guest with KASAN and CONFIG_VHOST_NET, zerocopy enabled
via vhost_net.experimental_zcopytx=1.  A second thread detaches one of
the tap queues and frees the queued skb, and vhost_worker_queue() is
delayed with a fault-injection module so that the close() or the
VHOST_RESET_OWNER ioctl completes in between.  The delay only widens an
existing window; the detach, the purge and the teardown are all
unmodified upstream behaviour.

Both teardown paths reproduce the use-after-free on this base, and both
are clean with this change while the injection is still taken.  The same
injection reproduced on the earlier base where the analysis was done.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Test details.  The guest runs a KASAN kernel with vhost_net built in and
zerocopy enabled through vhost_net.experimental_zcopytx=1.  The trigger
attaches a tap queue to a vhost-net socket, queues a zerocopy skb, and
detaches the queue from a second thread while the owning process closes
the vhost fd (or issues VHOST_RESET_OWNER).  The second thread is the one
that reaches vhost_zerocopy_complete() and then vhost_worker_queue().
The fault-injection module resolves vhost_worker_queue.part.0 from
/proc/kallsyms and spins only when the caller is that detaching thread,
which makes the window deterministic; kasan_multi_shot is used so the
remaining reports are not lost.

Results on 666539eecdf4, one run per teardown path: the close path
reports slab-use-after-free in vhost_worker_queue() four times, and the
RESET_OWNER path likewise four times, with the free stack going through
vhost_dev_cleanup() and vhost_dev_reset_owner() respectively.  With this
change both paths complete without a report and the injected hit counter
shows the delay was taken (1 of 5 probes for vhost_worker_queue(),
the other four being callers outside the detaching thread).  A control
run that closes mid-test without the delay is clean.

The same injection reported on three consecutive runs on 776b6be748eb,
which is where the analysis was originally done; the reproduction above
is the confirmation on the base of this patch.
---
 drivers/vhost/net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 4570a4ffbab2..631855064b3d 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1452,7 +1452,7 @@ static int vhost_net_release(struct inode *inode, struct file *f)
 	vhost_net_stop(n, &tx_sock, &rx_sock);
 	vhost_net_flush(n);
 	vhost_dev_stop(&n->dev);
-	vhost_dev_cleanup(&n->dev, false);
+	vhost_dev_cleanup(&n->dev, true);
 	vhost_net_vq_reset(n);
 	if (tx_sock)
 		sockfd_put(tx_sock);
@@ -1661,7 +1661,7 @@ static long vhost_net_reset_owner(struct vhost_net *n)
 	vhost_net_stop(n, &tx_sock, &rx_sock);
 	vhost_net_flush(n);
 	vhost_dev_stop(&n->dev);
-	vhost_dev_reset_owner(&n->dev, umem, false);
+	vhost_dev_reset_owner(&n->dev, umem, true);
 	vhost_net_vq_reset(n);
 done:
 	mutex_unlock(&n->dev.mutex);
-- 
2.34.1


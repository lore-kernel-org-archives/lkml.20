Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785564;
	b=yHQjocDjqHumlU5vDTyrpJoThB65gRAgyB5FJ904I7k+V6F8QF5RXMplG8LX4uj9dcbf
	 sKzzsZaQ08Xz2/uoOWaIWcKWsYNgA8Lld1C26wzvHAwLJ1hxAHwCpEewE+jAWrpHGKz7Z
	 I32bogIpE2L2NXFe5TtllqLDyl1riF9N9Auu72Z70zPqyPj+C1aw7A6qm2gfeXDnwM+1d
	 cQEccfymfbmEcBPF9PoSDWqhlLsVAUkxJVD1qrraANUO0q+ZhAQYNXR30Is/gAHn4r92W
	 X19fzJsz7/U/1W7uRjcEVmI1fWGhSwZnk/J35Zx/X+6CfcWW8rS7tAPUg4NInLHIOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=A+QDxq6UCdJRaYtuHqXjnpqOCcz0MOA82xty3nzNvPo=;
	b=MLBWH6LntMWqcJ+sjrgvLIVoIPnHM14tfd+vfv15HLOTOJWrItKnm27bVr0t+rBMqiIb
	 lAQGy7S2j+9X+X09xJ2cBPHV6repLUbWfZqNCcy3Rtd6osirbyqxV3hdZMoCSnAN2Dp3N
	 4xkygbF/JDdOErKIKuurNJmfn0Q6CjhZyVvEPv1DuaFHvasmGEaCnfrSMyMCS7kfM3rRo
	 +v4W1EB2zWs3ExAvWfIl2Dz/lJfX3fEXJybhl6Ix78J4uv/jQWeEqf6zqUNc2r7vVjztu
	 GLgCxe1ujHIYE5hmAoF5SPpsDmK0124orqkP3lD3GqptVdpkyBiP7UEFWc/964BzmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiO8TqKw;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47A606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D47A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jiO8TqKw
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so450759eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785563; x=1794390363; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+QDxq6UCdJRaYtuHqXjnpqOCcz0MOA82xty3nzNvPo=;
        b=jiO8TqKw9LLU66NAHa4/cUjRPsIGB0ydCcM+uQqe+/1EK+RFwKB+vdweYotyPI31Cm
         b1D1vu6kJ3P18iQ2AGrq9jodj/MQDGKV7EWNA6zNqWbira0Re050uY/BETGPEo5D71I+
         lNiyxjprm4nASXkYuNcUm6eAx7vNTFyqqLNbbvKrdsU4Z1WaZzvwjNs6Bd1NggPaimYx
         Q9vXwotUmTRcA4+AdYwm6j0U0Ey2esoBHsQtWDkb5ryzMRY9g5PouYFG3UsUlXAtU6dH
         7b82uBkEDNfSK122T5e5eIr0hYUvw9TrjOJkTYb1HhW60QLP2Roesoi8zW1yPekpzUPM
         UZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785563; x=1794390363;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+QDxq6UCdJRaYtuHqXjnpqOCcz0MOA82xty3nzNvPo=;
        b=WIH88+luzSMPQ8aTpzst6rcB8qbspPYdXWLacheTtMo3EKyPs1nJRakPfF648aQ7U2
         XGzLSX99YCu+vEoEunZVBpb+i0gqHKAMtRTITgs0h0K752tSlSIp3BXJQAqUHfz4fH5C
         liv2cP0bYnZN5cMh3hv/kNyeAr8IyGxhexdvXjGSnYlUh9s9mRr7boooD7uBYMT5OXHa
         UG7W7NwXuD20GuFkY5zIICG1urxneJptuNtm5nUBEYsDHZ4hnmL1rFP+VCmom5wMjUfd
         nuhwnZ4LZWM7XkVjsXBmJcK1qsOW6vxy9YBT3BG6sBtYXI6IUAXLmiaWA/2JwQEvJayG
         egFw==
X-Forwarded-Encrypted: i=1; AKwUvBzKjyJkyFA1o0qVVE0KGaPacH8cGq6sH4j2SxLk6YgWmjxw20DZ3v9hdUR1aUefa9Maf5bemEMxUVSeRwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lYeHfy/scnXIUqA3apDnDJ6i2CEAJ/MsAeW9+U8zzE73qqXpn
	FVgVnaCRBgSKl9AbWeVmYUECt+4npOexfsg34tkRN/extDj6FsdyTt80
X-Gm-Gg: AYBFou3kzcesV389vDk0O2C3dQJi38FShAMqa1S3KjZ2lxYTgVV8WJp9qcCOCAjcZKs
	ur1bF4Lqqo1AJnosJ3rReWyPdUD/7iWYxNcBfGTkqeiEXoQ6P2NnGikXCrTYN3gcKkd6HWbDgj+
	dn2l1tJzLXc9w/Redlh8GtkSTyCpMsmtVRoss/6w3GkZIZRpsAQDQOLecW4Nj+XXJO/2tn/tM8g
	ezlP6W70DHeg14dvHyw59ex9WUYrU6Eiajzs7tHHvITMpRyEsdb1htBxg9btXfJursY3eYIaHdk
	PRcWc4LT8PR3ceajlY0MRSPGypuftby3XhoCD7wiHyGtbdod6W9IhMWnlgmhva1q/m/AGrRRj3Z
	IrAiurCLYUYQ3TeX1Nxay8c2K2bIA5ovwRhmrW/6D32/b3RcLzKFyGqsYU4lBSRWz2z0/kLd/30
	+dYx5aKmqakKQXRxQM6/Tin4+jc2YyRN16zvsXYq/DFa4Zg7/D7DBEFlOKTONEs0ddHPlOVhhwF
	zjYlGBd5RNblEKZsVC1fyimFWvLNr8cvWYrN3IWfucKxupCgZ7Ol0jY+PkI6tp+460ksyajKGwL
	DWjyBKKb38xKrB+KZKwDjibEErc1GYBi2rRyGN1Suy+HLnnNoD7k3qwvKCxzSBijqII=
X-Received: by 2002:a05:7301:9e43:b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-36ca2cb6d90mr3896987eec.8.1793785562810;
        Wed, 04 Nov 2026 01:46:02 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3958746sm6179404eec.22.2026.11.04.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:46:02 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:45:39 +0800
Subject: [PATCH] virtio_console: synchronize HVC polling with port removal
Message-ID: <179378553951.72222.12851179500568566393@gmail.com>
To: amit@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: rusty@rustcorp.com.au, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

in_intr() may call hvc_poll() after dropping inbuf_lock. At the same
time, a hot-unplug event can remove and free the HVC adapter without
waiting for an in-flight poll. The interrupt callback can then
access freed adapter memory.

Read the HVC pointer inside an RCU read-side critical section and
publish NULL before removing the adapter. Wait for existing RCU
readers before calling hvc_remove(), without holding inbuf_lock
across hvc_poll(), since the HVC operations may take that lock.

The race was reproduced under KASAN with QEMU virtio-serial and
multiple interrupt vectors while host-initiated hot-unplug raced
with a data-queue interrupt. The same injection-assisted sequence
completed without a report after the change.

Fixes: 203baab8ba319 ("virtio: console: Introduce function to hand off data from host to readers")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/char/virtio_console.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 019bcae81af5c..a3ee4af106d17 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1551,10 +1551,22 @@ static void unplug_port(struct port *port)
 	spin_unlock_irq(&port->inbuf_lock);
 
 	if (is_console_port(port)) {
+		struct hvc_struct *cons_hvc = port->cons.hvc;
+
 		spin_lock_irq(&pdrvdata_lock);
 		list_del(&port->cons.list);
 		spin_unlock_irq(&pdrvdata_lock);
-		hvc_remove(port->cons.hvc);
+
+		/*
+		 * See in_intr(): a data vq callback may be running
+		 * hvc_poll() on the adapter. Publish a NULL adapter so no
+		 * new poll can start, wait for in-flight ones, and only
+		 * then remove the adapter.
+		 */
+		rcu_assign_pointer(port->cons.hvc, NULL);
+		synchronize_rcu();
+
+		hvc_remove(cons_hvc);
 		ida_free(&vtermno_ida, port->cons.vtermno);
 	}
 
@@ -1782,6 +1794,7 @@ static void out_intr(struct virtqueue *vq)
 static void in_intr(struct virtqueue *vq)
 {
 	struct port *port;
+	struct hvc_struct *cons_hvc;
 	unsigned long flags;
 
 	port = find_port_by_vq(vq->vdev->priv, vq);
@@ -1820,8 +1833,19 @@ static void in_intr(struct virtqueue *vq)
 
 	wake_up_interruptible(&port->waitqueue);
 
-	if (is_console_port(port) && hvc_poll(port->cons.hvc))
+	/*
+	 * The vq callback calls hvc_poll() on the hvc adapter, which
+	 * hvc_remove() frees on unplug without any lock shared with this
+	 * hard-IRQ path (calling hvc_poll() with port->inbuf_lock held
+	 * would deadlock: the hvc ops take that lock themselves). Take an
+	 * RCU read lock across the poll and have the unplug path NULL out
+	 * the adapter and wait for in-flight callbacks before removing it.
+	 */
+	rcu_read_lock();
+	cons_hvc = rcu_dereference(port->cons.hvc);
+	if (cons_hvc && hvc_poll(cons_hvc))
 		hvc_kick();
+	rcu_read_unlock();
 
 	kref_put(&port->kref, remove_port);
 }
-- 
2.34.1


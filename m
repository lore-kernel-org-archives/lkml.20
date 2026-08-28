Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C903BE146;
	Fri, 28 Aug 2026 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913113; cv=none; b=WiAGHwdfe6JygUXS2QsvN3KG0MwPydQlUavt5RYuZwAA+QGF7IsrzqoZeoa0GkZcKkw+FVew9hnJnsT4ZtS8+fhaHq1Zc/DO7cEcGo6tiFkv8QgjaTur3v3kQbdT1ePfopfbfJlXRnT+S1wHPL77q212MFIHjv/NemPJ83ma9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913113; c=relaxed/simple;
	bh=tycX6rDGVDnqUzXGzft8UrFrEKQ7OK0AvtUifPdMAF0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kjhQ4cHMvIY9fu6Sb6HzbZTyfLDjclwRY8Ez+/9rzKAaNIbKAZF3uvxOIdVplXG44ys1cmWbNEX9Ik5MkwThP7N2i/NjZiKm89aJlI1Wyp2FtahiD9Iq0sVCbygy4RvOFFMnfDxV9z47AsgAxVkrqycNMdNJcragFBrvUJOY1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ctmxte7V; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ctmxte7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I4
	N8gzh34TI4s9xtonIahAOEOyG3JFBd/5w0IEWxzdw=; b=ctmxte7VTqPZfHLDUH
	qSPlOfreNlz3vxDreQ9CQ7w4dognsWsVp83ezPsYhkSNh4aF3tvtRLKwfkaLP37t
	+LvNB1+AjJRcyctC4dkIQrHrkWNAMhJ30eyhcgs58+GBAaHN2pSbM9DSX7ZdT89C
	53RzD6hQpvLn+zhaQPjjvQhSM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnfhtxY5FqOxmtOg--.5497S2;
	Fri, 28 Aug 2026 18:31:13 +0800 (CST)
From: oushixiong1025@163.com
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] usb: mtu3: fix double dereference in mtu3_log_ep trace event
Date: Fri, 28 Aug 2026 18:31:10 +0800
Message-Id: <20260828103110.893817-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAnfhtxY5FqOxmtOg--.5497S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw15CFyxXr1kWFW5Wr4Durg_yoW5Gr1fpa
	yfuF9rKF4ktwsFvF4kZ34FyFZ0vrWFvFyrKryxu3s5Z3WS9FnxtFs7tryF9ryqkrWrCFy7
	JF1qkryrX3Wj937anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKXd8UUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-hHzA2qRY3FYVQAA37

From: Shixiong Ou <oushixiong@kylinos.cn>

TP_printk() dereferences the gpd_ring pointer stored in the entry
via &__entry->gpd_ring->dma, which may point to freed memory when
the trace record is read later. Store the dma address in the entry
and print that instead.

This is detected at boot:

  TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
  ------------[ cut here ]------------
  Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
  WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x138/0x140, CPU#0: swapper/0/0
  Call trace:
   test_double_dereference+0x138/0x140 (P)
   trace_event_raw_init+0x350/0x5b8
   event_init+0x38/0xb0
   trace_event_init+0xf4/0x5c8
   trace_init+0x30/0x6b8
   start_kernel+0x4a4/0x8d8
   __primary_switched+0x88/0x98
  TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
  TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d635..041e730c88a6 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t, gpd_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_dma = mep->gpd_ring.dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, &__entry->gpd_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
-- 
2.25.1

No virus found
		Checked by Hillstone Network AntiVirus


Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055453F660F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511029; cv=none; b=EBMoA4UpzG/uteYkkpCPpoOiyMoSpq5ssbPRgBV+CGZNEPvYzycNhsHMQ2VvBXx4vgXJtpkLJQ9Zeh3EoLwEV3u+sp9vhc4f8ISIQnF4fo7nx0SifIGGL++mkbO+f/YMrr1NNnYipowijQeK23lfDMnf9Xy4LPaJDt6SCNcMK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511029; c=relaxed/simple;
	bh=JJMMnKZHXY1iC3eok1/pk7SBZ77ghM4ADzyKP/1aM8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=OtZgvdnGIQU3g9ppaYCItaogWx5/aFXER1X80cTTLKL6YMzi+i8GrGsEPJ8Wt3fGd6t4t5GusmmTWL4nvZ4yfB0T/ZMja4z7rXl/QTQXYbCPFGpWUNoHi93u+lu66NyKTQ35TFDTmRBlBL+N9yc20sWt+WCP8MY4hnPm+0kKHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OcL5ju4A; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OcL5ju4A"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260904083658euoutp0137f511843e0fd58b85aa649daf8179c7~SEUuNC7TT3013030130euoutp01I
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260904083658euoutp0137f511843e0fd58b85aa649daf8179c7~SEUuNC7TT3013030130euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788511018;
	bh=9PIL/kPnMxq3P5cVAkbNzmiNq+J34/FFMbTiuCsg88Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OcL5ju4AonUTzK9Ge087FQnJstUcn0MPleQ4C5m1FRsL1xv6MKilFPklLZISGAADY
	 4gpQaeGD9E+gXstRDv42+nA4MUmPAU/kNIF7+fyCbT8qb+cNsZM6wa/Nkp/BfymUcQ
	 yxul+lYmgUZ5emXDZtoZ8dRXV7mfKcON9pdTTr7s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea~SEUt8Oz_y2337323373eucas1p1w;
	Fri,  4 Sep 2026 08:36:57 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260904083657eusmtip28ebc646c943dfc2d88fd5b5d1282e30b~SEUtgfgC_1075010750eusmtip2c;
	Fri,  4 Sep 2026 08:36:57 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2] USB: mtu3: tracing: fix pointers dereferencing
Date: Fri,  4 Sep 2026 10:36:43 +0200
Message-ID: <20260904083644.2010063-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
X-EPHeader: CA
X-CMS-RootMailID: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
References: <CGME20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea@eucas1p1.samsung.com>

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") added a warning when printing an event dereferences
a pointer, because it might be already freed at that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing the DMA address in the event structure to avoid dereferencing
gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- fixed typos in commit description

v1: https://lore.kernel.org/all/20260804100531.88576-1-m.szyprowski@samsung.com/
---
 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d635..b24c6411a8cf 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t, gpd_ring_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_ring_dma = __entry->gpd_ring->dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, &__entry->gpd_ring_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349278;
	b=K9V7y5ywh80mo4BB8bwjztlodE+vHv0Qt4HhpBa4I2v6zL1AECOy3GYmVy2BLxV1+GPl
	 w1ZxezDcyalICxWmuzNRZgbgqmNlMosnm9hr2iy5T1xJnGGH1NC0tVE7MxdLzAEEoZtIO
	 w28E8/tbnmpnA3mH+LTs26VP5lpm5sdDsBrIKyRyJ5BUr80FgwM8LT4cvccouv9GNIHVM
	 /AuDi2CUiWqPm5udtd1VIasLyZA/6Dz6CJQOtofYQvt4WAJqFkHGNiMGFjGTvwmBZiUY1
	 cgrnsJq1r5pSdLUF38H8sk35mWD3T3z8c7dfuE5UarU4FkvSPmJMNwcMFm1Sli844nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349278;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=M1YFIP1momfayTo5BQCGcGIZ358SmM7AYY10VJeYGMA=;
	b=QMa8ew59UyXQbB7wcXpHKQ289sxdhc3Nw3xRizTC/LiRlHHR2qDu+59ZHnkK8jTpvZKV
	 dtQ4INVF7VDbDCzssdJU90k3Dlwlwhr+m3FzwzX3jO8WsUgReSGcqX8g8btu/6Qre9Tjc
	 dohvJr71SgI+Nj+g2y2GYCVSkuzbphlOBO76rp8jekQXlWm5UrklBLpoGa5/hEfprmlvl
	 POrCjSMyTkapw4NHRQ2pBVsG5yzSQvuQIEqwBLXfTNhFy62sIPtKTVb44vViLllh6h9Qr
	 /QZH1fWD6wMv1LXQXK1Yu/Qc5nh8E8OjMTT79+JfOrz/caI6inCVFu7jXoyoi/iIoFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FGrASAKh;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8D606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C8D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FGrASAKh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=M1
	YFIP1momfayTo5BQCGcGIZ358SmM7AYY10VJeYGMA=; b=FGrASAKhoFjTvfxLMT
	i3GP66lHj4rMVS2psQz1PJc2yH9/Ox8KXkblBjd4kNzs4YfcH5K+zQZgUkOqXK1h
	5aO6BnTKaBX7/uN+XuXYWYvH1g4zPWQkgdszX2hdU0KCAN+QTm/SqcijWGI6c1zQ
	ov7QOQnYgv6UGzpGL1djF8dsE=
Received: from neo-TianYi510Pro-15ICK.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXRXl+VuRqCoKSCg--.15983S3;
	Fri, 30 Oct 2026 16:34:10 +0800 (CST)
From: liuqiangneo@163.com
To: "Michael S . Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	Qiang Liu <liuqiang@kylinos.cn>
Subject: [PATCH v2 1/3] virtio_balloon: add tracepoints for inflate and deflate operations
Date: Fri, 30 Oct 2026 16:33:58 +0800
Message-ID: <20261030083400.66005-2-liuqiangneo@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030083400.66005-1-liuqiangneo@163.com>
References: <20261030083400.66005-1-liuqiangneo@163.com>
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
X-CM-TRANSID:PCgvCgAXRXl+VuRqCoKSCg--.15983S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFyUWF1rGw1xKFWxCFWfZrb_yoW7Ar4UpF
	s7Arn0kw47XrW7Ka4fCF4rWrsxZwn7CFWxtFyaga4UCF43JFZrKr1DtrWDJF4UAry0grnI
	ga9xXF1DCan0vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTKZJUUUUU=
X-CM-SenderInfo: 5olx1xxdqj0vrr6rljoofrz/xtbC4AKJ6mrkVoLWYQAA3s

From: Qiang Liu <liuqiang@kylinos.cn>

When the guest responds unexpectedly to balloon resize requests,
the actual applied delta cannot be observed from the guest side.

Add a "virtio_balloon" trace system with three tracepoints:
config_change (target / resulting size / delta), and
inflate and deflate (requested / applied page units / resulting size).

Signed-off-by: Qiang Liu <liuqiang@kylinos.cn>
---
 MAINTAINERS                           |  1 +
 drivers/virtio/virtio_balloon.c       | 13 ++++
 include/trace/events/virtio_balloon.h | 87 +++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 include/trace/events/virtio_balloon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd872..0ef6f34471de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29590,6 +29590,7 @@ M:	David Hildenbrand <david@kernel.org>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
+F:	include/trace/events/virtio_balloon.h
 F:	include/uapi/linux/virtio_balloon.h
 
 VIRTIO BLOCK AND SCSI DRIVERS
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index ab3e3d887e00..2d0b16383661 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -19,6 +19,8 @@
 #include <linux/wait.h>
 #include <linux/mm.h>
 #include <linux/page_reporting.h>
+#define CREATE_TRACE_POINTS
+#include <trace/events/virtio_balloon.h>
 
 /*
  * Balloon device works in 4K page units.  So each page is pointed to by
@@ -285,6 +287,8 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 	/* Did we get any? */
 	if (vb->num_pfns != 0)
 		tell_host(vb, vb->inflate_vq);
+
+	trace_virtio_balloon_inflate(num, num_allocated_pages, vb->num_pages);
 	mutex_unlock(&vb->balloon_lock);
 
 	return num_allocated_pages;
@@ -333,6 +337,8 @@ static unsigned int leak_balloon(struct virtio_balloon *vb, size_t num)
 	if (vb->num_pfns != 0)
 		tell_host(vb, vb->deflate_vq);
 	release_pages_balloon(vb, &pages);
+
+	trace_virtio_balloon_deflate(num, num_freed_pages, vb->num_pages);
 	mutex_unlock(&vb->balloon_lock);
 	return num_freed_pages;
 }
@@ -567,11 +573,18 @@ static void update_balloon_size_func(struct work_struct *work)
 	diff = towards_target(vb);
 
 	if (diff) {
+		unsigned long target = vb->num_pages + diff;
+		unsigned long before = vb->num_pages;
+
 		if (diff > 0)
 			diff -= fill_balloon(vb, diff);
 		else
 			diff += leak_balloon(vb, -diff);
 		update_balloon_size(vb);
+
+		trace_virtio_balloon_config_change(target, vb->num_pages,
+						   (long)vb->num_pages -
+						   (long)before);
 	}
 
 	if (diff)
diff --git a/include/trace/events/virtio_balloon.h b/include/trace/events/virtio_balloon.h
new file mode 100644
index 000000000000..f733fc360d8b
--- /dev/null
+++ b/include/trace/events/virtio_balloon.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM virtio_balloon
+
+#if !defined(_TRACE_VIRTIO_BALLOON_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_VIRTIO_BALLOON_H
+
+#include <linux/tracepoint.h>
+
+/*
+ * All page counts reported by these events are in balloon page units, i.e.
+ * the 4K units the virtio balloon device operates on.  Divide by
+ * VIRTIO_BALLOON_PAGES_PER_PAGE to obtain the number of guest pages.
+ */
+
+TRACE_EVENT(virtio_balloon_config_change,
+
+	TP_PROTO(unsigned long target, unsigned long num_pages, long delta),
+
+	TP_ARGS(target, num_pages, delta),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, target)
+		__field(unsigned long, num_pages)
+		__field(long, delta)
+	),
+
+	TP_fast_assign(
+		__entry->target = target;
+		__entry->num_pages = num_pages;
+		__entry->delta = delta;
+	),
+
+	TP_printk("target=%lu num_pages=%lu delta=%ld",
+		  __entry->target, __entry->num_pages, __entry->delta)
+);
+
+TRACE_EVENT(virtio_balloon_inflate,
+
+	TP_PROTO(unsigned long requested, unsigned long inflated,
+		 unsigned long num_pages),
+
+	TP_ARGS(requested, inflated, num_pages),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, requested)
+		__field(unsigned long, inflated)
+		__field(unsigned long, num_pages)
+	),
+
+	TP_fast_assign(
+		__entry->requested = requested;
+		__entry->inflated = inflated;
+		__entry->num_pages = num_pages;
+	),
+
+	TP_printk("requested=%lu inflated=%lu num_pages=%lu",
+		  __entry->requested, __entry->inflated, __entry->num_pages)
+);
+
+TRACE_EVENT(virtio_balloon_deflate,
+
+	TP_PROTO(unsigned long requested, unsigned long deflated,
+		 unsigned long num_pages),
+
+	TP_ARGS(requested, deflated, num_pages),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, requested)
+		__field(unsigned long, deflated)
+		__field(unsigned long, num_pages)
+	),
+
+	TP_fast_assign(
+		__entry->requested = requested;
+		__entry->deflated = deflated;
+		__entry->num_pages = num_pages;
+	),
+
+	TP_printk("requested=%lu deflated=%lu num_pages=%lu",
+		  __entry->requested, __entry->deflated, __entry->num_pages)
+);
+
+#endif /* _TRACE_VIRTIO_BALLOON_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.43.0


No virus found
		Checked by Hillstone Network AntiVirus


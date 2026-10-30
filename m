Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329166;
	b=zFqfooZ5yUBMO1bBXMiHstYOggeTP1t2872/cmNZBO27g69h948uOo7dTFILYBy8G0Be
	 2fPI0AWK+b7TpVXU/H0s6mfIA5PogXWzNkluNMYKbRn2tfWxdWoivvSH8LLVXoA6hXKSW
	 qQ6lLLSXwwP0AH8m+YrLbEMlM9zfcLiL3U1+6keyEWTEFehi2hnVkbAGEfiXUhlxofT8j
	 Fg6j1S2ES9l2EndDGE8zTpsWqgE3SAq5Rb2ytLciKeLQY8QPqWfBfNEwUgeVjU2uela8V
	 2qbljjyznq1T0xCkxqWVyVxYKu1rpKs+eOb0QPI9ICwv+BS2XaaKCcR6kyQTKJmDT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329166;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=62mg+3Z40mHfhb9shiM2QUi4pmbWPeUl6R64ef1iEYE=;
	b=f8OZo6kCCiG2BuxHAvs8mOyVRdoM4tBIA0a57ScLQd662ZXTzGd9hHqeKWUqQZTVZk/t
	 DbidJwfXYfJRRyzZ3acqnE9arow7OQdzNNB2t4kGb+iVRRPlbtDYqp2ryUAJe2+07lA3+
	 8CyJTLS890SNEnJkFokAA0ibViLLY4vKsIVK/qwNmtwYRwYBpcI3R7fngH2qhaM+rLhSg
	 r7C2p47S1Er9ylgavYH2olr2aw9mlsSZkoLkoyeSs93oe5sLBgxeD6BanNsljBv09t5/4
	 /SWHxoEU8dFlQ2T2UvmhG/xvQ1vqD896ARAck4/X7XhyvO2hsbdgKjHDdM5xn/VuyrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XEiisPSp;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE84606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XEiisPSp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=62
	mg+3Z40mHfhb9shiM2QUi4pmbWPeUl6R64ef1iEYE=; b=XEiisPSpy+oic6oPPA
	MkCa7MZobswbSGkW3VQGoaf9vSJkTzMlGOnQ43olhu67ogk2yQXQqAf2iOXIFXvj
	Bx4RWJX31kkQ1+vy0Pmxy1uLwZLYKfgB6DH8/PDagZMjcawPLoPpeT4/ODhyA4dH
	C5qxF/IeW8FQ8si2fZFwS71O0=
Received: from neo-TianYi510Pro-15ICK.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnZfjfB+RqfTvxCg--.40090S5;
	Fri, 30 Oct 2026 10:58:47 +0800 (CST)
From: liuqiangneo@163.com
To: "Michael S . Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	Qiang Liu <liuqiang@kylinos.cn>
Subject: [PATCH 3/3] virtio_balloon: add tracepoints for free page hinting and migration
Date: Fri, 30 Oct 2026 10:58:34 +0800
Message-ID: <20261030025834.19160-4-liuqiangneo@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030025834.19160-1-liuqiangneo@163.com>
References: <20261030025834.19160-1-liuqiangneo@163.com>
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
X-CM-TRANSID:PSgvCgCnZfjfB+RqfTvxCg--.40090S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFyrZFy7JF45GrWxGw43GFg_yoWrAr48pa
	n2ywn8K3yUXr47ZayfJFW8Ww45u3s2kFWfJFW2gryUCF43JF92gFZrtr1DAFW5Ar10yrna
	vF4IqFWUC3WkuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jldgJUUUUU=
X-CM-SenderInfo: 5olx1xxdqj0vrr6rljoofrz/xtbC-AfOMGrkB+egsAAA37

From: Qiang Liu <liuqiang@kylinos.cn>

Free page hint requests cannot be traced, and migration only
provides summary stats. Lock contention causing migration abort
cannot be distinguished, making these two flows hard to debug.

Add tracepoints to record host hint commands, leftover hint blocks
and balloon_lock -EAGAIN migration failures.

Signed-off-by: Qiang Liu <liuqiang@kylinos.cn>
---
 drivers/virtio/virtio_balloon.c       | 11 +++++-
 include/trace/events/virtio_balloon.h | 48 +++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index c4fdc6815b41..faf78c639f3c 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -803,6 +803,7 @@ static void virtio_balloon_report_free_page(struct virtio_balloon *vb)
 {
 	int err;
 	struct device *dev = &vb->vdev->dev;
+	unsigned int cmd_id = virtio_balloon_cmd_id_received(vb);
 
 	/* Start by sending the received cmd id to host with an outbuf. */
 	err = send_cmd_id_start(vb);
@@ -817,6 +818,9 @@ static void virtio_balloon_report_free_page(struct virtio_balloon *vb)
 	err = send_cmd_id_stop(vb);
 	if (unlikely(err))
 		dev_err(dev, "Failed to send a stop id, err = %d\n", err);
+
+	trace_virtio_balloon_free_page_hint(cmd_id,
+					    READ_ONCE(vb->num_free_page_blocks));
 }
 
 static void report_free_page_func(struct work_struct *work)
@@ -869,8 +873,11 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	 * recursion in the case it ends up triggering memory compaction
 	 * while it is attempting to inflate the ballon.
 	 */
-	if (!mutex_trylock(&vb->balloon_lock))
+	if (!mutex_trylock(&vb->balloon_lock)) {
+		trace_virtio_balloon_migrate(page_to_pfn(page),
+					     page_to_pfn(newpage), -EAGAIN);
 		return -EAGAIN;
+	}
 
 	/* balloon's page migration 1st step  -- inflate "newpage" */
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
@@ -883,6 +890,8 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	tell_host(vb, vb->deflate_vq);
 
 	mutex_unlock(&vb->balloon_lock);
+
+	trace_virtio_balloon_migrate(page_to_pfn(page), page_to_pfn(newpage), 0);
 	return 0;
 }
 #endif /* CONFIG_BALLOON_MIGRATION */
diff --git a/include/trace/events/virtio_balloon.h b/include/trace/events/virtio_balloon.h
index 559deb997e88..c29f833fa188 100644
--- a/include/trace/events/virtio_balloon.h
+++ b/include/trace/events/virtio_balloon.h
@@ -103,6 +103,54 @@ TRACE_EVENT(virtio_balloon_host_ack,
 		  __get_str(vq_name), __entry->num_pfns, __entry->latency_ns)
 );
 
+TRACE_EVENT(virtio_balloon_free_page_hint,
+
+	/*
+	 * outstanding_blocks is the number of hint blocks still owned by the
+	 * balloon (handed to the host but not yet reclaimed via a DONE/STOP
+	 * command) at the end of the reporting round.  A high value means the
+	 * host did not fully drain the round.
+	 */
+	TP_PROTO(u32 cmd_id, unsigned long outstanding_blocks),
+
+	TP_ARGS(cmd_id, outstanding_blocks),
+
+	TP_STRUCT__entry(
+		__field(u32, cmd_id)
+		__field(unsigned long, outstanding_blocks)
+	),
+
+	TP_fast_assign(
+		__entry->cmd_id = cmd_id;
+		__entry->outstanding_blocks = outstanding_blocks;
+	),
+
+	TP_printk("cmd_id=%u outstanding_blocks=%lu",
+		  __entry->cmd_id, __entry->outstanding_blocks)
+);
+
+TRACE_EVENT(virtio_balloon_migrate,
+
+	TP_PROTO(unsigned long old_pfn, unsigned long new_pfn, long ret),
+
+	TP_ARGS(old_pfn, new_pfn, ret),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, old_pfn)
+		__field(unsigned long, new_pfn)
+		__field(long, ret)
+	),
+
+	TP_fast_assign(
+		__entry->old_pfn = old_pfn;
+		__entry->new_pfn = new_pfn;
+		__entry->ret = ret;
+	),
+
+	TP_printk("old_pfn=0x%lx new_pfn=0x%lx ret=%ld",
+		  __entry->old_pfn, __entry->new_pfn, __entry->ret)
+);
+
 #endif /* _TRACE_VIRTIO_BALLOON_H */
 
 /* This part must be outside protection */
-- 
2.43.0


No virus found
		Checked by Hillstone Network AntiVirus


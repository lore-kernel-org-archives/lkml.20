Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221593;
	b=3748aNFQx9xXAqHs9tLyaCx4Z/UXEnItCoBPuebnzDnisA243qnR7iDQCAWHNW5S/h9i
	 tQrDBVUycxg6DqbRQaAWwxBEVcAERMJqr/iOXEb3kr9NTNJRRJfHYzOq+Xl/XFVzrUyB1
	 a6EWBqywRAFADQcflBYU1zd3VHfsC6GpmHpoxuf4MYTyHMhC14WHjB9wjqrmoTuHUZFne
	 JrOiOx3oKX2PYOocXmzBoHep8UBjVYvoPDP/TMFZCHhTrwY5JKfTzeS/Q/gL+fKcj81Hn
	 9k828VJDCFSZQme+Mk9/D0QDUNAVCUAAaMwTxEWUi/QhcfR6+EUN+KLBr4XRybu7umA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DvUQ95Qmafx/GUKCgwM1Wq8Fj7AkLqXVLQmPGo9tiOM=;
	b=N3g6HpjzMr6ZR5jJDqzUWg77Q5Bi1Pyb+Xh0NnrrxeL5oiX+jEM8O4JVq59Pb0wvhd4s
	 SEqG/WsPce6JEFH/KscoTFXLnjrRY4lF84wliMtzRpEQpGCUqEvQ/9MP4hyYS6Ky0+XtO
	 YmPmR+Z9bl2ln8IezwoXQGkFON9WUW/443mr9+ByY/HC7B+jGSdY35pKFtw8Cixwn4k3t
	 iNCJd/Z07/BxuoGjW8wt/M3SSZlS2bidUlXSA49+Loj5f6Mx45Ts0xUC0mORAAriYJKWV
	 P/YdrL7z/fWOLzt+YTbKmbKIbi2UWt7hb4pMqvt5PUoqoNJJq0IxxC5540/XpZLg6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=JbOG2UYu;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ACA606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71ACA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=JbOG2UYu
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b1ce85287aso654923c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794221593; x=1794826393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvUQ95Qmafx/GUKCgwM1Wq8Fj7AkLqXVLQmPGo9tiOM=;
        b=JbOG2UYu1aPGgNyb7/u4cOaEroeWMgwhVhqZQJKSvCrjB5akVUv1Y3+owXoNoX6qas
         Mx8TlG5OoeLOGPgXCli/gibKdC6truSuK87hssu8eqIVhr8kwJnqjxtStphxQKpZXcQn
         HK7TsEd2gGEJ5bOLVq2FS0/mSZSCqwulxKGSuKQUAgMw9fiGEnuq2aaDOofubA0VyD23
         vcAcH5904tJKM9acyAn/af/IxmDvcKeWkalXMjbUF589IFrpNxZ8sJUDHFG53eZCb671
         e8jCjfc8IYKqnY8AYUUEcBeQ1gUlIJXw9y8LjgmmFC6MJZJLSCS1zJCamLDtIUXKBwbV
         qbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221593; x=1794826393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvUQ95Qmafx/GUKCgwM1Wq8Fj7AkLqXVLQmPGo9tiOM=;
        b=OdtElaBGPk7gr0cxcycyQ3+C16lYC2vhro0jXDai2f7GXYHx47doOiVEQmbTyP2J4/
         sPB9ktJwnh3Lnf3i5bfdl2q6gP3PeDUQIxUXqCJ34GCqzGZJDmZCFp+t7YIulXnk3WQ5
         AeajZ19xVpujFqkkYLtdbFwcTfB54nX5e3dz2YZrznezEJonxo+y3vpiDiZe8TCDMSQf
         hi7lI9Kb58wYVM1XdFyWcuHbrnWA7bTONq7PaLwY0UCxVbhXlkbhq36fsQuL+CEPpuka
         n8A5nyukOFodAitp3mjqikCX2Bn5D00rsyOPmoXDVZOgBAKX+ZHEPYlJqSPszVWGSVzF
         DVXg==
X-Forwarded-Encrypted: i=1; AL+hErHYQplQlad/Jd8Ur66+pjOh4O6w0vGJ8Zoi21LE7kH9Ozm8HPEuvZdANT4WSs/lqtHAKKE+4tUO0fg8ysc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQYoKJRWQOwKHUhFsYp0CzrI23gEx7xkLlXOWSevoEJNUuRFF
	py62+S+6udaqbn4Kp4Yye7YKP5Cj5WQb6QnsR5enTC7zkNIoVYI97hy+TdCCAjAVf/6ZQzxkAJn
	6SwA=
X-Gm-Gg: AYBFou0KWX8m1lABf9oGjQ6ZVfYDgC2yKGXl3IjbuVGIkEi79mLcp4HxPtoNVWlmnMb
	dAyCWluo51P0jp3wOyIH95QYNS3H5XXi9/QQSxlf14Y90YUmZF+GDiz5Hc5EOMffqHX/w8cjvBw
	qelB/t3ByworDRRItGD0pq9X61mrDB3H8JpsXucp62xRw+rswxP+ALSIEsXLwFKuRR2z+RthrkL
	VJ582M8i0JCjyIHZvjoBrZyM71e+TRz5LHfMYak++VFB6PIkwX4kvWe6+tZI2Vsh/3YqDIEEz+G
	RXBlybpjGE2yH6RFdu9R1Sb3RObSHJPmgjMIpm3dqEkQVSpSKjR4Jz8hEGpKOhdnOTW0RaAfQam
	YTAz1fH8aDKu33imrp7/PObqLOnOhOt68Yx5j21B9ANdbv18kuaiAwN8G2La0L9IhAVdDQvSZe1
	Uazd9PTnEc4Ll6p9rpYapUUiduLV/ial6QD9OAWT/shvKr+uxPea6dP3rF8IKhrkHMTTdCTfszp
	zFdwMyq2w1/5b1YgsOqC4XwHZpfhfnmdSLcshPQ6gdRlcqv6zeYcPOz8DhVFAmoyijBp3YD8m5w
	djAupjtjeqltOMgQrsMFIV3I+DufvJac/BWJXaA=
X-Received: by 2002:a05:7022:ec02:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b39fe307d9mr6849877c88.5.1794221592339;
        Mon, 09 Nov 2026 02:53:12 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm12228744c88.14.2026.11.09.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:53:12 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	Chirantan Ekbote <chirantan@chromium.org>,
	Greg Kurz <groug@kaod.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 5/5] 9p/virtio: keep zero-copy buffers until the device returns them
Date: Mon,  9 Nov 2026 19:52:51 +0900
Message-ID: <20261109105251.2545764-6-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
References: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
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

When a fatal signal ends the wait of p9_virtio_zc_request() while the
device still holds the request, the payload pages are released, and
p9_client_zc_rpc() returns to its caller once the RFLUSH arrives. Since
the caller may free the buffers, a misbehaving device can answer the
request after the RFLUSH and write the reply into freed memory. With the
payload bounced through swiotlb, the guest itself copies the reply into
the freed memory when req_done() unmaps the returned buffers:

  BUG: KASAN: use-after-free in swiotlb_bounce+0x236/0x270
  Write of size 4080 at addr ffff888004800010 by task swapper/1/0
  Call Trace:
   swiotlb_bounce+0x236/0x270
   req_done+0xb2/0x280

Fix this by releasing the pages in req_done() once the device returns
the request, when the wait ends without a reply. req_done() can find the
pages only through the request, so the page arrays, their page counts
and need_drop are gathered into struct p9_zc_pages allocated for each
zero-copy request. p9_client_zc_rpc() now waits until the device returns
the request, since the caller may reuse or free the buffers after
p9_client_zc_rpc() returns.

This patch is assisted by Claude Opus 5.5.

Fixes: abfa034e4b8e ("fs/9p: Update zero-copy implementation in 9p")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 include/net/9p/client.h |   6 +++
 net/9p/client.c         |   3 ++
 net/9p/trans_virtio.c   | 109 +++++++++++++++++++++++++++++-----------
 3 files changed, 90 insertions(+), 28 deletions(-)

diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index e4e5cb102fb18..8f9074e69c54a 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -71,6 +71,8 @@ enum p9_req_status_t {
 	REQ_STATUS_ERROR,
 };
 
+struct p9_zc_pages;
+
 /**
  * struct p9_req_t - request slots
  * @status: status of this request slot
@@ -79,6 +81,9 @@ enum p9_req_status_t {
  * @tc: the request fcall structure
  * @rc: the response fcall structure
  * @req_list: link for higher level objects to chain requests
+ * @zc_pages: the zero-copy payload pages, set by the transport while the
+ *            device may access them and cleared with a wakeup on @wq when
+ *            the device returns them
  */
 struct p9_req_t {
 	int status;
@@ -88,6 +93,7 @@ struct p9_req_t {
 	struct p9_fcall tc;
 	struct p9_fcall rc;
 	struct list_head req_list;
+	struct p9_zc_pages *zc_pages;
 };
 
 /**
diff --git a/net/9p/client.c b/net/9p/client.c
index 15bb939087165..34be0d2652d4e 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -188,6 +188,7 @@ p9_tag_alloc(struct p9_client *c, int8_t type, uint t_size, uint r_size,
 	refcount_set(&req->refcount, 0);
 	init_waitqueue_head(&req->wq);
 	INIT_LIST_HEAD(&req->req_list);
+	req->zc_pages = NULL;
 
 	idr_preload(GFP_NOFS);
 	spin_lock_irq(&c->lock);
@@ -707,6 +708,8 @@ static struct p9_req_t *p9_client_zc_rpc(struct p9_client *c, int8_t type,
 		 * into rc only while it waits.
 		 */
 	}
+	/* The caller may reuse the payload once the transport releases it */
+	wait_event_idle(req->wq, !smp_load_acquire(&req->zc_pages));
 recalc_sigpending:
 	if (sigpending) {
 		spin_lock_irqsave(&current->sighand->siglock, flags);
diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index 68c3457bec401..d6914e5b36972 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -42,6 +42,43 @@ static DEFINE_MUTEX(virtio_9p_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vp_wq);
 static atomic_t vp_pinned = ATOMIC_INIT(0);
 
+/**
+ * struct p9_zc_pages - the pages mapped for the device by a zero-copy request
+ * @in_pages: the pages of the reply payload
+ * @out_pages: the pages of the request payload
+ * @in_nr_pages: the number of reply pages
+ * @out_nr_pages: the number of request pages
+ * @need_drop: whether p9_zc_release() drops a reference to each page
+ * @held: whether req_done() releases this structure
+ */
+struct p9_zc_pages {
+	struct page **in_pages;
+	struct page **out_pages;
+	int in_nr_pages;
+	int out_nr_pages;
+	int need_drop;
+	bool held;
+};
+
+static void p9_zc_release(struct p9_zc_pages *zc)
+{
+	if (zc->need_drop) {
+		if (zc->in_pages) {
+			p9_release_pages(zc->in_pages, zc->in_nr_pages);
+			atomic_sub(zc->in_nr_pages, &vp_pinned);
+		}
+		if (zc->out_pages) {
+			p9_release_pages(zc->out_pages, zc->out_nr_pages);
+			atomic_sub(zc->out_nr_pages, &vp_pinned);
+		}
+		/* wakeup anybody waiting for slots to pin pages */
+		wake_up(&vp_wq);
+	}
+	kvfree(zc->in_pages);
+	kvfree(zc->out_pages);
+	kfree(zc);
+}
+
 /**
  * struct virtio_chan - per-instance transport information
  * @inuse: whether the channel is in use
@@ -142,6 +179,15 @@ static void req_done(struct virtqueue *vq)
 			need_wakeup = true;
 		}
 
+		/* The device has returned the buffers of a zero-copy request */
+		if (req->zc_pages) {
+			if (req->zc_pages->held)
+				p9_zc_release(req->zc_pages);
+			/* pairs with smp_load_acquire() in p9_client_zc_rpc() */
+			smp_store_release(&req->zc_pages, NULL);
+			wake_up(&req->wq);
+		}
+
 		if (len) {
 			req->rc.size = len;
 			p9_client_cb(chan->client, req, REQ_STATUS_RCVD);
@@ -419,25 +465,30 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 {
 	int in, out, err, out_sgs, in_sgs;
 	unsigned long flags;
-	int in_nr_pages = 0, out_nr_pages = 0;
-	struct page **in_pages = NULL, **out_pages = NULL;
+	struct p9_zc_pages *zc;
 	struct virtio_chan *chan = client->trans;
 	struct scatterlist *sgs[4];
 	size_t offs = 0;
-	int need_drop = 0;
 	int kicked = 0;
+	bool held;
 
 	p9_debug(P9_DEBUG_TRANS, "virtio request\n");
 
+	zc = kzalloc_obj(*zc, GFP_NOFS);
+	if (!zc) {
+		err = -ENOMEM;
+		goto out;
+	}
+
 	if (uodata) {
 		__le32 sz;
-		int n = p9_get_mapped_pages(chan, &out_pages, uodata,
-					    outlen, &offs, &need_drop);
+		int n = p9_get_mapped_pages(chan, &zc->out_pages, uodata,
+					    outlen, &offs, &zc->need_drop);
 		if (n < 0) {
 			err = n;
 			goto err_out;
 		}
-		out_nr_pages = DIV_ROUND_UP(n + offs, PAGE_SIZE);
+		zc->out_nr_pages = DIV_ROUND_UP(n + offs, PAGE_SIZE);
 		if (n != outlen) {
 			__le32 v = cpu_to_le32(n);
 			memcpy(&req->tc.sdata[req->tc.size - 4], &v, 4);
@@ -450,13 +501,13 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 		sz = cpu_to_le32(req->tc.size + outlen);
 		memcpy(&req->tc.sdata[0], &sz, sizeof(sz));
 	} else if (uidata) {
-		int n = p9_get_mapped_pages(chan, &in_pages, uidata,
-					    inlen, &offs, &need_drop);
+		int n = p9_get_mapped_pages(chan, &zc->in_pages, uidata,
+					    inlen, &offs, &zc->need_drop);
 		if (n < 0) {
 			err = n;
 			goto err_out;
 		}
-		in_nr_pages = DIV_ROUND_UP(n + offs, PAGE_SIZE);
+		zc->in_nr_pages = DIV_ROUND_UP(n + offs, PAGE_SIZE);
 		if (n != inlen) {
 			__le32 v = cpu_to_le32(n);
 			memcpy(&req->tc.sdata[req->tc.size - 4], &v, 4);
@@ -476,10 +527,10 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 	if (out)
 		sgs[out_sgs++] = chan->sg;
 
-	if (out_pages) {
+	if (zc->out_pages) {
 		sgs[out_sgs++] = chan->sg + out;
 		out += pack_sg_list_p(chan->sg, out, VIRTQUEUE_NUM,
-				      out_pages, out_nr_pages, offs, outlen);
+				      zc->out_pages, zc->out_nr_pages, offs, outlen);
 	}
 
 	/*
@@ -494,10 +545,10 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 	if (in)
 		sgs[out_sgs + in_sgs++] = chan->sg + out;
 
-	if (in_pages) {
+	if (zc->in_pages) {
 		sgs[out_sgs + in_sgs++] = chan->sg + out + in;
 		pack_sg_list_p(chan->sg, out + in, VIRTQUEUE_NUM,
-			       in_pages, in_nr_pages, offs, inlen);
+			       zc->in_pages, zc->in_nr_pages, offs, inlen);
 	}
 
 	BUG_ON(out_sgs + in_sgs > ARRAY_SIZE(sgs));
@@ -522,6 +573,7 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 			goto err_out;
 		}
 	}
+	req->zc_pages = zc;
 	virtqueue_kick(chan->vq);
 	spin_unlock_irqrestore(&chan->lock, flags);
 	kicked = 1;
@@ -539,27 +591,28 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 
 		// RERROR needs reply (== error string) in static data
 		if (unlikely(req->rc.sdata[4] == P9_RERROR))
-			handle_rerror(req, in_hdr_len, offs, in_pages);
+			handle_rerror(req, in_hdr_len, offs, zc->in_pages);
+	} else {
+		/*
+		 * A fatal signal ended the wait, and the device may still hold
+		 * the request, so let req_done() release the pages unless the
+		 * device has already returned the request.
+		 */
+		spin_lock_irqsave(&chan->lock, flags);
+		held = req->zc_pages;
+		if (held)
+			zc->held = true;
+		spin_unlock_irqrestore(&chan->lock, flags);
+		if (held)
+			return err;
 	}
 
 	/*
 	 * Non kernel buffers are pinned, unpin them
 	 */
 err_out:
-	if (need_drop) {
-		if (in_pages) {
-			p9_release_pages(in_pages, in_nr_pages);
-			atomic_sub(in_nr_pages, &vp_pinned);
-		}
-		if (out_pages) {
-			p9_release_pages(out_pages, out_nr_pages);
-			atomic_sub(out_nr_pages, &vp_pinned);
-		}
-		/* wakeup anybody waiting for slots to pin pages */
-		wake_up(&vp_wq);
-	}
-	kvfree(in_pages);
-	kvfree(out_pages);
+	p9_zc_release(zc);
+out:
 	if (!kicked) {
 		/* reply won't come */
 		p9_req_put(client, req);
-- 
2.56.0


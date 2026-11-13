Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590180;
	b=DywlqpBsXToZI3Hlk7JdOBzHH8zydEBamZ3eSz+DKmBozYvMsM8+inLr7lIx/kcHvQPS
	 hmH2/WdF+xvi131gM7OUX2mqhEiSDrAYKcnxOEtPsfsFTaDshPNIug1GB+QJQS46xvwUi
	 9aL41Yy1KzFG5M4N+B21+VUPb/7fEubePzh9Ida2tek38tH6evrHqwIzsm7ByrNSefTTT
	 r5/1Sdo1KZedDgTbeNQum/IfnBhX3wZ2pOYJYBVoltK5a4wAn8zBtgwH4DlinZNzGigJ0
	 Z5ADB1RLLP7VsaYiBYCQeWtpQhY+bu0G7pYTy0XXnjtz00TJgUDw4Awj6JDL2JWkiuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590180;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=iQiv1T4Or/PfyaF+ivrtFBvlP2eBesLVPB8nTaArSIl4Tw68TRJIUTSTJ0coZl9ANOXs
	 DInBtG+hmEr4rECSXBRoPObdSSy/TsLFjUQCzpAuQMp3yutopX0JAyIJwNVCC5N/wLqmu
	 dLpqEm4pmc8AawUbcCVBuxH5TnA5iYpB+XiQnTfzzWuzimAxL5rQwKx5a1uC+8PB3TGrq
	 Wf0JFS7tBhIeCG4CZOyNhR1QZiYTn5H7ssuoZbKBD8Sz7SlnDqiRVHsoHkkqQV9hGYaYj
	 wcO44H5ypJJfgFCJ4P/0uXuDU9QQCIosjf0mbuJjw/2DwCCFb/2pqpaqIrnWqJJfWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gVu6c8uo;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rcwDqaDt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA05607142B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA05607142B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gVu6c8uo;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rcwDqaDt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=gVu6c8uoR8Vs3MSZo2BwbavqUD7NDOcTKRWnB6oIlUoU3wUcym4/sX52MEhDZMcMHd1Tnt
	Rvm5yC3njgSue3hYuB4m1AMitqvg+vbIEBSUiSmDRNFCS0KWyOGabvZDPsHSPB/5LWN6Qq
	DitMoy6+9MAiWCWgwkg1Lw1+nzrPzeA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-JU7yJ475NVa0HadPNBQn0g-1; Fri, 13 Nov 2026 12:16:17 -0500
X-MC-Unique: JU7yJ475NVa0HadPNBQn0g-1
X-Mimecast-MFC-AGG-ID: JU7yJ475NVa0HadPNBQn0g_1794590176
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso1131048f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590176; x=1795194976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=rcwDqaDtJ0znulsRrjpmXsSbSF1NNzzsF627bEhOzqyYoSjXvPFREqLrinqe6RMYSr
         syehfFpXFLz5csuYw0BKtxJZ5obbVpSPhyru4RiHuKNVrc7b3Fa+pxfVUTlWFSOKN0kM
         ct87wmBNdqG/a6l+lCJL/C3gEmLPU//IGlBylNHO67QUP8BdPJQ/Il8/uWZE0rn0aonX
         XqyuXAFcStdx6hs9M0XsHOe73wa8dqCWlViP6PP6OWSzCmlOPJtVuV4HFMDxveB1bMHz
         Rs43/oLVFPCYxhM3OOE3OD9BuUFhGh/FlQeqY0GsyfwK7VSM7f8LywgZRrzmremZLX5S
         QmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590176; x=1795194976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=mT3YSsApG7YoZGpIPh2KBbuibG6ZuFPu5IWOXFcscyoQlZeQAQKNNZmY09cxns9Bwb
         vir4azJqi5zA1VUZ+y7YVIpGI2okQLqG+/QoHTZGv3Miv8J3OF4stqr63a4vrDLPXlDu
         59yCR1/KVDQqGmM58yyuxEUPXNxSlFjfKnSjGQJcrY+q7oadKt92HDcgto1qFuAC4+pn
         FRgf90lLl2pGBL8ZnCo2pripDf/xrkwn9K6r3ozm5nl7aqLaZ5ielR+EpZHqPG9UrCLV
         4DGZYeP9bAm8kGFlW+TQ8BB7LjqhK8KJs6wrqxQXnfyZcaxdJwqIinRjv54QOQLFiP5A
         B4FQ==
X-Forwarded-Encrypted: i=1; AL+hErF19ydp9sK6XQVvzKh/gJsMxL9DPozkysKQNTtoKUTf6MA+gjAscR223l/sCAGLIMndGzkwRwGDXCiOb68=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xejsIx7Rujw9D9sKmffWN28s784mucwyMNne1rDsWA2Ktn7+m
	q5U3aMV+53weCqvnoxg89uaJYYRNpOtoUpgEt7K1my+ip/IN97VK32jQuebEd7UhawUKDv7u/A5
	GTpHWe3NiyjRUuahOvS8Zuj4AqjxBGpAiSt/1gAllHCAhr0L7MJxkW4d9Oo64Vdr35A==
X-Gm-Gg: AYBFou0DCNUpK+yEbHQQ7jTcAXgKqFugyI86+UkV0NiPRycl8aomqB773yf9gCCBR6S
	7RVBw0H+c0ljHjqq6ugzWstJiqyGTFxlAjY/y+eV5JAptpLv8gqIayQnQP6Vxk5yNNzd0Gt/dCD
	+AcaZvgMwweRt1FUn/r8NyrXhm77i8dP7OeFwmVrYHuFqpyx7wLrAdjGSYEY8v2EKF4gQQuVUNH
	btyuyMZMheRLo9SHT5uC88gcFbxLgxANFAHK6n3lU2sT2uHEU2QdgqWo6YZn8VqV6C2awmsiF9a
	0Ex+qDGMHLYX1ppe8JQbJxmMoBwVhep6NNSr7mwoiE91tn7QaBH13tMPHZ3kTB7G9HlidnQwiFp
	YnCcP9oYb9X97fwpNsmgsn+FH9pXMm58KKmB5MKptkiylE46XgHQHMHSPPjMOM+gKWnJ36bNA2T
	qvjOiSlsFsQyQ=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr7554596f8f.5.1794590176278;
        Fri, 13 Nov 2026 09:16:16 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr7554512f8f.5.1794590175789;
        Fri, 13 Nov 2026 09:16:15 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm5811907f8f.5.2026.11.13.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:16:13 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 13 Nov 2026 18:15:45 +0100
Subject: [PATCH RFC v3 5/8] vhost/vsock: negotiate datagram support with
 guests
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vsock-dgram-support-v3-5-1523c8e9b27e@redhat.com>
References: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
In-Reply-To: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=slp@redhat.com;
 h=from:subject:message-id; bh=YKxLSTvJb7wfOxlVHWx31lkfYp2fx1FL4beUkGwefCU=;
 b=kA0DAAoB9GknjS8MAjUByyZiAGr3RcvI3QnmKr/LRFn2Ary4TwcFPckWS7tYNcHGXnxHY4IMx
 YkCMwQAAQoAHRYhBL7V/PdRLYaAkULoovRpJ40vDAI1BQJq90XLAAoJEPRpJ40vDAI1JUsP/RuK
 zWQiElr7d4dJNVClBKs1rzZ0Yj3GcaeAHappnpy6wUu+gmAJFnxM2QFmqVIFxSElR8wNfcYX04t
 V8H+SJ/t0vVBYstyu9Mg7KIrxAWMvfhhIY5LnPwx2ZMfhqsTz+7ACuiDr6pZ2zxB8+CtoC3qu48
 nPzB2yFClOtl59Tbo6kse/qyppGiuKwfwAN8JWzOSeKIpLz7OGpocKl3vzkZ9C+ORgjYAAgvHNq
 teMbYTgAaShLedtIJoHNbCXsC/ZqnKsTuLZAzRnbqpUMdduT7UYOD9I6lvsTzU6b+ahXvZA5eKl
 nnkpvCIm0h1d1BSerC5RQq2JxnsOnW+6RAX/5HK0Pvgw0lXozPmSSKYO7W43WuzPTA+9By5WbSk
 PVaU6jX+oDMLJvH8v+z7hKrdgE6BEP244sZO2UtjODmqipK75ewCBRjhFggUwgPDP29cMMmvd6y
 z4FvZTWeMSYYeuhi6n+zEu3khNX84RSd/MlyCg5toZqRH7WhCC2zvn77ORD4nqPOGQFhFfA+XzX
 4vkl2qZPzHp/B/bz0w/h09prkD8x6/cY0skNUq8DRlnEMu/eXr6jC17IuBrGNW0tg+8u5DsOSiO
 cyAMGfzGZGgiBsCN6erpjNNToul8X5KBhzJ2LaYIVVetDnHyfAJ/4uuhpeA9rGKcWuHyE3YvReY
 rYmJl
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

Expose VIRTIO_VSOCK_F_DGRAM in the vhost feature bitmap and retain the
negotiated value for each guest.  Keep datagrams disabled until the
feature is negotiated.

Use a vhost-specific datagram destination check to look up the guest
in the socket's network namespace and require its negotiated datagram
feature. The common virtio implementation supplies the bind and
message operations; destination validation remains in connect() and
sendmsg(), where the remote CID is available.

Reject guest datagrams on ingress unless the receiving virtqueue
acknowledged the feature. Complete rejected descriptors normally so the
queue can continue processing subsequent traffic.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/vhost/vsock.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 0cb87971d749..7971f6f0b6a2 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -32,7 +32,8 @@
 static const int vhost_vsock_bits[] = {
 	VHOST_FEATURES,
 	VIRTIO_F_ACCESS_PLATFORM,
-	VIRTIO_VSOCK_F_SEQPACKET
+	VIRTIO_VSOCK_F_SEQPACKET,
+	VIRTIO_VSOCK_F_DGRAM,
 };
 
 #define VHOST_VSOCK_FEATURES VHOST_FEATURES_U64(vhost_vsock_bits, 0)
@@ -62,6 +63,7 @@ struct vhost_vsock {
 	u32 guest_cid;
 	bool seqpacket_allow;
 	bool ever_started; /* set on first SET_RUNNING(1); never cleared */
+	bool dgram_allow;
 };
 
 static u32 vhost_transport_get_local_cid(void)
@@ -436,6 +438,8 @@ static bool vhost_transport_msgzerocopy_allow(void)
 
 static bool vhost_transport_seqpacket_allow(struct vsock_sock *vsk,
 					    u32 remote_cid);
+static bool vhost_transport_dgram_allow(struct vsock_sock *vsk,
+					u32 cid, u32 port);
 
 static bool
 vhost_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
@@ -460,7 +464,7 @@ static struct virtio_transport vhost_transport = {
 		.dgram_enqueue            = virtio_transport_dgram_enqueue,
 		.dgram_dequeue            = virtio_transport_dgram_dequeue,
 		.dgram_bind               = virtio_transport_dgram_bind,
-		.dgram_allow              = virtio_transport_dgram_allow,
+		.dgram_allow              = vhost_transport_dgram_allow,
 
 		.stream_enqueue           = virtio_transport_stream_enqueue,
 		.stream_dequeue           = virtio_transport_stream_dequeue,
@@ -516,6 +520,24 @@ static bool vhost_transport_seqpacket_allow(struct vsock_sock *vsk,
 	return seqpacket_allow;
 }
 
+static bool vhost_transport_dgram_allow(struct vsock_sock *vsk,
+					u32 cid, u32 port)
+{
+	struct net *net = sock_net(sk_vsock(vsk));
+	struct vhost_vsock *vsock;
+	bool dgram_allow = false;
+
+	rcu_read_lock();
+	vsock = vhost_vsock_get(cid, net);
+
+	if (vsock)
+		dgram_allow = vsock->dgram_allow;
+
+	rcu_read_unlock();
+
+	return dgram_allow;
+}
+
 static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 {
 	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
@@ -573,10 +595,12 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 
 		hdr = virtio_vsock_hdr(skb);
 
-		/* Only accept correctly addressed packets */
+		/* Check addressing and datagram feature negotiation. */
 		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
 		    le64_to_cpu(hdr->dst_cid) ==
-		    vhost_transport_get_local_cid())
+		    vhost_transport_get_local_cid() &&
+		    (le16_to_cpu(hdr->type) != VIRTIO_VSOCK_TYPE_DGRAM ||
+		     vhost_has_feature(vq, VIRTIO_VSOCK_F_DGRAM)))
 			virtio_transport_recv_pkt(&vhost_transport, skb,
 						  vsock->net);
 		else
@@ -737,6 +761,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	vsock->guest_cid = 0; /* no CID assigned yet */
 	vsock->seqpacket_allow = false;
 	vsock->ever_started = false;
+	vsock->dgram_allow = false;
 
 	atomic_set(&vsock->queued_replies, 0);
 
@@ -890,6 +915,7 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
 	}
 
 	vsock->seqpacket_allow = features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET);
+	vsock->dgram_allow = features & (1ULL << VIRTIO_VSOCK_F_DGRAM);
 
 	for (i = 0; i < ARRAY_SIZE(vsock->vqs); i++) {
 		vq = &vsock->vqs[i];

-- 
2.56.0


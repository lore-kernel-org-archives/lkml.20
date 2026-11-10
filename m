Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316821;
	b=OjEdkO0eZ224fVm+RfvNi7qRaUdimEXI0sok3Rcx+7beKeotffPEDwfTr803C8AS2qMg
	 wWAqSH8ylL7ySUH8ZihWxulihxb3OH3j4vcWhhN/iHEkfzFHqfNvJUwQwDBCyakefStWO
	 FYuXndKaFqCndLQyrpVuQIF0D+fFWabAGbPKpYgVXnl65vDlWp1CsAXPOpCbM9AcCukp9
	 1IUOSGIEOHQKGO5O3GmBu3WyqqcT6ebHJqGT/k85uzeBh/KQVQQq6M9s65OOym5CJwGq/
	 G2X1VkIjQl7MYiYzpQLXYB50zG8aLjwZvigTHaoPFATAM6SPFvUFJsDQc4owDLNAr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316821;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6Y7QVx7G1MN02E+ysgPRqko/xyke3gT627Z3+xepCco=;
	b=R3c0GfOKh4GpIa30kxWaK0yxG3hUmMQu1/HlEHVzH49brRQRIC8tlfWJrd5ldjjMtMb5
	 W4IQyOjHQButDNqKlJTRU3uXcFxMN9mcbqUtsGbe4fqjo6tfWd3GBadGKTApUliR6Gt0f
	 aQnSTdtG1n+/XPNN7FBmJGjde1AqLnraQcTjXEzfD4nPcISugdS8zBUI+ZK8z/LotgzSs
	 z/PLzSu8NfRYy3QUk3LLb61C6rcjCveqQHub9+t8jJScKx3DYTxsFDg/NoqXX+TN2BZ62
	 S08ZJFAJTfW6BY/Nw1yH/D9tEc5+WDWxVPbjjMPF0E5q05/jq8BJAHEQgavEldfXeNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFMNXJ3O;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+L4MQf2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8860A3814
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C8860A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFMNXJ3O;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+L4MQf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y7QVx7G1MN02E+ysgPRqko/xyke3gT627Z3+xepCco=;
	b=ZFMNXJ3OxS7HQux7XCCEquM9w1+KdrY001MLgr0XRLVafYRI9RtfYRk6SrieF1/R39FYBe
	+wgGtifwEtXGRSEh2Pba8BANsPS2jGKRvJxqveolea0s7vame3J2GEYlYKbMawT5ReA/+p
	emaPWA7FyjYNfPzbB1wGtxQqb3EiloU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-mjmXNCQWOeO0c-tx4n6llg-1; Tue, 10 Nov 2026 08:20:18 -0500
X-MC-Unique: mjmXNCQWOeO0c-tx4n6llg-1
X-Mimecast-MFC-AGG-ID: mjmXNCQWOeO0c-tx4n6llg_1794316817
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25501f4aa2so274444366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316817; x=1794921617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Y7QVx7G1MN02E+ysgPRqko/xyke3gT627Z3+xepCco=;
        b=V+L4MQf2V/f8l+1hgny6XSIxT9epFwVQtd1EiYQrbbofwz6u7uNGPCKeMr2UcBX16C
         /4EI2lOOflS2gsyoHKI/gpLYXkJ7o8MFPGYhmqXC6SCzeM+eCuzfxf57mPKlypH40qUh
         YHqrpUUcytsH7QNVtR328ftiN/fZtjGg5F3m9pYchMjz5DtjQGEAtv46IK9yCmh9Cubp
         yFYBESZROljsfmosnKdNRDVVpQjDlshhFDem99CG7soh4UB2Q2sM9HUJu9ZjYFN6ydoq
         PtioevzmR7vn33EvRMBDGbhDNI7hOrPDp0PbSVWEwh7MhFigU80/AVSfzrMt16RxBHyj
         61NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316817; x=1794921617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Y7QVx7G1MN02E+ysgPRqko/xyke3gT627Z3+xepCco=;
        b=J1zENrOMXCr8+ZKbLf/l3b642vzX9+c5BWGLw1DwyPlhkYSGTjViIyH3PrE1vQ69eK
         VtRRnQCMvIwDAe/SJSdSGgMhMOihgs3q6+Dnvou21FpT56iY1T8wKF5I8Pzt0b5I/cr6
         TTv+3NFn8vwJwbOl7wkyqApuKjIROdFp/Hjg7HP7ITOvWhKG/vWq6Qy88NrYZ9zI3UZC
         x4M/xTircTuzu08oUtvVUZbb/2vOb5rbuO87lIKy1/S/ztN1Yj7B4r4S+3s3tAWYAHyq
         juYZSvd/Cz/SKUpuFROQOQdVj0qiXobU6H/FpkXwWiTUjp2tZ/YJ7c1FrL7bMWV1W3og
         /zxA==
X-Forwarded-Encrypted: i=1; AL+hErGK5KSRNw9/3IP8QlTnRcKkGy7cMmQTWxepanbRp6y8dT+rKUdAPHzzlx7+MlBNPNSX3mhuD75KAhBOdbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kpFIB3zslt5bWVDu74aLYpC6bWx3rPsg0mMN0aV2w5tdi3E3q
	OcAM5l7cg1Q5XBHlI9cbPrwkLk0ABuOKHagdOaQ2ZS1Jaz1ENqq+rCkHy2TU1yirup9CgjaBW+Q
	HmLxNShSG4/Dw2+IhprbUGtH+ScpxWEHHqs1A/VdiG+Oa8fuL81aHE7/cm8KAXKcNRg==
X-Gm-Gg: AYBFou2cfoQqrmPcrMIHWe4xR1vU2A1w1kAjdyxmIr+IAXPw/Wp6fQBwAqHcD0nRl9e
	kTNy63qIb3kfq1igQ8rCEAX0fQyT0NwzjRMi/StJ8XpxizEY7iW1IX0xA5gPgzeMieRYDjLNu2V
	QNAdAoPTupPI44VWPBHERnCihrusLyf+MPxgVOV4+LoGSEokKc0ed7jK64HLGLFTnyEMKJPdg2p
	x4aLtK7CTaxLY+qYTvFZ/JqFNE6ZRuY6bbroF8k9PuVjSajnImetdQazI82ofrzdCTyZRJoyMLx
	XGEUK3xX9TuwDCCiTT6B0oeePvdf4w8g31qvCgcLRI7ps36okWhujaCUQZaskipssb/J2jyE6gf
	dAi2FYsK8kBNNUnXRIKlzvv5rBAjk2R4Hefpi4CcwtFliE2EYuGdXPIifx332+xccKqGCefTnvM
	IdCSW8xWp01Px5xW6YAipVncU9u/yVJE6R57C5BCZWR24w4s1HwNs8ns+OYAyjN3NLUQ1yNk8el
	xC/dh1/VSYdv7gBN46HoF8dpU99xpSOO/rRxGhQSADbr9oaxwre
X-Received: by 2002:a17:907:9b83:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c5048c13001mr207597966b.23.1794316817185;
        Tue, 10 Nov 2026 05:20:17 -0800 (PST)
X-Received: by 2002:a17:907:9b83:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c5048c13001mr207594966b.23.1794316816822;
        Tue, 10 Nov 2026 05:20:16 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:16 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	io-uring@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 06/12] io_uring/opaque: allow rings to share a store
Date: Tue, 10 Nov 2026 13:20:00 +0000
Message-Id: <20261110132006.3280986-7-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110132006.3280986-1-amarkuze@redhat.com>
References: <20261110132006.3280986-1-amarkuze@redhat.com>
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

A multi-threaded server often uses one ring per thread. Allow an object
received or created through one ring to be used through another ring
without copying its payload.

Add EXPORT and IMPORT controls to IORING_REGISTER_OPAQUE_STORE. EXPORT
returns a close-on-exec anonymous-inode descriptor; IMPORT registers its
store under a new ring-local ID. The descriptor cannot read, map or poll
payload. Handles and stream tokens belong to the store and are valid
through every ring sharing it.

Each registered ring entry and export file holds one user reference and
one lifetime reference. The last user stops the store; the last lifetime
reference releases its memory and accounting. An export file can keep a
store alive after the creating ring exits. Import preserves the store's
memory-cgroup ownership and original ring user/mm accounting and adds no
backing charge.

Export reserves the descriptor and creates the file, copies the number
to userspace, and installs it only after that copy succeeds. Failure
unwinds the references and descriptor reservation. Import erases the
new ring-local ID if copying its result to userspace fails.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/uapi/linux/io_uring/opaque.h |  3 +
 io_uring/opaque_register.c           | 84 ++++++++++++++++++++++++----
 2 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/include/uapi/linux/io_uring/opaque.h b/include/uapi/linux/io_uring/opaque.h
index 692daa7d7e32..9a129b5da5af 100644
--- a/include/uapi/linux/io_uring/opaque.h
+++ b/include/uapi/linux/io_uring/opaque.h
@@ -16,6 +16,9 @@ struct io_uring_opaque_register {
 	__u64 __resv[2];
 };
 
+#define IORING_OPAQUE_REG_IMPORT	(1U << 0)
+#define IORING_OPAQUE_REG_EXPORT	(1U << 1)
+
 /* config/config_size select a size-versioned configuration on creation. */
 struct io_uring_opaque_config {
 	__u64 hard_limit;
diff --git a/io_uring/opaque_register.c b/io_uring/opaque_register.c
index 9e39d1ee5072..472c739a17de 100644
--- a/io_uring/opaque_register.c
+++ b/io_uring/opaque_register.c
@@ -15,6 +15,50 @@ static void io_opaque_unregister_user(struct io_opaque_store *store)
 	io_opaque_put(store);
 }
 
+static int io_opaque_box_release(struct inode *inode, struct file *file)
+{
+	io_opaque_unregister_user(file->private_data);
+	return 0;
+}
+
+static const struct file_operations io_opaque_box_fops = {
+	.owner = THIS_MODULE,
+	.release = io_opaque_box_release,
+};
+
+static int io_opaque_export(struct io_ring_ctx *ctx, void __user *arg,
+			    struct io_uring_opaque_register *reg, u32 size)
+{
+	struct io_opaque_store *store = xa_load(&ctx->opaque_stores, reg->store_id);
+	struct file *file;
+	int fd, ret;
+
+	if (!store)
+		return -ENXIO;
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+	io_opaque_get(store);
+	file = anon_inode_create_getfile("[io_uring-opaque]", &io_opaque_box_fops,
+					 store, O_CLOEXEC, NULL);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		io_opaque_unregister_user(store);
+		goto put_fd;
+	}
+	reg->fd = fd;
+	ret = copy_struct_to_user(arg, size, reg, sizeof(*reg), NULL);
+	if (ret) {
+		fput(file);
+		goto put_fd;
+	}
+	fd_install(fd, file);
+	return 0;
+put_fd:
+	put_unused_fd(fd);
+	return ret;
+}
+
 int io_register_opaque(struct io_ring_ctx *ctx, void __user *arg)
 {
 	struct io_uring_opaque_register reg;
@@ -38,19 +82,37 @@ int io_register_opaque(struct io_ring_ctx *ctx, void __user *arg)
 	    !mem_is_zero(reg.__resv, sizeof(reg.__resv)))
 		return -EINVAL;
 	reg.size = sizeof(reg);
-	if (reg.store_id || reg.flags)
+	if (reg.flags == IORING_OPAQUE_REG_EXPORT) {
+		if (reg.fd != -1 || reg.config || reg.config_size)
+			return -EINVAL;
+		return io_opaque_export(ctx, arg, &reg, size);
+	}
+	if (reg.store_id)
 		return -EINVAL;
-	if (reg.fd != -1 || !reg.config ||
-	    reg.config_size < offsetof(struct io_uring_opaque_config, __resv0) ||
-	    reg.config_size > PAGE_SIZE)
+	if (reg.flags == IORING_OPAQUE_REG_IMPORT) {
+		CLASS(fd, f)(reg.fd);
+
+		if (reg.config || reg.config_size)
+			return -EINVAL;
+		if (fd_empty(f) || fd_file(f)->f_op != &io_opaque_box_fops)
+			return -EBADF;
+		store = fd_file(f)->private_data;
+		io_opaque_get(store);
+	} else if (!reg.flags) {
+		if (reg.fd != -1 || !reg.config ||
+		    reg.config_size < offsetof(struct io_uring_opaque_config, __resv0) ||
+		    reg.config_size > PAGE_SIZE)
+			return -EINVAL;
+		ret = copy_struct_from_user(&config, sizeof(config),
+					    u64_to_user_ptr(reg.config), reg.config_size);
+		if (ret)
+			return ret;
+		store = io_opaque_alloc(ctx, &config);
+		if (IS_ERR(store))
+			return PTR_ERR(store);
+	} else {
 		return -EINVAL;
-	ret = copy_struct_from_user(&config, sizeof(config),
-				    u64_to_user_ptr(reg.config), reg.config_size);
-	if (ret)
-		return ret;
-	store = io_opaque_alloc(ctx, &config);
-	if (IS_ERR(store))
-		return PTR_ERR(store);
+	}
 	ret = xa_alloc(&ctx->opaque_stores, &id, store, xa_limit_31b, GFP_KERNEL);
 	if (ret)
 		goto put_store;
-- 
2.34.1


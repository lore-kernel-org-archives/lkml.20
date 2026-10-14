Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BED37188B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990374; cv=none; b=cK1GgJSqurNYDjYeict3/dB9d7qE/KL+SWAoNrWkLYKSF3yg1FG/5AZcuAnP9yReSFrYKVYT3gAyKKtzVdWp95ptzdepINy7MWq5hT178rjRpVQsJ+CwN0Zj0EQ1CHyMiJ+Ubqeix8yiDobbLgwn8+7JFad14ykF3I+st/RvWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990374; c=relaxed/simple;
	bh=soNI6GgkharquAstotbRK5nopE01Or39jiaVcdpi6Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8qsdmsLW8kdU7zrDCW2yWKnFpbrULxKyaBp3E0lNFRzCKYnMaA6b+7tujEY+VbLy0hQk+55KidmM3tgl9eJowqHj1Qq9P+6/RRCnOhey6/TAVLhzTvlVMy4Z5/LJUM5qegs+vmqFNxxHRc3bJyX9dBkZ1S9c93ppH6jXXKARzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPEAgKAz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qubs+ZAn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPEAgKAz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qubs+ZAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791990369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MlJtI51pruw2RMBHRkQEZjnzeHmSsE6g8ymfOHInCb4=;
	b=SPEAgKAzcNALL8A0zMS/MOJVHoK2z/LDaA0fwZX7slMNlimHwiWVO6yW+Fi7dNIlh4xCLF
	sfM1bXWIWYA2eQhq0CG+xYqQwBTmF13iAd6SfhNzKS33bF0IHiib1fe/I+wMy6DICBmiAE
	cpu5jglpr2gzB+WtaI3c4OzjHfRVWf4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-sKWwsYMpMROwUZTCD26kuw-1; Wed, 14 Oct 2026 15:06:07 +0000
X-MC-Unique: sKWwsYMpMROwUZTCD26kuw-1
X-Mimecast-MFC-AGG-ID: sKWwsYMpMROwUZTCD26kuw_1791990366
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b027578a4so458955f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791990366; x=1792595166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlJtI51pruw2RMBHRkQEZjnzeHmSsE6g8ymfOHInCb4=;
        b=Qubs+ZAnZ4m8A/F/AAxwqdTViABQV6dgwjaOtQbrjmJnMaFace2gYW5qLbDdsfr7nn
         xG98LSifgUhGIQOa50pHM0YMrYYEnBYZpmSW0e6UdymA0W8c8KV800yhShk00Cge3N7W
         JZrs3EtMONKZxqrGTTIhZeiA1nPWkDHIPKkigP7EHzrLiXiPokIRrSv4cY+tU6fDHpWb
         xIavLKMs69KA1DJCbfoDkfdo7VttR9fQx9V9m1taJbt8Cc09BxWUafY6joKgA+SeBEh1
         w5jXZ2VSs+hX8VP0tZViKHneZqhVT4BOijwwrDi/LNF5B17zbxH2UUqJBhA8W3xRfZh0
         BeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990366; x=1792595166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlJtI51pruw2RMBHRkQEZjnzeHmSsE6g8ymfOHInCb4=;
        b=AIlMUqj18iVIE+Q1SEapbfXWm5sF59UA3feokKBZ/7pU0+FoAhV8hBxyvMB0+WGI9s
         qZylrjSe4stUFR8wGRoHOOlJK8eZdd/AdcMhOc9tkV3+gEU3aTL0y6FqIMGf4tBVqQ4F
         7foHWH8hascWq0E1qMVMQNUsNST7Muf2X36/VdIpM8F4xHU3xB1sOVbjGEReOnzYk4W4
         bA5+bb3OV6aWHjyy4hmWIMjs7M7Z2NDE2lWdCPYs4zgjEGhj8T8brWQoZm+Ldspw87je
         SKZmufEr7uBtD57D5S+yxQzIIolguIDGbwxg4G9AUw9XxwYfKiPu/ec3aoSvaPN3dCOO
         iFcg==
X-Forwarded-Encrypted: i=1; AKwUvByv68yey3t9PoPTxpNBdxe/fjQy30op99Fzq0loMUPLsBzD4m19HgLyhJJj5uBGeKwjJwscdgAQyMycbs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKihJQMNRkssxhG6QWGEjTwXiNX/e+4KApQmd5fTvmrsKB3z296
	2D9JmSeOkQsmYP/BzecsFT6nD3K2ZoQGkK76bkiQAJCxQbSLIt14VBdv0vAxP82FC0S5LEQvmXY
	K6B6WdWnIhrWXiFuBzxs2tcqIu3A/yh85ccv2sftDc6TxGIK2J7wDV18dwtH6FSCvKg==
X-Gm-Gg: AYBFou1UeUC41GYNDHH50uWd209iEYG7+KgJT6W66g5JBctPu1v9rzunf9+piQzA+H+
	RngyToyLLUwytcl5KmsKVRp4I/39uZLrqk+1olbfya7VumeHa3ZwZi4Iwv//XzhTD8ebHbmoRUU
	ob4M4NOwbJaU82EsBPBzvdF6Se79ek/LyLOxyf+myIgv/qiY5EmhxHV8HHPA5GGM0VTE2By9bdM
	psPn21J1p37IuTjBnYm3WuHExPzEj4G5c7QKTiqSNctkAhRzSLfDPJKmgxwONBEGYAtHcg+owam
	iG0xZoRFd2fZSXxMjGEyR/nIC67S+0SJFGu/ZKSHXSJkSzZzscjYFaclWoPsZxn3kYJTMlVQXql
	C2Z7QNA==
X-Received: by 2002:a5d:5a08:0:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48dbaae719amr23579228f8f.28.1791990366240;
        Wed, 14 Oct 2026 08:06:06 -0700 (PDT)
X-Received: by 2002:a5d:5a08:0:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48dbaae719amr23579162f8f.28.1791990365719;
        Wed, 14 Oct 2026 08:06:05 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.157.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0acb1ebsm12875830f8f.44.2026.10.14.08.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:06:04 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:05:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] vsock/test: cover SO_INQ
Message-ID: <as-Z4hSXYQw4ZPHy@sgarzare-redhat>
References: <20261012235524.41468-1-devnexen@gmail.com>
 <20261012235524.41468-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261012235524.41468-3-devnexen@gmail.com>

On Tue, Oct 13, 2026 at 12:55:24AM +0100, David Carlier wrote:
>Check the SCM_INQ value after a partial receive, after draining the
>queue and at EOF, that no cmsg is sent while the option is off, and
>that out of range values and SOCK_SEQPACKET are rejected.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> tools/testing/vsock/vsock_test.c | 191 +++++++++++++++++++++++++++++++
> 1 file changed, 191 insertions(+)
>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index b4ff9f946565..00bb68c00c07 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -2429,6 +2429,188 @@ static void test_stream_collapse_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>+#define SO_INQ_BUF_LEN 64
>+#define SO_INQ_CHUNK_LEN 16
>+
>+static int so_inq_set(int fd, int val)
>+{
>+	return setsockopt(fd, SOL_SOCKET, SO_INQ, &val, sizeof(val));
>+}
>+
>+/* Receive @len bytes and return the SCM_INQ value, or -1 if the kernel did
>+ * not attach one.
>+ */
>+static int so_inq_recv(int fd, size_t len, int expected_ret)
>+{
>+	char control[CMSG_SPACE(sizeof(int))] = { 0 };
>+	unsigned char buf[SO_INQ_BUF_LEN];
>+	struct iovec iov = {
>+		.iov_base = buf,
>+		.iov_len = len,
>+	};
>+	struct msghdr msg = {
>+		.msg_iov = &iov,
>+		.msg_iovlen = 1,
>+		.msg_control = control,
>+		.msg_controllen = sizeof(control),
>+	};
>+	struct cmsghdr *cmsg;
>+	ssize_t ret;
>+	int inq;
>+
>+	ret = recvmsg(fd, &msg, 0);
>+	if (ret < 0) {
>+		perror("recvmsg");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	expect_res(ret, expected_ret, "recvmsg");
>+
>+	for (cmsg = CMSG_FIRSTHDR(&msg); cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
>+		if (cmsg->cmsg_level != SOL_SOCKET ||
>+		    cmsg->cmsg_type != SCM_INQ)
>+			continue;

Should we check CMSG_LEN and/or MSG_CTRUNC ?

The rest LGTM.

Thanks,
Stefano

>+
>+		memcpy(&inq, CMSG_DATA(cmsg), sizeof(inq));
>+		return inq;
>+	}
>+
>+	return -1;
>+}
>+
>+static void test_stream_so_inq_client(const struct test_opts *opts)
>+{
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_expectln("SENT");
>+
>+	/* Wait for the whole payload to be queued, so the values below do not
>+	 * depend on how the transport delivers it.
>+	 */
>+	if (!vsock_ioctl_int(fd, SIOCINQ, SO_INQ_BUF_LEN)) {
>+		fprintf(stderr, "Test skipped, SIOCINQ not supported.\n");
>+		goto out;
>+	}
>+
>+	/* No ancillary data unless the option is enabled. */
>+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, SO_INQ_CHUNK_LEN), -1,
>+		   "SCM_INQ with SO_INQ disabled");
>+
>+	if (so_inq_set(fd, 1)) {
>+		if (errno != ENOPROTOOPT) {
>+			perror("setsockopt(SO_INQ)");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		fprintf(stderr, "Test skipped, SO_INQ not supported.\n");
>+		goto out;
>+	}
>+
>+	/* Partial read: the rest of the payload is still queued. */
>+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, SO_INQ_CHUNK_LEN),
>+		   SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN,
>+		   "SCM_INQ after partial receive");
>+
>+	/* Draining read while the peer stays connected. */
>+	expect_res(so_inq_recv(fd, SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN,
>+			       SO_INQ_BUF_LEN - 2 * SO_INQ_CHUNK_LEN), 0,
>+		   "SCM_INQ after draining receive");
>+
>+	control_writeln("DRAINED");
>+	vsock_wait_remote_close(fd);
>+
>+	/* Nothing is queued once the peer is gone, but 1 is reported so the
>+	 * caller keeps reading until it observes EOF, as TCP_INQ does.
>+	 */
>+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, 0), 1, "SCM_INQ at EOF");
>+
>+	if (so_inq_set(fd, 0)) {
>+		perror("setsockopt(SO_INQ)");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	expect_res(so_inq_recv(fd, SO_INQ_CHUNK_LEN, 0), -1,
>+		   "SCM_INQ after disabling SO_INQ");
>+
>+	close(fd);
>+	return;
>+
>+out:
>+	control_writeln("DRAINED");
>+	close(fd);
>+}
>+
>+static void test_stream_so_inq_server(const struct test_opts *opts)
>+{
>+	unsigned char buf[SO_INQ_BUF_LEN];
>+	int fd;
>+
>+	fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
>+	if (fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	memset(buf, 'A', sizeof(buf));
>+	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>+	control_writeln("SENT");
>+
>+	/* Keep the connection open until the peer has drained the queue: an
>+	 * early close would turn its last SCM_INQ value into the EOF one.
>+	 */
>+	control_expectln("DRAINED");
>+	close(fd);
>+}
>+
>+static void test_so_inq_validation_client(const struct test_opts *opts)
>+{
>+	int fd;
>+
>+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
>+	if (fd < 0) {
>+		perror("socket");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (so_inq_set(fd, 1)) {
>+		if (errno != ENOPROTOOPT) {
>+			perror("setsockopt(SO_INQ)");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		fprintf(stderr, "Test skipped, SO_INQ not supported.\n");
>+		close(fd);
>+		return;
>+	}
>+
>+	if (!so_inq_set(fd, 2) || errno != EINVAL) {
>+		fprintf(stderr, "SO_INQ accepted an out of range value\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	close(fd);
>+
>+	/* SCM_INQ counts bytes, which a message based socket cannot report. */
>+	fd = socket(AF_VSOCK, SOCK_SEQPACKET, 0);
>+	if (fd < 0) {
>+		perror("socket");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (!so_inq_set(fd, 1) || errno != ENOPROTOOPT) {
>+		fprintf(stderr, "SO_INQ not rejected on SOCK_SEQPACKET\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	close(fd);
>+}
>+
> static struct test_case test_cases[] = {
> 	{
> 		.name = "SOCK_STREAM connection reset",
>@@ -2633,6 +2815,15 @@ static struct test_case test_cases[] = {
> 		.run_client = test_stream_collapse_client,
> 		.run_server = test_stream_collapse_server,
> 	},
>+	{
>+		.name = "SOCK_STREAM SO_INQ functionality",
>+		.run_client = test_stream_so_inq_client,
>+		.run_server = test_stream_so_inq_server,
>+	},
>+	{
>+		.name = "SO_INQ option validation",
>+		.run_client = test_so_inq_validation_client,
>+	},
> 	{},
> };
>
>-- 
>2.55.0
>


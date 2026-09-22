Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85064F3EDC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088557; cv=none; b=OO/dXnlpzmoKHxkoFFI3i3owWb5ieDGkL4A6O4moB/qZCN+MHeTorVafe8cxlMbiTPZJe81/qnMhyvI3UvpkGcjuMP1ZKFzVNr8GnGLSF87klRnQKudI/tIPmDJ7QTsby2RoqBDoUIy+i0z/QSEV2u2KyxuxGgEBqRLbOBDo5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088557; c=relaxed/simple;
	bh=UxKZDEjByunVRhpBdiEHA4lVszn7c/xwz4sFrzirDbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxuzU4z7kFzwlLjIOB05RleHy6lLZoZYyyhUbxCNw+1VOsmH8ZpiTKeEiZmuZk3n03kFAkme5B2ZlP50P4mH7TXydbjdJKeIPd3l6k9dyUdrgrFbBEzXihAqa+iZ8cc1UdtVwa1khmTuNHZhaGevvUn5JzFUDtUXOJzOcNFT87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WArv8ikU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKO1A/e9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WArv8ikU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKO1A/e9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790088553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iw4CTk0iW47NSV3WHeuH9qz99UVvDdoWrM85ghkzkys=;
	b=WArv8ikUP74b95jn/ruw0gcGb8B/V8BfCtkBpHrXib7TSiZphNe0r+mmeQsaaAi/zV5C3T
	szCe4E1dd8tEoa3gBpdUyuGm0buaozD6ssi6PWHwuXwnmvgprElr6J6SvtpoEl/VS7yf6R
	G+awn58KQvtZzTBqVdmcoBK6VS+cU0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-BVIkWDo9PleWRo84bUtRJA-1; Tue, 22 Sep 2026 10:49:12 -0400
X-MC-Unique: BVIkWDo9PleWRo84bUtRJA-1
X-Mimecast-MFC-AGG-ID: BVIkWDo9PleWRo84bUtRJA_1790088551
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-487038a4a88so11194f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790088551; x=1790693351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iw4CTk0iW47NSV3WHeuH9qz99UVvDdoWrM85ghkzkys=;
        b=JKO1A/e9fK1JQnLG7sdlf09cR5Q79Ah2c+qqA0zY/K3F8GxIIclYumLvreUlciiwcT
         ma8TNPKh5+zHEqylgjG/bOwQaAxZ3gPKlg5BcmI+DK6KxWvJG0KpwixA3XdcZ+mCedJw
         orZxt8UtOmHO+IqI17gEHFnho2yUuX508PXgI6jv62RM2PJXhNGavy25Y38c7lli81gg
         twG1VAGICwKFVchn7ofPNpPUciNYT6P+D5KwPzZDiFeUKa4Z81kYRqKfmA1qB0gNp5yu
         BbF58hDKJNMEgscAzgHIwsUfeOMM4psioOJ1iXK/hPR6JDwtxjq8WOKsHkoW011jEpAr
         XicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088551; x=1790693351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw4CTk0iW47NSV3WHeuH9qz99UVvDdoWrM85ghkzkys=;
        b=s9VuFM3VuX5TgI7e05xB0ZN2oAfkhrlAFSxhJfGNRG1d6OlnNUwexwllXwdRSVyP5a
         kcMXvdWrjwyti1GOlWe3ItGk3RYn1vhTmwbcq0WThCQI6v+K4n/TeUlKg559oHsYnYXU
         PeIkk/dvOa6n9bYLos2iSVrC9adgf53Os9NYT9sTWH2bfzwu9DHFRFfsU515wOjc6lRD
         iREtI41ITDgWbwDcedyQwKrgkDjpVe44xfB3/15jNJQbSvdnhQt2/txyCiqjLU+u+N7X
         PoV5AnP/XLmPVTN6Zkb7WoXHu3n24UA1VrSRwsUpF7xb/PWg4N/sfel6Q4/0/3aqbjvN
         IZ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTIGjc3wmYazAS738OnaQMPGH76l9J2ciw671/9YrtpE2LHOlLDHUnlw4+z0JCIyviWa9loQsEFBWFr5o=@vger.kernel.org
X-Gm-Message-State: AFuF++lq3U0+f1Gtt9bXKJoyhYv7MHu7OFWqZn+brlZT2TOnaGniy7v5
	ehRVO2OqHpndT6hFAhJsUtxO7xZbedU8k6v0lEGeC59obs7zr5oxQHfhClN8GLgq/bh7EQG25hH
	yFrT60QuIK+3ahsWzz5ufVlSD9/+mjk8MWquml61JozgSh1nRLiq1TjpzR0i+jaugNA==
X-Gm-Gg: AYBFou0pVQuEo0rnMB1G3rfROwTYepTLewXR6ALH2qp1houL3VBF6X9Wd7LNiztSLI+
	9S6+O3fXfGyNMX8Mw6RY5d/pB8o2DpkuiTC9b7o8dyXcXi/lEjmyMK4ek/Ywu0K8ZQsEC3l6cpP
	g5PwGw4LyLI8OYqyYpfWla2q9YI4/rk6iihGXDrb6KCIRQjKrDAwnM/mZVft+4N02uIm/s08Vvr
	NmGKkJVNsjc9GR1SS4nRqEXOau7liIPsMBW1zMCPASPii720KErWVHY9zQUfvV174jhHl1BCvfs
	k51N7ACfM16Kki64Mu2tECaQpwQgys0tllohzEzv0CVX1xw8RmGB3A93ec1dln1bcK6Y7sJ1HmI
	ZbdtA1ZD49hoomwfYpbCm2jz0mGqCmx0750LvCphGW3bxhiIZ2J8=
X-Received: by 2002:a05:6000:2001:b0:487:725:8210 with SMTP id ffacd0b85a97d-4871e2273eamr23277269f8f.21.1790088550826;
        Tue, 22 Sep 2026 07:49:10 -0700 (PDT)
X-Received: by 2002:a05:6000:2001:b0:487:725:8210 with SMTP id ffacd0b85a97d-4871e2273eamr23277227f8f.21.1790088550277;
        Tue, 22 Sep 2026 07:49:10 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-131.retail.telecomitalia.it. [82.53.134.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862731a53sm5611371f8f.4.2026.09.22.07.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:49:09 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:49:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] vsock/test: cover receive queue hints
Message-ID: <arKSUIi7iGJ57rdM@sgarzare-redhat>
References: <20260920194710.1114748-1-devnexen@gmail.com>
 <20260920194710.1114748-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260920194710.1114748-3-devnexen@gmail.com>

On Sun, Sep 20, 2026 at 08:47:10PM +0100, David Carlier wrote:
>Add io_uring receive tests checking IORING_CQE_F_SOCK_NONEMPTY across a
>partial receive, draining while the peer stays connected, EOF, a
>nonblocking receive on an empty queue, a zero-length request, and a
>multishot receive with provided buffers.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> tools/testing/vsock/vsock_uring_test.c | 367 +++++++++++++++++++++++++
> 1 file changed, 367 insertions(+)
>
>diff --git a/tools/testing/vsock/vsock_uring_test.c b/tools/testing/vsock/vsock_uring_test.c
>index 5c3078969659..318e17bd28bc 100644
>--- a/tools/testing/vsock/vsock_uring_test.c
>+++ b/tools/testing/vsock/vsock_uring_test.c
>@@ -13,7 +13,10 @@
> #include <liburing.h>
> #include <unistd.h>
> #include <sys/mman.h>
>+#include <sys/ioctl.h>
> #include <linux/kernel.h>
>+#include <linux/sockios.h>
>+#include <errno.h>
> #include <error.h>
>
> #include "util.h"
>@@ -28,6 +31,10 @@
>
> #define VSOCK_TEST_DATA_MAX_IOV 3
>
>+#define HINT_CHUNK_SIZE		4096
>+#define HINT_BUF_GROUP		1
>+#define HINT_BUF_ENTRIES	4
>+
> struct vsock_io_uring_test {
> 	/* Number of valid elements in 'vecs'. */
> 	int vecs_cnt;
>@@ -211,6 +218,341 @@ void test_stream_uring_msg_zc_client(const struct test_opts *opts)
> 		vsock_io_uring_client(opts, &test_data_array[i], true);
> }
>
>+struct uring_inq_ctx {
>+	struct io_uring ring;
>+	int fd;
>+};
>+
>+static void inq_server_init(struct uring_inq_ctx *ctx,
>+			    const struct test_opts *opts)
>+{
>+	ctx->fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
>+	if (ctx->fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	if (io_uring_queue_init(RING_ENTRIES_NUM, &ctx->ring, 0))
>+		error(1, errno, "io_uring_queue_init");
>+}
>+
>+static void inq_server_exit(struct uring_inq_ctx *ctx)
>+{
>+	io_uring_queue_exit(&ctx->ring);
>+	close(ctx->fd);
>+}
>+
>+/* Submit a single receive and report both its result and its CQE flags. */
>+static int inq_recv(struct uring_inq_ctx *ctx, void *buf, size_t len,
>+		    int flags, unsigned int *cflags)
>+{
>+	struct io_uring_sqe *sqe;
>+	struct io_uring_cqe *cqe;
>+	int res;
>+
>+	sqe = io_uring_get_sqe(&ctx->ring);
>+	io_uring_prep_recv(sqe, ctx->fd, buf, len, flags);
>+
>+	if (io_uring_submit(&ctx->ring) != 1)
>+		error(1, errno, "io_uring_submit");
>+
>+	if (io_uring_wait_cqe(&ctx->ring, &cqe))
>+		error(1, errno, "io_uring_wait_cqe");
>+
>+	res = cqe->res;
>+	*cflags = cqe->flags;
>+	io_uring_cqe_seen(&ctx->ring, cqe);
>+
>+	return res;
>+}
>+
>+static void expect_res(int res, int expected, const char *what)

Maybe this can go in util.c/h so we can reuse in the future.

>+{
>+	if (res != expected) {
>+		fprintf(stderr, "%s: expected %d, got %d\n", what, expected,
>+			res);
>+		exit(EXIT_FAILURE);
>+	}
>+}
>+
>+static void expect_nonempty(unsigned int cflags, bool expected,

nit: can you add uring or something like that in the function name since 
it seem io_uring related.

>+			    const char *what)
>+{
>+	bool nonempty = !!(cflags & IORING_CQE_F_SOCK_NONEMPTY);
>+
>+	if (nonempty != expected) {
>+		fprintf(stderr, "%s: expected SOCK_NONEMPTY %d, got %d\n",
>+			what, expected, nonempty);
>+		exit(EXIT_FAILURE);
>+	}
>+}
>+
>+/* Wait until the whole payload is queued, so the hint is deterministic. */
>+static void inq_wait_queued(int fd, int len)
>+{
>+	if (!vsock_ioctl_int(fd, SIOCINQ, len)) {
>+		fprintf(stderr, "SIOCINQ not supported\n");
>+		exit(EXIT_FAILURE);

Should we avoid to fail if it isn't supported and just skip the test?

>+	}
>+}
>+
>+static void inq_send_chunks(const struct test_opts *opts, int chunks)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	int fd, i;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	memset(buf, 0xa5, sizeof(buf));
>+	for (i = 0; i < chunks; i++)
>+		send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>+
>+	control_writeln("SENT");
>+	control_expectln("DONE");
>+	close(fd);
>+}
>+
>+static void test_stream_uring_inq_client(const struct test_opts *opts)
>+{
>+	inq_send_chunks(opts, 2);
>+}
>+
>+static void test_stream_uring_inq_server(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	struct uring_inq_ctx ctx;
>+	unsigned int cflags;
>+	int res;
>+
>+	inq_server_init(&ctx, opts);
>+
>+	control_expectln("SENT");
>+	inq_wait_queued(ctx.fd, 2 * HINT_CHUNK_SIZE);
>+
>+	/* Data remains after this receive, so the flag must be set. */
>+	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
>+	expect_res(res, HINT_CHUNK_SIZE, "partial receive");
>+	expect_nonempty(cflags, true, "partial receive");
>+
>+	/* This receive drains the queue while the peer stays connected. */
>+	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
>+	expect_res(res, HINT_CHUNK_SIZE, "draining receive");
>+	expect_nonempty(cflags, false, "draining receive");
>+
>+	control_writeln("DONE");
>+	inq_server_exit(&ctx);
>+}
>+
>+static void test_stream_uring_inq_eof_client(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	memset(buf, 0x5a, sizeof(buf));
>+	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>+	control_writeln("SENT");
>+
>+	control_expectln("DRAINED");
>+	close(fd);
>+	control_writeln("CLOSED");
>+
>+	control_expectln("DONE");

Why we need this barrier?

Note: the test runners already add barriers before starting new tests, 
please check if we need it. Also in the other tests, maybe we need 
some of them (e.g. to avoid the peer will close the socket), but I'm not 
sure if we need all of them.

Thanks,
Stefano

>+}
>+
>+static void test_stream_uring_inq_eof_server(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	struct uring_inq_ctx ctx;
>+	unsigned int cflags;
>+	int res;
>+
>+	inq_server_init(&ctx, opts);
>+
>+	control_expectln("SENT");
>+	inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
>+
>+	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
>+	expect_res(res, HINT_CHUNK_SIZE, "drain before EOF");
>+	expect_nonempty(cflags, false, "drain before EOF");
>+
>+	control_writeln("DRAINED");
>+	control_expectln("CLOSED");
>+
>+	/* The queue is empty and the peer is gone.  The hint stays non-zero
>+	 * so that this receive happens and reports EOF, as TCP does after a
>+	 * FIN.
>+	 */
>+	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
>+	expect_res(res, 0, "receive at EOF");
>+	expect_nonempty(cflags, true, "receive at EOF");
>+
>+	control_writeln("DONE");
>+	inq_server_exit(&ctx);
>+}
>+
>+static void test_stream_uring_inq_empty_client(const struct test_opts *opts)
>+{
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_writeln("READY");
>+	control_expectln("DONE");
>+	close(fd);
>+}
>+
>+static void test_stream_uring_inq_empty_server(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	struct uring_inq_ctx ctx;
>+	unsigned int cflags;
>+	int res;
>+
>+	inq_server_init(&ctx, opts);
>+
>+	control_expectln("READY");
>+
>+	/* A failed receive must not leave a stale positive hint. */
>+	res = inq_recv(&ctx, buf, sizeof(buf), MSG_DONTWAIT, &cflags);
>+	expect_res(res, -EAGAIN, "empty nonblocking receive");
>+	expect_nonempty(cflags, false, "empty nonblocking receive");
>+
>+	control_writeln("DONE");
>+	inq_server_exit(&ctx);
>+}
>+
>+static void test_stream_uring_inq_zerolen_client(const struct test_opts *opts)
>+{
>+	inq_send_chunks(opts, 1);
>+}
>+
>+static void test_stream_uring_inq_zerolen_server(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	struct uring_inq_ctx ctx;
>+	unsigned int cflags;
>+	int res;
>+
>+	inq_server_init(&ctx, opts);
>+
>+	control_expectln("SENT");
>+	inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
>+
>+	/* A zero-length request is not an error and still describes the
>+	 * queue behind it.
>+	 */
>+	res = inq_recv(&ctx, buf, 0, 0, &cflags);
>+	expect_res(res, 0, "zero-length receive");
>+	expect_nonempty(cflags, true, "zero-length receive");
>+
>+	control_writeln("DONE");
>+	inq_server_exit(&ctx);
>+}
>+
>+static void test_stream_uring_inq_mshot_client(const struct test_opts *opts)
>+{
>+	char buf[HINT_CHUNK_SIZE];
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	memset(buf, 0x3c, sizeof(buf));
>+	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>+	control_writeln("SENT");
>+
>+	control_expectln("DRAINED");
>+	close(fd);
>+	control_writeln("CLOSED");
>+
>+	control_expectln("DONE");
>+}
>+
>+static void test_stream_uring_inq_mshot_server(const struct test_opts *opts)
>+{
>+	static char bufs[HINT_BUF_ENTRIES][HINT_CHUNK_SIZE];
>+	struct io_uring_buf_ring *br;
>+	struct uring_inq_ctx ctx;
>+	struct io_uring_sqe *sqe;
>+	struct io_uring_cqe *cqe;
>+	int i, ret;
>+
>+	inq_server_init(&ctx, opts);
>+
>+	br = io_uring_setup_buf_ring(&ctx.ring, HINT_BUF_ENTRIES,
>+				     HINT_BUF_GROUP, 0, &ret);
>+	if (!br) {
>+		fprintf(stderr, "io_uring_setup_buf_ring: %d\n", ret);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	for (i = 0; i < HINT_BUF_ENTRIES; i++)
>+		io_uring_buf_ring_add(br, bufs[i], HINT_CHUNK_SIZE, i,
>+				      io_uring_buf_ring_mask(HINT_BUF_ENTRIES),
>+				      i);
>+	io_uring_buf_ring_advance(br, HINT_BUF_ENTRIES);
>+
>+	sqe = io_uring_get_sqe(&ctx.ring);
>+	io_uring_prep_recv_multishot(sqe, ctx.fd, NULL, 0, 0);
>+	sqe->flags |= IOSQE_BUFFER_SELECT;
>+	sqe->buf_group = HINT_BUF_GROUP;
>+
>+	if (io_uring_submit(&ctx.ring) != 1)
>+		error(1, errno, "io_uring_submit");
>+
>+	control_expectln("SENT");
>+
>+	/* The payload completion drains the queue and keeps the request
>+	 * armed, so the hint must report the queue as empty.
>+	 */
>+	if (io_uring_wait_cqe(&ctx.ring, &cqe))
>+		error(1, errno, "io_uring_wait_cqe");
>+
>+	expect_res(cqe->res, HINT_CHUNK_SIZE, "multishot payload");
>+	expect_nonempty(cqe->flags, false, "multishot payload");
>+	if (!(cqe->flags & IORING_CQE_F_MORE)) {
>+		fprintf(stderr, "multishot payload: request not rearmed\n");
>+		exit(EXIT_FAILURE);
>+	}
>+	io_uring_cqe_seen(&ctx.ring, cqe);
>+
>+	control_writeln("DRAINED");
>+	control_expectln("CLOSED");
>+
>+	/* EOF ends multishot regardless of the hint. */
>+	if (io_uring_wait_cqe(&ctx.ring, &cqe))
>+		error(1, errno, "io_uring_wait_cqe");
>+
>+	expect_res(cqe->res, 0, "multishot EOF");
>+	if (cqe->flags & IORING_CQE_F_MORE) {
>+		fprintf(stderr, "multishot EOF: request still armed\n");
>+		exit(EXIT_FAILURE);
>+	}
>+	io_uring_cqe_seen(&ctx.ring, cqe);
>+
>+	control_writeln("DONE");
>+	io_uring_free_buf_ring(&ctx.ring, br, HINT_BUF_ENTRIES,
>+			       HINT_BUF_GROUP);
>+	inq_server_exit(&ctx);
>+}
>+
> static struct test_case test_cases[] = {
> 	{
> 		.name = "SOCK_STREAM io_uring test",
>@@ -222,6 +564,31 @@ static struct test_case test_cases[] = {
> 		.run_server = test_stream_uring_msg_zc_server,
> 		.run_client = test_stream_uring_msg_zc_client,
> 	},
>+	{
>+		.name = "SOCK_STREAM io_uring receive queue hint",
>+		.run_server = test_stream_uring_inq_server,
>+		.run_client = test_stream_uring_inq_client,
>+	},
>+	{
>+		.name = "SOCK_STREAM io_uring receive hint at EOF",
>+		.run_server = test_stream_uring_inq_eof_server,
>+		.run_client = test_stream_uring_inq_eof_client,
>+	},
>+	{
>+		.name = "SOCK_STREAM io_uring receive hint on empty queue",
>+		.run_server = test_stream_uring_inq_empty_server,
>+		.run_client = test_stream_uring_inq_empty_client,
>+	},
>+	{
>+		.name = "SOCK_STREAM io_uring receive hint zero-length",
>+		.run_server = test_stream_uring_inq_zerolen_server,
>+		.run_client = test_stream_uring_inq_zerolen_client,
>+	},
>+	{
>+		.name = "SOCK_STREAM io_uring multishot receive hint",
>+		.run_server = test_stream_uring_inq_mshot_server,
>+		.run_client = test_stream_uring_inq_mshot_client,
>+	},
> 	{},
> };
>
>-- 
>2.55.0
>


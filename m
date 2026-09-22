Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF046A61D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098486; cv=none; b=biUam21nsZ+6o4eb5rwVvzn6Tmumxp/2u4S2LeGdGRsHtM8j8wtxW8qwhvL8K+BJE99mKgnowgZKOwWAsK+DruUE9ZB/BUAbhGISSrG8KfekZcZ0OXwI14+6Dvh42lOL6kSW6LuOHXaMtpEIp3cLmiTHleZPJx5Jn7cpiYtA4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098486; c=relaxed/simple;
	bh=srDzdhvMj3KdOsMVOhhwSn/IoI3jpC6iMoebja5C2TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYmlxtFJ1LQ/wmnMj3PMqwg5/vSy7ZrgIuqQ0Pgk4Wvavma7+lOochTnzqn60dxyDDMIiSaDExblrGklCCjPzO1NK1zcL6ulZQtglpjfJWgfQGrqkRvvh9I78jDgQZTD6BBixAYJmhL7k7483LSifme5ivH9rbLe529Al0VvRzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDhJkRqZ; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDhJkRqZ"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so151595fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098484; x=1790703284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zcM3cGWUUS94N+RJZHSRLZz5yzOVCUjkjJz2pMqCX0=;
        b=NDhJkRqZGaFwWYyUDbuV97QsLhtXGSNjP7iogZn9SW4F5nsGcOSVVU1dFD8gkbJUHw
         ANsTJPwkuATn6lXOu3qHQpRxxVAkpO49b/d58ooS4Yx0zZWkR3Skc/iK+lLGEdGn/Ug+
         MWlyxr23OgMRUFSwS4E/L/5CUS6upJpgHkmnLDzQYEnXYswOE5hni3wl2LBJZ1ON5IMl
         OO4ca1pK90d+vTlkbmVjjmim6uSkixdS1RbNs99WXr2mtyXSPUOlLEok8PidQuvV4B41
         NlgerIxy7D/GgIBF2d9wu3zyyObZj2HV3WexY7qA8eQajkwQqqiBbFMyJI7RYWljW0dH
         SlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098484; x=1790703284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zcM3cGWUUS94N+RJZHSRLZz5yzOVCUjkjJz2pMqCX0=;
        b=MjwQy7p3jUJMYTthVQFR+pRHwIV79nf+JzrH9b1g0RlZnNNUh27/4EADyxZxLM1uaZ
         iOLJxZWXc9dkerK/ILMDQFBrjoiqiAr8zB+/+69euZkXw5zN8mNu3OMKps+c9WE2+zKG
         jycdDiUbU7AFqgLdO7DI+I/oXCdPyn47Oz/iSxuUctlMPoEkcSGCw1OSr5ZxB/8b7TEW
         RrmJiMVZ4OUKOkkS0+yZ1LAAbUKdWhOiIaaKVmdQB1UZpVg+lByeltwx6TYUEXYyOAsy
         k2O7hqBGPbhcjqurRqXGYPwpkado7gxojJriEfdZ8InfKYjLGyOH8yJaoLjQRqxOVXCW
         LiPg==
X-Forwarded-Encrypted: i=1; AKwUvBzyCf6YlLXh5OLlFyszlqE82555uovB6m5OO42QN6fdxxsXPWq/fP2u0PmqTHBe0owas3QCVrXPGz8ARA8=@vger.kernel.org
X-Gm-Message-State: AFuF++knfRSBKc8vlxpaClp3bTs5D5HpsQrFe7vFpNNHKbuDs6KJ/3cq
	HZTENNLjUhqoJrwlhvvaihHmiDslnNJ2GqaE293E3uXx5X2Z5xAd6oQ2
X-Gm-Gg: AYBFou1duryo07tdqL9iruuTH6AMBhM3LNqzUjY0LX5F0Hf4V1xHH8HB8HpTlVo3BXR
	bwZbCzN7PpTTLBYqdFRESGBlsk753gapMQIdWASoJVO0rxHh8e94wojDC9EtwaYAZls6EjV+L0e
	Fpa4rdZEn69bmR5kXKQ0JWIYPUTkYxHUIYTxSLze3yUDSulQOqYYpdbtUiO16G1sdIcCUKV5w9w
	dYWwN8wSD/gyZtkrTtEFU0PR5lfkUu1D1tQ0l+fw0GuYA+rzqVMzyedACRes9wXr/g/3hXu2wAm
	VHOPqIZ4zymtEAenCqaelNOSTZEic7OpG/2FxuoU1xBlF1pX3uOCgL/yA463yz6oja1d2dzNo8F
	gEwmjtYAjhLKswNg3jD8JOP/wVn9QUY6RG10K6aooWZyUVzZdmMDa1wE23bpWWeBMO0GTOIhx2A
	eKJOPYaCqAghSRZPlfumiPYXopcj0z39dHP5fPUkYvQfx7vTlXGqJJ9qfhX0483E73Xn3T0IsQQ
	p4zh3uoqNWsAb5RW7U=
X-Received: by 2002:a05:6820:1511:b0:6cd:3ffc:e33c with SMTP id 006d021491bc7-6d2d3509e33mr79768eaf.90.1790098483693;
        Tue, 22 Sep 2026 10:34:43 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:2::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908efd733bsm218697fac.18.2026.09.22.10.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:34:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:34:39 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, sgarzare@redhat.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] vsock/test: cover receive queue hints
Message-ID: <arK8L3S5F+9XREpe@devvm29614.prn0.facebook.com>
References: <20260920194710.1114748-1-devnexen@gmail.com>
 <20260920194710.1114748-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920194710.1114748-3-devnexen@gmail.com>

On Sun, Sep 20, 2026 at 08:47:10PM +0100, David Carlier wrote:
> Add io_uring receive tests checking IORING_CQE_F_SOCK_NONEMPTY across a
> partial receive, draining while the peer stays connected, EOF, a
> nonblocking receive on an empty queue, a zero-length request, and a
> multishot receive with provided buffers.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  tools/testing/vsock/vsock_uring_test.c | 367 +++++++++++++++++++++++++
>  1 file changed, 367 insertions(+)
> 
> diff --git a/tools/testing/vsock/vsock_uring_test.c b/tools/testing/vsock/vsock_uring_test.c
> index 5c3078969659..318e17bd28bc 100644
> --- a/tools/testing/vsock/vsock_uring_test.c
> +++ b/tools/testing/vsock/vsock_uring_test.c
> @@ -13,7 +13,10 @@
>  #include <liburing.h>
>  #include <unistd.h>
>  #include <sys/mman.h>
> +#include <sys/ioctl.h>
>  #include <linux/kernel.h>
> +#include <linux/sockios.h>
> +#include <errno.h>
>  #include <error.h>
>  
>  #include "util.h"
> @@ -28,6 +31,10 @@
>  
>  #define VSOCK_TEST_DATA_MAX_IOV 3
>  
> +#define HINT_CHUNK_SIZE		4096
> +#define HINT_BUF_GROUP		1
> +#define HINT_BUF_ENTRIES	4
> +
>  struct vsock_io_uring_test {
>  	/* Number of valid elements in 'vecs'. */
>  	int vecs_cnt;
> @@ -211,6 +218,341 @@ void test_stream_uring_msg_zc_client(const struct test_opts *opts)
>  		vsock_io_uring_client(opts, &test_data_array[i], true);
>  }
>  
> +struct uring_inq_ctx {
> +	struct io_uring ring;
> +	int fd;
> +};
> +
> +static void inq_server_init(struct uring_inq_ctx *ctx,
> +			    const struct test_opts *opts)
> +{
> +	ctx->fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
> +	if (ctx->fd < 0) {
> +		perror("accept");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (io_uring_queue_init(RING_ENTRIES_NUM, &ctx->ring, 0))
> +		error(1, errno, "io_uring_queue_init");
> +}
> +
> +static void inq_server_exit(struct uring_inq_ctx *ctx)
> +{
> +	io_uring_queue_exit(&ctx->ring);
> +	close(ctx->fd);
> +}
> +
> +/* Submit a single receive and report both its result and its CQE flags. */
> +static int inq_recv(struct uring_inq_ctx *ctx, void *buf, size_t len,
> +		    int flags, unsigned int *cflags)
> +{
> +	struct io_uring_sqe *sqe;
> +	struct io_uring_cqe *cqe;
> +	int res;
> +
> +	sqe = io_uring_get_sqe(&ctx->ring);
> +	io_uring_prep_recv(sqe, ctx->fd, buf, len, flags);
> +
> +	if (io_uring_submit(&ctx->ring) != 1)
> +		error(1, errno, "io_uring_submit");
> +
> +	if (io_uring_wait_cqe(&ctx->ring, &cqe))
> +		error(1, errno, "io_uring_wait_cqe");
> +
> +	res = cqe->res;
> +	*cflags = cqe->flags;
> +	io_uring_cqe_seen(&ctx->ring, cqe);
> +
> +	return res;
> +}
> +
> +static void expect_res(int res, int expected, const char *what)
> +{
> +	if (res != expected) {
> +		fprintf(stderr, "%s: expected %d, got %d\n", what, expected,
> +			res);
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +static void expect_nonempty(unsigned int cflags, bool expected,
> +			    const char *what)
> +{
> +	bool nonempty = !!(cflags & IORING_CQE_F_SOCK_NONEMPTY);
> +
> +	if (nonempty != expected) {
> +		fprintf(stderr, "%s: expected SOCK_NONEMPTY %d, got %d\n",
> +			what, expected, nonempty);
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +/* Wait until the whole payload is queued, so the hint is deterministic. */
> +static void inq_wait_queued(int fd, int len)
> +{
> +	if (!vsock_ioctl_int(fd, SIOCINQ, len)) {
> +		fprintf(stderr, "SIOCINQ not supported\n");
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +static void inq_send_chunks(const struct test_opts *opts, int chunks)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	int fd, i;
> +
> +	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> +	if (fd < 0) {
> +		perror("connect");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	memset(buf, 0xa5, sizeof(buf));
> +	for (i = 0; i < chunks; i++)
> +		send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> +
> +	control_writeln("SENT");
> +	control_expectln("DONE");
> +	close(fd);
> +}
> +
> +static void test_stream_uring_inq_client(const struct test_opts *opts)
> +{
> +	inq_send_chunks(opts, 2);
> +}
> +
> +static void test_stream_uring_inq_server(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	struct uring_inq_ctx ctx;
> +	unsigned int cflags;
> +	int res;
> +
> +	inq_server_init(&ctx, opts);
> +
> +	control_expectln("SENT");
> +	inq_wait_queued(ctx.fd, 2 * HINT_CHUNK_SIZE);
> +
> +	/* Data remains after this receive, so the flag must be set. */
> +	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> +	expect_res(res, HINT_CHUNK_SIZE, "partial receive");
> +	expect_nonempty(cflags, true, "partial receive");
> +
> +	/* This receive drains the queue while the peer stays connected. */
> +	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> +	expect_res(res, HINT_CHUNK_SIZE, "draining receive");
> +	expect_nonempty(cflags, false, "draining receive");
> +
> +	control_writeln("DONE");
> +	inq_server_exit(&ctx);
> +}
> +
> +static void test_stream_uring_inq_eof_client(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	int fd;
> +
> +	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> +	if (fd < 0) {
> +		perror("connect");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	memset(buf, 0x5a, sizeof(buf));
> +	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> +	control_writeln("SENT");
> +
> +	control_expectln("DRAINED");
> +	close(fd);
> +	control_writeln("CLOSED");
> +
> +	control_expectln("DONE");
> +}
> +
> +static void test_stream_uring_inq_eof_server(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	struct uring_inq_ctx ctx;
> +	unsigned int cflags;
> +	int res;
> +
> +	inq_server_init(&ctx, opts);
> +
> +	control_expectln("SENT");
> +	inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
> +
> +	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> +	expect_res(res, HINT_CHUNK_SIZE, "drain before EOF");
> +	expect_nonempty(cflags, false, "drain before EOF");
> +
> +	control_writeln("DRAINED");
> +	control_expectln("CLOSED");
> +
> +	/* The queue is empty and the peer is gone.  The hint stays non-zero
> +	 * so that this receive happens and reports EOF, as TCP does after a
> +	 * FIN.
> +	 */
> +	res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> +	expect_res(res, 0, "receive at EOF");
> +	expect_nonempty(cflags, true, "receive at EOF");
> +
> +	control_writeln("DONE");
> +	inq_server_exit(&ctx);
> +}
> +
> +static void test_stream_uring_inq_empty_client(const struct test_opts *opts)
> +{
> +	int fd;
> +
> +	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> +	if (fd < 0) {
> +		perror("connect");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	control_writeln("READY");
> +	control_expectln("DONE");
> +	close(fd);
> +}
> +
> +static void test_stream_uring_inq_empty_server(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	struct uring_inq_ctx ctx;
> +	unsigned int cflags;
> +	int res;
> +
> +	inq_server_init(&ctx, opts);
> +
> +	control_expectln("READY");
> +
> +	/* A failed receive must not leave a stale positive hint. */
> +	res = inq_recv(&ctx, buf, sizeof(buf), MSG_DONTWAIT, &cflags);
> +	expect_res(res, -EAGAIN, "empty nonblocking receive");
> +	expect_nonempty(cflags, false, "empty nonblocking receive");



> +
> +	control_writeln("DONE");
> +	inq_server_exit(&ctx);
> +}
> +
> +static void test_stream_uring_inq_zerolen_client(const struct test_opts *opts)
> +{
> +	inq_send_chunks(opts, 1);
> +}
> +
> +static void test_stream_uring_inq_zerolen_server(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	struct uring_inq_ctx ctx;
> +	unsigned int cflags;
> +	int res;
> +
> +	inq_server_init(&ctx, opts);
> +
> +	control_expectln("SENT");
> +	inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
> +
> +	/* A zero-length request is not an error and still describes the
> +	 * queue behind it.
> +	 */
> +	res = inq_recv(&ctx, buf, 0, 0, &cflags);
> +	expect_res(res, 0, "zero-length receive");
> +	expect_nonempty(cflags, true, "zero-length receive");
> +
> +	control_writeln("DONE");
> +	inq_server_exit(&ctx);
> +}
> +
> +static void test_stream_uring_inq_mshot_client(const struct test_opts *opts)
> +{
> +	char buf[HINT_CHUNK_SIZE];
> +	int fd;
> +
> +	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> +	if (fd < 0) {
> +		perror("connect");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	memset(buf, 0x3c, sizeof(buf));
> +	send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> +	control_writeln("SENT");
> +
> +	control_expectln("DRAINED");
> +	close(fd);
> +	control_writeln("CLOSED");
> +
> +	control_expectln("DONE");
> +}
> +
> +static void test_stream_uring_inq_mshot_server(const struct test_opts *opts)
> +{
> +	static char bufs[HINT_BUF_ENTRIES][HINT_CHUNK_SIZE];
> +	struct io_uring_buf_ring *br;
> +	struct uring_inq_ctx ctx;
> +	struct io_uring_sqe *sqe;
> +	struct io_uring_cqe *cqe;
> +	int i, ret;
> +
> +	inq_server_init(&ctx, opts);
> +
> +	br = io_uring_setup_buf_ring(&ctx.ring, HINT_BUF_ENTRIES,
> +				     HINT_BUF_GROUP, 0, &ret);
> +	if (!br) {
> +		fprintf(stderr, "io_uring_setup_buf_ring: %d\n", ret);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	for (i = 0; i < HINT_BUF_ENTRIES; i++)
> +		io_uring_buf_ring_add(br, bufs[i], HINT_CHUNK_SIZE, i,
> +				      io_uring_buf_ring_mask(HINT_BUF_ENTRIES),
> +				      i);
> +	io_uring_buf_ring_advance(br, HINT_BUF_ENTRIES);
> +
> +	sqe = io_uring_get_sqe(&ctx.ring);
> +	io_uring_prep_recv_multishot(sqe, ctx.fd, NULL, 0, 0);
> +	sqe->flags |= IOSQE_BUFFER_SELECT;
> +	sqe->buf_group = HINT_BUF_GROUP;
> +
> +	if (io_uring_submit(&ctx.ring) != 1)
> +		error(1, errno, "io_uring_submit");
> +
> +	control_expectln("SENT");
> +
> +	/* The payload completion drains the queue and keeps the request
> +	 * armed, so the hint must report the queue as empty.
> +	 */
> +	if (io_uring_wait_cqe(&ctx.ring, &cqe))
> +		error(1, errno, "io_uring_wait_cqe");
> +
> +	expect_res(cqe->res, HINT_CHUNK_SIZE, "multishot payload");
> +	expect_nonempty(cqe->flags, false, "multishot payload");

It looks like this assertion holds true even without the first patch,
since msg_inq is initalized to -1 and nonempty is only set if msg_inq >
0.

As of right now, this test actually passes without the first patch.
After cherry-picking only the tests to net-next and yanking out the
other test cases, I see:

	client exit=0
	server exit=0
	Control socket listening on 0.0.0.0:5200
	Control socket connection accepted...
	0 - SOCK_STREAM io_uring receive hint on empty queue...ok
	1 - SOCK_STREAM io_uring multishot receive hint...ok
	All tests have been executed. Waiting other peer...ok


I wonder if it might be better to have the sender send two chunks so we
can first assert that NONEMPTY is flipped on, and then again that it has
flipped back off?

Best,
Bobby

> +	if (!(cqe->flags & IORING_CQE_F_MORE)) {
> +		fprintf(stderr, "multishot payload: request not rearmed\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	io_uring_cqe_seen(&ctx.ring, cqe);
> +
> +	control_writeln("DRAINED");
> +	control_expectln("CLOSED");
> +
> +	/* EOF ends multishot regardless of the hint. */
> +	if (io_uring_wait_cqe(&ctx.ring, &cqe))
> +		error(1, errno, "io_uring_wait_cqe");
> +
> +	expect_res(cqe->res, 0, "multishot EOF");
> +	if (cqe->flags & IORING_CQE_F_MORE) {
> +		fprintf(stderr, "multishot EOF: request still armed\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	io_uring_cqe_seen(&ctx.ring, cqe);
> +
> +	control_writeln("DONE");
> +	io_uring_free_buf_ring(&ctx.ring, br, HINT_BUF_ENTRIES,
> +			       HINT_BUF_GROUP);
> +	inq_server_exit(&ctx);
> +}
> +
>  static struct test_case test_cases[] = {
>  	{
>  		.name = "SOCK_STREAM io_uring test",
> @@ -222,6 +564,31 @@ static struct test_case test_cases[] = {
>  		.run_server = test_stream_uring_msg_zc_server,
>  		.run_client = test_stream_uring_msg_zc_client,
>  	},
> +	{
> +		.name = "SOCK_STREAM io_uring receive queue hint",
> +		.run_server = test_stream_uring_inq_server,
> +		.run_client = test_stream_uring_inq_client,
> +	},
> +	{
> +		.name = "SOCK_STREAM io_uring receive hint at EOF",
> +		.run_server = test_stream_uring_inq_eof_server,
> +		.run_client = test_stream_uring_inq_eof_client,
> +	},
> +	{
> +		.name = "SOCK_STREAM io_uring receive hint on empty queue",
> +		.run_server = test_stream_uring_inq_empty_server,
> +		.run_client = test_stream_uring_inq_empty_client,
> +	},
> +	{
> +		.name = "SOCK_STREAM io_uring receive hint zero-length",
> +		.run_server = test_stream_uring_inq_zerolen_server,
> +		.run_client = test_stream_uring_inq_zerolen_client,
> +	},
> +	{
> +		.name = "SOCK_STREAM io_uring multishot receive hint",
> +		.run_server = test_stream_uring_inq_mshot_server,
> +		.run_client = test_stream_uring_inq_mshot_client,
> +	},
>  	{},
>  };
>  
> -- 
> 2.55.0
> 

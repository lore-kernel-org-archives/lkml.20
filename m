Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1204F4CEE66
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109462; cv=pass; b=cDNuLaH86Z4ByOdChAyjS4GUTc52esuD67sxePKU8KmxeOS61TOSbXw552L6cnxBxoEe0zvixJ4Kky9pUsG2q5qyG+7feTQHVJep9fC+R1PxZHqWVQWjjD1MCqiIkDtBmFvrxsBDs7g/FyOKWQqHRrtaN1zm8MSaRziOGf/lhKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109462; c=relaxed/simple;
	bh=1xMGOARwEIu2DR8benDMyCtm2caKFbpPVYwP0MkMm9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqI9Cln0GuQpXclIEAR2cwPSJc5QwUXaSM/M5mWYECP7/cemndOmI70/uFj3DAgB7xLRO3VdHaYfn/DFHFdOwC/KZ82vp7UptWHB4eel+nOVfhydw2kMHrZZJu5KWbzbrQvRe9IY4R/ylhkUMoxMHRevLam0yvM7Kntk5nKWI8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odukhIZn; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odukhIZn"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a3ed715so226048b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109450; cv=none;
        d=google.com; s=arc-20260327;
        b=kzstbawy+9sy20CmmO631XrwVgsa0SjXAVL2H7TX4k1xXiXbF7UeTFY3VLgCrkRydm
         TvPhTuPDlrltpSb3a6uRlhU3LcSeKtrRf4dDt08jpRtQ7LxBqbe56MDj2LKhHOVVXsNm
         7D15zV6zkVFt4LfDbmiHO0j4vbzdma28zawA2LaVcXePfg0YI2yzqpMCRBKK/mwAufr2
         bQOoIYLTbzp1N9YjOY6FM7568R6yWY/ithC0FeoDkjM0AbrsD2rxoktrAPk7w+5vtFls
         bDbtRPzyhalErZ0XFsgCnu38A1egFTpZfwWjFBEBkt+gfxSK7L/fHiyEY28C3e6tOdrP
         Gu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YajuveCYvFAe8RQ5HhGjiKFAe4wxkAmcf+W9ebvlvgM=;
        fh=Y1IWTIwl8DU5HEZJILEa8WsNNBDvxoM6MQ+NKyLTRPE=;
        b=W7CnAXJSPvoRP8KQNonRl0eEQi7Xfv35HZmMDifDHba274TVriIRzX6/gHFTA0HAqd
         Qy5rCedUM8fWsAavLJOGxzR76hilXs9GMPzqQuQi7bJH6LuuaO1CWTWrezDGqRDZi52w
         kHBvfrwJMc0Zfe58mgn/ThDLgsQzFqbrNgwcAUVJmDyNUxE4OlxOAjDntQoRVra86sDX
         EzZB/Brs51DxaFAqCO8bwDlXyXip7yCbJq66vCITeEfrC1H6UUXXhj2ULHx6sRum5Rft
         GqFVyCnXIC4tzIU0/KeJf0YU4wfIcXT3Ul5HG3c0TOMdwZonFVwV/WVKrN3sU3C3tStA
         YTvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109450; x=1790714250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YajuveCYvFAe8RQ5HhGjiKFAe4wxkAmcf+W9ebvlvgM=;
        b=odukhIZnXKlRifrUj/SxJdA1EYeFmC82oSVZYEWQjaFS7GOsMc6yjkIItU5Gf25jT1
         7JG4ZuU5dhfFnKRMAM8J9WhL6FMnbfQlOZ4GgeoGbFXB55kFa8/t7fIowtFWeJOK5LFp
         Z43+l9remWOGrKO5g7lC+dV0ZxombgQh5C4TKsW0CLeJyRhGdyCooDtSIEmwPKBwqYbF
         BL7ZIry2+lK+y7w0aMGbotH0pxR4Gemf5u0B4TgVg1RNLB98fkOV0N/5gSG7Nf6gSP7h
         iGwvyJ48nGKyPdFFakkHrq8Jzs8op2hWY8g9p4hNT5QEvDRoaBs26NNmGoCjqKH3LwGm
         BFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109450; x=1790714250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YajuveCYvFAe8RQ5HhGjiKFAe4wxkAmcf+W9ebvlvgM=;
        b=MzH2KT27zjdd+rGyd9+Sgki3Ubdslqv/JPdhvSdwUVEYouJ7NYYkIv76cFTd6GRm0g
         pIsL7/xRv0iI4t85/VKfO8T0t4UaDv1r8bfl/1HSy37RZZ+QFbrzasR0YRQEGYtC7OSd
         AxvTkAOED9cLr7gGSzfjj2yMp6fKpogT49CygbBJt+BI/7yDQqpvCp1ej/PkqV3v7c7Q
         lpkhEmIvvp5CXZaDTdZnwmEP/GtQ7cECoxf2BeIWy5IyOSRlOnTxWj3GbCxE3VA6uHcL
         DEiCp7bPMIIcd1FaG+HREDBb73Bc7o8fVsXwx+B7Iv4UWdyiD0xUNfq4hSzvWMpjbs6g
         smow==
X-Forwarded-Encrypted: i=1; AKwUvByr5BjsU1/vuurWWJl5qYi+Y3MQ4SoWyH1tCcKvNzBTIcTTbKAN7VQI115mt1dl3vHyVRFLh+ts3TBLikw=@vger.kernel.org
X-Gm-Message-State: AFuF++kryePBceWX0Fw/6vmKY0BMA0yn/1T/0xdXK8K3VEpt6XrLFWiZ
	Z4KRwbfz3yVgOBQ97XcAeVAP4LG67tlPzre4Ze04iuNjfYNPuIYJNVufQKgyZWWfMd4GOeIMgLY
	FaTyMeIj8rG0skM94IkmNBYMk1FD3lKs=
X-Gm-Gg: AYBFou2Pdsw/wknub5nbFct42JZURhxdqXdGJTMlHdd5KPptPeWmfeF4dssTVF5sZg6
	9VsgFnO7zAzZzashfxcIPlb0o1H/rs0IjEA4hugA/U4qQXywOp//a147x4jgDnXCKBF+cxDYuYj
	KCqOD6ZjMWXMMWE4dYWoXIjtqG6lCVTYZlUKKtiqXqrxBhT1/Xikr/iQzCkL/bsF/qV6hFnu+TB
	jPPYGJuiSaFH7Etl/EZNPRjzaWphi/fjmbpZNJIu1YUZ1cmg96m+6abFf4hpwC/XwYYzatmc4Za
	apzY6sjG6N4N2miOe/GjV2oVudxC2dwwDLNktp8z9zOkIM8DDQy8CLqdygpIVvijVRfsi/l69d6
	QOXdohyAqAA==
X-Received: by 2002:a05:6808:4f5f:b0:4b9:a829:f012 with SMTP id
 5614622812f47-4d5b940eafdmr643857b6e.30.1790109450424; Tue, 22 Sep 2026
 13:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920194710.1114748-1-devnexen@gmail.com> <20260920194710.1114748-3-devnexen@gmail.com>
 <arK8L3S5F+9XREpe@devvm29614.prn0.facebook.com>
In-Reply-To: <arK8L3S5F+9XREpe@devvm29614.prn0.facebook.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 22 Sep 2026 21:37:19 +0100
X-Gm-Features: AcwNN1WKoxG4IBZqxkv2vlA5ApCCJffe59_-wPbMkNo4-oryaAuwKGBxd1LTreU
Message-ID: <CA+XhMqyEPSZEFY7j3eYXfrtbNMd7w3B0AYFEv1f_FEax4rKtng@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] vsock/test: cover receive queue hints
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: netdev@vger.kernel.org, sgarzare@redhat.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bobby.

Indeed, io_uring presets msg_inq to -1, so that check passes either
way. Sending two chunks makes sense: SOCK_NONEMPTY on the first
completion, not on the second.

The empty queue case passing without patch 1 is expected. It is there
to catch a stale positive hint on the error path rather than to show
the new behaviour.
Cheers.

On Tue, 22 Sept 2026 at 18:34, Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
>
> On Sun, Sep 20, 2026 at 08:47:10PM +0100, David Carlier wrote:
> > Add io_uring receive tests checking IORING_CQE_F_SOCK_NONEMPTY across a
> > partial receive, draining while the peer stays connected, EOF, a
> > nonblocking receive on an empty queue, a zero-length request, and a
> > multishot receive with provided buffers.
> >
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  tools/testing/vsock/vsock_uring_test.c | 367 +++++++++++++++++++++++++
> >  1 file changed, 367 insertions(+)
> >
> > diff --git a/tools/testing/vsock/vsock_uring_test.c b/tools/testing/vsock/vsock_uring_test.c
> > index 5c3078969659..318e17bd28bc 100644
> > --- a/tools/testing/vsock/vsock_uring_test.c
> > +++ b/tools/testing/vsock/vsock_uring_test.c
> > @@ -13,7 +13,10 @@
> >  #include <liburing.h>
> >  #include <unistd.h>
> >  #include <sys/mman.h>
> > +#include <sys/ioctl.h>
> >  #include <linux/kernel.h>
> > +#include <linux/sockios.h>
> > +#include <errno.h>
> >  #include <error.h>
> >
> >  #include "util.h"
> > @@ -28,6 +31,10 @@
> >
> >  #define VSOCK_TEST_DATA_MAX_IOV 3
> >
> > +#define HINT_CHUNK_SIZE              4096
> > +#define HINT_BUF_GROUP               1
> > +#define HINT_BUF_ENTRIES     4
> > +
> >  struct vsock_io_uring_test {
> >       /* Number of valid elements in 'vecs'. */
> >       int vecs_cnt;
> > @@ -211,6 +218,341 @@ void test_stream_uring_msg_zc_client(const struct test_opts *opts)
> >               vsock_io_uring_client(opts, &test_data_array[i], true);
> >  }
> >
> > +struct uring_inq_ctx {
> > +     struct io_uring ring;
> > +     int fd;
> > +};
> > +
> > +static void inq_server_init(struct uring_inq_ctx *ctx,
> > +                         const struct test_opts *opts)
> > +{
> > +     ctx->fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
> > +     if (ctx->fd < 0) {
> > +             perror("accept");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     if (io_uring_queue_init(RING_ENTRIES_NUM, &ctx->ring, 0))
> > +             error(1, errno, "io_uring_queue_init");
> > +}
> > +
> > +static void inq_server_exit(struct uring_inq_ctx *ctx)
> > +{
> > +     io_uring_queue_exit(&ctx->ring);
> > +     close(ctx->fd);
> > +}
> > +
> > +/* Submit a single receive and report both its result and its CQE flags. */
> > +static int inq_recv(struct uring_inq_ctx *ctx, void *buf, size_t len,
> > +                 int flags, unsigned int *cflags)
> > +{
> > +     struct io_uring_sqe *sqe;
> > +     struct io_uring_cqe *cqe;
> > +     int res;
> > +
> > +     sqe = io_uring_get_sqe(&ctx->ring);
> > +     io_uring_prep_recv(sqe, ctx->fd, buf, len, flags);
> > +
> > +     if (io_uring_submit(&ctx->ring) != 1)
> > +             error(1, errno, "io_uring_submit");
> > +
> > +     if (io_uring_wait_cqe(&ctx->ring, &cqe))
> > +             error(1, errno, "io_uring_wait_cqe");
> > +
> > +     res = cqe->res;
> > +     *cflags = cqe->flags;
> > +     io_uring_cqe_seen(&ctx->ring, cqe);
> > +
> > +     return res;
> > +}
> > +
> > +static void expect_res(int res, int expected, const char *what)
> > +{
> > +     if (res != expected) {
> > +             fprintf(stderr, "%s: expected %d, got %d\n", what, expected,
> > +                     res);
> > +             exit(EXIT_FAILURE);
> > +     }
> > +}
> > +
> > +static void expect_nonempty(unsigned int cflags, bool expected,
> > +                         const char *what)
> > +{
> > +     bool nonempty = !!(cflags & IORING_CQE_F_SOCK_NONEMPTY);
> > +
> > +     if (nonempty != expected) {
> > +             fprintf(stderr, "%s: expected SOCK_NONEMPTY %d, got %d\n",
> > +                     what, expected, nonempty);
> > +             exit(EXIT_FAILURE);
> > +     }
> > +}
> > +
> > +/* Wait until the whole payload is queued, so the hint is deterministic. */
> > +static void inq_wait_queued(int fd, int len)
> > +{
> > +     if (!vsock_ioctl_int(fd, SIOCINQ, len)) {
> > +             fprintf(stderr, "SIOCINQ not supported\n");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +}
> > +
> > +static void inq_send_chunks(const struct test_opts *opts, int chunks)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     int fd, i;
> > +
> > +     fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> > +     if (fd < 0) {
> > +             perror("connect");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     memset(buf, 0xa5, sizeof(buf));
> > +     for (i = 0; i < chunks; i++)
> > +             send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> > +
> > +     control_writeln("SENT");
> > +     control_expectln("DONE");
> > +     close(fd);
> > +}
> > +
> > +static void test_stream_uring_inq_client(const struct test_opts *opts)
> > +{
> > +     inq_send_chunks(opts, 2);
> > +}
> > +
> > +static void test_stream_uring_inq_server(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     struct uring_inq_ctx ctx;
> > +     unsigned int cflags;
> > +     int res;
> > +
> > +     inq_server_init(&ctx, opts);
> > +
> > +     control_expectln("SENT");
> > +     inq_wait_queued(ctx.fd, 2 * HINT_CHUNK_SIZE);
> > +
> > +     /* Data remains after this receive, so the flag must be set. */
> > +     res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> > +     expect_res(res, HINT_CHUNK_SIZE, "partial receive");
> > +     expect_nonempty(cflags, true, "partial receive");
> > +
> > +     /* This receive drains the queue while the peer stays connected. */
> > +     res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> > +     expect_res(res, HINT_CHUNK_SIZE, "draining receive");
> > +     expect_nonempty(cflags, false, "draining receive");
> > +
> > +     control_writeln("DONE");
> > +     inq_server_exit(&ctx);
> > +}
> > +
> > +static void test_stream_uring_inq_eof_client(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     int fd;
> > +
> > +     fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> > +     if (fd < 0) {
> > +             perror("connect");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     memset(buf, 0x5a, sizeof(buf));
> > +     send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> > +     control_writeln("SENT");
> > +
> > +     control_expectln("DRAINED");
> > +     close(fd);
> > +     control_writeln("CLOSED");
> > +
> > +     control_expectln("DONE");
> > +}
> > +
> > +static void test_stream_uring_inq_eof_server(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     struct uring_inq_ctx ctx;
> > +     unsigned int cflags;
> > +     int res;
> > +
> > +     inq_server_init(&ctx, opts);
> > +
> > +     control_expectln("SENT");
> > +     inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
> > +
> > +     res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> > +     expect_res(res, HINT_CHUNK_SIZE, "drain before EOF");
> > +     expect_nonempty(cflags, false, "drain before EOF");
> > +
> > +     control_writeln("DRAINED");
> > +     control_expectln("CLOSED");
> > +
> > +     /* The queue is empty and the peer is gone.  The hint stays non-zero
> > +      * so that this receive happens and reports EOF, as TCP does after a
> > +      * FIN.
> > +      */
> > +     res = inq_recv(&ctx, buf, sizeof(buf), 0, &cflags);
> > +     expect_res(res, 0, "receive at EOF");
> > +     expect_nonempty(cflags, true, "receive at EOF");
> > +
> > +     control_writeln("DONE");
> > +     inq_server_exit(&ctx);
> > +}
> > +
> > +static void test_stream_uring_inq_empty_client(const struct test_opts *opts)
> > +{
> > +     int fd;
> > +
> > +     fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> > +     if (fd < 0) {
> > +             perror("connect");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     control_writeln("READY");
> > +     control_expectln("DONE");
> > +     close(fd);
> > +}
> > +
> > +static void test_stream_uring_inq_empty_server(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     struct uring_inq_ctx ctx;
> > +     unsigned int cflags;
> > +     int res;
> > +
> > +     inq_server_init(&ctx, opts);
> > +
> > +     control_expectln("READY");
> > +
> > +     /* A failed receive must not leave a stale positive hint. */
> > +     res = inq_recv(&ctx, buf, sizeof(buf), MSG_DONTWAIT, &cflags);
> > +     expect_res(res, -EAGAIN, "empty nonblocking receive");
> > +     expect_nonempty(cflags, false, "empty nonblocking receive");
>
>
>
> > +
> > +     control_writeln("DONE");
> > +     inq_server_exit(&ctx);
> > +}
> > +
> > +static void test_stream_uring_inq_zerolen_client(const struct test_opts *opts)
> > +{
> > +     inq_send_chunks(opts, 1);
> > +}
> > +
> > +static void test_stream_uring_inq_zerolen_server(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     struct uring_inq_ctx ctx;
> > +     unsigned int cflags;
> > +     int res;
> > +
> > +     inq_server_init(&ctx, opts);
> > +
> > +     control_expectln("SENT");
> > +     inq_wait_queued(ctx.fd, HINT_CHUNK_SIZE);
> > +
> > +     /* A zero-length request is not an error and still describes the
> > +      * queue behind it.
> > +      */
> > +     res = inq_recv(&ctx, buf, 0, 0, &cflags);
> > +     expect_res(res, 0, "zero-length receive");
> > +     expect_nonempty(cflags, true, "zero-length receive");
> > +
> > +     control_writeln("DONE");
> > +     inq_server_exit(&ctx);
> > +}
> > +
> > +static void test_stream_uring_inq_mshot_client(const struct test_opts *opts)
> > +{
> > +     char buf[HINT_CHUNK_SIZE];
> > +     int fd;
> > +
> > +     fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> > +     if (fd < 0) {
> > +             perror("connect");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     memset(buf, 0x3c, sizeof(buf));
> > +     send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
> > +     control_writeln("SENT");
> > +
> > +     control_expectln("DRAINED");
> > +     close(fd);
> > +     control_writeln("CLOSED");
> > +
> > +     control_expectln("DONE");
> > +}
> > +
> > +static void test_stream_uring_inq_mshot_server(const struct test_opts *opts)
> > +{
> > +     static char bufs[HINT_BUF_ENTRIES][HINT_CHUNK_SIZE];
> > +     struct io_uring_buf_ring *br;
> > +     struct uring_inq_ctx ctx;
> > +     struct io_uring_sqe *sqe;
> > +     struct io_uring_cqe *cqe;
> > +     int i, ret;
> > +
> > +     inq_server_init(&ctx, opts);
> > +
> > +     br = io_uring_setup_buf_ring(&ctx.ring, HINT_BUF_ENTRIES,
> > +                                  HINT_BUF_GROUP, 0, &ret);
> > +     if (!br) {
> > +             fprintf(stderr, "io_uring_setup_buf_ring: %d\n", ret);
> > +             exit(EXIT_FAILURE);
> > +     }
> > +
> > +     for (i = 0; i < HINT_BUF_ENTRIES; i++)
> > +             io_uring_buf_ring_add(br, bufs[i], HINT_CHUNK_SIZE, i,
> > +                                   io_uring_buf_ring_mask(HINT_BUF_ENTRIES),
> > +                                   i);
> > +     io_uring_buf_ring_advance(br, HINT_BUF_ENTRIES);
> > +
> > +     sqe = io_uring_get_sqe(&ctx.ring);
> > +     io_uring_prep_recv_multishot(sqe, ctx.fd, NULL, 0, 0);
> > +     sqe->flags |= IOSQE_BUFFER_SELECT;
> > +     sqe->buf_group = HINT_BUF_GROUP;
> > +
> > +     if (io_uring_submit(&ctx.ring) != 1)
> > +             error(1, errno, "io_uring_submit");
> > +
> > +     control_expectln("SENT");
> > +
> > +     /* The payload completion drains the queue and keeps the request
> > +      * armed, so the hint must report the queue as empty.
> > +      */
> > +     if (io_uring_wait_cqe(&ctx.ring, &cqe))
> > +             error(1, errno, "io_uring_wait_cqe");
> > +
> > +     expect_res(cqe->res, HINT_CHUNK_SIZE, "multishot payload");
> > +     expect_nonempty(cqe->flags, false, "multishot payload");
>
> It looks like this assertion holds true even without the first patch,
> since msg_inq is initalized to -1 and nonempty is only set if msg_inq >
> 0.
>
> As of right now, this test actually passes without the first patch.
> After cherry-picking only the tests to net-next and yanking out the
> other test cases, I see:
>
>         client exit=0
>         server exit=0
>         Control socket listening on 0.0.0.0:5200
>         Control socket connection accepted...
>         0 - SOCK_STREAM io_uring receive hint on empty queue...ok
>         1 - SOCK_STREAM io_uring multishot receive hint...ok
>         All tests have been executed. Waiting other peer...ok
>
>
> I wonder if it might be better to have the sender send two chunks so we
> can first assert that NONEMPTY is flipped on, and then again that it has
> flipped back off?
>
> Best,
> Bobby
>
> > +     if (!(cqe->flags & IORING_CQE_F_MORE)) {
> > +             fprintf(stderr, "multishot payload: request not rearmed\n");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +     io_uring_cqe_seen(&ctx.ring, cqe);
> > +
> > +     control_writeln("DRAINED");
> > +     control_expectln("CLOSED");
> > +
> > +     /* EOF ends multishot regardless of the hint. */
> > +     if (io_uring_wait_cqe(&ctx.ring, &cqe))
> > +             error(1, errno, "io_uring_wait_cqe");
> > +
> > +     expect_res(cqe->res, 0, "multishot EOF");
> > +     if (cqe->flags & IORING_CQE_F_MORE) {
> > +             fprintf(stderr, "multishot EOF: request still armed\n");
> > +             exit(EXIT_FAILURE);
> > +     }
> > +     io_uring_cqe_seen(&ctx.ring, cqe);
> > +
> > +     control_writeln("DONE");
> > +     io_uring_free_buf_ring(&ctx.ring, br, HINT_BUF_ENTRIES,
> > +                            HINT_BUF_GROUP);
> > +     inq_server_exit(&ctx);
> > +}
> > +
> >  static struct test_case test_cases[] = {
> >       {
> >               .name = "SOCK_STREAM io_uring test",
> > @@ -222,6 +564,31 @@ static struct test_case test_cases[] = {
> >               .run_server = test_stream_uring_msg_zc_server,
> >               .run_client = test_stream_uring_msg_zc_client,
> >       },
> > +     {
> > +             .name = "SOCK_STREAM io_uring receive queue hint",
> > +             .run_server = test_stream_uring_inq_server,
> > +             .run_client = test_stream_uring_inq_client,
> > +     },
> > +     {
> > +             .name = "SOCK_STREAM io_uring receive hint at EOF",
> > +             .run_server = test_stream_uring_inq_eof_server,
> > +             .run_client = test_stream_uring_inq_eof_client,
> > +     },
> > +     {
> > +             .name = "SOCK_STREAM io_uring receive hint on empty queue",
> > +             .run_server = test_stream_uring_inq_empty_server,
> > +             .run_client = test_stream_uring_inq_empty_client,
> > +     },
> > +     {
> > +             .name = "SOCK_STREAM io_uring receive hint zero-length",
> > +             .run_server = test_stream_uring_inq_zerolen_server,
> > +             .run_client = test_stream_uring_inq_zerolen_client,
> > +     },
> > +     {
> > +             .name = "SOCK_STREAM io_uring multishot receive hint",
> > +             .run_server = test_stream_uring_inq_mshot_server,
> > +             .run_client = test_stream_uring_inq_mshot_client,
> > +     },
> >       {},
> >  };
> >
> > --
> > 2.55.0
> >

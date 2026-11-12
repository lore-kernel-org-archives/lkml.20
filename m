Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518050;
	b=DzpQPF1y/BMZ0V9Beo+zOVmHhkSxN/s9ehlIIgVzQoO/qI8T5ztHJY+/QIsCFdgQWbum
	 rYsK8mNsT7yG5Cb02LbpJ563HZfuGzK+mPZdo+sj0JX2zePUHSkzOAsrFJw98Qn5Gi33l
	 F5Mfim3ZS/XAuahoaRiiVFuMVMhkiOA4CTbBNQnbcgZ3nlze9A467FRmo32h/uoGnOYEN
	 pYwiIrU4RZxdhoAs1F7KyjG6woT4TS6iQG1zs4aV4NC5JUZtkxax4Yqe4U6hgjye3jNxf
	 GNBvP8f1aqQKB0ILPjKpCngKkNmCe9dD6Chpib9/MuVtQeq8e3cvrtxvNlh1aHWFp7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PrfXz08H+34PFhR+mDKWipfCfKpSe7p7ek5/2sq7ELs=;
	b=xCZ5foeTwp4PI7m9X7aAktqlb83I3o/45+wEjKt40fENwbRUypzOoKb821bG3Px9UrVm
	 MT1ZRNLVFV163rdDcOFV2QLduI8XJzn3QbrbeeRBBZ/ZxA7lktPX7KA+ioEBiCaVVMOOU
	 IRIi6KVqpoIjP/1qbsRCVXsI/Q04ClIIJBu0jVt7lMJdmH69j0qLSIUukxMs6ZpmwcieR
	 AOtMEh3UCmyjWDKxV1/MDRgbXePDQTOhITlwqdbwLz0TRFNcy/7sfK1doTGq6+jyJu2Nm
	 q+mwwjwgeBq3oK7g7UrA7kcA68djiiy/YIqMvNoTzkvi5tHVISCuOs8QRBBN5T1ZZ0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcBHXqCn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967EC606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcBHXqCn
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so212942b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794518049; cv=none;
        d=google.com; s=arc-20260327;
        b=ounFxBH0JL53WVQnFmUwjBRB+otvbWW6EXReyyaHpQMKqtbLGcY8ABasIOyJw+vl9+
         /aJSPYkHSynL52prZ1M2lXgytV5m5+Sv/Mlv4ijUw1ELzSABCqMWuERPuZfaVss9YiuF
         f0Xc55KS5xVBVVsNi5dzd5RWQYwKwp8umey2na8kYihw0VmcpTOOLfGkjmaiSfnjADbc
         CxcjnWgt4VMn6P9BatpFUVq6X6ZRhbyvU6pKH/KzF1cF24PZmUT47+Mtzjks4pRZq0Hz
         yd8nAkHwi4RsRF5NrWZhAub4yW3LMlFu4gN0ytz+DvA0aESl1OA+ce0ijEH0o2p5Xw9J
         EU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PrfXz08H+34PFhR+mDKWipfCfKpSe7p7ek5/2sq7ELs=;
        fh=Q2NqiRBBqQBTjuznn076zEKnaiaGLXyWRP7PxYErXxg=;
        b=nNrsex9bAETlw+YfC9Fa1bAaGAeu4epGfrLdZN3+uTc29CC3+tt+JQ4q6TSUEIYS+M
         fD6X+47M+eNy79tVXd50jXHyKrbqdkH9xvMUoR5UMwmokxkgd9jwmBpHhw2bJqM26JcJ
         1G/sOXTAredPs9LECacz3BMAq1Mqz4IiZVzSnjBAFk3L7sKBXFplZJnggBIcTMgpKVP6
         msgR4I4JSWL5OYgmkV6XdLNkr6VEh0wS4FErk5aotwOlW/kEQRWZSHGYhcsaYqghDLpu
         HVLOh9WDBztQiDVpAnmygly3QkXab7QsYi54wrpgERntC620snN4k1wcZFa3bl4WK9Gy
         14sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794518049; x=1795122849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PrfXz08H+34PFhR+mDKWipfCfKpSe7p7ek5/2sq7ELs=;
        b=WcBHXqCnx04AgsRRw+B9o59yp2jyEV1UiqvXVnqHdIt5kuB0FmrnJjWM33pISB72n+
         QLfzexQSV6KYXC6u/e5ecjNr/vOnIaAox+ghv42a6me77npj6BqhlmhXDtKXV/Zkg4rM
         utOxFtup3mHOIaz2bHCU23D3ksUbwi8jHLV+F5Fh8oILCQurqEBRzLEebYQh82cUk9ZY
         8LjEOQh1/4uWqWZ+rSMroLhSn7NGWOQTwm3B1RNvGbxShpMZGM9++aEeYs30VMswGvsj
         hDWHsXkMvmYY7rYyeRNJJs7o4E09heEvTdDasSvAliBjoZgk/PFzXphtt+n76mUMuA/C
         OWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794518049; x=1795122849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrfXz08H+34PFhR+mDKWipfCfKpSe7p7ek5/2sq7ELs=;
        b=TX6zzVoNSeqI1QB+GcM15EjM0i3ncvRoed6i+0HCMA1rLBW0j39QgQN0Ms60kphpaS
         xyFPYAHIV9rRF2FaK/QyuJmEpXqfnKnmnXmBpU8Of4JEgsBMs746OpSINepvTnTbVo09
         o/ybBHGAtfWwfwWbCw1G9gLilsBxO3eEsLOppE9bvkZi3B3sI5L9zSKX1Oyoq0zqq6Z5
         BHmJeTNL3wgb/cmeBb5I0V/DWmcYQH2uoTt1jT34QjdyE/n0HgSO2GpTkxJu0sHVN+y4
         MsIymI7eybb6LZun9r37sXVVpD7ydzmPhKwqs9k7uOyk5KDagW3FFZJDapYPcPAbncUl
         6lfQ==
X-Forwarded-Encrypted: i=1; AL+hErFxXY5zYNfaRGSm1rTclQZAKa0U8P6Py28hJMo2GV5sIgEGE9tcJU/a+uLGZp8HJGIBLCm170hWHgWDk74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dBIt3Du+UAAXsqdTnLXynP1txLC+ZbGQENf373sQAi8WOb7lT
	QYzdFp4A84AenZeZajRd+4XppxsYSKzO0v6OYBcOyU2j2kcONsYVQ0eDXT0NiSMf6wTkhQkibHR
	eO2nZW6uL22qYLhxZHGS0/UJ6mTmxJEM=
X-Gm-Gg: AYBFou2/HIDwpZFOZeqdzaFbU+DAUaXJFMqbs3iqHWEl1C2AOWzNtgbBgLZR6pKstgK
	tzQn7DKjfHVYex/hxd6j6YoNCgN9MjzpUuSNwUtis2zlwAJ6TnvNtC3WcsQUfcKM1CJLYhxbH1V
	sbX84Bk03On13ltRkEivIVA1+v6mVTA6SqrB36yOUO7AvBixKl/6l8cnxEUvd41MEPL1cbv6uLz
	Q5xB9J02bC931jVWV2rL0n3MHGl8UDhIj6D0y5yx/MRHSmmNHLetCc1f/3+TgZSAUX0UFvvYHZZ
	dErXMsd2RWRYfy7fbZ7VZydAvnIq2fGy0pP8CRK1yx8dRfmkEsBeRFoLboMgBwAPYm5lVQ8MnDY
	DqATiMiN4BEowvfTD7YfvbSauoonvulYTRXc3sFh4gXUSgObqyIfQAbweLXpUqiV4I4YMHHhn70
	TzluPglyfgVQgKvVZdwSiz4P9tgGrJuHAoJpSoWLLqBqPYu0xgHK5MEJJXD9urZJQI7yMtEKvp7
	iJZ08hbOFPN0Vb392Q=
X-Received: by 2002:a05:6a00:2311:b0:891:3e34:e06f with SMTP id
 d2e1a72fcca58-8beb7539e7fmr667897b3a.44.1794518048547; Thu, 12 Nov 2026
 13:14:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120212.1110283-1-pkfxxxing@gmail.com> <20261110120212.1110283-2-pkfxxxing@gmail.com>
In-Reply-To: <20261110120212.1110283-2-pkfxxxing@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 12 Nov 2026 16:13:56 -0500
X-Gm-Features: AclHuK8r89MZhNaP-FJ80tjfRygA5rIFvNd4P4o3dAcP_IW4NOz1scQ_2zf5I0s
Message-ID: <CADvbK_dYGutb+-D+Q6pA2MSJr6WZGQUrD+6haS1NoMqaxZ5a5Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] sctp: revalidate the association socket in timer callbacks
To: liuyong <pkfxxxing@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:03=E2=80=AFAM liuyong <pkfxxxing@gmail.com> wrote=
:
>
> SCTP timer callbacks cache asoc->base.sk before acquiring its BH lock.
> An accept or peeloff can move the association to a new socket in between.
> The callback can then run the state machine under the old socket lock,
> while an abort on the new socket tears down the association's queues.
> The timer's transport and association references do not keep those
> queues alive. With delays inserted to widen the race, KASAN reported a
> slab-use-after-free in sctp_chunk_abandoned() from the T3 retransmit path=
.
>
> Recheck the association's socket after acquiring its BH lock. Treat a
> mismatch like a busy socket and use the existing reference-counted timer
> rescheduling path. The next callback reads the current socket again,
> preventing state-machine execution under the old socket's lock. Retain
> the user-ownership check to handle a migration already in progress.
>
> Apply the check to the T3, association, heartbeat, protocol-unreachable,
> reconfiguration and probe timers. Their BH context and the endpoint's
> RCU-deferred sock_put() protect the cached socket during the callback.
> Pair the socket pointer reads with WRITE_ONCE() in sctp_assoc_migrate(),
> taking the new socket reference before updating the pointer.
>
> The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
> system.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: liuyong <pkfxxxing@gmail.com>
> ---
>  net/sctp/associola.c     |  4 ++--
>  net/sctp/sm_sideeffect.c | 41 ++++++++++++++++++++--------------------
>  2 files changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/net/sctp/associola.c b/net/sctp/associola.c
> index 4521be3bd8..c5d520c8d7 100644
> --- a/net/sctp/associola.c
> +++ b/net/sctp/associola.c
> @@ -1088,8 +1088,8 @@ void sctp_assoc_migrate(struct sctp_association *as=
soc, struct sock *newsk)
>         sctp_endpoint_hold(assoc->ep);
>
>         /* Get a reference to the new sock.  */
> -       assoc->base.sk =3D newsk;
> -       sock_hold(assoc->base.sk);
> +       sock_hold(newsk);
> +       WRITE_ONCE(assoc->base.sk, newsk);
>
>         /* Add the association to the new endpoint's list of associations=
.  */
>         sctp_endpoint_add_asoc(newsp->ep, assoc);
> diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
> index 35f540fb15..bd6b23369f 100644
> --- a/net/sctp/sm_sideeffect.c
> +++ b/net/sctp/sm_sideeffect.c
> @@ -233,15 +233,14 @@ void sctp_generate_t3_rtx_event(struct timer_list *=
t)
>         struct sctp_transport *transport =3D
>                 timer_container_of(transport, t, T3_rtx_timer);
>         struct sctp_association *asoc =3D transport->asoc;
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>         int error;
>
> -       /* Check whether a task is in the sock.  */
> -
> +       /* Defer if the socket is busy or the association has migrated. *=
/
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy\n", __func__);
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved\n", __func__);
>
>                 /* Try again later.  */
>                 sctp_transport_hold(transport);
> @@ -271,13 +270,13 @@ void sctp_generate_t3_rtx_event(struct timer_list *=
t)
>  static void sctp_generate_timeout_event(struct sctp_association *asoc,
>                                         enum sctp_event_timeout timeout_t=
ype)
>  {
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>         int error =3D 0;
>
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy: timer %d\n", __func__,
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved: timer %d\n", __func_=
_,
>                          timeout_type);
>
>                 /* Try again later.  */
> @@ -362,7 +361,7 @@ static void sctp_generate_autoclose_event(struct time=
r_list *t)
>         sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_AUTOCLOSE);
>  }
>
> -/* Generate a heart beat event.  If the sock is busy, reschedule.   Make
> +/* Generate a heart beat event.  If the sock is busy or moved, reschedul=
e.   Make
>   * sure that the transport is still valid.
>   */
>  void sctp_generate_heartbeat_event(struct timer_list *t)
> @@ -370,14 +369,14 @@ void sctp_generate_heartbeat_event(struct timer_lis=
t *t)
>         struct sctp_transport *transport =3D timer_container_of(transport=
, t,
>                                                               hb_timer);
>         struct sctp_association *asoc =3D transport->asoc;
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>         u32 elapsed, timeout;
>         int error =3D 0;
>
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy\n", __func__);
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved\n", __func__);
>
>                 /* Try again later.  */
>                 sctp_transport_hold(transport);
> @@ -418,12 +417,12 @@ void sctp_generate_proto_unreach_event(struct timer=
_list *t)
>         struct sctp_transport *transport =3D
>                 timer_container_of(transport, t, proto_unreach_timer);
>         struct sctp_association *asoc =3D transport->asoc;
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy\n", __func__);
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved\n", __func__);
>
>                 /* Try again later.  */
>                 sctp_transport_hold(transport);
> @@ -454,13 +453,13 @@ void sctp_generate_reconf_event(struct timer_list *=
t)
>         struct sctp_transport *transport =3D
>                 timer_container_of(transport, t, reconf_timer);
>         struct sctp_association *asoc =3D transport->asoc;
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>         int error =3D 0;
>
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy\n", __func__);
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved\n", __func__);
>
>                 /* Try again later.  */
>                 sctp_transport_hold(transport);
> @@ -492,13 +491,13 @@ void sctp_generate_probe_event(struct timer_list *t=
)
>         struct sctp_transport *transport =3D timer_container_of(transport=
, t,
>                                                               probe_timer=
);
>         struct sctp_association *asoc =3D transport->asoc;
> -       struct sock *sk =3D asoc->base.sk;
> +       struct sock *sk =3D READ_ONCE(asoc->base.sk);
>         struct net *net =3D sock_net(sk);
>         int error =3D 0;
>
>         bh_lock_sock(sk);
> -       if (sock_owned_by_user(sk)) {
> -               pr_debug("%s: sock is busy\n", __func__);
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
> +               pr_debug("%s: sock is busy or moved\n", __func__);
>
>                 /* Try again later.  */
>                 sctp_transport_hold(transport);
> --
> 2.43.0
>
Please check the sashiko report:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110120212.1110283-=
2-pkfxxxing%40gmail.com

I think you also need to use READ_ONCE() in sctp_err_lookup() and pass sk
to sctp_v4_err_handle() and sctp_v6_err_handle(), and then add
sk !=3D READ_ONCE(asoc->base.sk) check next to sock_owned_by_user(sk) in th=
e
functions it calls like:
sctp_icmp_frag_needed()/sctp_icmp_proto_unreachable()/sctp_icmp_redirect().

Also, use READ_ONCE() in quic_rcv() and sctp_backlog_rcv().

Thanks.

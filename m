Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6B4BEE48
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006068; cv=pass; b=h48gc7CCYBLP5snjy5eXTHK+Ha2tZyZUmnTcBqZKEJkzZp+fB/w9lBrqQnOOx5V3WgGyuiH4UnoBgx8is+fF4k5wpHj2+MuYmFY5SmwmdmvngI8gJ8YyK5xP3b4mu475XCtmETy5KFF5fk5NJPRLKmsMetS6OTD37+jRYPzFHIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006068; c=relaxed/simple;
	bh=sQtxNuwP8U/DeBKHqQPCVRYjm+Ou8P3OSBqoTTcuKRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+ZO+76zf07icK+gHP23E5I/4ouqt90/TH1MS0lwzi2RrIjffR/AxowqsZwzMFJDz6nhq/eWnHD+GMXUcTglS07CmKTRqQcebHscGoPHgfHed2rwumOVR2tIdPFPDvb8/XhVtdWIvKA4NCCGpY0X1baqiZkzh8qqbSTsFO4tuzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdUh+qiC; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdUh+qiC"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so2970269d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006066; cv=none;
        d=google.com; s=arc-20260327;
        b=Fh+aUsTlJ3Kt3IDgY+o/E8pt+BFbiqEH+mODU9n3ZEosoHouP6GWPyfgGPLaJeCsfN
         ko9Wyh5gk8H/pxWlPY5o3HDGxzLbQeyK6E4Jxv2bGHeAXQnDe7T19XwACeDikl54J2EJ
         NenmOKBF2p7yO9De70nzdHaM8dpFohN3XfsESPyD8EXCYiiqnDDMk5m/Wmf6V8fz0t6o
         XxdibxrqYgw5X9FodK1XACkJSa7soG0TpNwtpAuWLC64BDIU09YbwGkoNjKqaJRFa4CE
         j/9/OxdFSSlyKWGqcmh0irTg45f4Q2do47p5X7047Cakfjd9N0CGdY8nC/rOUgFBpf3M
         0kbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6vG0jQ6xFV7XwPyI+0n79GP1qzMEjrOWXawNRmYa6B4=;
        fh=uX358Y2+FZP7W3fDCwuxZU6MzvNSDTBYnnvP/FTuXbw=;
        b=KlgWNrL3c3MneJ0U3gNikb1YXRUWMHnTXhbkAooI7SGP6dIKylu0/+v7x6GtkpOEoW
         sY7P+ocuGJLy0t+qxMlYDU0Zp0QXXfp7X+UXqNd5C0lAIev7TVWd40tzqXD1PrsmykXz
         4li8FSIP46aQFe2gdSvcUM1x+Nt2pQHga4uFFcR8aR4h9xGzKYnm4+NRaoylzPsMB47V
         c03SVhRPMU2jcCuXRFRbUtMUFbggGz3iQWpCKmvlCZ5y1j/WitBZBj0KZjjVS4vvWZwr
         oRdgqwU57JF8TAs3quqhWPieCe53pYit/1eQMXMfquYinozn4OWMtQU5ibZPhFKo9LO5
         6NaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006066; x=1790610866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vG0jQ6xFV7XwPyI+0n79GP1qzMEjrOWXawNRmYa6B4=;
        b=ZdUh+qiCUCTHSMKc2hvhCPrvts0cow0aIHYGWnYMB2UALzDh2OzKypdG9sj3+QCM6j
         JD+99V7vYoPFy8UumTTcIhmURoBVGjl/CCCmSaBqLf1WAZwtIDl4HPI9H/8Moc6Sztcs
         +eSQyY254AFYlgCXjYp24aBDoaXS9G2aU7Lx1BZ1C4+BXjitKCxFnTPlQrjfNSAYYjHZ
         zcXH7NcWkn+aoKlRSATXanDwjt+zJ0iJAM1LpbVY5tYyKQlwmHKEp2rk5FeZufIZoEyC
         Icmr6YM5u/+Ztl5p+lbylIYuVTHn+QbqeahsT+hYHM7eRCaCQGoLvk0IC+TdzVRBTeYJ
         tArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006066; x=1790610866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vG0jQ6xFV7XwPyI+0n79GP1qzMEjrOWXawNRmYa6B4=;
        b=hF+HHOI5hM9iWaCFOIRVv/zPCh5x0+eDv1GLK24J0yWqEq3+LIeQ2uHV7mifS5t8hS
         HPxBBxFyP1YukuXb1InkQJFo8eNGrB88sLdZIyWsz6UXGOtiZmGwIOTyrIgGpKKfeIWc
         Bl99ogZHaS14k4XtS11yisls4Y0jg8iiRm122j4G6SA4MFovp5HOethmBKd7Ud7ezL1d
         TnvfySlfKF42QB16VRvaRtctAKYdkeVbZVHBU5Fgi9gPhCmSg/YvozHpYVZY2GsH7Ntk
         JK0bgxTFzlEL8U5PnETKo3hnE42uyYJXjZf0ywDbohC6G7dVuFhg7suMO66aohIrxfJM
         N0AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXEQeDnAqqpVK/sPRCKNPooTugAisS+7n88SeDYX4r4WfJwEvMeigi2G4BMgbY6xtU5uZl5BG4374XlA0=@vger.kernel.org
X-Gm-Message-State: AFuF++nNdfVRFaTW6kbpQnbZ4zOuatFPcoDOl8F4D/NliI476oSfZ4PX
	BwgKIh0PvnwI87Hq3B/ZXL5vC1UgKkE1yxhV6FWlrXtiCM+drsXJ6PC6TmDRv1TWDnMl0ApF+oA
	ZRfH6q/rP5nkuXTWRQNgB+SBn6KLlS5I=
X-Gm-Gg: AYBFou3P13cg72ojeHAfO12yfg6qZDdqqrFhk6OdsSn+bXiiMwLaoHXExWdtjikRDFy
	JL16btlEhdxhIOzlUDh5Lemgh1lgY+ctWLmW/NkV4RSvrh16LuGO4bkNFF8KykWxmyScRoGg5Lw
	tSFB//Frwk/biQX4vBwyn1D8H1UI/eP4m0n2eyPWc3Giqda0oWgLCaJMiJWLuH3W3icKV4UU/57
	lkjTamCikCS8PgZSs9TdWdnjEiAWHGX5K8Kor4Cw9fuEXRskLdXKA04Lx3ldIglv+OIV6g/VzNX
	VEC5ip9uo/rhLgt3ESc8nFK2d+UaBLXVL5m274YIlGkQBDBL6lNPy2GRa1ew0YsaUgZwJnjnwTW
	3PO+lCEs2ALRuwneZXUTZSoWhNHoSWhMK+s1MvAxOPQ==
X-Received: by 2002:a05:690e:454b:10b0:66f:c1bc:4028 with SMTP id
 956f58d0204a3-6717fdfb524mr2500302d50.85.1790006065748; Mon, 21 Sep 2026
 08:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com> <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-3@gmail.com>
In-Reply-To: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-3@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 21 Sep 2026 11:54:14 -0400
X-Gm-Features: AcwNN1V0pqyOnwdYjWwsI-vZzmC4xz4BUNYdY_yKdnXtGMUE-LpdvroF4zHkxQs
Message-ID: <CABBYNZJ-PcaFNG5rWw5b_p_bFHKQffK++N65mLK_sp-=aAjS8A@mail.gmail.com>
Subject: Re: [PATCH 3/5] Bluetooth: L2CAP: drain channel timers on connection teardown
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Marco Elver <elver@google.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cen,

On Mon, Sep 21, 2026 at 11:39=E2=80=AFAM Cen Zhang <zzzccc427@gmail.com> wr=
ote:
>
> L2CAP channel timers run on system_percpu_wq. Connection deletion cancels
> them without waiting because callbacks may need conn->lock, but HCI
> unregister does not drain that workqueue after releasing the lock. A
> running callback can therefore outlive HCI-driver unregister. If it drops
> the last channel reference and releases a protocol module, it still has
> to return through Bluetooth code after those dependencies are gone.
>
> Individual channel deletion has another cancellation race. It cancels
> timers before calling the socket teardown callback, which can wait for
> sk lock. A concurrent recvmsg holding that lock can clear local busy and
> rearm the monitor timer. Deletion then unlinks the channel, so connection
> teardown can no longer find that delayed work through the channel list.

How about disabling the work instead of introducing another workqueue for i=
t?

> Give each connection an ordered timer workqueue. Serialize timer queueing
> with channel and connection stop flags, and stop each channel before
> canceling its timers or calling teardown. At connection deletion, stop
> queueing for the connection, cancel all four timer types, then drop
> conn->lock and drain running callbacks before releasing the connection.
> This lets callbacks acquire their locks, observe FLAG_DEL and return
> before HCI unregister completes.
>
> The channel stop flag also ensures that no unlinked channel can leave
> delayed work behind on the new queue. The queue remains allocated until
> the drained connection is freed. This adds one workqueue per connection
> and serializes that connection's channel timers.
>
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>  include/net/bluetooth/l2cap.h | 23 ++++++++++++++++++++++-
>  net/bluetooth/l2cap_core.c    | 34 ++++++++++++++++++++++++++++++----
>  2 files changed, 52 insertions(+), 5 deletions(-)
>
> diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.=
h
> index efb9b7f422d1..b4af087a0a81 100644
> --- a/include/net/bluetooth/l2cap.h
> +++ b/include/net/bluetooth/l2cap.h
> @@ -611,6 +611,7 @@ struct l2cap_chan {
>
>         void                    *data;
>         const struct l2cap_ops  *ops;
> +       bool                    timers_stopped; /* protected by conn->tim=
er_lock */
>         struct mutex            lock;
>  };
>
> @@ -636,6 +637,10 @@ struct l2cap_conn {
>
>         struct sk_buff_head     pending_rx;
>         struct work_struct      pending_rx_work;
> +       struct workqueue_struct *timer_workqueue;
> +       spinlock_t              timer_lock; /* protects timer scheduling =
*/
> +
> +       bool                    timers_stopped __guarded_by(&timer_lock);
>
>         struct delayed_work     id_addr_timer;
>
> @@ -856,13 +861,29 @@ static inline void l2cap_chan_unlock(struct l2cap_c=
han *chan)
>  static inline void l2cap_set_timer(struct l2cap_chan *chan,
>                                    struct delayed_work *work, long timeou=
t)
>  {
> +       struct l2cap_conn *conn =3D chan->conn;
> +       unsigned long flags;
> +       bool pending;
> +
>         BT_DBG("chan %p state %s timeout %ld", chan,
>                state_to_string(chan->state), timeout);
>
> +       if (WARN_ON_ONCE(!conn))
> +               return;
> +
> +       spin_lock_irqsave(&conn->timer_lock, flags);
> +       if (conn->timers_stopped || chan->timers_stopped) {
> +               spin_unlock_irqrestore(&conn->timer_lock, flags);
> +               return;
> +       }
> +
>         l2cap_chan_hold(chan);
>
>         /* put(chan) if timer was already queued so it already has a ref =
*/
> -       if (mod_delayed_work(system_percpu_wq, work, timeout))
> +       pending =3D mod_delayed_work(conn->timer_workqueue, work, timeout=
);
> +       spin_unlock_irqrestore(&conn->timer_lock, flags);
> +
> +       if (pending)
>                 l2cap_chan_put(chan);
>  }
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 65e957fdc7ae..0df7bda54473 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -686,9 +686,21 @@ void l2cap_chan_add(struct l2cap_conn *conn, struct =
l2cap_chan *chan)
>
>  void l2cap_chan_del(struct l2cap_chan *chan, int err)
>  {
> +       struct l2cap_conn *conn =3D chan->conn;
> +       unsigned long flags;
> +
>         lockdep_assert(!chan->conn || lockdep_is_held(&chan->conn->lock))=
;
>
> +       if (conn) {
> +               spin_lock_irqsave(&conn->timer_lock, flags);
> +               chan->timers_stopped =3D true;
> +               spin_unlock_irqrestore(&conn->timer_lock, flags);
> +       }
> +
>         __clear_chan_timer(chan);
> +       __clear_retrans_timer(chan);
> +       __clear_monitor_timer(chan);
> +       __clear_ack_timer(chan);
>
>         BT_DBG("chan %p, err %d, state %s", chan, err,
>                state_to_string(chan->state));
> @@ -723,10 +735,6 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err=
)
>                 break;
>
>         case L2CAP_MODE_ERTM:
> -               __clear_retrans_timer(chan);
> -               __clear_monitor_timer(chan);
> -               __clear_ack_timer(chan);
> -
>                 skb_queue_purge(&chan->srej_q);
>
>                 l2cap_seq_list_free(&chan->srej_list);
> @@ -1879,6 +1887,7 @@ static void l2cap_conn_del(struct hci_conn *hcon, i=
nt err)
>  {
>         struct l2cap_conn *conn =3D hcon->l2cap_data;
>         struct l2cap_chan *chan, *l;
> +       unsigned long flags;
>
>         if (!conn)
>                 return;
> @@ -1891,6 +1900,9 @@ static void l2cap_conn_del(struct hci_conn *hcon, i=
nt err)
>         cancel_work_sync(&conn->pending_rx_work);
>
>         mutex_lock(&conn->lock);
> +       spin_lock_irqsave(&conn->timer_lock, flags);
> +       conn->timers_stopped =3D true;
> +       spin_unlock_irqrestore(&conn->timer_lock, flags);
>
>         kfree_skb(conn->rx_skb);
>
> @@ -1925,6 +1937,11 @@ static void l2cap_conn_del(struct hci_conn *hcon, =
int err)
>         spin_unlock(&hcon->proto_lock);
>
>         mutex_unlock(&conn->lock);
> +
> +       /* Channel deletion canceled pending timers. Drop conn->lock befo=
re
> +        * waiting for running callbacks so they can acquire it and retur=
n.
> +        */
> +       drain_workqueue(conn->timer_workqueue);
>         l2cap_conn_put(conn);
>  }
>
> @@ -1932,6 +1949,7 @@ static void l2cap_conn_free(struct kref *ref)
>  {
>         struct l2cap_conn *conn =3D container_of(ref, struct l2cap_conn, =
ref);
>
> +       destroy_workqueue(conn->timer_workqueue);
>         hci_conn_put(conn->hcon);
>         kfree(conn);
>  }
> @@ -7416,6 +7434,14 @@ static struct l2cap_conn *l2cap_conn_add(struct hc=
i_conn *hcon)
>                 return NULL;
>         }
>
> +       conn->timer_workqueue =3D alloc_ordered_workqueue("l2cap", WQ_MEM=
_RECLAIM);
> +       if (!conn->timer_workqueue) {
> +               kfree(conn);
> +               hci_chan_del(hchan);
> +               return NULL;
> +       }
> +       spin_lock_init(&conn->timer_lock);
> +
>         kref_init(&conn->ref);
>         conn->hchan =3D hchan;
>
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz

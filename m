Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340743A9605
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622457; cv=pass; b=Oz2NvKgg//pd/N7ine26ztU72YHvgrXaS/tHvO+UhbyJtGWqXvBT0QQu6zjhE3XOS83ug4B9fBK735AC0Z0vk/j0CQZuYhMcTkc/bar1mVTpHQZ/pSPYIt2w//FbBdjOYis0rkNvKUCl8HczzADNIBo+iw/To+GTIh8xa1e1k+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622457; c=relaxed/simple;
	bh=mB0RvlE25HuB+oI2FerQfo3MWbT27GvROGNn0YbnbZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEARVStuac5zoYC63ezUwCEDKsVDoiqauWq95AkhnzW+WO5p4gr7e4BgQa16uruhloCbp/IEsm6yXINLHcgBwlXvEBBQea9oVwS1AWMmL7SDoryGAK1DuNLHGMl3n1kpnFW0QG28KgcCHnYd25GBgwLdqkLU39B48qxfp9eOP4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZijnN74G; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZijnN74G"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a886c555eeso30087267b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790622455; cv=none;
        d=google.com; s=arc-20260327;
        b=pcARALCdbUHM/7CjrkO7pJf76+jCihnfh442wTbgukl1dbPWNmMtaGjkuIW1FK8nOm
         9iSdNiTdwgpZMpRfziMN3TyNPPAG9hQQEJ/ByazXqBObQsIScUFmt7HE5mBjlMqvmmdR
         0g9b4KgBhaDa43otqtd3kJr/dzGFrvZq/O8H/milu3WWtkIT6TIVW+WNpR7tICzVcRgg
         Lmq8w0wmgA/ijLxU2pyeO77mMMsUiFLTf8p6HAXNixKy1NNQn8hcdBxVFsM/YBLHsAWN
         PT9CH0ZYMyZOdlPqNmpS0hKswaX5Z2tuzwuHP1d5U81Y0NM0RsEVKC1RP9le3vhhtCyB
         GoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a1rWWFRgALxS+6OyWmcf6zXJY8MJ8HTT2vaNA3f/r2M=;
        fh=XD+EdT45NYwGOrFuFmocnDaKUun9ecfYEcIgrAhSCCM=;
        b=oYrx3BZLtSze2DG/dXl3ZAVLIlYjEbm8xwuoUAdflqHs3Y/1kdPEchQqCjWN1piEta
         U5sk6+IpADq/GtpM4mmjbf2+dlQ3OLbzAQiVPt17znAMTejwY4gupox8keb3rDRCAq+m
         uCKli6Rv0p6JAkqGYCi7Lb0iVGy5yZQZ0LLBNa5F8+kgitipqr9Rg3RQguz/jJ8DSy0u
         y7iQPx4eRq5q5wl7YLuearLVuj8GDHp7Cj4tEgHKENWdBCHEIGoYEUP8BAURJlsOFanu
         TINKnq3EGrZyXs6CmKtpBHomZvFOAQ4E+kc/GRbiADQ/SQSgqbgENPzXixdwcxkbV0SV
         Vu2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790622455; x=1791227255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1rWWFRgALxS+6OyWmcf6zXJY8MJ8HTT2vaNA3f/r2M=;
        b=ZijnN74GRuKAwztV7D/AwoKNiGgNSJ4eD/oSM8Mm4blW3sjKO0VUhuKEbWkd2/KwpS
         4ZVq+i8HbmFIAXDgMBorxQRjXE9KYISjuCxNszJiWWwKrCWHEEfnvpiNP8lkoYCZ5JZh
         9lymX8sr3w2EAmBiNM5wy+313VAUDfNNNllwkBhSyqBJetXzK5J7mk53uNkxCsLEY8m1
         Th4cREgk0TWXUA6PoGMRjYutv+tlxhZzgmrHe5yEs3xKS7IH+xOaYIRy8/FSPwx3PRsZ
         PR2qx7e6pjmM3RF3CJ1NWLCl/Zo7BVT67N7rA4SXVyJpbnMWQmRCCKBcFsX3Lgzkn6vA
         trTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622455; x=1791227255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1rWWFRgALxS+6OyWmcf6zXJY8MJ8HTT2vaNA3f/r2M=;
        b=saf5kw09rWt/mhTNMGGrdARYSNg2tQBt9cTwIciyAtGkqgdiCUZqIT5mU49fynNwHn
         1BcFf66p2cmu3Ufq1yAR2Gw4iITjUnyqoiaKIJcedmDt0uTB56eovXl4BO7+TzlxDsOW
         yHRhnVRfIv9k3XmKW2GwKYG2eApM3jFwPptQWplwNxoq7HPAq8hQyUAya+miLDg6oZXg
         735SAJwnvGs6GR23iN9lgOl5rzDW4O5gHHKDhxESubsaKpGDwh4J0PS6c6j6FoO23U+f
         JSI0q1vNQTk1+73Cq+YZwVLZMqmlIoGNlTk5+lRg/joOCTnOeg5RtWi1ZE65iAFQTT0x
         V6Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwmso0QLl+vsRmK4fdLcjhiscNwzIkl71oHmbs0XXuRY5xIA/jE6msm4sJI9k12O1Rb1XhMJsYy6EUxZ8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJobDMCHjg93yVDkbS+Mo8902MR/X+Y/Kvn8lfLzrFyQMPeTjdQ
	IlbDMe6jrZqMxjPH14L10IAM4rRHchwwxVR8st8zdgKS1GDusRsxDEUO2yBjo4V57rScnD7DHyD
	4wehfjYU6gQP9GD9kskIPZSQZZqbU0GQ=
X-Gm-Gg: AYBFou1ZFkfWmNuGFJLcC4x+JRPE7Ikf+wh0Qml0mR5OIu/gcqq6w/sHYMQkFsIiffG
	Pb4zD+SMWnv+Ow/3RFJ1kyFLms2RupR9M7bwTM/DuYsaV3DwWzA4wURQNfMnOrUEU7d1mEP9KVa
	NML6QB3CSdj/6GenvmLnGgTmCjmNZXMiBpKjtW5yqt6vW32QZZmS4MDNnjXbJVjxuZ+ZWqlpOoe
	u4yftbItBV76lu2oBUy981yDzm2URjeoL2PUGlHYV1Qe/OMoGYWs80iVKIGSzAIKI5xwQBpCgvn
	VcqwzZEwv8VM4GxwagFc9m0pmSBnABCRtvvtIVvXOGHWwhs7HZ5lrvJh
X-Received: by 2002:a05:690e:1c1c:b0:66f:c1bc:4099 with SMTP id
 956f58d0204a3-674113b1981mr3391914d50.92.1790622454990; Mon, 28 Sep 2026
 12:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922214150.13970-1-cenzhang@linux.microsoft.com> <20260923225630.95537-2-omar@blockcast.net>
In-Reply-To: <20260923225630.95537-2-omar@blockcast.net>
From: Taehee Yoo <ap420073@gmail.com>
Date: Tue, 29 Sep 2026 04:07:22 +0900
X-Gm-Features: AclHuK8fycl8FACgWAFXcvlmgw3ZuBpDgU54IdFc8YfX6UW69qRQFtPSC1guaPQ
Message-ID: <CAMArcTXsU+YbUzjF8BOLsVjL2L_Quasv54mdm8iiJN5QdoAPZA@mail.gmail.com>
Subject: Re: [PATCH net v2] amt: do not store tunnel pointer in skb control block
To: Omar Ramadan <omar@blockcast.net>
Cc: "Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AutonomousCodeSecurity@microsoft.com, Xiang Mei <xmei5@asu.edu>, 
	tgopinath@linux.microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:58=E2=80=AFAM Omar Ramadan <omar@blockcast.net> w=
rote:
>

Hi Omar and Cen,

Thank you so much for this work!

> [Resending with the list and maintainers on Cc; my first copy went to
> Cen only. Sorry for the duplicate, Cen.]
>
> Hi Cen,
>
> On Tue, Sep 22, 2026 at 05:41:50PM -0400, Cen Zhang (Microsoft Security F=
ORGE Labs) wrote:
> > An skb queued in a qdisc can outlive the tunnel it references
> > through a raw pointer in skb->cb. For example, a netem delay of
> > 180s exceeds the default tunnel lifetime of 135s (igmp_qrv=3D1);
> > when the tunnel expires and is freed, the subsequent dequeue
> > triggers a use-after-free in amt_dev_xmit().
>
> Thanks for finding this and for sticking with it. I agree with the
> analysis and the trace. Nothing pins the tunnel while the General
> Query waits in the qdisc, and amt_tunnel_expire() frees it with
> kfree_rcu() well before a 180s netem delay runs out.
>
> > Store the tunnel identity (ip4 + source_port) in skb->cb instead
> > of a pointer, and re-lookup the tunnel under RCU in amt_dev_xmit().
> > If the tunnel is gone, the query is simply dropped.
> >
> > A refcount fix would be hard to keep balanced here, as the skb may
> > be dropped or cloned by the qdisc layer before reaching
> > amt_dev_xmit().
>
> Agreed on the refcount. Could we avoid both the refcount and the
> lookup by not sending the relay's GQ through amt_dev_xmit() at all?
>
> amt_send_igmp_gq() and amt_send_mld_gq() have one caller,
> amt_request_handler(). It runs inside the rcu_read_lock_bh() section
> of amt_rcv() and already holds the right tunnel, whether it found the
> tunnel or just created it. For this skb, dev_queue_xmit() only leads
> back into amt_dev_xmit(), which strips the Ethernet header and calls
> amt_send_membership_query(amt, skb, tunnel, v6). The two senders can
> make that call themselves, in the same way that
> amt_send_advertisement() already transmits from this receive path.
>
> With that change:
>  - the skb never waits in a qdisc, so there is no lifetime window;
>  - the tunnel is only dereferenced inside the RCU section that found
>    or created it, and rcu_dereference_bh(amt->sk) in the sender stays
>    covered;
>  - it is O(1): nothing is stored in skb->cb, and there is no lookup
>    and no refcount.
>
> Once the round trip is gone, the query branch in amt_dev_xmit(),
> amt_skb_cb() and struct amt_skb_cb have no users left and can be
> removed.
>
> > +     list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
> > +             if (tunnel->ip4 =3D=3D ip4 && tunnel->source_port =3D=3D =
source_port)
> > +                     return tunnel;
>
> This keeps the per-Query walk of tunnel_list that Taehee raised on
> v1. Space isn't the issue: your (ip4, port) key fits in the free cb
> bytes, and so would a u32 tunnel id. The cost is that any key needs a
> lookup at dequeue time, plus a rule for a tunnel that expired or was
> recreated in the meantime, while the sender already has the tunnel in
> hand.
>
> These are the behaviour changes I'm aware of. The first two only
> affect the relay's own GQs; the third affects foreign queries:
>  - They no longer go through a qdisc or taps on the amt device. They
>    are still visible as UDP on the underlay.
>  - They are no longer counted as tx_dropped when sent successfully.
>    Today the query branch in amt_dev_xmit() exits through the unlock
>    label, which counts every sent query as dropped.
>  - A query that reaches amt_dev_xmit() on a relay from somewhere
>    else, such as a userspace querier, is now dropped at the IGMP/MLD
>    type switch. Before, it trusted whatever skb->cb held, and a NULL
>    hit the WARN_ON(1). I found this by reading the code and have not
>    exercised it.
>
> What I have and haven't tested:
>  - The diff below applies to net at 9c572a83037a. It builds with W=3D1
>    and no warnings (gcc 14, arm64, CONFIG_IPV6=3Dy and =3Dn), and
>    checkpatch --strict is clean. I haven't booted it.
>  - An earlier form of this direct send (without the dead-code removal
>    or the failure accounting) passed amt.sh 5/5 under vng in August,
>    on a v7.1 tree carrying our other pending AMT patches. That was not
>    a KASAN build, and it predates this diff. Our out-of-tree module's
>    source carries the same earlier form.
>  - I haven't reproduced the KASAN report. Could you share the netem
>    setup you used, so I can run it before and after? The GQ no longer
>    enters the qdisc, so I expect it to stop triggering by
>    construction, but I'd want to see that before this goes in.
>
> If you and Taehee like this direction, either of these works for me:
>  - I post it as v3 with your KASAN trace in the commit message,
>    keeping the existing Reported-by tags (you're already one), plus
>    Co-developed-by if you'd like; that needs your Signed-off-by.
>  - You fold it into your v3 with a Suggested-by.
>
> Taehee, would this be acceptable to you?

I agree with this direction. It's clearer and more maintainable.
The current datapath unnecessarily traverses more layers, which makes
the code more complex than it needs to be. Using skb->cb to carry the
tunnel pointer was not a good idea in the first place.

Please send v3 along with a selftest.

Thanks a lot!
Taehee Yoo

>
> Thanks,
> Omar
>
> -- >8 --
> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index bddc24e1856d..b53f8ec55661 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -80,15 +80,6 @@ static struct in6_addr mld2_all_node =3D MLD2_ALL_NODE=
_INIT;
>  static struct mld2_grec mldv2_zero_grec;
>  #endif
>
> -static struct amt_skb_cb *amt_skb_cb(struct sk_buff *skb)
> -{
> -       BUILD_BUG_ON(sizeof(struct amt_skb_cb) + sizeof(struct tc_skb_cb)=
 >
> -                    sizeof_field(struct sk_buff, cb));
> -
> -       return (struct amt_skb_cb *)((void *)skb->cb +
> -               sizeof(struct tc_skb_cb));
> -}
> -
>  static void __amt_source_gc_work(void)
>  {
>         struct amt_source_node *snode;
> @@ -791,6 +782,11 @@ static void amt_send_request(struct amt_dev *amt, bo=
ol v6)
>         rcu_read_unlock();
>  }
>
> +static bool amt_send_membership_query(struct amt_dev *amt,
> +                                     struct sk_buff *skb,
> +                                     struct amt_tunnel_list *tunnel,
> +                                     bool v6);
> +
>  static void amt_send_igmp_gq(struct amt_dev *amt,
>                              struct amt_tunnel_list *tunnel)
>  {
> @@ -800,8 +796,11 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
>         if (!skb)
>                 return;
>
> -       amt_skb_cb(skb)->tunnel =3D tunnel;
> -       dev_queue_xmit(skb);
> +       skb_pull(skb, sizeof(struct ethhdr));
> +       if (amt_send_membership_query(amt, skb, tunnel, false)) {
> +               amt->dev->stats.tx_dropped++;
> +               kfree_skb(skb);
> +       }
>  }
>
>  #if IS_ENABLED(CONFIG_IPV6)
> @@ -885,8 +884,11 @@ static void amt_send_mld_gq(struct amt_dev *amt, str=
uct amt_tunnel_list *tunnel)
>         if (!skb)
>                 return;
>
> -       amt_skb_cb(skb)->tunnel =3D tunnel;
> -       dev_queue_xmit(skb);
> +       skb_pull(skb, sizeof(struct ethhdr));
> +       if (amt_send_membership_query(amt, skb, tunnel, true)) {
> +               amt->dev->stats.tx_dropped++;
> +               kfree_skb(skb);
> +       }
>  }
>  #else
>  static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list =
*tunnel)
> @@ -1186,7 +1188,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb=
, struct net_device *dev)
>  #endif
>         bool report =3D false;
>         struct igmphdr *ih;
> -       bool query =3D false;
>         struct iphdr *iph;
>         bool data =3D false;
>         bool v6 =3D false;
> @@ -1204,9 +1205,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb=
, struct net_device *dev)
>                         case IGMP_HOST_MEMBERSHIP_REPORT:
>                                 report =3D true;
>                                 break;
> -                       case IGMP_HOST_MEMBERSHIP_QUERY:
> -                               query =3D true;
> -                               break;
>                         default:
>                                 goto free;
>                         }
> @@ -1228,9 +1226,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb=
, struct net_device *dev)
>                         case ICMPV6_MLD2_REPORT:
>                                 report =3D true;
>                                 break;
> -                       case ICMPV6_MGM_QUERY:
> -                               query =3D true;
> -                               break;
>                         default:
>                                 goto free;
>                         }
> @@ -1261,19 +1256,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *sk=
b, struct net_device *dev)
>                         goto free;
>                 goto unlock;
>         } else if (amt->mode =3D=3D AMT_MODE_RELAY) {
> -               if (query) {
> -                       tunnel =3D amt_skb_cb(skb)->tunnel;
> -                       if (!tunnel) {
> -                               WARN_ON(1);
> -                               goto free;
> -                       }
> -
> -                       /* Do not forward unexpected query */
> -                       if (amt_send_membership_query(amt, skb, tunnel, v=
6))
> -                               goto free;
> -                       goto unlock;
> -               }
> -
>                 if (!data)
>                         goto free;
>                 list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) =
{
> diff --git a/include/net/amt.h b/include/net/amt.h
> index a0255491f5b0..2846dde0cadc 100644
> --- a/include/net/amt.h
> +++ b/include/net/amt.h
> @@ -231,10 +231,6 @@ struct amt_relay_headers {
>         };
>  } __packed;
>
> -struct amt_skb_cb {
> -       struct amt_tunnel_list *tunnel;
> -};
> -
>  struct amt_tunnel_list {
>         struct list_head        list;
>         /* Protect All resources under an amt_tunne_list */

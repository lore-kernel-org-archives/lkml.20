Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792476565;
	b=jLSu/IhYtkc4rz5PcadMbwAFIRGnZby6Zym3EyihESE/pb8fyX++4KyxuTO0A8PUwVfI
	 /52MC+ZtUZaKK8oHT1xwR+tlrnIuRB3vQ9GnbV8kUZHakWVRU+YL0r/qXWlvHFRxDz4MC
	 sWdkbKZU+Yagzx2e/KoY+Z9tzgdKmME2equlUedHgAGQR+XpRavxsF+6WLVuonMsvCbKi
	 GXjb0+VhidpgflrQ1JKoyTO4Pscb3v0LstM8qA51STyT9tBF8+UfsqEoJd6cJp78bTwgW
	 +SCMspD8YYjUQabdJPuT99UDPw1LAiWCwX+APAHu2QwT6dyARq78OFFh5Dyr282Ha3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlBMqWrnKdF3kDItdCwsVZrOeSHrOAQ67ICKgOgsRc8=;
	b=rZOGBb+uO1KvnFl8oMBUAgLYFFFLhyHP3ohSDotx0kgZv3jYUA1wW4e+6YIpjpw+yIDm
	 cPlXsDVzMhT9AmXL1vd2OvElRQslF4XlD7COCZNdoviQ9xwWWzcqmr3n0J+gN7ZIXznAl
	 GD+pYV+A/yKkodVlZvklvyAOFOOJEHOfdZ6y27k9iCq9vjFfdgetx6iE/xHD8fjvVM9Uo
	 9GMcKQx3ZHEkUzsYZX6nKHtCq2Afw8n8GAq5CPTvp3wncHWzrHfMgfdVx1iA6FonnWwga
	 f0giv3ruPxJu/6cKL8a/xKcXUBNhUMSVu+ZgnhnKGivkncuG4SqK482pqqay7+eXZXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UE/4oJGk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UE/4oJGk
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8246b13cbso21664545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792476564; cv=none;
        d=google.com; s=arc-20260327;
        b=muJFh3ZGaGez38WywNK5JPJh9jWBd2iTK5Uk0cI9BHOMDmbBCjgCCgw00cQfqPm6wh
         p0bEiIrKgBeYCNPKFTXwWMwRqE8E7G5+skBh68/kPeYQTLedTWm8nV9aLR46HV9hhFGJ
         VlA1bIRiE8hQGQ/yK6WjeokdHgEz/kHggskHVRYIE+r6NzCU7QBoh1Fgu8qY2w3l11UF
         avf37+as7KFzAgHKvMJKii/Hsvyr9pfheSSU8z/SCRA6yAnreRbVAjsyXODUMQ8ZJFUI
         qIyZZiKCctbqcMruA+e+QRUdRsj3U/kld3/NXWjWQNMv664JpnsoXDrbCayPshYqtxT+
         0hNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlBMqWrnKdF3kDItdCwsVZrOeSHrOAQ67ICKgOgsRc8=;
        fh=Sqx/8cQ03ABJzyl2kZET7gETg7phNhxXraufw3kiamE=;
        b=WHaDmKsujj/ZXAcq2tZdt/VviYP1ftGTIExoxLsRktt5DyM4k0nw3vBActSf5UkrZw
         VRYdMYWLiHTKTS/dx7JmEdl3ew6j7rOYObHQwdhoO9IqVboMG7DR0jjCxRywCUiifAYG
         NJpRl857uO01Vp4HoYULFx1RiPU8aI30FN9BRHLshNLl8QDB0Ry6DxEFV0kDDiCbfDjw
         L31HxZjdbP2EyFh2mtFxpS2KqBZWaaMemRqA3XOFl0N7fYxZcvrEzv5MzJWh5NGEtku2
         fnfRPYjlGLzgc81SJ7kvpNx+CEuSZg+O15ziQ9iVBhbUTaM70l52TBNRSJAn5LhRiHsw
         Arfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476564; x=1793081364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlBMqWrnKdF3kDItdCwsVZrOeSHrOAQ67ICKgOgsRc8=;
        b=UE/4oJGkhT1gT9Xw5NZpc7ld70sOY7OfPe4yNnKKhXjU34WbDz9h1eP9n+Sm2R+iks
         7s37xfSjkwQC6qHvOzPiD1FDYxCKLlEZ0M+zKMtPV95fkLkDzcd/LVVNOhzT+DuHtcuj
         rAaZTBwd+D1d/rADkXXWJ5U5dMgwsrHqGaOF0ZIcZt10myc6vIZvL+XSJBVdqaI4JHbP
         j2C1OcRnQFfuLzpRTty3xHkD9pOvBxZbFW4ZXZBIENWxzhKus28iH7fwir3hW22UxRDw
         g6aLij6mN73RQOAKCNRYq0yIUzbd6ddDvZqV9us/cXJ1QnIC22AFA74JBI/yLgOInXCO
         MBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476564; x=1793081364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlBMqWrnKdF3kDItdCwsVZrOeSHrOAQ67ICKgOgsRc8=;
        b=iaNg18TSk7zOckuH1bRr4vs+kH7DsPFyt8n9hw4SycUxskc3TDUgXLuSIDjgyEuENc
         QSL6MzDgWYP5TMgPaHvzZ5gu1pFsmKyJc8PfZWRENwiEDQMk7ltayzHtXiPZ8IVMcxVK
         JXiF4wP5UvHxFFXDyJ3kceDn3Aj3YF/9IJX4LkKHTlyMVCdJN2ERxtuRqP36h36yhccE
         k6N3xmbxQWeUYFAjBKHRM3eJEnKLU9xzCAwu2Tb0Rpl7mpxxjGTU99x+7OZxEmPAjI5d
         9Toeyv/PGwyR3vsfiy+cyFnZUPE1AJDaIb1mpW+mJbDdgnACzyxblRpDL0lJJIy2YzTk
         dHfA==
X-Forwarded-Encrypted: i=1; AKwUvBwJU7rHMD3n3nRaRoD5pSfFHorlfujt2aSxAMqfmKw3gQtx8/yEIP2Lm/2wXsaIxZxdMP20ZAWaIyUkt7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTktEnm8ExunAZQEo/LOTSth/vTRFmXnUc1EW+hMia3CyPpg2w
	I+FjmEBAAmQHRXlqamC8IMIfZFQCDUaSRbm5fryXLA4OKClGYyjw7kdbrtboQXMEkQnlPYGFg9S
	vQKXhta3sGlzDu+d8V51NfiiJqx4ZPbs=
X-Gm-Gg: AYBFou1TCw2QCGQmXhr0zBjxvqxjF0XBJeXewfLSRqap15OgwODyuIJWQ8NrIhSYcMu
	9/IuZ/jGxKBL+v0vaXhXUkuDApiNOhRwHhOwYMR513/Q26RPNd+FnmgdEghk/obqHCLpHaIOwDj
	5w5lnjIsh4TPFLW+eU8hEHlFtohUjHA6DjPl1LthxpKlmPI3OmB2CbQWWpa0cnHzy8n6i0iyCaA
	qAhewkMXAiJmtcLL/gC2WZ3YL6rWLoCILZUHXoQ8qk6RBUaDqiUx6/PI7S8DfLVQ2D8TZIzpv76
	5szH6ZPyKSiES42irMu68gVwjhmw6C9xF5mgWhaco8xv8cFqmzKWT2f9
X-Received: by 2002:a17:903:2f88:b0:2e8:1d5c:f6f2 with SMTP id
 d9443c01a7336-2e9a69f8f83mr83802375ad.24.1792476564489; Mon, 19 Oct 2026
 23:09:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-xsk-zc-rx-double-free-v1-1-2aa19f6628fb@vecima.com> <ataHK9s/MpNgXWhT@boxer>
In-Reply-To: <ataHK9s/MpNgXWhT@boxer>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 20 Oct 2026 09:09:11 +0300
X-Gm-Features: AclHuK-XbUcddl9KosRGKNZXHh6f-ueh77OfYnuvOwoLmpUVjr9gfpKt9gc-2dI
Message-ID: <CAJ8uoz38cE-1diOnih=HYW+ACqq9YQhaM7tz8KCHjTxgZVc+rQ@mail.gmail.com>
Subject: Re: [PATCH bpf] xsk: Do not free ZC Rx buffer when the Rx ring is full
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: marcin.knap@vecima.com, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, jtollet@cisco.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 00:14, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Mon, Oct 19, 2026 at 10:22:02AM +0200, Marcin Knap via B4 Relay wrote:
> > From: Marcin Knap <marcin.knap@vecima.com>
> >
> > When an XDP program redirects a zero-copy buffer to an XSK and the
> > socket's Rx ring is full, xsk_rcv_zc() frees the buffer and returns
> > -ENOBUFS to xdp_do_redirect().
> >
> > A failed xdp_do_redirect() leaves the buffer owned by the caller, and
> > drivers rely on that: mlx5e treats the failure as XDP_DROP and releases
>
> Sashiko report shows that drivers are rather inconsistent here

A note to ourselves, we should write a section in the documentation
for AF_XDP that defines the expected driver behavior. There are very
likely more inconsistencies out there since this was never explicitly
specified anywhere.

> > the buffer when the Rx WQE is refilled, and i40e and ice free it on
> > XDP_CONSUMED. The buffer is therefore freed twice. It gets reused for
> > another Rx descriptor, the second free puts an in-use buffer back on
> > the pool free list, and the same UMEM frame is later handed to user
> > space twice.
>
> Did you verify this or is this rather a speculation? xp_free() protects
> against double-free cases.
>
> > On mlx5 with striding RQ this also ended in a NULL pointer
> > dereference in mlx5e_post_rx_wqes().
>
> Please more info on this then.
>
> >
> > Leave the buffer with the caller on both the single-buffer and the
> > multi-buffer -ENOBUFS paths, as xsk_rcv() and xsk_rcv_check() already
> > do. i40e and ice relied on the core freeing the buffer on their
> > need_wakeup -ENOBUFS (XDP_EXIT) path, so make them free it there.
> >
> > Seen on Mellanox ConnectX-6 DX MT2892 (FW 22.47.1026) with AF_XDP
> > zero-copy on 7.3.0-rc6 when the user-space consumer could not keep up
> > with the Rx ring. With this change no duplicate frames were seen with
> > striding RQ on or off.
>
> Have you thought about massaging mlx driver instead of intel + core?
> Even when that would be correct approach ixgbe would miss being addressed.
>
> >
> > Fixes: 269009893146 ("xsk: recycle buffer in case Rx queue was full")
> > Signed-off-by: Marcin Knap <marcin.knap@vecima.com>
> > ---
> > Tested on mlx5 (ConnectX-6 DX) in zero-copy single-buffer mode.
> > The i40e and ice changes and the multi-buffer path are build-tested
> > only, as I don't have that hardware available.
> > ---
> >  drivers/net/ethernet/intel/i40e/i40e_xsk.c |  1 +
> >  drivers/net/ethernet/intel/ice/ice_xsk.c   |  1 +
> >  net/xdp/xsk.c                              | 15 +++------------
> >  3 files changed, 5 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/intel/i40e/i40e_xsk.c b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> > index 9f47388eaba5..d32c7255f0b3 100644
> > --- a/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> > +++ b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> > @@ -358,6 +358,7 @@ static void i40e_handle_xdp_result_zc(struct i40e_ring *rx_ring,
> >               return;
> >
> >       if (xdp_res == I40E_XDP_EXIT) {
> > +             xsk_buff_free(xdp_buff);
> >               *failure = true;
> >               return;
> >       }
> > diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
> > index 0643017541c3..7c1dd4c87a71 100644
> > --- a/drivers/net/ethernet/intel/ice/ice_xsk.c
> > +++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
> > @@ -636,6 +636,7 @@ int ice_clean_rx_irq_zc(struct ice_rx_ring *rx_ring,
> >               if (likely(xdp_res & (ICE_XDP_TX | ICE_XDP_REDIR))) {
> >                       xdp_xmit |= xdp_res;
> >               } else if (xdp_res == ICE_XDP_EXIT) {
> > +                     xsk_buff_free(first);
> >                       failure = true;
> >                       first = NULL;
> >                       break;
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 33475b180ea6..0edc160c660f 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -224,21 +224,15 @@ static int xsk_rcv_zc(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
> >       struct list_head *xskb_list;
> >       u32 contd = 0;
> >       u32 num_desc;
> > -     int err;
> >
> > -     if (likely(!frags)) {
> > -             err = __xsk_rcv_zc(xs, xskb, len, contd);
> > -             if (err)
> > -                     goto err;
> > -             return 0;
> > -     }
> > +     if (likely(!frags))
> > +             return __xsk_rcv_zc(xs, xskb, len, contd);
> >
> >       contd = XDP_PKT_CONTD;
> >       num_desc = xdp_get_shared_info_from_buff(xdp)->nr_frags + 1;
> >       if (xskq_prod_nb_free(xs->rx, num_desc) < num_desc) {
> >               xs->rx_queue_full++;
> > -             err = -ENOBUFS;
> > -             goto err;
> > +             return -ENOBUFS;
> >       }
> >
> >       __xsk_rcv_zc_safe(xs, xskb, len, contd);
> > @@ -252,9 +246,6 @@ static int xsk_rcv_zc(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
> >       }
> >
> >       return 0;
> > -err:
> > -     xsk_buff_free(xdp);
> > -     return err;
> >  }
> >
> >  static void *xsk_copy_xdp_start(struct xdp_buff *from)
> >
> > ---
> > base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
> > change-id: 20261019-xsk-zc-rx-double-free-1a3b059cd41f
> >
> > Best regards,
> > --
> > Marcin Knap <marcin.knap@vecima.com>
> >
> >
>

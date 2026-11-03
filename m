Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664496;
	b=F4U3hK3o7HWkqM/NOa+VKtmKHnim/FkqDJZg5WCq9S9cfyWFk4oKFmXRTs7NpC4pbg4z
	 Q4zvw53xG7uFU8oKruRhhscrcnvAtnRsSqVWgW+vvHco66y2gtsNevyStXw3iIhMgL/tY
	 VhDNtAZBLHnsELgcd2FC6HMulxFA6krtKzb3KP/lgaWeaK1EgqZU7BAX1rE2yGOae9SuM
	 Au0E+ZDTof3lQU+11jqT14mfcbxJNKeFgpOgQkvaEsG291hSRm691eXuAj9BzgQqLdk71
	 25TO+hN4WD+MtUzs3A5aBUdwLF+KYSmK12VAWYdrPQ2K9mR5SgIHi0Fv2DeqA252dmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6o0BhCJ8MPSIhdTuJplcbj2Jd16gjfRtKR3UOoBlXuk=;
	b=Owbc/6KLsjHv0eqgBwqSuwZH2agg7BQaEvtUk8qqKxNTmSrdFdORzqgap9HdfpIg0Q9/
	 +XPu8Brj0Ce7VvGC9fdIGRSHD2MEQW8lUkwpJlv981aakzVMacAuMRouy/4CmTtYNk9tB
	 wRQ4oAg1zCz30JCRHdy7XScIS48/zyf/XsxDhgNcpTXZX9+Asz7J6OZEWkksiYn5QWXdN
	 exTNsGk5OF6ok3f04uJV1hmsl8z62lIdN6JEvOGUxMWyuHGKm+IqUbq+oane0U+dmQ7Yr
	 NFsMDvLZDM8eg284CtAqmQOYrtUzyEJgHiRMUwCBe1dzdnBkQMklmXYRaEgkws2/jwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBWkbjJr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B4606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBWkbjJr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9f6a16afcso9225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793664495; cv=none;
        d=google.com; s=arc-20260327;
        b=svrGLHcddsDnBQpB1ndGDPJRJeLUCXAvEIFUko+HYq0K4OLHG4w6xHfG/rkMKQLZep
         cpxmXRM/YSJgIu4k6+KqQ+0wBCLBcPeFdEb6zn2Tc/QC1FS8L5ahytWOXSaJJTdlZ2PP
         okrUSNvmwcvotanJDvy7dL217+PjbUkivorVSe1c3LCvpKAG6o/gUVXp4z9CndOkJsXP
         +ob4FiszIwpk5N+aZxQlzmQhC1pQeODzdVRCyNipIuX9vhvw4g5/ZPx+PHCRP//SXe7k
         ag+douPV9m62sOtqtlYM7DbR8QMqS6P0i7oELWhyxpPFzA8Nn1/vdzi/zWZwWOvOvbml
         0/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6o0BhCJ8MPSIhdTuJplcbj2Jd16gjfRtKR3UOoBlXuk=;
        fh=jyAXoFPOjwbLtaqv90IWlRnZE8K/8xfRW9L5rpV0Who=;
        b=SPLMpxnht4/8v5vgZtYJDc9lXnshyzvKOzktMm+/VCn9W2ndWjNi5mT1v6QGwE3GDN
         vPlD0R9EOIX3dpwSb1FrPZ+CW4hbWHkBQTGb0yfNpNEanTw5ILApfZ6/+1IqcOi/iqkO
         FepnUsNRAOFa3zywpTyQmNx8b9OfkMB/BGdtBz5ESA6eJYcyMz+5EdE2vKk4X+OFrb9F
         /QenZVpdEm44VVh8mV9TWZisrqtlPs9KHRl9BtawXku+nZ47P2dQdLaAQ18K4Z8RiuH9
         Hov2ubh6Bj1mZmXH3Z4aSKtNjwYFeePj+aAzZS8Fvj2crxgNmCuBv6SgxwqGjAb8eaR8
         pdVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793664495; x=1794269295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o0BhCJ8MPSIhdTuJplcbj2Jd16gjfRtKR3UOoBlXuk=;
        b=PBWkbjJrU9TcyG32MEtv32gjh7BOYMycgKlgLBLDicqz1VbngrDYjy9oW2vto9MODE
         /z6wFEMEa35BMUWoGZrlLHzkLdh56ZNbSS67AsCxc7UgiTd8ELqSrGtce0658unDAxxn
         XjXgzXBzbRmAiejD/JTuHVGM3Vz3E5SAbPBCtgxYw0SC+YIU955tQIfIcjgjfk+UILeH
         bgHaMyiYdZtlmOGz5NZiw0H9qy6/Jd3mjX4d/VoVdjHzyoSvh/dr6+D/UN3iNLfDBHoG
         MZv400V+zZr6KhG4pOuoVENH55cXgYqJUfxoepebWuSecg3n4P2y6JKGgVSm+PRW5nAN
         pMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664495; x=1794269295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o0BhCJ8MPSIhdTuJplcbj2Jd16gjfRtKR3UOoBlXuk=;
        b=dNKai+U6fzVpe6HmowM0oFBoYt88Usd8k8R8gQV+kWf0xJLcs9H8By2LcZJS2b2NvR
         WYil6iad+Bk+x+jib9mtPqILglTg1vUZ6OsqaIOUevwVdDwOptdcZysLb/urhjtqo62i
         C2Nl14jAjUC1G950cEZHLkE2b1qLClWA1QxWRHSmn7drFwkMcshH1VDLSJv5ISkd6rtV
         H2C1B16QPa3r92OimQBGkN5Sy7Ur9KA6GZhINuUCajcVRtcWkM+Emi81VJIIZtCzZOGZ
         pTtJ/UWCB2q5Rg9JcsZdCpcepBXLzDW5fBdiG1eZYidnTVDGYLs9DpIro3Yh/25ImGLX
         HAfA==
X-Forwarded-Encrypted: i=1; AKwUvBzNRHR4DFWlcIpeIvExzloqGzSe28JjIDQO0r7PyOAZIKuW4B8WUgeS3/thhhd6yYz4ohp2JG26qYnc0oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lFjPVWQ+FXzPr33QGL329bGbxL1x0JHKIxd6fWxIBnqk3D8WD
	HlM8fTYeHVS66EmvDPOt8EUMBlELiOFGsVzfm3pEMcj+5GeC5JgAYPqkD0gOqe4qL+4OLTne9kp
	mGgFcSG11uIrY7iUqqaRGvJ+oTqL4Ckt4oYwZsIlc
X-Gm-Gg: AYBFou1YLNrzBwomTkltQ5PWpuQTLVbr1LzvwSUZVCdN9MNYCvRihSpoPuW0aa3blyN
	fWQMmrMsYMCi+prG1QRCyjURw2vKXsPO9COWbHV+8V7GZWCcXiDSn17K+Clw68RCi8KqD0iv9jC
	IAUbY7cvSbRrFAkqSu+gVikJv+TQn/NP76ASYMk0K3cpSLs5OLra8FZmWsxeIv7ZkQksl6NiPr0
	VUjrPUrQ491/kvzvYR2DbzgAH3Cwk3zwvtWwJqiyJayicJ2WRj1KEEHHXDeCosYyE1aZjV4iB1B
	3ToGKOIyKpKtpUWfLCSYva/GMyIBKOifOwftROD8ZLB57udWZVF8lyBl6wnJGYYk6LwSNH5y1ls
	bThdDKHdEsovdQsz6vc+89of9Sq7LdGD4DL852P4iFsJZIPA1FNQi6Z6SK+cFJyDwqE79li7Zi+
	gM96Gofl4UurP0QruRgnbUqKrQWXdWRTtzsw==
X-Received: by 2002:a17:902:e551:b0:2eb:188a:1c06 with SMTP id
 d9443c01a7336-2ecef4c9056mr883065ad.9.1793664494568; Mon, 02 Nov 2026
 16:08:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102112613.18334-1-amaan.cheval@gmail.com>
In-Reply-To: <20261102112613.18334-1-amaan.cheval@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Mon, 2 Nov 2026 16:08:03 -0800
X-Gm-Features: AclHuK80ad1IakJMKcxnca44nFjXcYHDd_hIyZGlaq7-IDmcguWTnKbuzcEk3CI
Message-ID: <CAEAWyHfCM_ZesnChP71AQvxjM4MASwukesgzuWCYECts7jiNhA@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: leave refcount headroom in the RX page bias
To: Amaan Cheval <amaan.cheval@gmail.com>
Cc: netdev@vger.kernel.org, joshwash@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	pkaligineedi@google.com, maolson@google.com, csully@google.com, 
	willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:29=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.com=
> wrote:
>
> gve's GQI and DQO-QPL RX paths set every RX page's refcount to INT_MAX an=
d
> hand references to the stack by decrementing page_info->pagecnt_bias, to
> avoid an atomic op per packet. This leaves the page no headroom: while a
> fresh page's buffer sits in an skb its refcount is already INT_MAX, so a
> single get_page() from the stack wraps it negative.
>
> splice() of received TCP data into a pipe takes such a reference, and the
> onward splice into a socket then fails: skb_splice_from_iter() sees
> page_count() < 1, sendpage_ok() fails and the send returns -EIO (since
> commit 2e910b95329c ("net: Add a function to splice pages into an
> skbuff for MSG_SPLICE_PAGES")). tee() of the pipe fails with -EFAULT via
> try_get_page(). On GQI the reuse check gve_rx_can_recycle_buffer() also
> sees page_count() < pagecnt_bias, WARNs and calls gve_schedule_reset(),
> so a task that merely pins a fresh RX page (e.g. holds spliced data in
> an undrained tee() pipe) can reset the NIC.
>
> Use USHRT_MAX in a u16, as igb, igc, ixgbe, i40e and hns3 do: the bias
> only has to make the per-packet atomic rare, so a small value leaves
> page_count() ample headroom below INT_MAX for the stack's references.
> Refill by adding a fixed batch and setting the bias to it, which keeps
> the rule `references =3D page_count() - bias` intact.
>
> Refill when the bias drops to 1, not 0, so the driver always keeps one
> reference of its own. That matters when a consumer returns its
> reference before the driver has decremented the bias:
> DQO-QPL passes the QPL page itself to xdp_do_redirect() and only calls
> gve_dec_pagecnt_bias() afterwards, and an AF_XDP socket in copy mode
> returns the buffer synchronously via xdp_return_buff(). If the refill
> waits for bias 0, the last handoff of each batch happens at bias 1,
> when the reference being handed off is the page's only one, and that
> put_page() frees a page that is still DMA-mapped and registered with
> the device as part of the QPL. That is a use-after-free: the driver
> then takes new references on freed memory and re-posts the buffer, so
> the NIC keeps writing packets into a page that may already belong to
> someone else. INT_MAX hid this because one page had to be handed off
> 2^31 times to get there; a 16-bit bias gets there after 65535.
>
> Reproduced on gVNIC in GQI-QPL mode (GCE n2-standard-8, 6.12) and
> in DQO-RDA mode (GCE c3-standard-8, 6.12) with the help of
> relay.py -- a small splice(2) TCP proxy -- relaying a download while
> the RX ring is refilled with fresh pages:
>
>   ethtool -G eth0 rx 512 && ethtool -G eth0 rx 1024   # fresh RX pages
>   ./relay.py $HOST 8080 &                             # splice()s both wa=
ys
>   for i in $(seq 200); do curl -so /dev/null \
>       --connect-to $HOST:80:127.0.0.1:8080 http://$HOST/file; done
>
> Most downloads failed with EIO before the fix (tee() with EFAULT) and
> all completed after it. relay.py is at the Link below.
>
> This bug was found and fixed with the help of an AI coding assistant
> (Claude Code) over an interactive session; it read the driver and
> splice/pipe code and ran the tests above.
>
> Link: https://github.com/amaanc/kernel-bias
> Fixes: 9b8dd5e5ea48 ("gve: DQO: Add RX path")
> Fixes: 58401b2a46e7 ("gve: Add rx buffer pagecnt bias")
> Fixes: 82fd151d38d9 ("gve: Reduce alloc and copy costs in the GQ rx path"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
> ---
> v1: https://lore.kernel.org/netdev/20261031173449.2439047-1-amaan.cheval@=
gmail.com/
>
> v2:
>  - Refill when the bias reaches 1 instead of 0 so the driver keeps a
>    reference of its own across every handoff. At bias 0 a consumer that
>    returns its reference synchronously, such as an AF_XDP socket in copy
>    mode on an XDP_REDIRECT from DQO-QPL, freed a page still registered in
>    the QPL.
>  - Commit message: explain the refill point, drop the build notes.
>
> Re-tested on 6.12.113 (c3-standard-8, DQO-RDA, which still uses the
> bias on 6.12), fixes EIO/EFAULT from splice/tee nor a NIC device reset
> after applying the patch.
> DQO-QPL is untested; I have no access to that hardware.
>
> Built allmodconfig W=3D1, no new warnings.
>
>  drivers/net/ethernet/google/gve/gve.h           |  2 +-
>  .../ethernet/google/gve/gve_buffer_mgmt_dqo.c   |  4 ++--
>  drivers/net/ethernet/google/gve/gve_rx.c        |  8 ++++----
>  drivers/net/ethernet/google/gve/gve_utils.c     | 17 ++++++++---------
>  drivers/net/ethernet/google/gve/gve_utils.h     |  8 +++++++-
>  5 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet=
/google/gve/gve.h
> index b7ce6e8632db..18d7edbf4b3b 100644
> --- a/drivers/net/ethernet/google/gve/gve.h
> +++ b/drivers/net/ethernet/google/gve/gve.h
> @@ -119,7 +119,7 @@ struct gve_rx_slot_page_info {
>         void *page_address;
>         u32 page_offset; /* offset to write to in page */
>         unsigned int buf_size;
> -       int pagecnt_bias; /* expected pagecnt if only the driver has a re=
f */
> +       u16 pagecnt_bias; /* expected pagecnt if only the driver has a re=
f */
>         u16 pad; /* adjustment for rx padding */
>         u8 can_flip; /* tracks if the networking stack is using the page =
*/
>  };
> diff --git a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c b/driv=
ers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> index 6880d1531ba5..571f851d6dcd 100644
> --- a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> +++ b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> @@ -149,8 +149,8 @@ int gve_alloc_qpl_page_dqo(struct gve_rx_ring *rx,
>         buf_state->last_single_ref_offset =3D 0;
>
>         /* The page already has 1 ref. */
> -       page_ref_add(buf_state->page_info.page, INT_MAX - 1);
> -       buf_state->page_info.pagecnt_bias =3D INT_MAX;
> +       page_ref_add(buf_state->page_info.page, GVE_PAGECNT_BIAS - 1);
> +       buf_state->page_info.pagecnt_bias =3D GVE_PAGECNT_BIAS;
>
>         return 0;
>  }
> diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/ether=
net/google/gve/gve_rx.c
> index 81ea800e66e9..6533fff06155 100644
> --- a/drivers/net/ethernet/google/gve/gve_rx.c
> +++ b/drivers/net/ethernet/google/gve/gve_rx.c
> @@ -152,8 +152,8 @@ static void gve_setup_rx_buffer(struct gve_rx_ring *r=
x,
>         page_info->buf_size =3D rx->packet_buffer_size;
>         *slot_addr =3D cpu_to_be64(addr);
>         /* The page already has 1 ref */
> -       page_ref_add(page, INT_MAX - 1);
> -       page_info->pagecnt_bias =3D INT_MAX;
> +       page_ref_add(page, GVE_PAGECNT_BIAS - 1);
> +       page_info->pagecnt_bias =3D GVE_PAGECNT_BIAS;
>  }
>
>  static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *dev=
,
> @@ -230,8 +230,8 @@ static int gve_rx_prefill_pages(struct gve_rx_ring *r=
x,
>                         rx->qpl_copy_pool[j].buf_size =3D rx->packet_buff=
er_size;
>
>                         /* The page already has 1 ref. */
> -                       page_ref_add(page, INT_MAX - 1);
> -                       rx->qpl_copy_pool[j].pagecnt_bias =3D INT_MAX;
> +                       page_ref_add(page, GVE_PAGECNT_BIAS - 1);
> +                       rx->qpl_copy_pool[j].pagecnt_bias =3D GVE_PAGECNT=
_BIAS;
>                 }
>         }
>
> diff --git a/drivers/net/ethernet/google/gve/gve_utils.c b/drivers/net/et=
hernet/google/gve/gve_utils.c
> index caed38cd5f2b..adcdccd54684 100644
> --- a/drivers/net/ethernet/google/gve/gve_utils.c
> +++ b/drivers/net/ethernet/google/gve/gve_utils.c
> @@ -92,16 +92,15 @@ struct sk_buff *gve_rx_copy(struct net_device *dev, s=
truct napi_struct *napi,
>  void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info)
>  {
>         page_info->pagecnt_bias--;
> -       if (page_info->pagecnt_bias =3D=3D 0) {
> -               int pagecount =3D page_count(page_info->page);
> -
> -               /* If we have run out of bias - set it back up to INT_MAX
> -                * minus the existing refs.
> +       if (page_info->pagecnt_bias =3D=3D 1) {
> +               /* Refill at 1, not 0: the page's own reference is counte=
d
> +                * in the bias, and a consumer can put the reference we j=
ust
> +                * handed off before we get here (e.g. a synchronous
> +                * XDP_REDIRECT return). At bias 0 that put would free a
> +                * page that is still mapped for the NIC.
>                  */

DQ QPL mode is not supposed to support XDP at all. The bot correctly
caught that xdp_do_redirect() is inadvertently called in DQ QPL mode
but the more holistic fix is to explicitly block XDP in DQ QPL mode.
Since the driver is not supposed to support it(and doesn't)

We will send up a patch to explicitly block XDP in DQ QPL mode, so v1
is the appropriate fix.

With that change, feel free to add to v3:
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

Thanks for providing the reproducer script, I verified it on a N4 VM
which runs DQ QPL mode. So,
Tested-by: Harshitha Ramamurthy <hramamurthy@google.com>

> -               page_info->pagecnt_bias =3D INT_MAX - pagecount;
> -
> -               /* Set pagecount back up to max. */
> -               page_ref_add(page_info->page, INT_MAX - pagecount);
> +               page_info->pagecnt_bias =3D GVE_PAGECNT_BIAS;
> +               page_ref_add(page_info->page, GVE_PAGECNT_BIAS - 1);
>         }
>  }
>
> diff --git a/drivers/net/ethernet/google/gve/gve_utils.h b/drivers/net/et=
hernet/google/gve/gve_utils.h
> index bf2e9a0adb36..a5e3413234d0 100644
> --- a/drivers/net/ethernet/google/gve/gve_utils.h
> +++ b/drivers/net/ethernet/google/gve/gve_utils.h
> @@ -25,7 +25,13 @@ struct sk_buff *gve_rx_copy_data(struct net_device *de=
v, struct napi_struct *nap
>  struct sk_buff *gve_rx_copy(struct net_device *dev, struct napi_struct *=
napi,
>                             struct gve_rx_slot_page_info *page_info, u16 =
len);
>
> -/* Decrement pagecnt_bias. Set it back to INT_MAX if it reached zero. */
> +/* Up-front references gve holds on an RX page, so handing a buffer to t=
he
> + * stack is a pagecnt_bias decrement, not a get_page(). Keep it in a u16=
 so
> + * the 32-bit page refcount keeps the headroom every page needs below IN=
T_MAX.
> + */
> +#define GVE_PAGECNT_BIAS USHRT_MAX
> +
> +/* Decrement pagecnt_bias. Top it up to GVE_PAGECNT_BIAS if it reached 1=
. */
>  void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info);
>
>  void gve_add_napi(struct gve_priv *priv, int ntfy_idx,
> --
> 2.47.3
>

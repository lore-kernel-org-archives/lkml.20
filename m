Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474206;
	b=d6Z8fcBxs1SoLpBnJS0gYvShHiyXz7O/pTXrHY8hsDmH8ooUiZiYkQeBbkVnIP04x08W
	 cml49A8Dp5IHrMCrZLwRzgnTWWt+qMnYh0ep/XB4GV0iikBKbqVcvRpAGeqoIXSAl1PD7
	 I5m91i4nrvuwoCM2E1oV1xAAd4tkE7k8zCV+lsM8YhQX+SUGBBCfo9ug5onEoaxnYV+OL
	 nnvTIBNWa9PkuX4DloFywbgJqlW4jUeNIbP1aIdzhzr+bzdzyufbZpQtduaFvXZhmHlTb
	 A61XQytQwvtwtnN8d8qr4vHsyBQAGF8HaU1i6+DqR+KeROzK3wMKRHK1I5S8X8EJoww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xroSjcFRPt6cxfo41j3Mux+BLOL5c+D87heagsWLlr4=;
	b=j+QUCYUuwbC6krJpi6xPW7FwrkyDzHkgbxOv1murW7spvJ/iAcId6UOvOAr62d1P804g
	 NLMyF7ZbHYdKA+TtKtFh28ldBgxiSSkM1WCcJDxK26YnyM3FsvyTgOsfThsjgQlZN1yuH
	 wQ9KLHi2U8V6Kitogsq1N9QUf995DuQUE2G6Uu6PXtXb7ueRQqUFSKG9zpMzLpoV7xQGL
	 RtGTKnDO1z5iKgV5NtHVnsWfcMGLnFiHqiThc81xd/DadWdowV2qitlxaTD2Y+NxVbSBT
	 gdTP2oY6O3WTyROcBVWehkt6ui4v+UgkH1TuZLgwF2UPPy4LDFeoHyQJ67hWLcOqktQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPThv3Kw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E56606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E56606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPThv3Kw
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6de2f213b7aso1511584eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474204; cv=none;
        d=google.com; s=arc-20260327;
        b=kY7iRjJYQDKmE9iqYMOHoeC8GRFHWwnvrDLPv7oe5lgF1ckL2NKjR2mJ/m2+opR0IL
         zr1lD8XGcuMMwp1y72/my4903PkqgaWhf84S3rOP64Cpn+A1+rDChPHSZfrxhmAfks33
         bDc+3BKN+izliy/+vKRNLcRBbcHy4D4nzhWHWrYlG+pobyaKjpT9r3hBmWSnV/waqvOs
         Bwo6zClVoAaNyajrxiDvbwPUsFQHdJPbWjLLaaFpwtK+TMv1QBGb5sK3un7SctT3x9wv
         e6/16gIieQsLPQqz94IKG2AiOaO5ZizJWiUomWdEnTSUAqBlcRFLt7uVoeX1k94Fk54S
         hEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xroSjcFRPt6cxfo41j3Mux+BLOL5c+D87heagsWLlr4=;
        fh=AbN/FV9up14JE8iu4i/ha7yNG7aza920ZNL/q+1izJc=;
        b=WwOfo8W4OxHdvKrhFP+slTsgW8SmgGXDuQP1Az/46lodC7TNB4SK2VwXMv6rCEcXOz
         VDjf1/ZvBNBF4Tl+oEYkY7PzkaUwEag7KhBLL/gsoCokeSwUMB8ptajyaPGwp0KZ3L6L
         3rUbIpUPuAp3XJu5gQfZM5+v4Ac8+4gWqU2xsgiSK/P0wqatp7Gk7CVk4SpAaLN8H0+k
         S1Xhq2jmOMFdg3qezlQZYJw194EgAyQvyHYvFnk0CYr3QCI397iMc2B2A5FSoMs4FLR+
         tikgjqLSdVM6q+klVRXKaG2hqeejWIUukGNvFaUAuYdRPgewaHpicnfxMc44dTt2kZkM
         MmNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474204; x=1795079004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xroSjcFRPt6cxfo41j3Mux+BLOL5c+D87heagsWLlr4=;
        b=xPThv3KwZ2FIlw75BCAfE47/44P0Y2eWAf561hDSv2+rbSK8xDxf6jDdjOhGf18nwQ
         iDSyhmrjhO3AIHf2NHgxy83G3mTqpfC3EoJ+YjNu7tBn0TZBd4SQoCWqyPe+Da30brBe
         BGyofMI5ZUNIsTAzSRoINw+qB0ofvBtlqn+BEkkD8eYTURuEyc1Mjuv99I3JkgpesYfn
         B/NiD/CsnVRyguD96GvOi39qo1e7FbYDC/rOTlmQWgRJT7zggbQMvgCm1jAPSTRfZX7N
         +fz0SXcbgCpHhH7SDEUqibYwsY5jdijzzpubmRXrVwo1LVJF3VdmoLyDZ2h+ZViktRvL
         VN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474204; x=1795079004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xroSjcFRPt6cxfo41j3Mux+BLOL5c+D87heagsWLlr4=;
        b=e84z1GWfvXJzkNCgVo0wXen+p7eOcg/gGhTI4UNBjohwMJoKL+lyaLUj0mi6wN8RxY
         oG89kuALn9PT4KwZ33yE3ckMemhBtoZ06HZD3NwsRvkcg3PRTbvql0AsfN08d0qXiZCn
         uc5sdPGs8dDMUMiWjLLEQpnb2rvwFi/ehmlXCCfy1kdh2Jn478sEh8O76i4yizXFQm/X
         CPgH3OWRL17DXLev7djNOEQsI6sNdRfbPEaRhvaXZ/g+wuG5fARhIn0kRdEPOfuus6uU
         grlQHfRI6gW717JtqH+16UPHsmrU9Fpu6HKnxWFOBmb30F9tGeSbTK/vYDty+r1Dtlh7
         HNtQ==
X-Forwarded-Encrypted: i=1; AL+hErHO5vJItMw3IdzD5fWftE5vBmevkFxb5vdD47AN73QlCl7a7Kxl/6tjxamjz5IoSbFMqrY6DkZJOwFbMdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lP6Y4HD2ZKMgR/QFBe2kdcgk8OysfOriPG0I0dz2pt7JRvlFN
	TThrdIp7KCSYT/0ajNNhTg0a0/7lzGKJ7jFD8AI5VlzOP828OG1J/WziOd1RPIk0oOb4e0d/W0I
	o6CR6YOWCUBa4KTfXYzlWfrthU3lhSPU=
X-Gm-Gg: AYBFou0ZEn6hy7bJk3YQe6mzQlw4GByY5qTVxAIAEC5oioB+iMTqbkH+4lQ8uPR6bEY
	W1EfKOGz94WMu/67PFglLxQIxJg3+BwT9vITDtEhTRhbNKImmwBNr4YU5qr/pA43vDnPSD+DL68
	p3hJDqtRoZWNfeA/PkOGPl+3Pp54/uOajLxPM+KHXkjGMbr4fvBwSwU7rInq91NsfDnmEefrkk1
	EVHNWeMTbcYpbqdL6/fHE2cHCpcedS+ujJajo+V5SamUOWzBL9XVzrB8uTLx5iEgQ+/bmCNUDVK
	kYcBBlCAEsV6b2KdCW2kBdfx7FErHymKp8a/GBxQlq5gEsOXKe5pCG8hD9ubozr0wAqrkV9VfrH
	zliqXCaPjF8MOocjRoQ3B/rvWihRmQAJAjExq72S4VnZ8dBlZ/KbAlCb7l4sMV8mkfeM=
X-Received: by 2002:a05:6820:83c7:10b0:714:75fd:7758 with SMTP id
 006d021491bc7-71917976df6mr2249569eaf.66.1794474203912; Thu, 12 Nov 2026
 01:03:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109100437.331423-2-amaan.cheval@gmail.com> <179439161258.2199510.10096207449822395421@kernel.org>
In-Reply-To: <179439161258.2199510.10096207449822395421@kernel.org>
From: Amaan Cheval <amaan.cheval@gmail.com>
Date: Thu, 12 Nov 2026 14:33:12 +0530
X-Gm-Features: AclHuK_CWGCZXat2wUgKEhOoqZ1FCmKI-7H_7bcxsS37U670NKwAWTCll96uzMM
Message-ID: <CAG+wEg3m_w1vK7VzG2jnVZfo=NUS1=FGSOU_g7iM7e8_Gg8t3g@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] gve: refuse XDP on queue formats without XDP support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, joshwash@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, bcf@google.com, jordanrhee@google.com, 
	przemyslaw.kitszel@intel.com, maciej.fijalkowski@intel.com, 
	pkaligineedi@google.com, maolson@google.com, csully@google.com, 
	willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:36=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message misstates which queue formats the new check
>   affects.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch
>   extends it.
>
> --
>
> gve: refuse XDP on queue formats without XDP support
>
> This patch adds a check to gve_verify_xdp_configuration() that refuses XD=
P
> setup when dev->xdp_features lacks NETDEV_XDP_ACT_BASIC. It replaces the
> queue format gate dropped by commit d8a8ca14c937. The aim is to keep XDP
> off DQO-QPL, whose RX page accounting can free a page that is still
> DMA-mapped and registered in the QPL.
>
> > Refuse XDP setup in gve_verify_xdp_configuration() whenever the driver
> > advertises no XDP features for the current queue format, which today
> > means DQO-QPL.
>
> [Severity: Medium]
> Is "which today means DQO-QPL" accurate? gve_set_netdev_xdp_features() on=
ly
> sets NETDEV_XDP_ACT_BASIC for GQI-QPL and DQO-RDA:

Makes sense, the commit message should be clearer.
pw-bot: cr

>
> drivers/net/ethernet/google/gve/gve_main.c:gve_set_netdev_xdp_features() =
{
>         if (priv->queue_format =3D=3D GVE_GQI_QPL_FORMAT) {
>                 xdp_features =3D NETDEV_XDP_ACT_BASIC;
>                 ...
>         } else if (priv->queue_format =3D=3D GVE_DQO_RDA_FORMAT) {
>                 xdp_features =3D NETDEV_XDP_ACT_BASIC;
>                 ...
>         } else {
>                 xdp_features =3D 0;
>         }
>         ...
> }
>
> GQI-RDA also falls into the else branch. gve_adminq.c can still select
> GVE_GQI_RDA_FORMAT from the GQI_RDA and GQI_RAW_ADDRESSING device options=
,
> so the new check refuses GQI-RDA as well.
>
> The check that d8a8ca14c937 removed (queue_format !=3D GVE_GQI_QPL_FORMAT=
)
> also refused GQI-RDA. Since that commit, XDP could be attached on GQI-RDA=
,
> and XDP_TX there takes this path:
>
> gve_rx()
>   gve_xdp_done()
>     gve_xdp_xmit_one()
>       gve_tx_fill_xdp()
>
> gve_tx_fill_xdp() always uses tx->tx_fifo: it calls gve_tx_alloc_fifo(),
> memcpy()s into tx->tx_fifo.base and reads tx->tx_fifo.qpl->page_buses. A
> raw-addressing TX ring never allocates that FIFO. Isn't that a NULL
> dereference that this patch also fixes without saying so?
>
> Could the commit message mention GQI-RDA? Two things are worth stating:
> GQI-RDA now gets -EOPNOTSUPP, and this closes the XDP_TX crash there. Tha=
t
> would help stable backporters.
>
> The follow-up patch "gve: fix RX page refcount overflow from INT_MAX
> pagecnt_bias" uses the same wording ("The previous patch keeps it that wa=
y
> by blocking XDP on DQO-QPL"). Its safety argument also depends on XDP bei=
ng
> blocked on GQI-RDA.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 2437cd8ba6331..fe560f5c5408c 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
> > @@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct n=
et_device *dev,
> >       struct gve_priv *priv =3D netdev_priv(dev);
> >       u16 max_xdp_mtu;
> >
> > +     if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC)) {
> > +             NL_SET_ERR_MSG_MOD(extack,
> > +                                "XDP is not supported on this queue fo=
rmat.");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
>
> [Severity: High]
> This is a pre-existing issue that this patch did not introduce, but the
> patch adds another exit to the same gate. gve_xdp() calls
> gve_verify_xdp_configuration() before it looks at the command, so the gat=
e
> also runs for teardown:

I'll leave this for a separate fix; it seems legitimate independently.
The check this patch adds on xdp_features derives only from queue_format
(in gve_set_netdev_xdp_features) which cannot change between setup and
teardown, so it adds no new exit as claimed.

>
> drivers/net/ethernet/google/gve/gve_main.c:gve_xdp() {
>         err =3D gve_verify_xdp_configuration(dev, xdp->extack);
>         if (err)
>                 return err;
>         switch (xdp->command) {
>         case XDP_SETUP_PROG:
>                 return gve_set_xdp(priv, xdp->prog, xdp->extack);
>         case XDP_SETUP_XSK_POOL:
>                 if (xdp->xsk.pool)
>                         ...
>                 else
>                         return gve_xsk_pool_disable(dev, xdp->xsk.queue_i=
d);
>         ...
> }
>
> Several of the gate's conditions can become true after a successful bind:
>
> - gve has no ndo_change_mtu, so the MTU can be raised above max_xdp_mtu
>   while a zero-copy pool is bound.
> - gve_set_features() refuses HW-GRO only when priv->xdp_prog is set, so
>   HW-GRO can be turned on while only a pool is bound.
> - The queue counts can be changed the same way.
>
> When the AF_XDP socket is then closed:
>
> xp_release_deferred()
>   xp_clear_dev()
>     __xp_clear_dev()
>       xp_disable_drv_zc()
>         gve_xdp()
>           gve_verify_xdp_configuration()   /* returns -EOPNOTSUPP */
>
> On failure, xp_disable_drv_zc() only does WARN(1, "Failed to disable
> zero-copy!\n"). The core then goes on to xsk_clear_pool_at_qid(),
> xdp_put_umem() and xp_destroy().
>
> Because gve_xsk_pool_disable() never runs, clear_bit(qid, priv->xsk_pools=
),
> xsk_pool_dma_unmap() and gve_unreg_xsk_pool() are all skipped. Won't
> rx->xsk_pool and tx->xsk_pool still point at the freed pool when the RX
> refill and XSK TX NAPI paths use them? The UMEM DMA mappings would also b=
e
> leaked.
>
> dev_xdp_uninstall() follows the same pattern for programs. It does WARN_O=
N()
> on the failed removal and then calls bpf_prog_put(), which leaves
> priv->xdp_prog dangling.
>
> The new xdp_features check cannot change between setup and teardown by
> itself, since gve_setup_device() computes it only from queue_format. Even
> so, would it be better to run the verification only for XDP_SETUP_PROG wi=
th
> a non-NULL prog and for pool enable, so that teardown is never refused?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261109100437.331423-1-amaan.cheval%40gmail.com

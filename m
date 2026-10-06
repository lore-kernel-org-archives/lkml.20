Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506A1B3B19
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258325; cv=pass; b=elWVxeatlnE8QR+M1o8pUHHjyIO4s/FPHm79WPK/mS7+rBsgkohshxiqhkJI2eO4LAZwY5JD8EPtTJP9nZUDB5GnnaUZhcLX23K0erHEowr0EcX/KVLdYWc4QaJFao1i4rPhPV40M25BeO/FpxVRGClA4eU/ySgAKoA2gGUDzoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258325; c=relaxed/simple;
	bh=tCf9zcdPXyYE0i1nJT6GMpiiD0IaiKN9eE15bB7ZvtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=j/W1A1OEAa2s7BcXI2r8zHVbnN9Dlvl1L1uBolRX8MhGadQNc1c7XGxCpPUsIAs4dSiJ2p+wjCh2NNusBlDTqdnto3dCaHx3zc1jux9t3tvJRos+KsOsuFy2lxbqYjI10vAdlR5pFOJmRJPEMSgUneCNaryTYSIUKP7tAHGONAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gINf+cPz; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gINf+cPz"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb82dbadso847378e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791258322; cv=none;
        d=google.com; s=arc-20260327;
        b=pcCUk4jCXBEfEbHvMkweJaDdHKagcfJRcIUHrhQFFVJi1Mxba+jWZ3pLo8mCMRtSH7
         j6zy8z6Xfs5IjzWCNEQRxCzsYoQLIAXEcd4Rbtn4DIxJLB8uiYch/wgPJ4CHC8PblhTt
         g7JtJpt2zIEbhMfGSblKZIz9MQbKNtFVgCJUWrdCgS9PLRcNz0TSzKb21LKKzPMT8e2M
         t4zHubkSP8DopOc1kaRR2I1SqgD9qcTibOe+6I53aNoYWh8tYaeKtTZT+Gj9x9Z4GaUT
         vKGgyHUb5E6CfnJ50d2zSIm4yaUYdjmQPyZuntlUkEfwUUm1k5AVSrbyM30yN4P3bZ1Y
         elkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        fh=pBQIr1hnP7jclazhWIV6Af8/cdG3KNBh8nvUTqlxzXI=;
        b=dJZ/bFHYchrekYagZoNVzPEL8Hbg5mvwVWaw/Gql2aoxh8IB01BwK2q4MpN4FZZXSX
         w+phcX9c+TaVT17k95Ac4JFyutVgwkZf0Kn83hKDDjXZ2hZkztNi4CPbjeKwd6JiZbPB
         x2hG0CdDf8tnbtNxzNwqXGYj1v5RmX8JbOg1c9Vs2FSGGhvUMs69Eizxcirq70RsElHD
         X+hoY44vPM5lmzqt/Nz//XkfiHDM0vdjfxG3dyfL+z7YWs2jmI2dbaYu9owF8ZQH6wLx
         oGmeDRkMCUK5OOK6UNLVznXy6psa8xisSDjs3kQUc+5xaCvM/k4vwNb6nCyWPnyTw+RY
         V9+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791258322; x=1791863122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        b=gINf+cPztFZw4hSHEb9nEDfdOhWco1GgnzLOnScT9vCL/yNusituI6cIEruqu2GhFN
         qyA9PQPMx/ULHMA1CCDeCzAjusxpMIcxHvEsS55+jt6hSS6IJcmdVvmZo9Hpd8cPEEhm
         qYOrCV+hUCOYrP8pd5ZoBUb+u2VRZIpbbx3cO6dEfqt24vMYiNC0GxPiK48NJbgtnZbs
         AeSvKjqoU067AzSMeEF3So9r3mQMi454fOu6jNv+IBSuHVtlImRP/oXZHNcQliujF88d
         4hvXA/d/5AS9IBs/74Rhl6GlbG9jOqbirqzghX9x0QOY/oxYkfmrMwAr4ZsEPtxb1rz6
         4FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258322; x=1791863122;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        b=0raE1rdJLVGXhIXDTI6x0t0w8EOERZWfqT++8GiJr1yS9+CzxM5y2dufv/g66lpLQb
         QlcLW8TsHJ4jFsxd9VwiJRhuyC8Hzsg91Ft7NU3rAS3bfyTmYPfoVvsQkRmwiyJtyO7Z
         3tsH1l6Uj7f1bF3FAih/mqPy6hqpSXp6oHAfuUxDTdBBKKpGXDRsVHKrENSJiYJDLojj
         Lpxz2z3M7gPHhkpdFmrQtDAM6rB2AI0BfXOveKtIwJpZ3YxWfAJna2tqMWZwe/kF9sml
         JkFc1+5VZP6a0fjXnWg7+xD0A/uULa+HCNfS9j5NGZxGiZFzNEaMA3o7C/IWiIIdhEac
         9sDg==
X-Forwarded-Encrypted: i=1; AKwUvBz4LfWlwvJ6UHz2r/Tcu201E8lzio40D9hJk5kt0sNYxFq/OQWXGzYsb8hAbsAZPzaArSSbcfrnBSKJgkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+CQvmbvtVYRE1lv0yKTPygROAdwc24IqIvwc0p/3AQXSI6Clo
	QOpQv/7ht7cWVsg1HjCcRPDH9ESeIedx6o0Mo4TkYdFX4/PBASypntd8FB89xSZvoVsLFZEkbqw
	yorE4O7cQ6OircClmN54bBiUfYz+6hFo=
X-Gm-Gg: AYBFou2g4/r7ld47WRYM4/2jmMTiKtTzaHv5GTwD8aZSR6vZvU4E6xsXVqBrYbKM5Cj
	04Jiw5r+E/d1F1ajT0s0OS8f/1Xb32AL8qMg/ADrdbbo1Ei9EEk6bK1epjXdXSWMAm0gggvtfaG
	qoR3Ftkkd/K3XYZCnYjGZtcSqktIjxLp9MBIjE+XEHhVQPVZrVoqD0CLCmMHuSVyL6y1ry8YfMm
	iZIWCIozQqx7+DUKKz1W87MrjBLk/Y9KaVEUcMB1lwKuCt4E+WtDV5FLovp/IaXZctDY5SmpWdy
	MfRM6RNh6vXMqOcvh3QayNeLtgrcq6hUTRJXk8N3RzfUk3C3Fds3yA==
X-Received: by 2002:a05:6512:3991:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bccc6b594cmr64148e87.1.1791258321918; Mon, 05 Oct 2026
 20:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004083759.1016519-1-maimon.sagi@gmail.com> <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
In-Reply-To: <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Tue, 6 Oct 2026 06:44:55 +0300
X-Gm-Features: AclHuK9PN1lCiJLlPnCC7s8Qa_5To1aOEypzViWt-JVLXj9lXdRlnfiN5UevbJ0
Message-ID: <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
To: Joe Damato <joe@dama.to>, Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	daniel@iogearbox.net, jacob.e.keller@intel.com, suraj.gupta2@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 2:41=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
>
> On Sun, Oct 04, 2026 at 11:37:59AM +0300, Sagi Maimon wrote:
> > axienet_dma_bd_release() walks the RX ring to unmap and free every
> > receive buffer before releasing it, but frees the TX descriptor ring
> > with dma_free_coherent() alone.  Any descriptor that
> > axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> > its streaming DMA mapping, and both are lost.
> >
> > axienet_stop() disables TX NAPI and stops the DMA engine before calling
> > it, so nothing reclaims those descriptors afterwards.  Bringing the
> > interface down while frames are in flight therefore leaks up to
> > lp->tx_bd_num skbs and mappings each time.
> >
> > Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> > every descriptor whose cntrl is still set - axienet_free_tx_chain()
> > clears it on reclaim - and free any skb still attached, as a drop.
> > This relies on axienet_stop() having stopped the DMA engine first, as
> > the RX walk in the same function already does.
>
> [...]
>
> > Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Eth=
ernet driver")
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > Assisted-by: LLM sparse
> > Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> > ---
> >
> > Notes:
> >     Changes in v3:
> >     - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caugh=
t a
> >       NULL tx_bd_v from a first open; after a close followed by a faile=
d
> >       reset the walk would have read the freed ring (Sashiko).
> >     - Reword the comment on the skb free: a descriptor can complete aft=
er
> >       TX NAPI was disabled, so "never transmitted" was not always true
> >       (Sashiko).
> >     - Say in the commit message which hardware the test ran on.
> >     - Kept Jacob's Reviewed-by, as the changes are small; please say if
> >       that is not OK.
> >     - The hardware test is v1's.  The changes since only affect the
> >       failed-reset paths, which it did not exercise, and how the freed =
skbs
> >       are accounted.
> >     - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon=
.sagi@gmail.com/
>
> [...]
>
> >
> >  .../net/ethernet/xilinx/xilinx_axienet_main.c | 26 ++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 09443623a3e2..c88c671f8b2d 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -186,11 +186,34 @@ static void axienet_dma_bd_release(struct net_dev=
ice *ndev)
>
> [...]
>
> > +     lp->tx_bd_v =3D NULL;
> >
> >       if (!lp->rx_bd_v)
> >               return;
> > @@ -221,6 +244,7 @@ static void axienet_dma_bd_release(struct net_devic=
e *ndev)
> >                         sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
> >                         lp->rx_bd_v,
> >                         lp->rx_bd_p);
> > +     lp->rx_bd_v =3D NULL;
> >  }
>
> The added null writes makes me think that centralizing this code and usin=
g it
> from both axienet_dma_err_handler and axienet_dma_bd_release (instead of
> repeating it) is a good idea like I mentioned in the last post.
>
> The code seems right tho even tho I don't like duplicating the logic.
>
> Reviewed-by: Joe Damato <joe@dama.to>

Thanks for the review, Joe.
Agreed on the helper.  As on v2, I kept the fix minimal for net, and
will send the helper to net-next once this has reached it, with both
axienet_dma_bd_release() and axienet_dma_err_handler() using it.
Thanks,
Sagi

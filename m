Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D343DEC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149833; cv=pass; b=dBWXHrZl43LK1dz/F9C4ExggmPekH9lt8lfo6im+67m1AXj8zNxyd17eFlM8aPYoEH4ehhfHd9/IktxhEe0G7sdIOGEGlk66QqL7IltEsptQjVfr6p7Jru8fmgLDyy2RLqPsLdzjQ74/iKoDzVmkboJQak1dQcZjb4FG5q25eqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149833; c=relaxed/simple;
	bh=wQddww+wTFy+uUDhZlDRKObPMl5VUra2YlIqhCZ6LPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqOIrn3pQTvtH6C5DlZ/LQP76ZthOzlcDe1z+XoaHbx5GdrWB8/q5d/+b+EhuTfouGvasXVGt/zLsIeRG80h317RGrphXRlGDBGcv2HxcsasHBd1s8ic+93H+//thVpxOkcpG1ydKP0hMThLLvqKp2OUyNUfZsjoVPOn6FBRKTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+QlXavZ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+QlXavZ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so62949366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790149829; cv=none;
        d=google.com; s=arc-20260327;
        b=fkmLR1DP/D8ifHoNlAZTp1MzU+i2wy515oefAKF1uX0zuFRiPHhyNJyWWp4T3CaNBX
         eO1cyU0q4QYfsjW9Pp5ZE5VVFBaAvnU+RF+aMwkvI3RZS+ZK+nAs39Qir+LV+GVZlyCz
         KddMbIXDnQiY6LJuoiwYZ1DHa0X2ouGaCe3OtZ7aEGOg54eKLVULg1Y0DraxrUGUOptS
         N9uFh8Kpw9EH4gwd63D8fhoSo9gfrf/JzTRbcOWBSnlzIG9B9viEpNdrAI4t5AzwYDi8
         7kIM35Zb2lV3djixXnOk3c372gJvFTqO46Y4VaWtM45Gg1J085nsxtAR6mrzTvEGIUi1
         h7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIMsXyE0hlqLF26fDqeusGew/UXXDHToBPuwA+amFPQ=;
        fh=6XlMi3RhSIvFpUk0s++yPz2yaNvyRBwaSTLBkZdWkGM=;
        b=NvQxD5ncMNH90LVpVT7qzqOQR+Xf5jfy2F96Zs3kYeh8p8eP+r+9m+9pN5RYv1TNIC
         9D9tUvbADlkuvb6eCzeuGs0/97lwmxdaWDnne0GYyElRF8lJA1r3jVyQdBcIcMWZvj9G
         1NGKQRhVpCFN9/vYio7YWbSk70FbIGUQQmA6B2YNfzbxEjCV7LEiGKLbSwDjI8kr7/2J
         FH8Y17n0tpYcjdLuux91rrChXWosK1fZZjxWJXhuDTl3ft2QMvZCSjoaVyz4Evszz0iR
         7Xgn8WCZnPNaq/oOz0OWxB0mRvOK2bgb5jOGwT2QDWALVmazHBRHhyBMcNkQVXwEjkfI
         K89w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149829; x=1790754629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIMsXyE0hlqLF26fDqeusGew/UXXDHToBPuwA+amFPQ=;
        b=B+QlXavZYvdxsXJnaBchGdMLBTf9NCPw9zE/3JyRolK5bLy1iUR/lqweqR7wWlKIeR
         kX349zQegIuFWDBKehDohegYUDo5TA6dqvKe4oNiSkhf2aeDnNw4KdocBDIGVejxEFqV
         +yFVYnPsGEn9aQaVZJEdzs38ttJoP0m9oXbF9uFqCr2lEFmDVJl+xgOh1i81+vXyjtaX
         7R5aXfTja//tw/WngdzopWVcx7T4xbw7cGxSCT3CCzPt4vQIVVyg7bVEiZClbQpaJf3P
         oyycHK9/l/J5tu29PWmGeiLLOqWXIgDN/X3/kBG/weXGOxr8Cav6cHgnAGWvXwOaKOXw
         V5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149829; x=1790754629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIMsXyE0hlqLF26fDqeusGew/UXXDHToBPuwA+amFPQ=;
        b=i7g2igGOoM2Fjo76Fr1Flwm+kVPEfyTx2n+VOXcw3AFNmkmHzV6+ktaUizhb4NCurS
         +qVzGcuDbI3TboOAcgrDDoz5BPB0KF+lA8s+4g6ldrXUuePu6ZFflVk4EgIo8ntp7ldv
         DIk5dXToWehSBlxSYPtE7FX8eBgB+wLkPwWozuz3MlhV9IY0Ak69kaDwbw7S1jMz6ADe
         Gt6kIl4rs5Ej9Jtlfy3cHmyi2owSgvdRTPliQx2w4CTFbJU8JpsgqNlbZKmIIRw++S8C
         YZSkP0cDiLK7IG3q33hCuWw3uRQ74vQNnAcz06hplGNeu8hzRPaqswSO0MMeBkw3eb+R
         y7JA==
X-Forwarded-Encrypted: i=1; AKwUvBy9e8zTErX1RCaXnAIJd+YBPr/JQkKKgup6wmXwdSgo9lut+VVP1PDWN2DgVxAq9pPRMBALZye1Cxakdsw=@vger.kernel.org
X-Gm-Message-State: AFuF++k7RAGKQqhIpnzgaW4QDU931MIxoOYjchD6sufGmmvabx+Om0rI
	ekEeISkr95Bqp8nmmnazDQmUX1F2PYiNnQYxTQtJ7GA6cT0dpN/vmc1wtyI9a5taKN97LuzVskt
	85hfVQIH4q5lzQUbSF+8No+XddPqEgcGntM89raKbIaaQtKM=
X-Gm-Gg: AYBFou0GvLdSg6slOJceopudCvHGyw1ByuoQtGa+wCxYQcUaPZf5xf8uE9LFG+CJgJK
	B9IDtLRX68ofZu7DrAwEjJasFdhkLSGcW6Sw0tJsw5yo3nhaCuPk6/VomCd8f+IFY++g3/+p3RR
	fzMbtqw8a0u5ccB8XT9w/D83beZV4oclmD8imV+gkgsUAR0tz1wG5aEKPQH/UPRLpFewYXgQ6G+
	ZW2oUyIOXeF3ZfM11xHnP0K/si0bCR/E9Oe/A5XNFSE9DMiVLL1PgCpSa24upWPlF4K86jb8fMC
	JIugHKgf4AMdf0Lw4P1WJ7qU563PEhDWpQtX+Qz20yICikkIU5ewdwqmG/DJtipb9RMvqg5+OpO
	cfV+15CZ8f7bnqPAZENPhdp8c5rySmYXXvTX7BXKwvV6VKbz5WF82WQ4MDgLxFlplfMvOrg==
X-Received: by 2002:a17:906:9fcf:b0:c26:306f:289b with SMTP id
 a640c23a62f3a-c2aadec8c05mr133501666b.13.1790149828634; Wed, 23 Sep 2026
 00:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEnnukY8+i7j7A05afKrEz7s9kXEXXzjwGm+wV1wHgACe+iADg@mail.gmail.com>
 <20260923070033.GH106095@black.igk.intel.com>
In-Reply-To: <20260923070033.GH106095@black.igk.intel.com>
From: Yusheng Zheng <yunwei356@gmail.com>
Date: Wed, 23 Sep 2026 00:50:15 -0700
X-Gm-Features: AcwNN1WPmoVKaubk8IsJrhoyK9_pu2WDmC5cZ92JINQNHapdhgyCS5zelYEp_U8
Message-ID: <CAEnnukZqxhanLUs3Y9frRrGBf32uL5qHLVMMzQfs_fYdwp6zJQ@mail.gmail.com>
Subject: Re: [RFC net-next] net: thunderbolt: Allow per-device opt-in Tx E2E
 flow control
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, netdev@vger.kernel.org, YehezkelShB@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

> If we advertise E2E support over XDomain we must enable it as well

You're right. I missed that the XDomain advertisement remains visible
to a peer even when the proposed flag leaves our Tx ring without E2E.
That makes this service-driver opt-in unsuitable. I won't pursue this
approach. I'll follow the NHI-side work you mentioned and can test a
public patch on the two Intel 8086:7ec2 hosts. The A/B/A results in my
RFC are observations on that pair, not a justification for this
interface.

> Also this looks pretty much like LLM generated, so you should add
> Assisted-by tag.

You're right about that too. LLM assistance was used for the code and
changelog, and I failed to disclose it. I'm sorry. For the record, the
RFC should have included Assisted-by: LLM.

My first Gmail message was rejected by netdev because it contained an
HTML part. I later sent the plain-text RFC through b4:
https://lore.kernel.org/netdev/20260923-tbnet-tx-e2e-ethtool-v11-v1-1-33a2c=
a1318f1@gmail.com/
Sorry for the split thread.

Thanks again,
Yusheng

On Wed, Sep 23, 2026 at 12:00=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, Sep 22, 2026 at 11:43:16PM -0700, Yusheng Zheng wrote:
> > Commit a8065af3346e ("net: thunderbolt: Enable end-to-end flow control
> > also in transmit") enabled E2E flow control on Tx rings. It was reverte=
d
> > after an ASMedia ASM4242 accepted the configuration without returning
> > credits, leaving its Tx ring wedged. A separate report described simila=
r
> > Tx completion wedges with multiple native E2E rings on AMD Strix Halo.
> > The revert kept Rx E2E and suggested a Tx opt-in for known-good
> > controllers.
>
> AMD is also working on a patch that prevents the issue.
>
> > On two Intel Meteor Lake-P NHI (8086:7ec2) hosts, the exact patch built
> > against their running 7.3-rc3 kernel was tested in a same-boot A/B/A ru=
n.
> > Each arm used a ten-second, four-stream iperf3 transfer. For lab to g48=
5,
> > Tx E2E on, off, then on again produced 15.43, 15.76, and 15.18 Gbit/s,
> > with 0, 29113, and 0 retransmissions. G485 Rx errors rose by 5097 durin=
g
> > the off arm and did not rise during either on arm. In the reverse direc=
tion,
> > throughput was about 19.41 Gbit/s in all three arms, with 0, 181, and 0
> > retransmissions; lab Rx errors rose by 14 only during the off arm.
> >
> > The link was brought down and up to change the flag, so link training w=
as
> > not held fixed. The result supports an integrity improvement on this pa=
ir,
> > not a general throughput gain or proof for other controllers. Both host=
s
> > were returned to their distribution module after testing.
> >
> > Add a per-netdev ethtool private flag named tx-e2e. It defaults to off =
and
> > can only change while the interface is down. Enabling it requires the
> > existing e2e module parameter. At open, the Tx ring uses E2E only if th=
e
> > peer advertises TBNET_E2E. This bit proves protocol support, not workin=
g
> > credit return. Administrators must opt in only on controller pairs know=
n
> > to return credits; a bad controller can stall Tx until the flag is
> > disabled.
>
> If we advertise E2E support over XDomain we must enable it as well
> otherwise the other side that can be something else that Linux will be
> disapointed.
>
> I think for this, we should come up a solution that deals with the NHI
> wedge problem directly in the TB driver side (and this is what AMD is
> working on). Then the Thunderbolt service drivers do not need to care.
>
> Also this looks pretty much like LLM generated, so you should add
> Assisted-by tag.
>
> > Link: https://lore.kernel.org/netdev/20260727123002.25225-1-fy153092069=
03@gmail.com/
> > Signed-off-by: Yusheng Zheng <yunwei356@gmail.com>
> > ---
> > RFC question: Is a per-netdev ethtool private flag an acceptable opt-in=
 for
> > known-good controller pairs, given that the peer protocol bit cannot pr=
ove
> > that the controller returns Tx E2E credits?
> >
> > Validation: The patched module built with W=3D1 against the running 7.3=
-rc3
> > headers and ran on both Intel hosts. A same-boot A/B/A test is summariz=
ed
> > above. Enabling the flag while the interface was up returned EBUSY; rin=
g
> > flags were observed as FRAME without the opt-in and FRAME|E2E with it.
> >
> > A net-next allmodconfig W=3D1 build was attempted but failed on GCC 15
> > -Werror diagnostics in unrelated files including samples/trace_events a=
nd
> > kernel/locking; it did not provide a clean whole-tree result.
> >
> >  drivers/net/thunderbolt/main.c | 60 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 58 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/m=
ain.c
> > index d9fb587a62c5..b17ab8e15c1f 100644
> > --- a/drivers/net/thunderbolt/main.c
> > +++ b/drivers/net/thunderbolt/main.c
> > @@ -162,2 +162,3 @@ struct tbnet_ring {
> >   *                 host
> > + * @tx_e2e: Enable end-to-end flow control on the Tx ring
> >   * @local_transmit_path: HopID we are using to send out packets
> > @@ -192,2 +193,3 @@ struct tbnet {
> >         bool login_received;
> > +       bool tx_e2e;
> >         int local_transmit_path;
> > @@ -950,3 +952,7 @@ static int tbnet_open(struct net_device *dev)
> > -       ring =3D tb_ring_alloc_tx(xd->tb->nhi, -1, TBNET_RING_SIZE,
> > -                               RING_FLAG_FRAME);
> > +       flags =3D RING_FLAG_FRAME;
> > +       /* The peer bit advertises E2E protocol support. */
> > +       if (net->tx_e2e && tbnet_e2e && net->svc->prtcstns & TBNET_E2E)
> > +               flags |=3D RING_FLAG_E2E;
> > +
> > +       ring =3D tb_ring_alloc_tx(xd->tb->nhi, -1, TBNET_RING_SIZE, fla=
gs);
> >         if (!ring) {
> > @@ -1339,3 +1345,53 @@
> > +static const char tbnet_priv_flags[][ETH_GSTRING_LEN] =3D {
> > +#define TBNET_PRIV_FLAG_TX_E2E BIT(0)
> > +       "tx-e2e",
> > +};
> > +
> > +static void tbnet_get_strings(struct net_device *dev, u32 stringset, u=
8 *data)
> > +{
> > +       if (stringset =3D=3D ETH_SS_PRIV_FLAGS)
> > +               memcpy(data, tbnet_priv_flags, sizeof(tbnet_priv_flags)=
);
> > +}
> > +
> > +static int tbnet_get_sset_count(struct net_device *dev, int sset)
> > +{
> > +       if (sset =3D=3D ETH_SS_PRIV_FLAGS)
> > +               return ARRAY_SIZE(tbnet_priv_flags);
> > +
> > +       return -EOPNOTSUPP;
> > +}
> > +
> > +static u32 tbnet_get_priv_flags(struct net_device *dev)
> > +{
> > +       const struct tbnet *net =3D netdev_priv(dev);
> > +
> > +       return net->tx_e2e ? TBNET_PRIV_FLAG_TX_E2E : 0;
> > +}
> > +
> > +static int tbnet_set_priv_flags(struct net_device *dev, u32 flags)
> > +{
> > +       struct tbnet *net =3D netdev_priv(dev);
> > +       bool tx_e2e;
> > +
> > +       if (flags & ~TBNET_PRIV_FLAG_TX_E2E)
> > +               return -EINVAL;
> > +
> > +       tx_e2e =3D flags & TBNET_PRIV_FLAG_TX_E2E;
> > +       if (net->tx_e2e =3D=3D tx_e2e)
> > +               return 0;
> > +       if (netif_running(dev))
> > +               return -EBUSY;
> > +       if (tx_e2e && !tbnet_e2e)
> > +               return -EOPNOTSUPP;
> > +
> > +       net->tx_e2e =3D tx_e2e;
> > +       return 0;
> > +}
> > +
> >  static const struct ethtool_ops tbnet_ethtool_ops =3D {
> >         .get_link_ksettings =3D tbnet_get_link_ksettings,
> > +       .get_strings =3D tbnet_get_strings,
> > +       .get_sset_count =3D tbnet_get_sset_count,
> > +       .get_priv_flags =3D tbnet_get_priv_flags,
> > +       .set_priv_flags =3D tbnet_set_priv_flags,
> >  };
> > --
> > 2.55.0
> >

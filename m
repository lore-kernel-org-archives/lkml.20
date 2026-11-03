Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673199;
	b=slZjIHcH14qhpGDBGZkZytSbU7ZST6NVOND0/OKUzzyfBSXBgmcoZpSOkTH8SgzipUmi
	 mFqD/DHRxj6uav6WlX7QVjD03D5rNY+QdIZofPkN3fuDKz+0ej8lVw/G80U7ind/fK5l5
	 2g5HRlZz8Rhc3JY9exqj9SPa9zulwaroP/7gWi/sqmsMNU5eJMmwfF5sQZlWZQXJeZ/RE
	 /MnlBq7U+Mc6YsW/aWWpQkBs9g1wiljzzT86cELe8IHavoS0RVIm7Hj2oOMSJKTYyHJQI
	 ywG+9P8wjQFwJsIYM320+lB3Qi2oAqT4FqAFlLLv2cTOXRbm5t7r/xlw3v89cLIGHzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
	b=0JwpdqNU4oidR9V4txA4lleAB+RStB4QijMrKUylv3PH517oo/qRqidgTX4yE8JWW+uh
	 +ImhiMi/HHuT6oTZGjJDPb6jhYm4WZZZA+rgrgqq/OWh+Hxm2azFXwKhCA8GW3Wjm6EjA
	 wDK73IdaH8asgcBXQtSGw9jj9HC/B8aumMHJwPbolbigCGCtj9fhYEFC9V1910ue+IV4d
	 GNbFPxpV96If87Jm5f/ajZ9Bmxq2zw3Em9vafkpv5R5Aqq728LKnCtQx1xTTeaNAnoT3g
	 wU/JUSWjZJqeDBQrkZR5TkcmwV7I9zM7fyyZDgf9aV0z7sdtlajnrV3LqlHZfUsxKVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W+Y8XdQ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D497606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D497606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W+Y8XdQ6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso5140a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673197; cv=none;
        d=google.com; s=arc-20260327;
        b=rBiOgstL6DkVNTwuXGNj9coB5FkgKT7F/8OeyIvXtG2SV2DFABiOhB7ivoerodUBEf
         tny11XxRT9bMMS8an7AMDg///5SbA/Ct0xFU6pCw1qjyp3LxLoapGgidFByh6Z0Zlzkn
         tES5RC//OHJJpWJXAVfvE1kJJzvIbyd8iXIja59LkxqgNNKUvs01IjfvXQY7VCCFkhaE
         69AITzPr37KQrwzi6uuC1YB+IIv+LTeEMN4KAVwJqAEstz1pAaf9Jq9GPZxPvPW4zWjg
         YmS9Bn0Ydg1Mqw9TyBVstlazpOviAcepKiu37ufN2COdgRGKbt21zj3DTldFK1Q6KUqV
         AqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        fh=y9ehu1DYn/+VAhk3FqkrjXeN583L740T0CYl6KaJGns=;
        b=f8ZQDm30uL2Gwstlfk0EvlMoO+eKbN0cwkP0rVnHfNEpcgY00m0MtZi3xWWBBNuaod
         7DuZm7KuYQ1OYpmTXjb/SytnqKhUwPeeXx/UmuAeHi/zHyOTQrxmmEyDt8xXfMqfFvHy
         qVyqXygV3UvsEecys09CaPwQrJ2W2OS5sKrWNYVJj0LyB+WTBIvLPXqyf+DIN3KkAvYF
         pMnQv2YDnX0zi5dxFiD5EbJNUBiKIqZ/9mfiU1A+oGGsvWFGwXW/0MY/aiCxPSGHmEZV
         mndX+NC9tA28gej6iioGynUiJjZU1k3QK2tpoeEePMjdvuylMsXcEcFTxZojgn4ad2Xg
         JBqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793673197; x=1794277997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=W+Y8XdQ6mttNbu5uRt0Dl67uj5l4yIeG3+XlCGU8Y19J3q2isuYsf496D9tYXoyuyg
         13BBujovgk6uH/rSYkCLG19C99Sn88E7jLu6cOsZrqsuNvX7rN7cL+yHX7gV1v9fgM54
         4HUZhm3qaJCQGrcQWeCIGW4fHew8JWeDkGQyKL1fShzm85CINcbTxCPTfQHMFFNFYIy3
         YVzxjePngUrxjUDNYVne2nqa1lLRM9s4UMYrEBNdeYs6VKbpR6cU2ON1/hJu+Lf8TZFe
         Aw+IQ1Fy5lfdDe1PEIpvqWeKoZatrCP0JuzQ053+UDCA3FIorYE4ToJ5Hgo3M6j4/4zy
         jF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673197; x=1794277997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=I8UFAY4LTJhnFBYgQD05gnTKxw8MurpDFtZ/Stxa8GeOmT7M7j0/R45nUswtumPt46
         jDyteUI5irNVSbyjLxzedMKTyhkzi2bTQQBMJBUx73MrIHAMGUaj3nTgFIDqQF8Vgw44
         gIKKDAT0o3ipawmeYm+xhntoYS693fMbu5Wold3er+tw9u9Zkh/C/Uk6Ejo/0CS4jjD3
         eBVUoo5aSHj4O2hRIHZMgmRmSAwOOWbcmi8TOt2b3xAuRc3uTsqAloPGPEby9qchde41
         pumnNtT6Qv/S05cJoTolSJ9Sy7VqfLNUeZ6RjJtajByzUjV/XYtmKoL0LWhVnUkYf6Mn
         RPlA==
X-Forwarded-Encrypted: i=1; AKwUvBzQSpWklc/JTVi9y9+DfrGFXy6+/MWxHStT8MGhDUx4oPW9lFfAzcX1evwnBbdRJic7BsOR6xBjG2PmuCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xVVBipzBEYCpq130XC9lQIX66se1v+eTuA6JhsEQr21Ybd35j
	WsJLM2o9CIzawe3HjGtt+KumLbYk7g/SzjprM8EapxRCqkfdUw7NSyT0a9dAvj/cnAMaMSqCXi2
	wb/WMd0N+FCuD30tZNI98lNzv89CUo6OO1OGrrgwP
X-Gm-Gg: AYBFou3iJlcNreY3deykTL5e8YyukGBzKzDsL09NVpF4JBBK53XOCg9TLdmoKUgoyer
	2Y2c7YTQzGaIeWifcwOQRlRGZVjlRGoHZ1zgLfo8ioMpnGBfJGS4TC/gUWI7r3SQnzp3kWdfUDt
	Y3IU8t2tK37jroKgy+mzA3Y9PgsQfRXkftx5h2rB0kgfFxsb+sdcT6rnPWLbdkjXcKY6BacmSZu
	s2hccz5AvSdpPnZaxsVMzOoC2kA6/y23LwTMccCkKOgGiHlOpnBvikBz6x0/K8bcfB5+9o+KMXx
	RbWvkM+V2roxLfansbPGfvj4BGxBiofU05hDNTzDVDo/6p64POshhHOktFJCXMixPc1U3VHCulM
	IgbPI0nZmgD816W26Al9OBXZpOwIpEdh4I8A/Nso=
X-Received: by 2002:a05:6402:312c:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b539d10cc7mr27911a12.5.1793673197149; Mon, 02 Nov 2026
 18:33:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-7-sdf@fomichev.me>
 <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com> <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
In-Reply-To: <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:33:05 -0800
X-Gm-Features: AclHuK821CTY_RbKAnEbXzfa7MUQLlmGp2kVuevnXDs5zsd5kldlK8Q3AHE6hIM
Message-ID: <CAHS8izMSpG-ng8WFi6K5oAuJP=Jq=vuxshuktObe3AM_iJRgvg@mail.gmail.com>
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:38=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 11/02, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@=
gmail.com> wrote:
> > >
> > > PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> > > which makes BIG TCP ineffective.
> > >
> > > TX net_iovs only need to be DMA contiguous. Use the largest power of =
2,
> > > up to 2MB, which aligns every DMA segment of the dmabuf:
> > > - 2MB hugepage-backed udmabufs get 2MB net_iovs
> > > - no UAPI change, TX addresses are dmabuf offsets
> > > - skbs are still bounded by TCP's size_goal, only frags get larger
> > >
> > > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > > ---
> > >  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
> > >  net/core/netdev-genl.c |  2 +-
> > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index 19c039ed2cb2..98c9594dbf99 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_d=
evice *dev, u32 rxq_idx,
> > >         return err;
> > >  }
> > >
> > > +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size=
)
> > > +{
> > > +       struct scatterlist *sg;
> > > +       unsigned int i;
> > > +
> > > +       for_each_sgtable_dma_sg(sgt, sg, i) {
> > > +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> > > +                   !IS_ALIGNED(sg_dma_len(sg), size))
> > > +                       return false;
> > > +       }
> > > +       return true;
> > > +}
> > > +
> > > +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX on=
ly */
> > >  struct net_devmem_dmabuf_binding *
> > >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> > >                        struct device *dma_dev,
> > > @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, =
void *vdev,
> > >                        struct netlink_ext_ack *extack)
> > >  {
> > >         struct net_devmem_dmabuf_binding *binding;
> > > -       size_t niov_size =3D 1UL << niov_shift;
> > >         static u32 id_alloc_next;
> > >         struct scatterlist *sg;
> > >         struct dma_buf *dmabuf;
> > >         unsigned int sg_idx;
> > > +       size_t niov_size;
> > >         size_t niov_idx;
> > >         size_t i;
> > >         long err;
> > > @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, vo=
id *vdev,
> > >         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
> > >         write_pnet(&binding->net, sock_net(nl_sk));
> > >         binding->uid =3D sk_uid(nl_sk);
> > > -       binding->niov_shift =3D niov_shift;
> > >         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> > >
> > >         err =3D percpu_ref_init(&binding->ref,
> > > @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, v=
oid *vdev,
> > >                 goto err_unmap;
> > >         }
> > >
> > > +       if (!niov_shift) {
> > > +               niov_size =3D SZ_2M;
> > > +               while (niov_size > PAGE_SIZE &&
> > > +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> > > +                       !net_devmem_sgt_aligned(binding->sgt, niov_si=
ze)))
> > > +                       niov_size /=3D 2;
> > > +               niov_shift =3D ilog2(niov_size);
> > > +       }
> > > +       binding->niov_shift =3D niov_shift;
> > > +       niov_size =3D 1UL << niov_shift;
> > > +
> >
> > How come we're not checknig the largest supported size of the netdev he=
re?
> >
> > Also, maybe should clarify in the cl with the largest supported size,
> > is it actually only powers of 2 up to that power of 2? Or all sizes up
> > to that (not-necassirly) power of 2 size?
>
> I think these are a bit orthogonal, no? We can have niovs larger than
> the HW can tx. If that's the case, we'll just sub-divide when we build
> the skb. If we limit to the same chunk the device can handle here,
> we might use 2 frags to send single chunk worth of data more often (offse=
t
> doesn't have to be aligned to the chunk size).
>
>
> Assuming device can only send 16K, current patch:
>
> [       2MB        ] 2BM niov
>      [ 16K ]         sending 16K from that 2MB will use one chunk
>
>
> Limiting chunks to device's chunk size:
>
> [ 16K ][ 16K ]       16K niov
>     [ 16K ]          sending 16K from offset 8K will have to use 2 frags
>
> (obviously, the same thing can happen with 2MB chunks, but less often)
>
> LMK if it does not sound convincing.

Ah, I see, the skb gets segmented somewhere else of course. Derp

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

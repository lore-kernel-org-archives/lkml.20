Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795B24DCF9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111815; cv=none; b=MAMZlbOm1Pp6BZu2REUluj1ke/Acp69nedrOI42fs0MGXdNt0WArqmklTGlP3H6QcB4iJgub6i+HDKvPxvA40ULQe3HnZOv/IXg/g8yX2PImXTPQp6CyuxCmq7YAhbcfoxNq022pD3lML6af9thJETE5dw2MzAgL/ZSTsUCg7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111815; c=relaxed/simple;
	bh=CJP/ggCzQuuxULowQNsI1E02/TcDELy1DjabjGF1OJw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NOAPJ9uNH7pV2vY/+6862xAmb1aAw5/ijmXdI/IcN7AzlhGibf5cQJBKNjbfYQsq2zVpYCtreB1EwrZUhDrFi78rnLz0/ItengKnMGemjoamN610UJjKmmbw15pbzfjoRFATvJz9IkK7Zm+9R8KCE/4QxQSdvqnQ1Q/vflnO7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=XvxxRSTD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="XvxxRSTD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so9402795e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791111810; x=1791716610; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRY4iUwoy0k7A4Q+WlcGtk6KJOn/v2ablV6+SEfz6BM=;
        b=XvxxRSTDHB/6sVJHEXdtHhzYYqvLIy/yLAF0MEzv6j6wJMqM2XRnxyRrnyY0dDIIoR
         OP3F/cdyZCG2Q/YWa21gap+ZkMY+MZRCbToxtk8Ww2nzR+exANw4YGdjprbsauDIMVTM
         6QgTx30vZUM0KhZnm47RMciTV1y996smSGODBXmYYDcKqhM5lExca+iA7fZJGPKH/ZTs
         picwKwh11GpSagEYxwqutrCU+u7p78L/3qlXn+3JOXp5DzmwtRFd1anp1YbdD6nrvdIk
         /p+s/dmydWpHjWKJGP8Yszu7XAb6IY/tdFlEMJFTbMAFFJeI2odJf04Ql7QQlsjmmDfd
         jDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111810; x=1791716610;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRY4iUwoy0k7A4Q+WlcGtk6KJOn/v2ablV6+SEfz6BM=;
        b=qqWZUzqRf60Yy4phBg51q9nkglpoQ42lGP+iByBh/22n8gh2iPueJVfgjA15s6gskz
         5X/hpS7ivtRHLtWYwLYeaUu2ONwMCbaJ0OKgeGwOCRqTXR30bGHTmPk1gkVXn+8WzQjb
         BWMpJIcoZME/HKUFAnBKp3XQFnnzFBZddj9bizTwdpYQGW7bnkU9wl63yB0vtxXfNX6v
         Bu0Veup5x9VNA+vnqsXYAHDGzmMgjPVQ9/Shi20V7lTBLCdUyszS/ADf6VKPvKA5NWSa
         SoH+er7Jpuhs6ShuRmWy6B4+ctVNQ+s4Cpl8lTH7fQJVL3CAMF9W7r2kV7jdSUuwu/kX
         sbPw==
X-Forwarded-Encrypted: i=1; AKwUvBx+iU5zBzSlXMv5ia1pTGPeYUrybfPOvPs8EaysUZz59pqi/gugMd7g1N2FPOKNa567241hnxcSniM/gcU=@vger.kernel.org
X-Gm-Message-State: AFuF++nLbewyEqxb4ExNBPGgLXzv/qLZ3vbglc0aBf5Ho63WpUzpYTkA
	Wt7ENfDZSXD8kybo+dbIwcrx4EBRffYpMIMsZTxZaDQLMRBcJejB96FpYhyjRiX/dbA=
X-Gm-Gg: AYBFou3WIa3YimtiY4EPOgK1qhzGQ2cOm/XPXMsVLnmYuZjv+AykoysPsYVo899CkRi
	3RX0oS7pRD32DC8iyiOpXA/JhKlI5OJRzGMXoLExaFYZG/fBwNsiJh0p/v0Ih+ZBOSMp5wfH3Ht
	ZwWVqeyFb6xjbEDdVh5K5Hshvoc+6nRT33+JSB3BKjRhXXdCdJyYHMK5oAZ076g42APDmQ/Kf7f
	6S31bNc/5cbYckzD+A3MF5Uq8bAJ/n8lX8pTmv3FTqqvU1jSAPuaX//1NUV6I5qqsTlhkqj45xn
	nmBZbB8xnJ/1i9R+IyPmt9peahLCPcwZEVi8A9LSJwy09yLZSLRVkr9SSJz5VAOvBa7EGcTwWu0
	dWcGE/jL/RztRau+0/9SSJw3vVBL4vFPtvOo3Lc/I5Kr0i/wZVWiHhoA7+MYTkmQVA4h7FzgUYJ
	jtBZZ038x00o+v7pwiQeJP5dAJD9RLeZpucwBTXDlISlenrUSrqxceDd91I7IojB8DQk3KyTzFF
	7qZ9VxY6lkJqv8PUIfZjT7n/UKZeHvHtfm9ayaXE4DCBkTP9UbWOaVMlE7C2RwAtzlQpT+xtceT
	echMJloLxb/Uf52PErKtLqNlvJkfgMv4O6WtWWPw
X-Received: by 2002:a05:600c:3509:b0:4a1:69c0:a1f7 with SMTP id 5b1f17b1804b1-4a169c0a338mr59304215e9.34.1791111809834;
        Sun, 04 Oct 2026 04:03:29 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm283591575e9.13.2026.10.04.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:03:29 -0700 (PDT)
Message-ID: <5c6b215401bd705f2023102e9d8b779ee4ae8c4a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Radu Rendec <radu@rendec.net>, "GUO Ren (XuanTie)" <guoren@kernel.org>, 
 Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel	 <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen	 <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>
Date: Sun, 04 Oct 2026 07:03:27 -0400
In-Reply-To: <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
		 <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
	 <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TPZS9VL83/bL5Rbeq0pg"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-TPZS9VL83/bL5Rbeq0pg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 21:21 -0400, Radu Rendec a =C3=A9crit=C2=
=A0:
> On Fri, 2026-09-11 at 03:27 +0000, GUO Ren (XuanTie) wrote:
> > The last enumerator of this driver's firmware IPI id list is a bound
> > for the VPU mailbox protocol, not a generic host IPI limit. Follow the
> > existing naming in this header: IPI_VPU_INIT already carries a VPU
> > prefix, so the terminator should match.
> >=20
> > The same convention is used by the SCP IPI enum, which ends with a
> > prefixed SCP_IPI_MAX rather than a bare IPI_MAX.
> >=20
> > Rename IPI_MAX to IPI_VPU_MAX and update the descriptor table bounds
> > and range checks. No functional change.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20260908222349.GA2324870@ax16=
2
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>

Applied, ty.

> > ---
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h |=C2=A0 4 ++--
> > =C2=A02 files changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.c
> > index 8d8319f0cd22..b3e9f8c4ab7a 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> > @@ -211,7 +211,7 @@ struct mtk_vpu {
> > =C2=A0	struct vpu_regs reg;
> > =C2=A0	struct vpu_run run;
> > =C2=A0	struct vpu_wdt wdt;
> > -	struct vpu_ipi_desc ipi_desc[IPI_MAX];
> > +	struct vpu_ipi_desc ipi_desc[IPI_VPU_MAX];
> > =C2=A0	struct share_obj __iomem *recv_buf;
> > =C2=A0	struct share_obj __iomem *send_buf;
> > =C2=A0	struct device *dev;
> > @@ -221,7 +221,7 @@ struct mtk_vpu {
> > =C2=A0	struct mutex vpu_mutex; /* for protecting vpu data data structur=
e */
> > =C2=A0	u32 wdt_refcnt;
> > =C2=A0	wait_queue_head_t ack_wq;
> > -	bool ipi_id_ack[IPI_MAX];
> > +	bool ipi_id_ack[IPI_VPU_MAX];
> > =C2=A0};
> > =C2=A0
> > =C2=A0static inline void vpu_cfg_writel(struct mtk_vpu *vpu, u32 val, u=
32 offset)
> > @@ -296,7 +296,7 @@ int vpu_ipi_register(struct platform_device *pdev,
> > =C2=A0		return -EPROBE_DEFER;
> > =C2=A0	}
> > =C2=A0
> > -	if (id < IPI_MAX && handler) {
> > +	if (id < IPI_VPU_MAX && handler) {
> > =C2=A0		ipi_desc =3D vpu->ipi_desc;
> > =C2=A0		ipi_desc[id].name =3D name;
> > =C2=A0		ipi_desc[id].handler =3D handler;
> > @@ -319,7 +319,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > =C2=A0	unsigned long timeout;
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > -	if (id <=3D IPI_VPU_INIT || id >=3D IPI_MAX ||
> > +	if (id <=3D IPI_VPU_INIT || id >=3D IPI_VPU_MAX ||
> > =C2=A0	=C2=A0=C2=A0=C2=A0 len > sizeof(send_obj->share_buf) || !buf) {
> > =C2=A0		dev_err(vpu->dev, "failed to send ipi message\n");
> > =C2=A0		return -EINVAL;
> > @@ -748,7 +748,7 @@ static void vpu_ipi_handler(struct mtk_vpu *vpu)
> > =C2=A0	s32 id =3D readl(&rcv_obj->id);
> > =C2=A0
> > =C2=A0	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
> > -	if (id < IPI_MAX && ipi_desc[id].handler) {
> > +	if (id < IPI_VPU_MAX && ipi_desc[id].handler) {
> > =C2=A0		ipi_desc[id].handler(data, readl(&rcv_obj->len),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 ipi_desc[id].priv);
> > =C2=A0		if (id > IPI_VPU_INIT) {
> > @@ -934,7 +934,7 @@ static int mtk_vpu_probe(struct platform_device *pd=
ev)
> > =C2=A0#ifdef CONFIG_DEBUG_FS
> > =C2=A0	debugfs_remove(vpu_debugfs);
> > =C2=A0#endif
> > -	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_MAX);
> > +	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_VPU_MAX);
> > =C2=A0vpu_mutex_destroy:
> > =C2=A0	mutex_destroy(&vpu->vpu_mutex);
> > =C2=A0disable_vpu_clk:
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.h
> > index 3951547e9ec5..44ab631ec904 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > @@ -49,7 +49,7 @@ typedef void (*ipi_handler_t) (void *data,
> > =C2=A0 *			 handle VP8 video encoder job,, and vice versa.
> > =C2=A0 * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
> > =C2=A0 *			 handle MDP (Media Data Path) job, and vice versa.
> > - * @IPI_MAX:		 The maximum IPI number
> > + * @IPI_VPU_MAX:	 The maximum VPU IPI number
> > =C2=A0 */
> > =C2=A0
> > =C2=A0enum ipi_id {
> > @@ -60,7 +60,7 @@ enum ipi_id {
> > =C2=A0	IPI_VENC_H264,
> > =C2=A0	IPI_VENC_VP8,
> > =C2=A0	IPI_MDP,
> > -	IPI_MAX,
> > +	IPI_VPU_MAX,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
>=20
> Reviewed-by: Radu Rendec <radu@rendec.net>

--=-TPZS9VL83/bL5Rbeq0pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasIyfwAKCRDZQZRRKWBy
9FPtAQDkOJhhuAzPdjhptdi8Ylku8gIEE5VszzwnAapD1IuDBQEAglHv3kKr78aE
qCuExFYbYHz3OhJLH8ntRzJdldPqtQk=
=d6+8
-----END PGP SIGNATURE-----

--=-TPZS9VL83/bL5Rbeq0pg--

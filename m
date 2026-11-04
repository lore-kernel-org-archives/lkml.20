Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818774;
	b=Wr6ZGgiyCO7EzZtjqhZY5whe/36h96rNOPyRr3yjx423FQfCH+MiNj6ibgRButk7Kwxg
	 oeUdfY6fH2qQQ2EpcOdxM/lwwTpeMKzHF62I3UKjhGmw/i1fRvj5HqH1vG5P6fA7SPzaI
	 G0UDaJJXVB8B+v674IqvTqylL1bxhqkumsVvm4QUXzlhPxABhaVT4IVQa4dSnFJEqHmaD
	 XovaZJL9kth4NiWEMqkWSAIjzgiVmHqCXSRF5jGHVlxit6Mlh+6wRGtf1gFAPd5+nzmC1
	 0NMqy3Kg/lBHYZXxetTDMxr1Pq++QPC22ZrKLPyqUIV1FyAYnHbR58Kgmd25gmp4MKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818774;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=;
	b=FlZOKZmmOZ2agh6J0w2rd2Z+YTZvijUemT23al/sKZEVN6T+fUT5QI5C39b0zh3TmgL/
	 NmYwyiNj5ouN3ovFAGoI7QRRhFyBHxN9KK7a5Gll4Hx2i541DvSHDCB+9D292iSuaY7U+
	 sk6lZ5xGS4218l3lAl6Z2yBVcva9q4l4YnpCpemdESld2DENOjUvu09HPq9JCzMY8HyDS
	 sE3WCYRltsplk3tFiJcs3oXSi4lF9X9mW6VOV8aW4CGAO4Zx7SmB3A+a8uLmfISffBUzx
	 1NTe4PiPZkulXEllmiHjLugdCZm48kVcdvK6HWaYhe627why4ls5nsNmCfWH1wP3XBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZSXPcTro;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88EC606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88EC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZSXPcTro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793818771; x=1794077971;
	bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZSXPcTrojU0nKPQ7wcqHAeV2ZoLT12SqXlgU//5hc5rMpnCKKFRMAFllbrCF3LYKP
	 domxctA98X0SMSPXMMr+ueDPRlpjGteXvhusWkTNx0BQdCrF6z0OIYSHy19BKbo2/n
	 4WY32gq8Bt6OFUNVd0afx9nmUf9ghE7koNV5hU0DZFZUuWkzDKTxb276tKL/9kpUXl
	 p1Uj1O6l6Phlho0PoqcNnU5Fw/tlyKRcIU7IgmLrpWA92LNgFS66GvgLwMZ8E1Wxk+
	 nhise5dBgYi7BLOHE5EeVKAq9r/0xzkf84V/k+3nRBX8Nm/TfF9eGcuzipcZkIJ3Se
	 mgZ8pcy0DVPyw==
Date: Wed, 04 Nov 2026 18:59:25 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v9 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Message-ID: <F0G_dANYlJ1-UIb2SYBfD3M-Lf0LDESQ3_gls5cGALE1EXYHhZXJHfAibDIjbFR9Rc_rfmce8tk8vBoevtJ94X3inG6HVIVzzBBtWCyPTW0=@protonmail.com>
In-Reply-To: <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com> <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 72767cc76342ad316c8bf2f0e9abda7edd262961
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 16th, 2026 at 2:09 PM, AngeloGioacchino Del Regno <=
angelogioacchino.delregno@collabora.com> wrote:

> Enable PM Runtime at the end of mtk_dsi_probe() so that the
> mediatek-drm mtk_ddp_comp_power_on() function is able to do
> pm_runtime_resume_and_get() and, analogously, the function
> mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
> device.
>=20
> This makes sure that the power domains for the DSI IP are
> turned on and off when necessary.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

No regressions on mt6595 or mt6768 platform.

Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6595, mt6768

Best regards,
Roman

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 3b33419aee2d..4863d910511e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1735,6 +1735,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n=
");
>=20
> +=09ret =3D devm_pm_runtime_enable(dev);
> +=09if (ret)
> +=09=09return ret;
> +
>  =09ret =3D mipi_dsi_host_register(&dsi->host);
>  =09if (ret < 0)
>  =09=09return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> --
> 2.55.0
>=20
>=20
> 

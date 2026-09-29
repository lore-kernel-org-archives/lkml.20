Received: from mail-qk2-f2.google.com (mail-qk2-f2.google.com [74.125.230.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614535295C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712043; cv=none; b=CrM8oAb2k64IB4RX8GdOQ/oE1q67m/3D4IPIDRXw79PjV0cUkbU1tqJ7IlwWYqgCi9D/sls/WzHHC0obmGPmRgt/DXtslNHh7ftaZN/YARy2DFtv1IQh2iRsTcZPBwYmGamlfL/2TGJdeWcHsgK5Tu3yyLiF4H5UvU7MPCz9RfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712043; c=relaxed/simple;
	bh=bflvXTI33vjxSht8XTOG8aF+khDqayoPxK2CclOBoqg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oeSsZyM4O0y5uR/42bVnDCm+U8MZ/4K+yxYa3KS2zcSStCV8H57Tl+8ts5icgt6bOzGFeEkuY49Mx18v+DhsWVeyyIFlfNmznc7K+9H4vaI/14mr7dn07xBfhh9/coMigjRw1ioNK/fxATgfGpZexHQatVerTuNEURJprJQNaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=pGQ9kmn5; arc=none smtp.client-ip=74.125.230.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="pGQ9kmn5"
Received: by mail-qk2-f2.google.com with SMTP id af79cd13be357-93c5ad75c17so246573685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790712040; x=1791316840; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=pGQ9kmn50/VpFsVE5cO3R8GriOe/9y9QIIQ3v5tFSZ6jMuOQ1YA3KICYKR/cDvRf9g
         VzQ1IlMgl962Asw+La47f1iauiVorz1/ea8AyQtTwKg7kCSIseLpX5YIdTH4IdVcp6gd
         vnAzTroJgpJYJeYqqJ7lCnWHoOarELypOu4UHnVVDVnPVUafNbv9i7Qu4vDvt/KH4PDU
         b/2sF9kQBKRuRd2E08VNof4YEapTSoE14KGcA6D3xptvMOCfLgfib7xGLPFP2do7Xou+
         WkPpPjOj92c85vQEDst+pithOVqvRw1C938RHjhMv3bRGpUoKOFXhoewFx0BWERaDIIc
         WI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790712040; x=1791316840;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=PDd9u8tSMug+lWgfAeuYi8jDBtMcRiFMc4UqUQzfFz6sQCRJbMDNJZkgCpSE6THwEj
         MRWt/eTqHehB6y+JzwItsNp1ku0ulI+kQ9jgUoVsPFn8+SYFLGebMrB1/3fUe4EGCuAU
         aK9J56eXGO1lheKmE/8TftvfTgxeJOPi8R2TjM2JPVtI2FjANeHfJEx5dZdsZAGm4KeO
         bW8czHaGy6DEQz00SOSRAf+4JVNHzInI1sei6XZNOFDRsuyfR6bQ8pmY8UdbvyMOz4yT
         1jI7Fp3Xu4kgmtdwOJ6dsiyoEnv/ex3Bx8E0lNhY5CtGCBOX5ddZfS5Y8rwxgIsrxgfm
         AQVA==
X-Forwarded-Encrypted: i=1; AKwUvByjmOW/WMFxgtt7pqLpxnJ7iClUXkFYWUxtvAbKqgQ8KUYPxJ+AxtOjwPW9KA6M2F6qXwcT6lX4rh+pXAg=@vger.kernel.org
X-Gm-Message-State: AFuF++mrRKKj7kZ/NET1N6W6hNtRblGW0d4S/VQA/C9lO06+LXBQ3CON
	7mZFUciQabNJx+StOTCb8rWs6ckbn30ir4DzFErowGOTESVd2nsh3TjB/UiafHzQqb1854WUITf
	WlETdlCmp6kwC
X-Gm-Gg: AYBFou2W7S3xV1B+MY+5+Zsvj2xkFa43nNuxWWBucZtbIUXtgxTNgfgiLZEl4dCR5Ot
	NnaFTU3GpEbFxFkokafh4w5I4x7/ZPGkKhPjPukjPIEsP2XU1f9SA7uEkGHv8DH/KStx3DavF3q
	vqGIVacYDJFJH1gBHmOIIVq6FQS4842Ul5EEgEv6/7DQewuWBdt1YW2zOO9CV4kBTxhe8G14AEh
	opZjf1fnXCcdnF6BfzAlXJt/51alF03g12JqwtDZU6UhD2zeW1fn9N5sjoh5/NGU751PcibIs69
	ZkUfpbGAPwf7rmbCDbfbl9SeWn6tlZ0S/9SEZWMWrhCi6QU5NwmJsm6jILw0FTMmgSnt8FdRlFZ
	fQJlh742msEYggY75YiunVX0nDInRn7JMt7QkbLoa3zSDIcoAoAJAMs6Ikkf58phOe+NfG9tILx
	gOb/05BeTwn/y4vZJki2w74k420VOGKk1tb2DSvoB5cEA+mCg8z95u0uCZk8EY9b8SOMp5pU/eE
	0dk8Q5c+WjqcqM=
X-Received: by 2002:a05:620a:2586:b0:93c:68f0:f0a2 with SMTP id af79cd13be357-93c9fc42202mr119215685a.65.1790712039675;
        Tue, 29 Sep 2026 13:00:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987aa21fsm3242546d6.10.2026.09.29.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:00:38 -0700 (PDT)
Message-ID: <232d8d12f9fa302e14d22b0b1f5d659a45d83ed3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vpu: free IRQ before destroying
 watchdog workqueue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, Song Li
	 <songl@zju.edu.cn>
Date: Tue, 29 Sep 2026 16:00:36 -0400
In-Reply-To: <20260923085921.496767-1-fanwu01@zju.edu.cn>
References: <20260923085921.496767-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-fhr5ayFbyS+0mRQDrJmg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 23 septembre 2026 =C3=A0 08:59 +0000, Fan Wu a =C3=A9crit=C2=A0=
:
> mtk_vpu_remove() destroys the watchdog workqueue while the interrupt
> handler requested with devm_request_irq() is still registered: the
> devres core frees the interrupt only after remove() has returned. If
> the VPU watchdog fires in that window, vpu_irq_handler() queues
> vpu->wdt.ws on the already destroyed vpu->wdt.wq.
>=20
> Fix this by calling devm_free_irq() before destroy_workqueue(), which
> releases the interrupt and waits for a running handler, so no new work
> can be queued while the workqueue is drained and freed.
>=20
> This issue was found by an in-house static analysis tool.
>=20
> Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufres@collabora.com>

> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f..b6bd80b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -962,6 +962,7 @@ static void mtk_vpu_remove(struct platform_device *pd=
ev)
>  #ifdef CONFIG_DEBUG_FS
>  	debugfs_remove(vpu_debugfs);
>  #endif
> +	devm_free_irq(&pdev->dev, vpu->reg.irq, vpu);

On the clean factor, it reduce the use of devm API here, but the error path=
 in
probe relies on it still.

>  	if (vpu->wdt.wq)
>  		destroy_workqueue(vpu->wdt.wq);
>  	vpu_free_ext_mem(vpu, P_FW);
>=20

--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwY5AAKCRDZQZRRKWBy
9KULAP43NLUTImHqX9ivxd9kELGpFXE9g6z+OyEjshp8cbtTjAEA6v9p0zb/FZ2S
5xMDzjZ73uKB7T217AXpRwnRjKu3JgU=
=Ksa7
-----END PGP SIGNATURE-----

--=-fhr5ayFbyS+0mRQDrJmg--

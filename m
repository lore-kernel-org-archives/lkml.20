Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFB3043DE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715680; cv=none; b=V1k5hIRDJB+R081ebZihNqMcXswbBtC34Zsq9xU81dUsaJXig2pwa+DOB7z78GTw/ykka6PCP+CnEQABaxUGEVGSvCWe8fQSgp8qEO6AVvcwefCkXzFRw0vatSWChFjmbS7ujqQoPsJ6Z43XkEVUJS6f9AlvoVA8Ffd3KPQKj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715680; c=relaxed/simple;
	bh=2+ejL0YZjI8InY0H8ZJcRERvW4tbYvlDaxnKFDKpqyw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+YZOCs3k1QnYbE9AJIStKJnaYU6DhDaCIbwecQuYw2vQeXsuM7UqnISnF4Au553U/TyzPXJEkVJTh8AlpkhLfrfndieb1+yAYmd6ItJcEQAsTYJs83FmVpZ0i9hQoKlERSrkdBjD2XDc5n+OVXqlmsK3SLoy8OquY7t9lgO1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=01rQEZem; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="01rQEZem"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso3060195e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715678; x=1791320478; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=01rQEZemfUJg+3qt0rigGhhQqFf/xLI4VumTIP9BDt6uzvbnuFLDEOxHSO45v22ry5
         mrU2aAhScNzE0ZaK43VBPtqMmMsmf3PDHAecdtoOLmYmbvV7ZVkWZpLTOpC7rHEvvK6B
         FUTwM7vuLSB3E/wCy0FqZeSMuocfB1i7P5wKCNU2hi/U+JQ4LChxeJqI5lpGFiMgtIeT
         DT1UgiV4ghL+2LWpGKxrSYUgxN1SeW0ikejSNrt663U+6cHQ81UQnds62RWV1NHmgHIz
         4R+OSW4n7QoAhZFvw0EnxQ0RXGOpcp96x6NwuVikJv35+fh7an7yqJM2+gO8FT6Hbi3f
         QuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715678; x=1791320478;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=da5r1BzOuapJfU8h9gz1djBLf7rvJFLzj4yJID7GSRu+4MzJhnsBp3GG79CIse9LhV
         KK0y7vaZR7GmW0mCs3qGCBT9PIkWOBdhfovdDEaKsCksRTqYVhYIHKQ2GKnD5YD/Zk0e
         hnaudmMzsY+qsWl7KWXBGEnwmJpmwJNjxk9gIB+sd8kZxE+3xfxUJbmLlc/fTbpfVa4F
         C/gYwtouN0hRSRf+XHHue2ggfbi+oKtXGaLnD8mhkpPw7b+tfOVt8QTin9vb9jS9Nkvh
         dXehk0Yx3Eai+k4pAZ32mXbJYGXyGd72PuhW4fxDwfJMkYhVVXH3jxy0PliD6nRD7toA
         wiEw==
X-Forwarded-Encrypted: i=1; AKwUvBz73fRrrsKFiP+V5DKd3TRg4sF2YCvbGlyc6fsXcdywWADyn87WU+Drd9AuC6/noLsfjFqNByMvAno1LDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV/YMMNBRfjqcZksQF+/gFoELMYlRY072WsaqvyZofYIfGCZO0
	9Zj/LQHh6vLIXrhrJ/Pxwthey2P0Mnsa6H3hoKsSBW7A5rrKiYalWv0K2PYFRy0B2BnoIeGOL6p
	ekPlt6bzPdw==
X-Gm-Gg: AYBFou186/v1bB9UWUfn1jXAtRP0uytTb7+U4t+f6GGVVsRM2e9o3vidL7RblHt7S3T
	iSOFq8UqkX+IKyOX5tM8+OQ/XDCbmNx4d23cd1s2eIgPywTM+3QBnqZZMJOwiGshLpTwEGeeGoE
	qAg1bu96whESxcpHaF1T1f+5isS+CS6sagzkEJv5V1wnXBcUouY1vND9b5CxyjiN1XVdAtOEF+b
	ot4SppDPtj7SR0DkA5IHNLsxCqG9OSuC5Wt4z1h6MGhHKYmZb65xP053xkJgJD+zzH1UwCEekwa
	olQ+/lDbx9K1I2zVuF5wVY8upz0Ud1TSKaWOfleImD69IN/l2y8Pry8X6JV9VUpPLi6oJXiueTt
	jqOk4qmOFst2cUnl8Yx3uPN9mswfRME02Q26gXTF2NocrUPz8Ra8qErP/XR749afL6aKD6ZBXGD
	5697Ss7zF3tGp3UuwcyHThvYVmyzwDWDmK+tQL2bt5W1JK8+sWfpQ2JQbx1uQY6JBvXIEgmamUd
	PF95B05eWf8ErMIGZ7Wpvlu
X-Received: by 2002:a05:6122:1c05:b0:5c9:ae70:e784 with SMTP id 71dfb90a1353d-5d5131cdd4cmr304268e0c.3.1790715678096;
        Tue, 29 Sep 2026 14:01:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e778bafasm1226873e0c.5.2026.09.29.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:01:17 -0700 (PDT)
Message-ID: <dd1d9010ad1a3ee11fc38923dfa1252992c2b245.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: Fix runtime PM leak in
 mtk_jpegdec_worker()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: bin.liu@mediatek.com, hverkuil@kernel.org, irui.wang@mediatek.com, 
	kyrie.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:01:16 -0400
In-Reply-To: <20260917100247.2145872-1-vulab@iscas.ac.cn>
References: <20260917100247.2145872-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-OaQi5nvPKDU3qCHl6JAX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:02 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> pm_runtime_get_sync() leaves the device's runtime PM usage count
> incremented even when it fails.  mtk_jpegdec_worker() jumps to
> dec_end on that failure, which does not call pm_runtime_put(), so
> the reference taken by the failed resume is leaked.
>=20
> Use pm_runtime_resume_and_get() instead, which drops the reference
> again when resuming the device fails.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc..ed1d5858c942 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1732,7 +1732,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =20
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {
>  		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
>  			__func__, __LINE__);

--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwnHAAKCRDZQZRRKWBy
9E83APwLk0zeKWzQOIGJYqNZSVuM65LfwP9mlNJVQ/ss2bY3FAD9EhLs8d7/vbqz
J2u9T+/yffmnP0xvF8G43YoE4lnGZQg=
=AlR/
-----END PGP SIGNATURE-----

--=-OaQi5nvPKDU3qCHl6JAX--

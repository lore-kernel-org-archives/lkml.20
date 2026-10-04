Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFE31716D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791113285; cv=none; b=Z7a448OlV5j8I1KvZe5W8N0rd6rqmwKeim9RmDZj/2bkQJ49bZ7WXaLzG9ZDs1E2n87tBDePGz+4scOSSuJ85jGZbhEO8+ZYthEM5EfGKHhm6P4CtUgmojJt7rmsfKFyrRM8pUPIFlxee25hhFcUZQQnH1mneNH0+7UC3HQkHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791113285; c=relaxed/simple;
	bh=Pw1f81LaODULQmp8OaqxJr/FMx1fA9sb9yTqltmkDn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifAcErIkI8oN5tmUm8aHbd3eDGHFjPkywFBmv6Hw3W1OlvrFqOlRKme4LBbrE+LwDBfN0Yp6b3hGHjmVWzPHpUKswzqKzg6c0V509hSlcaZ+WVHQ5sA8yx8uxVhMxsLvGw/z6CjeWXMmFS4Bu7VskABGIfmk56DiVoFFJ7aby9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=p62l44Aq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="p62l44Aq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso5411085e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791113282; x=1791718082; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhuCTwJXESFC7GXHK/sAbi8kSiySbX6q8d3D6uLo3NQ=;
        b=p62l44AqqPikCS03wPMMPIQA9WeNqOT89UWczwQ6xrk5Dj1LAOSvsMuMT3xpR1FS7e
         dw7bmKZwHLFusXWMwH9chekhaBmWult8nHCVDTJy9DFq5d8d6oRbglqLWjIGA0O3Atpr
         phjLcyeHOvvfzb8o6FH93747hqybvzlRbTEMkkfGWKmRb74UUrl+QPG+Gx2V+wJibm8z
         ZgRj+vNz9bhwUm+kqX2pddfU/+G8Zy92fmnbYlqeqNb/hQRJosRHVJvtBldo5ih+hBCh
         sDFJ3yw6tK2c7uuBtN2qiq+HfivGITTVnLxhU4ghA+KdVjiT0WA7Y1/Jy2urBqiHDRNY
         PGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791113282; x=1791718082;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhuCTwJXESFC7GXHK/sAbi8kSiySbX6q8d3D6uLo3NQ=;
        b=WkMDxza1EA7lFk5qDEw28TUduu0USz6HkHqGwu0PWXv5IKAvq756fiBqa83J4MSRrO
         XAbLn4nnjMAp0NMtLOduqfN4+hTbICTujYqs1iv1aVoEPjvMpT3Di76gf/rQo/+8I96F
         bSfhHpaH+gu6D+xcu0Kv+pUee0GA+/bSmb8/AziHSam7cPn6Ev1msKqvpj4cMM54lxee
         s1eX/XtujIjLrP0WNkKUxQi4UR4892mjQdbNYLzMkCCUM0cU5VvLV4ssJ4cnTQKPL8be
         UTSbRSJjOpg4hjxBo2tfOO51wyHVNJOrwTH+0lDxRfUQPgPoWAeir2halGXzmk/RnNh1
         e2XQ==
X-Forwarded-Encrypted: i=1; AKwUvByRdDYjZz2VuOTTngV4Q/xMrRXZ50XvevuF1Cw0wt9J1qFB7kk411Qv9nIDF1SLd0TbYvQgcDXvQyi3W3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kRQi8uXdgigQWdcdncxSNpHK2A5ftBdHqrs1AAEkqFr11ZIbgf
	CFqS/mEIO5Pk/kLI/53pda/1lourqimLGV4KCSrcd/jdKH1U/ANGVYkbn66lCxvn2gU=
X-Gm-Gg: AYBFou3gNX46BYrsRb37B6L3dpoxEtldpktevm2y2D1JPm/nBUwFLT+PBttwecc4PMU
	ZLKD4ZoX5/U75YJyMC7vFlnwF18HmJY+E1RSlb3q2OW0XNwoxyckGFtOFQLT28LWRGVWLYpX++k
	JH0OioWHMtAvBh0CNwTTf4RuxvIvL3VsMEKGffdGhb4dPqO4ZhHDD0c+UrlcBYV22/VMLfspACY
	jYAvnOov7Tf0pHJ0BCrVJ3gU3POQSem3oUBt4I2Qe1ekHPLPaKXEpI1iyVFZOVirZ4mlaUGnLPT
	G35NHg1/bqXqiN350Z/ISN+oXHwt5rrMNugeDTNkUUmEenrQUghRPJNPwC68/yNpOYwnfc5aEPg
	RNUmV0ARD164QOaKACbNAbski3MLqBHjdflprJzTLfUWvTIneryGU78xgh5eAlG5j7CE+LSRG0X
	i9jctYMgLzsGHvDhyj9hu/TX8dauvF/QfK3qfTavY5kRcLAp1Y/5dR+awtu9h34jReTvohrOyAl
	4Y/DsbRyn+krrYALAkjH0HH7FebxckLwtK2fuZJfOyUT0nO8nKoGDgQXDBPiwiWSrS6k30ynkpX
	XP1Fc8wdhxs2M4Qig7nlZGrHplOOzrZYodc9X0zR
X-Received: by 2002:a05:600c:8717:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a02867da4cmr125457755e9.30.1791113282016;
        Sun, 04 Oct 2026 04:28:02 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm129342815e9.14.2026.10.04.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:28:01 -0700 (PDT)
Message-ID: <0afab6a00aaa0bd7d9085a2573bd3133252a07c7.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: mediatek: jpeg: retry HW selection after
 successful wait
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, bin.liu@mediatek.com, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>,  Irui Wang <irui.wang@mediatek.com>, Kyrie Wu
 <kyrie.wu@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Sun, 04 Oct 2026 07:27:59 -0400
In-Reply-To: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
References: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-QpMlAF90W0tCNQZ2Cp7Y"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-QpMlAF90W0tCNQZ2Cp7Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 15 ao=C3=BBt 2026 =C3=A0 21:49 +0800, Pengpeng Hou a =C3=A9crit=
=C2=A0:
> wait_event_interruptible_timeout() returns a positive value when its
> condition becomes true before the timeout. mtk_jpegdec_worker() treats
> every nonzero result as a failure, so a normal decoder wakeup finishes
> the mem2mem job as though no hardware became available.
>=20
> Handle interrupted waits and exhausted timeout retries separately, and
> retry hardware selection after a successful wakeup. Increment the retry
> count only for actual timeouts. The encoder uses
> wait_event_interruptible(), whose successful return is zero, so its
> existing check is correct; leave that separate no-timeout policy
> unchanged.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Applied, ty.

> ---
> Changes since v2:
> https://lore.kernel.org/all/20260720115322.89784-1-pengpeng@iscas.ac.cn/
> - add the Fixes tag
> - revalidate the decoder-only change against current mainline
> - add the required coding-assistant attribution
>=20
> Changes since v1:
> https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
> - split interrupted waits, timeout exhaustion and successful wakeups
> - use distinct diagnostics and explain why the encoder path is unchanged
>=20
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..9634c95aaada 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1697,9 +1697,15 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
>  		ret =3D wait_event_interruptible_timeout(jpeg->hw_wq,
>  						       atomic_read(&jpeg->hw_rdy) > 0,
>  						       MTK_JPEG_HW_TIMEOUT_MSEC);
> -		if (ret !=3D 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
> -			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> -				__func__, __LINE__);
> +		if (ret < 0) {
> +			dev_err(jpeg->dev, "decoder HW wait interrupted: %d\n",
> +				ret);
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +			return;
> +		}
> +
> +		if (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME) {
> +			dev_err(jpeg->dev, "all decoder HW are busy\n");
>  			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  			return;
>  		}
>=20
> base-commit: dac3e89a2c90c2feeb471e1f22a2512ad424b792

--=-QpMlAF90W0tCNQZ2Cp7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasI4PwAKCRDZQZRRKWBy
9NuTAPiH0Pb4Hv6jCeaCxdy/4aZd8Z1R3IzPxbwVYpFmBA/lAQCWv/jVgYefRNok
CUnniqRpZ//vxqIPJzCA3jzERvecAQ==
=u5ij
-----END PGP SIGNATURE-----

--=-QpMlAF90W0tCNQZ2Cp7Y--

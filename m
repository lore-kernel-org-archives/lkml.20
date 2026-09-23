Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E374497B79
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195836; cv=none; b=N4UDIhzeNSeR66LRuposvNRDd6xg8Ic/PaSkNuleOZzc7syUEgOu6Q6X4M6A6oyEX/Id5+allt2oO5UIKcQevSFhvQJcXgkjbZAHjUcbeAjiAm14MOKmJIKBqN+elc41JLGx1IfdGQkqtn6oJptzJOqjIQLwyy+96hChLFu2pBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195836; c=relaxed/simple;
	bh=76OGawCGCzNjaY/PdRchvCHcK95PvzVL/gr2BwqRyZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNV3S2Gej7B9j2k7+GlTky9Ecq8JxLJbv0EztMae0UQ8kzBJwKHgoqfpiZlqa/qHUxqQOqey7zc8VHS4HNN6bV5dCf5KklVAfh6pLHiAaHQLZq6CCPuVvq6jt9OKr7PeFu0ncJoVBH9OWS22yYhGpZAH3hILqNdhMbl4zkfpQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=outQsVKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPV34L+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="outQsVKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPV34L+r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJlINv3513976
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bYaxrW6ifBz/Y6MOZDh+WJ5i
	wKja590ZzTUZuOtu2rE=; b=outQsVKIq8iTjcf4061tlqFfLV4bMUoou/vtbytB
	QSBJZ+aGBdy3BHUuQHR6/XZHFzekbmdTris/no3reM2I+WOGf/YotWmq1EumNYIX
	sFOSbTZ39aeKVpx7ZMJxbKD3jOtTmWC+qwred1/stvQndu5F3PpZ+DyFa5hfugfx
	CnV6Pboz5z2cEGNorrIeIGgb/k4bb8xqOpI0EY80S1kj7bxWJffjvT2IWBDiedlY
	laZbzyQLvJF/yYInahC1myskS1AKOrD09q9VoBNaZtiMoqmdGif0ygkGu7+nw/sf
	l6DlEgnlGgu8OwfyWTmBBGf1Cb9AUbLY6Mf9aE7Rn6T3sQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7jv0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:37:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790de8f0cecso410088137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790195833; x=1790800633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYaxrW6ifBz/Y6MOZDh+WJ5iwKja590ZzTUZuOtu2rE=;
        b=SPV34L+rR4Yi8WAcCYn9+NPf5bkxMZTO/EcqmWlRlLzs4wFB29QiWQ2iFq717SLEWj
         +8jZ/ZJiYyDkwyJXUJcCQzDxnoDC1Fgg2rSize87sXoqM1pWzRXmHLR/RbOgPqpw3l62
         WnpwFX19IxfILqFpgC/P+TEmtoQH3ozUPrcoeDTSZkXJcos4iJMyIqQMBb/gvQHCga76
         hVN8Zcb8oyLkOoCGUWNHg8GX5u3eQoESDj2vkyRbHwoI22wsYPgrH0wVUddzr+kSRktG
         ZLeE4C/gLG+vvUwzfkCuLwOLGEiRS+XspFLZsmn+NdNH7FWlhelpTJ9wXceC1LuZ+PDp
         7qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195833; x=1790800633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYaxrW6ifBz/Y6MOZDh+WJ5iwKja590ZzTUZuOtu2rE=;
        b=EAm3S2CO+lY/W1XtaZqM4qcH1FI1CYvo80mozR/fgBcxyST6EF1eoIE8B8MxYXkSsB
         G+ELI1mrWjP83qzH8SVBG5bPG6cZQlOuIY/G9wBB8XQ96pM/fPCxmjA+tNGH/IFH6th0
         eW4CqQqIRyYu93CcVmXtTdN3cfc+t6RJrmkxeE0CoXOAeUnzyxL6AmmaguHGLYnVvrUf
         CMeYgVzi5MRKCkGIDpSwzHUDLXSARAgOqEoa+hvzcVsFkNtz1F8Nf+xYK9daKZCDl2jQ
         4IlXKZT8F0HjmSRVUFldw7b4su5TtsZV+LKJn9cL5AYo6Dt+8FjL2bISZU/l8w4nJbil
         3aCQ==
X-Forwarded-Encrypted: i=1; AKwUvBywe+S+3l0BuLLeS7VE/ku5R1g1HODLxUZCpU9R2jQ6/yI11NuwMXIY8nUl86vTYeoFuePK+Jhdd8ex3QQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lAKIDKCRAGkjuR3UjVS5XwSdr5WgSONppvF8fRm3gTWiul+jrs
	e1DiQjpEacDcyQMz5k82cioSBTASY16FKkSVpeelY+mMMOEg4AYvshhbmy9Gyo2WohudmcgTZHJ
	id+ZLGLXvNv1NvZvaCG+Hz3uEG1lybf2oSC/9Z1n+OgHSheSGfhlqLtgAX0uWckSfCY37CDkbZG
	0=
X-Gm-Gg: AYBFou1wWTMIZqWOmbOyVcVmgp3fEVI3WnSNXyId/JI2eBVcTdoiUrNWHLWntD5abgO
	DN/Q5w2rMst1j8t12eQUw5X18xgISLsNb8fVxWBtiZQ1XKu+vXNowJZQtBCsLC12EOUfX1Y1n2l
	J7+wxG0a3gVurOHThUlamurE3m48rbHa/gJPBq7g8eDHQ7ye3c+zJz2t5fbkAd4RDBrSHUDbLil
	/4AVozs2Z0k4ygM7xt5qA9lgzBIuCS5RJl9eBqzOOUKLevgsgnW8YQ4pv9wCMgj6jZzCV4TE86k
	+EWTi+GSlbMj1+JIfecNXuJIPJAnSuUkZ/iViJlB7uRP+yylwPyGqWnSnHf+my9RvUqXP0iDUUK
	IE4uboM5lHhjtAQWLTWBJhRuS
X-Received: by 2002:a05:6102:3fa3:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7af1ce99caamr335948137.9.1790195832617;
        Wed, 23 Sep 2026 13:37:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa3:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7af1ce99caamr335926137.9.1790195832110;
        Wed, 23 Sep 2026 13:37:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4cc01sm35186275e9.3.2026.09.23.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:37:10 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:37:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        sashiko-bot@kernel.org
Subject: Re: [PATCH] net: stmmac: guard FCS stripping against runt frames
Message-ID: <arQ4dVkI9llhXCDx@lore-desk>
References: <20260923162339.1375698-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PJAgeMB1n6WnILQU"
Content-Disposition: inline
In-Reply-To: <20260923162339.1375698-1-qwe.aldo@gmail.com>
X-Proofpoint-ORIG-GUID: z58d9C8uUqn_I5rGUisSqTUfDz4fKTyh
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab43879 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZCkw8b18SyrqGgSs42gA:9 a=CjuIK1q_8ugA:10
 a=0CZsOOD427REJE_1_m8A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MiBTYWx0ZWRfX7IRCqWuQgJY8
 beaQ04fst0WMjQ+LSogrUkN3C3MinI+QmZsOMrPaejk/qjgTdOwLQe41Nd8obvGrfOE2d6SGN2G
 ypE++DZIdLlfu/X/1R6djwe91UoRn8aZqSO+uKMhyq+7ceu8vRUG8ak4m5RJolVBv3RMmk8RLDu
 ogUAwcidYXdQV9KId/xCmRJAiq+SkE2n9xNZGxrmZPIC9kkkAmuULx+nRpd6oyjFCPJ68YstUPB
 7m85APEAsjTpRGIpHz0JECdS2JziG1iQ1/8ZQ9OuIM1yWD9SGk2tJuUi2otnZ3DWUCaMfAmr5Wy
 lqigpeE2d183OOVq0M+hbK/NhOfgYHBH7mgS6PHQB/IOp+S5CWxb61qZyho8/vAAe3hZo8i6n5X
 MpHh11p2icNGzH00cElHeZTMXeQGORJEs4BttFX8yq0GbdsophGxmJ/9PTav8sPqQUkivDvqOWg
 oFMk3xW+b8qqlGHLHfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MiBTYWx0ZWRfX4X/2BrWDmtTu
 w0yERetLmViHyVWmnK5+9ZUxv5zUjmH5ExBizthmobGcKRgknlHQ5Nkj9cS7PufOCWNCsTxJRdz
 2g9STFaomqAgY1yybTTNgb6YN9SauFs=
X-Proofpoint-GUID: z58d9C8uUqn_I5rGUisSqTUfDz4fKTyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230082

--PJAgeMB1n6WnILQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> stmmac_rx_zc() and stmmac_rx() strip the 4-byte FCS from the last
> buffer when ACS (Automatic Checksum Stripping) is disabled:
>=20
>     buf1_len -=3D ETH_FCS_LEN;
>     len -=3D ETH_FCS_LEN;
>=20
> Neither path checks that the buffer actually contains at least
> ETH_FCS_LEN bytes. A runt frame delivered by the hardware with a
> buf1_len or buf2_len smaller than 4 underflows the unsigned
> subtraction, producing a very large value. In the XDP zero-copy path
> this wraps data_end backwards:
>=20
>     buf->xdp->data_end =3D buf->xdp->data + buf1_len;
>=20
> giving the XDP/BPF program an enormous data region that extends into
> adjacent kernel memory.
>=20
> Add the missing lower-bound checks so that undersized frames are
> silently passed through without stripping.
>=20
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f80..4526669 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5636,7 +5636,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, i=
nt limit, u32 queue)
>  		len +=3D buf1_len;
> =20
>  		/* ACS is disabled; strip manually. */
> -		if (likely(!(status & rx_not_ls))) {
> +		if (likely(!(status & rx_not_ls)) &&
> +		    likely(buf1_len >=3D ETH_FCS_LEN)) {
>  			buf1_len -=3D ETH_FCS_LEN;
>  			len -=3D ETH_FCS_LEN;
>  		}
> @@ -5808,10 +5809,10 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> =20
>  		/* ACS is disabled; strip manually. */
>  		if (likely(!(status & rx_not_ls))) {
> -			if (buf2_len) {
> +			if (buf2_len >=3D ETH_FCS_LEN) {

I do not think this approach is correct since, at least theoretically, the =
FCS can be
splitted between buf1 and buf2.

Please note the non-XDP case is already fixed in the following patch:
https://lore.kernel.org/netdev/20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@=
oss.qualcomm.com/

The XDP-case will be properly handled introducing XDP multi-buff support (I
have already posted v1 and I need to respin the v2).

Regards,
Lorenzo

>  				buf2_len -=3D ETH_FCS_LEN;
>  				len -=3D ETH_FCS_LEN;
> -			} else if (buf1_len) {
> +			} else if (buf1_len >=3D ETH_FCS_LEN) {
>  				buf1_len -=3D ETH_FCS_LEN;
>  				len -=3D ETH_FCS_LEN;
>  			}
> --=20
> 2.43.0
>=20

--PJAgeMB1n6WnILQU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarQ4dQAKCRA6cBh0uS2t
rM+VAQC4Rn9dY3tiTR2/fmt3OlWG2jSxFCFwvWYvYTdp3KNgsQD+Pdw4h9iISL6z
hmCcBLNChmc5hA0SPtVBy0D50l9sWAE=
=dhiC
-----END PGP SIGNATURE-----

--PJAgeMB1n6WnILQU--

Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABE4B1B56
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658244; cv=none; b=GKYncFMRE3Zqx9v2/obUGYl8Cmg2e1wPmzRDf0Evd1ixSbYHfRVfWXFOiDGFB6YtZosc9qeikMqXdwug62i7//kzCQAn/Ahg6eoFMrsvsd+HB6AJm5/L7nJscvH9/ZVBjQUYkPiIL+Y1T/P5PcNmoxvGCs8vvnJmd12oHEMg/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658244; c=relaxed/simple;
	bh=+DpowwWUzElzCL/0v1vsGuDgjoOiYBAkmXuXHCLjLnw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LsTc/AkUKpVPGM5h9XGSL+ADF/PeXVxi1L9x9H24o2w3km58Yjl8kBHSiLdGcJMbOQXc+j74xAGAjwCswO+cSQXelcq/6CIt1lI+CVqA76cYap5w1TDhZUxmsBia6qXZdr0ZcAusEmH4X5lb6h23tnMiGYIb4EQSSdmokc+2/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MKPo6JIe; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MKPo6JIe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+DpowwWUzElzCL/0v1vsGuDgjoOiYBAkmXuXHCLjLnw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791658239; v=1; x=1792263039;
 b=MKPo6JIerwzpiJDMsZU66wkKMKYB41VW8fxTaMshJ8Gg2Ptp2a3N9URYCoQ54WHFYZ/p0rO4
 CDNW3NJk/p+dzy2vHAt3G5J0dUWaCQJ3Fn08ulTYNqMHdrjuqulDpR0EhH5K5wsNztQbvD+NbjL
 X3JI2kyOVEcXVZjz7tcNUgTY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 634365af05cf6c2d;
	Sat, 10 Oct 2026 18:50:20 +0000
X-Mizu-Trace-ID: 634365af05cf6c2d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 18:50:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <08bc0316b09cb28d4f660af89d249a222ce4be6f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] wifi: rtw88: 8703b: avoid converting RX SNR twice
To: "Hungyu Lin" <dennylin0707@gmail.com>, pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 fiona.klute@gmx.de, kvalo@kernel.org, "Hungyu Lin"
 <dennylin0707@gmail.com>
In-Reply-To: <20261010183629.39748-1-dennylin0707@gmail.com>
References: <20261010183629.39748-1-dennylin0707@gmail.com>

October 10, 2026 at 8:36 PM, "Hungyu Lin" <dennylin0707@gmail.com mailto:=
dennylin0707@gmail.com?to=3D%22Hungyu%20Lin%22%20%3Cdennylin0707%40gmail.=
com%3E > wrote:


>=20
>=20query_phy_status_ofdm() divides the SNR report by two when filling
> pkt_stat->rx_snr, then shifts it again when updating dm_info->rx_snr.
> This halves the SNR used for diagnostics and average statistics.
>=20
>=20Store the raw report in pkt_stat->rx_snr and convert it only when
> updating dm_info->rx_snr, as the other chip drivers do.
>=20
>=20Fixes: 61a486bcd782 ("wifi: rtw88: Add rtw8703b.c")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtw88/rtw8703b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20diff --git a/drivers/net/wireless/realtek/rtw88/rtw8703b.c b/drivers/=
net/wireless/realtek/rtw88/rtw8703b.c
> index 25456f0367b2..1920277d626f 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8703b.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8703b.c
> @@ -959,7 +959,7 @@ static void query_phy_status_ofdm(struct rtw_dev *r=
twdev, u8 *phy_raw,
>  val_s8 =3D phy_status->path_agc[RF_PATH_A].gain & 0x3F;
>  pkt_stat->rx_power[RF_PATH_A] =3D (val_s8 * 2) - 110;
>  pkt_stat->rssi =3D rtw_phy_rf_power_2_rssi(pkt_stat->rx_power, 1);
> - pkt_stat->rx_snr[RF_PATH_A] =3D (s8)(phy_status->path_rxsnr[RF_PATH_A=
] / 2);
> + pkt_stat->rx_snr[RF_PATH_A] =3D phy_status->path_rxsnr[RF_PATH_A];
>=20=20
>=20 /* signal power reported by HW */
>  val_s8 =3D phy_status->cck_sig_qual_ofdm_pwdb_all >> 1;
>

Looking good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak

Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF4381EBE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658137; cv=none; b=gS1iZ40KFxvYGmH5ihyoD834jiFZ039l1rtMZboqGmWsTYSa5yEjFm2N0gCsw2kufHlXMSDEArm0wwp/CmO6zWzZ1ZYTiZ/WtVwL3C6dJAlXA4WjodvZT2Z4yeRmLaF7AV8UQ13YyYX1YMuaDooPOVHJsR+olTddeNQVt8yQ2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658137; c=relaxed/simple;
	bh=U0dopAs69xHQqgOrY6Emxx2h+FZ3ms4LhCEilaMZsP4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=CNnvqX8BUTjmyetoU7YSA5ydeh7sLr+WTMhzJAEooH6h6g+sGN/SlqTEs7tMGQbRPtE//yI+J4Bp0R4q3J3ZFWrXKCykyA4qeXu2jF7iNiOL1zrb2vxg/m7zdiQ8OahnSMbuEevVfnji8e+Qoz2qsm5h1odKsWdFGWcR7zkEUaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oDue9n5h; arc=none smtp.client-ip=95.215.58.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oDue9n5h"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U0dopAs69xHQqgOrY6Emxx2h+FZ3ms4LhCEilaMZsP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791658131; v=1; x=1792262931;
 b=oDue9n5ht0P6yEvS5NeFUo6hXxFq+6XyVjf4LDXT+FATBp7EmHnW8R985xTsa2My15M62GW/
 3VQ1iwdK6at6ZttnnFxv9Vk9lDdIZMkx0mH9BQu6QoI/oRiT8SL0G5uVkxGNg19wgzZqZAnLZRp
 wZpTjbZ1WgTo2VuG/01reAbE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b066eff0b9a08555;
	Sat, 10 Oct 2026 18:48:51 +0000
X-Mizu-Trace-ID: b066eff0b9a08555
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 18:48:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <c6cefedd4c0c92dd3530d6f585e021ceca5d354f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] wifi: rtw88: 8703b: avoid converting RX SNR twice
To: "Hungyu Lin" <dennylin0707@gmail.com>, pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 fiona.klute@gmx.de, kvalo@kernel.org, "Hungyu Lin"
 <dennylin0707@gmail.com>
In-Reply-To: <20261010183629.39748-1-dennylin0707@gmail.com>
References: <20261010183629.39748-1-dennylin0707@gmail.com>

October 10, 2026 at 8:36 PM, "Hungyu Lin" <dennylin0707@gmail.com> wrote:


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

Mind explaining why did you resend this?

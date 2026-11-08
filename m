Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111210;
	b=Y360ubbgK0fL4nfOz6O+G0nTG1bX78V+HC7L7amBRZPWzJk/d5xR/lsLcvo1wOvOXIKT
	 uclFTCa12TZPW9EEg6HZ1qcNs8f0lcWW6PLZdcK6ZwIzrFvbLSRDFDzevJ9GGBlfxiu1E
	 d8cDlBSSlnSWZMOjDZ+v/Hk6gcE1eQ9B53C0jF83UxSTa77qxtqRM8OEFRA06z5SFpgCF
	 tnANAVEC4smi+p2zMsCvD0Hk5wgZmdXCxhmq7+zI3kph56j5wUqiTK+eWyJB4jm0YeMT+
	 5HIKp/RrHnceZ/77pphEQaNDV5FZEWDB7/T6Ir9ER+DZCMDyk092es6tK7I5r3tjxyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111210;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=3GVOCM+ftXRiiTO2ujMkvOUFx/NHxomZ7cHaZKQAqjg=;
	b=qm52pt6OK2QAfBmcl1FN2gk6aT7d8ELw7GRzXzVMpQ/kwYjejtMi3tgrCSbZV41qMNv6
	 d+mlTGYnvl/6pNWmN9AiKfuCxOe2AUOAniRreX692HSFsKvII3Osqxix4OH8nmCLLeZwL
	 QtuatFssm6wJZfiw9S376mib30z9CJCq//GvzOfQCR05e4nuOH+alcbdeacE37FFfm77S
	 Ha38xdzoFKZl/j+E/ZarrDX81Z2EXwVHnDwybA6n44wC0edUI1LVechePqtl53R29KZmm
	 rXFdPRM+A4XYyHuujXb6OSxiihRCGvP85w6owI0WzA6MF6SFFj3RHnf7qJo8nMxA44w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZFpX2g+5;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEF0606A31A;
	Sun,  8 Nov 2026 04:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZFpX2g+5
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A84DNGM03149109, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794111204; bh=3GVOCM+ftXRiiTO2ujMkvOUFx/NHxomZ7cHaZKQAqjg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ZFpX2g+5srDls9H36qCYS0ZhuRGJE3k2dk+IS/TGqtWqDnFGaQKZ+xP2lkmlMtiUB
	 Pada8c/c94ucOhR5faQnFP/pSR8+fJZufxi3JTQacR3xPstMirx8YvvOdwG5cRqCa/
	 SbLWhsEN9d1SKOFeALo4lb8OxaBHSzQKa8Un12M9QeKwThhw7ywv+wKAdaHZFgGSpL
	 nNthTBS5fWUP6W2NjmHXcJBXhQfntY13T2K4L09se6WztpaY7bjzNaNgo2A0oXm1YV
	 5fXECgg+g0703XSxkOFOU3qh09CDz5iSTYQTlRjiHpQZaXbgkbltS3E2MCHdnWbXSd
	 3rzZVnVCSsvDQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A84DNGM03149109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 12:13:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 12:13:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 12:13:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
Thread-Topic: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
Thread-Index: AQHda3lJdalEcwjiU0OtTtWG7HGUobcjlzEw
Date: Sun, 8 Nov 2026 04:13:24 +0000
Message-ID: <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-3-hjf3108@gmail.com>
In-Reply-To: <20261103095256.949327-3-hjf3108@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Ho Jie Feng <hjf3108@gmail.com> wrote:
> Only the first frame of an A-MPDU comes with the PHY status.
> This makes mac80211 report the correct value when queried from iw.
>=20
> Test results (2.4 GHz):
>    before after
> TX 6.1    5.2
> RX 29.1   27.1

How does improper RX_FLAG_NO_SIGNAL_VAL affect throughput?=20

>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> index 9f9a34492030c6..a8910cdbfa0979 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> @@ -425,6 +425,9 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, st=
ruct rtl_stats *stats,
>                                                      stats->rx_bufshift);
>                 _rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
>                                                   p_drvinfo);
> +       } else {
> +               /* Only the first frame of an A-MPDU has the PHY status. =
*/

It is clear that this branch is !phystatus, so no need comment.=20

> +               rx_status->flag |=3D RX_FLAG_NO_SIGNAL_VAL;
>         }
>         /*rx_status->qual =3D stats->signal; */
>         rx_status->signal =3D stats->recvsignalpower + 10;
> --
> 2.53.0


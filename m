Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794713934;
	b=KW/v8XseMxWgJOnLuC5D7VsDGURvq1dwdQnY0aKSJedIMY81H097k/d3Ue4AvDLD9/xo
	 rkxRTsSQ9S7sUf1HjtEuqMsKGm3rDkZoEKeiFclzwkykM+cZLWgQ1xKpkM2/eTn9XYXQh
	 RrdUKQZR3lWMXtdmrGUGA1Iv84qriAICSV6WQSwQ9X0cKvv1hUttWUhfvQSrWqOWMccIN
	 kilupn5MVPpBwLdaRlIM1wFlU+xA/e0dMQIG+blaAkZhnCDA/xKwLFGL3XrHAQK30w8Uq
	 mIbe5AVXDFJbPazbuwmp3GgJOjLrhDM4D0qQ0cuizg6/ITfNevuRemLh9Gsj9AMsLpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713934;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=uk5lzCLDi3H6OTW1SSMZSRJZN5jAhPDao+5nLQ3/Wn8=;
	b=psnH/XriyvmiN5BMeNau/s55lKNX1fp77SjRCvXoTAqMPo+ZZAq68Sda3ady3HrwGIoC
	 /PTFMdnyBLcYArvboLSUkAFSfOJP+zKvDY1QT8F3zDlhOlNoxZJ7pF9JMvMIflIb+QxV7
	 rem+VH/StZNPHSQQzA6UMfvsnUEPKiKeTTs0jUKLcXhpMkKggM9JyM4ZJmbIWVRtaiP9W
	 PG7fJpPibqKA+F67IGXESyYwYBHqgmJLMe7ds+cxLJ6lWUo6lSuTRgcnHyZ082ml7Abx5
	 SvFP3wS51ThoTunVdhj6VfqFN41K+e0EMLyRqzRYERK5l6wCdOdwYBtqUeJUEuEuROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="ICLVsd/s";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D262606A327;
	Sun, 15 Nov 2026 03:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D262606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ICLVsd/s
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF3cjEA32152940, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794713925; bh=uk5lzCLDi3H6OTW1SSMZSRJZN5jAhPDao+5nLQ3/Wn8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ICLVsd/stKEXCQHv5iNsrW70eSSvhXy5nH+dRFWMRsyd65KE89leFKI2P+BFyTaZx
	 hpdzFaea1Z8K3yHuhS7Xeq1gzo7kA/UpeqWJSO7N09F0A4IxwOvvxUrTVwj6AUTK+/
	 jEVV3Jm3NE3n7kuLxT8vPtPHrb1va7z+HhUiOMUTXMvwQyfCn0RVcCVdaIwkXW4uux
	 DhBNW5SPDf1zipyYS7tpMOjocBIqWM9h4wJfUbkgVTXH6RWiFtChdbzIjZt0U1Ba13
	 UMcDRR3MeaIGvLV9BtfdQ/Z7UQMh6Ari/9nDzWDu+B8w01L7D4ANsVNW5w64G61Md5
	 J1zTFdO/C0abg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF3cjEA32152940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 11:38:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:38:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:38:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 11:38:45 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 02/10] wifi: rtw89: handle negative rate index
 for injected frames
Thread-Topic: [PATCH rtw-next v5 02/10] wifi: rtw89: handle negative rate
 index for injected frames
Thread-Index: AQHdc8o8ufzHhPN8dkKa3qV8PVPRnbcufA/A
Date: Sun, 15 Nov 2026 03:38:45 +0000
Message-ID: <5360bf7242ef43c995f09d161486a330@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-3-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-3-owner@ph4ntom-rev.uz>
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

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> When the radiotap header of an injected frame carries no rate,
> info->control.rates[0].idx is -1.

> rtw89_core_tx_update_injection()
> stores the index in a u8, so the value becomes 0xff and is added to
> the CCK1/OFDM6 base, programming an invalid hardware rate into the TX
> descriptor.

I don't prefer to describe function name in commit message. Just
describe the problem you encountered and how to fix it.

For this patch, you want to handle the rate idx < 0 case, and solution
is set rate to 1M and 6M for 2GHz band and others respectively, right?

I guess LLM help to generate this. Code flow is not important to
commit message. The patch should explain the flow itself.

>=20
> Use a signed index. If it is negative, keep the rate already selected
> by rtw89_core_tx_update_mgmt_info() for management frames, and fall
> back to data_retry_lowest_rate (or OFDM6 when
> IEEE80211_TX_CTL_NO_CCK_RATE is set) for data frames.
>=20
> Fixes: e96abe4fd7cd ("wifi: rtw89: consider data rate/bandwidth/GI for in=
jected packets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index b7df97e..527593e 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -1239,12 +1239,25 @@ static void rtw89_core_tx_update_injection(struct=
 rtw89_dev *rtwdev,
>         enum mac80211_rate_control_flags flags =3D info->control.rates[0]=
.flags;
>         struct rtw89_tx_desc_info *desc_info =3D &tx_req->desc_info;
>         const struct rtw89_chan *chan;
> -       u8 idx =3D info->control.rates[0].idx;
> +       s8 idx =3D info->control.rates[0].idx;
>         u8 nss, mcs;
>=20
>         desc_info->use_rate =3D true;
>         desc_info->dis_data_fb =3D true;
>=20
> +       /* No rate was given in the radiotap header. Management frames
> +        * already carry the rate from rtw89_core_tx_update_mgmt_info(), =
so
> +        * only data frames need a fallback.
> +        */
> +       if (idx < 0) {
> +               if (tx_req->tx_type =3D=3D RTW89_CORE_TX_TYPE_DATA)
> +                       desc_info->data_rate =3D
> +                               info->flags & IEEE80211_TX_CTL_NO_CCK_RAT=
E ?
> +                               RTW89_HW_RATE_OFDM6 :
> +                               desc_info->data_retry_lowest_rate;
> +               return;
> +       }
> +

How about just set idx =3D 0 if idx < 0? The existing code can select valid=
 rate,
since any rate is well for the case idx < 0.

>         if (flags & IEEE80211_TX_RC_160_MHZ_WIDTH)
>                 desc_info->data_bw =3D 3;
>         else if (flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
> --
> 2.56.0.windows.4
>=20


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880286;
	b=HNQTYESOHdWQHXNfRsvqKFl0puyDik34m7LRjzkUV9Ydi+5b82LIjRQ2fVFPTXdorZTE
	 zxLtU3V6J1oyMwyTDh7AhHRiufhJbllZ1crTTipMzODW6SBDa981ac3o0r5t/At8i0mer
	 BB+2sWRL0hG9vjSOXNp7YTYnLFgo/ytYhkckMH1vA2aqs4Ej+u/viallWGQAfApZlUx/7
	 YpdDB6O6ZRuP15ii0+bU9FB6+WQ+0JRwJBQdRrdMqFDDDmPXFi5OmSOZuspa+6Z/4r0Op
	 spQt0SIXIu4eIlBjn14QiHQL7FeKv4+XY5fMqDJRhPFGeQoXzTUD0fVxyAD1FhT88Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880286;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=B/vLT+6daParNl8PihlKbTSDfRPjuN/fXdkYXtYR128=;
	b=tX12GF65b4aAvueEdXUz+gUSWtvXYPZO6BxIwZyvVCYDtN2a776POwBM/tv5V1abLA5u
	 +jmrktBzXFQnc5kxqUchvK7Pn+B+EndP1yeuMfAOqNYB1Zl9+Sv8iESqg5cprxulYOx8i
	 XA2pqsB0Dj+TM394udaJxxwo65YkWSm53TT8On+FudMn4KcKJfTNwLyM49CgkmOfaKTzl
	 gSg/ktqZUl69OEHJAZlwJpcHFqZPQk8Ys5yvoHqCNwXHDq5vfr2s8aQ07JNtMdgL9ksKm
	 3I7k4PuerN/2igugCmtq8bjEAW0/VIjmBABSNEQIIqcW3j+RWmpMGtxCm5YqFDbxGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=q7nNpyGg;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B0606A329;
	Tue, 17 Nov 2026 01:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99B0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=q7nNpyGg
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH1pLezD3954129, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794880281; bh=B/vLT+6daParNl8PihlKbTSDfRPjuN/fXdkYXtYR128=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=q7nNpyGg1BoIaV5KYfqltIFC0HLCdM3TNaUx13N/XPeARzqCnJYbk4J2o56lS8/7c
	 9piv3w+4eA01DDsW7GQQWh8HzthrK5Ay5j/ljsdDZdgX674ZGP9saOag8bvlgI0YEF
	 Ed+DFBleIb2yi9iCNmDiDMmVXvy629CTvh6naiO0aTwJl9McGQAMeI3C6JC6w+Zh7N
	 BR0Oh3WzyubaUV8jtBVL6yg5HUQuzpmC1Gr+HnKQGd5F5qY572BZ/C+nMxJe2BgXzL
	 BTzRaKd70pOANk87LuOY/qfpGSawaT7wjL/H2j3k3IymT0pErUhKFk6sSx5HZWnF2c
	 d37qpcMeqfuIA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH1pLezD3954129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 09:51:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:51:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:51:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 09:51:21 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 4/5] wifi: rtlwifi: usb: move the radiotap
 headroom size to usb.h
Thread-Topic: [PATCH rtw-next v2 4/5] wifi: rtlwifi: usb: move the radiotap
 headroom size to usb.h
Thread-Index: AQHdcOnJLssSHEau1UaWlbaDfqMSbLcxiaXQ
Date: Tue, 17 Nov 2026 01:51:21 +0000
Message-ID: <ca7a2c3c220c4d2eb1e4f57fe66450ba@realtek.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
 <20261110080143.1362021-5-hjf3108@gmail.com>
In-Reply-To: <20261110080143.1362021-5-hjf3108@gmail.com>
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
> Let drivers use the same define to add headroom for the frames
> split out of aggregated transfers.
>=20
> Move __RADIO_TAP_SIZE_RSV to usb.h as RTL_RADIO_TAP_SIZE_RSV
> so chip specific code can use it.
>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Carry my Acked-by to v3 with a nit below.

[...]

> diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.h
> b/drivers/net/wireless/realtek/rtlwifi/usb.h
> index b873bbc9c4..329b734ca1 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/usb.h
> +++ b/drivers/net/wireless/realtek/rtlwifi/usb.h
> @@ -7,6 +7,7 @@
>  #include <linux/skbuff.h>
>=20
>  #define RTL_RX_DESC_SIZE               24
> +#define RTL_RADIO_TAP_SIZE_RSV 32

nit: prefer to align the column of number.=20
Though I'm not fan of <tabs + space> alignment, it is there already.
Just let it look comfortable.=20

>=20
>  #define RTL_USB_DEVICE(vend, prod, cfg) \
>         .match_flags =3D USB_DEVICE_ID_MATCH_DEVICE, \
> --
> 2.53.0


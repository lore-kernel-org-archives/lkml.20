Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985669;
	b=Bg3y4Md8Qjesy5N7vKFUUnTlrA/uWIiG5dlvTk2EKI5iBtVZe59suvybluELWu0qcjS8
	 3ZpVsRrA02r+tVXK6vy7GUw5UvPxpgtair6aICacyq6lbISsIDkH7Xz9SD7Qgk1qt+Hiz
	 24GwQ6SgGjMpIPbvq+sSLA0cg52DdUNnxhHi/9+GnHKDEwVHmpKDkDrFYca/yMKhMkpjW
	 OJUN/SIUZjsksIs1+6SeQD9Uy+Xwc3vLRzQS1MU3SpMvaLcgewuoknGTEto/jLot0x9BB
	 N28pTOUgEriFAKv+oYMoatNbEsubnZHSDX7hAI51idcdxP3DLIpmtovAUrlsp5OTL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=2uciuXx9t93tvdC10P6QxeWs86V1VIdY0xyTA3KoNZI=;
	b=HZ1L0yBzQ+88eGKJAKP/Hvk4wOE0U0jAnEJV1aPPhnGQgJR5257se/7Clpo6sI/favmh
	 R8JH2SXmERCazSjxuWDy9zEKqTho5//o0ODzhcVKEuF3/LKcbrbZmkw2tlVj1lMBdzZGq
	 p3HatwwEf15CVJ5z+TW42tcxgS9F8WxDrHPFPdGawEQKnKpaJJyo0QZoacJFUEvV/Vuta
	 W6ghmGQUaMSJCkTYVtuxX7gPZAu7D1qc/WMDxW0ykNhtBfHxzkxnvUh3ChbPKA1FZhsRX
	 F54TOStDXNCuk2iJhiSPlnF3o7StfJ3wG95QZPJb31uJovk19rakV6tqc6MZ3dBdYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uEe4r4FH;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84379606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84379606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uEe4r4FH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U3KtjihvMw59KAoKlK0ibdUtLPoIyLmaO5dhG0+0RAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793985665; v=1; x=1794590465;
 b=uEe4r4FHE52+wuzICxpa3ub/8iFjzr9BuBBXEDInYG8xZTqpraqiumOnq/g/f0xdiQuKVrMb
 6ONl7E3zlHqoWLTBK5vaLjxYxErySew5ImJbb1enFj33nqX2YbcdhH6R9KPp8Eljh2WkIK0hulX
 DilAHMf91qKAQ+JboCiCnUlw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0e5d4def3728738;
	Fri, 06 Nov 2026 17:21:05 +0000
X-Mizu-Trace-ID: c0e5d4def3728738
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:21:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <c057826a90d64c801fd36ceabba48a504d784274@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 1/7] wifi: rtw88: 8812a, 8814a: enable STBC
 for HT transmissions
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-2-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-2-hjf3108@gmail.com>

Hi Jie Feng,

One comment below.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wi=
reless/realtek/rtw88/main.c
> index 0f23498b5c96e406581c06a524e9f270873866ae..f7d7b66844862ff01533b8b=
640ed35738169673d 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -1585,7 +1585,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwde=
v,
>
>       if (rtw_chip_has_rx_ldpc(rtwdev))
>               ht_cap->cap |=3D IEEE80211_HT_CAP_LDPC_CODING;
> -     if (rtw_chip_has_tx_stbc(rtwdev))
> +     if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
>               ht_cap->cap |=3D IEEE80211_HT_CAP_TX_STBC;

This also changes 8822c, which already had tx_stbc set. When its hw
feature report says one antenna, rtw_hw_config_rf_ant_num() sets
rf_path_num to 1 and it stops advertising HT TX STBC. That looks right
to me, the VHT side already checks rf_path_num the same way, but it
would be good to mention it in the commit message.

Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018618;
	b=B6Uop3GP7GGG6otdDU5rIdAXaPlOviv1KHRExCOiGqHuxsOUwmMhetn2yttlM4/mZiQg
	 OcIOAIyTS2tGgilGEhqBb7xAZpQbLCter1Ebpl5Okri5q14za9f6G5LkDIH844ohUKNlP
	 OuaEx7m+JVbSMqNTx8qioo4xz2CziiPaHulbQ/ZFJMUOAJfC64OlBWFSTsj3NWDjYWHtJ
	 55d1qyvPhj0T+YxMmulaBRKBuDHQzB6U1qOxQIcjtm6Mz0HB7zHNgpJJtD37dMCLWJjde
	 z81CaDt7TFOVK+x0LW2MmyHPuBQezrSOfH1GWgJUeNeWD0Ssd0r6cgZpuiJvrlFGBUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018618;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=x98ue6edYcJSRLvXIUfs73a6xLz9MbtvdfK+VXF01fw=;
	b=BqhJ8hO52LVvPqpcP8GA+pFk+FBk8kQVmmcAX0b/guhasnDV1XQbdk4bv2+Busb+YLMa
	 N3ALPkkUbACHXVaLajL9pimVjtBNxaf+NZruozrS2WCNaBgf30Up/jiO4Z2nVaaeml625
	 9j4SI9gVbAvj6V0BGhHR1UDOst87tPlKpYt2+UgJcX5QX3fPZ6AFDr7rxdTeOUioDBARW
	 VI4zt+1xmL8Wtcvu5sdq/dDASYpBUSgmR/S4/MYxA8qnnci44UdAPVDupcnuMDxIgeykY
	 Q1ApdjTP9eNJiV4m3UPboXM4FQi9JqKUwIsZzgF5hjtUE6VCDdchd6XmEqwVM/DView==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NazLLNnL;
	arc=none smtp.remote-ip=95.215.58.118
Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685AB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NazLLNnL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nzH/f4GJg9wr8FRWhRIYnnTP3YVJewQQsdvAvpslUiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793018614; v=1; x=1793623414;
 b=NazLLNnLwbBMGC2WbW/8HmE4Wn+9br1Pdx2NkiYKwQg418koQP4WHpRgWXgflUXbJLLZTg4l
 6mjNYsx6mdupmGj7lq3p1/L6uMtOg6Q32T6yi3EBUIKHcBmKE9pnZMJKzvwX3mKDw2TqF9j5UGl
 Kd528nDgqAoD51zxcN6FdhNQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ecc5c76a2f6b2875;
	Mon, 26 Oct 2026 12:43:34 +0000
X-Mizu-Trace-ID: ecc5c76a2f6b2875
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
Date: Mon, 26 Oct 2026 12:43:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <c8bc5affa75d7519b424ea98c07c1d6b65942347@linux.dev>
TLS-Required: No
Subject: Re: [PATCH wireless] wifi: mac80211: abort chanswitch when leaving
 an IBSS
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Johannes Berg"
 <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261025193615.1123718-1-mehmet.fide@gmail.com>
References: <20261025193615.1123718-1-mehmet.fide@gmail.com>

Hi Mehmet,

Thanks for picking this up. One comment below.

October 25, 2026 at 8:36 PM, "Mehmet Fide" <mehmet.fide@gmail.com> wrote:

> diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
> index d74b66426349..b9ab4ceb0332 100644
> --- a/net/mac80211/ibss.c
> +++ b/net/mac80211/ibss.c
> @@ -669,6 +669,10 @@ static void ieee80211_ibss_disconnect(struct ieee8=
0211_sub_if_data *sdata)
>       ifibss->state =3D IEEE80211_IBSS_MLME_SEARCH;
>
>       netif_carrier_off(sdata->dev);
> +
> +     sdata->vif.bss_conf.csa_active =3D false;
> +     ieee80211_vif_unblock_queues_csa(sdata);
> +

As far as I can see, the driver never finds out that the switch was
dropped here. ath9k_htc only clears priv->csa_vif once the countdown
completes with csa_active still set, or when the interface goes away.

So if I read it right, after leaving mid countdown and joining again, the
next switch with a countdown now gets past mac80211 and runs into this in
ath9k_htc_channel_switch_beacon():

        if (WARN_ON(priv->csa_vif))
                return;

Before this patch mac80211 stopped it earlier, so this couldn't happen in
IBSS. AP mode seems to have the same problem already after
ieee80211_stop_ap(), so I think it is better fixed in ath9k_htc, maybe by
dropping csa_vif when beaconing stops.

Since you have worked on ath9k already, would you be willing to send a
fix for that too?

Best regards,
Luka Gejak

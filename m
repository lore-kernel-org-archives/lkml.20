Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843040;
	b=znIfRSRzzcp8iodgwCghHaVke+KiwMIO8JfNjYB/lfHu6n5vz8QEI7yPsDR3Yb9k5kuj
	 Znl9CxemNKBC/7qEjk3G+nJ5h1+/Q5lO/JnCgV8N/nPMyiWBKJj6d/xvK3zycLqwuIQSv
	 UYUxy9euZB5B/su99AqidaPWU5I+Keb7345/IIoSezJp45mCgBiYabwUj/704VjCcZ1ru
	 XfMua5eWteHYVn9ryzIGDp4ts/MWofCShEpQOC5wddfmhsiOuW31o0CJLgZUNIetLOnJX
	 mT3UZAQNFk6OsM4bz696NnATKwTpja7F/+rYK5HTyyJHJBajV7VRPMATGbYfaN9gZBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843040;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=2k/Y2pCNJDQnEkb59AY8myO98fMueJbslBnkOlLvB5o=;
	b=0H1fH9fqTm+tSJ2+4oACJcNPjPtY9MCtaIv3/Bn2uR3cGF3Ou245Z4zEcnnJ6WlLZT+L
	 3oGdb1Flh5NY1kiHRyIFMA8Jw9Zpt+gv45MvfbCIxMcwG6QXrrJ5FCoPyOF6/UkxU0Fup
	 1ipfgAvP/HEwXAOBujGkM+E0LOuLrtn9Wl7/LvsCNLwpeUfOmAh4dySU8RfpjSPXinloq
	 6MHZ8uWJssLjwj2qrifh7pvfR8F/ewkmJqgT25MkJWCgEMi2mh82jx47in0g+ejA7bquN
	 Nf4OAuMX4NQKOnsZnALHR4N4CYd/54+HOf0akjFDk+W1FdD58IbAWUVEft58Xd1wcyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=C0WcEb2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6B606A32C;
	Mon, 16 Nov 2026 15:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B6B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=C0WcEb2d
ARC-Seal: i=1; a=rsa-sha256; t=1794842900; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M3A97DTgsJfddCr9QojCIVnW1gc3O635hxqnxdbo4m2KH6L2GG+AFVqVe9NYxjwC1C/eUz/qbTiyYjw6n3c510Fm0PDgtQvAdi6nR7Eh/oUch3DM+zeUxwoIPSgIOTLZr4tvlTuEiH8u4jkAgmRnxxPZUnIwuzlIlfrZRt6QbcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842900; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2k/Y2pCNJDQnEkb59AY8myO98fMueJbslBnkOlLvB5o=; 
	b=d6TUaqucRZ1EkfAJW8YFLjB/yh+K6iqPVhR1VZhDes/5PHcXyq5uiW5R+2eYXs19DeY/Ns8QvKU/P6qBHPh1sfY7Ub396eOifeq/pd4kSpn3w516/PeeFIdAB02C5AKkJG6AgllU5hdkWyA3kE+kRCT0KvbYV+6E4zbLOi0NJNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=C0WcEb2d0SjSiBUZgRIfYmd36U5T9E/tWHmU8OHA3qFZYo24pWLeIMhca9fb3vpF1UsM7vVfDmSGikk8jvuuJx1XR539UKV8q/AbmZ9PWZ425N6KAYqbkc8PBDZ/fnMefl4bv83x+OwD8n0ZU/LAftaYzPZh9PGa6bgcRonsJlkgjCuDI5jJ4gMjMiAYv21pc6LOnemx4k0tLNL8Whg6Oo0icZSaRnnMz3AUzYZ8qmdgXDEXK+DpinmpCRETDXC7pLa6HKlgKOatbWwQaGuGY0tYVF9xWdSfqgHhoWudKuHv4/Qc5j3/VM7SHTtRa+XcCZK7B4MLw2KjzdkE05CFSw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=2k/Y2pCNJDQnEkb59AY8myO98fMueJbslBnkOlLvB5o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842898815602.3329650797316;
	Mon, 16 Nov 2026 07:28:18 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter configuration for monitor mode
Date: Mon, 16 Nov 2026 20:27:55 +0500
Message-ID: <20261116152804.781-5-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <0a6a486d052e43c0adfb7fc6445b2026@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-4-owner@ph4ntom-rev.uz> <0a6a486d052e43c0adfb7fc6445b2026@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 03:48:19AM +0000, Ping-Ke Shih wrote:
> Please describe your purpose. For example, describe which kind of
> packets you want to capture, but current settings misbehavior. Then,
> I can ask internally to know if you patch is necessary or not.

I re-tested standalone monitor mode on RTL8852AE with rtw-next's
default 0xCE20 = 0x03174439 (B_AX_SNIFFER_MODE = 1). Across interleaved
capture windows on 2.4 GHz and 5 GHz, 0x03174439 already receives
broadcast, multicast, and other-BSS unicast data, management, and
control (RTS/CTS/ACK/BlockAck) frames, and FIF_FCSFAIL already toggles
B_AX_A_CRC32_ERR.

The remaining multicast drop only happened in concurrent wlan0 + mon0
mode (where B_AX_SNIFFER_MODE is 0). Since we agreed in 06/10 to focus
this series on the single monitor interface case, this patch is not
needed, so I will drop patch 03/10 in v6.

Thanks,
Enver

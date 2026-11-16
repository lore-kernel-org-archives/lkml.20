Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843145;
	b=VZnn0d1WyUeZvFUziIWqQyixTqWrJWJ5rOiwZVZuAf0f4KQmQiYyqh0P7gMvtjTcyiV4
	 2a9K5/KS2pPy5rfJAcLAt+HQRFB2I673mBGGz3uXkIyDTEL5M9XkkAUMrc5Eoq+glt1Fw
	 LgnJUNEV0EQx0erCoFswBvRMAROxwoHojBL27njWkoapKujjA/j/o2JI20lSCJDUHJhHD
	 O0KS7U1GqDAvacB54zraFJ+3CnGzat8SIXXOlH02NYywHC4GVRE9ClsUla/D2buo7LgBd
	 8GHjulxO1f+mTaiSBoqbsaiHyIgepsaJ0xCLqL0+5NmQdEZO8Gy4EfaRFJ9DaKC1f0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843145;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=j8TYqybOgL/6OwYiPC6FNAMDA7f2wLSSGFwaygcDTJY=;
	b=hVxMqdzqo12IYbLoRhuQOfDCIUG43cxxcM/l5dljw5N6sHAjINdtjKI86oJwAcKzkIIk
	 ehR4TorKWmHaW8BF+XLWEf7nzfAt8gP7EvhNxSTDQqwKGYRKKtPxg378EJmBeai+XSGvI
	 KusiIrYQ+HN2vzCwpDTKtTebl41pFIiGOX64htbXLy2umpM7BYWSs9XAK3bonO29deXjV
	 +glHY5z20YhqIVwMRmK8vaE+aV+K+bTq/a5d5wMc6olsTkIPdWv7Sd8az/2ywm8xfwBxJ
	 NgHkzut+gC8HbNfCrRU4gkfg8Y3Dy5h6+h1HavbkGOSbuzBEnW2dJ65Y3vOSHxtE2Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=23Av5BgF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C2606A32A;
	Mon, 16 Nov 2026 15:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 104C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=23Av5BgF
ARC-Seal: i=1; a=rsa-sha256; t=1794842908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hfL9TqsUvZ/XVIFn5D33QXv5dQZAvWirEmCxLdcO0uj+X2IC3rUV9dDmBeNM5i5x5TGdVrAINmzvSct8IkIVNwfV92OrT6PV/Pc8FkBUZp994ZbhTefFpNf5RCLpYzU6+/GYoAdZmWHxyahRqVcCsu49yIzRLz1Yrx86kjs1zGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j8TYqybOgL/6OwYiPC6FNAMDA7f2wLSSGFwaygcDTJY=; 
	b=B5QnOtC5485VV2uCSrgkqiQsNHVgw8pVSt+v8kqPgQG9kYfE/IEQ1TfZ+tIw8gJhl3/eidCqyXCJiB+eP+4zZ4p0+zCpjrbeJCxJsBfe3513vq+QkgsTlu0ZDqZ7vNjg28R8s2yBiKtvlbY2uJ5duSs7V8xFLz5oowa70Z2iU4s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=23Av5BgFFbhoUTKaZCarZyPfBW/OarQX2057zTIvDuNtDLGrvapjs8sCOgTW4T7Nx6A0jGLUN3XgcDGphsqvxPfiEWuLg2yKFMFy8xrNYl/JalGyTdj4XVDT3RQcFEkYDBi7c2k7NBVVXUrvzhWba5ivbkwUq/FpFomF27LMCJQ6HgwSSzkDKPZX4vxKZtm5L9WGt3TjzeFWWLBTfMyEEP+BQaYF+8Z6llbieMFaoPOIEhLIUJH5EexsSdhtdCDHr7tcIZQnFYcFj+HPyG2mkGX5a0MWEIuLTVhNgazPOUTODreRTE4StYG627kfyD529lfhL8CkFGqQePI7C8ZrGQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=j8TYqybOgL/6OwYiPC6FNAMDA7f2wLSSGFwaygcDTJY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842905416817.4745555354066;
	Mon, 16 Nov 2026 07:28:25 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 06/10] wifi: rtw89: transmit frames from monitor interfaces
Date: Mon, 16 Nov 2026 20:27:58 +0500
Message-ID: <20261116152804.781-8-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <3017c874678a439c9009f1b3c3ad765d@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-7-owner@ph4ntom-rev.uz> <3017c874678a439c9009f1b3c3ad765d@realtek.com>
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

On Mon, Nov 16, 2026 at 01:35:42AM +0000, Ping-Ke Shih wrote:
> > for injected data frames whose addr2
> > matches an active interface, via wake_tx_queue and
> > rtw89_core_txq_push().
>
> How can I reproduce this? I setup wlan0 + mon0 (with UP state), and
> use your script to inject packet with wlan0's mac address, it still
> goes via rtw89_ops_tx().

That only happened when wlan0 was associated to an AP and the injected
data frame's addr1 matched the peer STA (so ieee80211_lookup_ra_sta()
found the STA TXQ).

> The flag IEEE80211_CONF_MONITOR is cleared if both wlan0 + mon0 are UP.
> Do you actually need that? I have no good idea now. Can we just focus
> on single monitor case? Or just avoid crash from concurrency
> combination.

Agreed. Focusing on the single monitor interface case (and just
avoiding the crash on wlan0 + mon0 via patch 1) makes the series much
simpler. In single monitor mode mac80211 already validates
skb_headlen() in ieee80211_monitor_start_xmit() and passes the virtual
monitor vif to rtw89_ops_tx(), so this entire patch is unnecessary. I
will drop patch 06/10 completely in v6.

Thanks,
Enver

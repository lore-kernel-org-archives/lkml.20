Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843252;
	b=ethCGb9za2gETVRuWMpE7uIem9WyIzDCmGp7xi8oNlWj5gu6LS+Fs3PaIVoFjc1WQuor
	 QgagP9iXMnEZt5D+zOQuAp+A9SgHhZRjujPmHDFWvCf9hAs9IsdD4VEuH1j5GHPi9//7Q
	 mUo0udHNI0gcC3Ef42s6k7CrApHldtIpkBrHdFCtbaYNFedE8Y6O784xEqhjt2eQQ4uNW
	 /M3vDKCcKsJ13zrP7vCh2MbIDvjW3FWLVymuAeXYOk+70t/70z+HX98WzXCfzTkmVIwzC
	 u5xqvtffeufZ/gHqBXLyfOF8JvE+Iq86Es3HSehUdweDFGCch2qngDsb4MjO7+kt5Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843252;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=5N6QsnryjRlYvOgJNwhSXoYL1t8MlnxwapKxMFTSoOc=;
	b=buNa8FGgRaLFG9BH7sftjgjjrBCNaUM9cjeK8K+KISYoXNVx4j8Sq06p1+Vxb0rfoZnj
	 efG0Uahia7MxrLktH2tJgyVKGMO6QfrXCGS7s2vIhyAhqeaNsl5zKR+YwefYBPCmnMOgE
	 I5umyaHjt78s+YwMpC5KRdgNdzshXwYKi1Bn+BFOBopMb4PzacC1XMV4HGCI9oOnLtBq1
	 p3jCdymNwL8li1Bk8oEpb/oBlxQt1QnrqmUdzZS4nE+o59EvNOK90IOxG2vnhgeqQJHmb
	 u3wmH/oYjQsv6UePKgoON6gGKvfpFQOOpxLfaPI4BKNlHfhlAgJAvkqgvsCbAEatlqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=EgxZKUlk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D8606A31C;
	Mon, 16 Nov 2026 15:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=EgxZKUlk
ARC-Seal: i=1; a=rsa-sha256; t=1794842914; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FLpugdw9WX8ipfwOb7I4gOQelJUk20/x/ZcWpuWqMmrHe/YLFEMVoA8f0U6C6B5QTEOmKi3f6d0hTJtU3CdChzTZLfNFRk8FIspQP3G7RFJ3hej+m2IwwPbFb0TvLy+EcUMCSte7Z1cSgQoYLHdaFGJVzKw48pUyGTruk9zdRVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842914; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5N6QsnryjRlYvOgJNwhSXoYL1t8MlnxwapKxMFTSoOc=; 
	b=Zu5Fi/pWccBHoi7FaVJYarHc1e/3ik1F2S3q/Q9ZSzn1I1T/Ij7PM6ArA3yGMvnb2dwQlQ70PFFXQLcw7MyBCmUt8ynLsT9uUUqIpqJWJ7Hc+Vl7sXp77qRJSnQcAcfS65eUovzYRS4MGMTHBljnO3XpdEbGo5ZbiPH0HU1Bd+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=EgxZKUlk2HzF5VyQWn9CscCOrX4cn3w5fzj67dMxbVM1E7jHEVErtJsWvztnoRQoOOjDdVDvm1w0Ket2skSVeraU3EUk7EToImaemXWCu1LGgVvJHo6obbWsV3ckSOJnG9w+OOADMBbv75+5gATCTaSTJN5XdQ4c9N5gdwqYvJyka8xyGQmsu3f5EWNhKSQYe3CsFKI+LYX+mhfiHqm6R3H9tcTM/zCPLlotA8UCxxO4TgzdAc6vOxablUqlphWzhrNH8MqPxwXIwa8zKytPyioR00D7jFrnnbUBeTG6qHMc/nJMtcmHOowzRKbavge8fHlBPavcXkKCsfgGqOvl1g==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=5N6QsnryjRlYvOgJNwhSXoYL1t8MlnxwapKxMFTSoOc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842911833577.5900358989645;
	Mon, 16 Nov 2026 07:28:31 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 09/10] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Mon, 16 Nov 2026 20:28:01 +0500
Message-ID: <20261116152804.781-11-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <a56a85ff19dc4bd29cb3c81cb7e0c77a@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-10-owner@ph4ntom-rev.uz> <a56a85ff19dc4bd29cb3c81cb7e0c77a@realtek.com>
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

On Mon, Nov 16, 2026 at 03:00:10AM +0000, Ping-Ke Shih wrote:
> No need to describe driver behavior.
> [...]
> > +               desc_info->upd_wlan_hdr = false;
>
> Does it need to update this?

Not needed in single monitor mode (desc_info->mlo is false, so
upd_wlan_hdr is already false). Will drop.

> First line of block comment should be empty.
>
> But this comment is not necessary. The code explains itself.
> [...]
> You have set
>    hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
>
> Is it still necessary to have umin()?
> [...]
> I think the maximum standard VHT MCS rate is 9. Just use 9 inline.
> [...]
> > -       } else {
> > +       } else if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) ||
> > +                  tx_status != RTW89_TX_RETRY_LIMIT) {
>
> Will it be a problem without this change?
> This branch is only to sum internal counters of the driver.

Agreed on all points. Checking ieee80211_parse_tx_radiotap() in
mac80211 also shows that rates[0].count is already clamped to
hw->max_rate_tries, HT/VHT/legacy rate indices are already range
checked there, and IEEE80211_TX_RC_USE_RTS_CTS is never set for
injected frames.

In v6 I will shorten the commit message and trim this patch down to
just clearing hw_ssn_sel/hw_seq_mode when ASSIGN_SEQ is unset, handling
NO_ACK, and honoring rates[0].count with max_rate_tries = 63 (dropping
upd_wlan_hdr, RTS/CTS, rate clamping, comments, and the pci.c change).

Thanks,
Enver

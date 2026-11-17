Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908545;
	b=GXOxjuXTMIsl+0bW4cS9cfOZin5db8TwYE85fN5Wd5lriE0DlJDN/R6cRPMx0YPYMwva
	 dEgv+4KrC8vyktzIUnjMZ7rSj0x8/Z3Seueeqr9047rmxEqt3rmS1BsUfb1UTA5A0qq88
	 q1AYqEcsjgY7q5yTLxAxVOgKtvPW1tiRjpaBHlCraOANvrODUtwSnBAgGnMkIFmm+xI8j
	 3HteYaPlZ+gOfso23OGrChMP4wkVlj9njYD94WyaqgWMKPTzWaCf49IyHgTZhWq2k4m8I
	 O4N8ntevcAeq3q8chWI7yF48u39lD3eBMfryXx+iMUTffcgUbZ20d19rBnD547ICJRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908545;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=fVGoW8479Mk8cH7urtimysneVqixkNoyuVuufixgLcs=;
	b=xZyciZspeqw7Cc9+v7vedCnMuvqUZsrfhmO6bwbPPiud0PVAlsx1l6FuIhuogciIgzix
	 mMyG6/azDJMUphHIVsm17nMIYWS2DDreabe+XI2QksxHG93E6eXfeyB/VOWbZcct/fDKq
	 z6ApDHfNbtBOedwrzvhj9qwHVrhvTIuSkCkunZYHaTHErFb2jYj0LtA0xK4SKSwLpmaqp
	 TMTDFep/K2IBKXWaj7od8ZFDYh8kriUSrSekCRN6tjtwoR7ASBKzRJN6wlJ7QOQOXFoSC
	 4uTa8u4YylirNCy/5bJa98siemagOvnLmpEsdjQgsUgJBx1J6oeeLWQbY7/knP8bX1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b="zuO/9/Ht";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F17606A323;
	Tue, 17 Nov 2026 09:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=zuO/9/Ht
ARC-Seal: i=1; a=rsa-sha256; t=1794908471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a6UQIAFaKPrTwfBgapM+DB28b71S6N1P/StT+TGtlWSxzAdcYtnf4f8JBknEGQAOGVfJG84gDISBfDypok17vO8ciwIn73R3dheFW5jtrNhBHOO6m3RdVsh6TdzAFcC/htZh9k8X8M7b9xWPH0Hc3xtMZyJNoqYCribAQySVvWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908471; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fVGoW8479Mk8cH7urtimysneVqixkNoyuVuufixgLcs=; 
	b=MGtqf69Ic0g4GWug639/hiPngiFE9BisQL6cz0aL2BuAQlFSPsRU04xRTCaicHynHroZox4eQSX8Nye/zi33WaxO1ETOrDkOVv82oBOMla/TQnYD8tvO61VDPiIqXqMnFObwbRuKdXRsoQRDjmlY79Uq/Awk9ln/Fiqnx2S0fhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=zuO/9/HtGHOxWjh0Kp0ptOEhO3eRB7XT2qvwJvLW9rH+mf2RB090vWSWBZO3nuFJUW3JRDYCKVppBUE/HOIZKzqm3h4Re/1GlMhUDIWPsHXngSXJHljCF98ijKnH1//JuSwanbWVUVfcfMBVyTk8ZPxClOB+SVV4cJQkJbBdOwRxS+0XnuUWS0LfFTQpEGWETNpTnbdJmHS+uRRie3P+i7JI6rNrhl0S9e9yYmPbsvoZ4Zw4b/Wrd4EEGCDPHZl76EwVsLTnIEsAyFxt6x6scCGNf8IS7BnJzUg7hN66gVtWhwGg5aJS2S+MgtzGkl9g0N8YK7anNQFapOrFh8vjHQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=fVGoW8479Mk8cH7urtimysneVqixkNoyuVuufixgLcs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908468893302.13334844654753;
	Tue, 17 Nov 2026 01:41:08 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for monitor interfaces
Date: Tue, 17 Nov 2026 14:40:59 +0500
Message-ID: <20261117094059.1744-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <ffc63e08f954499799f67fffc068c0de@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-6-owner@ph4ntom-rev.uz> <971ff7a2aa6e4f5bb6d4e459c386d433@realtek.com> <20261116152804.781-7-owner@ph4ntom-rev.uz> <ffc63e08f954499799f67fffc068c0de@realtek.com>
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

On Tue, Nov 17, 2026 at 00:41:28 +0000, Ping-Ke Shih wrote:
> But I can use your python script to inject packets without any change on
> kernel 7.1.5. Can you describe the "raw frames" more specific?

You are right. I ran a clean A/B test on RTL8852AE (stock 7.1.5 and
rtw-next) comparing the default monitor role (SELF_ROLE_CLIENT with
NET_TYPE_NO_LINK) against SELF_ROLE_AP across Probe Request, NullFunc,
16-byte RTS, Data, and QoS Data on 2.4 GHz and 5 GHz, both right after
interface up and 12 seconds later.

Without this patch, R_AX_MACID_SLEEP_0 (0xC2C0) and
R_AX_SS_MACID_PAUSE_0 (0x9EB0) remain 0, TX status reports zero
macid_drop, and live over-the-air ProbeResp, CTS, and ACK counts from
the AP are identical to SELF_ROLE_AP.

My earlier test was misled by two separate effects:
1. After monitor down/up on the same channel without the channel
   restore fix, PHY0 stayed unconfigured so nothing went out on the
   target channel.
2. On 7.1.5 (before commit a371139d8be9 set B_AX_SNIFFER_MODE), frames
   injected with a spoofed source MAC were transmitted fine, but the
   AP's unicast ProbeResp/CTS/ACK replies to that address were dropped
   on RX (0xCE20 = 0x03174438), making TX appear silent.

So RTW89_SELF_ROLE_AP is unnecessary and I will drop patch 05/10 in v6.

Thanks,
Enver

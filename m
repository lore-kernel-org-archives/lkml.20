Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748855;
	b=JAWbFKBStnulD613aDAksk3Iwc6VcoOMoGQ0mvrIFaMTN8xceFmlIRcSQQ9qA2rNvqRM
	 iMfFHejHAgdAonkDCUaMYxPWb2jqg2eZoIrJUW5v7c5+/ZyJ4hEcsC7+HxrYjBQG59iA1
	 EKjFQmgJxUie5j4bNl897L+MnI0knZr6UfA5iOYBoT6rs0OTMpi4PuOeb9nwRbIBhTBMl
	 GJN/RxfTycKqWkxzCJqAOBDUuIE81jSi1mc1wrh9k76DapcYQtNJOOp4r60uXjPjKq1ll
	 dDnQl3V9osPuIR5U4bh/PsUo+EJYyHknZafiSVHbdeAZXkv4F6NO3z6OiTds3M4fBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748855;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=s1JMiRvDoE19gVu2Q2CgaLevtlb7RBGaKMgtJkRYiVc=;
	b=EYhoOZTdmwh2OjmqaxejaJmKY2Tx/M47FGEEpahvKNSIM6WKEtQZ2SiJs2K6wgirWCHg
	 9l4LI9IpAxYULSnhot5QyAnUkPGzV0YuIszATDrLOtUnid6ja1W4D0ooFztgkDgFCbWoJ
	 iiVGMnyjLHUi8w42Wn3CeIjYkFPWbJj+9m+nonpxWZEOFlbcIpb4i+xK22Q8LkGWYXvCb
	 aB4eOoykOtXWUQOYwq4VO7PM8+x+1EHS1v1Y2PsOr8zRc0V9jZjsFE1m8ctqwSQxKQVfC
	 hYSDWD05kIM6HT/xrvN3QYTQj1/P1/WQujzrRED7nlcbQgcQiaH/sAAlP2GfKnEOtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KQ3I8DpK;
	arc=none smtp.remote-ip=91.218.175.179
Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KQ3I8DpK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EIe7qYUzPgt9ngz8hEFCi+hqiS+bLwWpcow6+/IWcYk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794748852; v=1; x=1795353652;
 b=KQ3I8DpKrWSuk1T6RMKsxVGl/hwAX7tuuZaFdZW6a5KIYSxx5IK+GOqAMY5AOZulFDtMfmDH
 DIvSnlOzcAsTsLPG6jzhcANhgOqH5LW9dbqugIOnvV4tKG+5F/ZuHZbfWJd/wLBTsxnraBzLpvq
 cBPVI6kc3lRDHzXOMURpPpTc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b01f535dd91abac;
	Sun, 15 Nov 2026 13:20:52 +0000
X-Mizu-Trace-ID: 1b01f535dd91abac
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:20:51 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_6/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261115114336.1739863-7-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-7-hjf3108@gmail.com>
Message-ID: <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

Thanks for the patch. One comment below.

On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c

[ ... ]

> @@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,

[ ... ]

> +             rtw_phy_parsing_cfo(rtwdev, pkt_stat);

[ ... ]

> @@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,

[ ... ]

> +     crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
> +     if (crystal_cap == cfo->crystal_cap)
> +             return;
> +
> +     cfo->crystal_cap = crystal_cap;
> +     rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);

Could the shared helper discard the samples while sta_cnt != 1? In AP
mode, frames from both clients match the interface BSSID, so these new
calls keep adding their CFO samples. But rtw_phy_cfo_xcap_track() returns
through rtw_phy_cfo_tracking_reset() before clearing the sums or counts.

So if I read it right, when one client leaves, the first adjustment still
includes samples from that client. For example, on each reporting path,
a +12 sample from the remaining client and a -48 sample from the other,
followed by another +12, give an average of -20 kHz. The remaining client
alone gives +30 kHz, so the first correction goes the wrong way.

This was already present on 8822c, and this patch makes it reachable on
88xxa too. I think the fix belongs in rtw_phy_cfo_xcap_track(), before
these new callers start using it. Could the sums and counts be reset
there when there is no single peer to track?

Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903631;
	b=4M7jCspc0io/RgQEAIN0aKZDz8BtzXQaTF7fYLmfAOlKU+KPldRdx6BOgmCLEe3aPiAp
	 c+mZj8kamD0y/oBXuZpoKJhf3y09ofSveSPgxFuCYYR7uLXzrJcsZ+cO/pKfhnCCrejRY
	 /5xEAt1xcAS956I87JUqNyH22ZUH25D/F9AmrPbBuPKSXCAKYVLcWyazySdsSjPFomLes
	 ry8DEG1Hxed1V/uZadUpS2aAmT0FdMVF9TaXJYNzyCcfh4BRwWZM9Vz+G7GimSti9H/J2
	 E4Z4Krf13nl+FY9gHUEukFeJQhlHXrJ7FQAQoRdw7LhRIIeVpjfPH4a5o9q8QfD6ihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903631;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=gsZRzUKWDe0vrUNW5WsjP6aLDOjhouIaikkLDLXVGwA=;
	b=hBO6vgwBdUYO0amLixnAacHVmsI5B/p/guqvUpyCm0bqa/gMEanLZUumXphqfC9sXiNz
	 qTiA/d4VfDEuO+rvHfrRrDCzNdFD7K25OqW2WSYuZw/86BQ/HiX5DyI86XSLJphY0wTve
	 IXTGTTSXQHPN1p4ZbR+DyRdpjCUiLVrLMxV9FzOxJTEVPKZ2F5z0EetrOUSQW5HTBE8Ma
	 kFWKvqu3H/K86/Bh6OicYLj3NtpvJRgmUEje3yxjigYTq4YIp2wQuuH9UD+c7Sn5WwhaY
	 AMxvKph/uWQM2NUBT6OMBxqP8JMNdwZFaP8UkXhOMFONSZAxwFalVsTRhUe/oQ3e2fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="QZar/l6m";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92B606A31C;
	Tue, 17 Nov 2026 08:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB92B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QZar/l6m
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH8KQ3k8083065, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794903626; bh=gsZRzUKWDe0vrUNW5WsjP6aLDOjhouIaikkLDLXVGwA=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=QZar/l6mkWLTkyvKRFqPKJXHCZevuP1TzA8NBDQJdImBs0zMH3n/YiIYCcfDVyOp1
	 4MMmoTzfUBUUG+IxjgJ54c7B9O/debfDWz5W0/tMLBir/hv4fxegn7dMD2fTteoE9C
	 krEhc631fwtEtW/hB43vQMIf8Ho+ew5IXzh8GMRa3nj9wRn4n6xpytimslks4f2UHs
	 zYL9171wFkLF36j7LoQaNvybeA85LWSpzk7Dck0UC7Y+hMxCSSgPOJjYgNj9YAa1M3
	 9n2Ufb0azeo6zOo6AKYIxWTGSBhBDGzU5hRmJnL0NDV+XJDEZWxm3roBtuZBdkS2kG
	 YR3sNtu6btSjg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH8KQ3k8083065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 16:20:26 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:20:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:20:25 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 16:20:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zhao Li <enderaoelyther@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Po-Hao Huang <phhuang@realtek.com>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH rtw-next v2] wifi: rtw89: update PN state only from correctly decrypted frames
In-Reply-To: <20261116092300.20414-1-enderaoelyther@gmail.com>
References: <20261116092300.20414-1-enderaoelyther@gmail.com>
Message-ID: <7fd1a2a0-8bd5-40a1-b2d5-9c250ad6c3a2@RTKEXHMBS06.realtek.com.tw>
Date: Tue, 17 Nov 2026 16:20:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Zhao Li <enderaoelyther@gmail.com> wrote:

> rtw89_core_skb_pn_valid() records the sequence and packet numbers of
> hardware-decrypted QoS data frames so that it can drop frames whose
> sequence number goes backwards while the PN advances. It runs before
> mac80211 discards frames with an ICV/MIC or FCS error and requires only
> hw_dec, so a frame that failed decryption still updates last_sn and
> last_pn. Such a frame need not come from the peer. One with an advanced
> sequence number and a PN between the recorded PN and the peer's next
> one makes the check drop the peer's following valid frames until their
> sequence numbers catch up.
> 
> Skip frames that rtw89_core_update_rx_status() does not report to
> mac80211 as decrypted, or reports with an FCS error.
> 
> Found by code review and not reproduced; compile-tested only.
> 
> AI assistance was used.
> 
> Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnormal PN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

4de83750b9ac wifi: rtw89: update PN state only from correctly decrypted frames

---
https://github.com/pkshih/rtw.git


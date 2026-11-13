Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557405;
	b=ox2bBms2qcttnkRSX/HgK/pwSgXXemybiQZc77ntYl3e8kvhQY9NzrGdac21dcm/b9KO
	 S+A+FPHuoPqCVTx0jBjl3myMkFg3QUPNxCW4PTRpxTYWwW3//coddGUYFuPdssozlSQPw
	 +/AhBEBTkAv/qxH9jkl6V2jSWsedf3JjouEhBv1FcbKxLtbYT1A52a5jLYE7oYyuSwfj+
	 zo+9f6XxuA/qZQmB7cHW+EvKEIIZqHs8/91VWoGOTTo0lxiBGWB48ZP4+XfYwT1w1Eoq+
	 5OP/n20MG5q+U0Wrw9E16I935YkdTK461pJ27aF+UXCOyFO55q1TkZbdHWab1QqNw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557405;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ptOo3l1wVPDxcuGByE9VTRE5C5UcUnRFoideyOy2rR0=;
	b=SFgC1dr1R+Kc8doq3E6VZxUQRevFTJBUKiWO9mmV8+ckdAzjbHQ/ZigZHnCZ6x1kyszC
	 oKPVn23qf6nHk5yo3zHnaWh4JwusGhIljLAip0T0HFvdwpn9HVeV9LVnOiq20hq136i2E
	 Mqnn3iqtkiIFnshaOvgT5SyxvH+mXA3ncsVA+8Ja6vCnTZOYude8Ww3nuDZHG61Mo3PQw
	 m/hFl+bdNfO7PisKwHgZuh6qZXRLVcHAwispvSt9snIn01FCNbjcuygCNiE9ZM5nEbrxI
	 kmwMzBhhp//4kW+vFlkcv2SgoSed2mBZ+sCaXj6f/bZjHKh56o++Fku6qNRPbIQggFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BuvMuhBc;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224ED606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BuvMuhBc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V1ClGZvD1A+gwzdY9/yZrU4v0vHeluKVV9NtjwpReiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557403; v=1; x=1795162203;
 b=BuvMuhBcGEb9Vs/X8TYNh906CXyxZFaSGmTITOBX9PWomdnmACenfzycOJ9IrJlZ39DTTA3a
 rVpKfkgzIv9ZLjfEhG6hucSURLZay5EsuT+G5Ha2jhuunNgy0LbMT8/fPq2VlDmONGvYkQNGwDS
 xYob8lGLesCLMvF/7zaPQEnQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3eea5f2ba0d76f47;
	Fri, 13 Nov 2026 08:10:02 +0000
X-Mizu-Trace-ID: 3eea5f2ba0d76f47
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:10:01 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_5/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <20261112173246.3201729-6-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com>
Message-ID: <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
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

Thanks for the patch. One small question below.

On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> index c8008cf43d..c8f5cdf31c 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c

[ ... ]

> +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> +{
> +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
> +
> +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
> +                 ((8192 << factor) - 1) | BIT(31));
> +}

What does BIT(31) do here? I see the vendor driver sets it too, so I
think it is right, but a define in reg.h or a short comment would make
it easier to follow. The same goes for rtw8821a_set_ampdu_factor().

Best regards,
Luka Gejak

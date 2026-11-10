Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340661;
	b=x+hGn5jRSsw3tEmvVn+5zL9uDRi5GT9J4MCN3y19l4z4e3uVYTqAiWhx648PTQut5zzh
	 JRanq6NzaAd3csduZbzOPJJIp8pRpbsFYdhqayFDrDdMqXReyiaZ0DKw5zwZPPSh8ghgY
	 9jG2pxKZ8c2aSzkF1DktJa0IO+exxkKYBgmTkVT7yGax88prtiZMzc3H/9OX+Ab4lacjP
	 PgbqlBjPytt8q8RD5ZwNTDN6EpxzKHNNjC4BSW4Jf9U03P7ughMOWgrp96+qYgZlKYgz1
	 jeFD812HSqZ7g8TZNZjv406/kkaZPY1OV3V2taRocISfWYU4j/EYQIdQnaEWD51H1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340661;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lMR0kUfdjZMJR+0oWa9sSX/UZwt66TqDj+0eyBoDUXY=;
	b=wK9x0XEyMLB6P+tqOKNoXpMet784BDeQ44jUpDsw0syxUhMbbKQR/SRUQvo/JG/E4muU
	 cTRQx9Wzslm+FQy+kOb1XuYiuie7FZE2RpApXf29+LM2id9w+mpV6btx89rupmq1RDMvS
	 kXDHNWajB9rqWnkJdKO94oHf2oEnwfwcvUo0cL+jRsYXHp5KjgGBjKrPlyCZ4E9SXHKDz
	 xYBJ4dxCGXQSqOCEyWrXsY+sygcZxhMIE6wulsQMw/YeXMfAiaHRWamGaAP1puKJypOgq
	 NqEhnQrKQjPiAzVYC/FpXjKoOVIOWsTbKMV+2tp4P5eKMMZIDKT2Iw79R5OMWqaW3pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IDKIMGnu;
	arc=none smtp.remote-ip=91.218.175.45
Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC84606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC84606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IDKIMGnu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=taf5xIdsLawaO6DyBudM+ObdMWnrDPJhCJJ72C3rWS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794340657; v=1; x=1794945457;
 b=IDKIMGnuQxplsYHIq7Bg32as0bnD7Nk7iW2TxaAcH0gNT5BqsKYTr2I07Ar5PX9qA8T0Xc6r
 MzJoI9FKynBUAF0j5XfsO93IGIrhWiav4E/hO9FTtfXIA+YX2pjK3F4CEblmuhAlz0Rgpjlza7J
 9LbHx/3Jn9G8nyyMb7LOIdw0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13475ae9d2aa94b6;
	Tue, 10 Nov 2026 19:57:37 +0000
X-Mizu-Trace-ID: 13475ae9d2aa94b6
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 20:57:32 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>, Ho Jie Feng <hjf3108@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_6/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_adapt_channel_sensing_to_receiver_gain?=
In-Reply-To: <45407e4f-9009-4f0b-a9a8-58b7052d25a1@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com> <20261031070950.425176-7-hjf3108@gmail.com> <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev> <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com> <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev> <45407e4f-9009-4f0b-a9a8-58b7052d25a1@gmail.com>
Message-ID: <C4DC98F9-B999-478E-B7AA-7DAA15D6C996@linux.dev>
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

Hi Bitterblue and Jie Feng,

On November 10, 2026 3:36:35 PM GMT+01:00, Bitterblue Smith
<rtl8821cerfe2@gmail.com> wrote:
>On 06/11/2026 22:27, Luka Gejak wrote:
>> November 6, 2026 at 8:46 PM, "Bitterblue Smith"
><rtl8821cerfe2@gmail.com> wrote:
>> 
>> JP. Bitterblue, is the adapter on a USB 3 port, and do you see the LPS
>> failures on 5 GHz as well?
>
> It's in a USB 2 port. I am seeing the LPS failures on 5 GHz too.
> Channel 100, 80 MHz wide.

Thanks, that rules out the USB 3 idea.

My next guess is the lower bound. Under ETSI the L2H starts 37 dB below
normal mode and is then raised to at least dm_info->l2h_th_lb, which is
only 2 above a floor measured once at power on, on 2.4 GHz at 20 MHz
with the LNA off. At 80 MHz that may be close to the noise, and with H2L
7 lower EDCCA may stay busy. In LPS the firmware can switch the RF off,
and in the watchdog the ADC mask toggle only runs after rtw_leave_lps(),
so a busy EDCCA from sleep would still block the null frame.

Bitterblue, could you try debug_mask=0x8000 to see whether L2H sits at
that bound (printed as "EDCCA L2H floor") when it fails, and maybe
EDCCA_DC_BACKOFF_88XXA raised from 2 to 8?

Jie Feng, until this is figured out, keeping 88xxa on the normal thresholds
like the vendor driver does by default, or leaving this patch
out of v3, seems to be the safest option.

Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767194;
	b=0/zDVJngyL09B6pE+I5ItNK7v0PnADRh2z2vxnK9nWnGXev8LGjS8GXKrkxOIPRQWULQ
	 gv6hnqvy+Vx+GPXxPLPJJuFFEIabzUwIv5Z5OE6CxpguMbEveAqC3q/aMwWrPTQV0oN7K
	 jZWDZssGX/xTr21puLQ0O7dSo8Nl1vknKd2NAG93XpIwrV/1DOPyUyhktBCipdaeL6enh
	 WRQiiBD8xMy9+MHXJDqsC5sPiY/DwGF9sqB9wmPkU8/eJbvfR81lU6tq9k1jQIyik7SQf
	 4P/hU5IYj+DjgHKiicivKi8Zkf9AWY6C4Sx33yToURtt0SMDuvudklfsFG3cntl6Zwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6hhvBoZDMPREBK+QllaLdak4HEXlDgN9M+ym2CatEzY=;
	b=Cdqj6G7FVdbXoFm041y1aR3zEnRpJnM5NwpLi3Gde0dq68LkgqudAE7AV0SI/tAw5z70
	 S9y1X66gbBjgtTmXqEeNSVEQKmBtGmQlt3vZK9Cp2OCxm6iOqDyew7lRsZ2aD8svhG68A
	 bnd/dOpQFvIrA6SZbphGUvx15hwhQ8Ncg2B+DbcCjCViC/KBg+9nEDXh2RluGWtozxupA
	 hUO1kwurWU81joaNoCQHOjQOJ2vDAgd+Z31sCjHdqi+YfTH1cL8bHpYeqn0VrMN8+IlR1
	 y3fUB65mBetaRY/mSLEf0KrTA/x5BRyXdGIbHaIKLajOVO7I6+kevBUUry/quGqFdKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWqq6Ytz;
	arc=none smtp.remote-ip=91.218.175.33
Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851B606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1851B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWqq6Ytz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ya6B7gVo7+tq2SFNtrJ1DU++OTmw3FzfOanRib/ggkk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794767190; v=1; x=1795371990;
 b=xWqq6Ytz+wVRlDOrMYXwYvevrkjMQ2eN1dUy6pZtXSnaZwi1oN2q7riacxrRWNYLVN9E0Ehv
 LYZUz6bsXFqz3tNvFFgx659Ciizs7knUMWW4XHi42RLNgHAoqRrbk2p9il0MFPhlZAzmkhgFbVd
 hI0DjERIL3eV02eMIHU2N/9I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0dbe625ad8b95c5b;
	Sun, 15 Nov 2026 18:26:30 +0000
X-Mizu-Trace-ID: 0dbe625ad8b95c5b
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 19:26:25 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, Shawn Lin <shawn.lin@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] wifi: rtw88: reduce RTL8822CS SDIO request overhead
In-Reply-To: <20261115142330.359247-2-leonard@lausen.nl>
References: <20261115142330.359247-2-leonard@lausen.nl>
Message-ID: <27B2AC6E-6293-4287-B966-986AF8C0CABE@linux.dev>
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

Hi Leonard,

On November 15, 2026 3:23:28 PM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:
>Reduce SDIO request overhead by filtering hardware-handled control
>frames and combining adjacent TX-capacity reads.
>
>RTL8822CS on NanoPi M5, median TCP Mbit/s:
>
>                              Upload   Download
>  Neither patch                170.4      241.2
>  Filtering only               258.2      263.3
>  Combined register reads only 186.5      261.6
>  Both patches                 286.9      273.5
>
>Together the patches improved median upload by 68% and download by 13.4%.
>Upload and download were measured in separate sessions, with four
>20-second upload samples and four 30-second download samples per
>configuration. Testing used a shared Wi-Fi network, so throughput can
>vary.
>
>Runtime baseline: v7.4-rc2 plus the RX-bounds fix accepted in rtw-next
>(83ca360e85280) and the MMC voltage-switch fixes in linux-next

Series targeted for rtw-next should be based on rtw-next, unless there is
a good reason for doing otherwise.

>(67a97316a31a3, a3838c21e28e5). All variants use stock MMC host limits,
>198 MHz SDR104, performance governors and identical CPU placement:
>SDIO IRQ on CPU4, iperf client on CPU6, server on CPU7. Traffic crosses
>Wi-Fi/AP/Ethernet between two endpoints on the board.
>
>All 20 configured rtw88 modules built with W=1. Sanitized function models
>cover credit-read errors, fallback and buffer ownership. Module IDs,
>filter registers, traffic paths and kernel logs were checked. AP/monitor,
>suspend/resume and other-chip hardware remain untested.
>
>AI assistance: Codex inspected sources, developed the changes and
>messages,
>and automated validation. Prompts requested small optimizations measured
>individually and together, with explicit prerequisite and impact checks.
>
>Leonard Lausen (2):
>  wifi: rtw88: 8822c: filter hardware-handled control frames on SDIO
>  wifi: rtw88: sdio: combine free TX page register reads
>
> drivers/net/wireless/realtek/rtw88/reg.h      |  4 ++
> drivers/net/wireless/realtek/rtw88/rtw8822c.c |  9 +++
> drivers/net/wireless/realtek/rtw88/sdio.c     | 58 +++++++++++++++++--
> drivers/net/wireless/realtek/rtw88/sdio.h     |  1 +
> 4 files changed, 68 insertions(+), 4 deletions(-)
>
>base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

Can you resend this properly, as v2, as resending singular patches is not
encouraged?

For the actual patches:

Read Documentation/process/coding-style.rst and
apply what you learn in there to all patches. Furthermore Assisted-by tag
is deprecated and should be removed, which you would have seen if you had
ran checkpatch on your patches. Address these and other style issues and I
will review v2, as I don't have time right now.

Best regards,
Luka Gejak

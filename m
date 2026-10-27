Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087480;
	b=ORIOO77yx+/C1U1OubAEvEfmcEw88sjj/vp83ti6Jk9PXN8/x7Tyy5DdBKpSEStIRYDl
	 IMb9ECLbTz8Cnr20HXhA+xCYozsKxjzknSQdw/9nlKaGDBrCcqSRCDD6lv1KKRDQmN/sR
	 pjQj5ePu7rwZHqwJYSWzb73duAe22QiJY0ERgKafcEQM6/OHpgLqd2oZ9xovhLTWRhl+i
	 hUcIfH5VwlZeqqsyNCr76H09KB2Tg/bVOZ9Z35NXSTKuxFtUhLU/BE6J3LcHEdtsvRYai
	 irx7mR7C3dFKk4n5x9hRVkj6nnke7DggZ36u2dEvXAsqHWTFRbPoab2nDRDebM/D6zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087480;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=LUDVMesfYjjT6jM/x7DqLRn6ypp4lsWHpqnJeBC+Agk=;
	b=bXOf3IQ1ENWG8X239MmlPwJjzppfgurpuXm8f5mHdOs0C79/8rk2fTFoxoqQK3SO1pwx
	 sMOIrqubhoBWh2St5Ro2tSOz9J05VuSB1kEz4NrAhtsr/C7ciy9OgRUPSsNtKTiKL2T6r
	 XHhKWelDinqT51XDj8UPsWDFMtag3DV/Wii14HRs7U1d/WFpiZqiFi90b1LJ0V12uyqNI
	 F261K0/5xBMUFbwKatVNSBP7TTinLEZCkpb7U/Xmepng1QfLNgJPdfukhZJ4UZPnzF6NG
	 RnVqa5R/9WWt6zisrYt0CZtuU+f6RAFIuPUNwVHSmIcGz52Aa0T8550Wtavq0P8wTcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AMx3g863;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AMx3g863
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BA2CC79AB0;
	Tue, 27 Oct 2026 07:52:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 325C2603BD;
	Tue, 27 Oct 2026 07:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C4310329027;
	Tue, 27 Oct 2026 08:51:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793087475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LUDVMesfYjjT6jM/x7DqLRn6ypp4lsWHpqnJeBC+Agk=;
	b=AMx3g863HeNKbE7xvsT7Y2rhHJ8FyuBgsyXCw1NvymRLC+wEFflZGelG3ZdLY/E6PhLIBx
	ptV+vwLzduW0qFXEyu16u0urTHM/K0LnTPkAZfn6mEyYiSS+QILspBrB69pahMeFnZ8iEJ
	G7NZlmGxonr1fSwzm9WqaoNM4okLVe8uUn5Uj9sSeXTTDMZLxtPBljzwOEiHKiSZOblbDQ
	8RZaOmWFALzShNuT2s2rwU2ouZag0Gkys+CqSMkSAK6SfaWp+UaHBeSXCFLobGiKrqSGAk
	gwxbI1wKypOeLwf2feiLjCxzY4AcENw09OIhGf/Qdsfffs4nq8ykBAxFwaQgIQ==
Message-ID: <4cadb163-0cae-4a4f-accf-ad0e7eb2c43c@bootlin.com>
Date: Tue, 27 Oct 2026 08:51:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: Use a dedicated flag to track disabled napi
 instances
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022075757.1164283-1-maxime.chevallier@bootlin.com>
 <20261026163357.5d1bdb29@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261026163357.5d1bdb29@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 10/27/26 00:33, Jakub Kicinski wrote:
> On Thu, 22 Oct 2026 09:57:57 +0200 Maxime Chevallier wrote:
>> Trying to disable the napi threaded state while the napi instance is
>> disabled will hang forever in napi_stop_kthread(), as it waits for
>> NAPIF_STATE_SCHED_THREADED to clear.
> 
> does not apply

Ack, I'll rebase and resend,

Maxime

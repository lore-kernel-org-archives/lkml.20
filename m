Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793213;
	b=4ZX/lNiI4dnHubRg2BYIg63RxCtUUhX/k3k2WyMyTglzpfiD9CpyoF1Ti4nmaF8X8hOm
	 KSJ34MqNPddt1xHsc1XLox365x/IoeHRLtQBcYWTtMODdkCbV/wxlJpmymGWVkzNCcu/s
	 TERVZNdwFHCwHSV1pFvXPXgeokG4DJFl7Vlxm/LektOci8QGdNznrBHWmoV9Pcl2Txj9p
	 lMk2+1e+5QHi7/0KgFt9J1oH15Q7DztOvH7AFxh9GNqnYG2uThH8I9HcMfZUcS5Myco/8
	 my9Tkg5CKpLmUA281DkyJBmq7eIR0B1P1T6S8+Pk3mCoOPIdkrdk1NHje/E2nGC88VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793213;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5TqDmAPgJuafTsAnWzkEPmIGwtMCcwSNaoL7JKelK4w=;
	b=vC3CLj3vzAJiynYw2kpgpt7kuds1Rr+IvircyOR0xtMqOsJwBOgEZ1wPiYy/jEkzrDDY
	 6YqLER0/Usc8MKf4f3rJASXDEvpaBggyT9g8CIOnsv/mHDhfOb5tpNrPf3VaZ6p2tJaOH
	 gnTr2aNmha8hBH5KdRZlWLJiOzR4JiCHCIiWGZBzXglmuJsNOS0LnRcL8qBA3kZ2U7n2S
	 fx985/Fw7iHJcHu3dTQzctEtHL3S+HBsH0dkvvPDSW0mXZei1u8Cwhn0HUb3jum+vkqMU
	 0neVE90F6d/t7S2iHSNoIoS0FklISs7DYJTF4drQM02HKr2YGRE7sSPCsWahfnb2IIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c9V2nK25;
	arc=none smtp.remote-ip=91.218.175.130
Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D6606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666D6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c9V2nK25
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z0vlj2dvSay9d+i0jyaEoA2O1q0ClBn44e832tz7Hs8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793793210; v=1; x=1794398010;
 b=c9V2nK254GqYmY6CyxDuT+guWRpSPnT3SYpJXXBk0erB7gNww77kT6mPCExtj3CZocxNCD9+
 kfVM+fldMkcdSDjs5IBc98JGZy+6EFx1JfNbzW3rNJFiu0aRPV6vGhlbK6JHUki+G067VXXafGX
 wAJG1HytVXlJjI7G2EwigmgY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9ee4f9eb2e8eca8a;
	Wed, 04 Nov 2026 11:53:30 +0000
X-Mizu-Trace-ID: 9ee4f9eb2e8eca8a
X-Migadu-Flow: FLOW_OUT
Message-ID: <dbbf4042-efd1-4465-a034-2932ebfc9d25@linux.dev>
Date: Wed, 4 Nov 2026 12:44:16 +0100
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
Subject: Re: [PATCH v2 5/5] ASoC: rt721-sdca: wait for PDEs to reach PS0 after
 powering them up
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
 <20261103200540.3863272-6-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261103200540.3863272-6-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 21:05, Matthew Schwartz wrote:
> The PDE event handlers write REQUESTED_PS and return, so DAPM unmutes
> the feature unit and the stream starts while the power domain is still
> transitioning. On the ASUS ROG Xbox Ally X20 the first headset mic
> capture after the capture path powers down starts with about 0.45 s
> pinned at full scale, and the DisCo tables give the jack function PDEs
> up to 500 ms to reach PS0.
> 
> Poll ACTUAL_PS with sdca_asoc_pde_poll_actual_ps() after each power up,
> like rt722 does since its DMIC pop noise fix, and use the 500 ms maximum
> for the jack function PDEs. Power down is left alone because ACTUAL_PS
> can stay at PS0 while the data port is still running.

Sounds like the right thing to do

Reviewed-by: Pierre-Louis Bossart <pierre-louis bossart@linux.dev>

IIRC there was a good regmap-related reason why we split the write to
REQUESTED_PS, and the wait on ACTUAL_PS, but the net result is that some
folks don't wait...


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383254;
	b=fBFwtG0SI4MPY/JqPE/XkS6CBEL0QphPF8oPU0vHmisLUOOeIFssEuA/huVMLcgTmk9J
	 HGYI1MKRyt8+cFrhyuHt0x90rA+w3ctLTTdZSADbBuHgbY/QuE/OQiUvJOAIWd6D4pgv/
	 3SBggBjQJNMdc23C/YVNvgQOEQ5ObIU/8PNZK1jQXsTE5dckOrfxBUJvbXcUq6jB1Lpjl
	 xb5EyXHnN60QV3OFZnG1xRHWO9k4X7We6pZd3BfNpScUhOtjtsbmWxbM7Cz90l/0nht2V
	 neKZf4NSLXeq7kSkeAJBFaDprAqph0xu4Brv1aAHFU4t/pcGUK/+GJZvM/o3ir4Je8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383254;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1KdWfyINBDVmpECfzWKG+89sQbKGuIFC389aq0jB6ts=;
	b=K3VqS4MPR0xZsssDQuKEcHglaiqJTdAxaTNyfZTwNDa+RlXgNwQYLdk9X9jYJBgkk+tM
	 O8w8mdfGx+Y6r8yu761ir4aNOEONx8eMBtt+EIotCq6XLgcInRnGzPdEnOsv9MwBKiCHe
	 QtO09fauM+2CvxOHGBeExZhaS1PNblrC+pINEmrbEEpgwR0b0EVyQmkrdu+kxGmV0Y8Dx
	 ID2C1S6OmQ6nlCiTuFwhbxOcgMm5C9ho4enE+tSjNCV9qYtzP1Tg/sSbRgKSPYrpInNP2
	 zBS3FpZAL22d2BtfKlqBmOoSwhcg9Voi5pRwPDmhEpmADjGGlGIUm0+vvnz1CZx4hZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwMH9DPC;
	arc=none smtp.remote-ip=95.215.58.138
Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8866A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwMH9DPC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kptG8gdbXheAZEJtpY4wMBJRt+jn5tdRnTkPgzIw0GQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794383251; v=1; x=1794988051;
 b=DwMH9DPCa5eOtXcy06FUaQs517X35dDhLxNwq947NBZ090ziPDffdVf8/AtGZLdSvNOYG5DB
 Y5JjrlbHjUpckXrBmQwdBI8aPzuzLW2FnsYxDmkT6PwohpiKF2ZbJPqTsVBiyAZ4I4JBQJcx6Rr
 CRt6L+ZpaCyqPFe5uHpvFYUw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43bd11df09fc416e;
	Wed, 11 Nov 2026 07:47:31 +0000
X-Mizu-Trace-ID: 43bd11df09fc416e
X-Migadu-Flow: FLOW_OUT
Message-ID: <7c2574fe-1741-4119-be48-e7d314015787@linux.dev>
Date: Wed, 11 Nov 2026 08:44:43 +0100
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
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Use Disco FEID and FEV to qualify
 firmware filenames
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
 <20261110164807.1671681-2-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261110164807.1671681-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:48, Richard Fitzgerald wrote:
> Include the FunctionExtensionID (FEID) and FunctionExtensionVersion (FEV)
> values from Disco as qualifiers on firmware names. This mechanism is
> required to support new products that use CS35L56/57/62/63.
> 
> Some manufacturers are starting to re-use SSIDs, and the time between
> re-use is decreasing. The SSID is therefore no longer providing the
> unique hardware identifier intended by the PCI spec.

D'oh! It's crazy that with all the technology available it's still
difficult to define unique IDs...

> To ensure that the audio hardware can be uniquely identified, the FEID
> and FEV will be included in the Disco for new products and must be
> used to qualify the firmware filename (unless FEID==0). For products that
> require an SSID match, the combination of SSID, FEID, FEV will be unique.

until the next time when a firmware person doesn't update the DisCo
properties and reuses an ID from a previous device?


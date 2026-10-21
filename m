Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573515;
	b=xQtlgLFGCSsWY5f7MOZn21cQwnwCC8GuvW9VmpF/Yd0NWYsjynb/DRuNgeSsKcjwOliu
	 wYl5NXUbnskvPJ3X8yI+iaYqszy1AsAO65UcqbL04Ab8NxRMU5FkzMre47jILKUvy+bix
	 JdHBPpbtWiV3fDgUfmmKPrPA6ci05UtYxY6HrL2D9tkW/Fdk81mzAEUZW2M9P1840OKJc
	 fKeBYS28naGqw7p2AmYj7NU6p+vHhBepHlW9cp0/5AQEu0nqed+/MLqyXxISus2QOpHNM
	 JBG2K7pSvqf19hix58CWunRvOy9pOPl6rHqBMrk1xD87jDSC+KoWb9xkXOaOl5EyM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573515;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=nXGaEoI+UbOF+7b6Jq55HforZAa8BI4gfRWp0210eB0=;
	b=J62xGSwqvSeMTrrW6/o4SueMnNuhWOeGtpa4yJjUo1UtJ/4x9myruXLVtLqPeqBzVX5e
	 pXHX2rwUAsQlvzKiPFAJOi4WKXngFQ9yPIVZV16Xc1enccWITkRLxWAjo85tFAHX8kGcC
	 x/yq9RB8MfNu95UF0jdVnlhxDL1bZTTUpGVuuKAedIlPuqpi34z8D4vGlI8nknt4EwIIQ
	 DJ4WtdgMlpf8V6D4K6mhH85rM1UXXM58yg2r0y6V6/3ml2CySoxo3o84EOdkeK90TNYou
	 EOlGce8pqkdmx3w+BWPIO+L4hlTbNh2vxpJxPz2y9rjl6NsmQ7N+P5VdAgpEOz/gs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=J5ESv0+F;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A96606A324;
	Wed, 21 Oct 2026 09:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A96606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=J5ESv0+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792573496; x=1793178296; i=markus.elfring@web.de;
	bh=nXGaEoI+UbOF+7b6Jq55HforZAa8BI4gfRWp0210eB0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J5ESv0+Fkgg+F+yhkxrTqPx+/Kw9et3aPvHdgCFTQ1xCJ7isJWQPC46O1Sce389U
	 T3nPeMIylTXkzv5KmkALSvrShCQJRp9ldYeay4jLazbLRKa19F6QGeeT3LrejzTEB
	 5VmDCzMmrqdyNwGJpDGmBgr5o8LURWAJQxaSJxtbMNuF1PclRvho46ILKNSlJw9HN
	 gGkYgktK6RXWERNKgTRbq5ECSZv3dNhHT13MnbNoVaGviJSGIWHY9swUyY+ui/SDj
	 liWZXNYqP7PQRu93eReuAwo+yC3JREOrhdJ5p+4iqw7t7s57HujrYyb9rAkLss/P/
	 dTqZjzGLUg7AqxsqwA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoNV4-1wmNbk0lWy-00onEN; Wed, 21
 Oct 2026 11:04:56 +0200
Message-ID: <0573bfa2-91ec-4647-82ea-fd143dea17d9@web.de>
Date: Wed, 21 Oct 2026 11:04:44 +0200
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
Subject: Re: media: chips-media: wave5: Fix possible ERR_PTR deference
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org
Cc: Jackson Lee <jackson.lee@chipsnmedia.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
 <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
 <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
 <92af2072500ec68990cc643256929044bc54e184.camel@collabora.com>
 <ecdc24931abc4f84bc0bd8e2025f77406ab476b2.camel@collabora.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ecdc24931abc4f84bc0bd8e2025f77406ab476b2.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QZCJrmtNrF/pomJWNd19DR6bVlwhaIi3ikSdCG90bdGVLtV+8CF
 fFpe0+bI8cCqPKqzguTGwBZedJ97FYF/6VPvBAxE05yL7JJJROJS58OaUeXT4QmRD2WbJoq
 0nKENBV6aDstYDI/vxVBlQAcNZbuayduzlZC7bO/IB+bPDkFK/U4SFmgORfT1XEivlmwLms
 xf0Oen50SqnR7UDGWFpwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QK6k3DVLsgE=;8WBX5mhVz1WAb/dVDGuZp5sDcul
 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

> I discovered now that I missed this one in latest fixes batchs, be reassured
> that its not assigned to me in patchwork and will be applied soon.

Do any contributors care still for remaining patch review concerns?

Regards,
Markus

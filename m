Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042639;
	b=KAtpwU5ZloOdQoJ20TxnqC+KudhRUIRAqNm9Jz8iw+bw96CS74qVPqUG2ux0xgoFRrqs
	 NLmpSLDZPGSpa0V7RLr3Htfrran7pWQ/zAH2Z4h+P132ZlN1K9/VIGSsfVTPfzNq4A9ca
	 wpOLMgSmpr6tTkmGWMeEJGjFKuujc5PBtZy/fXQOzT3GGsHMbZWWY6g21CIyakKG283MH
	 S+DuHuqLiSaXt7CMDAJSO5ES9x+7O7D0elVoJIu2fY/JkEAMDyqu6zOioo8CSKeHNyBI9
	 6VOuDjpkJIFscrVi7iWqydP1xbRzncfJOViBi10EJMYbl5ZgPCXK/5iJ/0sAzmPQJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042639;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=glmAhu6cBm93GaJ89+fisQGN1MVgRtvigg3DMVqGHHs=;
	b=jYgi/oG0CVp849JdEp1Itz4cbNX/UCWPNpRWz5dA1JlLSyBVgtHBdFd6nmaFBTtZb7aw
	 1CO7w02cVNvpP0bmhSK8IR2BBenRZnw8GLNk4OW5XQ5Xoe426tATPAIiv4/1yKIcRT11K
	 TotlL2ISRLlNcIpYFvic3VU8UluZDHHwxFlTMcHQf3GGdVXXAoDOo8aG0fGjY9RK95f38
	 psZxVWPnd0rto5jNUon6YVEM6yA21icjeUGzE8ng+we2dhZxDRblJba9Llwfg41I7Setg
	 LUUrSy1ogu3i6dox6CCWO9v9dcuts7w7FiH3xASOJOa9iwFCQ0WVGSGqj2VBm8f9NkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=mWBXQ4hu;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0CF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=mWBXQ4hu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794042626; x=1794647426; i=markus.elfring@web.de;
	bh=glmAhu6cBm93GaJ89+fisQGN1MVgRtvigg3DMVqGHHs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mWBXQ4huz7Fy/1V9gmj+L+W7QOQp0Eyyb6C+qvz39U5YcHxGYJWKRdcJH+KhVtRT
	 V0YQl2GpgrcBb+M5r881v+p6nT1fNdNuNwOJdbiaz4HtjsZCyFgh7Nczs5g+2wkWY
	 P4EApvnng+ZrCIZd7Sxj43Ep5A1C1N+7WBve/p9GxPGsBFpY+S3XBxlgCxudkq3+3
	 vB4nv76+/qsaOoIj+yaY5Y3iW746QueoFCOoxEu2QT/v9kcUuX5z060gCl3tmHSIU
	 0UvgdPEzlGO7M05cwvlDHcw2WUKoBY55nbC0AmnUoE/VdJKv6utJ1hOPZUKFVyT4w
	 aIPItcLaT7zbuiJ1Dw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mw9x2-1wXWNy292q-018GD1; Sat, 07
 Nov 2026 10:10:26 +0100
Message-ID: <f453b06d-20d4-4781-a2aa-48fbdff1206c@web.de>
Date: Sat, 7 Nov 2026 10:10:11 +0100
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
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] [PATCH] coccinelle: api: add a checker for device nodes
 in devm_ memory
To: Chad Aldreda <ca@modelmiser.com>, cocci@inria.fr, tools@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall
 <julia.lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com>
 <5f30dd50-a764-8e8-8b27-5c26ad10a7dd@inria.fr>
Content-Language: en-GB, de-DE
In-Reply-To: <5f30dd50-a764-8e8-8b27-5c26ad10a7dd@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VbS9fPPQHMwoUY/92smz0i3bafqFtbvOyrVfp39XhH74rM8N+DB
 WrEbCbdznumJlI79oilTM7jlWXgDXwOionj6k3DjSiNDcFK0O4csgoN3B3s9h5dtMrr04ok
 ddh7NrA7sVdubMkUXU0LigAnsC9oLnrQ+XEnPJNNUh6E9ylW4zkM9wIhk6YASPEkqalKdYx
 wh1IYOay4SqM/1cy5e+EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9QdrGdG20Xc=;0RNeuG/i/N9SijMKdfhy+8eMV/5
 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
 QI1xjL5rK63POSNURyfstf9A

>> +@alloc depends on org || report exists@
> Since you only support org and report, you don't really need depends on
> org || report everywhere.

Would you get into the mood to collaborate with all known coccicheck operation modes?

Regards,
Markus

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850774;
	b=GiBbKFCYttNoCBqqw1blu/JcLkeoPiXeVuHRXcBQJ3qmv/s+4tkUvhVT2fSfib+pIYLZ
	 8BpEtY8ucfzQC2PddKQJ0O03djd+Pg1D7yZzHsLwfo5OJy+tNFUcn6Nq4Q+lSclwooHAk
	 jWI5RXQcZ19+8/cDFH00n8VI40hdfhVopZ0yNkvOFbRE0+RnLNY2scUeKu9se0FkrgXzz
	 vfUJ3HoM0t+zwlSDl3xEHiOIzxWTTQGSyIK0QFITq88qWvidMSPPSKdPMR2YpDPcCNNMD
	 xdxkrN+kT5aqSgDuar9iK51N5h0XUG22g5ABLP1zxkDYdQEmPk/BLYVPztW5idWPsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
	b=WhOMt0EGFPZbkqNaAeBdesGXkWHSi3vsswMZZ+FOY6H133qI+6ceu16hrt0h42FmG+Wz
	 2iUMulpAWzTI1H212/fWxwuBcoM57Af3aVrbjURXQAEdL0c86L8ldJmPnVZ2dPKY8XouC
	 VXFblt5RES6ebyY7KWS9cVYpeWGKdkX0EaVdB0yTDKKlhksOiJdvvDlo1e1GnGrzTkZCJ
	 UEUSaCi+DgCqAM4ZEij2eA2euMJYyCcL+ELgFOjbUZ8tYSkZK8M9gcEu9z8tdxBg4WkYl
	 3CeuKCfrrPAABddrkbr+EjLc41RCIqmVfyboNX4CKCrnquvwuqJp1zYBWL8eBqw5+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40843606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40843606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1664080b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850772; x=1795455572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=txMlmAShpsuPhoJ/7M+0e78MAWKLvh4/QsrbUYFSF1VCz+gFDDAcDwamsObcovXaFs
         VgpNyUsYnBMHulTgRUwpDg6F8ZRZJJ67LWhNGJg068/HcE2PzukhV1HbBcjs0W0qgQ8d
         x99n2h1iF10HBDa7d53PhPQFFiCgoDschMCey2NVBbxpFVn3thHs5lOArB3q7k31Vnpe
         7sZaqskDDaMVi5CAxlZJyuAukg3Nr+p08iJ61Nx/Xxq1GM3E8ButNcb857y/WxPE1nSH
         DKgiJ3xCB87jLB3Lso97g0Ix52VwmRajzGdfCKY9cj3miKs4hgyPCU4mmpUaPypIw8pz
         QjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850772; x=1795455572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=f6hwaPtgFROspWDzCNf5BkFdGWsZ89OyDp3JJ4eCoA9dNWnY7GCPYBjEPi55XHOgvZ
         xBTNSbkqMUq+r/5U8avxyAVLVktHNUf11zSVvfOdmwdOEAJJKzeXiEA0IZtEzpjqyU/L
         zR38wC1g/1QayiKmpt62mcRdWwq1ul3xxi11R3EhIvTMD1c6v7ZdxWSmgsFqPrmnZ6S9
         nzIFG3vBLnhExKey+CiNG72PqnM+8JTQL1tuPQPrOTlY0ULVvbfuSBu2ZdXjo1slyLiy
         g3WG8WISx7bzjK+t1T34A4qpCN52beJtFBidmVRi2GCA8qT4AGD2Y9uryeiaaenua2dr
         jVCA==
X-Forwarded-Encrypted: i=1; AL+hErE0xgclyXcH2VWK75khnBRYC/NyBoGieDpgDbodlpdVLundsNK3ZXYpcI6SEv22lLVQcMDhSpqdZNjCKFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fafyuS5nR0UP2r+4w3lsdTcuiRCrwuJHno0RaOTwwFS/CUWNU
	QYHUxOTens9O0fCIaB13i3ZZ2StTxwB3uDVUa5Nz9ShpUKqiZ8fzInbm
X-Gm-Gg: AYBFou1iFkizWuvkDHIgWMy+4yJWn1EMAwbwCnqf7+iGnvNcsLcLnzq6fF9JU7tzhyO
	6i9boE2uaQIkKmgrQ8kdQ2MfdtPgSoZvcObccqfLX7r5WDIfsWxC9L8gCZaMmQNEfiDY7lKbwzU
	X2sV+GGN2E5mF+Ab2KRD8HRQxESJ/AYU1sxku941jYdsDJWN0I+rYpUqMMtkcvpu0rf1reZ0Ndq
	vzenwRWlpkxK2lEpKteKAYPr448w2dx7X2vI8z1lAG/mqW5nhWI28/rpZdhMMKcUvaI0++VzMim
	O9rpbwKHUy7gCPtjj87+JHEO0IzuODdIgxR/JyB4AJoLslauk/FWiG0XeTMdsATv2tN13VVC6RH
	8WpQ82m7ZfonwodcrHKG7Uujh3FIOEJqLTZftR/KKflOJffSJKedJy2MGgdNg0Wd4kYoigiPlzw
	n+CODeeconiXNy3Kzr5L3BSfJkgaPEbx6n4AmCIAJktshU+AanupuNOYOpwXP/SBE3W1gh1a1Lu
	ytWWSxneUNeQFyIPuSnAm1I9IVWEc4BQoCipg9BS3wic8YunKzxZQ5MgkxH1z4FBJ4wBEUVdS51
	WGbarBQwJdjT2fyMknDuWS554KePToFR8B4Ymgp//QWTcuggOB36t0oa
X-Received: by 2002:a05:6a00:1989:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8beb753d177mr10045044b3a.46.1794850772361;
        Mon, 16 Nov 2026 09:39:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3920789b3a.47.2026.11.16.09.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:39:31 -0800 (PST)
Message-ID: <382e993f-cd76-4f47-a7ef-33c2fa00d1e3@gmail.com>
Date: Mon, 16 Nov 2026 09:39:30 -0800
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
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 08:07, Paul Cercueil wrote:
> Le vendredi 13 novembre 2026 à 11:08 -0800, Florian Fainelli a écrit :
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Add support for the second XBurst core on the JZ4780, based on Zhou
>> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
>> Use the CP0 mailboxes for inter-processor interrupts. Initialize CPU
>> presence and core IDs explicitly for generic kernels, and reject CPU
>> offlining until CPU teardown and restart are implemented.
>>
>> XBurst stops its private cache clock when executing WAIT. Write back
>> the data cache before entering idle so that the other core can access
>> data belonging to the sleeping core. Select this wait handler only when
>> multiple CPUs are possible, and check pending work after the cache flush.
>>
>> Enable the secondary clock outside the raw SMP lock. Use the CKSEG
>> aliases and pointer-sized assembly helpers for generic 64-bit builds.
>> Development and build/CI20 boot validation used Codex assistance; Sashiko
>> AI review identified the locking, topology and generic-kernel issues.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> 
> Good job cleaning that up.

Thanks Paul, Sashiko still had some feedback so there might be a v7, 
looking at the comments to decide.
-- 
Florian

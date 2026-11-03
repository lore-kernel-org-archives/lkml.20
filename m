Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714404;
	b=w+CliyiPg3cn5TsuyMJH3e9TaXwCWHg03GmfKsHjH3+fulx9bDCmrmzPYxhxFEbECuJj
	 UeoZTWMk8dDUoAR5WPyvIHGrcsKpF8FjtO1RLLMmhaECiLbDrGM8dMuxfL6aXUWrlTei2
	 66VAPGDjwkbIOyK4ANwGoUKcz04uSt7IalO/O/6QdSpFQscVwOlKDEh5p2Qa3n6tqv8jD
	 CpgKJumReKYvG0YbaWKB+X7tpNqx15o+fzWdctJXQiSMv0aEtalqLmJ4ne4/kQ8NDc6gE
	 s8rAtEru76omNzpgX33Z2c+QnxWVvbFVBsJY8GB1qjSHMUQ79r+15dUe6zzdMt4NE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
	b=h8w5KOwKi+57kNjViUn82t1FrMsU2sFyGEJl7kWSTiRVP1cyTCCaGdpGONQfBkdJKNxx
	 2m5DI6uIilE3m3uf3iEhYvozAI1kRFtKf0hl86sr0ARXnUj/76GOQvbNYPtfpbjd/66od
	 L+GNad9Bpjyt7ttSQREDjwiEOTGk+z/9naf4HFX30jqIsKkWVd48eVo8ysrFWnq8Jptog
	 qoF9UzFCz4GfIuyyyp+htNaZXeewqu80ZRUKNT/832JRwuFqvieFqt61y+aRmgYmD+1GW
	 OQzBToYzJnPbF83LZNZObtJl+lCXOViC5pAG9/nrqjEabr/GYSyLZ5AfTrMtQodwnSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsXp1poO;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101B60A2600
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3101B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsXp1poO
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3284355a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714403; x=1794319203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=ugsuqFfxYj0QolIblezPrnFIM+9CBnhHEJXKOFde/gtY3DaWwJgy62zwuPX7JHDdMh
         c+08W/89OupdRnufK1TS6sfuZyDDLRTVMtfVkohgWvfsKBOP/wuvWtLEpYDTjo7DoU1+
         +PDFtcEE3nU2a8NY8shtmFuME7wt/PnIGpBq+Wsf4ypWHNPZWQquvCWlPus+yzmpdL07
         9jMFS+tT5NvlLC8b2ZLQ42NVdMBl9/g+UzwW0X+2Mg7pG6TN9zfPjk3R3ErqOz83nFZN
         IlOI8a0kYn3vkDFzmN5x9NJLi/UTT3Vsyo1hJXnEpYaP6t6dwIuIumbCZJiRef/6oyua
         e9xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuuxCvlpk1YVSnbwLg+TkdfFqZ0CxT2ikM+zSt1ek6rm7HNQ09vxEOU13eU0q6kvjYlehKHKdRzWIrYWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kotEeDJ6IYBAGtU8MtDBsd3fXew4Ve16kx47ozQ0OrMosjGcO
	/2RDiW45rwa8ourBGnNe6aUSu5nFzfmSTHc9iHwjp9Zng1EkJm7lgTyViRYD6UochYeX22B00MG
	A5AVL4XSGOfPKTg/Vfl4b1J0pQshYKanHUwbMRc3lO4Bqh+kwFaZExojxFNe/GZaJDwHRiXFlje
	Xml9XMLEi4UHVEpOxwu8s/aDq9e5Qndkf+7x5Jq8DCDzJ7cSDSs0woiabTN3a6LY5tro3fjrNRe
	Qu+X7h6CiNfZ9G+Ug0Mkvdnpw==
X-Gm-Gg: AYBFou1WtIh6INYS5ScojxnSN6ClAcd1PBtykJivy8XwaavPLgVUoohBgkaeC3VWBN9
	eXiNWBXyupstDc5bvtQGRUTEp6V19wtrB+kJz5z3x1pvfZGxHgzT8YEDq63TW4fzJfXLSrYwhxj
	BQ+snGxLte7X4DJ0vU6alk3QbhShJCksxdv//5UXAs/moFrY1bldxPB2ePH3xsGf/baxFVzkQtr
	DN3eDkQnr2bt0ZntZgXAI1h2GJrZP2KPi5nRRWwlwguj33vglkO6xxHiGT2p9qea6nlIkVqMPYr
	nxgh3iWi/k0a449kmqAQqE+88YYCC2Xp0sL9DR7d1aHgb/RstP31xqYhgr6I7maOVDyAre1O3Yi
	8u82sPl8XV+SMJrpZeKeD/90VptybrjmT2s9aciGYkNaRQUTth15FqAwkY2buw0/JTMOzaTsB7V
	7W7Fk6bLknru/z/OtLi2dt4jd0BSlt7pW7z3Zk6lM=
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae89850a1amr10702669a91.51.1793714403237;
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c7dc5cesm1903222a91.2.2026.11.03.06.00.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso2140049c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714401; x=1794319201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=bsXp1poOV8qg0cdbZn14/0NL6F0eOk7Sdr1LkDO9dbMo6UXkRW/NLAOXRO6+WfO+lx
         pu36WNwOA7kC/Iw9V+lo5rjvl2fqueUMYHKEZ0aNte0ohmIvIkppUOkxQ8hm+5VO5QaZ
         egCnHKiH1Ulv97Ufza+R/mTLjWUpAOiCdSeRs=
X-Forwarded-Encrypted: i=1; AKwUvByzZ1VCwNltOhjs4NqfZSl1b75gR+d5MvoM7NskcG0xI7UG812f1Q2I/eXvsb5QUwcoZfQyaBlQm9DlIR8=@vger.kernel.org
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495791c88.23.1793714401204;
        Tue, 03 Nov 2026 06:00:01 -0800 (PST)
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495751c88.23.1793714400382;
        Tue, 03 Nov 2026 06:00:00 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:59 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 12/13] wifi: brcmfmac: Handle extended PMK command payloads
Date: Tue,  3 Nov 2026 14:58:56 +0100
Message-ID: <20261103135856.3676311-13-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:47 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware rejects the legacy BRCMF_C_SET_WSEC_PMK payload despite
> advertising firmware supplicant support.
>
> Add the extended PMK layout. Try the legacy payload first when the key
> fits, and retry with the extended layout only after -EBADE. Use the
> extended layout directly for larger keys and reject keys that exceed its
> capacity.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 39 ++++++++++++++++------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 18 ++++++++++
>  2 files changed, 46 insertions(+), 11 deletions(-)

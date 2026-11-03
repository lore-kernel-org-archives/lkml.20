Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714357;
	b=MYaUysZw2j9EL5pDZ8RMoLyYFNKCbvMl3Ww3fxSpOC1m466EhYB2sY4zwSfWBGzBP5vr
	 v0yKl9kK5lw00gDaabkLIDSl1Aw3piajQhLxApK3jPt7YfTHE5IMV6+Nvrnj6hvg3G2Az
	 zhvmI4kfNFq3qCAaO28D+jJxxaV45cBNUnZkshNPACSduYBFCwr16Qlf4vpAY4/rx4REt
	 svYf28maXlGdArJulKgfxb7sxh6+8i6w/OSXM0oeQbu+ecD3Zc+VIxgY0p7RXtrOxrJ6Z
	 LCtZ9ok1Dk5mpw4LQFhy4Up0/JfeWDRkW+h1/B+xCjTB38pUUPCjFrfYM2pEwMKb1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714357;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
	b=0pIMgF0r5FhanwyKIXVMYC6Kkhn30JXSz0Va6Xudu/S6fEazmJvk1gPRM2vgIjApiQyS
	 uBuUjNH5B5rzjxCw2FxWYw/86M69LcSqKEiNZp96j1MU8uAHohe2ksjFjeIx4Y50UL753
	 61uSUySHroV6NSECk1IEYQtFmk7GPyVxv1s6FxwQlSP4FyIXpbh/04MoINFwO2nv0nYMX
	 FhR7QytnY8JT+KAsfHsjMZ0LJFtPU9EihYSH3nTYAokipvKYb29jG0xH1iIQ2/7HDLiEn
	 7owC11KOsR5nyt/aoAgCr4iusj6+RH8Ioh0DJwG5sPO+wV07DNAazyw/aioWV7xzG8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EqGmpEv6;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23B606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F23B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EqGmpEv6
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso393056a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714357; x=1794319157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=CMT26BlSrRydhbk0K65BU/P2kgzG0WgE26B3y0YeTn+0Gip+iFxCLO1oJ+BvGvc1zv
         kjl8yeMDX3b3bbws9X8KE2tBIltIRKy0gqXJMZVS6We7X/jzufJRONc7XmmJwalR1vyx
         QmNTzPbDJPPrGr7H+MQAKAeDY20sRfikDOytm5ksUxJ74X61IiYu8a9i5oGGb5/zwlnp
         gWNZ2KPaieUoF/Gg1M2y8zTHAzlSOyUpmQLjk4M5yX6tvUedKGvgKqak+lSXbXazGyVJ
         6307cOabgyESTsRpw28yPLekkDbKCEKMS440NywOxmruYiZEZ+ytq2fel5xLpRS+XlPy
         8HzA==
X-Forwarded-Encrypted: i=1; AKwUvBwcL5e5G7oNh0WbDwAYvEgEyX4nyDUIuxXGov/6GWy7zpQmlaO/VPLWBP0zYgKG7P+PhIE5Ts+96hRg9OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SNdt81Bs7UnqDb5h1TK6b235x8OhYbNL9Dud0kdMEM1V18eWC
	0Y9/zGVH3GD8QAZRuQqET+D5j4urlJ/zDgMshtFnRDf2jllFcCI0Vr4EghXDa5Vwrt5VidkyCdU
	kit7D9ux54OYaqHeiBoHDwkZK2BtTZZYVPBPD5Ir15u5Whm/RJedTMQ4lO4V2TFBb9Yb7J5cILE
	mbscqjzT1cFH7qbMHdsTIP6+FHOAPUJkDdmR6hw1Q/GW91RKaXjadb+k9dzBKEkQoZJvrN3GZPJ
	40G9q/w3vmAzVH1vhJjX4g=
X-Gm-Gg: AYBFou0cGveucxTa5N2F2+REzejWMDn7SWzfw7Pl4Gm02+utURFo4OGeRgiDoxV6spi
	L67zO+stpqw6miou5W1U86C10tgEEREURV1Qbg50AynREQG3J8M4AYWBtqZbmV0FEHMr6GbK5n8
	p7Mnwyl0/lOhDYwrNOvmujUOT7q1aoi6r0nymwS9XCYpZNFUA6NWSAoatR4+yrH9+vofVJVSGJ2
	EC/z9tSW1gWMUPsPCFFMdz+C5Qg3azjWVTrJLGHBqXW5NF4K3ngl+AqQtmFxlLwIZp64JG/p6FN
	SpOnT6UPnl+xgy0VbkbjAvmZ1hZwUJMiksd4chM3TOCrv9Tnx2zPTe9GUDt/46ApTlfpHY8NE7X
	1U1n9xWPAjMKYgQ9xWaO1HSMB7ofSOxblLBW7UFpqsdhHYp+zFgNh+5CSj1pC/xhK/fHn8nPbsE
	HJxYZP7vx6MpodS/9T5J2KVjCpKF7L5xNLhEnWPt0=
X-Received: by 2002:a17:90b:2b47:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ae897cfe6dmr7634800a91.41.1793714356513;
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c7dc5cesm1901913a91.2.2026.11.03.05.59.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ab289bb41eso474654c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714355; x=1794319155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=EqGmpEv6Uifhv7En22atUOes1uvdDqxZ6XccAiwoodEK0HrXblsV2WcYHL+WXzATLp
         vxJ+bkZOlBEr+zsp1KmM0vm3P4EwxJqb3B0a0tFd5nwUh0kmn9a/Eq7FWzAy7hBOAYPI
         pSQyxlGssdlApZ4g4TXfQwJeapvaxWZQnXDPA=
X-Forwarded-Encrypted: i=1; AKwUvBxFrEXbPHVUpaxYR9eR6MA5uCJuIfxUxUpMQtUxHo6Ldc6qcptsQHAi/RqP552mZ9FaGKyJCkcgBSCHO3Q=@vger.kernel.org
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954573c88.0.1793714354627;
        Tue, 03 Nov 2026 05:59:14 -0800 (PST)
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954509c88.0.1793714353901;
        Tue, 03 Nov 2026 05:59:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:11 -0800 (PST)
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
Subject: Re: [PATCH 02/13] wifi: brcmfmac: Match complete firmware capability names
Date: Tue,  3 Nov 2026 14:58:46 +0100
Message-ID: <20261103135856.3676311-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:37 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware advertises "hp2p" without advertising "p2p". Substring
> matching incorrectly treats "hp2p" as P2P support, causing userspace to
> attempt Wi-Fi Direct interface creation that the firmware rejects.
>
> Match complete whitespace-separated capability names instead. Remove the
> trailing-space workarounds for SAE and FBT and reserve a terminating
> byte outside the firmware response buffer.
>
> Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware command")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c   | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714381;
	b=MNLZBdyo6KQI6saQBonR8POAsYWHt2h7HPZ9ifV/GYn3WBDJH4+b8bzxHW/7rWWGFPvZ
	 pXOV4GtbTI+LYr02oM+LMvRKrX49CcLtHniyktDU12HuIuOMIfHx6CzahI6/DUw03fraf
	 KEPfRxkTWvqViutbB7R9r7g6hzd9ZAKb63x3IHj1TnGudiRu2yrBs7TSQ3us5XWUKoMxA
	 +buWtuoIYDbcnjv1ev6ycc10KDphrN5Jc2z6OYXKchq3giDc4UEOYLVuXH3azwJZflC5W
	 inJhAcwySOM/4/78yoLgL4ZDPUJL0QfJCr9xC6yxeuSEBzhju12B4H49TVko0bhxIRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714381;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
	b=ngKY5DGkHYcgiiEFQslkt24t5YHmwglog9POHtCznVCQOKBsDEUa/M8wEkKb0ghS0AAe
	 /oekqahWtnM7KLF/0wbWSGA8o3PykZZY5xbMu6WVPGfvfIZw58qshvm8Yz3HE4R8bUcBT
	 PdKWdOz0YraaGffHq+l4pJqNbdpf4QzfyymyDNAC+hIb1u3kqHYXeg3yXFspIyfcuRB01
	 NKVv5jhR2C7nsgtbjp3R3dCO6bR7GwIG9xUMyXZfUPF9qdFe4D6MwJukNeSLGQKRnVteI
	 65Q33TUybf+M5haXA0EpBXDVV7Gq47oflp8OoH9W0x+QUo20UgW9snB1wBkNgk6eMcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DJTRDrQE;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAF606D82A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7CAF606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DJTRDrQE
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so2300389a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714380; x=1794319180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=xDj3WO0Y/NxD02XN62zK10jJPZ+cHIetcy45erHs568gz462Va5lmDhKh0+QAZxRQw
         pi9/sPTkv2vlwwpdBkB70qLan54GA0C5MiwRQPhMxwf2750hFVNQ8EDuCtoX+nNan7Ax
         HzBtpYNE7Mxm2yIRqKT7gcsbbYJK6tbMeV8KDLZOjVgf9KojMORRnB1vAvFaMazvzmbi
         skJHWtvLr62uavVyzB0IjN1z9gqPpTKMLyILxiWH9uUHTjqC2TrHfsyVtlFsh4QEJtZf
         2lJ/x8Oz8GqiDtqGgqMeEdZqOwA4EEDiZz5Zg6IGV3K9oVXgReoYki+FpBhJd74Jr4Ma
         oEnw==
X-Forwarded-Encrypted: i=1; AKwUvBxcbUtPNP7IVqb+C/RL5eVTsxTCirzNgtbAcFfwnbYEAdglZffx8q4MCRpkCSMSlLXjLL18UbFmIy1XmlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WJ9GoMwnawXwyEMN0Cgr41PZdQ/c4dUvJGClIumHdJ1mzVhfN
	GUzbFOrFfrgZaXex/4vqi8MI+jc3Un83SfYpHlo75KkVI0muEARA3SCvlwRW0HuIZqbLUNXei1i
	rrJcqncqZxrq/HDdHIbgxh3SaGCj3sxJyEjvNULFi5DbRuO8Ivo5wj6JP8yCiS9PEq1kAoCCjSu
	y7RA7PRls2JRjVaxj9hZ7u3t74VnreASApURmJsSs52zWrpxuUd3cwbZjOFLmbpqf6S3yc+MefV
	SIaUVw3edqZHpZMiGW13qHB9g==
X-Gm-Gg: AYBFou3/bnEfHp+Y0vQnzXUg+kX6Y5bGP/xdNR38MmM4y3u68fznpV1GtkyX2CjUTa3
	sOnxTc8UOhQLQtKUY9Iurd45Gl8liaaziWTpqGkoNM4d3zmJ9cVUrEppFONeQD5BjnQ9g0dgn8A
	Mre9AGGIr0b7ezak5+EhvRv8KOCKAiT9klM24MGrsQYSfB8/aAGpPHJ7yb21iOZSg/hsEUVu61u
	6pAI3JG7dDt+95D0rXFCRU6hVWL28ju8wnrGpdASPGjahY+y5dCvX51sllzYFIJLu0MkSezzG/m
	BGJrO7EndaWjK9KxNBZA9ZYEUAnqYb3FX6BzzzF390uD+P1Y39GLEXaHOjSZ6EEFbep5jaS0DPL
	mVoRJrI1eok6eIfWeOrQhdq02pqz53Xzq4YlGKSIAvpSE0BsTIz5LoKEB7WmgUH9nBZ/bK8zcmz
	93Xe9LPfRuAlOGONBRkdslpyCWiKybo2rCFa8ovEY=
X-Received: by 2002:a17:90a:f985:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3aea5314ea6mr5616950a91.7.1793714379401;
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c827368sm1920315a91.3.2026.11.03.05.59.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1110296c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714377; x=1794319177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=DJTRDrQE9CSBjMdmNiYsEU9rs3mvWVLU5TvDgrPuUqS5DhbhiTEUxSRk+zGBOy86Nn
         B7X/AOOaAr6Lr9nqUFDexws2pujz+fX3B5RSu7bKi0x1E90qSCzf0erAKWIpGDAyl8BW
         HZPfR14xfysCVmrBsEkPrf8yTyIs7kePmNnzA=
X-Forwarded-Encrypted: i=1; AKwUvBw7M8I3WssD+xfAYfmv9OzB7BTGTttzjk1e9aNZwrUsB92X59YXscODUe2s2+Au11Ij6jFMlt7g+57Xkz4=@vger.kernel.org
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855342c88.19.1793714377478;
        Tue, 03 Nov 2026 05:59:37 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855289c88.19.1793714376827;
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
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
Subject: Re: [PATCH 10/13] wifi: brcmfmac: Support versioned scan parameter layouts
Date: Tue,  3 Nov 2026 14:58:51 +0100
Message-ID: <20261103135856.3676311-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:45 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Daniel Berlin <dberlin@dberlin.org>
>
> Newer firmware uses scan parameter layouts with version headers, wider
> scan flags, and additional fields. Requests must match the layout
> expected by firmware.
>
> Select builders for versions 1 through 4 from the scan_ver response and
> use the selected layout for both scan requests and aborts. Fall back to
> version 1 when version discovery is unavailable.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 203 ++--------
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  17 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  46 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  65 ++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  7 files changed, 594 insertions(+), 167 deletions(-)

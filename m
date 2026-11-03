Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714395;
	b=xcSCX944AbmfI466qyB6oDlVtRHa27lZ0yNEBSWSQznh4sGJZ+VRYpsvgAQdcu+RBGVt
	 jrtCTkJNz2mTjKVuGQgSEnmMpnbCCRD/ylPMNjcWz0V26/1XaFmu7OxgiO+J844MIHHPa
	 fOLfl4Slfu+BRgeltTj/0LVpKRD5szd2Rswn+38+YbSTjEnpxb+dcHG1ik04zN8xtDq0T
	 ZQ7wf3tZX6FPM2b71Q4FnzP+UUvnP5B2U00CXfk6+M7qDpd9Ac0sFLXuHsPNO4L3Vlu4O
	 pvtzHPz0YkU2vbQT/WVAuwFUJOwoA06KnoKCfyqMpMclXZV5zluF8eH0YTAH5FA13gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
	b=NJ7q8uzVDadU7JBGYLpnThyyZAHXwQji30hvPGtY5tfZ4dO1FB6itET2s/LkKJ9YP76l
	 X9KiZQxGgENUkdxMN7ycIrT/VBwEdq6Tb1Ii0R5fTRdCchXwE0SR5lefUGKYvPMR+EBXq
	 LmUZX7oTMBcBgGVJI7VbfLgI24tUFsCwoqW46yamIlVF5rSStApQqrtAuNZKzec4clWBP
	 KhNZFR/UumiS3PC+j59Z+2DIIMCayZo1veAmgIQ3V16Tt0yY7fr0dr5r7pG+aFHk5CfHs
	 hhvjeVU80vMpAx3md2IMS5zaLR9bvKjMMOqTD0EJOJonutc5x+qTZNYQ9VuD+ogz6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Ir+iDq/x";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA5606D83E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAA5606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ir+iDq/x
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso2088609a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714394; x=1794319194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=p0BEEolH9iqJqUAsPfKK7WFITP85TiymK7237XdEVocFNRIf718gA9apVUSVxJcAI9
         66d0jRtqcvYPsrXWVyab1Mj8jTzNE3g7iJrEbrCWc6jWZGI137whdCnPvidK+DFN+W2P
         62zYhefXTLcTz39oNLPUH/KgruvrQ+NkN/gLBLgOPLQiNFAsAeKfCkspvkeYP+GWD+hP
         /6k9TxHKAwpWJjRpP7WrxTLUooYYmDpittPXz3/g1OIYChS2jv0EejBJyq+w0+ch03P+
         goRnY66xbQzPkghNRP8Bs41tIAz80IVthLT3ob5scv6/uCD12k/9G/T7LXXN4C9ahwDA
         XvBA==
X-Forwarded-Encrypted: i=1; AKwUvBxFvLMa4l/xB6/X8dxah4Wm6ob6Ma+s6naLUpsqLMm+kDrUizka1gOcYQM/elAJi0l+p+qU9DOuEoaYQsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NXM1DZbG3bSnd6mFnA0rAe+yoOG69DNJIE9eNslC9ho4/7bDp
	51AvgX4O9SJtIs7qoUd50HKNvS54qhxbDl8b913LzIJBXfbtyFW3IXkQrwu7qu7wWHWWME+wdpy
	EyFgKKhvPIMXVCGFmZqaouuIXDETFr+0pYbB5e1o3Zkbvu4ZgYkzjiq6d+/HhyznBwIuC3M0Zj2
	xdsunGC04oQnblL6Rat/YI71GIOA1a7hQEX/P1kpb0JBZ40Cf1vinUOAda2YRezSWeCrUM8ASph
	dsRa0FRxO79Z5N+Uvk3OVIzXQ==
X-Gm-Gg: AYBFou1fiBqALUr0i9E4URp6mMHth8f8SbGa4O6aGBWs0vKBhbJ76ID8UoK6fA3MeXe
	vpjIeuXehlEkdCPG5jthWb49Art1zJaG0a1cIWNFS3ZKheWqhuhGodb0IureiChx1D7b/nxGD9g
	iyR39tEgzgnk4LKL2TFB2yUarU/cCncQEjRUMYJO49s5pceGFuyWmGevVmRhe8FwxRt2cwX2klU
	/V2SED67J3KHZJyEKXJg+emCjOMYS2o/T5y95J3lSL6Kiq7jKb7J53sSrbAZ4wszIOEPrLMlYf6
	0R/ldS4JC4t6PCE+m8xf8DRNVGkKBcDBol+fnQyAmUeCPxoxUPagOlAWIcO0bJi2+RFHaca766m
	uMPXCUY+PRZkXIsCtjHdeY71jkMN+7bzH6U7bNF7Adx8rSFI7h/U8gT1PzV3/zPELiyi633bCs/
	97UlVp9kNAIKHj8Vbq/IwlBtGidlJrxhGeuEKNJU0=
X-Received: by 2002:a17:90b:3882:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae89776869mr9443304a91.17.1793714394221;
        Tue, 03 Nov 2026 05:59:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae87f36f06sm3383556a91.2.2026.11.03.05.59.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so8108047eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714392; x=1794319192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=Ir+iDq/xiO6xCn6mnXr/0NRhsA0/MegfrRxIQaWgLmnp6ae3A59/41UTHw8v4vcl+p
         DwQiYn2r6u9ZTyjIjMrv3/GLN5k0iwkzYTKfAzNxYxSnPKB940fLE38+kX5NJxPv4wE7
         KKHcG2DTbW/i84JFn1K3XMHBRYLtCZamQioZA=
X-Forwarded-Encrypted: i=1; AKwUvByJWi7QNnf5p7+R9qKEgRz2Xzyz3yDaakyoaVpeBMRSZecKwoureU+K67iPu/kBfSbUb3PWblUG4LUmsMs=@vger.kernel.org
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949728c88.3.1793714392093;
        Tue, 03 Nov 2026 05:59:52 -0800 (PST)
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949684c88.3.1793714391367;
        Tue, 03 Nov 2026 05:59:51 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:50 -0800 (PST)
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
Subject: Re: [PATCH 13/13] wifi: brcmfmac: Add BCM4388 support
Date: Tue,  3 Nov 2026 14:58:54 +0100
Message-ID: <20261103135856.3676311-11-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:48 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Add BCM4388 firmware mappings, RAM base and OTP handling, and increase
> the RX posting and completion ring capacities to 2048 items.
>
> On BCM4388, DMA_FROM_DEVICE mappings for posted receive buffers cause
> DART read-permission faults followed by firmware DMA failure. Map these
> buffers with DMA_BIDIRECTIONAL to allow device reads as well as writes.
> Keep the existing mapping direction for other chips.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c      |  1 +
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c    |  8 +++++---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h    |  4 ++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c      | 12 +++++++++++-
>  .../net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h    |  2 ++
>  5 files changed, 21 insertions(+), 6 deletions(-)

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714400;
	b=UvOgX6LC3U3kkqWV+Rzxy11vxd29id9AHW5UOHfwYEfDW8KCXzlnR3MH2NTLzpQNrFbm
	 /LbqERj5ILv/onqig08EukJZWV+jajOvhxwnThu7rlBhvoouamV+6Evn1AFcLzD6btnwp
	 BUj+36sk1mKl+vohNvvUseb5YmUGTJM/y1gsujih7RaiOVN4kfHoLxMlWPvbkWB22v+kT
	 GFZHTcX+K1VlMlPUswd5ZB9buJ0+IjBullHf19PQwVZb7MLy1AQj+KF3NN6hgTsdhQS5v
	 vxKQgspSwF/w8lSkIGZ94d8DYQ6xBYTP1e/zQUF0OAlJl80wm9n75W3i8fDEunxc9Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
	b=26S+/cZmQjyZYukm4wB//um8HDk4QD+uQIH+HjCcF4SH/glddQx2PaNaqyjSXCbolpc/
	 Tp9jTH8a83JSlXpiyK/Fo4FjF+pCGtZOgbSG6yRQykREYzI9Cy+KaGom0/Wl8WDBZrMkA
	 OaLHymBExoTAhCPg5raiBu0T9PXez7qLH+hUEp8LZeTEsoSpyPZ2Qox4MMCEIthKirWDp
	 pEkrnN/Aci+7nZdRIV+gPR9juhQSu5rLX27aMG6wgtxxlWDSq+ZFIXazWTDCWxlfrNFQ9
	 FHCK4LMtxIBp1H6Yfyr77nWrKH4v+V7bf1MoC1uY8+cq2+PAU9Y8VUzsHOgxhlDzSsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LG3GQdL8;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C40608508B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C40608508B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LG3GQdL8
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so318402a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714399; x=1794319199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=IlZ5FPf+TZHD4FqdNrv4Y/9V2w00LQKXZLxxIgoke8kOSlYO64TcxMLcO6JXpLcE+1
         2S5pK4Rjk7/wB/WzX1YqqIeeFvTc4OQZFd6jUT+ci4m3Salw4+mQpd9d5a18Q8j09IDU
         eKeywnrQ5hDcLmC+9ZWzWd1b3z69ORUnmE8Y9C0dOaPpK6QIsk00r2QjhXn4sN2uNwcr
         /QvYA3bybUih15mB7bGeDAAI8To2OiH9lCeJMYaBIoKKBjhI6R+v4Gw8xTxktrEaHows
         BC3/o7fQXWbA1r1WU8knHY+oc2Dfeeh49ZSeYkglOv4Jsdo2x/iwFtqDI7raNtZsFtz5
         JqLA==
X-Forwarded-Encrypted: i=1; AKwUvBzgTEkZqsilku/4chQUUtVcuFfBZE+yPmU9I98MVQWqEZImmgka68llUt+uVAZBEAiX3FLL4E7R31VUHzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZMEpNpPxX606HOjpHtNwH5ySRWKx7ZY4aFEx8s0L+NDDTeKuX
	B3DwfgkwJFIIIX38s1xchdYe6hknmydFNDXjFNWWaNTbhiLj5uAgMz0UdGTq4bD6BOP9gqwWzvs
	9lULiqmVKwigk/96wcfbmtZwpITIPejHwYQDRvZbA5ymJZH6uAJ96nxfcf2m4sVxsQ86/3G2ibM
	TIEbPVVygO7YhFumV8Eukhv/PIR1c0uIUn5raEdY1LjXjYfh3fA+vX0lVs5ryOTzmCjBRy/a9cu
	6KLMnhyyZYuIku8vXoOMGH63Q==
X-Gm-Gg: AYBFou1WsYEsug53/vdMlQWvpcBmj+W0z5ljeTQo+QJ1oR93719sLCA+GwpvgMI17Z7
	A6vgrRBTh2lkR1NogwN/+b1VSHjj/RbvIxQPw/glj7N7szCK5yuvW68+cU3eaWcMU3GcfcdLMVg
	iT7/CTiWeChlWcJjKnHW7e7Q4RSq9Mf18J8Aow+QpQ/Hf5pyGE3StIovtrtcwq7krTwmQHyWHEf
	m7Jndr/YHJ3fJsB+MHXtQ5rAZjXxWZpfO3UfgJ6Cy1MuZ93HXym9/m2FtyCpViDsGjFReypybTS
	43IS0GB4me9dVz3Y+7VqGokMZlzawXJukERZOLVyAXc84zkoMcinPH2bByzi5VZc8MRsJ/f7oNq
	PZxH22PmveURTzzpHAZdbkM95SEXBzOlEKnQNZ/FVuQ7HYE3a9NhAkeR29TrIwa3f83lAO17yrf
	yBn0/nyAUl4uTvXvdDK8cPd+WIqINhHUTUvmCddeU=
X-Received: by 2002:a17:90b:5848:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae8974a413mr6643371a91.23.1793714398544;
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c9263d2sm1952164a91.7.2026.11.03.05.59.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso1031543eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714397; x=1794319197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=LG3GQdL8JLA+f1gF3PhukAabS/i+7KSmdZY2Ckifi9iWeJZKBTMPjvgUVyir6qLfis
         9pSwkAly3zfmJDAhGoVNSJCHzwTU11wtH9i2xlWmaD/US1PujHyWad3jLjKo1DJIvebL
         z8NdWHIpde09qOmtJzxc27G+LD9KmeP/VOrdY=
X-Forwarded-Encrypted: i=1; AKwUvBxsYh7hofJp+Uf7BrhedM/2r8fQJUJxfUaCsobmQ4Q7dA7/S+kjWH6FbjLAbhpjS2WxpT+kJDe48mYrwTw=@vger.kernel.org
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492416c88.24.1793714396645;
        Tue, 03 Nov 2026 05:59:56 -0800 (PST)
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492387c88.24.1793714395934;
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
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
Subject: Re: [PATCH 11/13] wifi: brcmfmac: Support versioned join requests
Date: Tue,  3 Nov 2026 14:58:55 +0100
Message-ID: <20261103135856.3676311-12-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:46 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer firmware uses version 1 join and association structures with
> explicit version headers.
>
> Query join_ver and build version 1 requests when required. Retain legacy
> layouts for older firmware and fall back to BRCMF_C_SET_SSID when the
> join iovar returns -EBADE. Use the selected association layout for IBSS
> joins too. Report unsupported join versions rather than guessing their
> request layout.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 73 +++++++++++++++++++---
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  1 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 19 ++++++
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 29 +++++++++
>  4 files changed, 113 insertions(+), 9 deletions(-)

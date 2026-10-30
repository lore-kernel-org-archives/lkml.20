Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346986;
	b=i7QOl5GArFjay3ixp3HAdJJk6dWdSpyFBF+8S+wK5ZHq/j+YyzB7792/UxBAK3fojn/D
	 FXqc+JBdaWdqVvsQXV2uYMGS2rnFgGXInR+YgxxiXVOCi3zFRommZs67TQEhDiIRjdzPI
	 mZZzLetctr6lPTYsYqMkhlBnuLZXExbDzGpI1UMm14FFmU9VptOGynUB5J/pxN+9adYMA
	 y4tHNdy0/8Kr8EC7/I4nYY8jR4Oh9ImQ4MxQcxz3TSxNzWolEstiNg6MAiYs9LrutEEDl
	 +uLr6lt4mTSofiedhoCPVpewOCrBEzEfJbCCc6Z1tW3sZg+7kzBTaCGgDpEoWP0SClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
	b=oxnIFjo5y+9rTKLF06wGhNPSYUND0ZcRuat9DkHdExtI55ScHB+Ql7aSqgIuaGYpLKRG
	 RrOkWLNyOt1JNkBK2bFf0Rz54BI0bma2koG9HXjp0DVR4ryVGYO0VkmybZp+MRjyNe7Xc
	 kxGf4ZkyddJ4sC7eIH+An8kgF9r/oyv8zWa1pahkQCwnsClNDrAza+FUZgnnFCIOah5Dc
	 M4HIKeyLtspP1/2ZS8Zh4Ksk74rVJMIBfLSn3ZD20I0yFV83weZMgtkEcgeiJeL8BmA8d
	 VzZd2NY4XjNV1i+gfPyfrfj11LFJ0Bk9ksbMSjt1FuOvliIzZjPEgDSLBYhazKA+cYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHog+Cst;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHog+Cst
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3154975e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793346983; x=1793951783; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=jHog+CstgL/em6hzEfZuOhxSNhw7Dl/PB0lXcq9zxO92od8dSzezBQoBlr23PIOmZr
         1wGJZlHGH6DvzIV+6OHtJUxgfgr7iahGGrqpeiDFYtTH+xHiyyrQsBb8Kak2jL0VSPoC
         Bn2S0Mexg3+v9g5XDmzI/bFDRU5qatpzz4GPqLLNa9O6MgKYCQacz2lBsnLZa9qoNXFR
         X94pOtZDBgN9N1xs/NU1mB9cb33OWpNftDq/GYvi4b52j+CnrY59XhpjRbsbS7SEFRID
         NhP+C5AwBu3VtPT48dX8XX+SJOsaPXUtnAwbuK1V4ra6qeDUdQlKAqGWMl+rbO899q7/
         ZBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346983; x=1793951783;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=G71lFj2b/NokbWhBmWFEgI/bFGKit73g2ShVoyPF29Vo/OaeVUQ5lWDvLd1nyHU2tu
         zY2KL9kAp//KVGrSBH3mxdadrRi2qjVxlqRmVC2LFZSjiOH0/Cvo01CFavyw8B+0YWNy
         rp7rbPAJNuy4g/a7VOxcfBIGsYR2prCHiOISGMSL6qRlOjrpaAIN4JPQqDkiofOMc3EV
         bKS+Hk0wJ2RET/IDJtKOvDgVt0fRsP+X2EoNlpPpaBtirylehBcIYG0VgBhOzYdmCYzn
         AtXPz2dWZ3gMTPgrgtSZUiScHkc6z4S2JOF1EMqHrCLo4haa7YVGNEuY0lWwqdOgUNi2
         lWzw==
X-Forwarded-Encrypted: i=1; AKwUvBwoTj6RcsPQBkoufTcetWbWS/atLX08UrROrx4g7Bp8qSJD7gqBrE3LQkTr1NLxvccWL124ycpWIZjvpHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvoyXSibV2LpjZ57YDG+c+kQxWOW2NlgjA3UCoSxNcH2jXdmR6
	ahszXIuuscOaHbhsY2PnXW9tBKdJ3YkoYg6Cc3VPC6URdSazpvpWNm28byqV0N95fk8=
X-Gm-Gg: AYBFou0ZyldlDjdhHhMPtMxL1ASn4cPqK1B1w8BTuoWkeoee7pdbBAlHEnB/qoXGiNd
	U9QMvcjY3iW3j7a/+1OUaAbd6uB43UwBqwjyNZXAXvMC0ZoSqU6xKGjix7rawMlVnRI6470UA2W
	APQ2ps6jSLmlDIisGTh8QMzTsW72Xnx9X+am0AqTbMW2cItJ2tXiflovUxVwwVq06rElgMIzXmU
	jtSSoAwnyC+sykVPkfXyI2gcM4TKjujqGk58R0Zq/wBIhlcucCSgzGJKzYr+fc2xAIUhLpkVUDM
	y6Wtv+L0zdf4XPD2tZyWgj7Rk4UKcWoUKaIJZBoYM/Tydi2Jxt/MhoVfKeklKqu+IzntZUDiMtV
	nlDzmdHenQzidcfjis5N3kF9G8ma/2d7KH/pVQBzqj1l2LLfzDataXlLNUHwzu1iS0A7qtXD3e0
	1AEc2Vmz0qNxKwLZizP1lOSIkwMIob31iH2l31772nvPBks1ggkLyXcMxmXBrCVaArGesyFP1fr
	Lk95TiAZSsxRArYYvRqG80T95ydHiVO8y46Lp5RTL0lTcxmDTpX3FYsoqDDMy+W38vUGEcRGA/3
	w37tDLGoqpbOJnT6hF0aX3xEamdZwcGZjEsSFmXtcmrU2Lna
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr27983065e9.18.1793346983717;
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm1896842f8f.12.2026.10.30.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Date: Fri, 30 Oct 2026 08:56:08 +0100
Message-Id: <179334696866.1865333.15281691536960205924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yU+vJw6/Y9vZBqgM9DPcf9eaGw98kAzxSGCAE0ufIe4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPfOfdXWhmxJXoz+huw7YuS2jSZs/mnjdOR+V//eqXk
 NnIeGhiRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZScZGR4bWVSPUD9laR6frZ
 +yeFNLw65Poo+IMTx407XyyU+JwF+Bj+qbpdOeOS4l3KXKDVuEz8ShR7lmvmhLvGi0rOPhJ0uve
 dBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 29 Oct 2026 19:37:33 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> Fix the ENCP clock select field on GXBB, G12A and S4
> 
> The GXBB, G12A and S4 clock drivers place the ENCP clock select at
> VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


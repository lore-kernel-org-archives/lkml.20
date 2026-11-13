Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569167;
	b=QZhP0BmDs5GouDJm3A5VqBxB9ly7Sy1Hgv5WHRpN71qroqI6QHkmjV238InbPPrAWR6C
	 3rmzsgO+1CnBWqt0FA9THfacp6z09sgHYRpD99jXEWBF9c7dvLow0iiQYRFvOxaAFhzW0
	 IxN4LUhaFm6xSOpMJLFL2wRritb/VMB3a5YL4byyzrXKLYNhlWkDcJ60Vog/O6ROBymwo
	 tWdahY6AI9iZqlOO99SBrTv5kL6aB6zbIPO4/J9ha7MAyrQrS2WB6vrigoEBN3hx6YMNd
	 favzduS1dXkuaxWMoI3r9ZHrBYncDFDell19PPJgpe6veutFbKHAkUHLjvskLjMo2mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
	b=F2oqxz0FN0DbSqiQdTDK+TcM442geXQ0LkwItADWR0R7f927TDcyQJIYQJxiRQxUs2/l
	 cujVEgbEryXDNGJzO1P9At6FZZJc9QtrBCZrqz30Es0s8UJuQ4E64evY5QeYNnUI6uf6w
	 FBtDyafz7z7Xl380C7ajM4t2phBiF0nP5NdEzZvtDY+1LsiVFGGOCkKTSRvyZLyyy3QxL
	 TGRbHwRCv25h6Ljz6QhNFmi05akjZoRvfReWt8gqSBviWCwL6h3MpO1CzupKnFz/D66NL
	 7ZTlmm3wUoekd+LEXnVjonVhe2zOvbPzFI7/2UsD2clElDMzhpnWhMz6EzRITJ2jafQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE24606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE24606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5080ef9b31so166153266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569166; cv=none;
        d=google.com; s=arc-20260327;
        b=sqHxeN9EGWBoSvC+XIN/O44MGbWbB7XRZVVpRaHFbCxrWHqM8P7YfgHDMdoqLkqJZ+
         Vbw+mZKvusMLspLuefBX2DPJPWQ1Xu4TlWYb5DxLHh1srBbBFRiRxzAxxWFbFRCk7ifP
         z3s2Dc0ccwzzb4lUq98O1EV6LKKn7tdre3h9NKb7GqXCHOzyjS6esbR4OyJrxdt/S4G2
         Hd9ehv1DGUgcVsl5DO3kSg4p78ijxzlNSZmTVbZxWiDJpJ51wKECUsn5kganv6YGJNe9
         Z64hxmnWYfzHrXYd7325zOLGX5i+LKD4bjgK4aWgscEkszvImpH5Kt0/VLT4JFwmP7Bw
         UIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        fh=1eBXj8Qa44JpcaYJn2YGAZ88X963jpB4lkblSM/QIs8=;
        b=Lf1M0He/BId6xPjFLvT/krJccTYdfD+5go7BWi7xJRgFD52qvpWnGoJBE6sRbQTgyz
         PiSn1HMFE70qohd87r8Z69YYqc5AtFqcYg6k/FUgRUnXkLaMEE/3wUccaG1q3WjObnTd
         HRvqeKrUsQGllCqFQZssSiTTGHSaKqhSk0yRR3wrqUd6S24OFXF2w4zrSMxBZAfFe53e
         9gZ0Sk1LTx+7jFW0534t+iA+1LGS1H4PYJkRe58X0esnzCIlHxORUFeT+yQfDor/86mS
         9RZxF8qH0XF6lSH9EoJ6HaJYQmovqgwzDMKNw+cojC3GCFhvZTWSlwudcCYDefuHdRbR
         WQ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794569166; x=1795173966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=dEek9Htp2rFd6uu2Ph7g8AxNoYqFVLHVX2mYLl9kLY+HH06kTBXQOKi3r22Mzs9smM
         sagi7bl3+DQo9QkgTX7pFHO93lrrwfHA6SuB0Jwny1Vd/GzwHFiBiOLy6S9zwJfvMoMV
         BKXLBxVHAmkpbgA8o0UpnP/AfJIu1vZfb6RN6XB4+9f2VpfiBaFeZ3JlErhNyKX25LeG
         eXs4P2pgPEqHHlNwFOzF9ojZ32WC+7RCdT30YKCLdKmAlot8Hrf4HxUhjgtdo+bcdj5R
         UjplazmJUwmFyYVBT23xLFvylNJ7TA+SVSzh4P6gk312G6Dekfj7exzocUaakVK7/BPK
         ABFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569166; x=1795173966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=cpI7kSj3spLhvVZr25oYoihXzEwrnIRzRSCG2mI9FwknUUHhJlssqmpPVo+s0P/o+g
         78Xp7kQD1R6SkqbmogC+HecXGV80LYT6IhSQxmMwkHu+ksLcb/+jmjoQqBhLCJ938qFc
         fudk93buR/4eQTERW5SQlTcxgMecwpZFFwEpmQyg7yoUf6k1vVLmDhPr2SyRmv7gOR08
         MwNfZ8aVPE7ZA2dLXW54Za0CC6JFg0hnk1udHyH47KByN9CaYsFY+3wWd/u2diAObrM0
         9B8C5OkgaLCwG87C7Lbq41K6gyIuweIsj4dh8DZAOcwRrZhnNWYkjSRCJkPVS8yWgZvy
         k9Og==
X-Forwarded-Encrypted: i=1; AL+hErGaslHf4cQNPowZOiPp6h928aM+O5mCd7BlXqMt29NLfhzYP88hfwl4twvAPzXB9dPfld2bPxkXYF8xBc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K0zaMQQ9B3SgOyouV1WrWe+7JW6FJv6GPT+Bh6iMRArH+o7x/
	/KbelZFfDVOoyRD2znBj6BVz4ud1d3yIDZOOtzP7H/smpbw/bsAgSfpzAjgsgc3/UARJs+oBYkm
	huRAwX2z4FY8hmgoQGn4hWgMnUIZJhCV4FGnVzPjnow==
X-Gm-Gg: AYBFou0u/0M/OrSNxtlyzoH9cPFahxZm1MkVGh71oYjbgNSk/FGcGt5O/XD2Z9azjEE
	nbe8oa1QhQUKIP7snAESzeujcfpKYXe2jdtCFwKqCH7u0PbLZcs8eAzt3j7I0yT1jmA438e8Dtq
	xFzjnjzMwkvdKppd0wo2i3ZRC0N3/B4DsNTB2KTJrBGgEc08YpvWEl6tSLmrFZWOKCZ7sV0kWRl
	iCKdeZAF3Om4/fA1sY7lbztrJHO5wVA/b3U+NyzKWCoB1EJJaqkQ6REe+/qbqgN9tGT9Snklr2s
	HNo3ix5u5bZ6X2N0Xc4q0jgsXbfrKgGJloXAjoAZ6fxv6qhTlgpIbSUB/cpBFXQCmi7QnYFEomE
	hHkNGRY6UagI6qVSHIN777lyuZ9fwEcjjL5pcjuu17Lj9Dz32gwNoJGaifJa3wlAhDnKGEA==
X-Received: by 2002:a17:906:c154:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c50962edf20mr170802566b.12.1794569165639; Fri, 13 Nov 2026
 03:26:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:25:54 +0000
X-Gm-Features: AclHuK-RupDt9op7f4Ges1DbDNx958GvAIMpdcpygcG5RXJOoAuuhRLl1DXJwcA
Message-ID: <CADrjBPqfJTRpsgJza23dup5sB9OxhS+AJ_vzmNtmuuJXQaxOxw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_PERIS
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

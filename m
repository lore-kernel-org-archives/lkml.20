Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364251;
	b=eJuwt/O762CjJQnamRFs48E6ZqEdY1srSyRLmt27VeYJgTctNngjy2oQIwoP39epAO7m
	 NNYn5K+99oJeglRYdCRAOCYV9jpWcPfMeA3zw3T1rOC5rQkFrEdvsF5U3ZAyLynp9RGwc
	 +lv3A4+2AIx21GLdCUNXS/zj0yhf/AA1CAt5h/B5lJnrZVAB6+jXPuN4onk3WlvVNRGsA
	 lhQQdLKvHaoJ1PJZYh9UltxmHS8e4bXSMCyPgeuUt8m4sYqiAhER+eqd7Q6pDiJH6g1eb
	 GT/D2Io+HI/HZ6nI9qR1wNIXDpDMDYiubeRThMrpS9+2tazeypZKrnPRbPSLauG+P0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
	b=k88G+yKFzH/XmBdGmdOFGUjlOJkL/u+XOdo6e3qdF3y9bxnRsOGjO+SmYPjReiKr4vsf
	 U3R4JFsSIiDBiJZPoC3WCwt7HYYn9i7jrm04B2Y+VBhIyb8LrG4D3TbLedfUcpHBbfRBS
	 svtgfFZlLZwSbJ9fiz1zLmzh+uDCX1+gO6cd2i840cL2Js1nQms0dMAVbIuDnfLdz9NXa
	 QGsZlbTX9p8cGtlgZ1qULwFrqY2Jrs9ALHbw2z8RfsF19bUBGAIa4X0D+Ks8AKqE+ro7J
	 QSbtEi92YnvtsGxc4Q63H/TfECaD7e4n2p04+qWBtyfesidCQ0U8dXbvIOQKNYj+kiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oWq0raAr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oWq0raAr
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b335eeb340so22899307b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794364250; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfRu29hWErvA2+V8hoF0H/OgKQHVmFELqduqZjgf1F0AtpKEJOr54xVxCKvKHSCAng
         f2iGoKhcQLGDM4wANe9YBh2mGDplWL27uPk4hfc4D1Mo24qT2VVb8RdXrkbEEcxmEkqr
         Ktm1xxv+aqfuK8g9jMGOxDxCR0YWjLyHSKtiX3CcJSEvD+T5AAmZMNUSk/2k2EDwO+Rd
         LZi5qbjC+8bzpWUg7DbHMX6TAo45khZNfvpPs1nWyegbs8UWNYBAye65vx3IuHGZHIBe
         gbHsIOk9ViNRWaPTWLWOGqO+z+HBRk9Q/26J46ZKbEVkhl/+zjZW0HvR27eIJDqFy988
         F9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        fh=67nfXslXs3wkoKaS30pfL5EyOoYLuBfCzN3OSr0BWhE=;
        b=FiqAf3xFpF9w+I0qKZ/M332VZzrIlfxXXwL+Cn84JSXhvlSxdccrVfpQ77Zw/BJKRl
         UoO8gDRHV/mSUo/1qA2hCMXoU3BXV0K3t4YWPsOlBRHTTTkLYW/JxSzUcaCWw2XzDWb3
         U2LXheVARpUlSjW1fNhID3tGoAmSMmuGfAg3pI4dXEQrp1NYxlxdvSBTgJlWPAKc2iHd
         V98yhDo0sVaRDQoZ4lx3SSThSJvqaioZOwIH1Jx6i7TznWyxB+xlky89eo5hVNSO/Lsf
         CNwSHJxd5Xz1jGmvo1WiyXXt1+j6UV6U5Tb/vAfJtu0mww9nQUz6cceSBqKHFkcyMVHd
         FCgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794364250; x=1794969050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=oWq0raArlDmhcih8WTbfkYST/y+nGP4jIgZYQvnDJkGEa6WxfZQ0K09wQsXpqwc/ZX
         dW9qTz4nCl0ibn6w3938iXJW9BHH34WcS87d8G6UkRyLPWbSuCB2yQQvEPYeQGUCP5YZ
         5lxK9x9mIsny+nct4q4Qo2iXRr1FkuB0RY8e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364250; x=1794969050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=puI78m2ZRnl3BF+PA599oxuLML/3zun+LpkU6Vavbe4OaK1lm0TDo69IgN2i+xYGBy
         iRQ1Pnk+PQ+zxJcSKsB1TpBu+HmGfdAwlZkBk6zavEbH00Thnp95CsP/a9kzCsbgfHnF
         3tSrzE7V0XLqi79MsV+T4HGHIl4j7znD1wFXk7G3At1jx4DZeUegvqJP00iI7FQBudSu
         laOLz74kw9hlB7KRrWtnhjusT9pBUsK6/n5ETVHkN0zVH4/4+TkC7L7mF+tTxbCv+Oxx
         ap6kwPvOXS/AAE97tgoTOqz/u4w5r4mvyCBPEKdZhS+BdrKS9R1jzgeo/7kXpnyXyDl+
         3YFw==
X-Forwarded-Encrypted: i=1; AL+hErGeYLHFpCIdEv5hx2wERyRueMopQPks5FZilru2GgW/muKgfk/Ek6X2erpMO00iMnkT3TsjTdF06xGJicI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A/uaL/5BDI5118jdx9c1ESsu0MH4QqIHSckHHrUWDIiqhqxyU
	3qXAseaJO0Kj/XMGS+K6N1H2JvkRvjdDsK7A7zwFFimhMVN7iPR961GQiaTfwkvULouTTNhed2P
	PYmD8auB094aWA+vFZWvJr76bIkKMWxsmc75CqCOJ
X-Gm-Gg: AYBFou0swdLrrrxQCGoXWEmDmxqReDLIGH9WJWybezlyk3hY3VWhGjW8BtqD2n6n6Tn
	K31qGyIsxaZJTQzUjRWt/7IlOZ+z2Ut8/y0NNazYCU2/ySeXNFpug0KaPniGyYtfOs07cWZx5ki
	CEdCaK5we/6ow9aWb5EsX5+0BF3k8v7yWXQY2xGR/lVoN+7mSMRTEIvqXNlkR8TwRrdZz1KuSJI
	4qo/nEijygt1RGxITGfB7x79VQRKw5Gez9rkIB9iAEfxN/eONQLe6uOi9UNtdejfe29UdxGMXW1
	am+L3TqPw4XvlGIIRybytit1vsvh5wmkwzwRRpOB9cjViG7RMYle5R+VpHsd4pdfj24womfT0bS
	Obk5IKgj+4n+PRAjyy/1Znqvh4syxt2mTxDiKsfsO+YTmCd8ppdD6Fda1m0Gb+vno0eaRpGXKD7
	C4rEj6SJVdmLuF
X-Received: by 2002:a05:690c:fd0:b0:8b0:cdf4:94a2 with SMTP id
 00721157ae682-8b3a81ab7e0mr7261967b3.84.1794364250231; Tue, 10 Nov 2026
 18:30:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
In-Reply-To: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Nov 2026 11:30:39 +0900
X-Gm-Features: AclHuK9ModA0hBuzgJ5zuMaqQJM9UHprenTTXYDmDO2P6KUA8OGeZIXeF99lf3k
Message-ID: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:51=E2=80=AFAM Ben Grisdale <bengris32@protonmail.=
ch> wrote:
>
> mt6397_irq_init() currently creates its IRQ domain with a fixed number
> of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
> driver has the same number of interrupts as the MT6397. The MT6328 has
> 47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
> unusable.
>
> Correct this by passing the PMIC's actual interrupt count to
> irq_domain_create_linear() based on the chip ID. Define the missing
> interrupt count for MT6328, as the other supported PMICs already have
> it defined.
>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Changes make sense to me, and it also seems to fix MT6332.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

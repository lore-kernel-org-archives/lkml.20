Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793481460;
	b=pOc9hlByS9ZJPmptloQN6+bFSy2z2lE8MbGDLwpk3Y+nT52ZhEogFcwz4dMpkKSCLj6Z
	 C6klq/SwpQ5LUK8S1NW9zk4YSD1ai0VK5RH4VLi7uFvdAdyrC4wAoVhfOi75TeTpRPzqt
	 skAHHU4uQmFySUUGWFYdg5IA38l+HWIgGEF1SKx3PnjEm8KieMo/o9hDfkulaa2DVqHfK
	 VMaLOUnHE0pLmjljbwyyclGrFqqnDmJ5xVuoACj344mNONIG/g/NZ0C0noGBPW/Tl9AGn
	 HCo8D9WIZ+zCZt8STZ+o2RATIxGCus3GXQ61iyaSIoWW66jh587l/dbJFQTCK5hgq3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
	b=u94aoUEgVABdQ2yoDl6284zv7P/+3sLWEBZ9k9MwvzSQv4eEilI6W79ggve0JFZ3+X3D
	 ko5XKq2NT/Yil4h8BOxwdiuH348wVOCcQ42HmhApFfNASrXyAVjjWTrWzsoTxil6chonm
	 mt1NshAR1ltqHcBnYuJPJQnMsFI95XHIS3/oQjrq9/JkWyDcM/OEsixeSRNsMET0DwI92
	 9EcpGc4UyY82HYySCVhCDuwMyJcO+cVodcrxvd/GoE6b5GD45oa6RKIh8XHbXWGk+jarH
	 GhHsH6t9NAoqR4vyuWbo25LWI+TULP/ASAj6CuGiKrLr/iNCIY7LuzN0ii8VUtCbAzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GMctS9Xh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10A606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E10A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GMctS9Xh
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67999045530so1529854d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793481459; cv=none;
        d=google.com; s=arc-20260327;
        b=ASE/AmdIhYWCe+mx3XDknHOoSCuX+QfCWae6qrIHF2lnraz6ozXDdljEFQnqX/7enl
         LBSjd8XefWssRKL9nqm/b86OG+ptrcIk//HwjbYoz4JqsMlR6oGez7YcLdxYv4WsIzf6
         iEPljtVmSRJCaXiWL+xv94s+WHd4xzByb2dMGR8p1NMYhUFq4riDHtQb0ZDLDs0RjXaT
         n6vXqBdjGw2x/da19cQNgXgkAS9+E5Ij/wA18ZQ30tk+J5UufHT/u/tx7d8fY7sYmAPN
         JINhNjBiePHWlDEWmEKMN6xn+aVLTaMUSry8OAjT3vpDrc3RqIvSXSe/QnEf1hMPhjst
         U2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        fh=6BMahNhISeI9e40deO55r7XauxF3rrebjRr3JebWCCc=;
        b=nd/uYccclDBWdD349ZhRNEM8eiGJZIH43uOX8ctn1cdJtsndMFgwp1S/N2TiJec0gB
         Uf1Vb1/O1iD2hD9jjuSNi9qOXbfKYooNKGVRuys+cUD0Fvtx4MffMuKY/ydQyYkdtiMy
         hrgHJWgTrs0qw7M4aQGN4f0hR2mEnjitYKFwL/+aIehHqricE+N1VW0f6ojXAYEYGA11
         RlvRMx3woNaTmMk0X0kPzU2jHtpGXafHaOfGcd7W36vFbNLbnYAWs17FAU49CTIctjSv
         d6mQ8M4sS7DDbFgoIksrexD7Pda5Yudfz8CFrNHdlsl1lVUcuOPEbD45p7t00QVz+KdO
         VBaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793481459; x=1794086259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=GMctS9XhyvIuaGAhiGhTuzsHLGM4BRlCyXy4/1QS8nYiZWiCLMUIFgfMR+R0rN1xJS
         nAg85Hh0cQko6Dn5rR4MwhrBJulQYEobDq6H2lJMCKjWGPQRo4el3NxlsWtGuPDJjF8G
         LQNQhnRReFbjQ2W57Meswjet/fxq2pn8RatEpTsdhHlRP5w/QJAe1OkNpnJsQS4MUb5x
         /YP4GhxKH/itsEHM4V86UdhbG2CxeMB9+lN6Vwk8BtGWFc/3qx6nzL2DByMHq2iZ0m82
         5Z06TE6fd6JL+FHbQf0qh9kMXqkDOZGOuUmlpE7CPIfqpL1zH9VfcNs+91JVgyWL6q2X
         PAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481459; x=1794086259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXCPp3YOjVOMEYnPkFXhZpoDSfPXdwR+BZnSniJGgXU=;
        b=ZzSOTN9ynRb9o/hSkn8JmFoZSwJoHJthSoxe6Ic1aYQbOU1fDM41T8lMeKbWNvMmze
         j+D4apmO2TwWyWKig68VyMJuSgUtDdNtMpkt/y2b9d/6WCb87XMdhDQbBmQcxdYfkGuP
         JxCHsx3ciz0987plaLKcCnyzJR5K4fSE0y+tYA4INfwehOAHoFeLSrczRiNXWWJGUkQk
         bNQMS9cqE8JbH3WXTUuFCNdgYNI0VzWKabIsPYRRVm0bXLmy9G9Rq0rE51Ar9pxP77ui
         qKRpN6qfuhVsjtw4zvY45NZoPqvIX5xDqg3urjnKSYG4IkIzxQibjtRNX2CTnRxdXFem
         EgIw==
X-Forwarded-Encrypted: i=1; AKwUvBzRpON7tBvpqAUgfIOtmngkWn1lqq5KWPfKxJpEdMAK66fIDcQOoVFFsGXWe5LoXJ5wPnfnkYhYCty/lKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LJjHzkiPzp6Jowh+JN74I00qjG5/3VlqxzU2An8//ArDwUWnA
	5wZSjZAfAqPecx84LflKUYdagjSbSrw4Hk0E5DnVpzPlWRSk4ZtXDQyOtpVReBl6rnWu3M7WLY/
	d6fWKjnNCBT7NqcUcWqOI6zsmgLUP8Yzo7GuI
X-Gm-Gg: AYBFou2qPoy7rkL+M+Bsh9Uo2PAlVEMaqREOTs6bfCOrHK5An5yPTyn7u7NVOTpURaE
	VkqxZIPTgm4W0MggGszsqjYI+RpphC339lge8wa8+y1NnlenP6JY2/KrSsiomFdRvVJl/Ab7zD5
	aDGN8kAcPmL+R3PQDy10imW0NZ8XADrJV9fGOxtwynisSFhu2sGRoj9nAwWq11tcGKAq4wv/FjT
	hZhDD0BhEwxED2pxB08/9rD6nWL6bICFCRS8qPIcM3ljGqEdaD9DYF0/0RKsy9FkDwlMPWPCHYB
	Kfdf7udcWiVi2m2eiKBPZ56tbvoGKTVygw1sSXbldbTG4TymZI5IyQTDvrC7SC3RwSP+7Qi/vuI
	P4LUh7jVHACxuChE4HwtVjPj8kxhriOOzbl199Xi2MUg191FbvTsgrXNhG5ODE0+jov6tenD1m4
	4LA0HzQoqKoghWC4M=
X-Received: by 2002:a05:690e:dcb:b0:679:ad95:8ef8 with SMTP id
 956f58d0204a3-67ba4f44351mr3951527d50.62.1793481458984; Sat, 31 Oct 2026
 14:17:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
In-Reply-To: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 31 Oct 2026 22:17:28 +0100
X-Gm-Features: AclHuK9aT_AtsyMcO-RHgeZfhZoWmnaHOU2QYfBUHDRz-4_ywAKOHyMlNGOtG-I
Message-ID: <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for this patch!

On Sat, Oct 31, 2026 at 9:09=E2=80=AFPM ZHENPENG YUAN <yuanzhenpeng210@gmai=
l.com> wrote:
>
> The Meson MX SDHC controller uses a single DMA address for each
> transfer. Since the driver leaves max_segs at the MMC core default
> of 1, large I/O requests are split into single-segment requests,
> typically 4 KiB each.
>
> On an Amlogic S805, this limits eMMC sequential read throughput
> to approximately 15 MiB/s despite using HS200 timing.
>
> Add a 128 KiB DMA bounce buffer for multi-segment requests and
FWIW, while reviewing your patch I found that Amlogic actually uses a
512KiB bounce buffer in their downstream driver: [0]

> advertise up to 64 scatterlist segments. Single-segment requests
> continue to use direct DMA. If buffer allocation fails, fall back
> to the original single-segment limit.
>
> Testing on a Xunlei OneCloud (Meson8b, Samsung 8GME4R eMMC)
> running Linux 7.3.1:
>
>   Block size       Before       After
>   4 KiB            14.47        14.69 MiB/s
>   64 KiB           15.06        63.21 MiB/s
>   128 KiB          15.08        75.13 MiB/s
>   1 MiB            15.07        75.93 MiB/s
>
> For a 128 MiB sequential read, block requests decreased from
> 32768 to 1024.
That's a nice performance improvement!

> Direct I/O SHA256 readback verification and fio CRC32C write
> verification passed. No MMC errors were observed.
>
> Assisted-by: LLM
> Signed-off-by: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Could you please compare your patch to simply setting mmc->caps2 |=3D
MMC_CAP2_MERGE_CAPABLE; ?
From what I understand this will allow physically contiguous SG
entries to be merged by mmc core.

Ulf: the code here looks similar to the sdhci.c implementation. I'm
wondering if there were any plans to somehow move this to MMC core.


Best regards,
Martin


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/sd.h#L627

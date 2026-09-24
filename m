Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C345C701
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244726; cv=none; b=fQgji0sSX0vW5Cw6tRPDKS7VTDtZ0x6kGNp597OIM7auYSL+yxId8NAVN3u6H1obne4w37UMDae5N4JlBATsUi0r+q4KgBbSPQjzHwnyWWIifWNmu38DLUGASqMBTn+2ny2RkMaim/RawcS7naSEBBpLiwKDyX21oCDjNFfnUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244726; c=relaxed/simple;
	bh=okQkGFFiFGo2+bcfn/1mnbfxo9xuP8mMhLAma4LpIno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esMtK38F2NrDOV/GLpBJ8qqLNgUHFCeKoGZZYVhPneIyWmLF7RgJTbyyu3dbDNoZxdsFopj2HFAgOFurodZMMP71v9s0oL7DKlCRcUwp5Sy43pc2QCZhio9URlt/c5RHRQ4FO8t4SwyIjQ0FTUVRYXVCezguvoM6W8Lopssi4i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mdN7Laig; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mdN7Laig"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so14381375e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790244710; x=1790849510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56SKaqZ0iXHf7acYt1UYQ55V03EGjf3BULjEnLjAl04=;
        b=mdN7LaigXaw5w13N0yHVuCvHSzJnd+TjSfxsrLqs5RfSfchnjpK+sKgieoS6SfLqcI
         cOrvh3RbFYJr7yp8EimDiDkGCPXvhnWiT7OSWe0qIeEbTzWexhziPBPtkcHU3e8Rb5+O
         /tlgILY1cCkR/oTb5Fer+MSi1wa3okdP3WxqUTKgg/gOOBLm5TK4nNdOcKXAB65ch5aP
         GGd9TchcnOhFzrRZQZogsnVKBuglVx2Uait8cdhIkUNXjuu0h3l7HEhI5o8D2DOPKK1F
         R7GWs7X/Dn/npBTUfkgOdXlC5rYhpGtLDfEkL8QyoHHIDRBSu/wiSymMPca5nUy5lvjw
         xPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244710; x=1790849510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56SKaqZ0iXHf7acYt1UYQ55V03EGjf3BULjEnLjAl04=;
        b=mIQ0GIiYkT16HBt0G8cpq/2ER/npeSxOgdHACbcBZ0t/aDdISzwM/lN/m6bjJ1MDXS
         69HFKo81wbNuFlutjbmKWhACOkJIW/RA3G4BWbspQuOVS+VVuqRZdP4E5lTtJ16cTUBu
         z5RkxDeM1vOy9DwWDb7zaaVr2YUivRpx9qA02H6OWd18E4Jk5sNoaUjmH9HpVqzmr6lf
         r+Hacg1DdpYcCKYIVZ0sH5hLxd5ao50JXX0p24z3uk32RMT1Ac6Y/8+FomWjlNyzEImH
         5rVRpmjvwzaGuG9b5ilRQ8ZOYchUYOORRcoSu6PTDNTMHphALUb7nJHNu3o9ZGGdMjDa
         EeGQ==
X-Gm-Message-State: AFuF++kNx4QYE8KhxZbY2ElfLeu3wPTYT4zToLQksC9j1q1k1e6ZC0X1
	AZ9M2B4akWtHOClK3sZPKTqhUE+bvnzlhQArOPJpAAl/rZESWjfvtMmkJL6eVniEtvWzTyf+30D
	J8VH3
X-Gm-Gg: AYBFou165MWI30RqXselwJ08BaNxgAuWiR0rZygUATkzPznYEKJQ4hxaWjDdbumARkr
	S/NNgchqkaGvRgsh08KS1NKfPxyTU/ZMxrrSURI5LUKqVllTxzExzURwQvqdIYHPiylXrIztFBz
	zCvCfzpotCk2QnbK9+2dY2QH7oAaXsK+0FVhYJVjnaO397fCSyfnogT9Vt8chRUzked2aw+xEyq
	OFqse4KnACRZGzpRdybXTVc3GlgA9uyABTXeNJAi5SqllOKpK4qaxdp2UJyT+leD0uhkK9iWy7t
	+thJuJZHWXURRQ4KWXJfsGakDo9IOcaKHkfZSHKxxnDNm4GRLJ+hPOvUgHx3q5KUxDEBGXVAMbN
	2xDOJw4Kxr7aa1pTsAN39+QbgPIsjB7Px4TPSwaF6v/8AtioYNAYgkNba3I3tgHZF5sCwenjuhP
	yNaEwv2AyfDS0imSnGwE9QiLf7Vlv6AvYypSOsA9tm6HJ7SAr6+61Ap1bpqfbbVRmPHWwpOhnpe
	WhkNVBa0X645gvfY1mO7L33RQ04UZqbmYULwL3vkljWC1x0gE+w40OVgp5oIAVrKbObtsDDp+yN
	gPPuqKRJ5Y1hfZt7kEIrRjvTv9LiMK8=
X-Received: by 2002:a05:600c:6090:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fe670424cmr28420905e9.28.1790244709782;
        Thu, 24 Sep 2026 03:11:49 -0700 (PDT)
Received: from ?IPV6:2a02:842a:161:af01:6a31:4b53:f1b7:80e9? (2a02-842a-0161-af01-6a31-4b53-f1b7-80e9.rev.sfr.net. [2a02:842a:161:af01:6a31:4b53:f1b7:80e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5e07bdcsm50921975e9.15.2026.09.24.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:11:49 -0700 (PDT)
Message-ID: <f5314ab6-e29e-4f92-8006-3679b1b28f5c@baylibre.com>
Date: Thu, 24 Sep 2026 12:11:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] counter: ti-ecap-capture: use regmap_assign_bits() for
 conditional set/clear
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 William Breathitt Gray <wbg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-iio@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260924083448.461792-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20260924083448.461792-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 10:34, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/counter/ti-ecap-capture.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/counter/ti-ecap-capture.c b/drivers/counter/ti-ecap-capture.c
> index d77a256f0ed31..1b79031544646 100644
> --- a/drivers/counter/ti-ecap-capture.c
> +++ b/drivers/counter/ti-ecap-capture.c
> @@ -254,10 +254,8 @@ static int ecap_cnt_pol_write(struct counter_device *counter,
>   	struct ecap_cnt_dev *ecap_dev = counter_priv(counter);
>   
>   	pm_runtime_get_sync(counter->parent);
> -	if (pol == COUNTER_SIGNAL_POLARITY_NEGATIVE)
> -		regmap_set_bits(ecap_dev->regmap, ECAP_ECCTL_REG, ECAP_CAPPOL_BIT(idx));
> -	else
> -		regmap_clear_bits(ecap_dev->regmap, ECAP_ECCTL_REG, ECAP_CAPPOL_BIT(idx));
> +	regmap_assign_bits(ecap_dev->regmap, ECAP_ECCTL_REG, ECAP_CAPPOL_BIT(idx),
> +			   pol == COUNTER_SIGNAL_POLARITY_NEGATIVE);
>   	pm_runtime_put_sync(counter->parent);
>   
>   	return 0;

Acked-by: Julien Panis <jpanis@baylibre.com>


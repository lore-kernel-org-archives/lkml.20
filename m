Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312328;
	b=kjdNm7cFTcwqy9pb7DKdUJIHJAvklbS+uE6kqgpY5aIjXF74p1dc1AdzMGXJjEIWvtKh
	 nkBantO+Iij7Ia8HZV53Wl2S52G0hMZ8MMN/wq3BxvRgzKr7u3C+2O/NZPcbfidPwZF2T
	 5um2toVtH7+9wc6SkdL6r+p8FxJoamKc8ZXIcdbWmMKZT5ppUQqmcescbUEXLexr8Hg9T
	 l3a33OEPPAgLhy28xUqTpCgeK0t6OiET/BeIrYqHLINxCs6Gd6+m6nUFO74MlK486k2xg
	 Fa+kgj+piXAx0tXhF/CBsKM51Mt3cIKPnVha+F6je3LlbjT8bhJZ9T6vU8A1ASzmEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
	b=v5f4Hy33soeN/nd84gLneRD/Uz9R/hoF1ygp0SNsq49iH14PHiYgtXibReFy9ox+oqUZ
	 pPxYFEIcR47P0GfZlc8z94vQaEJhEfSDqtp+GnWeF3T2y88QQ+uiSdkXE/qyCmyvsOh1e
	 PuBsMQwqGAWdH+1nWIQ7dDQLULalkop0XC5RNa0o0yZgp19YNbArUVAjt4O5hkh63D9O0
	 Q6+aI5EL7/kAmE+X/WHCzmq+2W2GkzuusbIMMhWoBMjUkJixBcl4OIF3AlbmgaBHRfSCq
	 mE+43TwXqVqOUDuobYVh6sqUajyaEx3eQVN3sOBnSO70EknSKItmWTmfMimxBGh0yKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ43syDN;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE0606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ43syDN
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acd239776cso14115231fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312326; x=1794917126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=eZ43syDN2nk04TvvWXBmfsqm56sABgP6OslmMZzl4XUYv1Kf8t+BjBWbvNlgK6V2g/
         7y1hf2vLh4S7d/qbNqFNN/T3URlge1l2qlVnKEofkynJ8lsH2D1Vl2+PzGCWLgb7Xk0a
         L8a+bpaUTqE09dXf9IalxUi/0gvMaEBWiijLQHoo/0rSuF+hd6NNkVp0OOnjrYkQ/Axw
         Qs8hP7MaS/jz9JN8y/9jxYqB3c4K/dy6FaaBSQAQwRbuTz14Hr/dynQx3fcFd1qBSB8j
         KKancvYE/5/oJ1Nn0OmK0X9rknhMAYZFuitGv6bP2IHL/Dz9SdZWhaU40bfFVc9okJgX
         u0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312326; x=1794917126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=gXDAU2r4N4z9j42M5XBsYetR1JRHvgEhp3VnW5TxEC/nGGFU81aIw14/lQQExmZOze
         5T0O4nU16cbUpuRqSybBVf3vM2+AfD4CfPsNn0/+HMqQUQV801/Ld/sijziuX1UqRLNd
         0t89eroKIDHy7SgaQ14D3iBsVvi01ju2u5MU06tMgvWAatZ1vbq+PgCnD/kpGUxRUxNZ
         SUZV+X3Ww9PNjYPB2AwSuECZ7A+HybiU8fwpQ7LBIHZ+Bg7D1G42bu21yZ6QfzZH1/Gq
         wAp9q8wP+eZPUWrL9UnHj5IQe1ZyGZT5QN7ifqY5kaA3FlNGwZ0r0erhPgn/gRfB2xxR
         qzfg==
X-Forwarded-Encrypted: i=1; AL+hErGF9SF+bNc8c50xZm+jrC9Mi7Amx+GYNWpRfuVXEpzK+eu3BjHJ885jSEF0Gp1tI9nVWFx8eKRlZVqT2TE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aWdpsEC/5TzMrTjWQydYu+K6PGob/eU3JDRaRbzhEaV0LPuni
	lFZwiDeW6cTwuBYEcq3v6K/onc496oQnT8tdkHRBdXNzn5KKWBE7sW/jJmT4ite0
X-Gm-Gg: AYBFou3LE7YonO5s7a0aMvtO7IDTXxgTt70A4TbVG5bchgePMnkEjRTNm5vq8AW+Wih
	0+geQnI+Iud6RC80RrrOYCF1v3OlQVxden7V2Uw5/o8rYyKW8e5n0u3PLlwoMq+FRVTmMatvJsW
	R0Fy/h0207wy77F8lAAUCHo+CoYxp5t6rnWjw/XeM3UFZoLKQCfU0/nd/eHnw+keKE2lkcN5KoW
	Cyru2XwpkgLKVtYymcnhID+SY1fqiXN5u20IEXzRgw0/cs6zCYV1/fFhP9KbSt6hVriutsG8iQD
	9bC93sPgS+lnQYQKcQ83HEoKNNqvM3THiEP2ejGn305mCa317frobmtug7tai5sJHMahW7hMpsB
	l+MzkhZWZ3TbDfW2OPTqYUkxpWv5mPdvWNrjSnvcTQcu3zo6ukwzoMTJXJTImWqoTwo4XUbeqR5
	P43QZQhQu/vezwAvg95Ngx/tpxEGIXLUhsinRxRGpKUa2pEEyKwAtICgb3Lla3hT0tMf1e4M8O0
	IqHl3QjQzXPC0zcvDaSNY7DttFmRt9KBtZsfFSRKBVMiT5GIjIMom7+sCC7kLURDR9ehhuqGGMq
	Hst6g/zCWB8mzbNIVP4bqs+AP9hyEiW0apZSBHn5clNoXa2nsMn14PU=
X-Received: by 2002:a05:6512:1302:b0:5c0:4e3:a416 with SMTP id 2adb3069b0e04-5c156e375a3mr617826e87.1.1794312326336;
        Tue, 10 Nov 2026 04:05:26 -0800 (PST)
Received: from [10.127.122.226] ([5.195.0.150])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c159702ae0sm240512e87.20.2026.11.10.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:25 -0800 (PST)
Message-ID: <91a4fdf2-638c-442b-be29-59e05c8ba396@gmail.com>
Date: Tue, 10 Nov 2026 16:05:22 +0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance on
 Exynos2200
To: Soheyb <soheyb_boulaa@proton.me>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 02:15, Soheyb wrote:
> exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
> but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
> count of the high-speed phy therefore never drops back to zero: after
> the first init, every later phy_init() of it returns early, and its
> clocks and supplies stay enabled across an exit of the UTMI phy.
>
> When the high-speed phy loses power while the controller is suspended,
> it is thus not set up again on resume, and the DWC3 core soft reset
> times out:
>
>    dwc3 11210000.usb: DWC3 controller soft reset failed
>
> Exit the high-speed phy when the UTMI phy exits, first, in the reverse
> order of the init.
>
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
> ---
> Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
> uses the Exynos2200 phy ops and powers the USB block off in system
> sleep: without this change the soft reset failed on the first resume;
> with it, USB came back after each of two system sleeps. Not tested on
> Exynos2200 hardware.
>
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 087d552..0bee928 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *phy)
>   	u32 reg;
>   	int ret;
>   
> +	/*
> +	 * The UTMI init initializes the high-speed phy; exit it in turn, so
> +	 * that the next init sets it up again after it lost power.
> +	 */

I think the function is pretty self-explanatory, so could drop the
comment. Otherwise looks good to me, nice catch!

Acked-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Best regards,
Ivaylo

> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		phy_exit(phy_drd->hs_phy);
> +
>   	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
>   	if (ret)
>   		return ret;


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212960;
	b=C+pOnrhIRBWjWIIBr6viY2+WTeIRrXIawbOxrGUCLoLeSh6VJ2rHcZGSAyaUpgWKeDZU
	 R6Jl2Z8jHfVeTZKZ+PWXyL+GgUhPWe95Qs7YUj4WZTjhQgnl7Nc1U/Wyc0BOvS52OsPy1
	 P17aMi7EK1nbWV9Nr6Xu2HnQxEDn1l3NwlcgP6Ggyns9jrL+kvowI1yKNWvD1+Yxc3Aoe
	 wCdKH53RSSO0OPKnwz0dYuv6Q2D6NpCUGbKlWfPt2xK3zQzWbRgrCL0Xk7iZbNHDtE16x
	 PeZZyvdQwtpeQW0jG80aLTYzYDlJXDALorsUUH4q8T4440FuZH7ozTI8zwa4UPfiTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
	b=bt3vIxpKcKAtfS8d7i2qHJBKk0cY2OZxTaf3ezjkrsiKP8YQ7VwL7q6DRJ63/UB/SKPJ
	 UDoiKrrxM2YgxZKYgWlCi9KOFDnEcFBOTmJTs9D5sw2tpPj3wcQuPkMwzrnW9Zl5ifYAG
	 ozTKaHlm7OdssS/o2iO/tVoUpjGGTDpomV8Z6qQG82eKJ6yQrWyFdeomjGChha/XgzmJQ
	 9Kc042PeqR0R1eBaPUkBIXVxwN4AV7kd2Yp0AuikdMStaqtUG2s9ZPVpyQz1gDk/9axU+
	 boxlqv6JRiVi/T5QYqm5Eai64rss/UCAiSHwfAomeqna5BoigudVqx2XSkPwF0CbIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A10HiXbS;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46099606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46099606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A10HiXbS
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so333660f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212957; x=1794817757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
        b=A10HiXbSnXdcNEg8XH779gF/snNxTYx/dLP+bTh+RMOwoS9bIhKJb+FzUoy4OJZr55
         NfxalrADRbGGQXHbnwn7pJ+Cn3qN2QIZ2Ulmz+OPYGJLhx80D/48cm5WRAzoRdA18agC
         q6Hx12uiSmkKeUFrufWn+YyCTsiPc/qAERLZXG7Cf57nH9FGV3rxE77XqxAi/FcPbviN
         G6FqfD7SbAUAGL/rkiZKpA0gN/0Wo2yojioiE44fRCr0NiztB4d7kJBVMFGlId/W+gvH
         BLGtomKhZWHPPVJFaV8kgY6GGHYMUv1d8mojhRHptTGLW3MsUmshn1xw1R16cQ2y7fql
         XLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212957; x=1794817757;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
        b=SuYX4ZDjsESOAy7J+CQcxF9muIh0E/iFP3XBGkYuZVqnzc5+JMZl62o58Rvy+Li341
         O7BCKAiLWCz0b5XrK0RTK9f1HTP+FgyKwi/yP3/5akv75iV4Lg1UKP1l1S5g4hQJtEa4
         hPB5mrY5dzLhZhzj7ShW2sSk2zCEN/fbWMAmQ7lFE4V25vwASvI9677eB2qH07aVj3Og
         zErvPxPeEQuiQ7h6En99rYSS87kMrstdhu7cEueCYf63F3r3JfIM8L0XlPGc7p0hgxMB
         7h8aBZXauJRlhIyU0N1KIrkfugCOkibdEgX0LDGFhG7OFe/mPBCnt38Q20z/QP5tF63P
         q82g==
X-Gm-Message-State: APuU4Z9Ydr/AqVWKzpgrxzW3nHfCQf1IF1VozuGKzIj+p69Mo06z6wg0
	eRxKN7e/RPNqanDMWdqnbYGOT1UWR8UVJHXSCfBkE5N0fv28Iu3UwFq7
X-Gm-Gg: AYBFou0H5QjDeDkAwXACHWJHrEkrySDI0W49Vxsuop4C3U1erGP+yX7XZdqw0O/AAlx
	d1lDrtTmtolrVuZ3KlXHocuVj0GM7ypzNcSAWjB1gYWRUnLMuAJ/rrYHjhSmtH84aOTjjlBq/Na
	TubveZ5Ao7+CN8GV/48EEBv+KD68+dCh0fcOduWgr4wOG84z2WvMdR5ulY2Q+akgMf0MBrbb4yc
	XqW5SnnttbpXA5K+vWNiyNlEjQGNo6AW6agR79ooiwBexnYUcOPE/mFPlAzpbJLNCbUVC4FvRLb
	pLxYJzbIvixSdcSmw9V4LH9WQcbqvcYircVgXrt4MBBSExeZvQCbU667tY2mTGTC35/EJfs+Ts8
	sg2g0S9RofNgyirRLIymziTc/c+IQnWvs3AoUJYh2RDwO5S2srZ4nGRHIc4kCR/o8lYrhRC/cuO
	Cy29wVw4WsSiANlSj8Mw8+dSrrlWdnjBlUFHAOLm8bQZBv7QMi6daWw/yBVWiLqoh4AnhIH7kM+
	nd4tiJN+89xWz9K8x2NaB5wPYLXTewYA4LxdnhCLf3DqMAUanXiH9Ur8JE47hN6PfWj+AcKIO7G
	MV5v4GZP3BIvCWBtT9YDVR6R+n1tMXAblGJDea752YDbRB69ZOFEKmbCJho8fxR5NYsKPicmiem
	3P5VqwzYmthvm4aAt6P7b91Pq3g==
X-Received: by 2002:a05:6000:2dc3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-495846906b2mr5355106f8f.50.1794212957327;
        Mon, 09 Nov 2026 00:29:17 -0800 (PST)
Received: from ?IPV6:2001:9e8:f10c:8501:a9dc:44b5:c574:7f39? ([2001:9e8:f10c:8501:a9dc:44b5:c574:7f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959755d423sm8459276f8f.40.2026.11.09.00.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:29:16 -0800 (PST)
Message-ID: <c9e116f6-ce3c-4cda-83dc-4e96c7d58aa8@gmail.com>
Date: Mon, 9 Nov 2026 09:29:15 +0100
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
Subject: Re: [PATCH 5/5] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 andrew@codeconstruct.com.au, wbg@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com
References: <20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shao,

On 07.11.26 09:12, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> device_property_count_u32() returns an int and reports errors with a
> negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
> missing).  Storing that into an unsigned int turns -EINVAL into a huge
> value, so the "if (!ngpio)" guard never triggers and struct_size() then
> computes a huge size.  The allocation fails with -ENOMEM, hiding the
> real error; struct_size() saturates on overflow, so this is not an
> undersized allocation on 32-bit builds either.
>
> Use a signed int for the count and reject non-positive values.
>
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpio/gpio-line-mux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> index b4452d956b..19e4212de2 100644
> --- a/drivers/gpio/gpio-line-mux.c
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -48,12 +48,12 @@
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_lmux *glm;
> -	unsigned int ngpio;
> +	int ngpio;
>  	size_t size;
>  	int ret;
>  

Nit: Please adjust to keep reverse christmas tree. I think 'int ret' and
'int ngpio' can be merged too.

>  	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
> -	if (!ngpio)
> +	if (ngpio <= 0)
>  		return -EINVAL;
>  
>  	size = struct_size(glm, gpio_mux_states, ngpio);

Maybe return the error if < 0, instead of -EINVAL for all?

With those addressed, you can add:

Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Best,
Jonas

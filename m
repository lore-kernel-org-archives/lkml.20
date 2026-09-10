Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1064825DE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046165; cv=none; b=Y5YMObyIfRNBCOjgchaJ7mdNdUJYz7dCANrmI2SvTWstGnHIvj/LerWj62m376+KzsuzPcJ1kbcTJ5EdcoUJCFvg+vcC11DPuwsX8VGQYFVUPrvLkM0PkiBle5xp/6g+gIolIBTdOB4HrY2fGYen/NQCcOmeHmk/zr7aNbAaNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046165; c=relaxed/simple;
	bh=5yTTq1/XsmwCBvY8kHAUtMKgJZVPGmWsxtmZqbt+3EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxO7lArKS62bp8TVy0lpfjOmgnK8hPuX3fyMbLL0FS/QLQbGv15a1tC5QqUZ4QtgcrSXQNl3pANAangjocRJXCc24sKMES8gBlHrB3bTuPpOgMb8UK/uWf8LXOrLUIB1cmrizp48cOHda/x/AfD23FRlEBCRp8wmoCzO1F3KEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rcbdtcjg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NMyxUmKz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rcbdtcjg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NMyxUmKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789046162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1OZi1zQ+XqiZWXGSYJusIHWCY5uWKCZSFZWv7Uia6Y=;
	b=RcbdtcjgdVWjIjoyPjRolB6+LIC46lJpamE5GuswgCSGO5NGUuOBlEYMnfMzyDR9DxAXRk
	vJtgd2iKR4iJfX3nfzLPym1q0YIks1uhkvi5qCL2woVFf7+mlIEUYY2+QdtYln4PwLudun
	Fv+IXE88EYBCqsZMsJtevGv7dFPlWII=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-hvAtknZPM2aOkdzeFx-Gpw-1; Thu, 10 Sep 2026 09:16:01 -0400
X-MC-Unique: hvAtknZPM2aOkdzeFx-Gpw-1
X-Mimecast-MFC-AGG-ID: hvAtknZPM2aOkdzeFx-Gpw_1789046160
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-485afdd5079so1550396f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789046160; x=1789650960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1OZi1zQ+XqiZWXGSYJusIHWCY5uWKCZSFZWv7Uia6Y=;
        b=NMyxUmKzORHr7zX1F+GXC75UpP0h80zXEcqZq7Km4H8yfzzcYzz16RlCjyOPgr9U7d
         foUMbgP1IWFsEP0qYbJMjkj0ZpClIQV41Xec/Qb/EVm9TY7ml44ZdTjVQvl7KoZavtdL
         PfK7G9Vur8g5KVd0Mzzsd7FPIVZA7YYFxT+f6NDWO945Ftgia1300hNMRJDXm62RU41z
         rpbZS4Nl/hw+lO778qxbcXDx6kym+RKkmzEzDfpd+pKFg38SsVsh5xbUeoSzMwsCg801
         dJ8UqhAo5pcXeVH0l4fhZ8G4c8qbAkq3KuBacwXnQBpX05ji8mkrZubhpCz1bMl0fb+U
         O9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046160; x=1789650960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1OZi1zQ+XqiZWXGSYJusIHWCY5uWKCZSFZWv7Uia6Y=;
        b=sj9h3B8xdScHd6IIPpTb4xe1HKkimad82Fmw8eH4gSKxhJBB2HBlh/JULvNPHDN3kx
         +DunmRNbVYxAHxyD1lxNHKlixvn4EbggAswhwTR67VVroI/hpGIVceDK2H72edipMsVa
         TM08jIJLod9fWy9I8bBRIYZ7tcRh8lL9FcU2kuUjCtjdQZvZ0MxSLH5gviU53tATRQBp
         NmCvXIzwclQQ8SnqnA2xGs9kOzb2M3CFfYK6nnnHJNckX7VNLNvw8M39eaP6NaTwaNd3
         PH2Kk9of7ScdiHuGYf0gcjNz20okTE0YYU9y9JckAC+Cc+HqT9gaQ/JxVHYXr9UZQ1x0
         /2hw==
X-Forwarded-Encrypted: i=1; AKwUvBzt0DRuQDeIlPJKUnW8hGod8M/3mHB2JU+DUEKqJtRE4Yhbx5DopU19WWB0DEBI2eh0ATnS0hm7SmfZ/zw=@vger.kernel.org
X-Gm-Message-State: AFuF++kYd7yHB6XSgLBe9jqkdMa3vA45I7v8qNTeTqSIlMV7xnzFxMiQ
	1ZjLM8Q7Ok3myYXZ359By91NGKEcpVUTI4mVhzQzhd5H8EZaXR6YWjCPK5LYIDw+Nrf+x62no4c
	bvJMOurFjhLzeU/Ap91NS6wkDJADRkmB8m3W8LgBOqCfg6XXs2cGik0rXNy/IAYPFzw==
X-Gm-Gg: AYBFou1pkhu5DNxh1+GyOrqsipi+wBgyKACVTifXQO1MSNr7oyxFSg4iWXQVbVlzzTC
	rxyNke6s/FPQGke55ZRrftn1iCfQa0hmyM+dOkNYXG4VsYVufa4fDykunyaO7nR7HLiQnXOsA4O
	7s7KlL5oLyWnznJJbf49VWXNDlgOWRvMkLppwaiVLDObrGNmMeLRnATKLJY2yPsTtQJ6IBFmexG
	rLFD0mZDCIm+ZWIiqJXhPHw8PAsCh+xULodcV4ssvAgITDTDOo3CPya0BYnoNKaTi8KCZnway94
	ORCHAT/KVg4OQP1TUSx3dsCyzGtRXHKOJSmyLufqTk2KTLgwwFXuRPuxgkW6CTFPjSSiwTanLg8
	RIQviy9O7SRyM/X1+MmGpHFrhAEy89/42xLg0XoYivq3+JQw5p8P8mPTl/OW/77S2EKvwpHfT5g
	==
X-Received: by 2002:a05:6000:2f86:b0:485:8ad6:1af9 with SMTP id ffacd0b85a97d-4858ad61f16mr39481764f8f.12.1789046160217;
        Thu, 10 Sep 2026 06:16:00 -0700 (PDT)
X-Received: by 2002:a05:6000:2f86:b0:485:8ad6:1af9 with SMTP id ffacd0b85a97d-4858ad61f16mr39481704f8f.12.1789046159707;
        Thu, 10 Sep 2026 06:15:59 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm50809210f8f.35.2026.09.10.06.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:15:58 -0700 (PDT)
Message-ID: <1a1e531c-90db-4a68-bce1-517ada2fe4a0@redhat.com>
Date: Thu, 10 Sep 2026 15:15:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next] net: phy: air_en8811h: select LED GPIO pins
 based on AN8811HB package variant
To: weiting.lee@airoha.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, linux-kernel@vger.kernel.org, bjorn@mork.no,
 ericwouds@gmail.com, frank-w@public-files.de, joseph.lin@airoha.com,
 wenshin.chung@airoha.com, lucien.jheng@airoha.com, albert-al.lee@airoha.com
References: <20260907015638.2875763-1-weiting.lee@airoha.com>
 <178897303632.219967.12350879229326827803@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178897303632.219967.12350879229326827803@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 6:57 PM, netdev-bot+sashiko@kernel.org wrote:
>> @@ -1115,6 +1167,12 @@ static int an8811hb_probe(struct phy_device *phydev)
>>  	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
>>  	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
>>  
>> +	/* Detect package variant */
>> +	ret = air_phy_buckpbus_reg_read(phydev, AN8811HB_HWTRAP2, &reg_val);
>> +	if (ret < 0)
>> +		goto err_dev_create;
>> +	priv->is_an8811hbcn = FIELD_GET(AN8811HB_HWTRAP2_PKG, reg_val);
>> +
>>  	ret = en8811h_leds_setup(phydev);
>>  	if (ret < 0)
>>  		goto err_dev_create;
> 
> [Severity: Medium]
> AN8811HB_HWTRAP2_PKG is GENMASK(14, 12), so FIELD_GET() yields a
> 3-bit value here, but it is stored straight into the bool
> priv->is_an8811hbcn.  Any non-zero package code therefore collapses to
> true, which means the whole variant decision in
> an8811hb_led_gpio_setup() rests on the unstated assumption that
> AN8811HBCN is the only encoding with a non-zero value and AN8811HBN
> reads back exactly 0.
> 
> If the field can take any other value - a second AN8811HBN encoding, a
> reserved code, or a future package - it lands in the
> AN8811HB_GPIO_OUTPUT_0115 branch and the driver drives GPIO 0/1/15
> plus the SEL1/SEL2 mux for a part whose LEDs are not on those pads.
> That failure mode is silent: the LEDs simply do not work, and there is
> nothing in the source that documents what the encoding actually is.
> 
> Could you define the expected package identifiers as named constants
> and compare against them explicitly, e.g. something like
> 
> 	pkg = FIELD_GET(AN8811HB_HWTRAP2_PKG, reg_val);
> 	priv->is_an8811hbcn = (pkg == AN8811HB_HWTRAP2_PKG_HBCN);
> 
> so that unknown codes fall into the conservative branch rather than
> being treated as AN8811HBCN?  If the hardware really only ever reports
> two values and 0 is guaranteed to mean AN8811HBN, please say so in a
> comment next to the assignment, since the reader cannot tell that from
> the mask alone.  Also, is it worth warning (or failing probe) on an
> unrecognised package code rather than silently picking a GPIO mapping?

I think we are better off without per pkg macros until there are only
2 of them around.

All others are doubtful nit-picks.

@Weiting: note that you are requested to address sashiko comments
proactively.

/P


> 


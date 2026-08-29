Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8A5474F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008776; cv=none; b=GpiSz66RJAduVyuQayKs9plg7exylBYsoYLvemzLtsqesQOXj7UOILpgD1yVqc28zYWxG9QZ9E4Y3RTVWvIuOK0qlAhoFNLBPJukjNliXcBm1L+dp5GrT3e3k6Tm56XRP43ePGHdaWundyklK5B2VaCOxgd1wZUYUwhMDZ+orGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008776; c=relaxed/simple;
	bh=QyePVgSgntKbPOF5HNZ7ZVtA1SOpKXV9ugVrJN2nBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB/7kcc6vSMYX6FaHmZjFa+hb4hpsaUMPR3Xh19oDvnoKCAMD9Kd9HcDaevDaiNMo0L/BjdPNzYphpxWiYCVSyi+OEBJ7Gp62/LUVLIeahDY21yLux/ir6XShMTMZb3xCGvN20hiP7+6otqNlG/1GqZHccx0INPVq8FyibCu3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAr5pcLK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAr5pcLK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so2236029b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788008774; x=1788613574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxUY1SL27+UsLjI3ipAM6u1C7f8w0P8IFMgoZ49BAgw=;
        b=LAr5pcLKc41iVck5TdL1BWgV0EaJ2NxNlv79FD48YwkcVXzHhUHPD+iVNz5w2ncdxL
         GEo4Nihpltp60kWrnsjVz4oNc6M/cWT3LfIsa3Xigny1IzAHe9ImydPipw8lVx4Kb6ok
         HjT8gU5ezAwMbRNrfvCDHlCBxnGWsLUD2gPfAkK2kHdF6IqoL4G8PSfshJBe+4tzRoFd
         PkXe2EbPXyA0wScBTlKcryLK1YL/Rb8ze0huiSqIXGi1SasT9RwMMVYinEcHIe+zc/J5
         lXSftovsFathBhlLHHKdPUw9PuXl3tvdgPEeyEfvEX9Agicl6c171uzT/pa6IKOMK+AU
         Rx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008774; x=1788613574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxUY1SL27+UsLjI3ipAM6u1C7f8w0P8IFMgoZ49BAgw=;
        b=EM5ZrxI4oNh5ssUulq0IJRmcyJ/PHmN0GeZwffnaDJ2f+AsCbkfbBn9NznDY816Kyj
         oZ8HQE7KYTMh/9bSlNk4d/1j/p2lT0eegdP7epnfQqtxnNRW2gNLEFUFSLe6eHa75cUD
         lGGC/FnpdCKbyqxQJeHGp44UKWwE1mHfxidZ9Ie5G97heX7F4q5870ExndbTjZsWjVv0
         xCdDM1ZX2d7dby1wuhKKB1bvlaI0Cv8VTFsc1zqff5a6DfklpYuNcYvz67F9G0nT0+fm
         yCTJh891O/B7plLlPrJDIoxBLL/KeKDtyS/zOvmLBiWgo5P0owDzVzlbGrIJKhSYszC2
         ygtg==
X-Forwarded-Encrypted: i=1; AKwUvByijEtFFtUg0SqKnKzadFbWb7M52KoQQnStgFLzvS5EKs9CnG8DSUwKUB8j9Esnh1j5AI6QIFKAd4Vlsu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nH267RW4BEpeWvfhATObK7UBjU6DX7IjCzMXXQKznkXqE6B72Q
	2Xp4YgEHd+n8NwhjX2hSyRenO2FIPTXi8rOzbYlIByxLZ25MX/28+7UC
X-Gm-Gg: AYBFou3NTP+i/vylUgXAv5WIbm6nN6/r00Z28eThDWEdy6yyVUfT6sFPcge9mEsnfzL
	3Rdj9Njak6QwHSGInZDP11z9H5oY26Dcl2Y9YRFCU89ieG/4s85K0QHX8tFBnoCOiMso4mtlKz4
	VUumpCOhJ2wdvcO88LdLK8rVqooo7J7xYxut9kqOUsLnNgkyT/N+FgZ6b397w5z42A00MUe6Y7m
	sddwSnNou+L+gLzhGjPN/1w3jLBM4dPBeKaMkwm6Z/4cJDJ/0AEVwkroyPhFDpI8hEqO83S8nxB
	LEUVhIUw5jayeLdzesoCAQ01FC7GyuNjdBANn0gXpmA29Uqh+ziQ1lQV6ugUI8ok6KtqG0PPTUF
	SIqNcniIWH1CR452jEd8HEozp+K1JzENHA1OXduJpbu6gmY3sWgiCpqnHVj1cIW4/FUvWMd95N4
	xka5MqajuDWV+izb0cz6TmBRpLBWGQJm1F20jfHdJFUoWVwGfaP6rjiWqV9YsVH589xjs5+DZK9
	DXizpNRqL85yc0ZOb+Q6ppAHvLEcQ==
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr25514114a91.3.1788008773691;
        Sat, 29 Aug 2026 06:06:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:54de:b26f:8c97:cc89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm16489606eec.13.2026.08.29.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:06:12 -0700 (PDT)
Date: Sat, 29 Aug 2026 06:06:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: x86-android-tablets: Add Yoga Book
 audio GPIOs
Message-ID: <apLZF6b3F39z6bUc@google.com>
References: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
 <ed99294bd4ac7cd40fa0b2053795aa24b27a632b.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed99294bd4ac7cd40fa0b2053795aa24b27a632b.1787872237.git.mauriziocasciano7@gmail.com>

Hi Maurizio,

On Fri, Aug 28, 2026 at 01:17:00AM +0200, Maurizio Casciano wrote:
> The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
> itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
> headphone path, but ACPI does not map either signal.
> 
> Add lookup entries for the codec device so the Yoga Book ASoC machine
> driver can request both controls by function name. Register and remove
> the table with the tablet description lifetime.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse
> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 88693b9a1b01..8a69194a724e 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -345,6 +345,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
>  	},
>  };
>  
> +static struct gpiod_lookup_table lenovo_yb1_x91_rt5677_gpios = {
> +	.dev_id = "i2c-10EC5677:00",
> +	.table = {
> +		/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
> +		GPIO_LOOKUP("rt5677", 2, "speaker-enable2", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("rt5677", 4, "headphone-enable", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +

It would be better if we used software nodes here instead of lookup
tables.

Thanks.

-- 
Dmitry

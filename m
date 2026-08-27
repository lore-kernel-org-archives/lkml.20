Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400F342538
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811215; cv=none; b=MllmReSIINlW3oyo59NTrkqAoWp1IkQSE443ZUaXSw0CR5oxkUcoyJLZnEJTODWYPLpJysIIyaPUmYKcbmg/pAXb6A9b4ahWlWGewfYimDdHGXtWrbYoxx9ElIsHTVzBQaOF1PlAssqxTHGE8tQhvDSf2ZBIK3mLVndqmoebI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811215; c=relaxed/simple;
	bh=jDdgZH17D1vfbwDBwFJWWkxbXBa6RDc0srPWzM+18ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muAEYrb19S7lkrqSVXRZbv/pPRtF2s9J+VZhaaQowOeWtFjYo2vgUpB6XIYna/2xcx0NIZts4ugU875vE7SZboA9uXhhqPqH0IC4lsFQM36uL5Dn1ZZyAVoMwdbJKgf9qYLBsDNG0Y0fCE7Ka6R1iTBHF1LqH/5zhj0obGhHqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlYYXnAR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlYYXnAR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482c58a8683so199066f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787811212; x=1788416012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lMbggc8NhQwvUFDG+z6sVwFxEQ7RmYHvoRw1OoYWNQ=;
        b=RlYYXnARj2JQBRo8O3A8qsVb7frLfkYocBdk2RExeqHRUfUieHc7AMRMWbSebktvrQ
         llhM8PIFDRtbBh4gvd640UwJ0iOfpZYCz9+FhOsRKKq1M9HgJ4ooSjqmyaQFXOMMWZ8a
         xxVV12Fded8/Lyps6ReYQgjp8a5SOZH6z7JlMS+EcaZWqU5qZdV8cWeOSZAoNwOMMMkS
         7WvTNrNSpewI/8tci/9iNzxpT3XCMT3xjnksxK+QPZ9WFWjNXVCFrk5L965HGWY7Ffp6
         wIZrfyTkmIQCzmS+Nn2BEk3usXqRd2CxyH7oU20g+5gzEGl2dTx6URNFbAIg61iWyVJz
         6RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787811212; x=1788416012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lMbggc8NhQwvUFDG+z6sVwFxEQ7RmYHvoRw1OoYWNQ=;
        b=tZxW321Aa6hvWHvTeVDcD8+CU3qSTzk5JM4mexUnam1F9tt+L3G5ox7jO0tpBD1C2N
         N/Kl/q+755RgME9gR4F8vnZ0g738OY2jQMCiZ+7IdgRW7RoDWvCEuJIEqTEbLUeD4a0b
         ps5CzHxtT7x4v66jDtJLXxs9pW3UNFALb5gsLlSWgsFn92h4ruMoqwlXPE1wLfqTo5QB
         cWFewzhDLt6Z5oizjW13ziYUec+LTAtjR+xfYjBHzOU4krk3HRfdaZP2uxSloQPAfxQc
         zBXkLgCJScR4LVjp4RkRf8jBuNXfSY3hD0RzDKwzrHAedXSia1URfKxsRRtos5DjTyV9
         DiHg==
X-Forwarded-Encrypted: i=1; AHgh+Rpmb5a6B8IKMf4FKDuGi+h6OYXHjCn4L2CSs7WXV+uBWhHF/Rge6kQL2y8MyJ98YB96e4ZbNXXN8B7h8t8=@vger.kernel.org
X-Gm-Message-State: AFuF++mBwzp1IB7cqc0IrZrX/63dhBNbxt/Y+apLYpYejFtL5hKLn8xo
	O80GsVLyh1i+QvagBmXP7kD0IdJfZSwNZcSa68Eit7rCXndR81+kZrTp
X-Gm-Gg: AR+sD13uDI5j/l315NgaSPSVdrOzl2E3KJ6kDwD7/qOoRX+ByRFC0VAArWD9/ilEWr4
	SVkI+syoZJ1iEJQFzqRwAbSSxyzCqg466zg8QG6xJzRzXetvof+KhLA4Uuf+L1BIXhcgqNtnJeJ
	Dfh/dFhU9Ml8Q5pCHCInZT1lo1MuriWxu1b5l5k+Vp240s1Gun1NeB52F/W0kM82pmbBcVpmMAh
	bKG5EeEYU67fAT4KQN9JVaeK619Pte3H1+j+AOhpWjZgGmcQBrUrfh60AR0RMRUzCfxg60sxyMq
	jKn+24mlOrgR5Xm8ZsZNVBfN7xnEE06Jz4DoKDLns2r5ofGnNd9f7eXFzeR67KBJni/NWXJk1zX
	LGYhFCieqWgIANjwoh4gyOS0B63wYoEoXirR3T72KZ/2893rkIq89VLvD4XRj//KthdMBuUzxa6
	VOK2A8G6bOwK/xEWrwj5qA4zJG4kcxCj4JzFLQzVPuK40FBrnNSnEXtV5RZUT3PIHe4Aste2IK
X-Received: by 2002:a5d:6087:0:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-482e26f16f4mr12397707f8f.12.1787811211362;
        Wed, 26 Aug 2026 23:13:31 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm6225688f8f.27.2026.08.26.23.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:13:30 -0700 (PDT)
Message-ID: <09b589a1-2661-4365-a87e-ebb871e52f0d@gmail.com>
Date: Thu, 27 Aug 2026 09:13:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: omap-usb2: add explicit PHY comparator API
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Gentle ping on this patch. It's been about five weeks since v1, and I 
haven't seen any feedback yet.

The patch is still applicable to current linux-next. Please let me know 
if the approach looks reasonable, or if there are any concerns I should 
address.

Thanks,
Ivo

On 22.07.26 г. 8:36 ч., Ivaylo Dimitrov wrote:
> The existing omap_usb2_set_comparator() API locates the OMAP USB2 PHY
> instance by calling usb_get_phy(USB_PHY_TYPE_USB2), assuming there is a
> single USB2 PHY registered in the system.
> 
> This assumption no longer holds on systems with multiple USB2 PHY
> providers. In such cases, the global lookup may return a different USB2
> PHY instance, causing the OMAP driver to perform an invalid container_of()
> conversion when accessing its private data.
> 
> Introduce omap_usb2_set_phy_comparator(), allowing callers to explicitly
> specify the OMAP USB2 PHY instance to associate with a phy_companion.
> The new helper validates that the supplied USB PHY is an OMAP USB2 PHY
> before accessing its private data.
> 
> The existing omap_usb2_set_comparator() API is kept unchanged for
> existing users.
> 
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   drivers/phy/ti/phy-omap-usb2.c | 32 ++++++++++++++++++++++++++++++++
>   include/linux/phy/omap_usb.h   |  7 +++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
> index 1eb252604441..ac31b693fce7 100644
> --- a/drivers/phy/ti/phy-omap-usb2.c
> +++ b/drivers/phy/ti/phy-omap-usb2.c
> @@ -70,6 +70,8 @@ struct omap_usb {
>   
>   #define	phy_to_omapusb(x)	container_of((x), struct omap_usb, phy)
>   
> +static int omap_usb_set_host(struct usb_otg *otg, struct usb_bus *host);
> +
>   struct usb_phy_data {
>   	const char *label;
>   	u8 flags;
> @@ -113,6 +115,36 @@ int omap_usb2_set_comparator(struct phy_companion *comparator)
>   }
>   EXPORT_SYMBOL_GPL(omap_usb2_set_comparator);
>   
> +/**
> + * omap_usb2_set_phy_comparator() - associate a comparator with an OMAP USB2 PHY
> + *
> + * @omap_phy: OMAP USB2 PHY instance
> + * @comparator: companion PHY providing comparator operations
> + *
> + * The phy companion driver should call this API with the companion PHY
> + * implementation containing the callbacks required by @omap_phy.
> + *
> + * For use by phy companion drivers.
> + */
> +int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +				 struct phy_companion *comparator)
> +{
> +	struct omap_usb	*phy;
> +
> +	if (!omap_phy)
> +		return -EINVAL;
> +
> +	if (WARN_ON(!omap_phy->otg ||
> +		    omap_phy->otg->set_host != omap_usb_set_host))
> +		return -EINVAL;
> +
> +	phy = phy_to_omapusb(omap_phy);
> +	phy->comparator = comparator;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(omap_usb2_set_phy_comparator);
> +
>   static int omap_usb_set_vbus(struct usb_otg *otg, bool enabled)
>   {
>   	struct omap_usb *phy = phy_to_omapusb(otg->usb_phy);
> diff --git a/include/linux/phy/omap_usb.h b/include/linux/phy/omap_usb.h
> index e23b52df93ec..96f9792c6ce6 100644
> --- a/include/linux/phy/omap_usb.h
> +++ b/include/linux/phy/omap_usb.h
> @@ -15,11 +15,18 @@
>   
>   #if defined(CONFIG_OMAP_USB2) || defined(CONFIG_OMAP_USB2_MODULE)
>   extern int omap_usb2_set_comparator(struct phy_companion *comparator);
> +extern int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +					struct phy_companion *comparator);
>   #else
>   static inline int omap_usb2_set_comparator(struct phy_companion *comparator)
>   {
>   	return -ENODEV;
>   }
> +static inline int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +					       struct phy_companion *comparator)
> +{
> +	return -ENODEV;
> +}
>   #endif
>   
>   #endif /* __DRIVERS_OMAP_USB_H */

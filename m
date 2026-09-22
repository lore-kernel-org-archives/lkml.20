Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC554280E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079549; cv=none; b=OLeFl6KO4rZbeKEEXQ8k4H2vPTDDul0xY80D8LICuvoahWwGGViW12DHXgxNSJiCTWthPAY6LrecBu1qIMISvgLFrsXRKST48rCFxRA/sPZc002nAJVsyJRsFUHbNY/P38bAsF7vW7Fwg3TqIjYFSoV9dERYB1/xGmn25mOwGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079549; c=relaxed/simple;
	bh=l/N4Obxa3qgIEYJcYmPAv8aHX52C8bN08nhVD2V0YFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r61ijnkodEgFYdOS0/kg85Jbe9/LGnuolNq6mSxrItACodwR+jBMoASLmv9U3iFTgrEJh3bOVtlVaW7KZSh4LLhGvkhzAfUBLNu1leFQuUNW22xFm5k6ag4y17JPIVKpjYgJlXJo696vwGUNLbkiXVfL+m3fivfPHI8unr7Ip44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YA/2FEXW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA/2FEXW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so22712505e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790079545; x=1790684345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5u3EIzpPsS1zIA0D9Df1lz7j9vWVWGBTpUVoDk4tGw=;
        b=YA/2FEXWzCUrq6yRxSpeWWi/mOHKQDrO+7g//Y4YrQ4gRH9s/0B+tIogHV439r/aT/
         hGxbRlVQ/R2CTvQF02pr87iUr9Od0MOyZjblai8OX6TwlSOm7lWFmOhJGsTazhMy85YH
         uOhb79KjHCR1tnoBn73j2vBpqIcAT+pc545VXJeQvbwnyQy3qW7WNWwOAa92M1YFS5cD
         Pvd4HpLJz8WAWDjQu34ES3gTcejPWU9+qkxvQWrgob7Cq0ccmQmoAXMWbOljxYJV0crO
         0jjFLN1A/U1OREeCSl0IQyT8WqZWA/cSuQqEOSXk0RhwUjkI1vOVstfZIlqv0QO80oE4
         2+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079545; x=1790684345;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5u3EIzpPsS1zIA0D9Df1lz7j9vWVWGBTpUVoDk4tGw=;
        b=udzawSN6kxVf6eGpYBxUsTVTUq937HHIYwgk+5+ZZEDamtHIkfEiR0j78+Q1Y1qmrx
         q3QbtJCxs6vJ45zOIy7ak+m+k5BOxOWKC8Z5wQVlVtItAgTKiHukyRgbKK9QSLCKT7Hz
         sHxiC4S46l8taTlD5pXvMTiNUpI6jZd+uPpIC5v1JL9NpHG8yno447aaE/WxZ5tfUnKW
         eUz63mvNVdI1RHXiohm57DjemibIp9IVuKtKOfc1eCrKQcwQJJxrcaDlIJTFvXQZT/wO
         gdZsLECc8xMmOwUiv5cPcq8lH07GVtMPx2JAgaT9wTJvZzXza6GcLX53qW/b6j0bwZMO
         +NBA==
X-Forwarded-Encrypted: i=1; AKwUvBwlu1i4KjF9x+Hc8fi6EWHD/UPB0CuiDlRRQ7UbyXF/CIjkVhXslpDHBEi9/hhE+UqoT8PNLNzvBUw2HME=@vger.kernel.org
X-Gm-Message-State: AFuF++mviZAKCt10Iia9uBDiRWyMSEty6bJ65lZ6egXMLaUV5DHo7wYc
	HR0GfPrsff0xMqHATiWtW2TMbxFDiF2l4FpdZoHaLUOiBqwF5jKZ/X0xKbB6awq45Ss=
X-Gm-Gg: AYBFou0qNSIqudLZ6Kjj8D4eiw4xXumI4Q3PNCnrJBCG1nKM9dY5PUYTDgmGsFjpX0f
	HXf1JFywW2sMbOGkzbyD36iUrTIzZeSMyZXeuvnsGeUu8y5g0huMGnQTV0jtlHPy/73fCgZE7+6
	bAzajrgRrPxt/9Sb5QRiu8rq74qGZk6pyhJWwPIEOKXiTLbc9BYskbTguKeIcuEFwB+EBISiXPW
	NGHyZ+kurY8wr4ItFl/dmKnoCNy1y3v+eqNIRY0SLnCgpzp3DX801OSyBvs9Yygy66eKrFExjOE
	9b5BsllLF3ppYIqwaDr0ZRLWd5r7TWfopIOUVcyQgkO18bAuE4IvH5mUKxuMMG1yScTXOJ4MW6b
	TSqD2YqMQsVGzVseXlKmOR/F21Fbw088kv16x3ysIqYZ7hrKAY2skcmtF45bmztdzhwOmpIjnpB
	P2qsEzG2qhXGkiG9MK++0Az2ior/yeX4TlDq3fmL5pAWknk2BelQ3wg+axgyTFhLniaUWbnQsaL
	l7lSe0KwPejhLH19B5rmC+56fBfCpgaK+aNtCOl+68BgN+IZBdqQA==
X-Received: by 2002:a05:600c:6088:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49fd6f0406cmr64899245e9.19.1790079544988;
        Tue, 22 Sep 2026 05:19:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862775412sm4849378f8f.10.2026.09.22.05.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:19:04 -0700 (PDT)
Message-ID: <5cadf2e6-9dbb-4320-b866-cf2fad599c41@linaro.org>
Date: Tue, 22 Sep 2026 14:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
To: johannes.goede@oss.qualcomm.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
 <49c7b4d8-a8ec-44e1-ab06-220cf3698ea0@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <49c7b4d8-a8ec-44e1-ab06-220cf3698ea0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/26 17:35, johannes.goede@oss.qualcomm.com wrote:
> Hi Neil,
> 
> On 18-Sep-26 16:10, Neil Armstrong wrote:
>> On 9/18/26 15:56, Bryan O'Donoghue wrote:
>>> Add new function phy_get_by_of_node() allowing lookup of a phy by
>>> device_node. Separates existing logic in _of_phy_get() into an internal
>>> helper method _of_phy_get_with_args() to allow for reuse in new method.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    drivers/phy/phy-core.c  | 83 ++++++++++++++++++++++++++++++++++++++-----------
>>>    include/linux/phy/phy.h |  6 ++++
>>>    2 files changed, 71 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>> index 89addd732bff3..42c27a2b45159 100644
>>> --- a/drivers/phy/phy-core.c
>>> +++ b/drivers/phy/phy-core.c
>>> @@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>>>    }
>>>    EXPORT_SYMBOL_GPL(phy_validate);
>>>    +/**
>>> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
>>> + * @args: of_phandle_args to the phy
>>> + *
>>> + * Returns: the phy from the provider's of_xlate, -ENODEV if disabled,
>>> + * -EPROBE_DEFER if the provider is not yet registered.
>>> + */
>>> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
>>> +{
>>> +    struct phy *phy;
>>> +    struct phy_provider *phy_provider;
>>> +
>>> +    lockdep_assert_held(&phy_provider_mutex);
>>> +
>>> +    phy_provider = of_phy_provider_lookup(args->np);
>>> +    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
>>> +        return ERR_PTR(-EPROBE_DEFER);
>>> +
>>> +    if (!of_device_is_available(args->np)) {
>>> +        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>>> +        phy = ERR_PTR(-ENODEV);
>>> +        goto out_put_module;
>>> +    }
>>> +
>>> +    phy = phy_provider->of_xlate(phy_provider->dev, args);
>>> +
>>> +out_put_module:
>>> +    module_put(phy_provider->owner);
>>> +
>>> +    return phy;
>>> +}
>>> +
>>>    /**
>>>     * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>>     * @np: device_node for which to get the phy
>>> @@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
>>>    static struct phy *_of_phy_get(struct device_node *np, int index)
>>>    {
>>>        int ret;
>>> -    struct phy_provider *phy_provider;
>>> -    struct phy *phy = NULL;
>>> +    struct phy *phy;
>>>        struct of_phandle_args args;
>>>          lockdep_assert_held(&phy_provider_mutex);
>>> @@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>>>            goto out_put_node;
>>>        }
>>>    -    phy_provider = of_phy_provider_lookup(args.np);
>>> -    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
>>> -        phy = ERR_PTR(-EPROBE_DEFER);
>>> -        goto out_put_node;
>>> -    }
>>> -
>>> -    if (!of_device_is_available(args.np)) {
>>> -        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>>> -        phy = ERR_PTR(-ENODEV);
>>> -        goto out_put_module;
>>> -    }
>>> -
>>> -    phy = phy_provider->of_xlate(phy_provider->dev, &args);
>>> -
>>> -out_put_module:
>>> -    module_put(phy_provider->owner);
>>> +    phy = _of_phy_get_with_args(&args);
>>>      out_put_node:
>>>        of_node_put(args.np);
>>> @@ -1001,6 +1017,37 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>>    }
>>>    EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>>    +/**
>>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>>> + * @np: node containing the phy
>>> + *
>>> + * Returns: the phy associated with the device node or ERR_PTR.
>>> + */
>>> +struct phy *phy_get_by_of_node(struct device_node *np)
>>> +{
>>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>>> +    struct phy *phy;
>>> +
>>> +    mutex_lock(&phy_provider_mutex);
>>
>> I don't really understand the usage of lockdep_assert_held(), but why
>> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
>> like before patch 1 ?
> 
> Hi, not Bryan but I can answer this question.
> 
> lockdep_assert_held() check that the mutex is lock and triggers
> a WARN() when not held.
> 
> So lockdep_assert_held() is used in functions which expect to
> be called with the mutex already locked, like the new
> _of_phy_get_with_args() helper which is added here.
> 
> This new helper factors out bits of _of_phy_get(), which itself
> already has lockdep_assert_held(), but since this new helper
> also is directly called from the new phy_get_by_of_node() it
> is good for it to also check the mutex is locked itself.
> 
> And since the new phy_get_by_of_node() calls this new helper
> it must lock the mutex.
> 
> Note that _of_phy_get() is already always called with the mutex
> locked from of_phy_get(), phy_get(), or devm_of_phy_get_by_index().

Ok thanks for the detailed explanation, I missed that !

Neil

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>
>> Neil
>>
>>> +
>>> +    phy = _of_phy_get_with_args(&args);
>>> +    if (IS_ERR(phy))
>>> +        goto out_unlock;
>>> +
>>> +    if (!try_module_get(phy->ops->owner)) {
>>> +        phy = ERR_PTR(-EPROBE_DEFER);
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    get_device(&phy->dev);
>>> +
>>> +out_unlock:
>>> +    mutex_unlock(&phy_provider_mutex);
>>> +
>>> +    return phy;
>>> +}
>>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>>> +
>>>    /**
>>>     * phy_create() - create a new phy
>>>     * @dev: device that is creating the new phy
>>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>>> index ea47975e288ae..71c2e16397130 100644
>>> --- a/include/linux/phy/phy.h
>>> +++ b/include/linux/phy/phy.h
>>> @@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>>>                         const char *con_id);
>>>    struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>>                         int index);
>>> +struct phy *phy_get_by_of_node(struct device_node *np);
>>>    void of_phy_put(struct phy *phy);
>>>    void phy_put(struct device *dev, struct phy *phy);
>>>    void devm_phy_put(struct device *dev, struct phy *phy);
>>> @@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
>>>        return ERR_PTR(-ENOSYS);
>>>    }
>>>    +static inline struct phy *phy_get_by_of_node(struct device_node *np)
>>> +{
>>> +    return ERR_PTR(-ENOSYS);
>>> +}
>>> +
>>>    static inline void of_phy_put(struct phy *phy)
>>>    {
>>>    }
>>>
>>
>>
> 


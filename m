Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED350B437
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786632; cv=none; b=HOFkQ0kATdDTFz+oivCXr6H4v4FQc9OY/Q5HTcTmhwDa7Vi7VJiV1pHNF/IFpb87LUVTf0vPA5zDuIcpBG00kQhGSkcMHni5LyBgbWj96iaZgtSIjxe5h4zrjYSc2M+S24j8X+KlsBMc1UCw7w2Qf+w18Q9osUXv5VlWALqKYxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786632; c=relaxed/simple;
	bh=RG9+M1uoJK9hezxLQbQqTbF4w+6gf1Ej1H9zhuRwbnM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eh5fX8dvonWEVgfmE8zwfKYkhiRAKX9kwsga2qTRhtXxhaBkaO+cX7J4KC6Y4wvqWNuQsUStij2VsJXHhztjZVKqk5BrLTtI7i01hrPbmc8HrfoD5I4rpMKL6bgcRWwVOUtqnArcdCfdIfxNLvq4i1eO+dSzmHbLnlD8/MoQLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LrhTpHq9; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrhTpHq9"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so26464496d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790786630; x=1791391430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQuiLgKEFgvUaPnU/nIMejNLh/kt/JowyvkWugrWOng=;
        b=LrhTpHq9+F+rY574Xy+PSCi5b7CgsqnvaWuXnm7k90PC03LH0tTsRTgnOScbjHerBj
         XjHQo2YXHON6RUzVcrhcWPobjsLoWr26l2qNRA4yQKh7zemhoVMZeRG9WpDf4Tart9Hi
         +UNEAM75iN806u+71saRDap/a5sBbbLG+vHmvc8jGUU59BSG2ntLKaTpBuAQ5yerqpeu
         hCkYSOQMe4upQyiDZ/tEoCZY19lB0AX8A/3pMGVEC+eie8Ao1ozeP5cWGpEX/aao3b1f
         dGsxiwN2BPd0q1F6HXYbbGPoczSY1MkUZvcj7AWwOflm+afQwWbzFkQjonLQPED0Wmwb
         ZJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786630; x=1791391430;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQuiLgKEFgvUaPnU/nIMejNLh/kt/JowyvkWugrWOng=;
        b=k7A7qH2drMeACwq7cbY5vsKg+AZASopZ2mGRhxKRbAkzJE2yRRwS8IAiAwIGiVaaSD
         efY2Gvp5JGuzCgaSgIdBD27kaclMqk4wp8+a623xYOQoiFZ4k/AyiD8L2xsjAr5xP/to
         f75+lrIbmUGd4jx8wemPHbZpV9QcxKfDnzrACoYJ0Or6iwhU6bNVdmHWtTyuoG6V0ukk
         7ww/S/lUhSVaStd202xXaY86UCuOs6DkqP1pXWSwpN94G9EGW+kOeTkbtbZd7POqGTfB
         HtZYE7CvuVCAz5XCegCAPkaJ2ip9JvTPM8+latgppzp0xDeJpnABnwgrKiS3rKOuHtKr
         I6/w==
X-Forwarded-Encrypted: i=1; AKwUvByCjFcWHJCpRFlbaO8D2BY8obwiNhhASVBmRQRZvXSF4KsPJk4rV0DwlzHuZG1a5MT6obKJNL8Nmwp4tPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnl/mHfdIPvNPBf7cR26bD33qP2wVNEjdK9awQyZDFd1WI88xW
	KEaGz0SS3l+yRTqiejwf4QLHq+4U/tRMtte9vB0FAJNSHu1NQFzx9DVeUAnVryHTKsU=
X-Gm-Gg: AYBFou3HHuvDmd3Qjw4B95bdAYzgXBuvKatowN77nCoDUSermd2f6EgqGELIN2XJljC
	f+XfFHjJ9uvoX8aajB5+mfqp4YlSiny5U524JE0n2GGk1SdKKbF5NKXB0+LfCWfTYlIJ9H9lctN
	BBFi0vX5PIOfgGM+v6Z+ZPYzo3kevVh9RUHk6CssgwwyjUXtLh0OrZAXP5GI5IJ6rdnoENQDui1
	uDStZkFgzAk8GzZnVyks+ifcgrj54QILF/oYwhiIGD4vxPCwsBA+NRN3z2jo2qcZ3nGFcwVZICJ
	XgtBZ9lfnhXah6/80WC5oiPZRpQpvZRnkldJo+MUSV+/+5vxjtnZ44QNMllDiGBhv2SxK9LTtMZ
	O0YpOkNRNbNWiK3pUXlcuBtMBp5OSnowp4Yv87NDqKJJhR+0IT572GZDPnXilQSDA740r2GP2BB
	WvmOKg69zsMrPvHZZMdbPOPyE7ApCgKHV57WwRaWEVpGGbpDx7YR9R5wnvdUBkvXOC0y9O1p+Zt
	sbdS8KYvoWeuJQC4xTwq21a+EirDdpqp9eAI+8kSvESkfDrXn6Aof3jA0c+dkceupeblobjflCs
	gF1UcVI6Vfv/07IZSQ==
X-Received: by 2002:a05:6214:c4c:b0:912:4680:c96f with SMTP id 6a1803df08f44-917a09cf960mr34578076d6.3.1790786629576;
        Wed, 30 Sep 2026 09:43:49 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89a818bsm3800116d6.16.2026.09.30.09.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 09:43:49 -0700 (PDT)
Message-ID: <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
Date: Wed, 30 Sep 2026 18:43:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
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
In-Reply-To: <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/26 09:44, Linus Walleij wrote:
> On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> This entire binding seems like stitching two devices together, which
>> might be fine (I don't even remember this stuff... two months old) or
>> might be artificial grouping of separate devices.
> 
> I think that's a good point and fair pushback.
> 
> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> https://www.youtube.com/watch?v=6tNGW8PoSzw
> 
> The current binding does not reflect the physical topology of the
> actual device, and the bindings need improvements. I have a feeling
> there is one display controller with two physical panels.

No there's really 2 controller and 2 separate panels, but they are not
classic panel, they are a pair of panels+lens which are in front of
the eyes which forms a single "image" for the brain, so they are
technically a single display and requires to be hard synchronized.

The R63455 is designed for this exact use case and are only supposed
to be use in XR application in pair.

See it like a single physical panel with 2 controllers which
shouldn't be used separately. While technically a controller could
be used to driver single panel, it's likely impossible Synaptics
would sell this IC for non XR applications.

We want the both panels to be seen at a single big panel because
physically the human eye will see it as a single display.

Describing both panels into separate nodes would only be possible
if we described a "VR display complex" nodes linked to both panels
but this would probably be solved by actually describing the "display"
linked to a DDIC controller and is out of subject for this serie,
and can be added later when we properly define things.

Nei

> 
> In that case I think it's better if we do:
> 
> panel: panel@0 {
>      /* This is the two-panel package with one display controller */
>      compatible = "sharp,ls026b3sa06", "synaptics,r63455";
>      reg = <0>;
>      #address-cells = <1>;
>      #size-cells = <0>;
> 
>      panel@0 {
>          reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>;
>          reg = <0>;
>           ....
>      };
> 
>      panel@1 {
>          reset-gpios = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>          reg = <1>;
>          ....
>      };
> 
> ...
> };
> 
> 
> Yours,
> Linus Walleij


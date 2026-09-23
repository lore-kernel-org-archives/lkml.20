Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5F52ED40
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179870; cv=none; b=R41DzIgdV9kBvO5Pskstdw/rlQbPUFH/H56zqPahD71y0VzU1asOLnYS/PD11in+IBUS9xVLHNti0fjl986IA5N0Y/1P2skOm4HiFOEi8QgBJBz5wGkGlm7iKFnnumMwsU4NQdjPifinJUPqHKjwLhrZgYBQ2dgoPtHX19i5aCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179870; c=relaxed/simple;
	bh=vWbCGLr/MuZUgAz43yt6B+BPwVgJjzTOzpP4Pf+XJtM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oBCEsxOg17rnoBofc/9/g1XJpw4TGkLbtihdjkSGfgO4w3K1lgQJLv3NJa8+hMNbskIucIyFjX2iFNh810Lwjo/4LiO1WCFbPcX6vSNq5wuZPLu93cpKhxgvjC2vH86fzqXQQNEa6ciJHzYMqZFCDmyrpHyoQna9a/Ibuj7B+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj4TjzI2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj4TjzI2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso8154095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790179864; x=1790784664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=Uj4TjzI2pN3PZbjdxS917lIjvHnEvYnzjV5I5wVCrmiN2taI4lBwR/A892LWX9UNQU
         ixmWi9sJPfbOopoi41jtrB9eOcu3LoTk9vLWpbLyVtP1fjSZIwcsmCeBioqs6NFXuMlG
         HxhDkHL1vgLeJfdANVl3BGdEnXLwHSIXOwe1UXNlgWDZV1aqtNS0FbYYOkzdfLHdf6G3
         j+uKoqVG2pnFPQNcHrJ97kslvXLl80P7wzdWIt4uRaPOyFoDWjFsiJ0b9COMLkZJuPlM
         vsukRKxLddHkaMW0iPSyem6t1bJzub42bp8UympPzHfsuUrydIs9QqfZXdS8tNTRhhKd
         nx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179864; x=1790784664;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=hZVVWsedaLuTxCA2kg4D8UydloBVvpD/sFFmBlkMQbndctxHizlhfBcJ051P1G+NiL
         mZdnSkC6xgxrYSu//qje9jEWNuFY/OLrowNId4a2hqpOjq7uSwybKc+ksVfswx7pJar4
         kjgemR+w/vcTHhPPTlQw4/3BxwUgKukoRa3krAM7LmJNutdUjDhyzCRUjrl5/ixUVoto
         mo1bteoMz9ItDwqzXsaav0Tn9E75MJOW8SxSK7qzkeOuYR9/5qlbGlRowSe7E/BkwBi3
         +e2RnWmD/HOdn2uBD+GkALTonW8QgvF9rvVV9rQHfUpsX37iTyFULWrNUoiPtpq0/xDq
         gwiA==
X-Forwarded-Encrypted: i=1; AKwUvByhGxfeQKatSPwq3+dQH7zxEnuoJnKIbiqDrtsgjUGioXfI6EeQdM5FSI6l2MwvIKm/MtM0FUgMFzo9oOY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUGQxhC4EHyv/w73UKOKUrQ2XxAvlw6nmhFdLe03NLA4xDNj1b
	y0A+HEQjvW3rR4Zrqo/4QRR7gR/ZStSch4oXYfXdaStAF0D4ZlvA/ZIjVTWg0jt+krU=
X-Gm-Gg: AYBFou1ks9xw0PoEg9YgntNxih5VaeYQZK3+HOjGZ4oFMEp1gKN8h+RecRkxsC7jujf
	o75IKgncP3yjojZ3dgr2QmeHrC5uXsY8iI8fV+NJEcvPmT+osArFfPTzWi8HSVjX64qVRG2sM9Q
	I3XCrGNaQhryQZhhrtWKCKOmtBsPZ6Olf/BadKd7TT5Ku+WIgCHeVG1BsKzR4ipSP2Y7hBKThq2
	+e1eKCjHBt3nqli9na3e2eOa32c/sZFh280AQxjPVS2xCsnpm0Hqe8msI9WLwBrUbp6waXv+O9n
	60vwvNRUS4povXUD6JZU0qUeczXVw4SY2s/wHsUWv9qvLSGgR46u2y5p5NQAa9uqTD5jBEsIqj1
	STQwbnTfdVQLthH8RnqyYJGlTiYxlci0kKLj644NUmXq53+5JofbWIZIQwK1OeP3cV1vAKzxVjH
	sZwq5pPoBwvWETfI6k76tep4nbErbf3KaAWETzA7Jq9h0QyFo1s1UoQSABeDtaojvD1ckNEk3Uy
	UR+r44kNLVQ29ZN7WRhdeTPxfgAytpyQakt/aYcE1ukWA90b1eQNs4vT+PLGLmhKg==
X-Received: by 2002:a05:600c:3b11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49fdeffcf0amr46321975e9.6.1790179863623;
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4140:d290:ef49:44ba? ([2a01:e0a:106d:1080:4140:d290:ef49:44ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde17dab9sm102650735e9.2.2026.09.23.09.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Message-ID: <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Date: Wed, 23 Sep 2026 18:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
 <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
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
In-Reply-To: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 18:06, Konrad Dybcio wrote:
> On 9/23/26 2:16 PM, Neil Armstrong wrote:
>> Add an initial DeviceTree for the Valve "Steam Frame"
>> codename Deckard. The Steam Frame is a virtual reality headset
>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> [...]
> 
>> +/ {
>> +	model = "Valve Deckard";
>> +	compatible = "valve,deckard", "qcom,sm8650";
> 
> Sorry I missed this before, but you likely want
> 
> chassis-type = "spectacles";

I wondered what to set, but I don't think "spectacles" is correct.

I was thinking proposing a new "headset" entry.

Neil

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


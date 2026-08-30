Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B413B442F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094869; cv=none; b=tdhu195k6+AoB6ZFm5MqsKXKSQgg0bw1umbvGFtHqjMC39ZT8dcWTHti4IvgSfxKF83a1NU4qhqNpmfFoV8TDlOeXXa3X2//oaPTDsvzCeqDEKZI9gEqCk/AfqQ52pK3wo3+CQB7yy0m70xxfoK+LkShKhEpxfLZDCvfoaS5fTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094869; c=relaxed/simple;
	bh=7EUviMg3xn3ii2YdahPBJSv9i2OF+HCnfn2F5OI/9fQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=aznY5+v1Ca0Wkcryj1708QKp3cCKvstozKeyRFQ2V4gFYIRVz8slaaAnAQ+Gq2yQGjOrsSle0ZlYeF0j580Hd2+hsGtC/VEi13ZgpVkiO3YkarwMKiIC7/NbW+i/b7+aRIHdGs1kiLZmVADSKQ1FOGe7+HyEcG+zGNlSz0oGx+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pG98rZsL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pG98rZsL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so21757945e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094866; x=1788699666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=pG98rZsLGyQNuVnqLGG5HnUCQmBnX6mw7BWCk5md35nAcD9ei340Ia76JX4QtEi3aL
         Hl+4egXGzpREhJwk0qJ7jo2s8mur7GLzkSijTprR8vWtlaMRU0IITP9H8iETiFDHiYXx
         Y4CPTZQs4hrQWLVLQb4GwdoPyCAVmyscbxYCoPr/1oZoETvQZNLy2E4bmYcmVJoqD8Ii
         hI69XT7pA1vnc7DD+PSUVq3QTuMBrq7fEcSRwyq+qR+nDLAFg3ujOtDeP3f5jRqm0FUD
         mJkXhDdHinJorXVThyMvj5EPoVjinTMaGcNpbiBmGJ9kElRx+7+l/lOk5De6BuAnm78U
         9yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094866; x=1788699666;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=ID/QFevkWwVkJFtoevupwD+yRnxwdUggh/YDGbzlZ+MM1Ww79eyS/DFOyo4O5YMRt5
         LdtnY7zzeTibDunt7VxdmUjH4RNnNZI4B5alH+FczFJ/qgvS5G2D5Z4mlVLKiH/wtgKW
         fsAnwMBo5wHJ1XqL1D1LSGxfdVXyAgMXs2ExULX4W//VWJMx9FeVi3WSzjmsO2xk4dua
         kZ/n7jnD5Ln5zlsSsHc0GUlgc937k/ZE0RclDGW/x6VnUN13LXxLQkbs8aBE2pxvWM6T
         UPSW7Hzze0V4C5NRnUy7eT9q22bA3HQvMhplgQWNrrkOvXidaSThuicOfcENeGBIWOK/
         8VHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvWBvfAgBU4cHflPCgqYjWvRv8y676p9NHaX804BlclZ0qebLhOlNEE7RcjkF9KxmGoV0STnhO+ptg3lU=@vger.kernel.org
X-Gm-Message-State: AFuF++k+JZ3wv7+nDlTlMDmJb89XOg91+rpASDjUx4JKLXXAnJnGZlTt
	JYVYmXkQYTTWEtHCC9nkgStEY6FoQlKag8m524cFAdyqrz1F4VYTmYL93c9DfybDsdk=
X-Gm-Gg: AR+sD11jz6Iggvm6INz2QspRQeOvM6PSLgyUzIqylkpYiBAEO4riO8kvC+RbJnaKZuu
	ORojrF9RoUUUVez13MlbcqqUT78xE9wSOxFUZoqJ9VHpTOM99losB110znTBvi7x6i39z4XEX1h
	6g5rF2XE2QUJ0X4uyawj9SHESfkaj0WwaO1yVMc1Du2Ia8Y/msVgBSvsBDD4ibk+qas10tR+tOh
	gvD3Gog8ckpPvbYjgoiQZfceIt2uZD5qjxZNwtTggI3/W98N3WkX3pPD55ETyRSxYm0h0UA5IQQ
	Zk443XJSoqAElji/mj7oFiMdReVrpbdjjUrTYfFEQzrCpHkOKVyFd5eAPRYz03tOVYs2lGS5tvM
	m36lhcY2M/wE0T3b1EL8jQd8xx2Bg1rUEu6csO95HODPr6KqN3OVrwwnbV6zTwytFkBra4ThWvh
	7cpItaV+R8G5EIgb/pxESU6hZ5evAanL35i7VQWo1MOCtP/IeateLp4J9bjmIfNXgUZsPOWwM=
X-Received: by 2002:a05:600c:3f0c:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ccedff89amr119461615e9.16.1788094865580;
        Sun, 30 Aug 2026 06:01:05 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm81979695e9.2.2026.08.30.06.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:04 -0700 (PDT)
Message-ID: <d7380972-d54b-4162-84d1-b377d4cf2189@linaro.org>
Date: Sun, 30 Aug 2026 15:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 21:39, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

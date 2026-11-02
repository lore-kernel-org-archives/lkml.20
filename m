Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627430;
	b=Q3YOkh7gj9YYK43XAy5imy1EKRC8Ad4+w2AKo1YkfJJAo3pimI1Ya3Jx4bWzqxboLWIp
	 l1YLyHAnDI5axfZJlUtcqIoBv2ug5UurOy95uUY6ARV38IyG+Y71GbGohU7yRLFhcDuPS
	 9/5Ku3IdZ3wSfWRoHr+erJdQ65XHhDYqeev/SGiywOEDyOsq5SiyekCe+NJTmTtGoqUyI
	 as7CXLp/RMQdiUv3xSVxUNWQxPMSYxGrttYFC2nFPXYkItqbDyGYr/qLcFbv0n0n+V/83
	 47TSEa4/DO6M4d10G7E+idUR2IWzDhT6WmMPjlTcmZj7Gzq5HsVY9AhpZFPqqpoNbgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
	b=qE6KZBCju7AUKd0sK8j5TSfVlvkBpUtaOuXurm9ltHjkivFcspfS/QJRkl4iyLBBbKyN
	 859fF09PvrjU5hGktUoUweGpGbOR3QKB3bYC+QInG1dujpJ+veSA2g8YpvBLaUAksxWti
	 m9itBI47umyZouOlDI6Ev+cm20uT+FUyRga2djmcEy+CGRVYvE3vpnYfuVb6PTN6u4CUX
	 VDH/RoR5n3mX58kpr4cRtSZAnmBr77ms9mNg0SkoKGwfK0IT1afon4GJx4uR+LdOBexKQ
	 xM0cYAV1/s0PLjMbO37WJbuLRnjzUCHwC9rYDdWm+Ym9r37/w6SkZCnl+ymWcY2ePaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="epvzTT/z";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD00606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=epvzTT/z
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34780205e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627428; x=1794232228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
        b=epvzTT/zGbt599A8IubLmy56EzTz2iT6tzFg+9063WYfcOvCO694oDYbH36bUw5gYM
         mnR/kh3K+sYhWCzK0ZgWGnOed8ZtCsRSDuFNfH+Ng0cBj74AWB61rrA23p0VXxfp2DMt
         umDvT8K94VFrTo8NbhtMcviYyqODdtPEcC24bkcCnHlJkxFTMDL//UbTDNo1F5v5fRql
         Pz79XEiB5a6l6HPWtl1S3g40dKHsnE6i7mDGjqlpd+8ZKLl11visuu4F0UV9DVe4J2Mr
         5KtS0S2CTDpeX+9YWFt2L/bodWLOwYp6+BiSUhYaenDwEll9B6msBPIw4PvYKkLgO3yB
         KawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627428; x=1794232228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
        b=zfI0rhXiDNjn9UPW65xr+tTr/SRsM2LUW/D5zwtcXL5fhxbrXAhxVGr6LvxDaORJ8U
         VHVP57/Pw6U3cQhnHVNPY8t9qgGb4u1tIuF8cbr7UPEBao3R9lSBkDsLuNmna8FpC7FS
         /RW6eLY9CbNdklZZzs2NHpkm7vHPWIUtOHl18xAr6v5RMiMnWvLaOk5IcNc9YNcQE+CS
         OFFwnp2P5DED9sgisA3r456nII+2nrIdsEG/K2cV7jxG2mMgN0F9J8MRCdHze07DdftL
         YW8aM8flVgrffP6UtfCufV5UUO1x2AKMnTCuU5IkvncLN61Njmg3iD1JOsa3gUkoftpd
         K6JA==
X-Forwarded-Encrypted: i=1; AKwUvBzZNGyMnHYKWHDYcwmdDmqog20Po5uXuAVjZOUuLrKsQuvTgqDtheWeMTM72VckOxpqHPMKDi8pMWm3/kM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4xsMEb39GLBa+t2WzFYpzdY2027HL3BgGVwdGTY5juxFDkmje
	rrl7m2epc41NY5Qtixj5MLS33L92VxeCvSQp4gViU9TMD4cpuuJBq+qkE2QmFsfRw/c=
X-Gm-Gg: AYBFou1ZIU5WaiMiQSR9257rWnYwIpP/UtIZN/esO7Mm7nPvdBZlaRKh+seN6y9bAqI
	UrBShBo3HEWV4yQZq24OjIoxMSyu0x07H4W1PVp49G2x27rZMMCQ0ZEoxMW8yKn/nSF+vIdtJpT
	ry3wCln0XEMQ/MnX2pTRmMJ9UwgIasormop0DF/Iip85kiwcOcciyVzj1hNvbZk9jZzsdAgH2zO
	hurJcO21v8vhxFdkmY8Xk3ZC/j0DUoWvZ1QjRcEwOGYfroUyHN+7oR4q9kncUDMfuHW5lBqgJXW
	j9jfIGV5r85JKO60G7VcNlgGgq0qYdVlXraclu9GEhD5KOJEDv+N3IeC98xnm+IJ7/YAZIESI+D
	qd/7Vd8CFNSuZaLquPCr09DoC2pkhcdQpvGgXx6hwUTnUCK5xWs5yfOBoVGH7eOG3lnGX1xk67X
	wzQzPkcwLTvbP6hhWrsfAm5+R5Oen7lPkRaNQR0HDLIzbhuwJruQatSWFksnwRkw2SqgzF9m4j6
	fDb03HPn5iRK6TF46bcOTfm/0PcnMjoML1iOPqNUHu0poad8+104h3C32VACMh27n/vkoLzrejQ
	IcyPAOqAZCSF7wZ4czRCwO3r3OLkdai2SVBdsS7XjYCoZZbkaTC0E54Fn9CgU7UHC+yt+CP96sG
	uykkzRQ==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr235570315e9.27.1793627428483;
        Mon, 02 Nov 2026 05:50:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm21252789f8f.37.2026.11.02.05.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:50:25 -0800 (PST)
Message-ID: <7116571a-ef82-4aa3-b7fc-fd7863829c9e@linaro.org>
Date: Mon, 2 Nov 2026 14:50:24 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] drm/panel: ili9881c: add support for Mingjun
 MJ070BI30IA2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
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
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/30/26 06:44, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is a LCD panel used by the Lichee Console 4A
> device, with a initialization sequence matching other ILI9881C
> sequences.
> 
> In addition to the normal binding + sequence panel adding part, this
> patchset contains one extra patch trying to address a hardware quirk of
> Lichee Console 4A -- the panel could never be really powered off /
> reseted in hardware (the reset pin isn't wired to the mainboard, and the
> panel is powered with a always-on regulator).
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Icenowy Zheng (4):
>        dt-bindings: vendor-prefixes: add Shenzhen Mingjun Optoelectronics
>        dt-bindings: ili9881c: add compatible string for Mingjun MJ070BI30IA2
>        drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
>        drm/panel: ilitek-ili9881c: do a soft reset in unprepare callback
> 
>   .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 226 +++++++++++++++++++++
>   3 files changed, 229 insertions(+)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261030-mj070bi30ia2-cd8b24ab77fe
> 
> Best regards,
> --
> Icenowy Zheng <zhengxingda@iscas.ac.cn>

Could you rebase on the lastest drm-misc-next ?

Thanks,
Neil

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005205;
	b=JII9VrgRVBgED77elq6Q8kupuih9uagb+CTmAb/+qI+TRLfQoqrZxEjNXsx+1tKsChn3
	 Rgdi8gzMF19S1FKwjfIfzAYlyu65YjJiw5SOq3g8WdZFCCn4lDlfN0u4SEz2JCnDwRYhf
	 8jdOJ6rBTgenXyCvGUrVwdpBM80Db7ft5DKdflHrANvDlBRCf2hz7ORp+7O3WSqUhtzYi
	 JNLyG+FPJKCl9g5Onqo7ccQxtN1qXrSYTOeGkTS3kDT3Yu4sW0e4Q1nyjCVUeAROnhdD0
	 FBnTiCqxyARbl9xx0eXh99zHSlMdII2Osi3fXEVfpApLtJnmehuOc6us6gkDamKKWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
	b=ieys6b55luRYZwmYR5YnIQ82kmHpOl3yhT6QsAyM4EtipCsp00CRrnpsar9Ea3bw6MzA
	 3K8HI2pn9kjV2DC9fh/37EzzypKhYAJKa7Oei2+LW0XKBXdObOLGrFhAaHuGSfQkKZtE8
	 RDlnv7jqXyiCR4dJPTzIesAVXk4riJGdC/Azx185cgqGEEgOQLj3emIhFiy0yHQ8s+iKL
	 9cSjs9/ye0VUOSQ5xpDIC6bugQESjY3Fj8YXuhUky1ZfSvAkURb8jPUd3O/r5HENpVU7Z
	 QhRGDz8tKg32dYXQgupAuDiD58xsOjyKx0258UiIXyZejwDkEFuG9wY2MqqRLTeHaWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u6KM09xC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC10F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u6KM09xC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so17175705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005203; x=1793610003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
        b=u6KM09xCqYJ8JXVzXTUiFQILmdo+65ZgWXoyzsVfvN1EZTv+Aexm7+OMZgSYI8gmNo
         3cOhAcZEXlqppWqtQuejkeAWdltWe4/Wf2QoxrOht5Tc5GF1wywqMmrKE1zibdtjdNn0
         OjRYHiMdLLnRvIUfwWkB6RCHCeK6xY4Uno7rj6iiAsjJ0lshXTncY1Rh2b4+n46xShZt
         tqyfGKhjlg4HrEMD7Uq+PtwNOGpX3HFc82YpMZ7zmBV4pIUyaB1eqaz3BQgE0O6ntsUO
         gUMy/lLCA4j8yJ2Ix5PbYqyF7raWJWoTmtw0cLLWPtoUH4YEXo4q5i+kmssr4ReZfiWW
         nghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005203; x=1793610003;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
        b=sHyyWbcvPv8MZmYb2XXb9o1SjUeeXjXEp91t7X4MMes4EHz9exeGtILhkpk3ojcw7I
         Aedof8GeZZr90/72afDV+DuZ7N6RlFeKcRjOk+4r3ghhFXGry/VWuAajsYqjOIj5bb0Z
         2c0d8tMmC3C6+L6h8Gdej37aiRC3puuUD4E+MfCN4b2RO8k1GK5H7L1NZRb6fUT+HSDz
         H30Cg+7t/GNkeCL90jMtw3WRCbdUKa3iKgxZhqpBMK7+qYjIfkYkW/J6IPwWcgKB67Qa
         b80mhuClYAPRLY99d5S+wqmzOn/g6PoGgBLTLZUE+HUBHkeVNTkdxdpGJ6SH17ZG5L+8
         EusA==
X-Forwarded-Encrypted: i=1; AKwUvByW90spOnrYYKxHjBO33oD+Vr8LiPNAJD02FaD/MbvNT96H5uaHttoGBsvl2pkXBTorfZS4U0P3iwSI0E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaTYgCIiG7YtDDCUKFgBh95V0Et9mEbgRv2XKtTfKKCVhxPdpj
	6mPW/i1sJwcrY9wXJgPxsTdPHjTKY6WrKdM90w4zI5I/aIEpQVH/JUwVXwru6zI76sc=
X-Gm-Gg: AYBFou0dNVdHUAeKRIwcGb3Sr2/0q0k8fNjFX7T70Q2oMyvhy/lQved+Pu68RaAjQIA
	IcMLihBa6vpxGcOYNfU7ERFoqkq85nTgZdZxxyS3k/pC1QHBPhTeZWoOaiEkAw7x1HlEP49sADg
	ggHugeBQiEKsbImesCvq6tGDPUXZpxrRb7AjDnNU+c+pbveaiT/viMYCzgo1NeHbml9NbTvskWk
	h95GxDNti0sb+01D8zinVvnq+A2nr+G747CQiDqOI2DJ202mUKywkxZqw4/ws/B6zjp93+M4QAa
	r/aM0XSE7rRJ/h3bey7C2PZSilTetfLvuFzTQuklshW/aryVotMs3Vnv6TzbVKFp27MUXhZjUBp
	Qtkry4sK4LLdVA/Qy4fB4DPtXuV3LRSoBGNPFNMR5H7slo+JFQ/yd7eDFjj/sFS5UinIgfLU4Xd
	+qxDledzfvlZtoF+tw0f7Cr7CpkoRG+EPqBpBpVSukQ1OeAJFfWvfwMxD+j9mimhUp5MmuaSOzw
	qz6J/Ncz5vyB2Pf8RPiqK9yPxC+q4AzAX4IRKjedfey+8ZP6NHcNdaiFZYONcnZ9Z7CTQ5KeW+R
	fL6bMSw5Qf+8xh2u0McfnHx+t1ltzVX008Vm
X-Received: by 2002:a05:600c:3e1a:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a35aca6ae2mr113669665e9.17.1793005202672;
        Mon, 26 Oct 2026 02:00:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d07e:c128:5c21:78f2? ([2a01:e0a:106d:1080:d07e:c128:5c21:78f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm159395045e9.4.2026.10.26.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:00:02 -0700 (PDT)
Message-ID: <7f04940f-df1c-41e0-ad51-d9dd9e6974c3@linaro.org>
Date: Mon, 26 Oct 2026 10:00:01 +0100
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
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
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
In-Reply-To: <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 12:34, Dmitry Baryshkov wrote:
> On Thu, Oct 22, 2026 at 11:36:20AM +0200, Neil Armstrong wrote:
>> Add the DAI link needed to enable audio playback over the DisplayPort altmode
>> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards.
> 
> Does this need an update of the AudioReach topology?

Already done in https://github.com/linux-msm/audioreach-topology/commit/6040c950021b88c6db287cfffa17abbf917f56cf

Need to add it to the SM8450-HDK

When this is merged I'll update the topology in linux-firmware.

Neil

> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Neil Armstrong (5):
>>        arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
>>
> 


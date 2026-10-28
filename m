Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=CX8amWA63yLqT/Iga5GQQZkGWUem3bvGQ5fpZEoOzmdzTro/2pYHpWk54Ie8FcDRFqSI
	 /IY2sgeslM4uxsYlJZMAo32fCkKCpJmF9vivJfCmnmKrzCMeQXkrEQpWBkoPurXmeDNQo
	 C66Cuy7biVOnVIpmoCtQCRwH8Z5F2mSbhqKHRnOu4poj4J2V9e5E5vRIdbtXkVXsQMiUJ
	 8eoKXcEioHx22+wVGwH0V7oK1SMk68nxCv+Wfm8ObnDMCNW1xzuxvBcDL/AolCmSNN6+0
	 yurKHhxIwNgp3oKkE/n4ihk3PNwxn0hReQY/o3HdCUwWo1OpRSYOrVotGor1mPAeYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
	b=ejqn6YJpS0HRNIcvgKSY7s9xHUMeNCluo1f7eGkzHxkBCBl3nqqvVhQrOZcjKPtuI95R
	 aBOEIWtJrSq+8S2vQUCrWWZrC4DA59oxhE70ZdxsLdkOvvpYvrgJr8whG/oe/lUMTLiFe
	 L0LGRwXr/hkEdAHxrhEDu/r+mszCSA+ucFeqFhi+dmLnlirDZtsc1ImRFutEBvpR0psWY
	 8SXSk/xi/YYMnFibib5/ntik+EzpP6wME7ECY6V/hwJL+HX/jxSGkf0nED0XIsDdobCQp
	 DeaSuWL+LUfT0/YwvlQrW0XZkkmAkKyrngYVBsIKeh/519iAKD81vJTGN2+OKNy4yVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FCF606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FCF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9801775e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=UZ5vxgZUunglt4G10pOQzIVVK9fHKqQKfOoFuVBy7okRyLDlBjGEnBOAeVPvW/aOMu
         1wadd36u1eZDO9mNluALYMFMr2+yMlApFveU9bZa2AhqrkIBMH/ZGT2XzMH6Ip8dReJJ
         aaKalseqlpgjcq1GqbUOS7FDjwY75yP2MlyOmAtKaBRs9Z9m+SAd4S/uYNDPG25kNINs
         F2Xa+qviSLXUBhO+NSoVvdoqYgTbouK6lRfZEf9zuBTvBNF0FDMNl3Epf/CG6nwqcmeA
         V3hZ7yHlmaIiiI71wRfyx3A5JlWFE1+dM8uK/o1xLtkwEzrLDHmo+8/AzAaLuXjZJ6K2
         8mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=1He/FlfnnRz6bTU1izj0c48NxppzmUVX9IKvs2s86YRVWLE7LKwJkeC9NvULNWZucJ
         Sj1wwrejjV4SvNgr2dD6o5ItGfBbC9W+aRshPBYY4HXbLdAlDgjIvjHcw0S+5LKJGpOu
         nOxbMKJpKjE+kVKzAPg5PLeS6HZS13JAjKPd7ArH6+R5N2Y2+CsaN0ZAxDDjJc4XFswp
         cglFV5pu3KtRvLko58t7lS0w4/wIaRi3O2JJPovR3+bFB1RH+aP1Tz5FTitz1CNNvYLG
         74E67alF/ORLbDjDNCrjN2lLkdC1AgCvE9pws+HNh6oe5HkxNInPneyoCFiJ5CKSCyUw
         NALw==
X-Forwarded-Encrypted: i=1; AKwUvBySk+xhOdY8QFn5HiLk2e8pVjl6UEq3E5VF4hJ0eSI/imq/vvEIUMm5d/+GTKoRe+lKgOoicevsY0Y5fgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcMvr+8GQOXPEoZ32aBh7b6W+IC218kZhpixm/5sHCnud73IKd
	DtUQYtzBDJPzndifDMLiIf72wRPmXD3EczdtGsYrb9QEMeYW2dOaaNEl4vHmDXRaW9UcUu5uCem
	Duc0H
X-Gm-Gg: AYBFou20Y0z5YBr1VM1j3obEEL6A2LXmHHS2xfo/s5AHrre3vkeeWY41FHq9YGHM0fs
	B1fK+5dbu4AJwb2AZQpq9oWu+jd2b8eM8LnRmJXJ//Y7f4rw+w/oxQVIwk8dKyshKsVVKK7XVYV
	HM9WSb4E2vqfksEI1JbBi3wEgMrj9so0XRDWX9qSWdTd8qzwc7FKvlOgFKWtVLioTAbTbF46VhV
	F10uyHlViY/qQ4042fCsL+6DKIRw69UkpU6XjnblRc8xkjkLCJVD9obPgStOuHMLsHf0ngMb+2T
	P/rpSisSAVd6au9mxoFH9Q+o+zvJRSa0rAHIUvtL2SnxfmGEoWukmpXX3XhCg2HFH0+c5pWkA55
	D50FL7XDD7gsnUqhADBUgeOGysRTFoVQFsey1mWHhT4bJP8cLoA34sx6frj7YkzOeJCQUEOmTYd
	m5Z6RoGvCYSFzRXjBD6MHLtvy79VyB5Fx01mGmcXWrS6jTr7ohdt9d/y07CJ5ymty1Y04mC42Pi
	hMGwPlib+L38nRxGhlCZN+aRUt7bETVxBBwk6WfGxZcleQEiEzfXw9o+7XExapA0C+6galib6/K
	I7L5I8Eqq5ggF7RTkCpPFA/SIUDh8n2F7Ic3+AD+hA==
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr62849985e9.12.1793201768098;
        Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm41594465e9.4.2026.10.28.08.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
Message-ID: <ba560f04-d817-4b01-a1c4-293165625f07@linaro.org>
Date: Wed, 28 Oct 2026 15:36:05 +0000
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> Add support for the TPG found on Kaanapali. This TPG uses hardware
> version 2.4.0, which drives test-enable and reset through the
> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
> the data source when a test pattern is selected.
> 
> Add the TPG resources to the Kaanapali camss resources so that the TPG
> subdevices are created on this SoC.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

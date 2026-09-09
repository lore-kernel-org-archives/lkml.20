Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F4E4028D9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938193; cv=none; b=JZYKNKGqO6ek7OiKFdORMU/s67nIHCD4bWrmFC46SXs9H61YpHn5e9+U131jcukGqd0O5Jdtz6UlCtS/10QV4VHtVMrXr6D98PPeVMj2eY6bzbtjP+/0dMuBt6D+SxlAvneUnkJ9zBdEQnMUJv/CyU6HkDgVWZ07Sk4RaNiLNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938193; c=relaxed/simple;
	bh=p7ULQTwvLEY4mzWiAczUTaKtFQR3U8NJFvhHihr+q4M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kisaohsjSzO/FuaxaC82nXlfAu+azB9faEf4cqvSxrusGWeBW9cYrO2KaWzhZMgXsQYyFvB8zderlr4wsP8bLxvsJweRjgxD+9M+xmhfSWlN9IAxcALhA8wzQ+WMnIv+sOC/RLwYhBIm6PBub/MMvmppWJkksSF+AnnDuoStpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOf7E206; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOf7E206"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so54408765e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788938190; x=1789542990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GN8ZAvEDJoptyik8cMBJpX0S8SH4Ew7cdo5nMOI+S14=;
        b=gOf7E2060QteZd5OhAI/0iJYqaObx4YFMowTiQwvlV0buCA89kHkhe/nA/jvEz8PhC
         5kIZY/hAXw7d3XLKMcLGGWpqVFOdLhsX/gaC/NskPOSFUaeX9qnjZhpdbqM/OIU18gPo
         XVLpw56nxR8/M6uo817Y12JIffQ4/GSPONskgtwNZZ4fP13+Wz/gY5I93RQ1Mqzfg2b6
         8ILezbF6+1WZEcdlvpA5eA4r2EShgNA/fNcfdvgBN8vY88ZVF1c9E8GeW2mFRCK7SUUd
         30BMjJMH3GLS1ECCXCSMMLqaTzDauiixOKz84+LsbGe7/8P4fUx09Fgz6qISZwTKlihv
         5lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938190; x=1789542990;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GN8ZAvEDJoptyik8cMBJpX0S8SH4Ew7cdo5nMOI+S14=;
        b=YNxyqddxI2Rz7RkGamI/cYMsAlx59O+vkQVFNly2SUwIoy4r+CwZbTUCluRQFs3rbD
         WAl9vfrlgmY0Ra+pzdJjl3odEGBtE6m5S5ZUetERAVC3xiIQLR7Z6N71QwjNa0ycdfhX
         HNUbh3BIW/6CTMwWMDAzGEWNAKFCRjdf1QTzRDMDn0rdtB3lI2VeWz1IiabyQgD0W91i
         9MkXHTmipxssiKBBjqaMakPRvKZY29k+f/CFd5d0ga1QYSxm11nOS+J0Q3zT28yTissd
         B1BOXfZMT73b8kGz26eH7Hwo43aeZgh2KAoIPrzaby9Dmf/sUgLWWD3EggbVzBlv88Ij
         lBgA==
X-Forwarded-Encrypted: i=1; AKwUvBw52PIQfBsqr9l2aEIoVgnNvX14jrt+bTjjx2t5BA1EqBAdEoQlMrHQJ9yvmJ3uHj+7aBAfacyIELFb0YU=@vger.kernel.org
X-Gm-Message-State: AFuF++kk3itYvahVE8UmAKCie0ZWmcbLuCvO8cM1VnnVVLkXT3Ini8w2
	eAa+dLS92hgNW+9sMDvjUp+cwdTf9pmbWYNoSyIyaUWxO5SR2cF9eCqP+ZJoAPiWphY=
X-Gm-Gg: AYBFou2afDkJI6syKzwO5g+QxVUmfnRFuDRQo2i3fuf5DNve05KrIUJcSUsrrQM2222
	6d5pt+LkvLEHWxns+kRHDbaLFjBiwufgzdyz1w7b0pIfUBGwNPqishgPbqosBcG18PTG6Eat/xQ
	AXRLFm/V8x2GuwcB7ftkyqL9NTt4SyK5ZpiBnEWPDnVFFscOxlAM2Sck3YXCFQMhZp4+5GgAmnT
	Eyc4FshGGEQUxtGtlPTRTD675BofMs42b9nBg4liTV+8l/afVQHZmOrynxdb/AbfgB+P15WMhZC
	BosXraxmCd9w+yVUUnepmsebfYY1vPaIafFTlE9pc+y5gCSMwC43+58iJEc7sCIBem/JHnFdyOj
	LTXaxJoz/FrtYavhDM01y7CqwEih3K2tYmV3MOl2INBFqttVhPZAevzTNKVZgFXB3vtC10yVHSY
	wc/3d4ol5vmWb+/PFuYNEX/jkKi4IvxAtgsRf33O7FEGWW3Ivo5pS7V1ZqZ9FBBuFA/MwmVUFR5
	rdk/rWuhL4SNZDg6G/5qXMqnd3Nde34eiKy9mLexvLvPdyTV3A7Uht2tuMpF3JOBQ==
X-Received: by 2002:a05:600c:c8c:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49d1d7e4131mr67217785e9.22.1788938189965;
        Wed, 09 Sep 2026 00:16:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c? ([2a01:e0a:106d:1080:14f1:e0b5:e1a0:a97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm349470395e9.8.2026.09.09.00.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:16:29 -0700 (PDT)
Message-ID: <987c56f5-7828-44b7-ae6b-eb79b15b64ab@linaro.org>
Date: Wed, 9 Sep 2026 09:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] interconnect: qcom: implement get_bw with rpmh_read
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
 <9303e64b-00e2-4b8a-b92f-b96c0a3a5546@oss.qualcomm.com>
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
In-Reply-To: <9303e64b-00e2-4b8a-b92f-b96c0a3a5546@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 16:39, Maulik Shah wrote:
> 
> On 08-09-2026 13:39, Neil Armstrong wrote:
>> Since we can actually read back the APPS rpmh interconnect
>> BCM votes we can actually implement the get_bw() callback
>> and provide a coherent average and peak bandwidth at probe time.
>>
>> The benefits of that are:
>> - keep disabled BCMs disabled
>> - avoid voting unused BCMs to INT_MAX
>>
>> If the interconnects are correctly described for a platform,
>> all the required BCMs would be voted to the maximum bandwidth
>> until sync_state is reached.
>>
>> Since we only get the BCM vote, we need to redistribute
>> the vote values to the associated nodes. The initial BCM
>> votes are read back at probe time in order to be ready when
>> the get_bw() is called when a node is added.
>>
>> Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v2:
>> - Added tested-by
>> - Rebased on v7.3-rc1 now the rpmh_read() is merged
>> - Link to v1: https://patch.msgid.link/20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org
>> ---
>>   drivers/interconnect/qcom/bcm-voter.c | 36 +++++++++++++++++++++
>>   drivers/interconnect/qcom/bcm-voter.h |  1 +
>>   drivers/interconnect/qcom/icc-rpmh.c  | 60 ++++++++++++++++++++++++++++++++++-
>>   3 files changed, 96 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
>> index a2d437a05a11..9014bf20adad 100644
>> --- a/drivers/interconnect/qcom/bcm-voter.c
>> +++ b/drivers/interconnect/qcom/bcm-voter.c
>> @@ -261,6 +261,42 @@ void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm)
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_add);
>>   
>> +/**
>> + * qcom_icc_bcm_get_bw - get current bcm vote
>> + * @voter: voter used to query bcm
>> + * @bcm: bcm to get current vote from
>> + */
>> +void qcom_icc_bcm_get_bw(struct bcm_voter *voter,
>> +			 struct qcom_icc_bcm *bcm)
>> +{
>> +	struct tcs_cmd cmd = { .addr = bcm->addr };
>> +	int ret, i;
>> +	u64 x, y;
>> +
>> +	mutex_lock(&voter->lock);
>> +
>> +	rpmh_invalidate(voter->dev);
> 
> Don't see why rpmh_invalidate() is needed before a read request.

You're right, will drop.

Thanks,
Neil

> 
> Thanks,
> Maulik
> 
>> +
>> +	ret = rpmh_read(voter->dev, &cmd);
>> +	if (ret) {
>> +		pr_err("Error sending AMC RPMH requests (%d)\n", ret);
>> +		goto out;
>> +	}
>> +
>>


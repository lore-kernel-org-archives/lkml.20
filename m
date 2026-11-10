Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324828;
	b=dpW7WTUWPNlzmJk8IZYpLYDzF0Uv8ccGyRF/EkWY9hb5xRn5435+pfUbuLAhqCnS+yN+
	 eBYkuji8/56NfvS4dGHvoyj0lvThtOBTK3lOWgnPxPuyJYtPhhf430UAkJ8BjqxcXnjG3
	 fvckv7FjVtUfCezg6YC58M4+/2uMl6p0Fkwl8WIsydcWOPx5DRqEo6wFrDsFFyDGJVL8t
	 pBEwr7xFJ5GEEyGtLdGBwNmCgyxvoCbBFx6Md+P961AlkEPwh9i02iPv9lfxDuvIc4cB3
	 4rwYmffOokoL6blh4wCPtDEfkvBU4H65JyPz5c4qIO9LTzo9A6TCGn7YmQe2oRDvSiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=;
	b=3Acj1amf80pmGdrGAExHErSIYbA7NMSdwwXNUYtUHxfCs0IaH7PXvH9T+bnkt02zKIzm
	 be0/C1bRGNu5kHHWmtaDHrMLHxshS2UhpyB3kWOFWiz+x/iLZSz7eMfgblawLpMJTfFSo
	 CE6XpjP0MclIcUoIZUHkr3gUVNFcQdgyHiw57FRILeLWwjuP3guM+yZGgZ/uo3xMbtPe0
	 0h+wzA1UGQJcDyzma04rYazcujI4bSJo9sqhSV+Jj9dhoAvlvlM0G8lKVT9aYgwCjx30g
	 ArpnmADBLAdxFFHrip8wZ6SSpNNhk1t8QHvb7K9BXYHyomW7uac1r3M2e8El0m46nlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VaeWG5lS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AB606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2AB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VaeWG5lS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23321975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324826; x=1794929626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=;
        b=VaeWG5lSiv8Nar6pVPvUqhVWMeEAIy8S5/COvlvjO8Ix1LKSnl0fVRjRierusjl2XO
         Jz//WQn4+jaZ8r565Wm8xQYnEFA2HNMHM/fzMXXdBAVHqPpX10lmDGo6lx/4Qt75m67N
         +4kquTLaKIBChCrQ6ZVjvmovWF13MOsUj45VILRQ+CmNeMw3QkDyNYDo99trOSBrdddd
         5z5KoiB5dg/fAo3mQXX6MJL7XMwCUoLW0CYQgtXofqX6y9hAXJo+dIsHcUQWlnVWb26/
         QJ2wCjm+QPlEzqqyWTaRQMl7f+jZ4mn8kAWuiIUymMN0QqUs6T+ZrV3xGbFD0PZXkM86
         8ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324826; x=1794929626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=;
        b=LBSKTlaNg0cRga5wrpRPuEP8HJxGKK5yLFKS4ZNqWm6XVccImxb7t8BAuhAWbNyItY
         ZxDDjeXqfa53PPr3I3oWEJTIQTAnFsjLVAvuG+xWtTSg2cfnBZJL3rsQ6MzNRlQoTLzV
         IlhgA7c8JLvnXNHkmHY/5U/UHLArW8Pm8tUgKsJ/Mqz5aP9/xyu6Lqv0dN5dR1Zh7aKo
         MfdsZVtTyz1IuS9IxoX1cw2kRVb2M5Dj8g1x6b/P+k9Gh/1k9jRXmjE93z3BTWq7rsfc
         wfJy7JgVZWr7uMhMtj5KKJpGZMz0Tgtbg+lOqqqGKl6YlIRZaaK8f3rt6J0UA/04h0Ky
         j4qw==
X-Forwarded-Encrypted: i=1; AL+hErHtD1DQToB41Fw925YRlXif2cxy8hgBzpKEQMqAKC+iVcAuFDR+uvwI+v3YyR+zMVHIkeWZss9R/NFoOps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UnOTQD4N3ceEHEQWkG+hgrU0JYwbyo7Z4EZr/Fr74aZL9yRQQ
	cMnG7SZA44SFE4s6ygZo5tNFngfdYDTvUyvNpRR6QcHiDZ7ayYzzB/RY6ABEL5z+kYk=
X-Gm-Gg: AYBFou3f7rLhNNxHfRUMojC24wOgtMHChinTANHLuVgmC86cPjNaI10lIvDUoJiKGKJ
	g8rKewR8cSPdZA5LumTzCm2jcKjVOZSXrJrvFlegeReWDtEIsq2hZJ9NXuokNPOSBmSNhhxIR8E
	c0ory6aONlOFr0aRT+95NL+0zZ5iMXw8ijPSz6BMBpDSqCzC47OPcnXxiDozU+lGOgz9+8DtNhn
	aYqWsCiXsoGnb+p5p5WUc01SbtM0dRp21CDRAyxMJKtzY4wCVFC3Kvs9q1L4La/nP9YlFPPIMf2
	IkyhFdo7G5TdRoThzbVzjpSJFlTSpq6JaGEG1JbVoDcdgcVUkyZ7MRMB5IjmNgCYQIKjkz0pST9
	VSsDNLzjBLcypQiejzLZ7BUtfmkou3NZ5idcBjCxvxkDpOHrIt1u7ZYbsYyxJGEaea4xMU3QxGr
	uxWo7MTqa/fSHwvbkEQhM5t6M92RxTu4lQWXnHeNeVH6jo3Br4FM1L81yF89TUVU6EAGmW136JL
	TVtz2Vggl45g17wolb3KiE1dMCkmC+MSunUe6HLI0Qb/NoLBMNS/jMS0wjzzUSSVfhSGrQsVYgO
	vbuV2kft6VxQfiywtbVlS/m8nJzzrjk/yqKDWUny9XG6rq5SYhCdRuY=
X-Received: by 2002:a05:600c:4e45:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4ba0235055bmr57644325e9.27.1794324826414;
        Tue, 10 Nov 2026 07:33:46 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm81073115e9.9.2026.11.10.07.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:33:46 -0800 (PST)
Message-ID: <0d2e3f78-eb15-41e3-b847-0524003bc5e9@linaro.org>
Date: Tue, 10 Nov 2026 15:33:45 +0000
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
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> When arm_trbe_update_buffer() handles a pending interrupt that is
> not a wrap event, it discards the buffer by returning zero. The AUX
> output is not marked as truncated, so userspace is not informed of
> the lost trace.
> 
> Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
> the trace loss when closing the AUX output.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 * errors and as such buffer is empty.
>   		 */
>   		if (act != TRBE_FAULT_ACT_WRAP) {
> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   			size = 0;
>   			goto done;
>   		}
> 

Reviewed-by: James Clark <james.clark@linaro.org>

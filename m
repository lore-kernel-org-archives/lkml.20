Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241656;
	b=ek+jp2osBU3YkJGHOHmcHR0dCyElk9XoMMYS6EjXr8f3vOWmoqsQ6cq+uTjETKIjZcQF
	 YtwDCpFPhDPnKdwpa41PiPdo+9cQkVzbieGT0TP7ARq39c6fRB1juEC+INsPeLVBHS8jU
	 Ml+Sb3d06Wu58JOPblJeibngmKMcZ/aSMvnwRfzRa/vQGMLwdFYnNI5uh7dG2T5oAGOHB
	 LhhonRW/NKBKcr56bm0ari1+lBr2gZpQsJuILlqqxba+u3qiyrASQo69WN0J25e1ya8cb
	 t/lXe5U4VzrsenXig1YNHIvomw3xbsXd4UFwBsd/U3dV8WcIA+K0Nr66pPpOCZFt5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=;
	b=E1aqdot90aAAmyyVLd88xrRHzz6XGoKO87jfNTgd4sc79LAWywoHlpI1Tb4RIWeHocN7
	 4hNCpYYeUFOHpFo9bXHygqolz6lHyfDxS1ghyCBd8zMIExKqeQmib9OpT8qO3jSlLYWwz
	 /SLP8i7m3a5yBAmTXhuboydZxY6rB78vBVbPEwshO/BmuCmygg8MOUG0wJXD1NR7cmn6q
	 Tmov5/I7HH7bJyH91bhXvIiJPRMZgZDYpJV++M+W2cCKSampdA+7M0RSVwuYVmrGxNmxM
	 XWQXuGK9ybaREUV88GClPgfdy1tVG4mw16668WBeXjNz2UqoV4j7nLgrO75taKxty4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HtplDJL0;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED7606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ED7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HtplDJL0
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8595065e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794241654; x=1794846454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=;
        b=HtplDJL02ylJvEefcfUp8Da9xP2PuSqf63KW/nwKA7nNqF4QlAl5B6Xtv4ue8XHdzv
         gfCIDpiGx5biNZ3jOpzAqCJwyDbyfqh0BZnK31DKBR4r4NVo2mPs0p3480Dplzw+d/g+
         Ejs4jbgaMWWOONqmwS7jAIK3a2+qDrsnXcgc79s1a0QPbmzlpsgpASU5a5z1UF9WiY0Q
         6+oQZGdVDVQtgwZWwWnov374bY49sMJM247ZENXg37XorWZLhg3ZmI/+PwkpTNwDqROZ
         YLT2FpKEkQP+Ha9pQscBEkaxyQLA9PK9leudPwsFWNu+Dj6XRezM516TJVzWVH5dXt6a
         1CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241654; x=1794846454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=;
        b=zpy1rB+MLGcJRwPPtiZuts90gpgRdevHGutx+lErKZDWX642Uqa9QWeVI7Oo1L4DWf
         pgCRbuwwU07/q2dbHvrBc+NueZ8lpNFLewM1w7srGJLyqmKBFR2huGJLabbySicpSSl4
         /1VNW4PoslislDDXBuXMhZKfTZx4E2mBee2AtU5cZg6yVy0ESenVQky6+iPnyjgS4QCV
         FMRlPNt6FTzxy6ZvQF7rzkF6+hlebRQHLk15sTt6bFe0q+LFmAsmmb6DooFjQVOXN89f
         OXLLOWGqAj4hYi3GDhfKp4R+7xmMAnUIXWKXxs5rrw6iqMN9798OEpLQVXqjb8Jx+LTb
         EOTw==
X-Forwarded-Encrypted: i=1; AL+hErGJgc4zGXx6LVKWTy0jL1sJMIX9UjJsbaq9SrJiqE4ZgokMW2DM24e8gIYjlFH0gmUdSVU+KjnSxe5wJio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uwrtho3/nvtM7Dgp8cXczJzY6emrfQeXeggzXOT1G1q3RRvkz
	7N9mC76m8sv/KcrYkWEZQgUdN7NHhAyqXNQ44UPwzuULAmeg6TPzR0Qiynn7UCkukno=
X-Gm-Gg: AYBFou3iE2bvQH3NVWSx5hAXwFTEfVtee4ACJlBMdIOkDY06t83LxbQxLVZSHG63wpQ
	UOj0GVnMXB8ypUdRzMSU+zk/esO2NTN5QXUIjqDuOI/CwtsbnciLSfXuvXpKAwzQJOKHO0sQ+XM
	75Pw2u3JKvqZPyHn4zpSBVHMS8LacxJS8Zapf6YQ0SCQdLWt0oc5Wa70ej6d5WfvE1iBC4ALqjR
	mLCPOIkOq6DC8KOwJrg8PkpV20LZ/u+ekzlD34c/segP57zvnDwGVRQMmEIt3RhbNWbRnSg8cbZ
	AOZm4iTFgv3yU8UoYe0gbOcEOBTYGj3dsqvTm46WtXesARLc0YM7mkhmMsxvbBVkUXnBpM9XnyK
	ti8S6oCYqg4Rl+8XZxWDmchrdU/NsB9VAQlqUPvY2MLQN0X86W8wiqKlHsxAH3ViMFyz4C7zLLN
	dZKmq8S8YitzS5NaYTFvhCnnfdEtyhCjxLUKEcHOMgtjm6nJsjd+b7jMbk+/ArXmjgg+VU2Wioj
	p3F5iD/WqdzMiggMD4/wFEv9ZuPuawAuVkFZzz/oO8XjqYMnG0WwIB7MFfq7EobEz22345Po2N2
	8F6m9jhD5bxXEikwTz3g5ncUr9IPpwAo
X-Received: by 2002:a05:600c:8b24:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4b963c82388mr73750225e9.31.1794241653881;
        Mon, 09 Nov 2026 08:27:33 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm11053891f8f.57.2026.11.09.08.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:27:32 -0800 (PST)
Message-ID: <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>
Date: Mon, 9 Nov 2026 16:27:31 +0000
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
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/10/2026 17:55, Leo Yan wrote:
> The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> 
>   | When the following conditions apply, the PE might ignore a direct or
>   | external write to any of certain Trace Buffer Unit registers, other
>   | than a direct write or external write to TRBLIMITR_EL1 that clears
>   | the conditions:
>   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
>   |   or the Trace Buffer Unit is using Self-hosted mode.
> 

Doesn't the rule just say that the buffer must be disabled before doing 
writes to other registers? But the explanation for removing the extra 
disable is that it's already disabled at this point, so nothing changes.

The commit message would be clearer without this bit IMO. There's no 
architectural requirement to make this change, it's only a software one.

Otherwise:

Reviewed-by: James Clark <james.clark@linaro.org>

> trbe_enable_hw() calls set_trbe_disabled() first to ensure TRBE has
> already been disabled before programming any other TRBE registers.
> 
> However, TRBE is already expected to be disabled before trbe_enable_hw()
> runs:
> 
>   1. CPU probe resets TRBLIMITR_EL1 via trbe_reset_local();
>   2. Interrupt handling disables the buffer before re-enabling it;
>   3. The normal disable path clears TRBLIMITR_EL1.E.
> 
> Calling set_trbe_disabled() from the enable path is therefore redundant.
> Drop the call from trbe_enable_hw(), which only needs to program a
> known-disabled TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a7c1037a048f5236598f8f3a7cc4f47bff9d329c..979d0fa84c1c7b448c1ce5cd7a37dff8845795ef 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -652,7 +652,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	set_trbe_disabled(buf->cpudata);
>   	clr_trbe_status();
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
> 


Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644555226AA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066799; cv=none; b=i/tyz6P2zxo+xPJBsVV5F4jWXgyPlwAxB2a40AefkU1YrJ0/RSfqEq7t6Hdejpm9JWmN9KGYa4JZJms6+Go9H629xe389V6xubsXBRueQtjQdq1cl5JZL5QPrBt370sTT395fe+NEe7m0Jehl5RyNwJbvFgiJfkG5fKkYN9VP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066799; c=relaxed/simple;
	bh=N7pksNGYwP5bIoLxax1myHPV/MNG0nXyJIIQxi9X+RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrCQUYtkNqHpkkFtnjhZgxwuXNoIhlN03vT66dOEj5TyPKRIXxTR9EnQGgRNqGFs9CQ2pQq8xKsRH/MmKxKkO7vOTOXcDm7D3FWNF/ARD7//tbSNuOPN9Kmn4Z+6nCwqWNSE4gPNGqOIOzolXbFCfMQNhAZCojpCHP6xnYqsu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=PV8O5Egp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="PV8O5Egp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93ef1a2948dso385453085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792066795; x=1792671595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7VT0D2PaN+6c8JQLPdTKBkDcQOrdP2XWII1gwddmXc=;
        b=PV8O5EgpZMrM/+HoR2pZKOq+sOVEQsEJVmI8dIqPLSWyRhzpFODdmCzrXYegnYBivR
         GTHwh5zlBcHjXU6cunAkQHCb1w/Om4wZ7j6xfc5k/ZMyOIrmyhaCoeWK0KPJSG3CBJp1
         KK7FV4MC8xqOYv9f7cvm3jMCEVJ7jJyhmx4as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066795; x=1792671595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7VT0D2PaN+6c8JQLPdTKBkDcQOrdP2XWII1gwddmXc=;
        b=JLUG3tb4iNHht7oOzJS8OmCddlZ4MMnRF0mRahBM+iqpcI+/b+qh+ht2in5UGNGjle
         Ujo875IOkuqtT7YNpFft4pUjtAGyUXQ8wdxeLro7dYrj5J3hpcTnlgNjU2Pa7VHEHbzO
         YZs6z0FEGPRgTI9WZor6cipHmYXDqi0lxuiEiuUIoTtYT7J/K0kD13/RD6RaXtP0y9xo
         qzQ6jpESSYBIxkzCpMl389clY7Pp0gMawxonQ+T3b/U1KaSw7XF4icpsJCaZGrBkiBB7
         StfcdHbYY4Em0wC6OAWM3+GxevJZjm4yAtnq3vvO5ozR6rP5ggFr1EuOKwZrjqfASKmZ
         P9iA==
X-Forwarded-Encrypted: i=1; AKwUvByOCpaubGWnlpk86EV3VgtHN9n+O3bhp9hDKxHYEthie08WDt+wYvPb0WK2c0X0h1uS/+W4t4lEVdZAiyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLziB7DLWsnmB+2BL755Z8OHhF+WRF1I9sLFKSuyA8m/fOe0WHB
	+aSOqu/O07ra6KlhWrEgQflR6ZvI85ypP21KfqW4UJSlOIo4PEzfXsShed0m2dsbyg==
X-Gm-Gg: AYBFou0rK7hsw0EDt2HVOk+xMSpkeeHbxSv9G2sV5HMwNDq6eFFrIbaFYBlvm0q1+zt
	qU2GxSx0Bq2T8TR3I6u39g53B9WYxNaDn0AoR41w4dfysoTpNhuB5YUQMKD98LlIz//Y8+qR3Td
	ksuzzF99E8cpdPjKXBzKzZNKwwZHOJ4+5OqHITi980MHp7Mk3xg8wAiEQfpXvsMNWHOyKXJe3BJ
	97IA90NsknKxxubI4m7c5j3H027BnY4YH9iWvk7qmgW5l/eplI/Zr+0rmseO4iWyGJIJB5pOdr9
	FcyOKNxLtXb8Pz1GzfEMDZkbfJZcnYJ/8/or5u77TWu9sSVaoftOZ23zku1r/lji78lN5KNoaEy
	QdkOQBKPLYhUyOIu2E/YWnztcYpMC2A8lo22KUOKwg7NQ/34wjY+Cz+1By6rHlPOcLNPlrPN9Ub
	3oQhTuK13Jg3PTzxxm6vPmZBZKwAvD1/QBGqnfkSl35IBLVCx8iMNAK8rKYSnTLzy/uQ==
X-Received: by 2002:a05:620a:3712:b0:93e:92b8:e373 with SMTP id af79cd13be357-93ebd0c0183mr3124333785a.4.1792066795257;
        Thu, 15 Oct 2026 05:19:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-93ef502b096sm751802385a.21.2026.10.15.05.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:19:54 -0700 (PDT)
Message-ID: <5c775b87-fe61-4384-bd23-9f563237945c@ieee.org>
Date: Thu, 15 Oct 2026 07:19:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
To: Jeremy Dean Clifton <deaner92@yahoo.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261015020731.98150-1-deaner92.ref@yahoo.com>
 <20261015020731.98150-1-deaner92@yahoo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261015020731.98150-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 9:07 PM, Jeremy Dean Clifton wrote:
> Commit 3228900f80c2 ("staging: greybus: Remove unused function
> 'to_fw_mgmt_connection'") removed a function definition but did not
> remove the function prototype.
> 
> Remove the prototype.
> 
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>

This could maybe have a "fixes" but if it gets accepted soon
I don't think it will matter, because this will land in the
same release as the fixed commit.

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v3: Change to imperative mood and write in proper English (Julia
> Lawall).
> v2: Fix grammar and spelling in commit message.
> 
>   drivers/staging/greybus/firmware.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
> index 5d2564462ffc..04a67d2d5b8f 100644
> --- a/drivers/staging/greybus/firmware.h
> +++ b/drivers/staging/greybus/firmware.h
> @@ -22,7 +22,6 @@
>   /* Firmware Management Protocol specific functions */
>   int fw_mgmt_init(void);
>   void fw_mgmt_exit(void);
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev);
>   int gb_fw_mgmt_request_handler(struct gb_operation *op);
>   int gb_fw_mgmt_connection_init(struct gb_connection *connection);
>   void gb_fw_mgmt_connection_exit(struct gb_connection *connection);


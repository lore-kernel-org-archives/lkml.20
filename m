Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF448F82C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398431; cv=none; b=Mq0JMkeHtPHRAC8SzllCNrpQU5qor19CbV2yEqYCncmtb+babHAg7ubm5En5nAjw0WkBCiZbdlKPJhOjsMZEA6GNsHe28WKQd9ZaMGKs6dWHBD+W/dDJ+F4RSB+6r4eIGbxhWxIioJfSRURlwybgs+pH8PzEcEbdQnPIHFbdKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398431; c=relaxed/simple;
	bh=FCXiZlqccnOhYUcAQVW7/WcCqqPmBSKFOKi8hDqggKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bC6FitnLau624zExH/cgKGcd1goqhhSJ7gjulj6E0L5ipPI7xsZciHbwK2wgv+2X5G1kizEb59OApDtkMVhulJ0ClPKlC+x8UKgC/vRO1GCrsna04mycc+OKYiuehskF2tLpmawV9oziEDY7Z/lW5+xzBUAw5BR++Hy1L7tahnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK/Sjr8k; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UK/Sjr8k"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so235554366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789398427; x=1790003227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3h5ea7IOf0EVQAaE0ptSbBKWXAx2/t/WtJvk1q8hIhk=;
        b=UK/Sjr8kFUFcUApvsJ+UgvnebPDhTxht+mM3Arje2JZYp0ku4z8zxKsHKKsUzsV6gS
         ZgorhyDIGaUDTOKE6rHnvFgY6vULTp3iFZOUrTmiAq2kQ17HVX/KbZZEpsNd0X/kKpqg
         IKz3eTS4GpFXt8v4NaXRjfjaCbTcR+Hl797MzcjI5nXt0bX//9Y/lWcY9KmMSZcGnA/W
         BaL5hrSyMkSqDJVhD55+nrpbI8zA/6Q0qa1J10gA4zT/JvGh4/4bE3cpjp5ULwE2HZu7
         ttVH4L+Nvhtn9+IFrmus6DAV604GguhoQqXcObXFW7HnNP4udYjlUto8vCx6oVbQF21T
         CQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398427; x=1790003227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h5ea7IOf0EVQAaE0ptSbBKWXAx2/t/WtJvk1q8hIhk=;
        b=prsYahX8iyUuqIyC9zWlKpXorUMKFTt8CZRPqKwbC8lNAGABVWFrQqLSFksepfjkD0
         kiznNmAVIcM88F8i237YIHUsU9elYOhUMILpsJ4+8LO5mCzW+Z8HA4H4xAYTqKwI5mz7
         FrlRhcS82GDD6Z1On/jEuMfXo8p6xmtBktc+SJ0FiiQ9hkkzvOPRzp81kzfsGgEmJS1P
         jogGYi17cUCdbhQyzGCgzEe9XlF4NvkR+9aShQ5wuDZwlBFGksXdNBPs2X+FJ5FMk8fk
         8y0skqNMRlR0ntFIJaXTavQfx9se24AJlpVvcpMT2+HNqtQ4FYENnLrH6RZcL12NhPj6
         OLWA==
X-Forwarded-Encrypted: i=1; AKwUvBy+frKCpjPCIXq9OSxbdxeneKSf/rNZicA4vSVpQ74ceDlcRz7wvC3pmE7N/r42CSC46IGbzmP+5CBDloY=@vger.kernel.org
X-Gm-Message-State: AFuF++nncFD2uXae2ZxvSjsMxDttQVW4TXO9EglkjucXXRod1JyJXAB1
	k98Zjvd1bIWXanzAh7pKfrH4dmt/svTkJGHoemwTO/FuXEgp6jc3QLIMHj9pjxGII8I=
X-Gm-Gg: AYBFou2mJzfBdtUNALfEqR9RkSHncQWVwS9cIsKTSUhSwR2A3qhST71ZqocVOLDUV6D
	wujo2s9dXy903EhH190Hqs6BkxbLpspexKJdZju3D8Ftxf1OA+R8I4WnQQ8jgD527yXft+WlX75
	A14bWOM7WoCcC/9WUVQlzR/SFEp1Ye5LAvChSPbS5YS71KMcvWD+wO2O1mt1BlRwntAv0IU46uI
	YMlfFGF7A+QDknhFWCryZS6nJAaBUoATWrPBvuBIYC+DANyeom/fJuxPiZKqq6W0dk2eSALipHY
	5vqLv5jZZLabWRmXN9qkzkgAKCUt0px/iyiahAiJWua+Uw5wXOzC9L/QelG/BQ0dv+FHmmCIyqj
	dQ/Lh2boIPqh3abjNoUZhL1QhF6lrHKVcz6gyZ1HsOEdiArYDq7R25RpVSAkEWesrFWt3uhuTre
	xpGK9Nbb4RzF39ssHRhWi1HNyVtnNsDuo/0uv9+xVFeygvYdMxcDqFClskBD+fCh0wijUSZmRUC
	IXUw156psk=
X-Received: by 2002:a17:906:c106:b0:c25:8fb2:5e24 with SMTP id a640c23a62f3a-c29b8605e46mr206316666b.15.1789398427031;
        Mon, 14 Sep 2026 08:07:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966125543sm443442466b.55.2026.09.14.08.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:07:05 -0700 (PDT)
Message-ID: <81fc2514-151c-4305-9a3f-4d2774c7c5ce@linaro.org>
Date: Mon, 14 Sep 2026 16:07:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: qcom: camss: create the source to CSIPHY link
 per endpoint
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-3-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-3-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> The link from the external CSI-2 transmitter to the CSIPHY is created
> in the notifier .complete() callback by walking every registered
> subdev, reading the CSIPHY it was bound to from sd->host_priv and
> linking the subdev's first source pad to that CSIPHY.
> 
> This assumes one transmitter feeds exactly one CSIPHY. A GMSL
> deserializer such as the MAX9296A has two independent CSI-2 output
> ports which, on the RB3 Gen2 vision mezzanine, are wired to two
> different SoC CSIPHYs. The same subdev is then bound once per CAMSS
> port endpoint, the second .bound() overwrites host_priv, and
> .complete() creates a single link from source pad 0 to the last
> CSIPHY. The second output port is left with no link at all, so a
> second camera can never be routed to the SoC.
> 
> Move the link creation into .bound(), where both the endpoint and
> the CSIPHY are known, and resolve the transmitter's source pad from
> the endpoint fwnode with media_entity_get_fwnode_pad(). Each
> endpoint then gets its own link between the right source pad and
> the right CSIPHY.
> 
> For a subdev that does not implement .get_fwnode_pad,
> media_entity_get_fwnode_pad() falls back to the first pad matching
> the requested direction, which is exactly what the .complete() loop
> did, so ordinary single-output sensors keep the same link as before.
> 
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

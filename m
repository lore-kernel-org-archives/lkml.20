Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9E43DED2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429975; cv=none; b=PVPeQqW+jaO0zrifmDv+atYLEAnTSIejZ35av4TXfLuvKnwj5FYRhEHYdaqnKlBdqIy2RM4f2A6P987VlUbiRtcJWEHJePOF/pWS4VXNYLVoy+wVt0zPv202XC1LwlpPSjl8esphW7dmnfd4vdLVVk6BvOIrjT4Nxl5mSBPF1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429975; c=relaxed/simple;
	bh=4PCF/pTuaQyrbWnAxj22N/OYcuTbKlF5oGBXIAB9HlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qry6uLKzrnlEqTCqZFAnugD/QF4uSDs7ue43NYV/5k8XoXfU2KQRpYKosZiv9lFtNNnxzhD2618K9l6qjWubDZPFRBmOyfr/BPDZPxPrdBgID6UVIDQ3oa0ycS8Ayg9biDwEYLVFqy/MRJ+zGpuKQLy7e2E+SiIy0Ybv9nClMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihBQu6b0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihBQu6b0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso3933475e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429972; x=1791034772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=ihBQu6b09GQpB3/He72I1I2v3E07wXqqmjmsqIP37DuzjzuVmmABwkkLhduGoWmsYH
         3Jf4ADssSWbaTfm8tWx3K6Ur/bS4GQ0Ca0zZ5x7GZYOoCHkqdrXVEoFNrD1+uX4s0W1M
         mv6BO6eHrVTqzPmtmVPpJBthPJR5aO5koB6ecyAjWTHmAFbAPJCt56+PlR/G280162Az
         UMKIQ7QNn3EuhBnprpcuedFgJ4uV1NuxjBlg0tQ2IcK9s+WH8I6B/CUk6X/vYffr+mAH
         eL7/Y2ipqi6v9Nw1GsUIqNeYtvopTcs9DxRRPpMyTAGiZWj+QCqIzSN02eHd2srToM+q
         9n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429972; x=1791034772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=bX7M7UFbQ2dotjkSgmd91ceszk4m+oXHOIZvh5ew0wg/soRUnM/DlNyBhhlQQAVyu5
         YLLpbtykCRuNoMCTf8qgKQnpx20mcFbVfj9aAwf/zZKJduRV/iojUdCoESrJI0kYWpKm
         XvVKllLjzaMz4RtxaMEr76zlgkIOdLWBJqEmRF2OP9Mo7iAZb97d+2veHONw5CNHgCM4
         AtUDOUyQ90E72HvF2HZi2e0uH/cgkxPykBHQmxl0NEv+2R8fQZJ/19bEPO26XPofhjuP
         l87gLHKQkUwnhMYr94MQ8BjhH2oGu6FCenrF5HnpJBFl7ZU7o1CJw4w+b6BsGDsGPRWE
         MQzw==
X-Forwarded-Encrypted: i=1; AKwUvBxiCkC9lDLB5ATl5cAd1qtPhgMxGoQxOTzrjHcw70BsnwqjlPVLwHzQxrYoFVbLiZLL5xxgawwcUpbvMJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nmjbN+6cCu1GernRXLhouvku0zBYLpWccGQPASD+BetacB0553
	IVm4bX6QzNnW1E0R3lp8o02HQyr9rh7rR91QNZSwn+51qrKbnYPQERx6BCHdTJfxubc=
X-Gm-Gg: AYBFou1CIcLceYBmlrGj44uSxlvP4Rt+nrhaM1OCKt6rTAuPDjNjlo8qhTi7MKubbVR
	S1DW9EoOkY+09C4qpw3hnrqRH6WaBwlFSdJZA8DlSddZRJ+859ckcM3qXq5c8FIRnZN2Mxfjtkn
	YUCgvrH2QGkGXNMR3nJd3aHK9gd63lMD8yTxoEpqYCOTH46bmPaS/vsvbr6MqBF4Eza8paexk75
	dq4apEIGERNwFqcJPvSwY1TiRSm5MDKGi+8W7AeVjhKsQLe9IQSc7I15yHQV2/2dF2iPb4gaDCw
	9l4AnN6n3URk7fsifH8+P5VAeAJcRIJD9MB8jd/rrpze+tni2LuK2IRp5raPdf9730vfyZ2+gbU
	OGQ2NEvlYPJBSSMWvuETkE5hgDyPNBibunH9b9QXjC9CJRUpGSP2+xHCyiq/+Zz0sK6xEbYkyk2
	FNxEPMZ2llYdMGRu3Eeh6OU9RZzv+PvdCElRKtUPY7roJVWQcr629AE+FFEg83NmGlEQpo7oqzS
	kw13I4lIL8=
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr113280505e9.4.1790429972111;
        Sat, 26 Sep 2026 06:39:32 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm14706746f8f.7.2026.09.26.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:31 -0700 (PDT)
Message-ID: <0946da1a-e8e5-4ccf-a422-abcbc24cdab3@linaro.org>
Date: Sat, 26 Sep 2026 14:39:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is a preparation for extending the support with 1st generation
> Type-C.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
The code looks fine but, I think the commit log could do with a bit more 
flesh on the bones. "We want our own probe function because"

Then:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

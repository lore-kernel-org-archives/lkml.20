Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F43AA9E2;
	Sat, 26 Sep 2026 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433170; cv=none; b=MMbVGYHwe4LiJfm+Dfb6csKC5/cQwvzwUJQp5vnGx/YtiGXlmc6/WgbCQ8A8+ac0nbQRLlQs5bYKKzZeY0ZZVfUKNN6GpPJ9C4LUgZhxZ5isFMYB30VkooUfhBQaKrN/evJYGodzNrrn5HIyLxUDBRzYlI3NwWgR/InbFqYlh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433170; c=relaxed/simple;
	bh=9PVq6te5RlaVmfDPvrAeD24E+2yqEFAUXXCvOFbb2wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imsWgJsxE6rzpEaihPw+VJhOpSvXdR+jN8++/eg0r9f2SsuPn7zZx85MEB2zRihoKjCl8Do5VQeedcsTJ9zkT7BZxY2dnQWbP1/yNaUUJE/6PrBNdFQHcLVoEoxHV9V0u5lC5XdqIHZe9VFS8d48QCF+SHOwx0zG23/afsECY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=uSs1Q7hM; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="uSs1Q7hM"
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0C2325340720;
	Sat, 26 Sep 2026 16:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1790433160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bwds6eB1dzoejJvD8DGzRmziXCAJKMCC6cVC8LYHgzc=;
	b=uSs1Q7hMuk5ooSBlD6e0Lzte5B4F/JBQ4egcVo3CQ+0EVOp0DhJ0VCIkpu244a0kfiyaEi
	QMsf5cCxHuLjB3zzlUTuBHbD2MZmeEo+zwlocxjggjFj1N4U3HB4911WVaGX5FOebfV7/q
	9wyaPhWJ68rTQU9SZFWyXzJvCKi9mqA=
Message-ID: <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
Date: Sat, 26 Sep 2026 16:32:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
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
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2026 16:22, Bryan O'Donoghue wrote:
> On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Add a port backend for the first generation of the Qualcomm PMIC Type-C
>> block, found on PM660 and PMI8998.
>>
>> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
>> (base 0x1300) instead of the standalone Type-C peripheral used by
>> PM8150B and later PMICs. All Type-C events (CC state change,
>> tCCDebounce done, VBUS change and error) are signalled through a single
>> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
>> to find out what changed. The PD PHY is register compatible with PM8150B
>> and is reused as is.
>>
>> Differences to the PM8150B backend:
>>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>>     instead of using a software debounce.
>>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>>     requests are advertised as 1.5A.
>>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>>     is applied on every power role change.
>>
>> VBUS sourcing is optional and only used when the connector provides
>> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
>>
>> Assisted-by: LLM
>> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 +++++++++++++++++++++
>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>>   4 files changed, 630 insertions(+)
>>

[...]

>> +/*
>> + * Failure of this workaround write is non-fatal and
>> + * we can continue with the role transition.
>> + */
>> +static void gen1_typec_pbs_wa(struct gen1_typec_port *port, bool sink)
>> +{
>> +    unsigned int val = sink ? 0 : PBS_CRUDE_SENSOR_ENABLE;
>> +    int ret;
>> +
>> +    ret = regmap_write(port->regmap, port->base +
>> +               MISC_BASE_OFFSET + TM_IO_DTEST4_SEL, val);
>> +    if (!ret)
>> +        return;
> 
> Why would the write fail and why wouldn't that be a critical case if the write 
> did fail ?

Heya Bryan,

thanks a lot for reviewing the series. For the rest notes, I'll incorporate that 
and/or think about it later. Here to quickly answer to this note,

this one quirk is definitely NOT REQUIRED. Originally, I was testing the driver 
without it on sdm845 devices, and everything worked without it just fine. I 
ASSUME in some situation or with some devices combination it may come handy, 
thus likely if it fails, not much usually happens (and clanker was suggesting to 
port this one from downstream, so I did).

David

[...]

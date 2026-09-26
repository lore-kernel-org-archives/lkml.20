Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA243CE7B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433676; cv=none; b=NmgbdwR0guaEGt/C+sjz0NUQmzTo8C9cpTpDi2Mq/TyhDDFBCiuQykCwV9SC1MaE6hW6PXlXxce2w84LRYPYkxVVZtzwv32ITR969N4Em1MV8rg4jgxR0HLKW1tlTNCOXMoseRXpivU4CfF1D8/F1jLnEYKE5J3i28UrxwINEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433676; c=relaxed/simple;
	bh=oiXRKP29ZUO2dA9Y55/UdFoG+3sZBM2fEQlPHS6Cq0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO5rwm8NzG6Cx5VMfZPaOjswjwYZj9cnT0keeP2zoIBwWIX+mVIE0mmffMc2lofhheXs94ez4m4sy0sjIfcELqHNPN6gg5vk9/UscMars0Ht32PDOZXQqoA3xnWTd3q4cKk7s4/5PN2LLdTwazV7YQIVKoGFkDYGTqdyfcgvk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea7x72L5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea7x72L5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1355444f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790433673; x=1791038473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=Ea7x72L5xc2RrLRgzr6+G+utIjvldXO3X1Dt5RPCmcA8jphIGH0sNHp82gtfI9S4f/
         XWv3vUZDE3hddtBj5AWHHqilNSXGWztp7vh6fUqyv4Y/eyLKhE+eMyVq6NtTNUTr4Kge
         HVRPLT7HhKH3BB1NQy+5ZzBusjEeVvu0OVpWviSORqkk54v+wzBERwOZ95YH4YrcWLgk
         9oWpSFWHvNr9ZGbOgfGwsWdi+rpuQZWrqeUC89s+m/rnnQW6zpWZvNYVHa7JwEgagUzO
         k5XUmr5OFaZTgrZ1/DPrDFbB/Dup7qZe6v9qBcmW69r0FLkBfWfigQ4Sp1YvHSbXwUMx
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790433673; x=1791038473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=aVFdOBJys0o8UXs3otqF4rIz1lIssp7Lk1W6xbPpqolacMQ/wu7a6u0Jh7YaL5UBIr
         so7D6vJHmY4tzYd6ve6gGVO/I1uMilf4nh5muczrq7DnZ9o7G8pmqaFbRKdpIbOdycPT
         SmDRd+8PFRJy/hVVn8CCokvjFYikgiorsYOwELLsv3I+qfD8M9C4Av9mljKKyXS7RoTc
         7RER4APkis/7pbJ5t4WHRjI4U2oVedyjEWDceD9LKeVqxM0NJzDMlp8ywxNSic9JG+nL
         AmWHY2+K7Q56q4pOEbVytyq1PlbI9FEUvQiEAhLXoSXOc+6zHjwSE5E6UJxtJb5M6fZq
         zqBw==
X-Forwarded-Encrypted: i=1; AKwUvBzTfvGk1A/gDTCcARVelWQORxpPUaUnm0XG524mI9/GJD5J/1RKhPmixTY+ToiNK27f+X6+hpsd89pI90o=@vger.kernel.org
X-Gm-Message-State: AFuF++knTQ1cIev2B3cAqY5y64CCEwvJqyxW2nopwONo5Jb30+BM5Y1K
	lkPAuJQfD2ut0eExpsxon/xQuIkXmF6lGS09OpX6rvA+8zCqxSfIBqesI4nqei/PmE0=
X-Gm-Gg: AYBFou2zFAosC5ZHOpAVXflxrXZPwXM71/2u2bZWJOAftSFB3l2eH2EIxxYIyeex/Xn
	ebsXNz9hhOX9kyAm2GI1dYgvM7r/LBNu/IT+z23uVs/cz6C3e9g8eInvK6aG0+iiOX3VG7KUbem
	Ov3b7UIYu1QRo+135TlcXDcx5WFSyr2UfHc4e60VR/kPsOgZu1OW5wc93s/xUAgbb1yu8Jjhbyk
	Es/fC25vl+Ro77rpWr+heKVF6dl5Wnb5NRt4ZWhGGm9wNbX2kSMqDdBjnNhv5Xsg6a9tMT6rWDC
	ztCkY78fpRkPSU+3ddULiTfZnFbcc/j/Q6Y7nsl6DZN+c5/O1V8FqtQcaP4OovMsx6JnD4BGZEd
	drIbSyzBwAPxC9NoUhG+ZDq+HYiHwfIbG6iz2YepBegIxS6lRJcvUWHB87KhQDI6pwSA2GErVRK
	+BC5uymuMclWzU/5hCk2+OmP8zMUDJOvoL4kelcj+DcAw04xwFS8KfAkYDtxn/W2F+41Y5ujpT7
	SvNPB4IRQf1+B89aFUTZLQ=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr156760565e9.14.1790433672783;
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm228645705e9.13.2026.09.26.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Message-ID: <8f6c3e69-f616-42b4-8e33-f05ac0812722@linaro.org>
Date: Sat, 26 Sep 2026 15:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: David Heidelberg <david@ixit.cz>,
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
 <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2026 15:32, David Heidelberg wrote:
> On 26/09/2026 16:22, Bryan O'Donoghue wrote:
>> On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add a port backend for the first generation of the Qualcomm PMIC Type-C
>>> block, found on PM660 and PMI8998.
>>>
>>> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
>>> (base 0x1300) instead of the standalone Type-C peripheral used by
>>> PM8150B and later PMICs. All Type-C events (CC state change,
>>> tCCDebounce done, VBUS change and error) are signalled through a single
>>> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
>>> to find out what changed. The PD PHY is register compatible with PM8150B
>>> and is reused as is.
>>>
>>> Differences to the PM8150B backend:
>>>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>>>     instead of using a software debounce.
>>>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>>>     requests are advertised as 1.5A.
>>>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>>>     is applied on every power role change.
>>>
>>> VBUS sourcing is optional and only used when the connector provides
>>> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
>>>
>>> Assisted-by: LLM
>>> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 ++++++++++ 
>>> +++++++++++
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>>>   4 files changed, 630 insertions(+)
>>>
> 
> [...]
> 
>>> +/*
>>> + * Failure of this workaround write is non-fatal and
>>> + * we can continue with the role transition.
>>> + */
>>> +static void gen1_typec_pbs_wa(struct gen1_typec_port *port, bool sink)
>>> +{
>>> +    unsigned int val = sink ? 0 : PBS_CRUDE_SENSOR_ENABLE;
>>> +    int ret;
>>> +
>>> +    ret = regmap_write(port->regmap, port->base +
>>> +               MISC_BASE_OFFSET + TM_IO_DTEST4_SEL, val);
>>> +    if (!ret)
>>> +        return;
>>
>> Why would the write fail and why wouldn't that be a critical case if 
>> the write did fail ?
> 
> Heya Bryan,
> 
> thanks a lot for reviewing the series. For the rest notes, I'll 
> incorporate that and/or think about it later. Here to quickly answer to 
> this note,
> 
> this one quirk is definitely NOT REQUIRED. Originally, I was testing the 
> driver without it on sdm845 devices, and everything worked without it 
> just fine. I ASSUME in some situation or with some devices combination 
> it may come handy, thus likely if it fails, not much usually happens 
> (and clanker was suggesting to port this one from downstream, so I did).
> 
> David
> 
> [...]

I ran this code though an LLM and it is babbling about the "shape" of 
things to hand you LoL.

Anyway the pattern matching part flagged this:

"Write outside the node's reg. base + MISC_BASE_OFFSET + 
TM_IO_DTEST4_SEL is 0x16e9, the MISC peripheral. 03 declares reg = 
<USBIN>, <PDPHY> only."

Worth also verifying.

---
bod

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B727411F8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274697; cv=none; b=NEX0sq+IirMVm28XuituNYJwUNNJE9O0/4OnLlXQPe8+M6QFR0cL1+iFnTu1NfedjN7Quaji6QdEFT1wPAeSCjTLKqYXwxvLF+G2afsnY/szf0bZaja8Omvocqk+joWr9Q6P8S3VzixOsrjvAIave9hGoM7vaB9RqIgYC0bHlsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274697; c=relaxed/simple;
	bh=xksdRuihJ6RQTqUvVSFVXcRtvXMnSxoSEw/clmOQOt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=me2JGorculi6xQpg0IRze7tvNKTRxEn4qLc9zBjrDUarrhBGwfV7qUzZuaUIlrHVfWg2PtDfa4jHdwQ5TdCR38sycmIxwouMrPdtLX1SrRQXB/5TNdku822SirOZLdBvlpLRO4yvCcSnewhitX/dFtX/gICxxzEcByYhC4LUyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=VyDC4Wv1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="VyDC4Wv1"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0006ea8eso48793161cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788274693; x=1788879493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCwYat8AACN3jrzTsU7VQdP9QBM1LUdIVo5Kd7wh13Y=;
        b=VyDC4Wv1EUCDYNddG/RWCy+vUU0cVHnUEapNQGjogg64q60bySJhzHazdP3mxvyv5T
         VTIiLb/R+gIki/mIfR3SpGU6gDSd4uVIR75EZhhk/ZLFZZ1cv5eW0HKg0gQvXPERt604
         52uZqKte+feGj60AGWNxP9hPmeeH/QpNfVC1akHPYKok9CtU5N6vrxF4bA9f5rFWgJlv
         R0hTNAw6wNGsEDNdJvjLeA6jCbH9u747RNGRl7rFF5PYbelS3ptuGRL8loe3XNzuj2Tq
         QMvw4OS9FCmoAxwfXnxqawqWDLd9yPeEtbSQcPw6jdlBtir5IU34UNI6qXn6gu15c4VW
         BbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274693; x=1788879493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCwYat8AACN3jrzTsU7VQdP9QBM1LUdIVo5Kd7wh13Y=;
        b=iCrOKKv7TTFqxANnLabFGB3ohJiftRTZsCANMAdMXNhOiviUGcF8H4FCo0THdDPTBw
         SUuzwRb+JE4tmHTt0s1VwbLCWWz5RsQA+OpkonhiORoHg8mhU90b3otNR5BhjKGHHWpv
         GetkwayPZiLUTZ6aR9WtKq+MCX6kRdccw9iCUB398pa0THQwh31wmnjbv+Mh6nHk50S5
         sNfwju9NqLSgyKrEayQ97N7/Q+RIJcqShXW7DbVaorjXTHalM9OY0KTj+lCVEpHpgZeM
         4Wk27AghwO2hBQARqHD0r8xJX2mcwQ/6TptGmef2x+xP5YHebpEMkXoAqz/2xorCmCug
         HQlA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3wlzY1/BEBKqnfSkOPayuzoEsq1j/VQaaoBaNNhRBenI6Pf3e5tej2LR14wVATB+Jerry/JFfZuyOyPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kTiVnwkovTAqpVeHQD47gHMrrKH2IFxi6nKmNxcfBTHEpAii+t
	BkLSjzW5+APwU2wyUhC7exbYtduVoE544pYqXaQP4tiF4jDVxyBW52bqmfb65EjaH/RSdotE8uU
	OZeoT0v4=
X-Gm-Gg: AR+sD11F8pumwuoQe8rytQ7KDwkuoQRq81XVaKwBcW+OKBc4ytlfNMT6mS9RTNYchE1
	qsq/9AIjOBvPVYMjCwrlcQ+rlgvqwkqJFdcy7P0iNma2LJlh53lvnZjrBqzPNqcL8QVEFO4Ww38
	DLQCUS2qu79zxVCjvay1eTrjUjKZ9cvks1OtxSrttQiEfkCS+bjCr5L4045zsZX0btI15KHrSOF
	GAJalxcLGepje3hnmVcf8Rp8OJ9TAERJtACi/ozvbHb4l+kYtJVNy2fjzzKJ9+JSF0DYAmnTt6J
	HL0enrX9UwmZtbUloaUaDIshs4m20fqd3ZIXZaP6HpHP7linDTk+3WqmSFcrv0PXdTgoJcavXbt
	hW77nqifREOIW/9mUJR6BmkQI/BflZ6bcX5s2c19OmbBcmYyDTQ4AzvUtMJ38FtzlwmEKcm7PfG
	jp0jpdTH79VCvneTQNt9wR7MwMEy6l0DYuTUkVw07L0eY4gGCV3PbO5+Tm9b90
X-Received: by 2002:a05:622a:c8c:b0:52f:a319:da85 with SMTP id d75a77b69052e-52fb96af1b0mr447135601cf.39.1788274692940;
        Tue, 01 Sep 2026 07:58:12 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ff6f363fasm81508941cf.16.2026.09.01.07.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:58:12 -0700 (PDT)
Message-ID: <6a5bec41-71ef-4d9c-a34f-77d166b15ca6@riscstar.com>
Date: Tue, 1 Sep 2026 09:58:10 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] of: address: kill of_node_is_pcie()
To: Herve Codina <herve.codina@bootlin.com>
Cc: bhelgaas@google.com, robh@kernel.org, saravanak@kernel.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-5-elder@riscstar.com>
 <20260901084546.424c6ef2@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901084546.424c6ef2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 1:45 AM, Herve Codina wrote:
> Hi Alex,
> 
> On Mon, 31 Aug 2026 20:13:37 -0500
> Alex Elder <elder@riscstar.com> wrote:
> 
>> The of_bus->match function for the "PCI" bus type is fairly liberal
>> in what it accepts as a PCI bus devicetree node.  If a node has no
>> device_type property, it even allows a node named "pcie@" to be
>> accepted as represnting a devicetree bus, though it issues a warning
>> in that case.
>>
>> A recent PCI commit introduced of_pci_verify_node().  When a PCI
>> device is added, if it has a devicetree node, that function checks
>> its device_type property.  For PCI bridge devices, if there is no
>> device_type property (value "pci"), a warning is issued.
>>
>> That warning duplicates the warning made by of_node_is_pcie(), and
>> there's no point in that.  Avoid the second (OF) warning by just
>> checking the node name directly in of_bus_pci_match().
>>
>> That leaves of_node_is_pcie() unused, so get rid of it.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added (new) in this version of the series
>>
>>   drivers/of/address.c | 12 +-----------
>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 499d37ceae210..ee2eb44884d85 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -134,16 +134,6 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
>>    * PCI bus specific translator
>>    */
>>   
>> -static bool of_node_is_pcie(const struct device_node *np)
>> -{
>> -	bool is_pcie = of_node_name_eq(np, "pcie");
>> -
>> -	if (is_pcie)
>> -		pr_warn_once("%pOF: Missing device_type\n", np);
>> -
>> -	return is_pcie;
>> -}
>> -
>>   static int of_bus_pci_match(struct device_node *np)
>>   {
>>   	/*
>> @@ -156,7 +146,7 @@ static int of_bus_pci_match(struct device_node *np)
>>   	 */
>>   	return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
>>   		of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
>> -		of_node_is_pcie(np);
>> +		of_node_name_eq(np, "pcie");
>>   }
>>   
>>   static void of_bus_pci_count_cells(struct device_node *np,
> 
> The warning here was printed based on the node name whereas of_node_is_pcie()
> prints the message based on the 'device_type' property of a pci_dev node.

You're right.  Both warnings were getting reported for me, but for
different reasons.

I would be happy to just drop this patch and live with two warnings
in some cases (we should rarely see either one of them anyway, right?).

Is that OK with you?  Does anyone feel this patch should be kept?

Thank you.

					-Alex

> For PCI to PCI bridges, no problem the warning is indeed duplicated but what
> happens for the PCI host controller?
> 
> PCI host controller drivers calls pci_host_probe() and are seen by the PCI core
> as a struct pci_host_bridge.
> 
> of_node_is_pcie() is called for children of the PCI host controller (i.e. PCI
> devices scanned on the PCI bus handled by the host controller) but not for the
> PCI host controller itself.
> 
> The OF node of the host controller must have the 'device_type' property set
> to "pci".
> 
> I am not so sure that this warning was duplicated when we consider the PCI
> host controller node.
> 
> Can you double check on your side?
> 
> Best regards,
> Hervé


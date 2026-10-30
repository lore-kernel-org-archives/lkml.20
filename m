Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369637;
	b=wjsZKbrth801zmj49sDKj7M/ZQevn+f5yyzzaADH19n6uGrrFuUHnBHO3PstSmH4ZTLx
	 E0nG5NLy2a3mioVXub3AlM43pzA29W3iXoFulL0VuwDZTfqSS166X5nlFVBNej3zcNRk0
	 4IUz7jn5PrIiyy3hABj1Mr4MATBJz46nvrRJFEI19D88vjRYFziKfVur0QkRFrVbbjrXe
	 ErZ5hAapRIzCOSzXxNFatCAgznKe1traj1HGrsOSbaf/54MUOa3ZWJv9KKes8+o2G1miE
	 qTNwbFAGXRWjhxYt45B7xVFUkOVL3SG1ZSg9lf+ptjcC4euF/QPvBR9aMMTmkUl7bgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369637;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8tQsj2DZrJpwTGDEw+GbhQJEYsSO/PoAIUNE/LKFKe0=;
	b=lxqLAInj1kSdwvc5nsdlVHH/x++HXbAL4Y5RpaTExuINphr6rYV5WyX+yQbubr5YR+zo
	 6QG9lXLvunbxOBq4/VAUih+X/rhYtYrrS7fAGGoM1dj/FYfqzSbcguLwopR002ZlR2o1p
	 OLt3Ut/CC99W2Bfk4LA3ndX1YrTXXCjAvjQq4/UfCUPl+I5QVwvMbznJdK89Cde4oUqBB
	 /kD5ubAxGOjJTVB3/Djjgh1z8311Z5Z19aRokUOXkymCgODgM/masO8khfFcYJoOB0Cwz
	 Kan1wziJozfp96YJLQuhUWEBCco0T65ZM8UJRHQ0HHUS92D8rsfuVyNC8kIoVbCMKIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+teH0MB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0709606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+teH0MB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464361F000C1;
	Fri, 30 Oct 2026 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369637;
	bh=8tQsj2DZrJpwTGDEw+GbhQJEYsSO/PoAIUNE/LKFKe0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=J+teH0MBGP4Ozg/6Nd/fclZtqK3zkm7KQLC7da0Tyw1h2FoVlYSaHTKLgk7mj9QZG
	 AGnjp/S6/uCsFnJ+xNQLmg8CxeUynUMia+DVxQ7brD+uStsEhpu5dcad7uQJfkFB/l
	 vWxsgMIDwnVf9/fhc898MpmM2tCFfwlupesw0nvYUHoPw2w4msIn8zIkRma5ayczhN
	 93v2TKeRkJnCs07JATd53NaEg+LDrhJtIrboekPhaHfalcgHuVoM33nYXk4FSgdLbJ
	 kwIF+q+udBWjyn87tGqu92vRUyWlJvsJVBlz0gF1Kk9pQ6kkbNpOxhoTa4BoAueoKy
	 /dvL1DHdyWrTA==
Message-ID: <b0aff6c0-eab8-49c1-a7f6-8f895a075c75@kernel.org>
Date: Fri, 30 Oct 2026 15:13:53 +0100
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
Subject: Re: [PATCH v3] memory: fsl_ifc: Clear global controller pointer on
 probe failure and remove
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Reid Downing <skibletz@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20261025170833.1316443-1-skibletz@gmail.com>
 <987c08da-646d-4d34-82f4-da8c3afaed59@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <987c08da-646d-4d34-82f4-da8c3afaed59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2026 15:10, Krzysztof Kozlowski wrote:
> On 25/10/2026 18:08, Reid Downing wrote:
>> fsl_ifc_ctrl_dev is assigned early in fsl_ifc_ctrl_probe() to a
>> devm-allocated structure. If probe fails afterwards, or when the device
>> is removed, that memory is freed and the registers are unmapped, but the
>> global still points at it. fsl_ifc_find() and fsl_ifc_nand_probe() only
>> check it for NULL, so a later call can dereference freed memory or an
>> unmapped register region.
>>
>> Clear the pointer on the probe error paths and in remove, once the IRQs
>> have been released. The global cannot be published later in probe
>> instead, because ifc_in32()/ifc_out32() and the NAND child probed from
>> of_platform_default_populate() depend on it.
>>
>> Signed-off-by: Reid Downing <skibletz@gmail.com>
>> ---
>> Changes in v3:
>>  - Use my real name in Author and Signed-off-by (earlier versions had a
>>    handle appended).
>>  - Generate the patch with git against drivers/memory/fsl_ifc.c; the
>>    earlier versions used a path that could not be applied. Sorry for the
>>    noise, and for sending two unversioned copies. Those were v1 and v2,
>>    and this v3 supersedes them.
>>  - Change of approach: v1 and v2 delayed publishing fsl_ifc_ctrl_dev until
>>    the end of probe, but ifc_in32()/ifc_out32() and fsl_ifc_nand_probe()
>>    use the global during probe, so that would break the driver. v3 keeps
>>    the early assignment and instead clears the pointer on probe failure
>>    and in remove.
>>  - Dropped the nand_irq guard from the earlier versions; it was unrelated
>>    to this fix.
>>
>> Not compile-tested (no PowerPC build setup); the change is four
>> assignments of NULL.
> 
> Independently I want through Sashiko reports and tried to fix this with
> LLM... and then remembered about your patch. Unfortunately I am not
> taking unbuilt code, especially that build testing it is trivial.
> 
> 
>>
>>  drivers/memory/fsl_ifc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
>> index e89e0c6cc..abacd90d6 100644
>> --- a/drivers/memory/fsl_ifc.c
>> +++ b/drivers/memory/fsl_ifc.c
>> @@ -95,6 +95,8 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
>>  	irq_dispose_mapping(ctrl->nand_irq);
>>  	irq_dispose_mapping(ctrl->irq);
>>  
>> +	/* Children and IRQs are gone; stop lookups before unmapping. */
>> +	fsl_ifc_ctrl_dev = NULL;
>>  	iounmap(ctrl->gregs);
>>  
>>  	dev_set_drvdata(&dev->dev, NULL);
>> @@ -218,6 +220,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>>  	fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);
>>  	if (!fsl_ifc_ctrl_dev->gregs) {
>>  		dev_err(&dev->dev, "failed to get memory region\n");
>> +		fsl_ifc_ctrl_dev = NULL;
> 
> This is supposed to be goto error path.
> 
>>  		return -ENODEV;
>>  	}
>>  
>> @@ -300,6 +303,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>>  	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
>>  err:
>>  	iounmap(fsl_ifc_ctrl_dev->gregs);
>> +	fsl_ifc_ctrl_dev = NULL;
>>  	return ret;
> 
> Please let me know if you intend to send v4 which is going to be at
> least built or I take what LLM produced me.
> 

If v4, then please credit also Sashiko:
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-47538f77-fb50-4a06-b49b-92dbee8b538b

Best regards,
Krzysztof

Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4B3A1A3B;
	Tue, 29 Sep 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667178; cv=pass; b=M2vahc4Go+GTT/sDyhmKZKOUtnR078zntku6UNJwfRWYgMQow0NSl4HTrAcjIveReyvD22ilu0ieS/1zagGXGoppw0MmhxFYvTWlXk17ngkK3kwJyvJIZmsdhXrWUxDAQKUWeMo7K/lmzfVN0M4gYjFYpEntepVht/wDjyli+YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667178; c=relaxed/simple;
	bh=jcEE8SweDaAwUTV27plQbR/XBKf4UiO0KhElNh8rSOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+ViV/T3f2swyxzQ/Fo2i9hu9xkPCqehlkPKhajW8+j05M+bXuX9m9GI8eJdf4XxsbG1SdqFLTlhNf4ZVhoYFqd+8lHlSXPuHiBldhLXiY/4omUR2wED29E6wbL6q5TCrSuWkrwErdHyKFrC7TZt/eBuKyAoba0vg2ChhguBV84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=I4UlrcqX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="I4UlrcqX"
ARC-Seal: i=1; a=rsa-sha256; t=1790667141; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lo0q0GcuKW7LmnzRRytJBj2qcby1rCCGeWvBPzX9eCNGwidytCt3uBJ81RfMBgwkjUv0Ou8P1b6R8VkluY/ZCM+tiPas/Cm76u9lh+gJ9jjNtU1fJAGUtWE4dsSZVuixbq3VpZdq9xIhJ5tJkM6ASWz6UEi1ttL6hGmbYdm8H1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790667141; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hD2niuyZYi4hGUz8wD8CQSqVmQtaAAm56xCDiCG8qiA=; 
	b=T4YgIcP7yYbgOs1EIt5mmPQYY8qP/vVdR0NXxDlVMxOTLA1occnFWx/6Oyz49Ysw22KvDQehwxQKCx3YNYn3lFnaWlPBl5uULVrHgD945nHm2wGcF0ZUvuIjUwxNamClZ/RWUM0ywKjoLsmOYE3v1GnqsKEh0IQbVwANvaGFYE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790667141;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hD2niuyZYi4hGUz8wD8CQSqVmQtaAAm56xCDiCG8qiA=;
	b=I4UlrcqXdx3XBEWklwWNlyHFab9MabsOmeY2n4oePKdbfSoZzYpdpaGdKbJCdIzB
	tT4fPsg6GKDtmM2XNymH0Rjzmxn3Kko4/te7O8lB1izBiceYSdc9Pza8LPiyn72Dcuy
	rT/6wc+oYqqejgsUsPzJqjYw/18891pZBrghtd8k=
Received: by smtp.zohomail.com with SMTPS id 1790667140359748.8800768409743;
	Tue, 29 Sep 2026 00:32:20 -0700 (PDT)
Message-ID: <4ed94c10-edc7-423b-a4db-032af5180f3f@collabora.com>
Date: Tue, 29 Sep 2026 09:32:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove
 nxp,imx8mq-vpu
To: Conor Dooley <conor@kernel.org>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
 <20260928080822.19553-3-benjamin.gaignard@collabora.com>
 <20260928-primal-figurine-2a87db42eab0@spud>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260928-primal-figurine-2a87db42eab0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 28/09/2026 à 18:31, Conor Dooley a écrit :
> On Mon, Sep 28, 2026 at 10:08:21AM +0200, Benjamin Gaignard wrote:
>> nxp,imx8mq-vpu has been tagged has deprecated since a while and
>> driver emitted a warning when this bindings was used.
>> Vendor DT use the following node before they moved to mainline driver:
>> vpu: vpu@38300000 {
>> 	compatible = "nxp,imx8mq-hantro";
>> 	...
>> };
>> but that binding has never be documented.
>> After driver clean up it is time to remove it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> pw-bot: not-applicable
> This is not a tag that you should put in your commits btw, this was me
> telling the dt patchwork that this patch has been handled.

It was the first time I saw this tad and I didn't know what to do of it
but I found it in some other commit messages so I added it.

>
>> ---
>> changes in v5:
>> - add more details in commit message
>> - add Conor Dooley accked-by tag
>>
>>   .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> index 19528262810a..69619d2c86fa 100644
>> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> @@ -14,12 +14,10 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    oneOf:
>> -      - const: nxp,imx8mq-vpu
>> -        deprecated: true
>> -      - const: nxp,imx8mq-vpu-g1
>> -      - const: nxp,imx8mq-vpu-g2
>> -      - const: nxp,imx8mm-vpu-g1
>> +    enum:
>> +      - nxp,imx8mq-vpu-g1
>> +      - nxp,imx8mq-vpu-g2
>> +      - nxp,imx8mm-vpu-g1
>>   
>>     reg:
>>       maxItems: 1
>> -- 
>> 2.53.0
>>

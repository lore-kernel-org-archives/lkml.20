Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2D3B05A7;
	Wed,  7 Oct 2026 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394815; cv=none; b=Y/wHm+9Y72FRHur2eZnWk0CWwZpTyPAIUKZ9pynnUKayNPQnkEjN3C5QfaYpFOJh8FaGbSz4jJnZDtYQr77/L4/6DShM+rFRXAwb7QGykxegZUiy42vq5a/XcjEii7kCMrIAHsuwzN5rcAAvBxor2gN2ctNIPmQEEYp8TkPQdKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394815; c=relaxed/simple;
	bh=Ozw3vU8nclQNCtLT5xSNbSPAR6gSPL4M2sGl/giVXUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf8lyBazU/YbaS6hG+g1yDnGHLiRatpUutu5kcIDItRZDWffWqHtes9lgEuLu4iqzEkB8BZGRmOtC/TlqYJaaMbHd/GbQcwVtGv+RsAogRCKVZCUy6MmevAHNTX+Q2mKmUYJzCI8VSq3sgfZ72GOprnwUbxfZA2+t6nbwjyHnME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Q3FS22Te; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Q3FS22Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791394800; bh=EvxKkeCz4r8K1OufXCLJN0cStPAlgS10ILxM3oLPg8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q3FS22TeTsn6nQhs40C1t/C9WdhRhtwtFB11xlvF18Z/CNkjy9fYoenyNL8phz32A
	 8FXWF8s5UbSqWvl+24mVxDRo4pVndWlq5hhY8p0vj1G2ts5oXAExojJ27uPu9yeMt6
	 9pIbO7IJOY2OP/7tSSioE9/altYqH4+a4OebqlIc=
Received: from [198.18.0.1] ([220.171.158.107])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 923AF8DB; Thu, 08 Oct 2026 01:36:35 +0800
X-QQ-mid: xmsmtpt1791394595t3k5iaf9j
Message-ID: <tencent_67DE4800018C924922E62488AF02AF24E405@qq.com>
X-QQ-XMAILINFO: MSHuecu5THA/PZQZruFFagj5YL2w1LBX6SzgVknt85gnzJKeQQfIA4kfm0Q29W
	 FHE0j0AtcY9h9jrQOpyZp+JcBOYJyqNC1B7dmm0gX6szGuLCCSWNYI51+t4o+TnXp6xi/44R7WQE
	 SFHgWvyRCnelJeHEGwv3JRthuo83pWWBhtVahWYezFpqjQxl0rlkOa9/tc/U28rGjh5spGjr2fae
	 pGAeArZBqzqLp93HO6CRHt9SwgtDt9r1PdPku/td+hqdxFWHQSaTuQ/TqdzUB71fzXa5OU5XDWwI
	 mvmmFBKlqs4IjSU6evGlwE+boI9OEi0QEswDj6LhhoDhszTflpNjDM2OyKubdL6RcFsU+EKxQ3xY
	 jopSr1WC4hgpy33xx/icybqxgzm8V0fJxAZr3tOamZqvJqK1SRL1ITgV+ACGTQS0nbHb9shobb2W
	 tlFjaf2SqApYssTU2xY8w2PTnU4Ynwm3Wy3RhFks1quTRcOIjfaPZTlEnULdCHdMSh6ZQqxBh05D
	 ghPrDixwoSd4DruO4sprShqu+DK5Hp/XTinqibNfxIcg2MBWuQWRFdlC3ill2SzgcTbmtbj25k6T
	 doDuxWBQ48tJK/tjF5myaILtYMuF0eddscjsFCmYrO4xpPhlpsofrBhJihu9LI1V0TStBwoiuVlX
	 4XSS8fh7HcUTYJs56UCNnZ+Z9j7cDZPkbxh29iB4O9UGEXMyGQeYbIH196r4I4B71bAnA5GIuTCr
	 8ei5/QvC4AldG5ibx/XLPK7b+gGkEuTk+HCJrTOYxevJhUa09oOD9RddSW9ThoFZDfrlL82BFVnG
	 62S94e9Ct2lVFvOYP1S3H21Ms9WDpG9IFmPxVTHR9butYyeOGfRXbF7wvU7ZwKgtDRGsT3M61pho
	 uyi32EblD7pMsAoE3hCGjLzFY0waUHUc77XYlYl1ZSM043fDlbSwgJWVbfeq2stxhf2q7aFQWdE9
	 CZ+7EcsGSKnMe3jWXYstgloAfAiH5we75uEE1MIfyOuzmrxP0YIMR2Cwws1OISiZ0jV2IW8Og12c
	 CGE1X6ubLNkREy4zIdrqwF7fCGNqwP+BbLsN0Z5R0bozbuztKJfeYqCw4qZeg=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <8ee39555-cad7-4b01-bb65-7441acb3f282@qq.com>
Date: Thu, 8 Oct 2026 01:36:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
 <20261007-92e855de534df44fbf665e4f@squawk>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <20261007-92e855de534df44fbf665e4f@squawk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026/10/7 18:35, Conor Dooley wrote:
> On Tue, Oct 06, 2026 at 01:33:06AM +0800, Pufan Jin wrote:
>> Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
>> Co., Ltd.).
> Where does this ALINX come from? Website url?
>
>> Signed-off-by: Pufan Jin <2254650260@qq.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ba2002969..97e7ef340 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -90,6 +90,8 @@ patternProperties:
>>       description: AlgolTek, Inc.
>>     "^alientek,.*":
>>       description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
>> +  "^alinx,.*":
>> +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>>     "^allegro,.*":
>>       description: Allegro DVT
>>     "^allegromicro,.*":
>> -- 
>> 2.55.0

Hi Conor,

ALINX is the brand of Xinyi Electronic Technology (Shanghai) Co., Ltd.
(芯驿电子科技（上海）有限公司), https://www.alinx.com/ - an FPGA/SoC
company and official partner of AMD Xilinx, Unisoc and Baidu.

The board is not in the alinx.com shop because ALINX describes EdgeBoard
as a customisation done for Baidu: Baidu owns the EdgeBoard brand and the
sales channel, while ALINX designs and manufactures the hardware. From
ALINX's own product documentation [1]:

"...as a Baidu AI partner, it has customized the Edgeboard series edge
  devices of the domestic AI flying paddle system for Baidu."

The FZ3A hardware manual and the schematics are authored by ALINX - the
manual cover carries the ALINX logo, www.alinx.com and the legal name
above, and every schematic sheet has the same ALINX title block.

Since ALINX is the hardware designer, I used "alinx" as the prefix
instead of "baidu". Happy to switch if you prefer the marketing brand.

[1] 
https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument_EN/00_aboutALINX_EN.html

For v3:
   - Fix the v2 description mistransliteration of the legal name:
       "^alinx,.*":
         description: Xinyi Electronic Technology (Shanghai) Co., Ltd. 
(ALINX)
   - Put the website URL in the commit message.

Thanks for the ack on patch 2/3, I will carry it into v3.

Best regards,
Pufan Jin



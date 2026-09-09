Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBB5540BB;
	Wed,  9 Sep 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957178; cv=none; b=Bgh4lkX5RGoS9jqNaXfIVHRLYg11NxqssjMWUIonjjbldMBa04sLVsM5chJpS4KgRTqcIPBJe6GmutE5c50WZ1L9XKCOXR5Martou1SAcK/cUh8FdC0yddo9oZY+bwqsV9ExfWxc4oebD47t5fbEA/S/K6tmrIrTOOY2Hm6v+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957178; c=relaxed/simple;
	bh=e90jeBaJFtxZSWJZN1IEIDkW2eyHfOI7sEySc9wlHHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlFq3hw1+IPSJUTWO2QbPdLq7hvZFdGMtk8eIY3ivDeHfN4lzvAYkVay7cGAmH1T5TYt5pZDqdlLTRzJ93VKno0tvYB2vRJ/RJ/CEM91tm2vaqEQyf2uMypDt99Ce8XrwxlnyEfHJK3mSVSh2qamzpio7kGnZIMREzP+Q8/tVkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jMPWBiIc; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jMPWBiIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788957118;
	bh=sjk67Ioebab+5NpGEhrLJAO6LV79F9ONQNj/H2RXh7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=jMPWBiIcB4w7JYdCn8dUPaSIn618AveLhhscGmPcNqbByQPxZ+YaLdGAhpHUB/0Dw
	 niF+uyy6uHqTqrCGb1KkKExiLUmlYY8ubiiTV9CUrDr5N+9KJdowDNiw/71n2pBigu
	 5CLd8NHh8/D6XXTqLnHPhzuwqLfqVfbfZgOH5MYI=
X-QQ-mid: zesmtpgz7t1788957111ta125882b
X-QQ-Originating-IP: E9f8bbQMzUxXirUNijXwNOEm6p/ZyvW5uLcJaAfZTxo=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 20:31:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8949304572229022244
EX-QQ-RecipientCnt: 20
Message-ID: <0B02CB706C22EF91+afa052e7-3ecd-455d-b176-b86d3e0a5116@linux.spacemit.com>
Date: Wed, 9 Sep 2026 20:31:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
 <20260908220703-GKD2346@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260908220703-GKD2346@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Nj5kRNzaiqTLQK0CQ2cDYsk7lCWrU6SKlPyOXBQG8iER1oNdhzwFOlwo
	cfCOr5SzQMqllB2BZU/svqc2xCy8K0sEvVCnOYtGOKuDqq834b9SuLu4Lcl9NAFp57VTvgA
	5rlEfBcihzA8j5zt/POSWuBPTiHZlGXbYE/ki6JX9vWS0sJdNrYMEC9/DdhK1FMUjRrvKIn
	daFEpdSs7SBCuTSkBka+qxp9i4prvYessqjd5MUXF+5TC4pBgFDLVr2pCrZee0emo/pcMac
	TfLir2ITi6TtIlK2nqsuWk4Yg2wKGy4W4xmESmykbelebTbE5LScOyX6KAi7RBExFACEoZz
	2TQyXBOsRXnE70rnlhPdZyiUPqqP37CS8KvC0DL0mKMXdV7ncEqIh7qyhlZml8KB+qGtQ7u
	JxC6t8QwkCXervI8faCuLv+k2jktoanDCj3gCvRFDs7whxozpT5TIi8g+KrTCAH3zP9fjAL
	d6ODw58bDQgQdWmOE0cG2bnRhGO9Cy+5y3W0GD0rkD5P1DBgID+pGDSk86jKLCXMxA3lCeP
	s7BkdJevukFD+UZ90Q0Bgju3pAt8Qr9PHE66/9Yyw5VfApXdSL2wSK1Ua9XX4geraYlKZ+v
	mM9AsUDftZFfeUCQzMGNrhZk9P3byI1cTaGCLpTPObQT8tB7khEKZJ4+OIMdkHLKU465NcS
	fzibwZG1XCqeHf+XJx2WAJDO3OOfD6xHIGpnKSTIxdwUy6emyKma/4y/dFCECgOshSMaAnn
	d8MjVrWerPVzIsrJD7FAw12dQxh7Gdr3Byrb0kuGobetw0xujgbVsp+Rxko8BFbmwm7zwM6
	ag06rzWOBayHeeM7+nf8aGtvxcNbH2LnVxGLV1hL+i4QrC2xKWxsHXdXZ/Q9975t/NWi2++
	HVk1MjLzvyafMb9+7KYh04txA1MxWUVUlYL9M9Xw8osuiy0PAl90pZe43wo9oRBHDeqgKdi
	php63nUKrym130QtZIbP7tzYmn3EIZSiPc0k5F1t3PxxE7+A7/rnBg1MRk5DgGxYzDgntuf
	L+vRMYi5yHhUlDmRJtQUmALpn6zNZoEKCCizsouUkEMIp15BgiNcrkipkZoFvgNEuUyCYVk
	NSHmrWVez8N52yDs25UjUBu7cAhOqm+QWF+Ff3z8N8OQu5c4awf2n7BPgYqw7bTx1IeG6xE
	7g3ovkjcj6/DNL4uhKUuuFUl7BOHw3Wu9Cg/
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On 9/9/2026 6:07 AM, Yixun Lan wrote:
> Hi Junzhong,
> 
> On 17:48 Tue 08 Sep     , Junzhong Pan wrote:
>> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
>> USB2.0 controllers on the SpacemiT K1 SoC.
>>
>> Tested-by: Ze Huang <huang.ze@linux.dev>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  arch/riscv/configs/defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 04ae305d5511..5b556488de66 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
>>  CONFIG_USB_CDNS3_STARFIVE=m
>>  CONFIG_USB_MUSB_HDRC=m
>>  CONFIG_USB_MUSB_SUNXI=m
>> +CONFIG_USB_CHIPIDEA=y
>> +CONFIG_USB_CHIPIDEA_UDC=y
>> +CONFIG_USB_CHIPIDEA_HOST=y
> I know some prefer to enable as loadable module for non major drivers
> so, can you check if it works as module? and alter the config
> 

Okay, if it works, I will alter those to =m in v3. Thanks

>>  CONFIG_NOP_USB_XCEIV=m
>>  CONFIG_USB_GADGET=y
>>  CONFIG_USB_CONFIGFS=m
>> @@ -272,6 +275,7 @@ CONFIG_PWM=y
>>  CONFIG_PWM_PXA=m
>>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>>  CONFIG_PHY_SUN4I_USB=m
>> +CONFIG_PHY_SPACEMIT_K1_USB2=y
>>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>>  CONFIG_PHY_STARFIVE_JH7110_USB=m
>>
>> -- 
>> 2.34.1
>>
> 


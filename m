Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5354C33D1;
	Mon,  5 Oct 2026 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215967; cv=none; b=Afy0pmYmBgtHV1cassreMCfkQKA37tKuB7f/qlKLXYbtZ8NiSNE8EhwyF82zbJSHLpbT6lgwzABPniFBQz8cSp/LDrjFVS/mhDePr0SorOizDhTZ0v1spRyIhF8PNQgVZbSNz65EQRWwBX7WrIRfKYPOVnjgy3e4/gqsMewLVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215967; c=relaxed/simple;
	bh=wWUV3emk7ULpEee/9G63NluqNobYqArTy8HB1/MEtJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1moaZv+WtDMk8Snb73pl3IQfA4EPB/WhCDXqFAqA/rFkfFrJAk8XVtUrUAwodKs6I7lcX5JR1S31iHkmvc7rINUJPpEAmLi1r4LuWWLcs1tzIEW/0AYRc71GAGmuQmzwW/Q9w00/hOmxLktT4gKf57rSKBUB+l+L3H16hymb2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=q6YVYBE8; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="q6YVYBE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791215953; bh=wWUV3emk7ULpEee/9G63NluqNobYqArTy8HB1/MEtJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=q6YVYBE88V85PRYuvbIq3neymOFilDrh8cO5qqWizFRHMcK9SRpLyPHt8eRZJni7Y
	 AhKt8fy55tPNH8CsIQjBLqWSSSxlOWUz1zluf+zzrhlW37b1Qt4B/fIXqOR5d3oOCn
	 V0ik3x92lqC62BA97RBRf05IWe3tL4K+cSNtOyvU=
Received: from [198.18.0.1] ([112.43.117.189])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id ECAA2E19; Mon, 05 Oct 2026 23:59:10 +0800
X-QQ-mid: xmsmtpt1791215950tdkxd44af
Message-ID: <tencent_F21509258CF77A024260954C593157414F08@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iQ0lS0hbC/UsLm9tt/MybcZCBA3F8VcY7H+aZeqAd8AROVa4pXO
	 d0pIei1IbKnZP6DIoAZ63YcKKcIIkGQ3lkGuWRWClueza9+PIxnIIKTf8t8nr/fD59D89U+EIBVL
	 pJFEJqG/ddtw5tSjxy2YFSR+z9MfRNKc9ZRI/oUaJVVtgZgVMtgcmxujBACCn8EYlTkhkOy0abr5
	 UIrmORpcPUMjDgrISxSTXiW5LEzQkcaCECIfYULE7jpwPQ9JpmJnpalM9QCqCCgEvpqM+MXLOR9R
	 rieP/2H5nNw/HcFtxJEy8tf99kEmztlQhucqRvsYMdswUg39IwpMehiIqPOj5UsRax51j6bWULQd
	 MfimKaKfYpn6P9dkwjxbcByDoMLz5WUT4SkljPAo4/lpKlU+Rw3BktTsSqhBDHsf8jCztjIrKWAQ
	 XDBmKvZFD2PA64M1mbBuk/kGfHlewP1vX0rf5xKn3oi9VHXm59MUd1DvSgJrOKYRDf96S/BftjSI
	 xBJnmgL1W61ajxRpkwW/FRSpkD1EpgOq6XOIgx9uQLwTL5NnEpv2PmN7mHMZlhN8KDyjwLjioN/M
	 cKqmzeUks5/DOyjXIydFIQc8XU1LjrdqhxZhFerDTBvdj6/xfeCP2EmnPbaGq9TLwKQy+JRS6bDP
	 9uGeerVZETCB01xMQ08u8Vg5lw3fGgFE3pUQ84v8LFXlCPVLrRdlFiLT7uBAST08rJVbbYLoKHwT
	 8gmRwww+uZG7+jl95rniYFUkuf7qerHqPYFLGuiWx+0n2tB2/0zveOW771jTcHcy1MFD/K5dHQSM
	 JNVCpywNHClD+uLOE0pS5cvCEiSHRElx8K2HMhhtkcvVzFW4hXxNzR9TGd5defYSxt3C8dAAeSIs
	 DUmd5qUZr5M4PF+goJFu0Jv9zkfT+17Drz7uukSJJTPfuh3Ht3fLXtutvMBzqjzXtcq1atYFt+wu
	 dbEw1n9AsI99ZeU9EbxG4Kag8ygSlF+NQbK7v21Rt9cC1+0tN+4vI4cR2Bm0zj7qt0n665bJexjb
	 PVd9o2DAmUBQtthosmwrLPWjIwWhwLHgcCd6sQb39CZIa9YZkfnPbX5y913nQ=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <322103a8-cf74-4213-bc95-e65c34366dd1@qq.com>
Date: Mon, 5 Oct 2026 23:59:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: Add EBDEE vendor prefix
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_E21E2A584AF8EE0505C2C0809838621C8209@qq.com>
 <387c02a6-1298-44a7-952e-47d1d8535541@kernel.org>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <387c02a6-1298-44a7-952e-47d1d8535541@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/10/4 05:14, Krzysztof Kozlowski wrote:
> On 03/10/2026 21:46, Pufan Jin wrote:
>> Shanghai Xin'yI Electronics Technology Co., Ltd. (EBDEE) manufactures
>> the EdgeBoard series of embedded compute cards, including Zynq
>> UltraScale+ based designs.
>>
> What does EBDEE mean? What is the company website?
>
> Best regards,
> Krzysztof

Hi Krzysztof,


Thank you for pointing this out. "EBDEE" was an improper local acronym
derived from "EdgeBoard Developer Edition".

The actual commercial brand and manufacturer of the board is ALINX
(Shanghai Xin'yi Electronics Technology Co., Ltd.). The official
company website is:
https://www.alinx.com/

I have dropped the "ebdee" prefix and replaced it with "alinx" in v2
to properly match the manufacturer and board schematics.

Best regards,
Pufan Jin




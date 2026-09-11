Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E873CCFD2;
	Fri, 11 Sep 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120464; cv=none; b=YUI4AJBkveChMEaUjxoOMlNI/GK4ezvmulflgEJG8CJRBFHMniqXaUFZBcZ1P0dtWuEZtfyv9by8iKYa1zHoGflbBQfteC1tp5g8grMuLuBVFYM2zj57NXZ1v4E/bvg9N+iblZnqOJ+HJHT6ltz07rKaSjLouMq2Gy8XvDZ+J98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120464; c=relaxed/simple;
	bh=bM2wHSiiSeFCRKYko1CirAyLyeDa46YTeoLTGWq1y+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OScehgH/VpnWJdBz7Xmtr5jN9VoTzoXtWNbNhUrtz7H6FBtdzrBOQMyRz+t9WHK+t3fMgWxw/z3kn1cmGbduLOlhzWuKRrg+iyugBoHfMG2y9r30jx/7X/9l4WyBWduOTLekbY1ZBZ1j7FpbTWvgbVnF9qklqwKu7AVOvYRUiHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJWSiX6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJWSiX6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F831F000FF;
	Fri, 11 Sep 2026 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120462;
	bh=KGhhtu7tqF7T3iJOmPXuXzr2PA4boW8KCvw3UK1n3+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eJWSiX6+S2qPrvRMUM632hPQcNhKD7uCBbPsLx/GCWrHft23LoVhrNdcjlBjeRGnm
	 2cgxXnMrk2YC8ORAGAUcgO7oVrZTiUqikpZHvbqe/46mYE+ulDCGm3xb8M8r6wxqD4
	 DsepSXNx1a/0oXvrH7shmNEZhuqu8wkHd9wQqzovGlF9bMnTYtVA9EJVRv5GANzy3l
	 +yY27VL0mS9g24n2aisDTmQRwx+SUK3vmfACw7fxE1TkXRKwKOtiTRX/T6R1oz3vJB
	 7dBKTlan/KUoMbx3RkMNpS5fa3a/0ciTWavxT6BDh+zCc+cYeaQOD98ntNd0Vf82cZ
	 Cl3UkfHfsm3AQ==
Message-ID: <1f61bd22-4e1d-44ae-b4d6-9426fb9dfddf@kernel.org>
Date: Fri, 11 Sep 2026 04:54:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
 <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
 <20260911092541.GE722@carbon.k.g>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260911092541.GE722@carbon.k.g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 04:25, Petko Manolov wrote:
> On 26-09-09 08:36:14, Dinh Nguyen wrote:
>>
>> On 9/9/26 06:15, Petko Manolov wrote:
>>>
>>> +				bank-name = "SYNC_I";
>>
>> bank-name? I don't see it documented anywhere.
> 
> These DTs come from u-boot where it is documented.  What would be the correct
> approach: to drop the property or document it?
> 

DTs come from Linux, not the other way around. I don't see "bank-name" 
documented anywhere in the bindings document :
Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

I don't see how the property is getting used in the driver.

Dinh

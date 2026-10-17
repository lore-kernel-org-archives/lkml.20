Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A93C9896;
	Sat, 17 Oct 2026 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261017; cv=none; b=TACn1xveBgT+SBOa+wo9OAgqlqmDLgEhql/9Om7Pja2FQY2BrYRWEJKdg6HkcYs1efaUjGuSngTXQRRoEqMKwhGgGsYyL84sUfXdIDfMVVqchsrDVf3SVIeUn8ShZcP6tc/GRKAN6SqO42X8XCHIF3/NUONnYDgNmHK4+9SdTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261017; c=relaxed/simple;
	bh=BC6COJBLLPRdm3aPF3SVrdiVDoHuNBhfnORCAam0ro0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mVnnRU7uq0E2ap/gdX9ScUx+NBuTGBCX9MclCOigt+9+33z+Ana5IVrCn2euJ0QbwhNXNBzidUWUfnyGpYDnHB5+N0FpTz/l8Ip4w0DQaQk3FoYTIE78rGagrXIKlLnW/Ge55r5jph7m7O/kzsKG39adce0e4QeCf088mke1vmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=5nUle1P8; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="5nUle1P8"
Message-ID: <d8fc8b20-4745-49f7-9519-9b52a9621173@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792261014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4Cf/7e+t31/uvBZmrssJApZ+Bs7m6M0ki7dD67CZDY=;
	b=5nUle1P8gtdcj+UlVidXY7ErSP560QHaiErjMMMPzwrEW9tmUc6RSXdbbG0+13knksnpJC
	wMZnCdInzwBNQwm8PPSMVWNSe0df3IlREnFq10C3Jhqcda1Am/lf3lZU0e7tJDCVDRwXxE
	42cn2xWcTtBBcZ700fGbhre/ho5JXQk=
Date: Sat, 17 Oct 2026 20:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Frieder Hannenheim <git@fhannenheim.net>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
 <20261017-kebab_dts-v3-1-5fc3ca52a383@fhannenheim.net>
 <ced5461d-4c56-4250-9a0c-cafde5d08f12@kernel.org>
Content-Language: de-DE
In-Reply-To: <ced5461d-4c56-4250-9a0c-cafde5d08f12@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.10.26 19:34, Krzysztof Kozlowski wrote:
> On 17/10/2026 17:12, Frieder Hannenheim wrote:
>> Add compatible for OnePlus 8T
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 50cc18a6ec5e..6e3fdce92798 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1070,6 +1070,7 @@ properties:
>>                 - qcom,qrb5165-rb5
>>                 - qcom,sm8250-hdk
>>                 - qcom,sm8250-mtp
>> +              - oneplus,kebab
> 
> 
> o < q, please don't break existing sorting.
> 
> Best regards,
> Krzysztof

Right, q such a weird letter to me that my intuition always sorts it 
wrong. Will fix. Thank you.

Kind regards,
Frieder

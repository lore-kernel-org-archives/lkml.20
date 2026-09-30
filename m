Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B930C35F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757429; cv=none; b=udf67YcSc2EalroCVEgGrvMszuEI/AA5Hvia/oweuzGeVr9j+2C3NbSgwGnENPaujzgb2iRpMr7AIjqZkxXuiJOx6CATrniUuBP/vEFpBNGL6PEoLXLpMezOlKiPoM1rWG82GwqVvbZLVRiKDjYfxuL17LA6VVxMtz7Um44MriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757429; c=relaxed/simple;
	bh=fE4/Z6diw2mD666yQvTPCiO9m4oeqPDJlFa7QQscU44=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=F+Jrmp+zwJwnklKBkoC/SRxBpLHtZ3Ula7r/7Mdjmi4vUWNUhz77018j3acr/0dzxSAHtxVqZgJtprk5vd5S86hHZxKUCwi8Uj1spzJOCgasQiY+VVFp0pMXR6uw9Z+a1WkzcsJSd0lYoSJ/uf3185HKqDzMSl/bPDhdCdLnQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=si3h2+JW; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="si3h2+JW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BnKEmMINakJUiIslUOLnWL5iyTWYr2S1dvrb0I1gM1k=; b=si3h2+JWDFdyNmF7Pbrio794AT
	7LR+THhj9xI7+mQlh6RxYkwFqzE46g8EUvDwJpxxWxwP6ooPEwCkkrZ6SBEAoQ34+B1qXP4cid3QQ
	thXrshc+WRFbjU6hjLPFY0hMqtXWPCu7JSeOrzRPaxmASGftz13iA8tleXkJ4KVpMhT8MPpOmUZ4N
	OComsdx7mymRH5UmRV5EWN0vja/fZyLbPC1EHow1QjONxTd3jRp3z/sIRmJaT/p+TAgnYlyxcVGPv
	NmNJbmYqEZ/rB5raPUVbuLjbTA/NNQk9fM4QLfxZg880GQFIHGXR3WmuE1bds/ldhgKf9MZ0G2yGn
	uovbct6w==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBpoB-006Ykd-VF
	for linux-kernel@vger.kernel.org;
	Wed, 30 Sep 2026 10:37:00 +0200
Message-ID: <4f248225-f188-49ec-af80-5eb6c4c684af@bitvisir.nu>
Date: Wed, 30 Sep 2026 10:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Visir 24dB Filter = No GFX Card Needed (Supporting Fair Pay
 Philosophy Unity and Low Jitter)
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
To: linux-kernel@vger.kernel.org
References: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
 <07b34ea8-6eea-494e-80c0-338ccf9b8bea@bitvisir.nu>
In-Reply-To: <07b34ea8-6eea-494e-80c0-338ccf9b8bea@bitvisir.nu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

6 point anisotropy I think, lod bias in it. Perfect for Retina, 4k w/ 
rYb pixel, 72,7 minimal psychovisual noise refresh rate.

Serenity.

Den 29.09.2026 05:42, skrev Ywe Cærlyn:
> Here is some graphics on that one aswell: https://bitvisir.nu/Visir_3- 
> Bit_D_A.png
> 
> Den 29.09.2026 03:52, skrev Ywe Cærlyn:
>> Visir 24dB -
>> constitutes RMS, Constant-Q, Anisotropic in one filter.
>> 3 poles, 1.3 cut down pr pole
>> last pole negative in sum
>> IIR typically for Constant-Q (minphase analog) FIR other.
>>
>> Used via Cache, should abolish the use of GFX Card, and DSP card.
>>
>> This is part of supporting my work with Fair Pay Philosophy Unity and 
>> Low Jitter, for ITS.
>>
>> Serenity!
>> https://bitvisir.nu/
>>
>>
>>
>>
>>
> 


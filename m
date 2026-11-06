Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949036;
	b=pXpqRGyFahtLCO7tbCTYQJLdwzDblRD6HG0Yc6Aw3WFsu+pIa6o4cbkr12BCJDI7DQt2
	 E3UGUyuM5tXu5dxq8j6em0+4h7ZlKVGzsXAgD03aOxsgS+pmNWoRD9tMHNdQUeOv38Xsz
	 HV+RUXxA0dCEe2kFet44pI7i/NSFLCpEJTEtiCyasAsPfM8cpr3l4YZtmUih8k9IZTdzt
	 UaO7sNqEwcqfX1Z2YxmrhYKRom3BMKuSmkqfXk7HZyW1SB0d/wo9TBMIF2BzSrLexUsO5
	 7dwrlbugv0kzz2z6HGpkAukAf6xpatjY2boXkqrJ8BbZzIkHFbac91QldxYa/yz8APQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949036;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jB1eS3zovx2XZRj7BNck9E/I5e41fmBpX4HYw72ugqk=;
	b=vmn/cm1fRwzTy2aFHO5JmOSmCRT83Dc8ugHBvfhehGDJqEalZ44bF3z/TfBAEMME0KpP
	 NdEMF7ffxGBwdwP+9t3DCTA4vWwZjGr6J4/+v6LqTj6eFo+gBF7lEn8jKmaaJRSK8Ny00
	 utnzwQuJhj8fXCS9HiHvY+PpGlWEXRAfAGdvzFn84jhIiN4VNSpJnRXQBwbESe/kFnP8g
	 ZtdBk65cjLwWZPrvm32xJgiW6k2gXiAiDUZnWs4+elCJsh6iEhtZYmTbd/oid4VNb4a6W
	 jAG+6FYThHVCIImPO/6ouSJJk773liP6rsp3RMXlhBXs+QutuBgKEdtbDnf7HwaV/nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma4sKe9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4A606A32E;
	Fri,  6 Nov 2026 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma4sKe9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8749F1F0089F;
	Fri,  6 Nov 2026 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949035;
	bh=jB1eS3zovx2XZRj7BNck9E/I5e41fmBpX4HYw72ugqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ma4sKe9enyVoF4T4XfLXZJ4y3oiyACF+P+c0oYuavGpLaYuUcDxiuskZyXC5PYV8D
	 H856VAKN/c9YBHEcS3F1xceAVon5zsusq0d+ORSAw/Sxud4jO+4numgWJUrsHfTRzP
	 SGn/bSquwMQz4k0kjS5Xx1BWe5vRLOmQrkPQCNL9+sN/tSh6aJEIOtEnkWONJQW0LX
	 QnyP8Hp1EkoHECqA7XzGIYWCK/FA+ekAZ0d/GJtht0RuqpC77hQxY0rPaQF83Sy3GW
	 vXd3ww7+lJbh02M/4u2nPMa94vXcurVQr28MMh5hdbdTJs1tJW8HGmI5pqU+ZICDti
	 /5jlcrey8IqDw==
Message-ID: <042ae3b4-4f83-43cf-a1d8-a35d3abc9e1d@kernel.org>
Date: Fri, 6 Nov 2026 08:10:31 +0100
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
Subject: Re: [PATCH] EDAC/i3200: drop the PCI device reference on module exit
To: Wentao Liang <vulab@iscas.ac.cn>, Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104033833.1566974-1-vulab@iscas.ac.cn>
 <20261105194529.GAauzc2axWPncLCpVo@fat_crate.local>
 <179393571491.2060286.9429869566285761831@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <179393571491.2060286.9429869566285761831@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 04:28, Wentao Liang wrote:
> Hi Boris,
> 
> Sorry for the late reply, and for the mess it caused.
> 
> Thank you for telling me that the EDAC i3200 driver is orphaned. I will stop
> working on this driver and will not send patches for orphaned EDAC drivers
> again.
> 
> In particular, thank you for pointing out the Assisted-by guidance and the
> problem with my submission process. This is an important lesson for me. I

And 30 minutes later you send the same crap?

https://lore.kernel.org/all/179393727482.2060666.9057920361892304525@iscas.ac.cn/

So how was it an important lesson? What did you learn? You just ignored
everything, just like you did week and weeks ago.

Best regards,
Krzysztof

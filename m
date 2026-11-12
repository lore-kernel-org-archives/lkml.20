Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475498;
	b=JH2Dy4sCSABJeXIZ07Bv/IrhWMQXxo9WqIUK6HCTJS3s1UvcwvWeqCF6QEvl9lcpTGQ7
	 9RDyTUD3md5bQAX60NTCWNTeNkreyXwyh1dcnbYI7kU7jw276X/hloFMsNA5+eG1+dQ6R
	 yI0ck9ccgYv1C4n1KikBowsCe3YRY/KJN39/wOwxpEQywyjTNujzzsdTNQa+klGM6+7S6
	 CE++y0SZpYPBDhNzDnQXnQuvzDHkcdB8ByOO+HFz/SRpMpBOrX+gAP5rMsQVNuFTe4sLg
	 AhHoKmFk4kjPXR/dXrdzsriHn0yk8OWvU21FauPoDEEfT2mmaURWhTh3RTiRV1x47Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475498;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=V5h/o+YkuLK4iXxvtr7C6GMXzNGML0s7RwZ6wKMHwfE=;
	b=zz1gGWd+n6c/RdPDJiLAO1CP9POW905RUbDZ334qriA07HT7N9rEGsuEdqjsc7bHwrqm
	 rWrCWqO3dxZsVQKzhQlw2fk/R84o46F0x+mkpk4YnHzd5aMxspbpXe3D9qBgf2/sykbja
	 VcSPpKnsPqlcwriKD7CkF4vyo6wsjXn0mERD5nz6qs0/ekW+bMRakky0ORtlT3/hlsL5r
	 e9z0hZFd+yFLKhMzibPZApHxWqDCpxZCTG8NBUUq7K3L7QrDamhusQ2mj4uy9ZebdHDac
	 oKCsEqbEzz+TnEJGq2c2ajmFWIKaEk2/vRMf0QDiw3vBykbcxlxhW6tnEexyYjg2DUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFPTePn3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2085606A323;
	Thu, 12 Nov 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFPTePn3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4661F00A05;
	Thu, 12 Nov 2026 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475498;
	bh=V5h/o+YkuLK4iXxvtr7C6GMXzNGML0s7RwZ6wKMHwfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cFPTePn3ImuJT61Jm4SRoBdwzRzEhIgcTQsZ9B9QLIFfH+S23Y7FDnndXEEQf6LyO
	 htbaFRycGL0MSJR76g6Q2WZZlv6EBJ9IhC6InBQHrh2AnXQRC2yBuz8Ge7v5XWP2iK
	 cwK8+nisq6XL5XQx0rPCfGvyXl4IHY+vBSpsCP8vTEmUc4uncFDUY8DjM+ugnMkJuH
	 EQFgO3Aua+c1Ws0SsW2lytch+F3QnWx2e9/z98so7JYy8AOxb3nZOnKnvvIa8+OdK6
	 y3+ZiXdn9sLaz/C8rpp5b36tRBleInnruFDzKxcOwdQSInbKy7upVgI54Trq6awfBz
	 Z/2AzN0fFw4WA==
Message-ID: <912f7250-d1bb-43cd-8efc-9ad7b0c4f1a9@kernel.org>
Date: Thu, 12 Nov 2026 10:24:53 +0100
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
Subject: Re: [PATCH] wifi: rtw88: sdio: check packet length against remaining
 RX data
To: Luka Gejak <luka.gejak@linux.dev>, linux-wireless@vger.kernel.org,
 Noah Weinberger <NoahWeinberger2003@proton.me>,
 "pkshih@realtek.com" <pkshih@realtek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "security@kernel.org" <security@kernel.org>
References: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me>
 <43A4B4D6-EB5F-4079-8BE9-A452DA8B2AB6@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <43A4B4D6-EB5F-4079-8BE9-A452DA8B2AB6@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 02:34, Luka Gejak wrote:
> Hi Noah,
> 
> Thanks for looking into this. A few comments below.
> 
> On November 8, 2026 11:27:09 PM GMT+01:00, Noah Weinberger
> <NoahWeinberger2003@proton.me> wrote:
> 
>> Subject: [PATCH] wifi: rtw88: sdio: check packet length against remaining RX data
> 
> This doesn't apply to rtw-next, which is the tree rtw88 patches should be

This was a report, not a patch whihc can be applied. It's visible by
lack of DCO.



Best regards,
Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407584;
	b=NWSPWlYDs4T2jbsRln7VfM2P+/j0mxf8Hi8HqtdDymvevjyCbjnfqXGZ/tQ5/V0eC59t
	 wmSGuf+G8+WnqobZ0aDhxrQhGwbLNKtx5O3BrdbhLi/Vsq32hmcpn4keQy2scTSiEqOd5
	 3HaEY05QACi04wV00nnF28ObyL8CgqGNV90MKr52zR4MPdd4z6xXlFOXUiQQ/U1Y+53hj
	 MaRWdnY/q4962Y9VgNSvbxU+6ExoYKPtYAYm4TDmo+BWXv+j/GLrdLBz0NtKvkoNg+5DE
	 6e7JoaD6QM2GeDyjygYLsLABoRLaXjHUoQXt56ti9Vz44Qtz5dsCk50RKskVdTDQpDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407584;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:
	 Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q7nTbtg3NOHUNDWE397ThEwNuYuuiTDqnX6yT9Vqs8E=;
	b=YqJT545a4ZsKUrJSqss+j7fUSFpOuRD3+o9TwUljCkN5axe1I/kNRV4syJmjQxUhJRVI
	 AO1Ig33QsHwh33V6TXmvGbwOTmmZJ3ESmgKZgWKDDfHdyurSH3fYbuU1molUqRpdEQj7i
	 5PWMQyczDj/X9/4gmbOkk9fSt4TUbDvANv850VrZBpRV6tm+0Y0Vlxz2qc792a6c5vkgU
	 6wrR3+4h5wmtT2xdnDVt76SCDjd+W2YGv9QiQEuU01DJU/jkkxiM3/V7Jo3vBaWHM/2hY
	 a/MPTKNaQGXfDjAUjTWqzZ2g11GiZoAhoF/1N4TjjmDNaWMBF2Bdt2CNo6gjLHI3xYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=fQ7Jo0y6;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115360A380F;
	Wed, 11 Nov 2026 14:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C115360A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=fQ7Jo0y6
Message-ID: <fb7b4ede-a325-4c5e-a37d-fe3cc7a92f87@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794407575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7nTbtg3NOHUNDWE397ThEwNuYuuiTDqnX6yT9Vqs8E=;
	b=fQ7Jo0y6y1TRDYwtYJgO1STJDXTDFtL/3trxMkZ0Ta6gVXwNHfIfQ/Ezhct73kXpoVFQWr
	4m7n74TvisUz6uatQ6SYNsbV4EeQw0ifL4ObQhnQ/uKYDaJehRR+ahM1hiEeja9VNgFDeS
	MpCJ+MZO13xY97WzfIP+bYOcF/+1tLQ=
Date: Wed, 11 Nov 2026 15:32:51 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 03/15] dt-bindings: nvme: apple: Add apple,t8142-nvme-ans2
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
 <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
 <20261111-comical-quaint-turaco-e8c1c2@quoll>
Content-Language: en-US
From: Yureka <yureka@cyberchaos.dev>
In-Reply-To: <20261111-comical-quaint-turaco-e8c1c2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/26 13:46, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 10:04:12PM +0100, Yureka Lilian wrote:
>> "apple,t8142-nvme-ans2" on the Apple M5 SoC is compatible with
>> "apple,t8132-nvme-ans2" so add its per-SoC compatible.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>>   Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Squash all nvmem patches. Don't add compatibles one by one.
>
> Best regards,
> Krzysztof


Hello Krzysztof,


(replying to all three of your emails here)

thanks for your feedback! I did run `b4 prep --check` and `make 
dtbs_check` before sending and it passed without warnings on all 15 
patches of this series. I will now also run `checkpatch.pl --strict` as 
you suggested.

For v2, I will make one commit per type of dt-binding, so "dt-bindings: 
nvme: apple: Add t6040,t8140,t8142", and then "mailbox: apple,mailbox: 
Add t8132,t6040,t8140,t8142", etc., ok or do you have another suggested 
grouping?

 > Please stop inflating this. You are only making it difficult to 
review your work.

It would be appreciated if you can tell me clearly what is expected, as 
this statement is not actually telling me what is inflated / wrong.

Thank you!


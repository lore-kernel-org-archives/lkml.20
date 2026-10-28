Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171853;
	b=RX9KyiLfQKsT2WO+Ey+qCJUv6HKLXFlPreLH+4fLeUv8NS2HX6arGZT6EcsYlsSQS9PY
	 1WaNGg28oItLTJjP4bnjKMG5PA0vqK1wuW5hDWaZQI/htJyXrMKhwQm4Gb1RRhIG3icVH
	 LHksGNz/rQkD8H2whxbFPOhrRte7JMVN/g72M7QVkEeU/MX2shkvPN/wVuljqnkpgtpMU
	 WV3BEJXNc4qLMFlkTKYbeWQw0LKw4GLwiCCnFQcUjNCkAlwRTS+8FaQYgEAgdXplaHlr5
	 In61uKx5iTGvtuneSsc4O2V/MENynpZMF2EOW9RLSMrSvmeiBmOuCeSkPvNhyfTWsrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171853;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=nquMCr1WWqc3g25x4aH4wcYWjEl8Qlo/bCJtAzPywf0=;
	b=TcX6DvQW5lR8Ld5XLqFbjDq9hAbCqy36VQ7Scle6Cp63Wh8n11+ZeUqdWb5dh5CFkbPU
	 W2kVbFPbN2pPKqSyNYFeBqtn/2Dpj5J/kwX1AzUMhFT3/PewOeFuRMR+4Zrj58g+g/EZ6
	 T96SFBwcCRlzl4RSTP151D/QrolsHNjmzCAbzVuH6LMx62H3D7zfYV4j4cdmfiPYIk8EY
	 i1f5BJz3F7+a9+oUcVv+ZIiO3jJH6XWvTKYm6AZddcdcGV7zVTfaKw7Tng6LZLquY5MB2
	 rtq3r4aX7CADEq8a/cP4wRflmSsYEF+zMQmcEV45J9ZCEnm192XAyDgdEOMm8ER2/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Twv5BmZv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F26606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F26606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Twv5BmZv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8EFAC4FECA;
	Wed, 28 Oct 2026 07:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0F1360769;
	Wed, 28 Oct 2026 07:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B30F11032906B;
	Wed, 28 Oct 2026 08:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793171848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nquMCr1WWqc3g25x4aH4wcYWjEl8Qlo/bCJtAzPywf0=;
	b=Twv5BmZvgqoD/QGqoEOSQhAhVHQ3nPsNe4D6eC3nrSg8jO1LgjrhfYxZ5/l9fAGN42EYsz
	2T3MlCJy66fl0iP/cX42IOrdHihZFjqJ278/1hQLEYMYZkMABQ7TfVcJD/LsIEBE6+qIC2
	tzdPbOQaUKsUrRu/+OI0hE36f2Lrr3AL+XlzUk62oPNJ97HrFHXOV/Q1NrNTWIiUT6GhQ/
	I0WkmbxZG46CK0iB1bGfx53h9kVLTEYMLpBDRa90MYcuv1q81btalbtAboOMmWJAcl1WDW
	24fCmzrQLrK+lLRzh+ZZHMXELGfIKfkDe8Ne7SzvBOfo066t1s9Ogf3E78CTWg==
Message-ID: <b3216356-fab0-42c0-8a5c-552ca4c5d46a@bootlin.com>
Date: Wed, 28 Oct 2026 08:17:22 +0100
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
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs isn't
 supported
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
 <20261023105258.2a6349f9@kernel.org>
 <ce8f0d43-0078-41e7-a5d2-cf31c6dc97fb@bootlin.com>
 <20261027141555.47156425@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261027141555.47156425@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 10/27/26 22:15, Jakub Kicinski wrote:
> On Mon, 26 Oct 2026 10:38:50 +0100 Maxime Chevallier wrote:
>> On 10/23/26 19:52, Jakub Kicinski wrote:
>>> On Wed, 21 Oct 2026 11:08:51 +0200 Maxime Chevallier wrote:  
>>>> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
>>>> which is only available when hugetlbfs is supported. This isn't the
>>>> case on all CPU architectures, for example it isn't supported on ARM
>>>> 32-bits on cores that don't support LPAE.
>>>>
>>>> On these devices, the devmem kselftest doesn't skip gracefully  
>>>
>>> We don't require graceful skipping. If anything IMO hiding the stack
>>> traces isn't great.
>>>
>>> If the check is extraneous and makes us fail some tests which don't
>>> actually require huge pages please make that clear in the commit
>>> message. Otherwise the net benefit of the changes is unclear.  
>>
>> hugetlbfs isn't required for devmem AFAICS, but the blamed commit
>> moved the access to nr_hugepages before the actual "is devmem
>> actually supported" test.
>>
>> I don't expect the full test suite to gracefully run/skip for devmem
>> on these arm32 platforms TBH, it's likely that devmem is only something
>> that's been used on platforms that support hugetlbfs anyways, but
>> strictly speaking both features are unrelated.
> 
> For max clarity I should have simply asked - does it make any test which
> previously failed pass on any of your platforms? (incl. some WIP
> patches that'd add devmem support) That's basically the criteria 
> I think we should use.

I see, then we can drop that patch. It would go from a "file not found"
python exception trace to a skip. This is a nice criteria for me to follow,
I'll move on to other tests :)

Maxime

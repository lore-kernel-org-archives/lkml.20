Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020661;
	b=VrxIsjXZAGJWvOa2gsKTZ2d8uohxjId1WFSTi6YgKBLJXhlmDWMGuLptY8TXlZXxAbom
	 Rh33lUOR1M/keiHa2tsxoWYQn9xMoQmOYBMGBZBgU3U46A2fr/JKjnwVeIGxbtF07rPtd
	 jUnW0UeammoNNI++9M222yDGfY4gZUfFwiW7BXZwdHN5QlYff1VwBL1IihDbSTfX0tL+y
	 59nnT3DDlMkHPgsKgWZxynU2BKUFvhTpPdsetIK8Q5kHXjPJyW/m1k13ZKwPSAWYW9lLi
	 uKOzoZXit1tabhbxdrW5olqE9OR+NWcn+M1HUU8weImckoggXhjkF3+Uznd+kfVtqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020661;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-META:X-MBO-RS-ID;
	bh=qnjBE2z1FbjBW+ryP7DY1DlhDRT6Z5ORG6OVSuUbzOg=;
	b=Ux3N9fBAdlHRD9tC9fXJTZVE31KpdZtHVzscT7sNII/44qxAnVQF6OjyZF1b7T5Om9Gj
	 RJHDB65hh8Z8mlNL2lGSvfUYAwNqnUK7Raft8Qw1b/+6Glq8hUHfbNthTWr5FFi8BulH+
	 E3SMoG8TDdj4EvUpsBm/GJ3+Z1XFDrr8FtV4mW1amMp5TvFGh9cinsmWl9AegXDoinhkE
	 jxOvKPfzAPH5Pt2Rw1dvxvQay8Q+qK/qFSybknY5u3jDX4IhzPSYFXeS0z+Cn1Ewy6oIU
	 GPsDarex5qbLZc74Ijgs6guxzN787CtC058MX7pwIDNlJEaGXLX0fW0D7suM9mkRUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=FLGWP56T;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A647B606A31A;
	Mon, 26 Oct 2026 13:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A647B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=FLGWP56T
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jCvLM1jNBzMlN7;
	Mon, 26 Oct 2026 14:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793020651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnjBE2z1FbjBW+ryP7DY1DlhDRT6Z5ORG6OVSuUbzOg=;
	b=FLGWP56TwhtGnowXm5K9Q0pt0SPR6cqDLc9Q+ohEn7JL7IJX7VhINEspi1cREtkURkNeoT
	srY56kAleizrVrE5qQf6RVkVACmjWxIZVYYe90AxBNUiOGCoVXswzjQvOA5A6QJDkymACe
	sZkZHZKC6BdFcEy34T+8JfA+9/kWpNAN7aDN/bajZIqExcn9FHQ/ZzBMRT5tsSWA7ERyxP
	Tuk8KmwgaUZRrUvFm1KvdrVDH+N1fgTf094fM/2XsZE3fvNWfbxFq5a7NX0tuFmszdAJIH
	79xruJOD/cOt+SLV6nedseN3dsbERz8iAhDKrk49IwvITNKWr33whWCaSQftcQ==
Message-ID: <cda627c0-1b59-4772-937c-e5f8a18db3f6@mailbox.org>
Date: Mon, 26 Oct 2026 14:17:30 +0100
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
Subject: Re: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022082113.3163666-1-den@valinux.co.jp>
 <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
 <yxguu4obyspgkq5f2coa6kjrnxjeij3yduhwd4qd4gpamw25fp@quii5c75uxhn>
 <1d48649e-cf7d-421b-bcd9-3a896064375c@mailbox.org>
 <egu73ymzk7spvoto3tooryzvsbn2pg542o6wpylqtlchjcvv7h@w4jsqg5ynydc>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <egu73ymzk7spvoto3tooryzvsbn2pg542o6wpylqtlchjcvv7h@w4jsqg5ynydc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6wisubc8r6d36ghf5hicfeemrbbe9cid
X-MBO-RS-ID: 2b7fd241c941d265e08

On 10/26/26 7:16 AM, Koichiro Den wrote:

[...]

>> How about adding this here:
>>
>> *
>> * Please follow the standard configfs steps for pci-epf-test documented in
>> * Documentation/PCI/endpoint/pci-test-howto.rst to set the endpoint up.
>>
>> This would steer users toward the documentation. What do you think ?
> 
> Fair enough. While I'd assume anyone enabling EP mode probably already knows
> what they're doing, having a pointer to the doc certainly doesn't hurt any could
> be a nice nudge for users. I have no objections at all.
> 
> I'll send v2 shortly, thank you!
Thank you !

-- 
Best regards,
Marek Vasut

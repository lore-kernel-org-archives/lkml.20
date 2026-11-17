Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907511;
	b=s59oen+weAGreW5b1QUrZdht1VH8d4sdGCDS249Q+DSE9WOy6JrTMlHajS0gYEQSsO3W
	 aY4iP2+Q+ZorLAib1Nu0s+gHkPSmrVht5JW9Mj4RhVikWiE51wiXy0Ze51ALfnvgHK1TT
	 zlcBsSOWD3jOvu/8aXLA84b2y/Vx/71B5EFYpiRh7Zhv9jQBJ3FncMYBqBhtgkFsK3UjH
	 wAhRT8Q1oSkaQUBMBUVJOIQBqqkahp128Vrm3GtshC6ZRK7VzMScu1oVelAvfLD5K/DD/
	 DGrZve3XQDh/l7fJw2SO8ZCFR2L1gp3SA9Q4ANfxJqV9mF2DcKL2Yp7Pdn8nxIKg/UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907511;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=AQTomag+6F3Vz6/FQHnYDkslufog+JMQB+1/JKwI94E=;
	b=pOXKbzwECs+pesgTfOkVPJA0NGSvW1jmpC5/TfVbZ4F9bBDgOlOBhHblWwiRk+FRCj7L
	 DwjtV35CqEOHxfTbEJdsu6a4aWyJ0+N0SKixkv22/nFdbfur0iDbfwltX10zLi7dSjoX+
	 tc7DE9NBRM3uvDjZG/P+JbKin2JYsk0iWpjnZIGgYYJsaxiCzi2fsPxosgJtdd76curnM
	 NE6jnTHZNbyPeox7pwiuInLzIxDVVT4HRzbdDHeH7nMmXqwR5KWIRUVxARiRBExGmGLBr
	 xXaK1r47duR1tFx3/WrNvs16gCa5USfOdDvmD/mLQwb93CknZd4DiKbzE42dvwgxeig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckZqqEd0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6C606A330;
	Tue, 17 Nov 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckZqqEd0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8011F000C8;
	Tue, 17 Nov 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907511;
	bh=AQTomag+6F3Vz6/FQHnYDkslufog+JMQB+1/JKwI94E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ckZqqEd0ofRoX/QDJsjrOA7lpKQ3ajzpxuZOoGfgOSHik2GtslK07Xw06sgql0EaM
	 4Aw70I04L8JuUrR2h6J4VBtpDMrf7F+D1Kl4YMwrYu6y7BTsCTSXYH+RT7buwOvEpC
	 VI2+xcvpNEHo4n5mDWWAVDbTr7LbrPtJ20t6aJQoCBlELFMumw0jHiczL2Pnno4Rwx
	 DQDGJzL7xpCGFQ/onbRu9KShVom7sb4jjfkgX3O87sYlO7Zfb7peU29SnjOW48pMHQ
	 PfnZfHWTOIseQvcvnVcQIOo9eJRtY7xfOYPp51Cimrp8mm/cvMgpVdHLTxNVOIf7vr
	 dNBJsYSOTti4Q==
Message-ID: <415eae61-cb2a-494d-bc7d-47b15e2ad9ac@kernel.org>
Date: Tue, 17 Nov 2026 10:25:06 +0100
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
Subject: Re: linux-next: manual merge of the drivers-memory-fixes tree with
 the origin tree
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <avG9T_NrXRjVDgjh@sirena.co.uk>
 <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2026 10:20, Geert Uytterhoeven wrote:
> Hi Mark,
...

> Thanks for your resolution!
> 
>> --- a/drivers/memory/fsl_ifc.c
>> +++ b/drivers/memory/fsl_ifc.c
>> @@@ -207,15 -210,15 +210,15 @@@ static int fsl_ifc_ctrl_probe(struct pl
>>
>>         dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
>>
>> -       fsl_ifc_ctrl_dev = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
>> -       if (!fsl_ifc_ctrl_dev)
>>  -      ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
>> ++      ctrl = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
> 
> "*fsl_ifc_ctrl_dev" should be replaced by "*ctrl".

Yes, that's preferable and also it is the resolution I sent to soc@

https://lore.kernel.org/soc/de187a23-ab35-4a18-824b-88879f9563ba@kernel.org/T/#m1710794b59ead7fff9293f2c6584af64d0b830dd

Best regards,
Krzysztof

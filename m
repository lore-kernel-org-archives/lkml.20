Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A03A9013
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717214; cv=none; b=rkltVUznBHzuKU3A4k92CkVG3tFf6gf0ds/QmHus3V8yUGKie9MsKUSC3yTR5IWvf03V4yh1yvY0IEGpY8VOvSt//bDMad382sH6Dic1yTXjnj4gETSJKanUQV4tTJPeWkH/gbP96mTC9JCdjh6u3LgJw7txN5iLX7+Mowid3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717214; c=relaxed/simple;
	bh=dD7BCIWnXL4QtFDLN5W4IGPiHM1q7dKjGr7eQsM14a0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tu/zRpfUfGdLmgMLrbhdvGM351GKY8q8fHpoylds7bTmAyOMvMdaIaqAuB1cnytrgTWXKKZQvoU1OQz7XSbyARaz8C39Q6GvSV1aMof/w/2wStx4u2CHJ9lwOpzawWiHhge/GScmn6qbG1Go3cZcJfiFeE5i/FBcoW1HGRIat7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZp4Vaxv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZp4Vaxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BAA1F00898;
	Fri, 18 Sep 2026 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789717195;
	bh=8Sn10nmJm1GQwcBGq1LhK7EFwVivWxb9ejNgFwhmMHo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dZp4VaxvWHQKfepzbajFNtuFNbXMZcB5fzq6bnX1iFe2xA1DStZf0qGdYT1qnrMJ1
	 gGrMI6G+Wj/vD9JaHcJesuO1FQf+LOISM+25Jp2KnZKl0egmbSr4VzTz4fAawzRRma
	 8SdGDQQ9M4KDz44QkGHOUYmVnJaoyc/8oK8uv/+ZDduFO62wX8y4BpTmflEUis69Xk
	 I5FmZLUoPv8VGGgd3RAmiSyP12AD0/toz6TzzD9pc3/ZnNtW8Tsl4GvV9lhzTtv/fF
	 +EBoETTvI5ovQGEXkBlTI8YTD/kpiFAm2wOMFYcyj/DjU98UUxOPOwN8+XtBq6ozs+
	 3QICssqbhHUlQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C22DD198005E;
	Fri, 18 Sep 2026 03:39:52 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 03:39:52 -0400
X-ME-Sender: <xms:xuqsan8o0egf97xE2FN4ZARyYXOBSHBzCgiIV-6RWCNDRNNj2IqTRQ>
    <xme:xuqsaugrE16pQfJqS8xKVszlLP5n57Kk0HgSXhf1AV_YFd0xZ6co9BpG2erDq_wsv
    nkRlq5MtrtEifayim4lj8PA-rMTt81NVA0cMrDRzIlQ2WKlpuDe35Sp8A>
X-ME-Proxy-Cause: dmFkZTGDxPb1ZM2vdJ8lkztEK7VL3PksPWKk9fJrtsV3WLqwxL7HxUje6aE/n8i4S3z84j
    wCvi9t0/YztFbkiI7Ao4NXTBmRiOQWbkTIEMyPYKBJOmkVaNQO+uyAuid+ZV8wUOjnYXKL
    dN0BTrtDfZby7rRBccczLVY3Wuwak2UJiRvxaJs+mVlfEs2KPtOalCEkDp2Olt9hI8BgVH
    aoaovAelnROLbU0jt4IWmojaAJ5+NOUrBULT/s/GlLgpZVakvZjtZV9MU0/ScCvLMfNOWZ
    3tbe1n0+pHzgBBkc6v9R1ruB0cXpfNyiTglSXQmCq4stPcs6U2bQxbvZc/9PMu5WWaCAoi
    DbI4GGpMDxvwCkZYaXWep4nrXzlThNHQ49Vw8Oi3Eut4LPoB8ujt6FOhFcCui6k5gkmJIU
    /s3Log59PMwlSemj2k5jdskUh99lBNO1KGBMYjyzxZYyA46Ifqkf/UWs3EfuCxwkuxLPiQ
    Ol1OyzvSYm+4C++uzzHSkJq6JgF+sKippTaUsyDZG1t/OPhE01YG9X10c/Pj0hqhOmUdp1
    WzhFx6TFuogv1I1vIVNUFT+Yt6XZWMzjXOn3m+FVmxZjipfckLnpvCvdjV18mLimRpZM45
    1mP358psHnBySA2rf0wZbVVgH/7f71M5WPw0GIXU0M71c8408DEQlZ2APdTA
X-ME-Proxy: <xmx:yOqsanjy3rVwQh6Z7PvV7mRLcfwpwN0_YyqVM-n3U1bTBMf9jovMQw>
    <xmx:yOqsajEIzuLKZV2XMeh67pCkmdFm6KuLm6OEKR8yPL0igBNY_MN0YA>
    <xmx:yOqsatRAzktySsTmw0BMRWJM3sXKib-zjxpi2Cdc5_qLVs-ZLAxsVQ>
    <xmx:yOqsagwwaaVwK14ci7QknyUWtHzf7PPlidF-C6Get3odiQJxivN5Qg>
    <xmx:yOqsapfLQso4KLeIs3rLQz0kO4CLqs6kWZ0KLO_JeaFk62F2gzU9ovyC>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AE2B2F80083; Fri, 18 Sep 2026 03:39:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 09:39:30 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Christoph Hellwig" <hch@lst.de>, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>
Message-Id: <9e60a8ef-99aa-49f6-9332-53b70e307b5c@app.fastmail.com>
In-Reply-To: <20260918023054.GB1703@sol>
References: <20260909163319.2116279-4-ardb+git@google.com>
 <20260918023054.GB1703@sol>
Subject: Re: [PATCH 0/2] ARM: Use type override hacks only in NEON code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 18 Sep 2026, at 04:30, Eric Biggers wrote:
> On Wed, Sep 09, 2026 at 06:33:20PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> Now that the RAID-6 code can no longer be built for user space, we can
>> drop the direct dependency on the arm_neon.h system header, and include
>> asm/neon-intrinsics.h instead.
>> 
>> Since asm/neon-intrinsics.h has all the type overrides needed to include
>> arm_neon.h without conflicts in the uintXX_t types, those hacks can be
>> dropped from asm/types.h, and so the file can be dropped entirely.
>> 
>> Cc: Eric Biggers <ebiggers@kernel.org>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> 
>> Ard Biesheuvel (2):
>>   lib/raid6: Switch to Linux's NEON intrinsics header
>>   ARM: Remove hacked-up asm/types.h header
>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
>

Thanks.

I've dropped these into rmk's patch tracker.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C54D7950
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574315; cv=none; b=TYfYr23BgVx3J0G6VFDHpMwx2AJDetPNArqIL+9m+Xq7/9ia8l/Y8Q5yype+sVqlVH6yhvs302FdObwiKna9EMcKg/gnwVZsnS+4CX5+BdOiRryMiW9+Uet7FnlsHNUcAjS4rYRfvOQdkwG1aDHR5XBV1V4mCZ/w2gGY84vfP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574315; c=relaxed/simple;
	bh=sdJEAeBzaRfEfWUUAtrryRTnn1gnVg/ZDP/K3wQYXMY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXpZ1oUsRcoHrJZ6SKBKdK+mboWz+0WUYc1SfXWu3YMpt83PRCbhz9g/1Wrj0GLEzKQw/OaYXZvJkIPIT+U2uTPkkaNz5LWtTP4503lJm69XcawUq1JcjAN84WNxrZtrVBP0hzdr83r8z3BeHHg9oOJXU7ZIhynEg4hcDPYCwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/1zjWZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/1zjWZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2C11F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574302;
	bh=trH5w8lLNIt7kLoZaTQ24CsToSZw3THdJT/eANCqA7g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c/1zjWZeC9reFnd3ZUtDpQDj2fFC/33HNNuZsIDPTb/GeO3DJf380WAwJeaO8wWfM
	 AI8uI7GS7WbdTwgC+x8hHtXFF/aZXgsgFtfX8QWFBVUgrMGPH1jLFHp64RRPc19J9O
	 snHbOU1SVrKclX6ACVD0gcxwioYsmh6isra8oNpXmMPFdBGcacNKM20eRuPTEDL2mQ
	 hMT4KfYXOpxIMZTeiG0IpVMXoEVOned3dnqxB1MC8PUv1E+b5Yf9Fle3EI83aIq3Vv
	 d1gtGCos6vICzVIG89QOAjS0GbqaZhnIJ2hPb0RT/DkxKDzwJ6CfpORfZSIzHFjXvm
	 6f3leKYkm/CGQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso10834151fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:58:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9LvE9o9C2kCxLAQ59pszFlbqeVDA6V6/ZqJxKObK/QVEKkCtYbAOQfNmg6my1ddN2S4n7BKLtMWuc2lY=@vger.kernel.org
X-Gm-Message-State: AFuF++mDOp4H00rsAgDZ+Y/4B2zBYtT20/RU81nioJItaEwHcEKnyiQ3
	03Mgu38W/axfbHN90rUjC2/gQwM1IT1j2N3JloZq8SAHXgpWlPRrYfmg6yjyAUTMU/oI8UwyBu3
	G6dlwzvqY9IHULrfzFNqKf2sP/MoDZm2nn5SZs/7weg==
X-Received: by 2002:a05:651c:198a:b0:3a5:df43:7628 with SMTP id
 38308e7fff4ca-3a5df43797amr11316801fa.0.1789574301154; Wed, 16 Sep 2026
 08:58:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 11:58:18 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 11:58:18 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <00a0910e-0c15-4f5a-add0-3cbc3457972f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
 <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
 <20260910143140.GA5719@quark> <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
 <c08519bb-b912-4d34-a164-5a9d65162716@gmail.com> <CAMRc=Mf6A98R_NxFaBiMp+N8JuzwZsSdfowwe0XvkMsUCZCL5A@mail.gmail.com>
 <00a0910e-0c15-4f5a-add0-3cbc3457972f@gmail.com>
Date: Wed, 16 Sep 2026 11:58:18 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfpvK8ppLLdEMJtTok06xCgjN5oiEJEdo4v+7D9BqpuVg@mail.gmail.com>
X-Gm-Features: AcwNN1XWj9MSlgewr7vj_JaUm-twNGCNpuDVSpmlu-ZMB92Mq8VbxmRPbXGQFjg
Message-ID: <CAMRc=MfpvK8ppLLdEMJtTok06xCgjN5oiEJEdo4v+7D9BqpuVg@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 17:49:33 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
> On 9/15/26 05:46, Bartosz Golaszewski wrote:
>> On Fri, 11 Sep 2026 20:35:58 +0200, Demi Marie Obenour
>> <demiobenour@gmail.com> said:
>>> On 9/11/26 07:14, Bartosz Golaszewski wrote:
>>>> On Thu, 10 Sep 2026 16:31:40 +0200, Eric Biggers <ebiggers@kernel.org> said:
>>>>> On Thu, Sep 10, 2026 at 03:00:50PM +0200, Bartosz Golaszewski wrote:
>>>>>> All self-tests now pass.
>>>>>
>>>>> Have the other bugs that were reported been fixed?  For example:
>>>>> https://lore.kernel.org/linux-crypto/20260723202704.GB110634@quark/
>>>>> https://lore.kernel.org/linux-crypto/20260723183438.GB93534@quark/
>>>>> https://lore.kernel.org/linux-crypto/20260723205342.GC110634@quark/
>>>>>
>>>>
>>>> I will get to these too. For now, the series allows the self-tests to pass,
>>>> I assume it it's enough to not keep the BROKEN label.
>>>
>>> Personally, I think the driver should stay BROKEN until all the
>>> known bugs have been fixed.  The self-tests aren't enough for HW
>>> crypto drivers.
>>>
>>>>>>  	help
>>>>>>  	  This driver supports Qualcomm crypto engine accelerator
>>>>>
>>>>> As this patch would make the kconfig option visible again and would
>>>>> result in everyone running "make oldconfig" being asked about it, it
>>>>
>>>> I don't mind changing the symbol if you prefer it to avoid any accidental
>>>> `make oldconfig` carry-overs.
>>>>
>>>>> needs to be fixed to accurately document why anyone would want to enable
>>>>> this option.  As you've stated, it's actually just for "testing".  The
>>>>> false claim that it's an "accelerator" also needs to go.
>>>>>
>>>>
>>>> "Offloader" for lack of a better word?
>>> Could it be called a "decelerator"?  That would give users an idea
>>> of what to expect from the driver.  Maybe explicitly mention that
>>> you will take at least a 50x performance hit?
>>> --
>>
>> Yeah, very funny. Jokes aside: "Offloader" says what it both *aims* to do and
>> really *does* without claiming it *accelerates* anything.
>
> This wasn't meant as a joke, but I could see how it could be seen as
> one.  Sorry about that.  No offense intended.  "Offloader" also works.
>

No worries, no offense taken. Good thing about drivers is that they don't have
feelings, so you can't hurt them. :) It actually is quite funny, I'll just
allow myself to not use it.

> As an aside, I trust that you are doing the best you can.  Maintaining
> an unpopular driver is not an enviable task.

I'm sure we'll find a compromise that makes nobody happy. ;)

Bart

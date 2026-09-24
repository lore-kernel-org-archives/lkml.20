Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC9936C0D6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240473; cv=none; b=e0/FGmus3BbktEnLeyqIXEeaXN8R/yYADjRkR2V3yV9RsFJ1XYyTcCb8fjjM/Jq9es13PVZmnn5V60v7Ogt/GyAcPWBlyJbwk/ra/uooTA0/9A+iQFn0dJQLeDBaNotYvuwq68fnJJQscUGQmPIOfYcGWpOqufvKMbMsDDMACxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240473; c=relaxed/simple;
	bh=VwobRVpYjANaRMwKe1VS/B+7A4faDHmtP7SCe6Ik4Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXSmrcUhVa1S5Jq2xd/iWVaT34gCI+KjMMDq2ILhzerhjx2OCkEa0zZkXzb37EM3SlhdP0cJQAFzVRbjqdSDJvTKIIR68+0EMWmlnjx7ZmQqTyGe3/jjgPOjlCZYSvzdQEIkc17ZjwkFTOmKzTPjqes5FE79Hv2YoCUyjfXmfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jlMwOUoj; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jlMwOUoj"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so3103903a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790240470; x=1790845270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV2A/h1hdmSjmCuEGrBZoGbpIoorMrIlLJZkmtVMN8E=;
        b=jlMwOUojVDcAAfPez3FOQ/jbGNvuWPUs+W1SJft2w2awaQ2CNY8uLxCjyZMj1rFkBT
         KEk37cB/YHKgE37QYai33SUmCdPEC2HW0oLgtFhEOHMzd8mNJV0gFzcl3BzBE3/cz1Uy
         rffwurd/UnhBQ4EwG8cvuVTJlPxZ6QjK+y8tiSTBQu2EL3n5UP+Ob6voSiTJXI1hIVXn
         1eeRexy7zHnZ5SyJMQ6jPdnGV7/rxwUqCCV2jZ2L51vay5s2U2cJDw/oZMYhCd8KkNSL
         LAWIm7Xba9gAAhpfBUBF+WEoKoa8l1Kso8KX69XL0jxS6Zu6Bpy95Il1lNMbOF6Eot4X
         z+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240470; x=1790845270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV2A/h1hdmSjmCuEGrBZoGbpIoorMrIlLJZkmtVMN8E=;
        b=or+qiz20XnOYyyfo1d2/EeMvB7yQtMEnoy1Z4mJnDeV3Co+jJTGMT+CKASpSY1hZAs
         GIvrIb/SFY0OQTjSETeEntdegGkfz1Ww3FGrxolLLwrtWaV428KuGmoTjr/tE6tGATLG
         kgsmEWd8sunxHJQghKXUdR0RW8ffC70l48NNd/Ex8+KiE2tU5G5bfaIICgvfr2Z7HKFc
         aSv5lsDrhZsh4dMYfzb4nBH85fHQvgySgkPeBMfyQpb3QMoemjzMvoFivTm7g2IW6EX3
         WL1wK8sRvfGc9ExUkuyu9qmC97mp4K2cTjDDc3sn6w43udVmrJPIs0F8FvOJcqWMw0XJ
         E0Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxYkM8vJi8ZQLi8guyhFutMtQ+QHCGnzrVA4CwFoKzkDJvrYF1dS3+DrYlRRzmpDqgDw+SICw0o/KLhW/o=@vger.kernel.org
X-Gm-Message-State: AFuF++mB600p+N5ApcZAQqPmU39mEGvLyhS9NwvuhVZ8Wcz8qmN9Z8Re
	Sw1NKPH8bOidJjYOgOt23zNWlvcBld7XyDdW7HVES2Bym/hyDcdjacU4sAcHr9jyMIw=
X-Gm-Gg: AYBFou01zz1046Lzey83KiR7WgPMiSYhMRGSvDUABbcu1QbinfqO9HVPl5BhtlFchMz
	2qaX6uw6QMPwUxFrZeajdkJtio88fV1zEBqQ7SKILheCaDk4ZyeOitkR1UAHlarKDoMPJ2saP86
	zxcQyjeU52+MJ8Nu37XvyOfRQPOAM34UXpeSJPsGSiz3qwBSwGutE6uK6FT7Xut6wE+GlSIQU23
	bsgrpjK+A4xkoOsnzJV34LRocn3nch/MxmBK4lZI4JJ5KOyAvvtSEpuUsjPq1j+UcB4aeFqRlB8
	jY1CAUgGKp4qiQlZHngzpB3aS2U+YidP/qT6kFlywAkZl8DGXfxDZd3m0txc+LC2Abew1QB9Zq5
	TaYG8PrBiCcl8KJPWIDGsDdKh9vuOz/7u7l39mHdLUk2r4DvDBxqHTscrA4MQAWfFyIuXe7BXLg
	d+BZN8CotweC0lyioGDnIA1ZGBSCJw8eEy15L7T+mJWoDq3NSpxN87/hifAXLiLJgp00r428UZh
	7bbMRUB20xyGrH3j8luVyObvdX6xgoVslq4ND3fs+J8gVzWKGHFck4K
X-Received: by 2002:a17:907:96a2:b0:c29:f5d8:9c7e with SMTP id a640c23a62f3a-c2ac22cb906mr148643166b.45.1790240469960;
        Thu, 24 Sep 2026 02:01:09 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm273374466b.15.2026.09.24.02.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:01:09 -0700 (PDT)
Message-ID: <7827fbba-b8e7-43f9-ae80-caea7f191d2d@fairphone.com>
Date: Thu, 24 Sep 2026 11:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] AW8695 haptic driver.
To: Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <c49fe267-7da4-4b34-8dbd-3536a327423c@packett.cool>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <c49fe267-7da4-4b34-8dbd-3536a327423c@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Val,
On 9/15/26 06:14, Val Packett wrote:
> 
> On 9/14/26 11:37 AM, Griffin Kroah-Hartman wrote:
>> Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
>> Variables dependant on devicetree have been hardcoded, and unnecessary
>> functions have been removed.
>> [..]
> 
> This looks similar to aw86927.c just with a somewhat different register 
> layout, but there's even the same waveform and so on.
> 
> Could it be better / worth it to do everything in one driver (aw86927.c) 
> and only have different register accessors per model but shared "logic" 
> overall? Or would that make testing too annoying?

You're totally right with the similarities, and the original idea was to
add on to the '27s driver, unfortunately the register layouts are too 
different for it to be worth it.

> FWIW I've been trying to bring up aw86224 which has even fewer (but 
> still *some*) differences to aw86927, so I'm potentially interested in 
> having a unified base to add it to (when I figure out why it's stuck in 
> overvoltage protection or whatever it was..)

After a brief glance at the register layout for the aw86224, it totally 
seems compatible with the aw86927, lots of shared registers, so I 
definitely think that your approach is the way to go there.

> Thanks,
> ~val

Good luck with the aw869224!

Best,
Griffin

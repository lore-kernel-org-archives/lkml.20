Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793320113;
	b=wiVHOfqips2cjAXMfEO30VCH6m+xgXjU/AX/MmUO6HuomYIqnmNch3Do6RJLtXqOkOrc
	 ZCLzaER4BdTWOQGwORztMtYxALg84f2MePglvz45cGQVHAvEIE+xHKNwTGNodyzYALPLt
	 vsdD6j+U9AwV11oAXuBl02Xpf5cM3QLj5ejrfHk+4Ef2qXsKUyZuIcz0ZEXo6qzfpd/Pa
	 31xFWzJBG+xFJuoHL3f4Cu7qreNMaaJIy1qprNYtbmMmRH6wEphEy/kzzkK82tHNm/ccI
	 YatM53Djg0yTYr7G9i/k1QcUmXFlNv5aPHZHRjTUEpGYZqAemI8tJtzduRZzaibN6BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wpGAv65gBuWPBCuFkdizu+JJRhLdNC6Zx1Lfa+fJFHE=;
	b=LEG8T+5/jTfRofE7IRrVJAkD5dpRGadHxoxByzcyzSJvY2UQUklYPsLTFonLbeMIT1cW
	 BA4rx/VmKRGLJrvdFom8DV1ykcg/5Cudc5ruTOWMz99LcqH3LBAfAvtnlV2HsSo58T+6l
	 lyoM53WbRQF8+UVGTezSTbI95n/8fOPZro0XcH9gHCoBUcgNVANBVZOzsYuo8PnL2+vjG
	 lHU+GXzUrEHidMcxU20zJMypq/FPEMJ5CiOX7IPe7ZCn1Anth6uFQSg32EFGKP1fbEyFQ
	 lRr+oy+AoRIYC3CLjtYDNUoQkKH1FdOitg4QIGALkbrS0LlekzOZOG+jlKiUwuHIH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr+a7CLo;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C80606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr+a7CLo
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so93456f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320111; x=1793924911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpGAv65gBuWPBCuFkdizu+JJRhLdNC6Zx1Lfa+fJFHE=;
        b=dr+a7CLoWz+kVq4WbPNah6tfR/D2whkiYNfi69dXlaN/mfWhaxYzFJFRtKHB4b299m
         6aRRBge28ZkbfW8WbYfAq6jdnTQzlLHdyIZsqeVm8gXdu2HIpofQPg2zJn5lWeR97FFe
         DxQj8jpgN7scHkVRY2rWnZcZbZKQ8xJjmwz4czQLYyCkKIeteLO416hwQMHHe7vcpwvh
         wFUAcmMxzn1EiVJ9b4uCSt1wpzeDXcq7nZwTysa14ZsJnOlvv1+N529lnkz0IwHzfEXw
         HosGIG5cPkv9fuYAZS7J5ih2IMTslMroyVVWw+lWZJvlSwA4PLT/aU77OT5Wv+PIS9s3
         Vpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320111; x=1793924911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpGAv65gBuWPBCuFkdizu+JJRhLdNC6Zx1Lfa+fJFHE=;
        b=nFS1a2QpWIH1Lp2TS5wC51LN61JgpYqH3gsUVDv9RFZHuywu36xLxM/7qBzlEVrzQ3
         Roa61Fk+3M3MM2/hkV8iLowhfuIrlGgUkHn01pWqZfM0BMUBU0DJwW4Oo5OeID6AHjAI
         4ByB0HPnErZw/c8Q5JXz4bw2Bduz1FhzzbyUogpZPie/3kTlpzLXzs764SfV1+kLeATk
         SBv87rc9oLTH1D7gF+hkAigbQ1scc3CaOEs5JiaTzp9bmi2ZEPjf/iMXQyL6+gb9cPoa
         Ajpg31M/ZkehkhVvjAfGOGf+MNMi7TspuorY7QDUHkhsOBfMkJ8R0Ji2WbWEVujIgGu1
         Infw==
X-Forwarded-Encrypted: i=1; AKwUvBxkqOI6P7Xlvu9ZgwXCiq5OGpB8TNZ6mXgpGtMIjI6/B2b+Wy4K8c8604nkgrtCH15xxCJziI0VTEnZqoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtV7yUvKXy+CJHeYV0H6DdHkKGJeV7YQjt5XthyWYx/JuTq/MN
	qPlcnmVx17HOScDDDskXshagztsvuCHcdmlQ7+Yg8a2HsE2lCxUfrCqi
X-Gm-Gg: AYBFou2ututKOjyujMRwKGh24L57pLYMy5WKf5LcKcB9dq53V9JfTI413zopqSFb1/b
	BRqSlL0zH0RlYLjSTPSj9IK2trzuKKviaef7ffGY5S+ekXSXuNSM6pNmFEPgqAcGHFTATgWTyIr
	TBoaYoRKn6sWFPOvP6CtU1++hJyjxIzJ1TiKVGQUP2fBt9J81yMgTBr3I9eQohtQg1q4LKRrYdq
	o5XRI8Uew2f16OrVIAlnqOtUEcOErQAJBobGVADBxnvLxPvMC0exSnQAozcmzv4lalh0wZWlIqZ
	VBzZd5QEkGDz/k+58QbJ6VvhTIcGW4obZ+Y0lAXtZ62GiRhVDSQAE35ngVXCkStw7EIfHRiz3pu
	QQq8/0KiiwsEzhNgzPqh6P3AGOfARxiZTXFJP7gP6XRESoj4s7xWfW5DRdUleEGOvjFZZBvD+4C
	iNwhTq9QIKb/6e/Y6OniD4PXJlxywymJf1AdDKqHPk0Ny4KJ1KCQqm40uCOyGjKrwyioy4s3Ezt
	/aPZe8M5zZgjDwEyK0eqguYpbOgQDLawBKiljC/X2mnT1jgjw+vNQCON2VkWDfTpab+2WnH1/pY
	R7blKYEEUvPyVL9VB7qsjS1kyvfQI+oF+z3kbBs9
X-Received: by 2002:a05:6000:238a:b0:48e:44d:5a9d with SMTP id ffacd0b85a97d-48e6e4fc4efmr2200732f8f.45.1793320111301;
        Thu, 29 Oct 2026 17:28:31 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm70205f8f.53.2026.10.29.17.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 17:28:30 -0700 (PDT)
Message-ID: <9c36dafb-0299-42b7-8945-080360e7e49b@gmail.com>
Date: Fri, 30 Oct 2026 03:28:28 +0300
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
Subject: Re: [PATCH net-next v2] netdevsim: reject port addition and clean up
 ports after a failed reload
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>,
 syzbot+88435e204734072bf39a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030001444.289973-1-omermetekaya0@gmail.com>
 <CAHS8izOAYwGR_ukmXNq8V-wOVDxGu0TWET1tjGa_nXG99LFUmA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <CAHS8izOAYwGR_ukmXNq8V-wOVDxGu0TWET1tjGa_nXG99LFUmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


> I'm so sorry, I don't think I was clear. Currently net-next is closed.
> I should have said wait until net-next re-opens and THEN send your
> fix:
> 
> https://netdev.bots.linux.dev/net-next.html
> 
> And yes, normally fixes go to net, but the volume of fixes has been so
> large that non-critcal fixes now go to net-next.
> 
> Let me try this:
> 
> pw-bot: defer
> 
> 
Hi Mina,

Apologies for taking up your time; I will resend it after November 9th.

Thanks,
Ömer


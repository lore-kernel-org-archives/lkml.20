Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18C3A8FE6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459118; cv=none; b=P9WISWcSyM3bPTCkuwI32WHFfakHEElvdkfyzHoeSm3don9207aXzqUDDY1sPaVJgsX4k4FHV1K2mDx6IMpG3YUqDc/LRM9adsuxuCj2RpbE6/woC32BYpfWy04JAgNcGHMdTS30uwuyZRP7At0R1a8OcWuUocGlIXuaZk9rj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459118; c=relaxed/simple;
	bh=B+G5v9/IV92utOqgkB3sgmeQ10ysMqsnx9Gk1SVyzUg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jvrPyrJ/Fl5FXxY/F9IGIDo5+cHcOUseTC+2u/XJ/QgZ2qtFLNrOGIYqs3X2c5vc7uWe/8Wp9eOWxK5XWIxJqTvalmfhtVCvoXuidGCd+WQbZV4YrW/iyttRRvcb8qqgE1XQZ+Lvq3PrXOfSK3JYzsC3Vm0JrRuiKp4D4LGf63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlJMooCG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlJMooCG"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so1042674a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459116; x=1790063916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/hqLsyv2hZLpqMPYwbCdDN/2uuNaVnXX2M+2ap9d7M=;
        b=PlJMooCGNx71ugckBpQHHD12Gt/js73EpVUKNyDySzq4/2LEBcoMtCkLedFcaAMOex
         PrCnpSY8GcgQW3av/f9qVMVjVpHaJg5kOlsUICEXATrLLyNGZOIeAPnyGx1PoVHxglah
         FUzOKoQAKlumps5/Z6dt/X9/oSiVoUX89ulmU8fK/l1bRLKl9xap+wfTyJZMQePvsb/X
         aH/w2wW+Fil19PYdqbWqo2xwlIlXjfDpTz4fU69bpQORTjx6u7ytoZZpvPof5XBvrMkI
         2xjFYaV1ZoSGYhTH340Du8Um+5Z530hd/LRqEZLayCwocseklEGxhQAQEzUg1dFNeO+Q
         EKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459116; x=1790063916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/hqLsyv2hZLpqMPYwbCdDN/2uuNaVnXX2M+2ap9d7M=;
        b=UhUqnqYo0rd9LAwOSuJohV8T8Krn5oC10wOpeYBDaxORiO3a5Y9OXaQF6ABhsZzEJh
         K0S3jTV8x9GiRKcvLicjT0FF6uVpBR2jkIMzE1YAsZT4DD3FGd4HgDNqDdY03jAWnioJ
         Gkw69ELOily9cP/Mk41B4J4biRJuU6sBIvWc2Y32C5cjVyNb+nfUAMlw2hg6zxiikFEy
         Ss/T8aEegUT1JFK9QFVPpJsR2L7E2fX+KKWYLmK2F9qZHfMLrJbXKENghq2OQ4hDT4LR
         dR2fUmqbCgSEXcCBagwd+Uih8bNLjJaEm7v+F2b0PWCQ3jdvxSbUZygGk5FSILTgZqkI
         Meqw==
X-Forwarded-Encrypted: i=1; AKwUvByxefWLA4ljmzqaXbc0riaoQBlBlwbWaFLMsPXbogyCkaNsVE2Cu5oCAEonv7luzaHJOWNNI4Xl+IpXbrE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1RHuAQGgb7BR6BLmsUS28ap+6qpJACKjcKzxFZE4mDC2+2Wlm
	y+860WrYLsIaVXzsgZK6aKSYlwouSecw/DhrHuJmnVXujat0MGwJ/Hp1
X-Gm-Gg: AYBFou2unyWLOp3EpIJOiXFKtIZX/6C1bKzm6zyFVAI63zn3GhfGTI4IMaOo9gs3aXV
	MT//aJ8SEWQ68wHXlQ2d5rv4QcpvZxapVYEPMmeAYApWIXYwxa6mAM+bV+5qPKyYYZJ0yO1QVWu
	f3GuMuezEsa0qShvnDe95ixDMjA5DGZDCs4XYoScnzTggYppKQFhRFmM3HLbJz0xEcnhP+ieEcL
	7HMxC4eiAavCnaylIndadhL3/YTKLV8MEAbWwCRYDq3+4Q8/lVfAGmay5CxsCQAabC+PhmMskSb
	Et9j5JDoDCY9HQvmpOChyl6AQpS3wsHRptLNfv96VUdio6eZ5KgkVQ53kKyy0aOZoNE6C/FRJt4
	Tga+aOP4C1izgwMHD6mIZ6G/TaYIfQ0FkXluAQuPyB6+waE/+9k8WdZTL38BGkbmSynTMAkK1AA
	72MSCRn/Ek3la1KWn704y/mBgXVi74WemJ2r1q1Ki8QWMIaaMk2BXPV+rbfCZZbFqxvmU0l0QA7
	SYMIXNhMMg0iaX+h28vJEQVWVq+UGnpKxb46lXZjRzo
X-Received: by 2002:a05:6a20:c99a:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3db4061e365mr14073955637.19.1789459116182;
        Tue, 15 Sep 2026 00:58:36 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm57534999c88.12.2026.09.15.00.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 00:58:35 -0700 (PDT)
Message-ID: <d0ce4c2e-f4a8-4d5b-aefa-dce070d585ec@gmail.com>
Date: Tue, 15 Sep 2026 16:58:34 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
From: Akira Yokosawa <akiyks@gmail.com>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
 <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
Content-Language: en-US
In-Reply-To: <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ouch, obvious typo ...

[...]
> 
> As this is expected to be resolved in Fedora 45, I didn't see much
> point in adding this warning.  I now see Ubuntu 24.04 LTS has the

                                           Ubuntu 26.04 LTS
					   
> problematic pair of Sphinx and docutils ...  So it might be worth
> to have. 

Thanks, Akira


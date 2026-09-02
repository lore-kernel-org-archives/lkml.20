Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27E47277C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351776; cv=none; b=UrcJmVI0cWBMNyCXqhOXgPAtmBo/AYU2y3m8EY1Z4hH0m9ngCzw9jeFcH4OplCtLYECmyfIUYyz+Qprx72I3MUSOydB/VlBoM4gzkA1T+2iUqpWWFdyDV72GWJ79gBH3vfAZY4uMoFe2sh1Hxww8ktqu3HKZGyCcsYdy6VO2Tw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351776; c=relaxed/simple;
	bh=E8gqwSC0CUaQjM0HnP0GL4Pjjj7xxMwg4Q6dB9AQ21I=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r/4+Udup+vOkBxefivn4C6srTWeWx6XQPBrG+mX3NM0syOwVDP//PJ4hTTFb02hpNQcR3ADtuJQCSS89+0EBlfHC9b+D1S9jzZo9Yy/+drM+68u4e+OktrxiV+zTiNbJZ7HddZW2Tdb7zLbYlDGWizfr41Jyof4kFv7QGiUmcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heoXaENZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heoXaENZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2569aa5116so316346766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351772; x=1788956572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHu/6wk7EVyBKthvUsQwwRxIg1oSagtsFckVCW45lBI=;
        b=heoXaENZfs2C44ylkPUcYeyTHHI/Fowmof58ivuA0rhEgZQe+kywhz1yGP6dytxBYI
         iOGxcARVKvVhvYevibciv1BwfnCtvissoG3Qbwqx8+aQCsp1wavherFs2MZsEbXUAugf
         0AFurBfSH5bUJJK5ea3Gl2UZ6m3cr0NrvhM/Tkf1/O+yZQQyYSMrwNV3FUbFcTmanhlP
         VyWArOGmvtqhACRKucX6UW9ezXdTNL9vA+GY5EDUXNvhjI5Ah5IsQOA/jauJipvWcOVH
         odawKEKuH8hwj1a7kf0CxIOl5v8vAZ9tLMSl2gMkD1WTuqLUYtSlAFi59fWya0IUlv9H
         xNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351772; x=1788956572;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mHu/6wk7EVyBKthvUsQwwRxIg1oSagtsFckVCW45lBI=;
        b=k3f0yrjmxO6CWvWzTNkfyT//JpbMKdFBWHTa7mZAnAubjL26vTmyhR6ienuPE3oPke
         2uSwDaOlxdm+Ss3NAtDsBia8OBN/Uvd5XDT33B1mLLcFRG0Lt4vXm1W68SLtyKqCI6Bq
         rau4GT3tDXCJfx/SquG8zOihBnwlX5xJMJ8yAwf+5rU40jkMR2UIDh9q5MKPNc66Qu/T
         k7aPb34WDOUdVZwI1WYQ+MFGlGW6c3cY3jy1FbwQY4xhn9Plqxm2nj/a9dDf8DgB743k
         tWlaE8BFcwcLktcsfHlY7diXC9Kzc70ygdgbMUkgpbri3w2JR/OLbv49WyoWS2hgdldU
         U4Zg==
X-Forwarded-Encrypted: i=1; AKwUvByqjNjiNMDpaehaWwDofFW6iqOzcjA1N8biYIo9HViq+g02cQr9aQD9P1dHTQ6+dMt7452oV8CZlWfjji4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBrk2zpjnqO4FTflEQzmO87qlbGJD9WJy8rRhL5UzxyzLJVVo5
	ixdFhPiHJ58bMCqlVmPj4/+/HIUwqLgkfRdh4yZNjMdBhZBzsWQv79lg
X-Gm-Gg: AYBFou0wroxxvmjwrs6HbZ+ziGg7TQvccSn1BtQRhpouJz9c47yCBAjxqGrKxo8OZYF
	7R8zNatDiiu5MxmONaxIAXcKcb7dZB9PrbHyFGTY+phzNNAxKHBZtgFsUaD7JNFdqxbCGGkaS1F
	I/xm6VNpUGaWebhTOmvZ6qAQHFFsg0F8ntjOSO6pKNshNqR4B24Stt23Skw/tHr7NSxxrqtx9Dc
	1r2IU62WEIEtg3Y8wSxaWFb+Dx6yBseCn0Iy/6kIDsWJAZsBD+uoedPdlL9mrkS980uUVvNBAGC
	kMEFk1vJD2iHpMKAr4907XEmR6gDFIYyMqmoomVsi07UNh6r75Rc6ww4BOClgG+BTDQfe7+29sH
	SxBOYuHE9BNI1LLx/kdHcwxZ2fubiXs41RwCSkdcsZmGsxLxXhmaoBcy8QR9QM5aSg7roagZIZK
	b9ztQnpUbeSJbUZhYYYDQzz+OOj35ayIID0Oj/YqxEEKhqQvt3Y0PJfTGqPaeNp4p7LmmfBOW/J
	bA=
X-Received: by 2002:a17:907:3fa6:b0:c1c:2218:f317 with SMTP id a640c23a62f3a-c25dc9bedbcmr160135966b.2.1788351771898;
        Wed, 02 Sep 2026 05:22:51 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2e5sm122870966b.38.2026.09.02.05.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:22:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bfbcf166-5bf5-4cde-b607-a5a038edfaa9@xen.org>
Date: Wed, 2 Sep 2026 13:22:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] KVM: x86/xen: Rename max_evtchn_port() to
 kvm_max_evtchn_port()
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-4-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Rename in preparation for adding a variant that takes a latched bool
> argument for use in paths that need a consistent snapshot of the
> shinfo mode.
> 
> No functional change.
> 
> Assisted-by: Kiro:claude-opus-4.6-1m
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

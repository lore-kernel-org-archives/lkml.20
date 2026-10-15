Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E83CE0A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075565; cv=none; b=JSlJwo5i9wW7SN/bfivH+QNKU6sl9lt/NRdukwmPdT1LXUc/+CTdlM/abp6FtzBvewMkYA9rcRsB/l5UuwFscB3cVWdzhb6a5YzKcc5QPnpIHvhRdyzUjU5UyBWp11CIfTxnxTVTPoitBeJ3UArLRnXk0G6rYuWi4U5ZsP9NwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075565; c=relaxed/simple;
	bh=n2eKzu35TvaEv8HyPaHxC7x3j0v0d8cIHnv6Jg8auww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID; b=sSuID+eEY/08bgIVN32JceZ1rB+foN3b2N+Wx8Rha3gFA1ZVKM/HRbz8m1IuqWrbRYDFIMmc4UFd6eaiGGC4/FPJ6y7t6ChYtqfv8yFHS6sPd5kXIQFKchAqr89Wxl4gD35c5igxNUgEapkM+mKn5JS889JSfLvovxmd3cdojuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWwnUb4n; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWwnUb4n"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so2267434a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075563; x=1792680363; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n2eKzu35TvaEv8HyPaHxC7x3j0v0d8cIHnv6Jg8auww=;
        b=GWwnUb4nELlnjiGTRz5QedNf3eNo544dN3n6eAKipUZSBgBt4MuYJDZ7TMpkfRz3qM
         lgZEO4Dw6UZ7t41iwDyK/X07Gl/btMbW+Papx7xbLdwPch3Po600mQxw0u6XG10KCNST
         1avWuaFTBR2fPOBO4k+KjESqcxKsowJ4twTsCoUNvrXbgivh3hl75G54xF4glyXlYVBz
         PjbXH03W8Sxi4r/47vslgovgq3VIWnpSnSaBYZ8F3aVChblgckj/bYAVRqGN07XRKp23
         njjsRJnOx0eV+xvLFIq1ha6aunSlHOPr4SrqZjqHPRfkFBudCelNo3XACldGoLtruFBH
         ZM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075563; x=1792680363;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2eKzu35TvaEv8HyPaHxC7x3j0v0d8cIHnv6Jg8auww=;
        b=eF/11wKbBQyszlPPoKZovB7Fqy2nywQUwVTI/xEBmg3UPLbVYWGcoIG3r0XFfs/+E1
         Yjhg+19nXjvElTXaaxL7r326L9KhwDUu9Y3lFK6fJJFUthToEXue7y1nBip+ko5RUdDj
         C7hjD0VXAbOUJKLYrms1nJzQWP3/GCs/mTgZYGd0eEeEu13dqZ+Ph9E2eLRpnlSzh0UU
         9Jt9NPmOI4SqVdk59BP4SdjTzuV2yi9/w6ZRwJr35EDdyflWGLXQ4lwLPnw0wW1cZSLX
         RxqZ0Qfbuv5Hzz9Doz8VxyBmUiu5BLhdMr/6GDbY0+DocCCxjJIQrysPB4qAiayK3qO1
         hVTw==
X-Forwarded-Encrypted: i=1; AKwUvBx8Ppx/2sZeAThFA/YMbsnbs3wIdagowrcmrXE1cD4stsH00wISiRIPBl010G7HMOGIe5vdgnHi7lxwWwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS/e5Ri/qvzOcOaS2mWVOnsbxSI+iCP0vkfIS57Q8YwpQP55FV
	H+KQz6VZ/v0CW4YnM6yqrscMX4xUSXUtfIbjHsM+pToH6b/c9ts3xSDe
X-Gm-Gg: AYBFou3EUXuJK9e3Xkif2j1ak2su0e7DS5nn97No/mDboIsTMv5MiJkqX5EgM6Rv3Gv
	d+sQ2iWADHckocm+9h8p41FDT4uLDGhIvC8p3UNWIqB+R1HDN/n3BKqHOAFaJtKr7Fbx13a9J2v
	Wy2zpyu12S8VCgrqdhYSAAdlfb+BVrc/L2OYAo+ZpFpoBaEA3JhRhm2wut+K752ErEFAcn/QJ/8
	1pLboH6B3j7OK1h+aEDbSv0Kl8P4xHDpvaSzoAypdweH12qETrOlDWbqe9f8NeAzQMWS5lDdQsD
	VPVyigvCJXekXl8iAAohcO5pI0a7A3+KO3iXxP1Y722JoaZ5fY7OgvA28jWIrB7JbMRKipCD5Gw
	EvrH7uVeYwjH/xSsqVA476yeWOWQn41u8OtNi6p1sB2RQt+jFSfR4pywC7mVfArNiFRFRnqEvhD
	p6Wn/RQaTDFA9U6Q81C63mGQ4CiRBYnscUGisHx51Ux55xglnea0GfE0slDtnisWYomptkAmctP
	XmOR4ioWQUOus5e
X-Received: by 2002:a17:90b:35cc:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3ab3afce21emr16003498a91.53.1792075563236;
        Thu, 15 Oct 2026 07:46:03 -0700 (PDT)
Received: from [10.131.15.42] ([115.200.102.144])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cdffa5sm1393286a12.29.2026.10.15.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:02 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] DAMON_STAT: idle percentiles out of order on 32-bit
In-Reply-To: <20261015141319.88393-1-sj@kernel.org>
References:
 <CANOyQmHad1vamnZT12M5yPrJ69==Pt1U0+MGw6u0MuNtr-DRCw@mail.gmail.com>
 <20261015141319.88393-1-sj@kernel.org>
Date: Thu, 15 Oct 2026 22:45:01 +0800
Message-ID: <179207550140.2.6042983090152523193@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi SJ,

I haven't seen this affect a real workload. I found it while testing
DAMON_STAT on 32-bit.

The upper percentiles can stay at zero or keep old values. If someone
uses them to judge how much memory is cold or to choose a reclaim
threshold, they could get the wrong picture.

I'll send the fix and test results in a separate mail.

Thanks,
Aveline Noir

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.192
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089292;
	b=Zbq5jB9nCz3QrEtccSLsaBeb/Bwbo1axIuVnZeaFPjhispRUFSvkDNp16qSj8DRa2rD6
	 +7++5evHXkvgDt0vjbFGkhf/GBSS84PBU/d0mbOFasRqTmCti7Hp1mWfTXxj1+vnTYF4c
	 FTtRL4l/ght/KFXWRGIAuQIs8ryz9bMa6ZtwZE/TP+pBKsdMeN01bM0s8gOXXmG/tmA2c
	 W3PNqLTvSyxjiH6Ci0fyalNb3C6x4ASNTqWqg/42YTkBH545qf5JW9Q3U1Th/88eBN9zD
	 qxUWb65P0JkmPRY7bFsF12Wiac8DL9XVKRMt+fxd6ZEwWCVGICX+IKohflnZxeoenxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9mn94YuDHCKNZzi8cPTFAQu9swr+S5PrYRBsfhBVEmA=;
	b=l6veeNkQcHb46bUNy+q+jUYkY15HVT+HYSZKNQ4IFqxbr6nQu7bdRsTn+UQUY5n3RckA
	 yFE7mB0Com8+lxfd5OkqtNuMRcRuvC8IZ9ZtkxnCNtZ6YMcYBWumL3K3NF0Xn4UFEJQVU
	 SXRyQYCHVYLontIcf6BXpchv45hgSkeB9Zs9OYBns7dugfKsd6TVdVa5jcpEMnjxKnR91
	 kjKRMYpTsTtqq1CupjQbFoA4GCoVN1iFgxQLElybHfndi6Id37pI7aQuzeN3qDW8JJ8LT
	 IyMklup8qVASt1gLJh8GsCMqA3gwJ8KzQFG8+Sp/RSVWyqcwiQdVjADfOX/hoszqR9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrJzxOmC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.192
Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A89606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A89606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrJzxOmC
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-533fe730856so1739196b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793089291; cv=none;
        d=google.com; s=arc-20260327;
        b=prG3iH4U8TynCSArE5FPoVIETI7sKehccyF02PTIDKlp4GFE4c6KyNpg9C4PiIZSXt
         ZO4JOKBHX6pZmABFg0DWsE1r+63zaj2xPcgtaHBMGyj1ibieWRGv6p5egHNUf6P8mxy5
         eO60iVVTziGeKsKl9sxV4HX2cc+YwZg/O/2XlRqtBSJBDb4UYaxVcuKEXTcnUAQJfxRD
         WqmfQy0PfCTTrWt3cTnDw/3wtFZz7tLUtqZu6F370eRUydIr6oAMC9JaFJq4cwab2fgQ
         eGTi9Ka0Q7IaHbhBaGye0nl7cD8HjTELIpf+B7Ojp1CYJFZXcbTVLmlUO83rMdG5o19t
         Y89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9mn94YuDHCKNZzi8cPTFAQu9swr+S5PrYRBsfhBVEmA=;
        fh=7wRj1ke92+Ezb3RAvOWw9mTC2n8u55mkSNrLuMhxwIU=;
        b=GJygolHw0DpBSkIwqiJeWis74igVCHTXaOiHNmKHu9uguKal7RlW/ljjoNhU3uuD0B
         eFf4dVI3y9Th2ZvUoN4yRXV9GjI2LY99jgFOfeAAwqzOtmQ/5pjPhYabZ/ntN451h2ln
         1gV3cj0NHZWbtpWl6lZaqUa4MLwK3DT4lS6326N5zyLy3FFfYHDvaZ6duEm2S02+mZM4
         qKfa8pbkfA3Loq5i2mdaW3YducZvgbJS3yeyp5JqMPQB0GYf+OBpR0kPTBO0+Qj2BcCb
         XyH/sioO/l9RmOHcUCoEDF2Y5vBzqAywrCZgJPCK1VOFae8jUOE42+dOm3tIUREJTafV
         5ITA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089291; x=1793694091; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mn94YuDHCKNZzi8cPTFAQu9swr+S5PrYRBsfhBVEmA=;
        b=JrJzxOmCl/3md7/9Fi86tAUmHB4RjLyVlcTp7r1WUV1Es7K6QmrtvV+LVRO/jRwUKU
         Du5QtEPYCrYPasuy58hmeSEBeVHBq4+N3JxHfmAC/Ba7MtDeveZmmmyESrELyXeF+51g
         /LyjaXbvOpzBqoaiHABQwUCSmwQA/GcEiCc/PnBxy7xeSTDy3CJUkHewdZjOubSQP3Dd
         M3Vo3r78VYIrYMZJicXHVHqZDbcOJWehlyjhjtgAdi2Q1ZuLfp4GNwzcQQz4tpGAMSzO
         73AodoElXKdQ76NkpHuJYzmdN3y5YQ5abefMX9Wlo5DKQuiXCIcL7P636/qs0DDBpARG
         OPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089291; x=1793694091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9mn94YuDHCKNZzi8cPTFAQu9swr+S5PrYRBsfhBVEmA=;
        b=feNh24LTf+4ZoqlgUavpT84TYQiNLvsVgtGoJ0t8qIXtp4YOnbqWFBTZSTZX2RhKmy
         nR2LFst7wnAnnioexJpfZyqpZB1eKSFwi9/8xCLOWJeS3b/jISn9Elg28iviwwcFeT+l
         +wD3yrNtQE58rveKR2fMdNe7wwqq4LyTdSkXEbYtAea9prkRSmy+zU3ZNxcXdRRUSi/v
         tazeyY2AAz+Rel5RRSBjjKL2AEjAzriHVZU009dTr7hTIilOiNvoaRLJImbFJ1W6aju/
         ULDCrhJ8lNFx/UDGMQLq/CzxuQ8r9I2iwtqY72n63Ey2kLSBOZaUdCS0VQJANJzAXvGj
         CNUw==
X-Forwarded-Encrypted: i=1; AKwUvBzHc86yviR8PYgv81S+3HAV4G9uvDqHCIRfCWiFSchr0hHPElrXtdRME36QA7KHitNYjNbYcPWPGJP3GIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1f4hSXunes4m5McwfI/gTDpv8HvFG4MTFCj6xSLzJ5/Cd/zHN
	sJlh7HkdX7ra7FSQQJn0UDQI/0taibIxyC16e6mU1YcGR94nw7QWchnhPCnTn19vWHpLKJ9DgVV
	cIgCjoiguTVRGiS0kDsoCqEfABCVPcXE=
X-Gm-Gg: AYBFou0qVyhURcPPmQIWVaj0cdrN5LFYiYXNOgDk8VFlr1Tz/6a/42B8kKU6L8Enc/f
	tyst2M++wfiRgqrHxQkhiUlXe0cTM1Glwm7nL4zSiU/jh2CaJ0oBPFd+IYFE1JmhNq5O+cZI8EK
	JGgykjGQHnA+TrOSfjigsl98BFIzRtJDok8sfcseY/V74cja9xrFF+BGPVHCjQ8RnHT1oUqTcx6
	i/U2HnKO6/cwDuQBi36W7SNVeK8IbFH0BNzMAuX8ZELTceIpZnGVaAmQDNtwYh0B75ATaBVqhYZ
	tqFbV/U3T9sG5m9Il1/yP2G/tklaryJXTYBi8NZCYz89aP7EMOku0CZX5sqBVSATmr4c87YEjfg
	kOkRl7mejzrpwVz2oWScIkuG+9rLZtzmumA+b8pIpiSEdi7gaTvvdRH5slT9PxofwQXXDv/eRd2
	Wv034JZj7CaY+5llcw
X-Received: by 2002:a05:6808:198d:b0:4f3:68d6:f0dd with SMTP id
 5614622812f47-55c002f88b2mr7047283b6e.38.1793089291107; Tue, 27 Oct 2026
 01:21:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027054304.35543-1-dennylin0707@gmail.com> <2026102711-venture-amicably-24c7@gregkh>
In-Reply-To: <2026102711-venture-amicably-24c7@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 27 Oct 2026 01:21:20 -0700
X-Gm-Features: AclHuK8mKEFqNZ6r-25CgQcNCoeN3KIl4Rlv2fmwKxPrps12_lcpFHKvKnkhJ5Y
Message-ID: <CAGEkeHePGOKXsHg-bqkJH4Dpn=OSxTQx8z5vbjW18uSWHqrpWA@mail.gmail.com>
Subject: Re: [PATCH] tty: discard flip-buffer input for TCSAFLUSH
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What commit id does this fix?  How was this tested?

The missing flip-buffer flush is already present in 1da177e4c3f4
(initial Git import). I could not identify its original introducing
commit.

Tested on ARM64 QEMU: an 8192-byte PTY write leaves 4097 stale bytes after
TCSAFLUSH before the fix, and none afterwards. Built the ARM64 Image and
32-bit x86 tty_ioctl.o with GCC 13.3.0, W=1.

I'll send v2 addressing the unthrottle issue.

Thanks,
Hungyu

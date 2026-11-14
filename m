Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794656499;
	b=hlX+6JbKjW+LFVToz2daxy7k3Hk3dTsjP6alr+oS+UIR6m8x4IQfMNe9QaVIbeKqdfqU
	 Udc3hymOOmxwCYnDHiS6uHri9y1LkJmn7mWAJt9uHaTalXKVpENQWzd48w9pCGPo3Pxb6
	 ivu6fXEtwgaZDwrrhRqVvi4W/IM0baWKeCAHWsS+lkRwhXuxQpEzJqbtdVK/3DVs9vvUS
	 55wNLEOZBho7iFaC9O+KaCmM+DntiQF6vvAYK2TsQbc0buW5SCAG3x8oyJcQYFCDKPkqb
	 yq2Hn1b5kv3VwpBaPMV/axEjlrLSUTbyyALLgg3Ecy72Np+mfH3CU1vIE24XICCqyqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
	b=IvGFii1nqNCranPYktnf/s3BxSZvAx1rYtSp6uVglnk2umZ2LdxQKEW6mVPARlQ3ZYFK
	 1TKy2oqieU7ZFA8jDny9rgd55VHHy3XzGOfnXDhz7suvYO644AABsOGNWhhwg2OOCp0gV
	 p8/2ONTFzp2dwMs0uMnzy595S5oeauCEzrsU/O+CRSQnmkSuV/Oma/drpx6yXPOpo/EzW
	 +egcM9mTtS0jGhQLtZsoilB589NClF/BEa8LLzWh45keKn/JlY0/4j9DYVO1AKJZY7eMX
	 AH0aMNLgYeT82Elt+77QCV1REVlaVFXi+tnTyE3mUZrEx6l+mLd4d+D9S0JEctLh7Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=RPk3hKmo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB880606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB880606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=RPk3hKmo
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad881b6517so1963812fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794656497; cv=none;
        d=google.com; s=arc-20260327;
        b=qv/GyO626qPEucqtj//EStyR6vN+1BQ/A1wwFNszdDJB8uCLeGX75cyUXLlOLlV/5R
         bbP7wyTDjt+/3c6yo0wM0dH/ZQuHY5TYNa01i5wCPJYD6kstLAAfX2BwT6ighMDv+tc7
         Q1hGEfyoUh5H4iBDyLSLtPxADPJ9ZwZvd5zAi5RETiqL6zH9cdDDBX10cI7DTS9x3rOs
         N3+a6HxRAaTZ7aZYTO+bU0lqiqlg9TQ4wJtxtgJm3KTToU3nI8E4xtlzLjiHebyos2O3
         +fc9QfkPYAKfRgkeNhweoK0mY52AJHz0QULZK7GBNZ0BoEvMWYmMuOgWFU6obij0zqj0
         xv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        fh=PSTQb4+4xKdIBvgNmJp8y33CnkXqzFfMDd8QI/WXBPc=;
        b=mAo/cLqiBvaJ/oEsug20py2aM2AsMcPLclTZwzoJ1TBTPgPrDdkh+tYQ5NjBL4P2PI
         ekS40Z2U+F0hQ8Xc1UWKF10fjEXd2ELcmTfcVVywARueYzq4wGl+9aVavq/AYY846zEZ
         GFOSny30P4/SQIqhbhwttGtEGsYk/tDdsZpzamlHNCm19tAX9mgHcsSvXFStE03KlBTF
         858NkOLyM5C0Z/svFJO9M6Sgh0mN8irPTpSn/Iy0emhh4/gQjUrRe/p+YiuCq9Mn+cxH
         j/nsRue15NKyPdh7Y7cHrizQg/mjh/k17fkua1kqyIsnIp986TVeUIXAc47/Q9XnMxH1
         gz3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1794656497; x=1795261297; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        b=RPk3hKmoRJZOE/rLguqoyJOuGcI+0otfDHj0jb7OOJz8CKu6MRyvtZeUpLpVzvBaZK
         47pyhTHWDFQ1P1XlcTeOxUOIfzbX2jWaZLZ19EPmx3ZGxxskuCiRMvdrV/lQQwwSZVrR
         vW6pLdI9B6VSHdpmLs62jQCunpKHDRtp59ImFhyuB87W2d44eiehj8/z2l7f97f2Igdc
         vkF+ZBAmiXjyGePpmcbFQzoAdE3F7Fc87C3LuSRARiEaD8XBKhy+IHwAFaMAwI1EZdID
         nb8O+iCxZ7Sgj1igdgLaM8WLEr+AKf92TY8ExRgrig4CzkQNfiiblHSNsoQO/MmO6pKj
         t5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656497; x=1795261297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        b=F4QaFQMBoiTuDYRIk7XUcT45UScKhWxaZsbTmuQVadPR9mDfS4OgAP23xF9jJK9Rdt
         nt43ISqQWeDYck5Lbm1icTtfRputXZHrPr6MpOJTrzNmeW9bBAQF4khtj8Hf9ZcTwPzi
         5oqyoU53e10LdQryYIICVVp9yTS1F5dqLfTo7oqU5zGuyJ2gVwj4nouARaMNafPh+8NC
         MbmsR6ub479bXGqTGOVIYWPqwOLBRd7gaUWwmWxyBfpLlEeeHqgCcrBVXQVvz5sT0cE5
         f2OXNwiWt1Vrp4nhpzz+cD14RmS3T4SZXqwJCCusSvSkqfueQFpSklH8iqNaZbV77kBP
         R8wA==
X-Gm-Message-State: APuU4Z9X+GlI+deXuNjCHAC3gVnRBIltuiqs722yRovwvoz6LeUtyvnx
	/FlQnf9xmzUbqysilmxiRedKezLQdrd3SNSNgQq3NVUGIBB07tgeMWINLL52wCuKg2IHbBlN4RI
	e+1Snu3cExhSNciVXS+V5+7dBsXKNEsEbWdyXLnY78w==
X-Gm-Gg: AYBFou3gWnIZE38Es6G7C/MZZVfTXrI7UKYnErsYsT2cffPCa6HJv9GxCrVKr9YPpDX
	a1LcSzbyuR/5CFN+besoKY/M3pJM9Yae6QnTf+qUyKfI3P2Pq+vUz6+lTeifDpLw8wQ2sQtbiC6
	iSFXLloqjdzv53OCuOmEYwe4yQfhdukM0DqmuLIskgM1hjGNuAJkilb6DIDrA+ei5Qx4Q+Z/pjM
	8ebScwnnYTjYMEGVsV80+1lSJ13W2D/czV0CMb6pYC4Eho8sKIU4foRznmda9nqZdeyKpeh2v/X
	BhRTUHZkzjlGuOR4D+vcga+ppGQGZK0ZH7HT3/yzY2a0sUVzEx6KvtaNMLYLaZAQHJJZFWU/I3J
	rXSzop41T2V+0amLC4fiXOU/i0Hl4cGqCyINqjkriwwo4R/69HDXYr/J03bTH8c//0M/EFWEsTB
	p2qwa7nruorxPz6eNhDfHDgSYl7j4EKtZnuywCo4zlUNY/q/Ib+EXdmlpctYuMWRPLwLMBEN4o
X-Received: by 2002:a05:6870:6c1c:b0:4ad:7ef2:6005 with SMTP id
 586e51a60fabf-4afdf445b53mr4823353fac.11.1794656497656; Sat, 14 Nov 2026
 03:41:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
 <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com> <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
In-Reply-To: <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Sat, 14 Nov 2026 11:41:26 +0000
X-Gm-Features: AclHuK8iaDFWSE6FVS5GEQtiGzXP5xPODgzuL6kYZ3-GR4mSvXxwjBpv9blLgS0
Message-ID: <CAKV3HMMfx4APmardWdtL8yhirXMuuBQMZ8xrtowHNRnTKXNRiw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"Miao, Jun" <jun.miao@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "djbw@kernel.org" <djbw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2026-11-13 at 17:33 +0000, Edgecombe, Rick P wrote:
> We do expect quote execution time to change, so this may not be optimal long
> term. The exponential backoff could limit it to 2x the real quote time. For a
> long quote this could be pretty long.

The backoff is capped at 100 ms. The 2x bound only applies while the
sleep is still doubling, which is roughly the first 130 ms. Any Quote
that takes longer is seen at most 100 ms after it completes, whatever
its duration. A 10 s Quote returns by 10.1 s. The current code adds up
to 1 s.

> I'd almost wonder if the guest would normally be happy to spend more cycles on
> getting a faster quote.

I think so too. The cap is a single constant. I can lower it (10 ms
would mean 100 wakeups per second, and only while a Quote is in flight)
or replace the backoff with a short fixed interval. Tell me which you
prefer and I will do that in v4.

> Can you explain more about the quote use case you are targeting?

Attested TLS. Right after each TLS handshake the server in the TD sends
a fresh Quote. Its REPORTDATA is the hash of the TLS public key plus
keying material exported from that session (RFC 5705). That binds the
Quote to the session, so it cannot be cached or reused, and every new
connection costs one GetQuote. Requests are serialized by quote_lock, so
today a TD accepts about one connection per second, and ten clients
connecting at once wait up to ten seconds. With a local QGS the Quote
itself takes a few milliseconds. With patch 2 the same ten connections
take about 0.1 s.

Session binding is also the fix for the recent relay attacks on attested
TLS, so one Quote per connection is becoming the norm.

For the long term I have event notify working on top of this series. The
driver uses the interrupt when GetTdVmCallInfo reports it and keeps the
polling as the fallback. Over 120 back-to-back Quotes at HZ=250 it gives
2 ms median, against 8 ms with polling alone. I can post it as a
follow-up once we agree on the polling side.

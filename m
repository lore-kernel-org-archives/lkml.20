Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933035;
	b=cTPRBJz67Hj1q2mVqGSur8HPqIu8eyRxA41ttZRlVyJBHZ2VBj34Ew/pC0XxqUI0T3Y8
	 eXMtKNA4+p1gzoN1jPsZvPm4VmceL40MwXENzpe9dSOSX8lIRhcL6APaI5eYLFw0ClD+K
	 aLVd8P1zFhXgIL/LCzEoixj3sxDp1nNg1a7XLRTIjTbaPSTS+kX3PPx6aM9qgVsPBZz7i
	 /pjP1lJ+7eWtYjENjOZ4KCULdiZRmlC/Q+rMlYKFouasacdb+jvj/JZvaRe58DGSRraor
	 0pBheCwGCos0oPW1SpYI2hpx5PYUWlfGBDQW4xzq87Gn5wvcTckoMM7pknEs95zABGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933035;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=0KsZZeuWejXlNgYzmW+Tj55tjatS1lgkuV7iOh3F+A3OReSmDL3KuI0mKvvaMP+tHbK6
	 S987IuhQe2wT6LCBWA0fwviYQiRgrbJnICCHffVwvFZo/PHrRzHaistUS9uw8O5j6dD7N
	 1WwfSbEVRTVb2Fvj5vhamYVqEilQVwyg6Zn3oc6NlNQSkQMcBTlRKhkhHNKAuJtOnTuxz
	 +nk5CA1Vk7sF89oQtktkpKh+MKJfE8fpGcw5+dO4sJHVexYo7kcT3zx7wy77qU3KKAP0S
	 6Vm5yVqPtCYqd7PDv1Kd08q2j63dIpDK66RRBmAAr4WDI07J6dFDbwL/M1FHYeOVahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="OjeS/k9K";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C09606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C09606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjeS/k9K;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794933033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=OjeS/k9K+ZEeJGwLjA+B4pQfgrs1555WZIrBCTYjIeeL16SHOsepI0Aju6DM5iZAJ2b/89
	MRO096o+Xu99Xq2wDVa5yt94APWLvRM1BCnC02dStx2qio7fLMCpux57uOdERer5G6qMJq
	hRPN1F55iY9cTZ/z9zYcrHJeDn3nfuM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-cHkP5UswPRiAFot75w1o0w-1; Tue, 17 Nov 2026 11:30:32 -0500
X-MC-Unique: cHkP5UswPRiAFot75w1o0w-1
X-Mimecast-MFC-AGG-ID: cHkP5UswPRiAFot75w1o0w_1794933031
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49166c8a60dso3754414f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794933031; x=1795537831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=qf60IkSAFxTD8xr8bOjsd/byszjQSqPLfjok2uQ+ANozpf+0gR9NTS8yPJ7RUtY0eA
         IKfVZEz+ooTfmV3fZJ0ZPon3xFvNtD5Qvmc59ZPJCk5/1J+xOLhIq1v9zlJomaZAW2H4
         aUpvwfLGlWZ8xdmIH1uQwJfzN33jnBbmgxGNoj6XQRm6sNK/Gyq9QSz43sCTQa6Kjnfl
         6cDq4OXrIKMWWsaSc1ryv6UsrZeF3f4vIogqHWTxd6IFuqA7Tp+7HLuhJ+4JbxnWVjXe
         7eXmtj7+9avNVfGIN/HUPG3A48fEIcZx46uDs3vt9/5EDAh+btcari2jaZKPIQ9zA4Mx
         Zcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933031; x=1795537831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=18dZIQreI14+KR2sm9hB10FCmGXQvxDbRkqn2Js2KCkXvgvzEtOmS58bKKg//QJWOM
         BzAWt5o0cxpdgPuGg+pHshk3y2rOuV0FhhEp5ABbMGLPW6EAGYn9JQcLGYNzAxxI90Pf
         JVwjGaM0lDGTgqHLb5y+kQLOnDvQ+gsdnT/iH0hikoJ9qMGci4pmllX/oLkFC0AB2OLI
         oomA2lI3MMGzbTLKzg62J7Mvc74bPi3pkja/DqXIyTnDzRwmy5ewhYt4p2LPzPQaTShq
         nourCsAq9/3cU2EDNjNWKIBnbkEHgi1iEmku/3EPkkh8zD9+aiJdzMQ/ug2l474mV8EU
         zcZg==
X-Forwarded-Encrypted: i=1; AL+hErHHo8PfHApYoFRA3H4WvkqPmnDOFdlh8LWjrqbKWsThgQtbaty0ARgHYGoxYD28cexFatv3/zEexh7QrG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IyXML7fuTKfZ0Tqt+TNuYjCUwgvVB5EzMo1KgmbQ0fEWMsbzq
	qAFVXqW9w4tN/1x53SM0jR4tjSPTf2uyGDbH2LPDIlQiUpeS5E/KMrI9GHtOcf6eqlVOB3gi1sH
	mpQUpCVrYmEBnTYN6fzwTJcSUipJ7H0cSCEKo8NwrvfmDQki+VYd7Q1rbMRr9rXVojw==
X-Gm-Gg: AZFdTZc6NpFjMbY69C+kg/a+2pyWtEftmvDIi7YFhdDjKkutnESffmeChKxWVwWkzdv
	2xBcReI6yyIqJwhWoLadNwWvm5qn1EuFBOLPX+ZUPv/ne/rdAJIArO39tHdemhCUsQFNqHqmmE6
	nIrCT4UA5BYUBGh2VX/Vu9Q8LZvwvVYcPBk0NubGQhh8IgaWR/UAsWslUIgwCxqUMnJCwGb5/Vk
	0ln1PYcCuMTdnyOIfv9hChQ47afHYDGTrIr3uqBFg4MCOgf/P8fnB5DA8opAtf/LRUq1DciJZ+N
	u3xvh6dWTutbkjB3PLi2gFN6TMDchFgToiJnDaMHB6QjttXxBvw5l1Uog4OLy0c5tg9hc6/KMlH
	/SZnfsblbOd0X5K2pSMfN6NU3M/dYr5lLQ4XtSbs3lIvEcKxb7/wI6X7jFVFNSwCD05aSM3SIx4
	6BE+hySKY8rSN7Nc4ZOJZYrubI1OwNREKeo9eHNb0sWrjl
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405913f8f.30.1794933030658;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405842f8f.30.1794933030089;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm29021988f8f.9.2026.11.17.08.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:30:29 -0800 (PST)
Message-ID: <09765df8-89a7-4b7e-b889-5bafd7622c20@redhat.com>
Date: Tue, 17 Nov 2026 17:30:27 +0100
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
Subject: Re: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in
 fib6_lookup()
To: Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Leonard Lausen <leonard@lausen.nl>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <avxPFYfEirXzTup8@chamomile> <94f4ea0e-c1bf-467c-94be-b65963410d30@lausen.nl>
 <avxRfzsnke7VJq_w@chamomile> <20261117152414.GA824125@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117152414.GA824125@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 16:24, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 02:07:11PM +0100, Pablo Neira Ayuso wrote:
>> As Paolo suggests you explore fixing this from nft_fib itself,
> 
> Why?
> 
> fib6_lookup() is the IPv6 counterpart of fib_lookup() which is used by
> nft_fib_ipv4. The fact that it's not working with
> 'suppress_prefixlength' is an oversight, which is being fixed here.

I must admit I read the previous version as the issue was caused by an
API misuse by nft.

It looks like I misread it, I'm fine with this fix.

/P


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901222D4E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841357; cv=none; b=YQJHL5kZVjq4oFXV66UpXbIsGXavby9pvxzaKxWD8Ma7YclNyM+g9qUwSP02FwNNWiAZ47aLc8gxPx+OjmiCE1hc5fIDSIbyp/viKCq6w/5wkE8ZBm3oaw/hxJdYnkzzeDCtXePNb6TLOQsO2vGJ9XVlDrEfGY00kHJYLpKUbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841357; c=relaxed/simple;
	bh=OvCuE3tKhuByh3bh7M7tAUdCId7sWjvotChThY107eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQhpyafXVPBRqmXNTpU7sviLU8iqmNWUMQYmh0Hj1g9IZVExqSRXUR0CW1zBLXTUZkor48ZiaT6mlMrZjK+dQ32jqhcCSJR0s/qNESDqsoevd6NIslBNr2eLrYxXVaIJolze5TX9sdGSZoVIc94rgsIFPMGpJebRlX4u2zlYZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=O8ZuG4JY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="O8ZuG4JY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2533d83e3bso223758466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1787841353; x=1788446153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKzWbSJH9JlleRjv6GcxliujufDL4y1EreMLQdzQ5Js=;
        b=O8ZuG4JYk/T88A/KhRbMbOoCTWH30TPfEzzBHbskre3HDhnFEEAExjlSCNRs4iw+p3
         pMCzMI6ZqVuaVFQdb2DwIe4PFg25/1Hv62p8iwVS8nA5yXwCR59wEuG4MtZwsD0y6q3+
         fbSi2sj9OHOSdQWKteCkHmAZHUCNq/KPZqMrN/5MJRjRQLsYYOuPz9GB6BHQBq60q+HY
         otc5Xdrq3VIcL/LPkpYFk29nU6/E4ppOvlHAE3cLm2XF41Rc6hTt3NunTaMbMEM/vHUq
         MAonY2TFLKWX3iAqpNTbW/eEqHN3Scxbs+zoTHsYTFTLo/hAQXNQzmcfmPF9qlfOo6M1
         UFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787841353; x=1788446153;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKzWbSJH9JlleRjv6GcxliujufDL4y1EreMLQdzQ5Js=;
        b=Bg5P1OuEaJ81fPWk8y5/fkstngtwyZGvNYmYz8cFE6Ta0Qaxqzobfy8YtYHCeoHdx3
         bR/zzgBCfpjiaYamvxY+9RZutEVBeyjoepDANvriUkocLeahGfG0r22Fs3AKKaMMR5Rz
         hzolzIpX33kwOjHui4BrPW0tcAlX0I5L7J22twur7OZbuZDZa06zgFvELYaGjTA+ZGKE
         9eB9Mj9Cq8AUxT/67pkHtfESu0s42exuoVFjlHPAq7rkkVLHzBb8hsNODJRFrTHjdOZB
         1VOlKvQ/NExFJaYvnc4GZd4i2M7TkhEECZA3okN5kBRHpdMbEy35PUzDmfh/+RT1qT8+
         U9Bw==
X-Forwarded-Encrypted: i=1; AHgh+RpbVPWD/vxuZCcb0z4AgrvJXirF8llZL1wQaKPf2zXXBMpkVKIN9WgQjZgR9zPSaoTBkY5QU8dKnsWzhGk=@vger.kernel.org
X-Gm-Message-State: AFuF++nqSzg8/r9hPzq1SSmg4Jelu2b8iD6Mm1ssM3oh7aaVsSTnv7n9
	RG+6smq9FaIODuT5s0NyausFHUiT1b1mA33j7vIy+lTQZuMamI5anJBeuAR5+j+v09w=
X-Gm-Gg: AR+sD13lnPRXarMmgif+fh7+3ePns/5h/trDzVJcu/p7mYoKQO3yBOLKO+caRhIbwyI
	tFxEO+H/Sl0ocU1mdmMvyDRvG2A+ZcAIpeCkorIxZGaQ24CIt0Ce/94pxKAMqD/YGkmblmxhOt/
	NB2qovlt2m/4muTLhZS1lL2V+gkgI5rYsj0FMDxUii0+1hUJjgflUNj3vJLbd4c84j3Kj4iKyXX
	jFHiUgTfJ1B3gRi3txEuNRYaYax+2e2ZYgPDKays7nV3CFQRsUy8kcs9tCt1DDx90azMYAxpWJZ
	HClP48jyoajUqyxneWK68im9muh8eb7EU9bXaOWl2Bq75ZyYWJndlqm5Fq40KIO0Q4logBjG9Ah
	Y2eQhE8vqEP27Jy+x/xZp85O2gGW8wMUo6WozR2YLFKYJS9OcoVUb4hs1yVYUQMImzVRM7sgsJd
	S1R0rcDIzSnnO7yTDLzU/iHo9w8fZxgyjq5XMPSmaJM9lVUmUBtXD2oDJi3265p+W124IEcmC29
	CcFES2zZvqHDdeQAIE=
X-Received: by 2002:a17:907:c08c:b0:c21:752f:c44e with SMTP id a640c23a62f3a-c250bc0f7e6mr1797816966b.16.1787841352449;
        Thu, 27 Aug 2026 07:35:52 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62dfsm738498266b.4.2026.08.27.07.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 07:35:51 -0700 (PDT)
Message-ID: <ddf53430-f3ce-4ca8-aacd-3fd8ffc81091@blackwall.org>
Date: Thu, 27 Aug 2026 17:35:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] net/bridge: out-of-bounds in br_forward()
Content-Language: en-US, bg
To: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org
Cc: bridge@lists.linux.dev, netdev@vger.kernel.org,
 Pablo Neira Ayuso <pablo@netfilter.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Phil Sutter <phil@nwl.cc>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
References: <fai12uKS5302YnCQV4E3zlDqcsAS5aGcMutS@bugs.sh>
 <apBJyKJ7zs4kUmpd@strlen.de>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <apBJyKJ7zs4kUmpd@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2026 17:29, Florian Westphal wrote:
> co <co+63bad23bb3b4cd85@bugs.sh> wrote:
>> We found a bug reachable in:
>>
>>      path    net/bridge/netfilter
>>      crash   out-of-bounds in br_forward()
>>      commit  7b5344954050 ("Merge tag 'nf-26-08-10' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf")
> 
> I'm looking into these reports, I think this is the same
> underlying bug as the other report; a variant of
> 
> ccb9fd4b8753 ("netfilter: revalidate bridge ports")
> 
> That bug uses nfnetlink_queue for RCU escape, the other two reports
> use defrag engine.
> 
> And sure, its br_netfilter again -- I think we will have to consider
> removing it even though it will break existing setups.
> 

+10

> As a compromise, I suggest to reject br_netfilter in user namespaces,
> i.e. call_iptables cannot be enabled anymore unless you have
> CAP_NET_ADMIN in init net.

+1000 :)

I absolutely agree on both counts.

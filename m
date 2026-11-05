Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846025;
	b=C01uFFWWZxDjsk9kmnyfUAxd0sKRnESwHDejzZBcq+W+wuW/HLbL6dgoHRoWZxCmZngD
	 DQbRhwWw2KxBRPkZGXZ+adgrbWengo8c+28YY37Gm9miKFsmvsTqabxFBT9z7qmDAAJkM
	 2ndP6qIQjEt4z0BcKOkNQQfPOGRutuUWOriN/uHd/ZV8OD1ycFnkQ63kOxy2BuQeZM+8J
	 ADEUGysgWlOXpegUmpr7oIAzQ09raVY2H9c21ZrFsYxkmBcmHMBpPo178ao/wbfIkaALS
	 81ABHenLspdA8IAmsOi1xkcrY7UKoicjpJ09qwgcceV/vtSBcAUpPlVraS3xMKczf4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ogRG1U/oWZ2H7p29NoIDQN8HgnZMCr9flXRbDMfJFOo=;
	b=1DbYjTyg6GReEO9ZBDI3yxLLEK9ZFL1F0VMYyXks8LMY9SLwYnzGyvOGr3ur3WRFpIsK
	 Wsi+o48C66ZkmXRFZm/Vi/Xjp/lLTv9T85cQ40mjwdowVPOlQevd9BH5+1Nm72OIBpBbN
	 l1DaRrPF+NBaFO1hZ0kB0RK/TncDiMQWaWcjpkEot9SFQA86kSJc4BQuQ8BWi/sL1vzk5
	 hrPm8OgMaVr0lrDhgMIN2kFvonC+78GJ9h8JkVF+bKMdS9E8ivkvPBkFIdTAGgVXZKSNk
	 HLqW86RVlUBSJWstqoZwWwPF+8PZQVXHI7lu0Ih2iRd1VchMDQ2i5uHYsfxhpNBILwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=hq8bBSZt;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1F0606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=hq8bBSZt
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so2662270eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1793846024; x=1794450824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogRG1U/oWZ2H7p29NoIDQN8HgnZMCr9flXRbDMfJFOo=;
        b=hq8bBSZttFswu0JV3y+wQGnqFu25gl323WYKtq6AGOsC7ggPyTWaOspBJkIfpebMw3
         wVBsR89X5CuNftPEGbWuY4z4If8fiW6uaMlz/086evHbyijIs2uVcmezpYnW40eKryjb
         eu8HfBWo6iXINffpMYOh36A6gFp/h2eMa+B+R1EWDt7/R3DCSebKFpzHNipFn1/2Btea
         tbBmIZ/ux2YESG+NbULkiaHs44QqWgSCfW3ovs0m+Ib5W8QftrXIzPqA2QVL2T2meVzi
         OscOnEDBBWHpZQWer5EXCVZKRoncY/a6aCILUp3APi7Cry3JWpXSQFiIYvVZQbKltpC0
         Af4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793846024; x=1794450824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogRG1U/oWZ2H7p29NoIDQN8HgnZMCr9flXRbDMfJFOo=;
        b=bPlbp5Xkm5eFTjy80GL6N6M2eN4KN06PPqniQ1s7B34+W3H1wL/mJiEaPkxBBBdJHq
         /9tOFvA5KXQ2/BQoq46mFjVpeV8OoRQdtqEYkfEchQaJ7xW4092+eMo9ksB9fwP4o+nq
         X1xnKzN3HXIeL3aKoNBurXTjAfzIG/rO4BpQkOFyoDB07qsb2XAKS3nO5jw8IU8Azdq+
         pjE2fpcmnW7WVji8ZEzstnMYy2tRP8hCybnuhH6RQUp7TZ7uyttNk/+CGmgUjDHA8ho4
         7Gc0XZ0d6cHTkajr+K+SHWLiCaJdh6F08RBEb3NVCvRVWRUpeywi776zgx3AkNHGk2nM
         2alQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5dFtkXeC+JxHIEIYd109hn6JmNpHeoeUN2YRBblspIUb0bJhVBbdzfGNK5o3vGHFlyZhAZYKEvTarT0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZLLHGhydiArRTEv+xck47+2ImcRzkP+zYPUJ1vcFDshmdBSMe
	fkMtWTp4bJ9HB3QMqjzjZ8NvCCM6NQHKVL2d7dVYtC0MYk6DoT6PRazuXPRMhINwuO8=
X-Gm-Gg: AYBFou2O1bOKwdB8PBdP/uMJIoY0WIgEn2a0MX70c4od1LoTmA+Y0eQIOP8oEiPDSkM
	X9bv4YXPfyiRe3rmRcaqmQB6HiC8vyUPTUVP6qG2FF3xLc1j/pdNOk3kzozsX+hcM5znCa8teUz
	4tlPyVmn2GqC+QyRuPO+N1pcgYy0++7Xa/Ns8uy3QYfVsd6A3O+XcCOWdx9npnqjWmK0dXp3mHA
	VBKeaYCrsvRGfTghhHL4EZGSOcJOeNIETCTQDxdD7jDMyi55eEmD6Ds73aE7YLyNMlotwnXVN1f
	E6UPF6flWusY4N4yoxDCe6qsP3Cax314Djz4ALQy+qxF7Mb/pm0VEVo0qzaEmbKZ2nD9dsMwkxB
	BhQE/7T0khC/E5Ox3FIEIYXjcIpFoV5HnFT1CI4KDr6JVAA0GwdxPEhXhJYlLbIwWmD7w3Yo9jb
	TS+8mEnmxRfhMfO4HPzegI5bQG1oYcRlMxI4aCJzigmzvr4GZ1Kvpids/Rct/WHSyHOkOiaiBJ6
	iz8nAqvkYFe9LuT6+g5kA7vdODSKR8yr4UdhoLMcZJiFL6jd7fM9D3MpOPGF0+rOtn7NvAlfvua
	7xYlQxpKxUsniucnu70WWD+0lYvkdYZA+CwkUJm3ofkZemIMQpgjQN67R40FRJCVR4JCk55Q
X-Received: by 2002:a05:7022:f20b:b0:136:c443:80e5 with SMTP id a92af1059eb24-1ac56d94b0amr27300481c88.6.1793846024101;
        Wed, 04 Nov 2026 18:33:44 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm11403400c88.12.2026.11.04.18.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:33:43 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] amt: make the per-tunnel group and source limits configurable
Date: Thu,  5 Nov 2026 02:33:40 +0000
Message-ID: <20261105023340.19774-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <361bbccf-6ce7-4b1f-bd55-4d8270423320@redhat.com>
References: <20261015231825.2852054-1-omar@blockcast.net> <361bbccf-6ce7-4b1f-bd55-4d8270423320@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/21/26 15:30, Paolo Abeni wrote:
>> +	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
>> +			   AMT_MAX_SOURCE;
>>   	amt->hash_buckets = AMT_HSIZE;
>
> Sashiko noted that with this setting is very easy to livelock the host.
> At very least you should scale `hash_buckets` accordingly, possibly move some
> processing out of the RX path.

Thanks Paolo, and sorry for the slow reply. Agreed: as posted, v2 lets
one Membership Update hold tunnel->lock in softirq for far too long.

I reproduced it at the v2 ceilings in a UML guest. One 64 KiB Update of
about 7,500 empty records, all naming a group that holds 4,096
sources, held tunnel->lock for 1.7 to 2.3 seconds.

For v3 I plan to:

- make the A-B case of amt_lookup_act_srcs() linear, as its own patch.
  Today it compares every source in the group with every source in the
  record;
- bound the source-state work of one Update. Each group record is
  charged for its passes over the group, and the report stops once it
  exceeds twice the cost of refreshing the tunnel's whole state;
- size hash_buckets from max_sources (at most 8 sources per bucket,
  256 to 512), and lower the group ceiling from 1024 to 512, which
  keeps one tunnel's worst case at about 4.75 MiB.

With those, the same Update stops after 26 to 45 ms in the same guest,
while a full refresh at the ceilings (512 groups x 8 sources) stays at
about 5 to 10 ms. UML is slow and noisy, so these numbers are only
useful compared with each other.

That keeps the processing in the RX path. Once the work is bounded, a
per-tunnel work item would add a queue and limits of its own without
changing the worst case much, so I left it out. If you would still
prefer the processing deferred, I'll do that in v3 instead.

Sashiko also flagged an existing race between the source timer and
tunnel teardown. v5 of my net series "amt: relay tunnel lifetime,
validation and request-path hardening" fixes it, and I am posting that
next. v3 of this patch depends on it, so I'll post v3 once that series
is in net-next.

pw-bot: cr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659731;
	b=h4jpMN/4hibq/ge/WqfPVe/UKs4P3mWTKcdXOUi1GbVKbgSQQbleVsgrz/YL+Ds2pd2L
	 2nPI+RMXNkvAz201IFZQGtwXcBhTmbs2CzI7Hktg5RXnITtzqMfs/wfQQIyEyFHZxxZui
	 N4zJygZOLMkkbVGyLkR/EQilkMaK2GAXpTlo9OLZWNsbzBrZZLV6cEjKpFSabUQmWGfve
	 yBzjXBYmXAKHvmZHEWRe6ppSR4PoClEhViNn7Go0EnXXUPqp7HoblN8I4tLzU0IAu4Zeb
	 rjXdrVHnoYCeEvgudZCGseTvJdh2KylvfqHMDFTolmKKd6yFECx5cj4SUVEp9zeIqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
	b=ckD7MUy5AumbQJ0qlV+8yNPF54ROAR7m5VdLDE0WhWIEc7vNXlI99yyF/L2jmlfT5YVm
	 BXP4kWrdzCQGwJVBsqce0HT/sdGFfqT5Q4VRVXD4e5v5rIIntj6M6sP4InuVntNKmPMuN
	 v6QKWEOChWQRzmr9jIVComRwduEz/fgR7ylNkX1Y7XWs5hwM/7qIJcleYshA4N14fM7Xx
	 ZHNsMQ0UjwbeNesn0MP9HZs2qWwPqJykWAmjWKdJIVt05ydErH1GAzvqkKK36s0UjY3lE
	 7XyCSG8xsYejk5qTdhjqDe5hwQFW2ouA9a5wBO9x4nKwdrNsltzF7+Ss8HMPBJbmV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hXv6Xwym;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5682606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5682606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hXv6Xwym
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9494d734351so276821285a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794659730; x=1795264530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
        b=hXv6XwymXGceUlZL7WtVJXNSY2KLzR+5XuCCQRaOMligXzCYmtrC8D6aptBBlf3TwD
         8V0CleuJzCudM/1aOV9zIPC1XxuMBkAZSzIbmoxT5LxnBIV8NgrpcCg1yUy36XCyAL9W
         1sK+EVhwH8bk8s2tGGt74SZ/By3N0v53GZ0TPQEoqtSABq+sdkjex/3hyNymufZg6f98
         Thucq/GqHHZjYB3h0E5Msa49iaoDnugvQoWtHjwkKt9OY6WuK2Bq6sO5RVyTas5FPS6J
         e53rgl8t2/pzvVEh1yhCOScgscYP1KBvkVuaHx0E9UHqFZEFsu8hIdaqqxzOT3uhFM48
         ZbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659730; x=1795264530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
        b=VPN+8NIw45syPftt/NDLV5UGJgN9RYg4w/ft3ydRKbQdn1vQVgZT6OXBOB+bbpMxnh
         U/tXNSqn/GviuiZ11+Ch720sfvhHpiXrpvkzXdsMtOjpU6133+YwCbuRrkmOoOvmMGTq
         F4ZWWajZje6sFfeu8d20IFa9MjqbWBVdzf4wYUuyoUveE03QfsIafdKQ7DIEhzavhBNX
         uTMWwjng2YzBE3HqCcc2ZcI40XNUbvV4YaVjDwmJXBPLhdTNS0iCk1ZDBiKavzkR6SIo
         3RA4KEtNhF/eHaUjPahC2Z7ulpCC8j4VQyCwH3nFXThJwwu6ilsBhktvIX/kgFrCBUr9
         NoMQ==
X-Forwarded-Encrypted: i=1; AL+hErFgoQxlABbhmmUlHIWAjgR/MvbZ6jRnQBFwtHufP2XKoIja8o6oxFki36T+AORjLENpv16VKLYDuMsJZ7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U86mxFaRrWItqiB4UR79eLRTIojvjPlYRdkOG5aWxZIky1gqK
	G0TrA23d5uqnE0K4zDBwT3O0f+uCqzCea4x8a7XbTRf4vgwOv+8wa9u2IkHQ4THbXA==
X-Gm-Gg: AYBFou1T+gzbEEa/yFsyR6KWHQD8DVM4KHMK5n6a1vYDvRhPSqOu8YXwChW9+CLEjcm
	FCcvbwIeWciG+vweu+9XyGlY1DO7asDiFj8T2HgoCVHqJHixnWg74GeSW8hxAV0HY+jGVdV3lvZ
	EnQOnBIaHpusE6YZenzirGe0VJH+AW189sTWzIt7kiiRr5CnJAUjO11EnsomCRRkfEWU6+MPg9D
	9xJjbMkugiLLxLzPFd2UUAO1uUlHuhyqdpBN+mscnv/jr/uzgl4XrpIY+8Or7LaYc+Y/5GzCijW
	6WvO7R2aP8heZh++KdgCi6+pmm+HM3gkY9HlJvyzr3Izs1W/hLOlZmBU6WD1kRqueK/wGKAs/N5
	U07TxK+S6FSACnDnqWAQ7iYkTObp4nZv1MVQTnKc0xY/QkqzRZT6wscfWj1Jj+AAKtQYX2b5LLm
	CLOKoEHDXTLRQVfR/YdoUl1ImuXx/ZFX6Zxyrh/Z8SbOSxbWrZdvr5ZUqxdGaIUI2VU70kDmDSZ
	qq9I8KwkgYl6b86WTLT+ewnBF5tzWpwj++ftlxnn9f+qtQ037plE3pSTfACv9tY0oNtFyjEqdxj
	V5nJVF7Ke+8VZhkV4YcfC71K0Skp3vqizF+snSaoL5j0YoBQCNdZ
X-Received: by 2002:a05:620a:4711:b0:949:6d95:f630 with SMTP id af79cd13be357-9496d96005emr75577985a.37.1794659729734;
        Sat, 14 Nov 2026 04:35:29 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm277233885a.6.2026.11.14.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:35:29 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: bring NLM_DONE out to a separate recv() in link and address dumps
Date: Sat, 14 Nov 2026 07:35:21 -0500
Message-ID: <20261114123521.452385-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113182633.1bff5ce5@kernel.org>
References: <20261113182633.1bff5ce5@kernel.org>
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

On Fri, 13 Nov 2026 18:26:33 -0800 Jakub Kicinski wrote:
> IDK. Maybe others will disagree but I feel like uAPI changes that
> happened (almost) 3 years ago are "settled". At this point just
> fix the user space.

Understood. Thanks for taking a look.

Hengyu

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332094;
	b=q8TnyUcd6AaZVYvffSJFGdRheG0OnDTZNzmXbNIBDJ16WdEguwmEOpPATA+Wp9Vod06D
	 c3TYiZWNl2AfZFJwnHhC6iflZj5ZebZkRFEIiLBjMPjxHREChM8pIb+hgjtYBLUMWcRxt
	 iand2zWHXUXoJUrCWdZUpPi4xTK1jA1LUOhXt3WMdYKu5/hP11KcRsPPBqDkQiIXB/cEt
	 9MmZUYQCOrWVb+JZckCG8OJ5nEFYV8EOZ5kUp2wsUpTx9p0IJtU1Jrl+I77JzMyR8nnn+
	 eYocVy9ULN746MzO1OvFBVabOippmwbTnctwtSeDC7Fzp1nvq77kjqWNkw6rjgABZYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3KFTybz8kT++YN5KVSZrQLabEco9jibefDbnF3iC0ZI=;
	b=PvjeDqgNiJY1QXdIAtvKcURSjStm/D9ttczE5CJeB5AhNZ+Za4jbq0ikomXZA9uk6Woo
	 IooaMqqzpJtj/hqIdZpQyhG8JorbtReLgqL7ko36j8iClBwUXYXJEB5hKuxyThLDgQdrX
	 mI3Q9H9fcjhoE962b0103k4W4XID/k4e1TdWZo55ajwkN/S2AH1mJQWVLBaZzvKLw4SM/
	 z8Y4CG98hQE77ZL7HzvcLLd6Q4aR6jVqxW11bGg8dLey9CW6cNdcYaggvmoJM1h3HSPKm
	 U1ml1ClrEpDjkM1xSOacf9ZHSPwpdAG26b9V498KRNsnRrweO0VOvEQg3ieOIDINARQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=DV2mBkeH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B838606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B838606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=DV2mBkeH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so2556795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794332092; x=1794936892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3KFTybz8kT++YN5KVSZrQLabEco9jibefDbnF3iC0ZI=;
        b=DV2mBkeHi9vDwYG/ceZd/Q4iLGwWg1jnKcSAv3wVxqBhiLC2YbAFlhVaB+RzkxLNHD
         m4X9I8H1nweDa8MFCKzPHa4zOxNDbdVnE6brJ2m6GkZTRc71HjYQ/m3dUX0QiIMDQA1i
         wAqtzwYOTe793jXvR4vv8mU1HWnwu151AkGbc+49mkYpJjb5rM8KPSBmnlZFZ+G1u5eh
         F143rgAzutJ14CbssvmWElBBeEagf5O22tX0vYpoNgsf17uQD5OIhUsuiM29TwD2+e0r
         dMmcFoUbykEs3mPoNjpF8Xp4DMUNIJn6qeZnmErM7+b6+3EqmRHdKvUf4AYk8HNInqFY
         G+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332092; x=1794936892;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KFTybz8kT++YN5KVSZrQLabEco9jibefDbnF3iC0ZI=;
        b=LVuuPMkmBhWJiVX3cd2itut2ANZszF0Gkfx5/YM9OBp8fNneZ7LXNwdhLUatV5xdSZ
         tj1X2bdHJWYj71Q+Xsup187CaLaROQZwnDTaAawkp6/CoA+S4YD6DKIp3XPIQ55airCT
         LGwrmHC9We6uue299hNBQDaiUkJMw1321fpl994EUhI/7aB0WhXmnNsLiLrgj2w/9jCc
         C5HXfv9E0eQKcsyiZBqAbruMgLX1Se0BiNGVFOTnamHX05S2Yzeocow8tQqOMlzaFMQx
         hCJUKI7DyIgSPRFHoblII/5SfRVs8o8L1N3lTPUUuBpZB/BVMu9N88MoQPYVVSwgDIHG
         GL4Q==
X-Forwarded-Encrypted: i=1; AL+hErGzx+iCQ+/oVJuxkm6ygMVeziZwkozsT0uKflLQ6Xfce+f928bawA4V7tFv99zL+QWdi59wbA8a6jlnRZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t+ferCz+3YtHxeQa684Xayiostr7PSpnu8IexulRxP8CZ6Ly8
	CkeUAW8i6bbvhg5hd6YqQXp0KvQevheg8YmyxqhrdtJ46yj8fTtCdCQtd3qiczaw+e8=
X-Gm-Gg: AYBFou08mlRDRd8+pjANU/YeTF0MvT7AnFpgLz09AZ2n5eie/aCzHS5kzsPypeoz2M6
	vSuMcG1TM7pLE6f1rC4EpvaQ/gd5osUnCjPIPIbX3yZ4qewl2Lo7ku/R4eMT25hOWvu4oIm0vMG
	zOQqbpATK93WbO/mcRyeNWbOeUHQuSwgEukoZXpPqVImVO6pqarTm1LUSVGyPeKiNAzwL1uwv4I
	RYBSjtIeqA7iwfOnWCEF/6ZQtQ9UHbPNl6OjGipu1UVfDjGSpBht+t2RRb48jqGFZIKASOrLkac
	pcbXb8I1dCg8WplfysKcKqiaWVUlLxbJO7R6frZVMEFBF0LehpehcuYWs1c7F3h47dyAUCFAogO
	l6fNT0tVgs6DZ7zfRcsQvZcpSbcfO4VIq5BrCSUUS1uaQ4CsYW+sG2D83zc0ebTwZNtKkcPbDU6
	fcnr8NfHdhghdIXR58l1jt3FzFvdql4BC1l6M4YtqPTGSZIE+vPCfGh+bfGQehPaJTzoE2nJMRL
	mo914FjLoEdj+Wcw7tXjLIYxCMpmTzddl7i4bejazIwojn7zswpcdWQINkqom8o1iXueaioOL4Y
	XA5WyRlHjj+9jRju3GboakXheEGIZgYqMCzQIdC5VO5/ATS4uxOcY1AadPKgLy3kxI1WJiJ7yeP
	xA85IUg==
X-Received: by 2002:a05:600c:1d14:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4ba02337685mr57336495e9.2.1794332091742;
        Tue, 10 Nov 2026 09:34:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm78705945e9.2.2026.11.10.09.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:34:51 -0800 (PST)
Message-ID: <1eb85d22-7d2b-460c-82f6-2af15a4875dc@6wind.com>
Date: Tue, 10 Nov 2026 18:34:50 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next] ipv6: reset all.force_forwarding when disabling
 all.forwarding
To: Gabriel Goller <g.goller@proxmox.com>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-ipv6_reset_all-v1-1-815dfd508246@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261109-ipv6_reset_all-v1-1-815dfd508246@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 09/11/2026 à 16:53, Gabriel Goller a écrit :
> Disabling all.forwarding resets force_forwarding on every interface, but
> leaves all.force_forwarding set:
> 
>   # sysctl -wq net.ipv6.conf.all.forwarding=1
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.all.forwarding=0
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
>   # sysctl net.ipv6.conf.all.force_forwarding
>   net.ipv6.conf.all.force_forwarding = 1
> 
> Writing 1 to all.force_forwarding afterwards is ignored because the
> value did not change, so the interfaces are not re-enabled.
> 
> Reset all.force_forwarding too and notify netconf listeners.
> 
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>

There is the same effect if an interface entry is reset:

$ sysctl -wq net.ipv6.conf.all.force_forwarding=1
$ sysctl net.ipv6.conf.ntfp1.force_forwarding net.ipv6.conf.all.force_forwarding
net.ipv6.conf.ntfp1.force_forwarding = 1
net.ipv6.conf.all.force_forwarding = 1
$ sysctl -wq net.ipv6.conf.ntfp1.force_forwarding=0
$ sysctl net.ipv6.conf.ntfp1.force_forwarding net.ipv6.conf.all.force_forwarding
net.ipv6.conf.ntfp1.force_forwarding = 0
net.ipv6.conf.all.force_forwarding = 1
$ sysctl -wq net.ipv6.conf.all.force_forwarding=1
$ sysctl net.ipv6.conf.ntfp1.force_forwarding net.ipv6.conf.all.force_forwarding
net.ipv6.conf.ntfp1.force_forwarding = 0
net.ipv6.conf.all.force_forwarding = 1

Maybe the new value should be applied whatever the old value was for the 'all'
entry (like for net.ipv6.conf.all.forwarding).

Note that, it is the same for ipv4 forwarding:

$ sysctl -wq net.ipv4.conf.all.forwarding=1
$ sysctl net.ipv4.conf.all.forwarding net.ipv4.conf.ntfp1.forwarding
net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.ntfp1.forwarding = 1
$ sysctl -wq net.ipv4.conf.ntfp1.forwarding=0
$ sysctl net.ipv4.conf.all.forwarding net.ipv4.conf.ntfp1.forwarding
net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.ntfp1.forwarding = 0
$ sysctl -wq net.ipv4.conf.all.forwarding=1
$ sysctl net.ipv4.conf.all.forwarding net.ipv4.conf.ntfp1.forwarding
net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.ntfp1.forwarding = 0

but not for ipv6 forwarding:
$ sysctl -wq net.ipv6.conf.all.forwarding=1
$ sysctl net.ipv6.conf.all.forwarding net.ipv6.conf.ntfp1.forwarding
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.ntfp1.forwarding = 1
$ sysctl -wq net.ipv6.conf.ntfp1.forwarding=0
$ sysctl net.ipv6.conf.all.forwarding net.ipv6.conf.ntfp1.forwarding
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.ntfp1.forwarding = 0
$ sysctl -wq net.ipv6.conf.all.forwarding=1
$ sysctl net.ipv6.conf.all.forwarding net.ipv6.conf.ntfp1.forwarding
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.ntfp1.forwarding = 1

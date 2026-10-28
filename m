Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200365;
	b=g9YOPEbKJHTRpVtZt+2pZqOPX3nBXSnrS1Ju2Cg44euWMfggYExU9Z6X1fMI8h6NemNp
	 g8yS3G8c1IFoUUj/wmtRTwWtSe7r4Fh1KohvrawYso3FpIS9K5g092u4RappXCYXuzBZ2
	 b9xLe0AT60jdFSP8kJYZTrLsKrLOu5NEkBurB9tQ4t8MokuLmLmPxAf9ZGyN/VvdFMLwc
	 b9PzixvXhpkDt3dgzo0S6CvvxUFsMhYr/vzykOmh3JA7t/b8FoGK0pxmOeuW6Sh6bpRBH
	 IyQoVIpPgKUE3fR7MYOu/1Z5LyK97YFjecLnIIJuY1b/huPFc9xGXfEeetPYUH1gIhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
	b=BUVFkdeBWoMC3lDG/q4FLUECC3jAcz35eWI1czGfd5h3NB8VNu5kZZKxzs+pp0tMUFfG
	 4urflFrU2w0mHqpOdUYw4SlfdqFk8vNvEIlSAmdsnD4TJBqwRNc/bO8FZDAy17YhE+eBr
	 4GquPfKsWJimFwb7KJsAJAz8RUtzHJnvdIE0UgNcTmJj6Sd1M/AgG3HhdFMQDWDmjipZW
	 eWO8GsPySR6b+1K2f8p8MB0+lDAWq2Dd4O/zQPQ7FtqXAcVr4/x3k8rJfx3TjQtVxeE7b
	 CZu+DOBFuIH2ittp6v49PN31IS2LQSxsEMxeJrtkR5puk/9Ys7krF00xFnSlN3X6RRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m03FeW/k";
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E76606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E76606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m03FeW/k
Received: by mail-yx2-f11.google.com with SMTP id 00721157ae682-8b1809cf49eso4914077b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793200364; x=1793805164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=m03FeW/kbbVO+stnbit8ASYFjId3lG4TSvHhfOXq3a6uw8L9jO13zltFNWD7EK966I
         Aa9AxJf62YvyAd/5ADLndNx4MXyVvZQzIFdmyN3U2wtCIwWcSq8dx8Wfi7gpnaweyjQ0
         vSY5dxW2nQq6/dyCYl42nl3ut8l3w88C8sgtFCmD5PB1dSOG16NvtzU8Hjq1/pRlWWhe
         33+GBGQhf3CRVe4PaPwAgpMvbiSyMSbRG/JG7NtZHq8eCRlvlNK59njb3AjJ5gre6YE+
         4JIj28Y+tRI045M9MHlUIMVL7d8A/2xSb1IcfrGmyUGrXynTSR3ENyGZcRKSYMopBxOf
         E+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200364; x=1793805164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=yCbDQWpJOYA4BT1slYVQO9w9Bx5GSbJW/MasFFDSEaXjYLa8oqLPrdZ4gmKW2+UuK7
         rl1JrP6x/SdZ32v+GVrIvYhU7TsSKyMr3IyNxR4ke+ss8PFAlCTrI0QFeGmJcMvXDucE
         XcmF/T7p5Uj4Ki5b2VnEOm8XBQ1gitfjrHbwHBz1iOHE5j7j3bVc166rRgIBuFSFFkNF
         eqcSeV5fz/k1eV1SFiHbzoYf0lwnEmcq3UiTmtCt3qjVlBLS5is4HrKiWN2Xok9cddQR
         GLSmjRhiKHn6q9D8HRo4r28cRq16grXXdsvqdNFJTlRk1YHo/LzDKooXgJcsKjSAlwd8
         bpwA==
X-Forwarded-Encrypted: i=1; AKwUvBx8UubiAQxVHWCXg49w7jC4p6L1NmPM+nk30d3TuLHIf/oiadGQyUZurSuvHhXYO09Srv50iEn2l7yxWg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6A/gvvJmQm6cttCvUcu+Z/bhjCPda0jRpp54K/dYyh5bHzhU1
	Nu036y+nltDWVt/xhWdtENbh8LsqvylpuIgiqIAYktK41PlqNqEdVFxt
X-Gm-Gg: AYBFou1PB1wZDSWPguqSXrloPy+ogBr1f3Tvw6zHKiL59sW7lm0RCeWNNfCSQb+ZNV9
	J1IGcT6+3BWxE+vusL2TcZyiQ3i3fdtZvXuSEfYhgCWowaxc0M4t/k5l+3P3aL9QhbohEgPtkGh
	DThhxlA+ndTg/Aomxg6FHrEjv1XMZattv80fif1+V/M6E1tzEVZ1OK+N+MmOWfp+sCjftiZxjI5
	dlZUjiy9TIHANOx/v4DNOxxEMvkx0T5WQ8zruYIepUMmNmCgpUqpiiKi6ELvqh9SeWc4A8nRloc
	V2T6PwTmGvuHd9MuIghdf6mRvNrAdI4lKqLAnxMXptbDmkHikqGghIAJG3LozNVeHqLpOfCRNZk
	GmpbEvzq48JLT5eQc+Y/t8m+IQbvP8SsLN8XB1llVNN53/ilzXtlIkPmYTGztL5CMcAsduL8OKI
	R08MsANOmObFqwFoweaVWiW/OJdE3gr8NhwKLj7w6jXFO6B92Eew6dnYauZBGbx4buis9cNL4XS
	Q+5NXtokaRRg7Qjo18ESztjYKOszrgpIhNFEP1y0sJrD4jwPlqnl1tTQn7Tr/l1TJD4Dc2r3WoI
	Qe1ccJlAVmLg5HYQd9rHG1pqrrQYRRkyvTM=
X-Received: by 2002:a05:690c:386:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b1b5b457ffmr18430047b3.56.1793200364364;
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e539e34sm29934517b3.9.2026.10.28.08.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Message-ID: <e674379f-819f-4334-99b2-7b8dfc89d1a0@gmail.com>
Date: Wed, 28 Oct 2026 11:12:43 -0400
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
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
 <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
 <CAPG1HMsnUDa=Q5O4fwZOU=Pd+m7ahzu574Cs+mWoB_9KUT5ASA@mail.gmail.com>
 <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/26 11:01, Chuck Lever wrote:

> 
> I get that dropping the connection is bad; the current weak-ass
> implementation is meant to handle KeyUpdate until we have a proper
> spec-conformant implementation.
> 
> My concern here is if the current design is malfunctioning in LTS
> kernels, the only mechanism we have is to fix it upstream and backport
> the fix. I don't believe stable@ would be happy absorbing this full
> series.
> 
> Your commit message claims the connection stalls rather than getting
> replaced. If that's true, that needs to be fixed before this series
> gets merged. Can you confirm? I don't expect such a fix would be large,
> but the ordering matters.
> 

Yes, for nvme-tcp. Since 6.7, tls_sw_read_sock() returns -EINVAL for a 
KeyUpdate record. nvme_tcp_io_work() then stops without error recovery, 
and the queue stalls until a command times out. Only the timeout handler 
replaces the connection.

The fix is small: "nvme-tcp: start error recovery when read_sock fails". 
I posted it on Monday, and Keith applied v2 to nvme-7.4 yesterday:
https://lists.infradead.org/pipermail/linux-nvme/2026-October/066937.html

The queue now starts error recovery at once and reconnects. It has no 
Fixes: tag. I will ask Keith to add Fixes: be8e82caa685 ("nvme-tcp: 
enable TLS handshake upcall") and Cc: stable, so it reaches the LTS 
kernels before this series.

I have not checked sunrpc. Does xprtsock replace the connection when 
tls_sw_read_sock() fails, or does it stall too?

Martin

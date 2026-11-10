Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329998;
	b=bcHNQ++ykIxR7BcfNPmGhBsPEb5z2kepU4beyXwB888J/U5bc0Jfw7EQfViIXWKvBq9F
	 xewnUyHcZbO66w7E7jvzZSuWUUama6tipXlMhhlgsthX7oXvYe4+XFrg2iBjWT/yYe78U
	 VYzMLvw0xHR4QJ3aE5br6XRndoRqr/3UIznAOQvy73ta6MZE11Aw9qYvrLBHtpOaxdLDa
	 /s0MLZdiuOzoUWr9LaG8Us4btVsp9G8cLLrRgKzI0Z390knUtfKTcLtP2gdy3+heiOmun
	 LFuoJI8QRdyhcC3qfCLWHb767MlnzUK422wOfOZ9xlzmPp652m9+4moknf6MAPDtDQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
	b=uKSgUgcRKrMwfGYt4tQZREdP1DWcCun8JXy61H1VNaIOIWhH0Z6w82Q+M6Yrw44HiTMv
	 hLKtPrbdPBx5kSEM4eCdpxPV2vwhN7S6wC+CJyFZnndsyqAZaBfnuCoogxYYC7BINmh81
	 PV65gnG/5ZujcrCnYYeSfzUSfjKQKrzt3qft5ujb3ippCf+FjW8uU2UIg4VK72v+a8cyO
	 jZEOUBfH1lcWRjIKpxh5tYglsYAJ4uaDQ2BiS1OMPR6vvN8/FlgZ+CxnQrGA02reaw85D
	 WveGiK3MfIhnIX7sq+ZGvwK54bAd9cwphbASPdatEXux3FG5fYwnTVtBoh1OtfFN0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VMlRc/dY";
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE0606A802
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDE0606A802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMlRc/dY
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-67bf5e70218so484537d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329997; x=1794934797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=VMlRc/dYo0gG+xfLo/0j8ixz2semg2ZuvI3E8PQY+x4HxTGob782iCF9vJDNiutK3/
         cybGhnZmlzPzZ3o9Dx2IZMw06MVNhJS26tA826PS2yNQiQc+i1Xz+laPs3C5xf6uTRfx
         E9iARkRgmd7apWFoaDw0aSKRaohSqG3oHo+EyOSf8CFEM31Sk5iAhgjyY3NU6lwlT2DG
         2CsbJr/caRHdjZi+TYdtEY8r6vjtFqO+XkM8si4qQDTYLLTw8LYznx6kmOMxt1YLo7qK
         X9YaQ7p/whE9IuG6a5jrkTuqcLQgiKCiq7OqnQm3H+oqDVLLodeSQ5PWXxVYZPKmSiAg
         oQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329997; x=1794934797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=uRtT3V9jDJ7b+bAoP/MsPA0W1S/nEJF3Q4rdggLLboJ0JRT5XPYp64eRSrPLWdYDAD
         aIBUnK75a7mVhzQ2nLCOyrJDXzBemsu3W9jmMfrx2D+vxGuJlL/gZnvqUJUnFJSZB9Fe
         IJW/JHCo7C0cjsshOl3H6RZ/JgvGcuv/Bq6GNSpJmsP938S+2ccVqQQP6XNpPg4oTN3t
         h7AmimZ5gqKsl5f1aMmlFDufKGDhErrccg7YrRFstWR2/NHXMaimyHynPLA1GfAhQxa9
         x3+hi3jo4cd01lTOO9tEbHbqzLLyqBTuAEx2X1ty3jzfkgMSD4G5v+0tU13xR8qkD5ir
         MRlA==
X-Forwarded-Encrypted: i=1; AL+hErF3NkzTicmV9iui/4EC4BO8Q4YrdR1nmDvsRD1fr2xmoCUERI9+JKALeGma3yVEMrzuUtqjwr+AvqAOZ28=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BVX+gvtBkjImvl4wcpPzD5s0unm3ZotGGvNwWkvtl55AcQ0Xs
	8Y8KzZQrDjzwzxU3T9hP+PH0pmb1pvCUFmaiCL0mFng7BFmL+3k6UZWU
X-Gm-Gg: AYBFou3t1h4XX57U4j+W7mWON4xEAFtC+9iH5m4JXTUxSKPbc1x3MFZeh84cf3pZrV4
	Y/Xu0jNcJgQqDH/z+62JjWFjzOlDRvA4IMKvesyGWl+uoOB/fxcrokX7vNDCAzL9E20vbE1MTxs
	gfq4B+rlXuU6s8H5vPNtO2PdCxSEVG8T1UvvnTNs1SeE0sJVySmHprUkp+QcVf3/Iy7BcjWmUrc
	F5SWFJrGj4fyDXlqp2nWTu/F1AMgJkGL8i2dgjpwznCdztQ81fYAInPk2yZGTsUDHfINA37bElt
	bccl/YhbQIwG436V15gf6QLsv56pbtiPkLLqyNIIGbhaGgORKTbaS0Wt0R2IdnKtmSgr5zXFwtn
	Iyg+5DO5895Gm/7OL9JfLQO5I4L1jhAtHZSk8L39UyY08NF/hQ1K3z2N7R0NKbXVfFUO8wyTjOU
	HbCla9ddSlZGBWXrS17VLtXBrNmEX37hsXDc5ILq/q3CKB/jnF2mp4NYkVKgK8zEFdaf7LA4y0f
	xxPktDvDGV0k54MPb+JGbbZWwyrRvdeZolL5PZAHsLVAY4P9jqWNbKAsa+EfK5jX4ogWKKI6mY7
	7dS71CQ9LGKWlummo9YXgm/fn3J5UHEi0pk=
X-Received: by 2002:a05:690c:e211:20b0:8b0:6d2c:1895 with SMTP id 00721157ae682-8b392b410d1mr14729287b3.32.1794329997081;
        Tue, 10 Nov 2026 08:59:57 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393b2e455sm22746087b3.41.2026.11.10.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:59:56 -0800 (PST)
Message-ID: <85e09745-7bab-43b9-9982-4428f5b61750@gmail.com>
Date: Tue, 10 Nov 2026 11:59:55 -0500
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
Subject: Re: [PATCH net-next v6 6/6] selftests/tls: add KeyUpdate tests
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
 <179424471492.994134.1896421329544039632@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471492.994134.1896421329544039632@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> If the AF_ALG hash interface is missing, should these tests skip rather
> than fail?

Yes. v7 will skip these tests when AF_ALG HMAC is not available.

> This isn't a bug, but does any test check the next-generation secret,
> key and IV against an independent calculation?

No. v7 will derive the next key in user space and compare it with
getsockopt(TLS_TX) after a KeyUpdate.

> Could the test also check that a KeyUpdate sent from cfd now reaches
> user space on fd?

Yes. v7 will add that check.

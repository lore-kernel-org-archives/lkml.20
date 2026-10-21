Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599249;
	b=FukPID1B3bctDu2ROSJMll0LXKWKEo+LKpObtNjn4jL8zrWY8ZOgZYP9em/ego4LB9Zw
	 7sKQDnLgLpa5GaLrZoo2n2E3Aj6uR33WLy18N+uOkLMhqWU3EOmtrOMhiWALqFR7owxuK
	 LtKSdvYmLV+QImt/IRQTjsfr+WOfruUGb9i7d2GvUS4isZV/2VkjrPwKZkrtL88NbFJSA
	 dSaaoWfPw9pOhSC3XneDShQQu5M943khJeiyAWSa2LWkswGD1ag1rihl4UxcX2a0fa+Le
	 V+/SPRXLowiUNY7mtf7blmh0nkGoc5UVB+8B62gdSdFl0Tg6QekO8ytzedZIGLHZw6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
	b=xttmq/QRGwxVc5q6d6uaMRGjjwn+IJjY7eGsXGK6VQGBhNTd6t9GOf/9Wcss1bej9bkc
	 RSXwFhvUXBcFeslzgTnGSCOz+2OpW2PZBO6/dQzZS2hiwjoJBkk2O9/1kVt999FRKPAfy
	 FDGNY5W3IDyrgtNUdLOnu1tnMw3JLIyvkFJG+aGX2kNgLdrffTJY208MfEWyRKY7DVzGU
	 7TutO5ss8HCxu4yNWG7Nt+P4TflgrLTq15ewhgRkGqCXMRv3+qZstdRfI3706gcdj/cnF
	 5IPSicYMUeP4VtqXV9eZrgdc2cnQZWvZg8SqBUezHiZA2GXNGBkvD+unh30DLmoqYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eF9pnWtd;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E7606A57A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79E7606A57A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eF9pnWtd
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso258968241.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792599248; x=1793204048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
        b=eF9pnWtdEq3WSD4Ywhg2iwjsDFp5Vh0YqyOff8MBi0QVXDi4dFI46ucw4bYE0op/+c
         1F/qQIca2RcWZT4iN16zIt1jWr6ZFYOiPx9NN5cIkrrEyw+E/XH0M9oCJYdMW6cmJZcB
         HapzSaCJ6Opkp8aU4ZEUL2hO9e8FoaEavrrEuUBWKJdraCE/iHTQLPc64bikh1s7kOOi
         qkO1DWMjcGiIWvUep0Dd4+Ne6jedd6II++fSimRre7snR1dbjRqDlVKEcXELVQAlVMzZ
         bQZuTLez0kGOo5H4kRJL7y2JPFlYSN1ImhpT7FJeSe53zlqDA7XbhzQw8/s4+WdLqc/T
         ST9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599248; x=1793204048;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
        b=sQwBzGiImqNdFZWSm2UAZjQFYhF+RWz9dq27ByxFnmDjHHH91MyPwoiP3bAvZLLGrf
         nxCLpWd8PFIZ3AqtdKqN+dHFZsbGoyfoINUInerXBNDMzxsw8fP/xW3YC+lOAWEfbQ8g
         6tehcC5JRJyzDfR15UntDUE6PxtrFOKD7zdgcGFF94J9YirApcwtmJtoCEq8hfr+20pg
         GNLfA4HMv8xuWZotnL9aZL6DQzbpDj++rVJvI5DC5njEfFMFANGpFMfblGjH+Eu7cpwe
         9Uz3mzZP7iOYF/SbxrE+HCFgCxHGKH6kNTM1Zk4cp+4Mry/3DoeF+pnkZM9wr4/z8H2P
         2WzA==
X-Forwarded-Encrypted: i=1; AKwUvBwky+r1l65AwI3pdqtTG9XtGivLL8CzA4BtUgGgaG8fQuMK7FWeg6V630MeSssU4HiqxupHOZSdRfZ43bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXRrgW20yWzOPXvDfRR2zs0stIi/Y12JO4lCBz65sCXTOUOK3m
	ZC8nPkMGuoryQGDV/DpvrUClkcea1SKAmb+NDforJ/lCsKv2EIe1Xf/C
X-Gm-Gg: AYBFou2dofStMm3gD63lBR6nC9bQPwiW0OQBj1RIAMt0+BgIro6WnRc9Ga0jgXZvnsU
	ZHSnZcO3zRpMtZdB+4TKwuCwrtMl5sS91dWYJAvkx3QAbWmn9YoK9YuX4nraiSfxazUSSQpZILX
	Y6/LMO6Hu9YakLlD/yQnQC4UXtNmBwrDtiX/OShxuSI7p/Hr4o249yuvXzWKndJkYXYiBSOoplG
	OZuFadbErI2sDzL2FNVxkkx0onLy9p4FXICfEWzGK/+x8WPPzIl8kxpl3A8L2/YQdL6uTDze8sd
	u2xZAUQOIo5pgVtspZSTk6qEORhJVVZEH60+Q9G5k6wjPkuqlmWfr+9X46n2DWc9gT6QCCIlISY
	gPTqA3fRnW23qr0oGWgYENL3qptGv7J+MxXsgdDoPmWvjyn2dGe0CBBTCxSbOHundKAH2S3lWMK
	cM+1aaaGMWwCkBpLE0dtUDTy5GfacPxie6I5VZQWmlUfJoD7o/6TytNxsqB7xxpfa3TGVdYZIec
	KbNRhvpx2PmfKOshllokVHTnjjlSBrRQQOoqrKWI9K5C4z6f0aBkh+++b8J4vQWnrMXjbw6aWT3
	lxWejSLCnuxiqhDTvgVmJERG5PqAQizetiYfLGQ+PPqAFmcRH9ZgYUg9WCjNYLgtz+7hmLbkoLU
	TAJKBU7PpU9qVqvjG7Gto
X-Received: by 2002:a05:6102:3fa8:b0:7c3:9a14:cfdb with SMTP id ada2fe7eead31-7cc926820ccmr912621137.17.1792599247553;
        Wed, 21 Oct 2026 09:14:07 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92327896sm3196621137.4.2026.10.21.09.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:14:07 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:14:06 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.311d7bcc5fba0@gmail.com>
In-Reply-To: <595385b672b5411849d1defc78b68b25a908a77a.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
 <595385b672b5411849d1defc78b68b25a908a77a.1792565282.git.mst@redhat.com>
Subject: Re: [PATCH net v4 5/7] net: add a sysctl to opt out of virtio net hdr
 checksum validation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Michael S. Tsirkin wrote:
> The ingress validation as implemented by the previous
> patch is stricter than what it replaced: GSO
> packets whose checksum metadata matches no transport header are
> dropped, and non-GSO ones get their checksum completed in place.
> Such packets used to pass with the metadata unvalidated,
> and with no overhead.
> =

> I judge that this should not affect any deployments, but there is still=

> some risk that it does.  In case a deployment depends on them anyway,
> provide a per-netns switch to get the old behavior back:
> =

> echo 0 > /proc/sys/net/core/virtio_net_hdr_validate
> =

> The default is validating.
> =

> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

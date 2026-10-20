Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524508;
	b=o0rqO9WCdkK/bYaLGZIKGlye97N4uTWVkzYvFlHORdOXsEt1fckOvxo49jyaN13rPcJM
	 bZKP4l5PObdP8fW5GH8YmbAQ5+OhphQjV4bCJgOoXtCtzEEl8r27U6o6qq7oS6BdOan52
	 xQ7RMRBfIknhbewSVwGlNss5Z+rv/w8qM7rxko3p6OM1zoslcH49Kyr8xwndU3Ln1WmoE
	 T1gbjhZvoyQS9jxiFVfOAj5djANLSxJDrwiuMclP1z/EEJ3u8rJAcaXXi6q6ht0kUrWvf
	 JiWmeHLn5He50OrFh+vujPkXonCu11EhCbMwGQx05N+QgfZpHnLvweYw8jwltBvWWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uM5DkyTcQcIY9+zos5+5Y8SpLbQKEPMCEH5xBlRrlEY=;
	b=LNF+AYM2aWcx1bbj0R+Z+31rVC67V7GRKtxiqRbtz+ObyrXN1yWhcKGkXLcEvZPAnUTO
	 gLTxrAIsMyyRq7WJ08jyOwYJRMc1jH1//+kZZqDbsMEs3bgo4PUT78ZKvQbNMN1V3r04r
	 /gdCSjaPTZbEkbfmGOnyZeLmzeDxHvDMInmmcQ3/cUDtpw/43jdMNNcAo65RWvEdCtrKb
	 LN5gXhodm54H3NZYPo0YQ1mUdl35/thuH6ioEAISJdVHay72Fg1Jx7C+UZj9LIryL6J54
	 4EJ2eqpL0quYx8vICSeZjdMll81Xpo4c2jnLOa2OdTuZzdyGMSKWzdx7hW+Q41QSBrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2E1ue5H;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D00606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D00606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2E1ue5H
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c03a445cb8so24708137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792524506; x=1793129306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uM5DkyTcQcIY9+zos5+5Y8SpLbQKEPMCEH5xBlRrlEY=;
        b=a2E1ue5Hg5bqgPpmq5nvqEsF82upQOZJBFhKzHKklpzQNWSNnH04NyUDBNxhLCO8C0
         P1cPq2mGkloCSOsEXUNAo9h4DtNZm46J4JIJPEY8A9rckYylLP8KCZnaoJahMS2qjYUk
         p1JTU/h4WJeZ1Mbs7eRYVx1cqpMMW8Lix7XS8t1hoPdYgFXygYSMP27xEMgv31afbZU0
         CHi2TG1s3mmfcKCH2XU0VEd2jRjooPty9d4De50P2qqqvCkPnShpUdD2oVeG6FR5O2Q3
         LzWHcJM2nhzrbO2EKhPwPms2iztwlVGQgL5eR5M3YDlqulMQzEe6Yl1wS5hdiS80xUP9
         1VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524506; x=1793129306;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM5DkyTcQcIY9+zos5+5Y8SpLbQKEPMCEH5xBlRrlEY=;
        b=PsDpmT+DEyhuFwSDgRNvL6QHVgKi+Hm71TksKdOGlepUDn1MNE2qRX8EudqedQZT7c
         rDwZERgQ0awjTZOnZYR/t03yE+Mof/RGHjMkZNMEs6VN2xjW2bPd6PXzmXMYcm+zgbkM
         EHGMb/gXapqhcMAXxWgZ453VUd0dxa3HU0gtI0neUxkR3mva2BsOdaY4dAn67yiEpDMr
         bsC8y8VqTRHQBIMMFxlN6do0KpIzZiAxSoNmAa2CWpby9Qgg9exPqhjuOy67Ml1wpQn4
         pfiScdD67O8sor3cGG46jYfWaiFD3ar2RJsADbe/XIiZFMEA2X8yVUNWhlyMHwFq6RDt
         Rmlg==
X-Forwarded-Encrypted: i=1; AKwUvByyCXl0RRdlZ2QtSwsmaIOvNdeKgXaQGHDEEekcB1Y1EntmqFyvjkbCcxq+GpkYa6mo32ueWogWKJ4oi5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqQgs5kBsWT0oWcb+deljHipH9OoiLVwY3gVI7u90Gx+sIOuCu
	HTuqVuz6FeVqTeZBkBNo+7NmQdKSnu7a5SbSMVs8vYJ10d/+u9CKDRee
X-Gm-Gg: AYBFou2h30bRU9LW9mMhwTRLJijuMhkR2RhJCXdHKyhqbT4CavVYvu8Sh5rBsOCJwBE
	32jVykxX2RsgOOmi5wX+KczEOhp/aDu1LJ9+M8W49RpSYLLma5foNvYEaAOrquPImwaXzSm8qJQ
	pTkxoTCbOnqd8vq+qFSmPZS39cYEAGvdx2DinVaH79BkltRaCqIlS2a+EKz6tKrVfzzz7ZU61lU
	wf0T7J3F6bC66uhPXoL3LsqXGlNgdrAzeDGhs9xJ1zUO3jZgj0B5TD20H67Hddmq791Ia1Dn8dU
	kHOCWH7F9tlZjfW5izvu8q+7OVbPoYKS3OQhNvk2lyVbkW1mDzq+cxgYk8puSXTOxFkneqXMc/u
	pD6l8nNbR4W5Obeql3Qb5CgOj7+cxpMG8yZmTP5GeCekmrzfizaYRNqZuZkL1TctqZjbnNUNl7R
	XPNVO0iaMQHebohw/fskBG+CPPLQ4oq3HLxkxot7aE0n3q1DGRR9iCwYT4h9rdOjFrQptm7vdYp
	OtPFea4rKiSuGrTf7q428uJKBwsbvsqk6S+CTgMgdlBOkPKNrZ/u132BlCDUaGSy8RUso+1lKRU
	gQn8yOrYn1yl+nOWzHxgjup1ov7k20V7/PaEdg==
X-Received: by 2002:a05:6102:5348:b0:7be:3766:9062 with SMTP id ada2fe7eead31-7cc9271c22bmr70477137.27.1792524506671;
        Tue, 20 Oct 2026 12:28:26 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc924348c4sm207823137.11.2026.10.20.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:28:26 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:28:25 -0400
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
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 linux-um@lists.infradead.org
Message-ID: <willemdebruijn.kernel.317e66c2e17bb@gmail.com>
In-Reply-To: <554a7cf11f82676fcadde914c7044dcad9bbd0b5.1792411304.git.mst@redhat.com>
References: <cover.1792411304.git.mst@redhat.com>
 <554a7cf11f82676fcadde914c7044dcad9bbd0b5.1792411304.git.mst@redhat.com>
Subject: Re: [PATCH net v3 2/8] um: vector: honor virtio net hdr conversion
 failures
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
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> virtio_net_hdr_to_skb() refuses packets whose checksum metadata
> it cannot make sense of, but the vector raw transport ignored
> its return value: rejected packets went on into the stack with
> their metadata unvalidated.
> 
> Propagate the failure.
> 
> Note that a follow-up patch will modify virtio_net_hdr_to_skb()
> to return a negative value on error and a non-negative value on
> success.  This is why we don't just propagate its return value
> directly.
> 
> Assisted-by: LLM
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/um/drivers/vector_transports.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vector_transports.c
> index e1fb2a76fdff..8b7548458663 100644
> --- a/arch/um/drivers/vector_transports.c
> +++ b/arch/um/drivers/vector_transports.c
> @@ -210,7 +210,9 @@ static int raw_verify_header(
>  		return 1;
>  
>  	skb_set_network_header(skb, ETH_HLEN);
> -	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian());
> +	if (virtio_net_hdr_to_skb(skb, vheader,
> +			virtio_legacy_is_little_endian()) < 0)
> +		return -1;

fold into the previous patch? It already mentions that it covers all
cases.


>  	return 0;
>  }
>  
> -- 
> MST
> 



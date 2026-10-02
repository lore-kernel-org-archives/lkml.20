Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811E2236EB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956320; cv=none; b=bMkBx/Sj2fxuBIBcl2cHwY3CYW8ppBz93/lzraU1CHmKwhR2nm4LrB6g6QqFuuIEorRhBNfcPca0peK0NLF8P9q/832BkX/xiX3AB7glZAzyUMLq/8ZYiKMC4HWaCOjL4GZrX6079Wh6YOVSA1jeJ+WXtc4Qo6dd6UDNGA0wGRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956320; c=relaxed/simple;
	bh=pAdbd5oNKYolkRPMipRW3CRkFm2Npf/kbRnXmTveOvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyZ59LHK667toj5jo/5AkJH3awhUGPN8V8O6FiWTQ5T2lneiPOmnNwFvlpj1/Rd4ZD5LIjFwdGXzA1Iynn8cc973g/9m8hDN4ibWqfDIGB+rgocL9gf0HbE12qUJM7tBUJEJGMwpEX4o7UU0UsNF6tZrOi7cWK2BOk11NiNK9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VkiuEpHm; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VkiuEpHm"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e30a06b59so4454566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790956311; x=1791561111; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpdQsR3CN4x5VZvlzQs+4AwQH09AxXpGs8Q1TofsmI4=;
        b=VkiuEpHmE+slPtZ2gTWZi7VRlXYNFssazCqmfrD4iErKePsmHLl3tAR17NNwUM7WXo
         /KE/CbKu/ru6Wbq5AYzurMj/rpoPQNOkSoV8TJ0YYOvhgx2bFmepQg5+ggbjAqDRkZRg
         HZaG6SC9pSvNNCljXNLyTQt5P5+8JUnRDC3Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956311; x=1791561111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YpdQsR3CN4x5VZvlzQs+4AwQH09AxXpGs8Q1TofsmI4=;
        b=HDAMNvEBuzvMDvlkmqYhjc9sJyAKUmTcMffwAAn49uw8aXmFTiN/aMW9dAR9raqcL3
         q2uYzkCdGXeiaHOHMZf+OIpKzLRuRMfpLP4tVJtbgWEuGtS9mpmYwVVVg7hEklNk4fMa
         wN4pAqQV9p7tZN9hXXLxbzEhkUDzG4qcQ9mNa2QvUuRBRN5QogXCSxFyU4MLiVaqXXVJ
         VuCaGOIv63p0Sk+aT03wXsi1M3DmOfRWpCjy1Iu+0m/PkwtumCNcVVfGPTpea9jITth3
         dwNx7sVwF6IRX+C//HggIe4nfhPKOGWHCmOKbkJA872LitwaIgxu0OjZenTbMzN/nrnq
         BpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLVAen/Cl/alpuL2yzPDyZ9Ez4qeWUxWvJsvhWRojIr8YvW9cTWhNKug+DH6TJibSPNHXuSwsFf+KZyXM=@vger.kernel.org
X-Gm-Message-State: AFuF++nLx+mTjmDC4FLXoICCxGw5iHPb2d3yeRN4mVUeCUzqTmVSUNBd
	XnrmKra+z3O6klzdhD9tsfwzwUdaNC8tomXYeR2or9HdDPNShzDqLAiSs3mwZj1oCjOhXkU63HJ
	AKtrzOD4=
X-Gm-Gg: AYBFou1FIUsMYEPiCGM86HFgudW7j0sXojLPN7uYZZUS0mQAbJ0EXZO6L6VUTb9eeKW
	tJpAFr8WwcoyTbud+s9DI0anf7K7QEvIp3Fg+2L7yPlD+SYDjfWQBV49zYOj17+de0mYD4ucHQA
	dJ4TfaZGQ84rHtQTxcEBIvx8w5Ay6YYiNj2LJYPHTrPqn3WgZMnZ5rYC5+9k39NdUGDAslc3ng7
	k1xOqDUiRn8qKT4sbHS66ACZT+cpg7HWJhQQJFPa7pJwJa9G07v5xy3Cfg1bmkXfafxAWWjP7EC
	013EujQ6TQQrJYwDgrsBhl49kDnsXx/5eU/0ah+Zxta5L+tQS87dV7six6+zJh4r2nQTpZvh/oV
	IKr+t8Atewe+6xlgZcTXjzumHed25rB6qZ1nfHkk4ujSxC5Fz4Bmjah9FSMvE1s/5lYbibzZecv
	zZh0JIf3/yJtOg2trI/A7n++2ELbxZDgM5z3n/F24K8LiMT9/krjlbRzjzjdhaRORgAoAaKu1D2
	aJChAKv+Deqb+45jWQAYnrQ5007GDv7HYM8uga57hQKiRZJDg==
X-Received: by 2002:a17:906:209a:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c2e5c66c484mr100066166b.30.1790956311500;
        Fri, 02 Oct 2026 08:51:51 -0700 (PDT)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com. [74.125.228.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4e06d1b4sm96871566b.6.2026.10.02.08.51.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:51:50 -0700 (PDT)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1b09e0c7so4938466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:51:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFEMZlyGB6oDj5+QHfBQygPUeMmayoh9B2KaOoXslqICifynwFugtPjiouGto8teITHpoVQZyvTPu7x/8=@vger.kernel.org
X-Received: by 2002:a17:907:720e:b0:c2e:3e3f:e1e9 with SMTP id
 a640c23a62f3a-c2e4adbbb17mr251802766b.18.1790956310475; Fri, 02 Oct 2026
 08:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790917676.git.zcliangcn@gmail.com> <62774f8c6cbad549d1a95f88df99ab7745d7f6b8.1790917676.git.zcliangcn@gmail.com>
 <CAL4WiiqWwV+8JaYjsHrWDvoSt8Ng01xs9Orv4xhRpFAvhMnD6w@mail.gmail.com>
In-Reply-To: <CAL4WiiqWwV+8JaYjsHrWDvoSt8Ng01xs9Orv4xhRpFAvhMnD6w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Oct 2026 08:51:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDjOnUUVjJsEgH7=N5yEQTcSTuvHwaQJjdxkqgkmBUFg@mail.gmail.com>
X-Gm-Features: AclHuK_Y-fPHErB3_u0yNm9tslRbegeI3VlXWVSR7cqqfdTO-_AY2cxpgdLmLUU
Message-ID: <CAHk-=wjDjOnUUVjJsEgH7=N5yEQTcSTuvHwaQJjdxkqgkmBUFg@mail.gmail.com>
Subject: Re: [PATCH net 1/1] net: use random salt for netdev name hash to
 prevent text base leak
To: Eric Dumazet <edumazet@kernel.org>
Cc: Zhengchuan Liang <zcliangcn@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 01:20, Eric Dumazet <edumazet@kernel.org> wrote:
>
> CC Linus.
>
> It seems this patch should target net-next, local KASLR attacks are
> not a serious concern.

Correct: local KASLR on its own is pretty much a nothing-burger.  Most
hardware effectively gives it to people one way or another through
timing channels in ways we can't really fix. So KASLR is really only
just "some bits of randomness against remote attackers", nothing more.

And yes, filename name hashing shouldn't use anything really secret -
the filename hash is much too simple and fundmanetally cannot be a
secure hash - that typically you shouldn't use any *real* secret
hashes for it. Using a NULL hash is not uncommon and typically better
than using something you actually want to protect.

I think the most common use of salt is the dentry pointer of the
parent dentry pointer. Which isn't great either, in how it exposes
bits of a kernel pointer, but it basically ends up being similar to
KASLR: at some point, local kernel pointer values typically *are*
something you can probe with some time and effort with timing attacks.
We try to not expose it willy-nilly, but if somebody spends the
effort, they can do cache and TLB probing and it's not "cryptographic
security" and never will be.

So yes, don't use anything you wan tto keep *really* secret as the
name hash seed.

               Linus

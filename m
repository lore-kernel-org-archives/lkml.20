Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AB3A9854
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926516; cv=pass; b=RYFpaL+fiJUjRFlMsSmvMJ05hhvmHYWZeioH5eCkjc/0JLQXLqS9K4soDW5edUWQub2BY4KjnJACKOOr2CZoyQBYPsPLchYR1mQ0kh2U0lezJ5Q1fjyz3PEs8iqAT0oOcQHmFwDJnDU3Yjb5xeaV/QcETZXJY2PNG9F/xJHypy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926516; c=relaxed/simple;
	bh=SOA/vUAClX1o4iz9M+rLueQm3cnRTU1OGcw3mAwIki0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBe9XdTbEYCHarXpXjDu0qClGCnpcNlAQZwlGzk/jl18DUsQSEZwiTlAQHWJbMXCBjI/SUwTk2cbVVkON3uoFhypMhtWIUQDRAFBiLcgoBeHre9AjTNPPWCv7/WlRA41HyNRy64tos6g/iVM28y8dKoa1tHHHrSUVgn34pS9YG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLMWijyf; arc=pass smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLMWijyf"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea9118159so1540230eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790926514; cv=none;
        d=google.com; s=arc-20260327;
        b=pKQ8s5iED0h3CF3scEPYsHkU7YHiu/ESlU8ahu6XJO4Okf+ZNZ1tf4JSIxKhqgGrV1
         InvTW2JTpXtK14OTx1trr/W5NvXr0qHeJgbt/cp5lpd5pTjUbSn1cg2BA3wrLF7gEN2u
         kavbhsG9JY83WwjDwQPA8jGS+KtJ8yH38Sh5wR9r6G8U4KjhjI//fcY0QFFHTw9JwWQN
         ES7qYsoB1+CTBWgmycHbdT+M+/I68Krc8z2l5nibvozTXOHfrU37iEWPIg/v7OKDy3sH
         OX8e5jylcxZUw+IropLUH1dag367yEIX7rcTrWt5JTM4k+RyCSyNFYopPB+EbCKtoEnG
         vy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhYGQBrnZzLe8qsfJn+q2bKi7SfmwWl+6PXpp9jZ3GI=;
        fh=KwTCCoKmld3+8kmhBV4+ByD0b3eYKPaLg2yXK7DIxiE=;
        b=miNXYbUxLrW9adjf65qbLxX5xJOFf/OTFuQ/4yNbh3HHXoaGPLOxZKKK5OKoSsnN58
         gWG06KCYZ3U60PhLe057sMX0wTBh72l47CJZqm5RlR8VSHYi07RmOrKQEXYx40HxYsBg
         7vaNYynh+2NsuJoCOHonh4L8Mxy/pJQeJSCK0+s8jCu632dqLOonXZ8QbGa92FNRk9Dq
         JY8c8+sqyNOLUwJ7oPQlQWowH83cOErIPSGJWUliINnfA3/nb+9AbzNNUgLzj5gF4la5
         mkGhOWZLFd+T3X+ZIk7RTYz81UTBTaSmS8YLdZSUethQJWYSbl9G7cuUoNboZw1g32KO
         KBcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790926514; x=1791531314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhYGQBrnZzLe8qsfJn+q2bKi7SfmwWl+6PXpp9jZ3GI=;
        b=WLMWijyf3/qr6F6EzoafTw2i+h7E7Weq4q/XEsekiUsvio1txU13L4kq6e8saqbBEC
         njL5IbqK4mhZp44J3h8aI1eBrNNW4yeALzgcpx55195LmIcRnMfHUIErT5pFmNHMCwGl
         KozW85uKf5GrlwHwRBr85UBxQIub1m+cn7CuTOIW4rxktrLG66R1tcjssz3eWAVD8JXO
         Sp3m505TvlVZgyjpmspBFnvwQNKVNm4C/NAMJcyDJMn8UNtieGijjND3eSpbMNF6An2c
         4iqP2Z7PoDND+IrJpNOv6b0KsfMF9OQbiUBqyff7o4cAix0AErpUH1kdCOopo4shVloI
         ughQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926514; x=1791531314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhYGQBrnZzLe8qsfJn+q2bKi7SfmwWl+6PXpp9jZ3GI=;
        b=D/JaxvyZ+rpgvi0R6Uh8UtCerQsreRC8a1skn6XIUjFByu3rsei3P0wcnhZD25Qvuo
         eKtXX0WL5hfLGCUjbHrTcilXaHjimJBNnE9pSTGACo1+22eD2kXCm9BZrV5TCoUQ2s9p
         pN48po9rEuKgKMGABmdJ+vJbrm+tUXhfayGIv9/h1bIR8+0ZDd2EwWo7qZATQw0NICqS
         fR7AW22Szgl2qplun3VSVkH2aCimvJc1M8sxkI3FokzU7eolzLIh9MuQaI2rK/LmAnkP
         mqB4ihuXWR6N4r7BSV0qikLa753EtF19PP8ZvybUIL85SHAIxIaFALCqTljkZKU5Em0v
         olYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx5hvUEfRxRhWPqlIvHxoDKGFpVAxioKVtSU5aC9KxPvj/3p4eBlRPOoRAU80uQH5MG7h97JKnddsHv9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4j+K0HgvFCxbdwPc+hUr8vtsg2x1z1WibSpAUpZQof08lrJw3
	OmaCIxK22p9EGENwAJ17/S106uJC502fwtD4/8wtPckBUfRdEHrQm+fOSqwe5CZGRIgiN1ViZQG
	TJKOmoVg9x4O6RydVmHWyv27RH941RD4=
X-Gm-Gg: AYBFou0Wy/1Fh5C8A81x/mNSEdaoWgSmCk5S8YDcruFragBUaeRdsvicYyNicRTit2k
	X/6ktKZJHTZK57Gt+iOvMRmZtOIWl8Pe6abxfdgt7jtUbowDEpY6JF9fcdDYAR74JYcHtwOs1T7
	fGobpo/TQAl3vgznG6r/VpjRRXI0MdtGB+PaeX0tXgtT00wgCD2Atuj6LpaO6VgNAwphVHupwb3
	GJq4yzigb9ztupMHFJ/7ecSVNL3Zw60uWxol4PyiV1IxkgqUJNWiB8fpbQ/Si2cNU6RuljQIIRl
	s3LPByeLbg7nemlDymN/xUKeiZnBmzDhgMOF523YmhLLSL/xPL99g8N2fYHb/kBY1PZD
X-Received: by 2002:a05:7301:618e:20b0:34d:861c:99b8 with SMTP id
 5a478bee46e88-34f150db8ffmr2092936eec.21.1790926513945; Fri, 02 Oct 2026
 00:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790917676.git.zcliangcn@gmail.com> <179092437135.1402591.17012333474783660749@kernel.org>
In-Reply-To: <179092437135.1402591.17012333474783660749@kernel.org>
From: Zhengchuan Liang <zcliangcn@gmail.com>
Date: Fri, 2 Oct 2026 00:35:02 -0700
X-Gm-Features: AclHuK_NpBMd08Qkv6qa8LjOg0_Bl2th9r6S-C4LVEqwsBQsirKBOThonGult6Y
Message-ID: <CAOny8pvoKn2c9yHNuek_D58td5Uq+K9NLfguT43rYYwE74fCpA@mail.gmail.com>
Subject: Re: [PATCH net 0/1] net: netdev name hash leaks kernel text base
To: netdev-bot+sinfo@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:59=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>

The issue was discovered using an LLM.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

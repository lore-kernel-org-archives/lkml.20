Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7D4577E5B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970162; cv=none; b=IfkEQKiahK8t86PId6/NThWEg3m+RhJFqS3/kMYG8CfQV4e0pY0DDTTgfCbw7ewkBI++SM4Ss/z2MKLUFhekY2ek2HnFxpcPdGTGzp93w6wly9aj42pXKu0K4dy9XIsJP1J/kBz3YofMSDHd5gLwXtp0mc42/k5AJUZquOb6RZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970162; c=relaxed/simple;
	bh=eAly930iExSc0nx8hDXxCQBEPYU0uHos2zYVFXGsAlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3Kzo1qYNiKlJZ2QRm+85Ke77SyHqFMywZ7fHy+YlKWVLnBH1h77tc0MEdtDG4zylHCR/xEm86+fF47ABOZZyD9Y/QGZxbZK3byxEfXxXi4AFU6UfrwuQwv2uPLISZCJbjispUgRjmhAwCaG1CrI9n52g3gchg7cx+TmzEgnTaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=WrruB8P+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="WrruB8P+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1a5b5eso1902705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1788970159; x=1789574959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SU+Vq0Ts2ZBtfqXXPBx43tPtSAYvdfKOjWmn3OOcizQ=;
        b=WrruB8P+IaN6NIa/n6Khcj1Za4dxN1CVr5op6iFKqpXz9ei1ISp4ZJJ693p/jzli+B
         Y1wrCd0208HAcu03sV9Ng6skQQBo6STLbUzf8zyynNikrmLea0t1+F7XC1OgGzxc5N5/
         PSyZ2P/H1tYXbd5+gSBQxWI8LvcYRBBgtcwRXUsf7XQCrbDTyArxoggxEX0tfL59/YIL
         F0szpGdUMrvLDlkIHaveW/3rxpUmrPrWROVn2FRUyocicsRuOb4akAHDIruPJtOR8h5O
         5a/dnhp7rM3hl5xltnRqhuQP2sWzsBWMiWb4vsGm2uzkzmwR0NEItsDyPgfsrs4prDrW
         O/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970159; x=1789574959;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SU+Vq0Ts2ZBtfqXXPBx43tPtSAYvdfKOjWmn3OOcizQ=;
        b=Nda9p2HX3FRVYdJzME79fLFM4DoFYs4MKA7rOvLNw3F9fMGB32UOm2aZq4FGC5qcpR
         SFTnuagTozUATnt6IKnpJB0rUScErnl47xiCk69TYScMCEKAg0QzVyPwQoCqu2LjD6nT
         9MQpPJ16x7GOrr3kzBkINM93IElSbTNC0J/BERdXPMmOXqmca1XnVJAstE3cnW/iW5b4
         rmPI6IyTRaeXlmIy6sXq3OtFmYuSYxleNM9aApb7rMBdW3MR/IQWmM+3cItQU5RPFfWe
         /UXiAftP7mU2/KNx0hs0K8vrATdRrF5nCF8OhErwz9xKP+ReUNAH8HqRnchv4DzjDi4m
         iwOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy46zL93/38sCjtkZS7LdAxsLoz7AF9SWgJzo2rwm7WFHDOie77hYP1mNXm9kUNe7ZFO17g9lqWOHzxans=@vger.kernel.org
X-Gm-Message-State: AFuF++nL142f++GNuU5g5mccjgkrAx24TXRgWun+m1aFCJJQ1ZLBv9+B
	xa2iogltDWEZNDeNoQdmHwybig6aOjvCkNdOfLm2Xucsmb4wr9VVAZqMsTTqgARKHMA=
X-Gm-Gg: AYBFou0eTL5J6vPmqrpauvhMuD0qkuhj1n3Pl0JsbJxRrzQxxz2Z2cudnae2CqUGQGU
	buTQBaI2CNfHomZAOP7jVWW6Ndj7nGF8I2NbFxm6jtMrGAAgLQo35X1RZWHkP9D0WiwUNn354zw
	GVCPYR4MInGgi3VqdcnaolZKeSkMfplfLyWmMGq78XkJPZ4F73OO3qWEbuDI89azdif62shCYX4
	dv3ewzcrcvlvAgIuKoc48Eoi74R8nzjk6Asgn+puO1iyqqeFlYtJlPpU02qMJsNt4MdtVA7KGhX
	VkzQaZNcvMU/46SMbE0jcSBvnPMb5GlVoOlXLYSzpTtcAw+2TAr3KRu18ob/kOUN8Xmszbd99jC
	jX7Msw+6qvm3nS1y+RFIKQmJFUjtXlbjCLHSLpcjSmvb1mLuiBXG5d+LUBLavbgYM5XnH+KAQfU
	HW1UTYE4S/SAwtHbWbSWq5oZ+Eq+ncYufcdM+os+iABu8XhGzts5FmcgTPxIdYc4D7Bpq7mdOEi
	nELDEVCktcPWX5DlLpy6Kqa52yuixhi8xlSGsMtERUSSsyo++m7
X-Received: by 2002:a05:600c:c494:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49d010c2a57mr266347345e9.0.1788970159014;
        Wed, 09 Sep 2026 09:09:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm746485e9.10.2026.09.09.09.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:09:18 -0700 (PDT)
Message-ID: <a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
Date: Wed, 9 Sep 2026 18:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of
 target-netnsid
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern
 <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
 <20260909133247.113923-2-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260909133247.113923-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 09/09/2026 à 15:32, Yuyang Huang a écrit :
> The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
> declares its target-netnsid as s32, but rt-addr.yaml has it as binary.
> 
> Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
This is a fix, so the target is net.
Could you submit it separately?

Regards,
Nicolas

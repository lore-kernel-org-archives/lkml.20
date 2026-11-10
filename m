Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291674;
	b=uknTwDIZLZRCoXDBKpSuCOF9Bj+W0eTTEtKHkjZLW9W4b6IDLAa/gKMMawi2a+5YyefM
	 fVVtPs6ZWMooe1bJR5rCfsgH8RpkaD0qTnPmvWfB4KWtnc3AbAORkjQOrOp0yGDOpRqBr
	 6soXncHhi6eerM7LuOxjdUkSPBW4uaw8syio5KLdDxTveN4eHs3vl3n38nXktvOK4mDkX
	 F0B4Qreb1qmN6/vodOs0VVm2kVxJLp6sMWz8bBpfkOw5yJxYWgwq4ogPMQWe21OcF1UYp
	 cN1rA3rsxqA9nxg0JqrLY6JEwKAvG/2rlqk9bCqM5DUs5wxI1omC4RRW4JIMHNPBCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vK/1Q5dT+k2qL7WE6m9fO9udcHutWWbhzuslIdYzoP4=;
	b=gxHOel3n9D6Tnss4QpApMtatYE5MQ0Eei06WL0wkSfUvkHlYZ1AmSvRP0i/mGuV19Ccp
	 TZtNPsD5V1fQeJRJa+ATeVS4nlbPzVXCvIUZpIxiQQqN2gdWH2x7CCL8DerzyNujbOGcS
	 L/p0TbgJlVuEIDWzRWmswbke3f/X1PVSXvxZr//GBhqtCVS6uD6HVVIXeAkMSrX88eDe7
	 pgzbVcX/W14wJp6/F+QBOz6PxV8GxqtvIBmapA+6gy0ZQ6tPYUPI/CK6phFLUOgZOpdKK
	 cF2vE5XcHKhm5qKAIFwqTncG5zrsfwpc4nAtHV9v+TFI5MUvBrL40WRc4L7StA2VmMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VaSaZa8O;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E71606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VaSaZa8O
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso1632879a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794291673; x=1794896473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK/1Q5dT+k2qL7WE6m9fO9udcHutWWbhzuslIdYzoP4=;
        b=VaSaZa8OVQtBsXUaruHulCklkjbhXykKUdqCGpkbD7wQvKwFM9accEXzR/wA2DxujV
         R+hTr4/RtH34Yd6vIGfhXmxTx7PM16YNP8f/VmmKSW5sAZWeA8Zxb9Bv9IgzsrnM+RAk
         o9egYlRj0QlEqajSwAr4H9Z0DHmsygrNQAZ5pcUocLyUwftb+CBqZj+JTU/c1DrkHvHw
         9Lv4b6RZ6XP9e6hmEXChMhb88/NYNby1496EoV1Kz+CDplcJ49LEWfYN32nbnmHE2k29
         0m2fKYQ0WuIZ6fQzKQKhqZETLWOIfyQs0AB9fsweBGOdWYpPNXNjHV/JeAgWcuq3IqWD
         7dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291673; x=1794896473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vK/1Q5dT+k2qL7WE6m9fO9udcHutWWbhzuslIdYzoP4=;
        b=ZGbY0A8JH7Bgy9FsnEHfkUXM1vPgtTG5UUlfehreUFJskbxjPiX64RHo2ULozEhK9f
         4NG0SGtIxyKPoNxQHDWn4ziTazUXfvzq+4trxOjZg6jjC/wH33gCDXy0AKmoMIOr6qnT
         iUGAkqW0xJW4wTtY57/V9FCiLnbwd2bGXErBH5NKNFWdrIjMypUa3dA+Oi/pQFDSj/8E
         vRINJENs9LJP/MBnpaeXY0ZJw3Xie/Uv5ICw2xW+NW6T06sbfyvmwFGy2A7JDMkidgb5
         haWl0488CGQ61tK2/KGsQGmmLG77XdfvR9PMACBD6+XNVD11CH1+Lp8XKZNISzfUu1Sj
         b59w==
X-Forwarded-Encrypted: i=1; AL+hErGEd49xCES/U+xdlED5RzHtqWgd2/J8XR12RLSINQb8alIkALPNw8/NsKcCG7/YcaCDv0jVKye/P/SVrcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88Nk749kWB35YA8MoscRazPgiv6jefZNFnjjccCKryCA4O/ci3
	rru4CkqdCjsEZrkh4cqwC4wUfZC0DNy/GSdHSwf3ZWG+r9ao6v/6301VjoZHRggLxWhwaJ6rmjE
	QEy9mQg==
X-Received: from pjbrm7.prod.google.com ([2002:a17:90b:3ec7:b0:3b0:ac19:f886])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8e:b0:3ac:9ed8:f30d
 with SMTP id 98e67ed59e1d1-3b166cd0101mr2004963a91.39.1794291672832; Mon, 09
 Nov 2026 22:21:12 -0800 (PST)
Date: Tue, 10 Nov 2026 06:21:12 +0000
In-Reply-To: <20261109092016.2082-1-lirongqing@baidu.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109092016.2082-1-lirongqing@baidu.com>
Message-ID: <avK3zITXAK1kVQJe@google.com>
Subject: Re: [PATCH,net-next,v2] af_unix: Fix wrong socket tested in the
 symmetric half of unix_state_lock_cmp_fn().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: lirongqing <lirongqing@baidu.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 09 Nov 2026 17:20:16 +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> The second half of unix_state_lock_cmp_fn() mirrors the first with a and b
> swapped, but it tests b->sk.sk_state again.  Since b is already known to be
> TCP_LISTEN, the switch only hits default and always returns 0 ("no order
> known") instead of 1.  Test a's state instead, as the first half does.
> 
> This code is only built with CONFIG_PROVE_LOCKING, so the impact is limited
> to lockdep failing to validate this unix_state_lock() nesting order.
> 
> Found by AI.
> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks

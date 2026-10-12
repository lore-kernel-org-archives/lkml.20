Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C63CAA55
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841782; cv=pass; b=SsJTnepkC+E0R9IX6Q8gP2agBw5m0cmqQyrySzeG5W1dVA3t4IWcDq8Yk3uQNK/xxruqgnh7MidoPqwH94BOWp/FAG89LV07AqYs0ESQxu/Eapt9+rB6t/ptgNEUsIL0HgnuV5jV7YkmBfQPQzkWkWIP5Gaqtsk24wrHTkhQqGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841782; c=relaxed/simple;
	bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRcTBhwOMLNzSx1oVtXpg8dKH+fOlquHxsS0wd8xqNUT/4nSsWHxqmpksRyMUB15fE2n/nDELLrJl5E5aezpFkSvx730k9IN8zFhgfU573r6ktYwOPjVOGgWwnxlq+FOrrek3nG/Ni2wHuOLV9L5EPD0Mcz/n/6qjXY9eQQvOwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lrDXj1ck; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lrDXj1ck"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6790844c9b0so1616220d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841780; cv=none;
        d=google.com; s=arc-20260327;
        b=efkq8qjNaseORzkRiJfvpX6/xBvuUAlINYiAYV1MZxk49EluQ5zHU+MSNQUyU625AO
         wK+PP02apyt95l7Tt13RE1mqMA9AcCLZbu92y+CBlyy0Ea/MUGYFjFHyy9FjOKqnrrfM
         P+D1q47v2GtknPzaVSbRXorefe4xdk5RjHin+tuemNGtaHSiK696veKZ2dA5TmkBJFX8
         N5bmVZjuDllzp+0z81VIuRjTl6jIpn8H88G231PqI4TwAOjlUejyoTV5XyH+93F1h9ZI
         UP0esqF8LrYwiNV9MdHzh/WsnLeRROR8cdtalPU61Mi0mn+XjrNAehukCSVy+bXOkrUo
         O8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        fh=u1KgfbmFJuj5TTW4EdszapfG5WzYTsef8LQI1/VG26w=;
        b=I6UFdDPjrsnUFcxejlc13ovpJMc/LhRELbPfLzmUDquUKNlGc72c+d1ibeX4Dgj+xy
         Xd/kmlfHZktxQTXnPf1C9B0bjBfGrUWR0FJZifpvH6FDUwE8+U6zjV705QwcwDZG+gcm
         1E54aWKo97/h8a/+Zbb24ACXljvOG9t3ZC26Yc7whjXH68/OZYu+jBSdlZnrU967usLR
         EbEDLNYlybJijOB27OePqpRl6b2s/T6FqQeRQYO5LlzNeSeLft+3DfykvoUF56mFSIun
         RbTdqvF+AcpCa0vI/odh3N18OaBbfeTv8t6Fo1rMZGvUk9mcm+A9sd7SD6/syGOw9kGc
         HcKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841780; x=1792446580; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        b=lrDXj1ckKQN9sdh5pNMzq0VynDjPentnknB0wENtX5XMQaiATTvRCKJMKr4nEmRLpv
         60YWwNqUMu6rPnmsa8lVRmC7/HycnRz3uHDX5BofrLcYa7PwziTco0QQyQUUg8FoSK3J
         f/zy4v93CIF8cktHaWBZt4c/g79/4rTUrUVCGqo0hwwJJTINCS/TlZC0Drz/bzjBUvx+
         R9jqU/ygUGWDTo3d14O430owyCtsgTtKMbyy1mgywHdK+K5zIpTRRpPF5cuB9HZgOHzg
         DKPLJJvOiQ+vaaYQkhZZxH8T8HVQTRcHFJdap8aG3v28/4E8JCLbdFowVDCyulEyWnNc
         ydww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841780; x=1792446580;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        b=Hlg62QrqmB0lpeKgppsWYYKBJ83Yh3F4qC6eKkaISWkJI3+s32OG0E4sRJikFQSQ+T
         ETqwX3L/RTlQgJH0fCpxbnZ+0YZIBcQmWGlbgdNCArJrp4u2xNR4Qvci1dxTwD/dvTkQ
         e1jIMq+xdmjgzb0/fSQGoQbMqdkgWKeT6rIN5jihV78rLFpeGpZWi6CCZ3RR3De443Gg
         DrFkvjL5BT7PIVopMH5eWGIX13FJfYDEoOAyoEfOmpzY8EFnKwPy2ug0pBPiudouEsej
         zy4dDK445/Rr4GxnsURwqUuUrhMv0lxxjVMzkK50IE4qDxaoQc6YPk6VoY7blIT7wK7D
         oj1A==
X-Forwarded-Encrypted: i=1; AKwUvBxI5B959f4bVAVH3R4r2nHEWiOnf7oDRvjvJZmsHlyMftUS+vWLVYktACEyYGRvw+3vvILAnZKLvb4ycU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBAdC6kB/TJlyOenFsbaU0TupbGLg8HDQ4pDC+b2AuQ4QVy8r4
	AUE3j64KovWvHzrR0lhbyp8XdpdVJUbY+Sf8R1OxGoCem6kDI1z9hjAevvPiDKhReoLLBY5LCLu
	vGTVakJN8RP8HPBuI9GLz5PrSVmhMr1oqPA9lGc4m
X-Gm-Gg: AYBFou0HJh0RFaAXG4yIenf5mRDhvqd681grZZbkES0v2yYxi49l1gKLZPq+yzrUKRj
	EivBKfsyIycDsCcrKHwEWQrkWgfcDFGPc8rB8LpHaZtSO0s/j2sNyaOL6kyA7RXlfTZZIjbWUgf
	adT9a81HoeLuwaBMMwNrdO2tcpovLQ+pIa3VuPbnVS+e2GBrqpU58kf63+L5BtpX8v0diHWa7z5
	V2tBNxfOrMIE1g5CxjeOL4vKQ6sNHznQrgghQThaRnKRCjndckLzNROFAz2M63wfv81UOCy1c2+
	AqTtzDDRjt3hIg2atgQaMg9OaoIqoHmc2vSBvKV/4S4kqAn+SJESHU6lI0Ppn8IkXwP0BQYIEuh
	dtbcwKewtQg==
X-Received: by 2002:a05:690e:4186:b0:679:2a5f:52e0 with SMTP id
 956f58d0204a3-67936ad3896mr3031391d50.94.1791841779960; Mon, 12 Oct 2026
 14:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com> <araSUuwTSx0aIuDp@lizhi-Precision-Tower-5810>
 <22623823-a2c7-4627-b123-12d1baed0e93@intel.com>
In-Reply-To: <22623823-a2c7-4627-b123-12d1baed0e93@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 12 Oct 2026 14:49:29 -0700
X-Gm-Features: AclHuK-u983zXDJaYfr4f2s0wFVToPP9tOVKNN3Vc-Sa_lJ8nkqL5rmnPK1aDb4
Message-ID: <CAHreonGHGeg-SqA-OwyLKUy_Do-x16H4_ce6J8ndYkuyE2Dotw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Also i3c_dev_do_xfers_locked() should probably clamp actual_len to len.

Done - fixed the missing rx_bytes line and clamped
actual_len to len in i3c_dev_do_xfers_locked() in v6.

>> There are not dependence, suppose mctp-i3c.c change go through other tree
>> It'd better use sperate patch to fix it.
>>
>> Need fix tag.
>
> Isn't mctp-i3c.c dependent on the len -> actual_len change in
> any of the master drivers?

Yeah that was my reasoning for adding it here since we're converting
all drivers to stop overwriting xfer.len.

Also, will add a Fixes tag for v6.

Thanks,
Sam

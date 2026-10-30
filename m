Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793371433;
	b=dXuP8xz2Uk6vECTxcgGgNFxRXSEf/oTNlN8NWymIh6gTvfrq97/AWpSR5A9iEzzEceRt
	 C/BdkRuJlbrP9mtIsx518DjdT42bwI+A8Zg3owzmaZyLs32X+CC0wUtHfv2VtHbBYgXLK
	 Q9+pynDA2y4ZtbClnxF+XHOqTsFWeaJQ2c4+JkAPj9loEdsdncFGOSI2NAMKRUtJjj+Dt
	 JCA8YGRonAJckdlVTPah1aHy8LTli4e38VRDxbMIG1nE8+oeDWmPgB+AQSeiIp0TmPpYr
	 L+vEi2iMiPVhMfgfqOnQKOO4hJygKbSo5CxeGZrGmxNyEUpkBESDJLEZ8ANXK7Nr3eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:In-Reply-To:References:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=2DCszlHWvxqB8webBIdmXax3WRZ56Q66qaekkXf2dZo=;
	b=BP6KEiEVwMhtP9wVXpZNZz0Zj8j25Zg6QXjCwK+SWfAF7hHS5kMEK7dlKl4GKqXdY8t4
	 bHWxqIfjz/IZKeDi/5tivR+3fcX1Z9Iv4MB372eiC2Og/X2iFEBTaaAuVPD9PFF+uB/1I
	 /6Vtz4KpihXMWXWP6NFKyvSAgCq50u9e9bVHQj5v8LecWZqaVw4jHL+23Ecn2qjBANsN+
	 vwAHEj/S5mqWP2sSaqY/ZM/nmaJ+aOISG4hLQlK1+qd+R+vESHaB1Kt9Z7ewRaOJ4egt6
	 qSVjkGLMxmay9CiAGi78n+NmwxPb3yfEjAy+ntvnASBQvdhzBWQyXl57Y3wGPgZMyiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gA1ltqi4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56342606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56342606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gA1ltqi4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84e513874f8so600407a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371432; cv=none;
        d=google.com; s=arc-20260327;
        b=SzJZB4lIbFs1hT4KR897xTjWXhaTIsJ2tkeErX3DdxbGQDeXx9TQlOH2y8k1lXe//B
         LNCr1daUM1EEWtkgtHee76GcwABMt4t0h0pN+OlhpjZjoGxVVFK/xW37HuGAjEkcxFnv
         krG4zIdikft3F/NVh1KRXJwnjafhcDQbuAhOYpxmWZt2ab9zgb8lKb7Rd+RiPufehl2d
         JiTBUV/sUjEuQpcbgIAYUD/rb1Euf6EYiDlTx6LgXpzpdoekkNsvjCryn+R3AB/BIujh
         kA7LAZ/ubeeJMFlJb2DWBsVuR4/0nv+uUPOX97wmnI/pNM3+nvXox3TbFtOLmnUIuMhK
         IyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=2DCszlHWvxqB8webBIdmXax3WRZ56Q66qaekkXf2dZo=;
        fh=bpA5gEoTlj+eg1ONjikGE7RhQXA1WoiKOXz3C6xxRGA=;
        b=CQN1RvdDN932qdeMtm/Hmy2IhGmitBLHcETKDwL9yqps4JlNyf2UrRBwBWSO11jqcq
         +QUntLMfQlfMuC0fd6HY/z0IGp4ekwiPXDfN2AC+rYGbBfxjqn+zh6uXK7dv7ztOon+u
         RosSB86x7e0fvhxa2trKDGKUqxfcPUZlte97nI3CcNmEE3HR8Z7hkYUKBbTxjATqccJA
         h6wk1oB756riwveTOc44fXG6IJfB15zCYr6Ay5lo5p7AgXu8Zqz5IhY8vKe+dzH/hkJF
         2AyhWa6X+Mu4d6zdn3wcvXhvkxpJUs7PxGZytXOthu/g6B4ZR5bz2MPcXOIZXGEyGIwK
         B2uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371432; x=1793976232; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2DCszlHWvxqB8webBIdmXax3WRZ56Q66qaekkXf2dZo=;
        b=gA1ltqi4ElqKRY9O35EwjyQFXwRUhmrOFbwpo/cItbUqcR3YRx7545hWH0SzP1bb9e
         jyc5KYPVaEOJMLD7XmDygKzZf/FAGqxBo2Ox/MkW2r9alv58djmCtm3b0Vj2ZxoTBoqf
         +dn7ca6/EEtZGFFM2OZDTRR9OCI2Qw0R8udd16KFpve8ZPsjVZxzZf7eTjjBYsrPzihy
         dKTHySEbW4T38YFYS/YUozYZbFRW4gqbuvmuVEH4Jkvm338CFgz9FvX7XYj0TxD0GLCF
         77EskBiPog0zASlwtAaoKp+qUh3X8DxFy+aNtWOvN9svabS3+f+3LX1Wto5jFIZMMKgp
         qdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371432; x=1793976232;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DCszlHWvxqB8webBIdmXax3WRZ56Q66qaekkXf2dZo=;
        b=PKUjkYF2wxyV9jqGLfZHiAiKCuOK11VdJ10QchNaYIXBbI1fNJbdXdPLKXZoyGixSj
         OVUfQuSmIl2H0tkLrIDksSGfx3iN6sjNy8H7CR/W9gPaE5Z9fSfcJ10uu2cvIdiCbU7M
         30JHkurzVjiD4+ZOjJJZL7M/9IGOgUn39W7TtPBQvzVceM6tS596HF/XKkhYXuxiGn09
         crMIs0x1G4WeOoTy4lnqFMZy/ZRE1M8ZVHmCDnpkF4YDIibRSSrVxesQD4n5kRnH4bp0
         wY7mEDWrG44Nm8E2PbE7GRV9SiDPi+9NwbiRJrEAKC+anXsp5TMxbDwxrcPXxw0Iednd
         nM8w==
X-Forwarded-Encrypted: i=1; AKwUvBxhP93b/6012GC5Uc5yy5jarvrlx9Nzoiq5WMfpgHqmyvC/jro3MH/sGA/XuKSfQOmVStv80bSL1srqy1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0AjmqgxunErqhqp57Ob4qvBziPGDhiZ6Sq3voj0xWRWYhJIo1
	byCHtDjjsJHD3ZKV94BTDI1hZMxPZ3cZFmh46Z1xLDmqB1w+1MSreP/9DYJJ0omi5oAvNrbboAd
	xfxh+no07j5A7cYc5ZycFfEQ9Lfq6xUQ=
X-Gm-Gg: AYBFou01HtJA9qVzPLMaRUJjzHbRqAeTLv0DvUkQxJavRC2jiVWmkNOZQCUbgzpba+X
	sG6gW92FSeAT2M1eW6a8J4iqVKln1iWqXyc2I2kQJT1hiCAYx4Xn5XADTKMoZIBGzQL2zugDzQ3
	Dv7wXcrUZheSM5v93wMsUXGIRWC/C8lxA2aMBMB/yHUvDJdF3rzRd5j+E3FYt/wXNKQaBXaOYgM
	eUtAu0oGzQRd3ZX06Dv4e0gp70s1X+akOf8kOrQo1d+O4n3/todXqbXZHQvaHTjwwA7fc6cgKV7
	ZdEyqwGz7akVTEzDm3znyVeML/VztJaAXI+ETYtNK9o2TFnPobUdm5Rw4vY3MWbcF3jidIdSBg5
	y4o8IXHMTpm6q3xihdN3hflMqv/AZX0o1P0t5
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-5640d9718e6mr1839104b6e.5.1793371432233; Fri, 30 Oct 2026
 07:43:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 07:43:51 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 07:41:51 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 30 Oct 2026 15:41:12 +0100
In-Reply-To: <20261005183141.5e246d3e@kernel.org>
References: <20260930050307.1978654-1-roshaen09@gmail.com> <20261005183141.5e246d3e@kernel.org>
From: Roshan Kumar <roshaen09@gmail.com>
Date: Fri, 30 Oct 2026 07:43:51 -0700
X-Gm-Features: AclHuK8Gt7zm8s5fL3_lN32O1iml_DECRMmlm8TJyqnHu4NbnC8In9fPWY1CWbc
Message-ID: <CANphZRPkEfwrZ8=X5k8G5N10c2BEbAYSxWH=QjKUbeHhVrW_+Q@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] xfrm: iptfs: fix queued receive state lifetime
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Christian Hopps <chopps@labn.net>, linux-kernel@vger.kernel.org, 
	Lilly Aronleigh <lilly@aronleigh.au>, Shubham Antil <shubham@octane.security>, 
	Giovanni Vignone <gio@octane.security>, Robert van Eijk <robert@octane.security>, 
	Paolo Gentry <paolo@octane.security>
Content-Type: text/plain; charset="UTF-8"

Thank you for the detailed reviews. I reviewed and tested the reported
paths and prepared a v4 candidate based on net. Broader build validation
is still in progress.

The timer now uses absolute monotonic deadlines, so repeated updates do
not postpone an overdue expiry on low resolution kernels. Ordered input
is serialized per SA through a bounded ready queue, preventing concurrent
reassembly replacement. The device notifier releases queued references
on unregister, and the input path rejects new holds once the device is
moving or unregistering.

The revision also delivers a completed inner packet before a later
malformed block stops parsing, advances the reorder window past the
expired empty slot, and removes the redundant device null check Jakub
identified. I tested these paths with KASAN and targeted reproductions.

On the discovery question, I first found the device lifetime bug with
syzkaller while fuzzing IP TFS using custom AGGFRAG descriptions. I then
investigated the KASAN report and reproduced the lifetime failure with
a focused TUN test.

I also removed the earlier unprivileged reachability assertion from the
commit message. The namespace smoke test confirms TUN setup but does not
verify successful XFRM state installation or IP TFS input.

I plan to post v4 as a separate thread.

pw-bot: cr

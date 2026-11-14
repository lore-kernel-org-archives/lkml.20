Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641393;
	b=VMh4azotD2O6Wif+n3Hc4ivIR2OKDuZh0n+6usayslB6jGqOceu4I7bxSS9fZusQqIbm
	 Ezsb0D6tKcJ/6NQijK0SahFG4FVRT6h5znbroeWyE0NdFWQ/hFi7HVKXk+NwW+VWE2E0G
	 hPYaBwcg8GUVh/Q0O8/VJFW56yI9LwgZ1dTMXIcCpiJyPhDBMTunxqFUufG14Lv0RbGRT
	 KTfoCu9Yt+5sPdpyKigmBwwiWM46FPMkLBGf+081WhrBZ9+Y5DNvG1bmTzBlQRua70rA7
	 Nmj4t0/doDS7l125tNxBrdpZkvAdbXjeB2NWJ4mfZ4taYSXInjIgP5T9Sy5SyqFtFsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
	b=GMFx6pf60edDDQnn/zzyiPpQ4snwTIMRSJfl9aPix99EaAP0BOcS1Um/7UGlG7MKpVa1
	 gEzqJ8kmhTizSSBm+yqVWLuK+SNC1XRWmyN+bv6qB14zZwxKYUFkG2SQf61Wd5aInoQqj
	 5prdmQtXTgzMzj0I7Ryuxx9bU32TzDJteaAkP0WNNHFCULGoEbGk0azw6thV/2B2I/akl
	 dR0tB+qbyCFN5mD1nnb9or7TrLo8hmb4OUcNYoKKNw2TgHKsBzzKWtvuHpEznZTgi/ucq
	 9K20mY/p/W2I6r1gO2kdrjmn9EhIXsQ4CFrCqlQsMqmSbYYHZK6UDpBYDgM92kHONYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BF606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so28626265ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794641392; x=1795246192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=aL2wuFjomcsvsfQmrCeIzXmKyM/FDwAhfsv09F0lNDUgz9JuANGlYt/QreGkeMnYny
         IjWDDx07aAvuofmQ+rPn8ayCCQjiFZ6Bdr/MTVAQ8bzKhjk4bnvVo/r4h5P0UziJU1EN
         Ox9z+Lvxf57ofAOz4ukf3LyIWjuXWYozEEw4ZrAfEcYHjT2xY2eP5R9DEE9zH86bryoS
         jVJX1cW6OFoO/7PZE5PHn4fHyK+sc7UdnBCxgnSzUA6eVzj4DIA1CZze5LRqf2rADghB
         2onp8c+5TDdHjrQuNaEt48thf6zhZFVw2FkEHAyImbXRkp+VkfXGvoaK9nMxNcJy6Yjh
         vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641392; x=1795246192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=osu+cxYBnS+eZA36HrgkoUTkNeq6FANBMheHcoOa/qkvysCzkRqyHBie0zRboHxkCS
         h/yq7lnAIALlsVochY5SUHpqZpeNa7Y7/fDK5NWKGPYsO8ptulK+5wo98HBODc2dPaX4
         gHXt28iqmYL2KYE7HdU64owub9G0jdWGsloPeqSyreQFYWxDe4HNhHHnbQeiDPT0lcNU
         llmly+9S7sF2vHhRmjvX41tXnAUW6eVBL1pw09jCnaw1m3NBcl6wNUrDB0qPXSR8+b/u
         6TnrsJFd780CxM5z4tJ3s20SsSt4vRFGpNSosiVZTVkodgSpLhixvutQ3DnH9lXahNCa
         9s3Q==
X-Forwarded-Encrypted: i=1; AL+hErGV+162SrL4H5xiLsST+wuuo5bjkb2y/b/HNhRRAyizWiFmSvPm0kB1U4w9w8nY/uoMRAD1eCl5EbBXu4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NDE4eKfXQY+zhfqKy0pC5G6Wlb+S31IqyjJhU2/1xiJzgXLfp
	F/QMC9YgodOg164vcWmlVtOK7Ns+4VMvbylrj2Tq6zrto7wjnDydoltB2TtLgfi+lIgIsGcVeE5
	amkM18A==
X-Received: from pjbdt22.prod.google.com ([2002:a17:90a:fa56:b0:3ae:825a:57e3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:3ab:d45c:59da
 with SMTP id 98e67ed59e1d1-3b1b0a3288fmr4973155a91.40.1794641391863; Fri, 13
 Nov 2026 23:29:51 -0800 (PST)
Date: Sat, 14 Nov 2026 07:29:51 +0000
In-Reply-To: <20261111174704.24312-3-juanagusnicco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com> <20261111174704.24312-3-juanagusnicco@gmail.com>
Message-ID: <avgNulWmQTaUHD3N@google.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache
 test to bind_wildcard.c
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 12:47:04 -0500, Juan Agustin Niccolini wrote:
> Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
> admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
> v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
> [::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.
> 
> Without the fix:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) == -1 (-1)
>   # reuseport_v6only_cache: Test terminated by assertion
>   #          FAIL  global.reuseport_v6only_cache
>   not ok 1 global.reuseport_v6only_cache
> 
> With it:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   #            OK  global.reuseport_v6only_cache
>   ok 1 global.reuseport_v6only_cache
> 
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464379;
	b=xFx5PSYKBDS50SRnQLeYeyelJEc/VPmbwloj8mckGnxv4wP3YeiuflH2PfV/yCuG36D9
	 ji+CuXolv2FDxOceUYmuxg6HiEu+jlcuYiN17yqLRHKjUUiXyTXMemIwE/n2F+yHl5bb8
	 qKl1IX9h0ifTwn3lbSZRZZkB6+5kU1pEeiNvMqjeZcbxzExFftphSMEJGZlSHWtSUfpvF
	 LhhMmfRmOOg5arFdzcSWp0CDklaHelyDmqvzhkS9qwY47kO2K9ccG1jRa1Jk+21Bd1oRw
	 vQXDW1iyGGZ+z5SMtyiDSmPcYJ6aiVS1m0hWh2WsJPty9+0QMvHCobuqbfivvDMoZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uA08ZWVt/bTm0lpe94c2sMUhRAmYMvhXE/vdrih5bQE=;
	b=JKjGbigRB7vZ2wcHV4XUvFuA1bN8jFd1B4wpydo8IGbOgP5ySkXQEofXtxEpy0uaMiSf
	 CfDcZi3cxKwIFyQtUH7n0D/Gz6IFHHaxM/SFNm7HJrMxVNTh25g0sUwMDohzNcCz4Mc4G
	 YFmCC+xCSL1dTf16rprVBnPq2L6XR6uNysFR4dTF4DMfOFcClF8PZE4luREp4K0K9auFC
	 QtxvBacWKEVsfP6BY+1nghPJ7FCx42D2za9Pu0NpDjtCxFvkNObDOciMd7ffKk07WpKRk
	 GuS+vOU+KREzjtJxcDw1OzOKvcjE9QHgiX1yweOfYygEOPsrtN8CeGSivoVKs0RSmpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cC3QylXu;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06903606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06903606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cC3QylXu
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso39661615ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794464378; x=1795069178; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA08ZWVt/bTm0lpe94c2sMUhRAmYMvhXE/vdrih5bQE=;
        b=cC3QylXuOkBJcuiM26egHlrAWxVqHaqwt7BW3rf3hfWxts2eQCo99NOFUNM9OThYbC
         br5d6PQW4MGr4O/mvH6l7VhpT15vMaPdsFoS/4yAfJLR3TrmATfGFHHIpo1I//vetc2X
         9Ne/PJ0MMwWo1kVhTpmr7rcPdBKvETkknFA2m1aXj5WROYKdMQv07jihN4MqSihTkivW
         tD11w8Q20dbeGJhyWBNdxGrRIYxqDSfM/WddJcx43zH3UT+cL/57uAGUKpNlF4nrvrLc
         A3jg3w3rNR+X8MeRpKW/z0IYA37SRMvMA427qYqQTO3CpTYBOirRUlOwwQeM/pmGvdFY
         xtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464378; x=1795069178;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uA08ZWVt/bTm0lpe94c2sMUhRAmYMvhXE/vdrih5bQE=;
        b=TuJihng75yTAAPVyTss0WHdfOyv18b7fghsrUOR2F2MnxY4fPywSZMwwhHUBGWZn4L
         J0Fsc3VAgV73hcsOpJx5aDSOTGbbJym/7SgZHNSijFngU71biI2d3G7ukTzSNK5VYdd3
         o7yFqEjRtzppZ7IL9/scPFagBytrUzwfB9IyKiIRoznkK9HSxbRR18efk37thWaC8Gxh
         IJTG9x+yHhhyoKDDrzm89LHt8zjXHN+pYZyNjVCKx+4FsYxMgluZ3ysJkXbv8/0Qkqcu
         LU+7HojX5abD0O2l8P1tc9tL8VbxcE7PNN3vu7ERb73hm4MgAPXMxs6TdZ55/OHRgJuh
         if+w==
X-Forwarded-Encrypted: i=1; AL+hErHJPgz24Y2JuyeW/qUZOILLSGgZCQeDCmqIBEK6yYr/HOJLask4ErbwQSEVeKmCOKaQ2wK/pyBX4v+z9ZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R/DGfR34KObLj//aqOPqXR0SM5Cm5zbNl9UVWrOrEOnfg0sGD
	LNUTKfiCucTEPSekOO7NrmF+SW1Alo/HuEKyZKS2sDmrZ5tVja/OeLMMEPNv96EvrVTIisJuB3M
	TT6yuww==
X-Received: from plbja7.prod.google.com ([2002:a17:902:efc7:b0:2eb:16af:1567])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4d:b0:2e9:9a19:c43
 with SMTP id d9443c01a7336-2edd7ab1fefmr46833585ad.15.1794464378116; Wed, 11
 Nov 2026 22:19:38 -0800 (PST)
Date: Thu, 12 Nov 2026 06:19:37 +0000
In-Reply-To: <20261111023222.77227-1-sunwenbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111023222.77227-1-sunwenbo@cmss.chinamobile.com>
Message-ID: <avVaUr1ZOMeEEXsf@google.com>
Subject: Re: [PATCH net] af_unix: Inherit SO_INQ in unix_stream_connect()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 1342116488@qq.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 10:32:22 +0800, Wenbo Sun wrote:
> When SO_INQ is enabled on a listening AF_UNIX SOCK_STREAM socket,
> accepted sockets created by unix_stream_connect() do not inherit
> u->recvmsg_inq from the listener, unlike TCP_INQ, AF_VSOCK SO_INQ,
> and AF_UNIX SO_RIGHTS_NOTRUNC. As a result, recvmsg() on the
> accepted socket never puts an SCM_INQ control message unless SO_INQ
> is set again after accept().
> 
> Copy otheru->recvmsg_inq to newu->recvmsg_inq in
> unix_stream_connect() using READ_ONCE() to pair with the lockless
> WRITE_ONCE() in unix_setsockopt().
> 
> Found during LLM-assisted code review of unix_stream_connect() while
> comparing option inheritance between SO_INQ and SO_RIGHTS_NOTRUNC.
> 
> Confirmed on UML (x86_64) by enabling SO_INQ on a listening AF_UNIX
> SOCK_STREAM socket before listen() and accept(), sending data from a
> connected client, and observing that recvmsg() on the accepted socket
> returned no SCM_INQ control message.
> 
> Tested on UML (x86_64) against the reproducer, verifying that
> recvmsg() on the accepted socket now returns the expected SCM_INQ
> control message, and ran the tools/testing/selftests/net/af_unix/scm_inq
> selftest (all 6 test cases passed).
> 
> Fixes: df30285b3670 ("af_unix: Introduce SO_INQ.")
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks

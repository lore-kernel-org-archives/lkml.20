Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA04A8FD1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163182; cv=none; b=a5knx43YfGNv5n/Dm0IwBljwlZ1C2RtMC5FdC5QI4enGs4QfDtk6UEtRLtmo4Ws1hrwq6r2enqoK3CmUYdfrjFRQGOaf2KYQPN80nEyVCgq7Wj5jDBR4FduzVUqwWsYLX30gXwUt7JkL6atspIot27igZ6PF+Z9oPt5gDc0OCXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163182; c=relaxed/simple;
	bh=F9tVYstefVXNBFGdnpQ2yzC11l3f4oySkF0wmLDMJRg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=YdT3pNouUXDs4/5JVbwIu9rap0i7VLcoq+E1PEyiYm32FjdV65qn6B3DstB4WHOEOP4PGqifaWcxecaR07wVZwvWkC5cA8EsosZzLR1d9kGU443cOAKMfWMTNzw6InsNKDEf5D5ekEMaK1qpnVdzOt8EhG7/kwDvFYjmr8O9UbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyQaJg3F; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyQaJg3F"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso52945a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163181; x=1792767981; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0/kOu9Vo/zJiBjLTBWedq2zmfz3+xfDwpc4EXkFj1g=;
        b=QyQaJg3FOWuUZCIJGv0XttYjGmZ7QcAuO9HnZkcj3S69RVeZoDzMSqQ7yFB3VQBxuk
         GCpm9cqT+Yi/4c9NoysajS4xVeTmckI7sLpwmSgbPDQu8qvhWrK3t7gQyTLRc37RjR6Y
         UD6KMTe8qEql7olxy53oYZuFDjXJywYsZ+Pt91ZbVvS/TZTdpNBfMzkTdXkn1qDrwj59
         Nw2n7M87O/FOnGbCMfQ/HVwk0oDpikubVWVsv67cZhS7gqsaZf1aSdgxqw7IkmgkhThr
         DY8fYh6XggSYtGmZeCQ3LNt9aBKn07h4AGNzAt9v8o/Smxe9tz0/XKUB1GtERWVpWzrp
         kXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163181; x=1792767981;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0/kOu9Vo/zJiBjLTBWedq2zmfz3+xfDwpc4EXkFj1g=;
        b=FfotnDAWC3WiolSnsPPrdY48G3yfMUF6CYnQzLsdxs7OsfR0g4dhrCPSnFUhFuUzMN
         Mw4Ujmg8IcwjICghf5srdcrwi17SmmYxamOaTmPkz1OnEMWPsUlFg87ZIoTQoPUIEA69
         cNslTypxjJOn7G7Pv87ZZgK/FMYo9KVcpZRvA893NUBOXnnzCl+oUyRSN/4aJqt0j/fk
         UJbcXwrK2+WkhWbdVzcnWvDm21NPq5SuXIEmF6Pe6sa8BJm1kbsdBQx5hBGpdfwmtxcI
         rV2dtclzSjNeo4dm1Vx/7J/rIsK9O9W9v1il3gkA2FYvdfJen9HUZS7rHdNYDdicPP73
         OIzg==
X-Forwarded-Encrypted: i=1; AKwUvBzvCDvje7j7/h1Bcj9dLSPCQZNC8cqD5K2tnNwD7CcOG3/QuqOfV53JnHLgoDi4uE/jYbnb81MZIH3cMGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpeRhbTuzmjP5PRbhWizBDTKxBbUNaL1aUxYaeoX1EbxDtIswH
	VvJ8m9HAQYMJkuu7Df9nIrX6V5xDuPnZTD4lhf+5HBZFeWvXEd6YPiYY
X-Gm-Gg: AYBFou1/F6VrHqISHPb7Q1sZNOVNKWokHM/mk9FdzJ0gNFjNGKqqNagIt7ISNVB2ej+
	kSaa/kaI8JjDXtoZJ5Mcr5BaBdCV2WCzEF5kSvMfvMtgqQle3ijH73fJe3p/LUIhpYcz6nrGNOn
	PjnsTUoIa+wiyMwQCXci9Xm/nj3eQnZp6KmN3Q31WLii6yot0Nerx0TNYwYdzXkgcSmOhD6cy4b
	N//DXj8mjQnOj0CjPtg9wmqcPyNgCYId4/21SgYkLhIi2xpSHRcAkbKwBQd5Tj+mrPf14rcfJEL
	0+nXRwJgH6sufhU5LcJL8A0uh2uEbcrTVe5/QJ0e0pRKPeaQ1Mb45+Tpsep6wAcWl7XqREZauR5
	mnQyRq7w4doJ2SHvljmq6BzQK5K2biByp8rEVXWHeSTxUbV4/fKozrbJXlriUrmXczeVYu2rAhG
	0uw72UAhve7mtQsui0JpZlEigfIkhkS/m+T80ougwE0N59NCNbIXSPgOoLgaPseA/Eu1PpG1vQl
	if7CbwBZHp3rMOYmOuQ8j0sY05bA8Y0vuNxrD6TAI4353st0qHA5DFFoXtBymz0F3qMXXmdi7GZ
	GWml2VKsweV0dUE=
X-Received: by 2002:a17:90b:17d1:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3aceec25263mr109707a91.23.1792163180660;
        Fri, 16 Oct 2026 08:06:20 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05c9255sm1984298a91.2.2026.10.16.08.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:06:20 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:06:19 +0000
Message-Id: <DM6CTQQV55G1.1AU1HIBPQYW8J@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "Kaiyan Mei" <M202472210@hust.edu.cn>, "Yinhao Hu" <dddddd@hust.edu.cn>,
 "Dongliang Mu" <dzm91@hust.edu.cn>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Fix verifier WARN on narrow read of
 bpf_tcp_sock u64 fields
In-Reply-To: <20261016111643.247553-1-jiayuan.chen@linux.dev>
References: <20261016111643.247553-1-jiayuan.chen@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 07:16 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> Just disallow the narrower access by matching the whole u64 range of the
> two fields, so it is turned down at check time:
>
> 	invalid tcp_sock access off=84 size=4

Pls add a selftest as patch 2.
progs/verifier_sock.c already has
"bpf_tcp_sock(skb->sk): tp->bytes_acked".
Copy it and do u32 load at offsetof(bytes_received) + 4 and
at offsetof(bytes_acked) + 4 with
__failure __msg("invalid tcp_sock access") __failure_unpriv.
cgroup/skb is loadable by unpriv, so both modes should be covered.
See
commit ba578b87fe2b ("selftests/bpf: Test invalid narrower ctx load")
that Paul added for the same warn in ctx fields.

I'm hesitating to apply it as-is, since all earlier fixes for this
warn came with a test.

pw-bot: cr

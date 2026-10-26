Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012231;
	b=WS1B7oOU1ReHDZBAy1vbiBB3w2drQoxoH7zZyp4XLH4qCnxJPnVrWa1Td55A6Of6vagO
	 YN2Vs7sdgxvGnCIjQZGJL/8qhxhQIM5nOxGVESdRI7pX6GH6NKxFgtzwW+DFzp1szkeJ7
	 7JDIEIqVyRNtbwFGBzdcZBKWhgpttXoLsTFjMG4NI1nBhtoV4csBlNS7YxRLtx/Sysjbn
	 kQsonO11BfobJVWAvvKInTZwhiVxNEjKtse5Dcr25st+ISRBhia+LdaQEAhLGVFS/lDlb
	 o+aJagVMAAJv1Skqq8mSaR3nnRvY+MnavlX8cBGV5XXcjrONZkGTmhMQ9g7QdGHWg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A6WQ68hjWi8GGKbr/7ipB7b6//gVmCrXXLJs0RemD+8=;
	b=Z8x3i3sGLLZGiXh6wGidnsnqhIwdmugD10xeIO3CTwtIFmdVuSJx40Nupl1BBDZa2UQg
	 C5z/dUotAVLUNaiQlHN9DbTJ9MNH1C8bZkLXMZQkSuwPVDcgD0Y2NE8J4ZBC6Vs618770
	 k6xlxpQ3TA/YasVbSkG40n5YrKpqzexm6lkxV4SQxlOYHv+ymhS4CJ/iW2Wmxt0gFmY5R
	 ElF4Uol1EktYkK7+je60f8RGDy8SsqCBz4GHK5VXsXeigl8ObwkwZ+9AKhE2FTK16WvK0
	 +EGEgZ6Znd0tl/+jsK2oAuH6rzr+zWNsg+yKUovUOc/grD6/Prr/70RSg83BLrpWKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SEwFXFCD;
	arc=none smtp.remote-ip=74.125.224.131
Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F946606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F946606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SEwFXFCD
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-8a72cead747so6740067b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012230; x=1793617030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6WQ68hjWi8GGKbr/7ipB7b6//gVmCrXXLJs0RemD+8=;
        b=SEwFXFCDucNx6qmpMqGimfPZJaJTI0ki2nne+w2GO6SVcR6bV4eEPoLxHhMGS++ltR
         5wcBZtN2FJwhm5J0aqatSL5y2Migbu+86yc+SEJPYHc/MxNZOIDeoYyDp22ICk8w17fJ
         Laj+rf3DSLBy+j0B22uPefw0mp/IgxbBnG5kUh+ePxDzX1TDngidQYHZVL/hb/bDX/bN
         jcAJoD5Aa9WDDQaE+b8O7KXv1dFUSNPKU04pDZwLiMtiXxRU4mpTo/FdWAq73KyY7KfH
         uPFIr9fGxC1aYcz/S4+GovfuSoeXqD4DSwFOzeYi+yhts6kZYQ3YtA0aKpIP7ogpHVkr
         VB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012230; x=1793617030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6WQ68hjWi8GGKbr/7ipB7b6//gVmCrXXLJs0RemD+8=;
        b=phdIFgrko47RVT+TERWzW99ukBNV49zfzkPVfKJmq7Bkkq2oMOr5gp3T0YkhaOfeVn
         yqZRKY9PDe9dKzoGRwoz++aAMbNRVWEjfy5ZwqJG1SdYIpfgvTEcizoRVCfO/29f/K4v
         irfCQw7tqlHTP5CUx0ZmTFwaMxAqqp+fm9adTe9pBUm7gd6oSHQe6cmOmrdqsfF1EUIz
         /pjZ5ERawOxXZOLKxhNSVZT6cVjG0GKJsfW5HGnonh5FV2dl/bRRbpYyqO6RNm4GzAl4
         XsQGGV8FOdMrPPsJHDxPQZSRcfr9IHL53HSyybYplbFlSCO+dixGiCQ5ahjGoBVZBSDi
         sTeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXlp7U4+otU10Xa9F//jWiYltwKOqr+Fz/c4YYkRj30+W/g1tDZIfPfB8veNSYvCKbWrzwhWGvUdonQl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbd65SRTyzejRSzI032ivyW4CdogDRNt/52jnO2H6mc6RdgMGC
	hAkTzG12ib44C+iXK0b0hYvF2aLzJ7wfs9LfU0L4AKCAJYjUuvNWx1NH
X-Gm-Gg: AYBFou3ImM3U7CC4HtAc2G3lWZM6nCn58I8EPil0ix6UhMEVQcHl53OuX986OtlizbJ
	9ClOcNwPfyHnbDouEpPLT+gPURnaHjzkbzdCOlgDZVnsbtGfMIJ2bFMcslCdiG5kKOcAkLJEo20
	3nLudu1HL6wgBBhFsKnpJHXEDEmSqcGRZy7bFVPu5atOi+40tBgzWpZ3BhYgbuwgF1spYa2RJFm
	U/TciYd/SupMGrFqXpanfthcdibUayZedZy6YAS1fZKNkjdILbBQA0N9+2Vx4zwOZoKv/25S7Nl
	ZLCKIhw6qiIENxMrnUKwPW8SqMzxu7CFbS2pu0NlpjMa4L4DQaM/Br+faa9P//XMkDRKtvsQ6NH
	3Wo9ykdG37NauKGla5HDlCCT6/019H6ue424aF5eztiTFpQ/+ZKejDYEpF8qfy/ZRT9iDZudJQq
	+xCb8EJktd8i9pa+ghkUFn+b0W6ltDiZNAyF6dN1iSsqsVI1bbuqmnYqyNOET0UdFcC5V1B3L68
	Z/mxVTDD+I24ooFSaDWG+vUrm7EADx+/Yb2bg5xW3duovg1KCQKHvnpkvw/9QQ=
X-Received: by 2002:a05:690c:dd6:b0:873:5bb2:6c06 with SMTP id 00721157ae682-8b166c4a307mr54037207b3.48.1793012230048;
        Mon, 26 Oct 2026 03:57:10 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166eb116esm28902707b3.37.2026.10.26.03.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:57:09 -0700 (PDT)
Message-ID: <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
Date: Mon, 26 Oct 2026 06:57:07 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and
 startup
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com,
 Hannes Reinecke <hare@kernel.org>, wagi@kernel.org,
 shinichiro.kawasaki@wdc.com
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20260922200718.3941465-4-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/26 16:07, Surabhi Gogte wrote:
 > Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
 > allocation and startup"), refactor nvme tcp I/O queue setup to use async
 > API, combining allocation and startup into a single parallel operation
 > per queue. This reduces connection and reconnection setup time when
 > there are delays in establishing connections, which is especially
 > important for high-core-count hosts.
[...]

Hi Surabhi,

This patch breaks NVMe/TCP connects with TLS. This is a different bug
from the pf_cache_lock one that Shin'ichiro reported.

Test: one VM with 4 CPUs, nvmet-tcp on 127.0.0.1 with tsas tls1.3, a
connect with --tls and 4 I/O queues, and tlshd at upstream commit
a0bd51d.

- Linus master 6b4b543fa187: 14 of 20 connects fail.
- Same tree with this patch reverted: 20 of 20 connects pass.
- Same tree with Daniel's pf_cache_lock fix [1]: 22 of 40 and 17 of 40
   connects fail.

On each failed connect, one I/O queue logs:

   nvme nvme0: queue 4: TLS handshake complete, error -110

The tlshd that runs for the target logs:

   failed to search 'psk' key 'NVMe0R01 <hostnqn> <subnqn>'
   gnutls: Error in password/key file. (-31)

and closes the connection. The tlshd that runs for the host then gets
GNUTLS_E_PREMATURE_TERMINATION, which it reports to the kernel as
ETIMEDOUT. The other queues use the same PSK, and their handshakes
succeed. blktests nvme/062 and nvme/063 fail the same way.

I can share the reproducer script.

[1] 
https://lore.kernel.org/all/20261014-nvme-fabrics-isolcpu-v1-1-355156be27b2@kernel.org/

Martin

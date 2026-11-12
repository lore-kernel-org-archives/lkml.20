Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453383;
	b=qxmDLoE2CafaQdl70uHQ62l1616QGfv6WhIzLbdQ5SqLNXdoes94zSfXYw6OnTWnN18i
	 6nOIkCmcL8MjAE9T4EZZe0UTjZ0sDfqJ+QA+sEelLHlK2EGTppTswci2C3tphn/zrBz8N
	 QgEE1g8cbNijv+SqmsrJdJbzZ4GGQFX1kPk4phsP2lEa/lmxCPMixhIakUEKPl/AQ9Vxn
	 gScWWGuBt0Gtp3DWnZOpsx/0+654n36+TgtPCsQcpqmhRPR5JJ6KTvMvEUIS8xmrpJlEe
	 lzpkWWpCu4a4979h7QTpd8tRdq37Znhq+iUore/mygtOZIK1fh6Uk8+6QU8dwnpyqTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
	b=X6C4lVmXrFHjiqQEMcS82uwzIXOUKaCvxHyrSBfpvBKECeWrZy61uj0cdmTcqmq7PI/S
	 Ph/Y6pD8zhM6uqiDQGkKHJKkG+t0L/hIisMFVVF+iHk3upbPdbczSuGgySZjwfYOXwoHZ
	 jbKlAUAuuwqsHgF8rvwo8tMDpYjydP5b+Rey8CbXbHuA/GzjOCZqYDS91FipEGCSzB5dy
	 XJhgT8n9B/bAo1+tW8TzdPIfYpyIE1Hdodn8NVk76XDv+n8IYO/eXZaIk1BYeimoRSIYg
	 zVTtWsHhSRZPLRx4LSUmG0kTqFIzzJGNI4ZAE0VumZfhS6IQWQhz1ZKH/fWD4hJdkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzQ8Uuex;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E80606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E80606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzQ8Uuex
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so2288028f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794453382; x=1795058182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
        b=pzQ8Uuexjt1M5LTPHmPjA/0AkTNNox0xoewfbs0mmNXc2ebwhaseX7U2bMdJ/b/nwr
         PZaUwldH/h8WVsErNvfL1vx4tSc69uuqLHbiJRM6ZljGwd4Er1H9s25geQRt/b+P9lCq
         AecblAHgho2WS8Vk6Hu/PI5d7yp7SnNwpaK15iCSveNyPC3dR4eSDSnSsUvSjoklOkLp
         VyALg+f4s9J8ViIF/3TmxYnR8H0xT9la+53qwdS1xsdG1uCnOkuXR0//RyvrV4zOwsFO
         VB1Od+Ej8HO54DGOv3T1LkhZjRRVvz0NZxav85z59DLvd2vZhnFE91VtaBaeyjJI2ajT
         Gh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453382; x=1795058182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
        b=deExDZ2tCX+ptjS54dVGGRBSXCX/YLfE+rwdq7v+dMf2v27CjbrHV3RXSFFg8wEjYa
         y5p1ew3ECU7HIi4Sd5mBSkmn17wf9QbJ3/1cWvpaIPHY22a2xO44s8gMT2KhctNqKGqJ
         AWR9zXHEKrwwNfLVgZYS8zhm2M2d95xZhAqzKImhcH7c5TGfnP4v2qfDNpuZ4AU2AhWb
         AXyIdu6cC5A7aKDtMqIVj9y1+FpWR3DtwHUghpj6CjIZMmbDtLlLhr99ilx6qc4gTAC5
         SP9ODCN1oeIUdve5ErZxS2/X2IWX9oT8b6YxvTltVGyNuwUk0fZweftATjZtsDmWOz9P
         2dfw==
X-Forwarded-Encrypted: i=1; AL+hErEzxPvpUkbs9HhlGqlUrhcXoQvIE6QCwz5RAxS32Cb/CbpRrf/1pCZdz1tTjt7VovyIbFeZwU7rirtWrxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IO1M560nR1maq0du+U2nfoZoskwHwFrU5EIumOuu8aifs9i68
	f4OYn2on34NJzlC9FSobH8YWd3UcxVcOR9MNbwof/MFr93DnTx4EyQgC
X-Gm-Gg: AYBFou33+qFMmdmrK4vFnk3WBiwxvTeGxwFsRE39AIgThohWhCiYQun7DP9OkqTosIK
	1w/Bdf60XSt+EenVozvUvx2OM6JeGIA+EwZVZgvi7YJAzlUTHf6O28NN6ABw2SqbNwvhRh4b+qi
	4DZZfuigJmhwQr7pIVUJfdYMBS+LG5Ba7XRItwZ0JUTNct2SKOwdBL1kiFwTHllfika6nc2Hvmu
	sXdew9+D5aP2en2LBz4htqdzQFus0TIiVebZWB1R/vGcYiKiSTBnga7t9l/31PhgAMd0qZMfQXB
	nHyk+ustjB1uqCheuI1TUL2DVqKxkWvLiEZLctkIRP/gMOwkt6QnF0irm/GanlIOGOd0HaQgDNF
	voNV4KqQL7wIgd2ZF9rd3Vv8inkyHaePO50HyR/R3Tg3h4Z4vsnrOMgXFaTenU8a6C7eKvp88JH
	OUdhE4/+Q2yoYP+TRSHdIlAip9530ezDqFgLvkJuDoHn5+zJH4AKTNDLZge4xYGEzda1yJefh6I
	yToi7drhKUVrLieeum47QjXZZ69tpV7n+rpOVNjkJu6KTs1aoD/S+WmMUax57IAgAk40vj6eiLd
	QFjbfNpJdsa6WytlF45qf+eblIzIkl4JaP8LYmZC9IdkPXwQywvcw4Gv/C95RmYHwj7h1OOm9Ci
	k+pp8NUyacHW3EJXMoIi9DlNEc6+nA8y2CNsYmiRbaSpNjcNl9e4qggwqBPcwedn7nLdrYjhQ9J
	MtXyjkWeT1mkabhYFAkEJZoNMUpKxBLA==
X-Received: by 2002:a05:6000:401e:b0:495:5c83:51bc with SMTP id ffacd0b85a97d-499c3b9ff3emr7370230f8f.5.1794453381449;
        Wed, 11 Nov 2026 19:16:21 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a181-4b01-25fa-1a8a-4f45-ba49.310.pool.telefonica.de. [2a02:3100:a181:4b01:25fa:1a8a:4f45:ba49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm13523836f8f.39.2026.11.11.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:16:20 -0800 (PST)
Date: Thu, 12 Nov 2026 04:16:19 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <avUvHGb4talXW7qS@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
 <20261107105946.GA96745@killaraus.ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107105946.GA96745@killaraus.ideasonboard.com>

On Sat, Nov 07, 2026 at 12:59:46PM +0100, Laurent Pinchart wrote:
> Hi Karl,
> 
> We discussed in v1 how this is not the right approach. Why are you
> posting a v2 without addressing that ? You need to go back to the design
> table.
> 

v1 ended with two conflicting positions on non-coherent DMA-BUFs:

- Laurent [1] and Nicolas [2]: end_cpu_access(WRITE) only marks the CPU
  cache dirty, and non-coherent DMA importers clean before starting DMA.
  Persistent DRM/KMS imports then need a sync call on each submission.
- Christian [3]: devices must access DMA-BUFs coherently with the CPU,
  using begin/end_cpu_access() around CPU accesses. Importing a buffer
  with dirty CPU caches onto a non-coherent device is intentionally
  unsupported. Today cma_heap and system_heap sync all mapped
  attachments inside begin/end_cpu_access().

On my Pi 500+ with a USB UVC camera (640x480 YUYV) and V3D on CMA
DMA-BUFs:

- Without vb2 CPU sync, V3D reads stale data on 8/8 zero-copy frames.
- With vb2 begin/end_cpu_access() on cma_heap, zero-copy V3D is clean
  (0/8 stale). CPU capture takes 91 us/frame without a V3D import, and
  144 us/frame when an idle V3D PRIME import is attached.
- With a test heap that tracks CPU cache state and syncs imported BOs
  at V3D job submission, zero-copy V3D stays clean (0/8 stale) and the
  idle-V3D CPU read drops back to 89 us/frame.

Question to all: should I look at opt-in cache-state tracking in
dma-buf (with a sync call before DMA submission), or keep
begin/end_cpu_access() as is and handle CPU consumers via V4L2 cache
hints?

[1] https://lore.kernel.org/r/20261021175900.GG15441@killaraus.ideasonboard.com/
[2] https://lore.kernel.org/r/7e4c7707880e9092180d28484ecf674be29b40a0.camel@ndufresne.ca/
[3] https://lore.kernel.org/r/1e798600-5a76-412a-959c-94313629baf4@amd.com/

Thanks,
Karl

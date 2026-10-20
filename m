Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466700;
	b=TmDBXAzFG+44ydjJdQb20v+hF694VSCXhrRrNyKDckOk6zl8hKwgqDGPlCWrjgj/E/NE
	 vghJPt2tZovRAXb4AIvsFS7+kzIi47OswQ7bCUAb13cDAY4VoNSXrkvwnBV/Oboo4zuIl
	 SepLldY3lP1WSMEOjRkU4CuuLd+3poDumkVi15ckBZdM4xt27XeyTTebFSbgMjycVuKXZ
	 EPI/5PA4aPHELTl2SIFCKf4xU4B0dKAvAW7NrbLVGzF+KTFVfeSv7QkIe0wTNwZMBbMqa
	 Hynh7nCvczPJUKXFlMSQVnYz0RimmLHob/x5olQH09ScGf3/a2f7Kbp0lzkL7fkG55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
	b=qNJXbxTsUntbN22wWUq9rTi5hT4ZIOIpgsxfvojaWcCiikQdmwWrmShP7nXY4q3O+HkE
	 po18THiKijN9LKZwdQUdcJNL9RMAvpObntaP73Pb7ws0bwnDX5lAd0BycbxoZJKXl75dV
	 xo4ASpuDqhBZG2duqkBH84nsTk276dydf5uuY0uWEIKn/IeMmiw8rkyHriAUaFzyKdI1g
	 LSVh9P9/thmQNOn9b0OC2VSWHq78sG6Yg9x8lIxYWNQjNCbcS0/8AxNTRBrzwPDjMHHQX
	 4U3UU3fvEEF5ZeQDDrC14K7QuCgHQLUHS/o9QD3wlybasvVsb0Y38+VGtNThuVBhksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3egZBHG;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3egZBHG
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e011d370dso2226631f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792466698; x=1793071498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
        b=F3egZBHGyKGcGtkxm3U6zaGanki/60Qc3WhiyxEdrpwmWrrwAcYRSpzt1pRF7vLuDw
         4vV6Xv2nvDCWFqc6KUc2Pb8Y64s5xImsWc1w+6gMW07HQ9InvKVCl3QtQOr1Mplr8jbq
         OPxlwL6sjWYyoc18sDOXhTlwiE33ICGAcnQXJs42QnaI/uJqCmq1WpIJJe8xUL9ltqF+
         d2oazE0zkTBYUrrgD9hWSwyU5bbCcesGZPsuiUeSJWswrvwJCclskoslYO/AT79yOTJl
         y675Cd2gqmZlHnQBJzjXrAAXNBCt8NcxOGD9bZSPbpdAefoNPfRRV9aJMGfFWS0jOHZk
         ivQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466698; x=1793071498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
        b=jvgbMEkiftr8vMFk1jJhzYryNoUK2KpDvQhXP11zOuv++1Z0Gef5J9Q1rqdiF1FcDP
         PPkHwMQ0s/DQGP9JCCG7DRy+so4uSewUQC+KED1v4eFuvTlpMKaOlDliPyZJKjgyzpt5
         k4BO7bfU3Kg4owIINlEqnIi+uuxQ7GQ8YadSYh4oGM2+M7cGgWyqb+WWGodQEOfExHJD
         j1Q8pC2HiJpwq7mlYbjgd5KM2oo6U9WopBqMIRqPME9HENiak0NwqZ33eqdkeg5jTNJx
         q9aV9SmG73TfWu2Rw4i8bT7Fa1e0b7KWrhyOeoljJ7zcbFMl+eiTPIbv9z3nQf6prW1x
         b7Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxQKRpaljkDMN3pk+NABTl89EuQ2WJmY+X9yMzWwKOwLzYV8d/G6J3/4w7tFc4rKBB7uLXK8hqd5eflKoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ5kgZVqBysqIK26dnj1r2SPqMCOMTIY/1bPI0oXUqymA99x6t
	Jvp8yvvYwAjr+xqP5VFpB4zBjWPoqbSUz4o4gOyVrAWZgJluLWMJz/pB
X-Gm-Gg: AYBFou3TgMz1q8gxzXa/d2XlzNyq3MW5RuTJwudRxUmYOtM8kviwH4RlkJYMWyLBQ0l
	QHkw+Fcb983cZXjHzuOvOwncPIperU/yeX60iBHdF+vFLu+Fvf12tOUEPbeiM0qA9DHcZdeRxY6
	Z0pTz70dzUdkASzCiAPwCzfvQ3WYfBWbtTDw8Vweov1LHB6IxEh29/fVtNk+h2HS/6emAguhP0D
	Oj1nmibE/kdwAORt0oYm5blBMq70hEr4rmyUr5i7lBV7Cxr4LGkZ7q2ftd8fCSeT5ptGjTq992p
	b9RhAZM920a3aZ/1q+rl35+c48oNBAbjdq2FhnZT2iRY8Qr5dVPXEI6GTCqeGwxlZwFyKnDfX8K
	eWfWQGI8ziqWCWhHxfI62pzTGl1+XMskC1km0AjaOBveYYvaB6qSOWGNNDcxWxPd3mG2nf7iMJ7
	COsT7/pRYl7leX1CsP/sRkeszn4biDFaVXCPIjDnxpCwfZoUfHqZOpaOIsblPZh5Rqk/MEM2iA6
	xujwL+tiM7ohbw+xUl0nCa0VnzlBQhOPbtjku4YTYVdoYsZJS1zNV0rXBJqctEAyIvFEJS4yUnn
	q9JkbUpv++bhPJHpokev5fPsN0oLz/nZgOwTDUCKoXvTh289zR7eu0QJ9vNMAtlMMulpfoKsWQg
	=
X-Received: by 2002:a05:6000:2583:b0:487:490:8391 with SMTP id ffacd0b85a97d-48e07bb58aamr21758837f8f.16.1792466697879;
        Mon, 19 Oct 2026 20:24:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm2909579f8f.31.2026.10.19.20.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:24:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 05:24:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <atbbdKshkbmbMZMk@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <20261019124433.GU595565@killaraus.ideasonboard.com>
 <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>
 <20261019150116.GA3705@killaraus.ideasonboard.com>
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
In-Reply-To: <20261019150116.GA3705@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Oct 19, 2026 at 06:01:16PM +0100, Laurent Pinchart wrote:
> 
> This patch series introduces a big penalty in the common case where a
> userspace application consumes the frame with the CPU. There should be
> no cache invalidation in that case.
> 

I measured this on my Pi 500+. The cost appears when the DMA-BUF has a
V3D attachment that stays mapped but idle. I compared patch 1 alone with
patches 1-4 on the same v7.3-rc4 base at 640x480 YUYV. For the DMA-BUF
runs, userspace read every frame between DMA_BUF_IOCTL_SYNC READ calls.

Median process CPU time (us/frame), five 1800-frame runs:

                                      patch 1      patches 1-4
  DMA-BUF, no DRM import              129.2        130.6
  DMA-BUF, idle V3D map               130.0        153.1
  MMAP                                126.5        125.4

The no-import and MMAP ranges overlapped. The V3D-mapped ranges did not.
Pi 400 reproduced the mapped cost with vivid (+8.7%) and UVC (+7.5%).

The task-clock profile covered only the patched mapped path:

  Operation                              Sample share
  DQBUF producer END|WRITE clean         26%
  userspace START|READ invalidation      13%
  userspace END|READ clean               8%

I tried a CMA experiment that kept the DMA-BUF callbacks but skipped the
read-only END|READ attachment sync. The skip variant saved a median 12.3
us/frame (8.0%) across three alternating same-boot pairs. With private
DMA-BUFs, the full-sync and skip variants both passed 64 byte-checked
V3D read and overwrite cycles after END|READ.

That experiment still performs END|WRITE and START|READ. In a negative
control without END|WRITE, all eight V3D reads returned stale data.

Patch 1 is independent, so I can send it separately. 

For patches 2-4: How should vb2 avoid the END|WRITE/START|READ
round trip when userspace consumes the frame with the CPU, while still
publishing the frame if the next consumer is a device?

Thanks,
Karl


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641899;
	b=0pEYPptt3kMtbvZahNNP3eg6LaVmJPaGou2KUzwn0q956nQ2cEo1r/XV4+NE82cqLBrf
	 nySYVTx3N+hXqHSxubdrWTSrqcqSYEflDS9eXKZTJNjiBxlF7wJXi6EqLkDA9z0nGG2xF
	 QoxVwdqEFaXTgVEbxVXRUl+3SFD3KilY4sm534Jvis3L5nWJO1TE5SR042DjclN49fr4Z
	 /lLvJdbIY82mGAXq5Z7SPbaTyPc4/BvL32+349X5Q9PU90WFGsdaA8E6x563WMTXhLmQp
	 CRFZosWYP9BaVANxDw3ZGrLEyPfnlDtIml2MLaowqAZnlL8IPPJ8tcmGchZ5txX74Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h3ASAw4d1cV9sNAgpvrJRUDbXY+sRF2LCr9CRfecXT0=;
	b=k6y/awgPsOe3J91Y1qYG1F6eCYKZa8I15yoNiFPf38NfKbgPjWEA6JhEBWUr7BG0evda
	 ewhgmp5mDPqmdduDXVP9j/8EmD5rbQV0QEdN435tV3h6kghCPcJfXBpPznXmL0b5NshHy
	 84+6ZRr6cMZR5oLrUVjCL2XQjzZ//40Eg0Hrz95oBbLE1dk82quD+alvrgkUvGhmCN4Jo
	 M2ONawRGaMTzWIMZ3d6+pD3nTqi4IdSGZ7blgaiKYfmG/+U8GeF6o4LB6VzBSQYbfyipM
	 +H6yDjWv4tjG/LfKndJKm2aCWr4nvFNt1s0Y/GghkV5ZcCzeKQIxZXxXuEKuuqcupuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bv90K3PX;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3081606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3081606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bv90K3PX
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1363016f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641897; x=1793246697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3ASAw4d1cV9sNAgpvrJRUDbXY+sRF2LCr9CRfecXT0=;
        b=bv90K3PXfB3H3Ve0X9GT9PxLiCtj6AW1p+CY8m4MjGQ8Mb4R7x9zaum56DT+H9z0fs
         wjENlgAulhHlBhhy2BcPAXr2RfEE+mDU9QiSoDyDwoQBAssVZCsKhb3VBkXqoHKuqART
         3adavKsXc1KEyWH9up4wO2meMSv/ToMrvp8F9h7Afbo65QtHvapi3gk+FEiFq3r84+Us
         Jjp1VSllDYs8QAiNej5ZWi4tdyn8EImlUhB6S+qo01TWnx6C61KXs286jG1r+w1ql32H
         RgKvXexaWVHTAm3gfr2vUusSeMLDtasYJHSHhIZqkul8sNPcYLVrldZYk94TdyrN/jV9
         hPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641897; x=1793246697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3ASAw4d1cV9sNAgpvrJRUDbXY+sRF2LCr9CRfecXT0=;
        b=G1sTsOSgWbQTF8fIn49mjflvl7oAoVvBXQ/7Wt0PmO3btx3BKKxYA5htD32Kbc8oQ7
         xYqUK7ZUP7LNGFbH0tlm3mrEo0w51/cMbNTJmCL7hfYrVSEeGfytUHgoYnstIumQKGhD
         cxLQab21QplE9HtKUgirlVoNDjlHLv0GJKqBflqhW7ZJCunwHipjBjhvJuvm9e2fcMPy
         nfvnkiiBus0qIZELXEsscBwvZ4mHBjUQngs9rgpuNs3KQc1g6RlCbVZ39aQxYI6blJmO
         8ve//NqwhuoksY4ZGNrPZUT/PM6CM8zigIl+wOSvmkeRkWPgnJrEl+L2/U0vv2xYfTzn
         RTYg==
X-Forwarded-Encrypted: i=1; AKwUvBy61cLsAwkwxfP3GX0vaAwqZSDVA+LgZW2oAIdCjpRcrvmrIl1NWCMZ393lGllKZ+bQ9LkVfjRfxY0ehMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgBAcpg7qlP3EeGFS1hRDgQXND0RvBELYkKpBGM9hM9yP1wX9x
	nk9VoLrYRaMRRwmTRQPYn+JrJvbXHm3mE9POi0ln7dHhziEmU9LlaI6E
X-Gm-Gg: AYBFou1ZXH8n7miIlZxLmdYFMQeId1izF1KoCNKP/O6j9dTHNzU8P0u2n6P/cV054dF
	jr8wIPGf0Fo3RffD3BaYVWSWWItnUG+Z708OTE1c2PVPdAokzvYKnJ/7p2Q7s1RaUU/haV9/ezy
	pbMcqhtytSdfKlUmBUFv7iSz+DVgNlk+j8EAtathVpjeY3kwqn/nKhq5LXcb8kA7kndiheqH/4j
	khmaFeXsSweTsKdHGdj4qeVr3tZZHCikuiXty4gpMfr3I01d3B9w4Gcjamp6R1tSiFLeYt64+Ko
	791sFPEa7kKTov737H0S06wCKWBB5ExAF9AnxsIdcleuMAOz3xw3MXz8rZM2IZZjdyzdE+9ZfwS
	CqGwANJ5EGASnuf5vB+UQmHmVhj8Ia0YPd0bUHMnI5e0UEshRa9S5JeIYryvoQ+M0IPNbHZJtvp
	3cMVNzPSy86cIQF3jajvJ4jM7JBeXAHEE5Cn15pftvGo8QTaoRlyvA+FcLBmymN0TCHzkJ4eINX
	kGlJjo8LuBokM8sM4LAiFDYXAa57mm7QjocVRRUWbukVi04NwK6Q4etq4OncyITZqo0uXtFu9mE
	IiV2ptME9GEoRvMfWtEX0ceduODDVmK7oDLoG3zvZ3rHoG0TAoG+kWDGHfNm4JKyxRUi/X5Om8G
	xzyEzNO9qqh0q3VW50UO97WGK2xHUwhivQOIk0LBLdmyRvfgTmpNFEFfOcNCKC8hh0ejNRqLmUM
	Zv2kgRP9c=
X-Received: by 2002:a05:6000:2dca:b0:48e:3d2:44ac with SMTP id ffacd0b85a97d-48e264a65b8mr7995973f8f.15.1792641897198;
        Wed, 21 Oct 2026 21:04:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25b04883sm10144016f8f.0.2026.10.21.21.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:04:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 06:04:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
Message-ID: <atmKXkOJiGJXgRz-@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
 <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
 <20261021175900.GG15441@killaraus.ideasonboard.com>
 <3084b9bc0d4b5593d2bfbfecb0ce272cb813ece9.camel@ndufresne.ca>
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
In-Reply-To: <3084b9bc0d4b5593d2bfbfecb0ce272cb813ece9.camel@ndufresne.ca>

On Wed, Oct 21, 2026 at 05:03:19PM +0100, Nicolas Dufresne wrote:
> > I think the dma-buf API doesn't give us what we need. Cleaning the CPU
> > cache through end_cpu_access() when the producer is done writting to the
> > buffer is right in some use cases, but not in all of them. It assumes
> > that the next consumer will access the data through DMA, which isn't
> > always the case. What I think we need is to track the state of the
> > cache(s) in the dma_buf, and perform cache management operations
> > accordingly when needed. In the uvcvideo -> display use case for
> > instance, the dma_buf should track that the CPU cache is dirty when
> > finishing CPU access, and should be cleaned on the display side before
> > performing the DMA. In a use case where the producer would DMA to the
> > buffer, cache management would be skipped as the dma_buf would see that
> > the cache is not dirty.
> 
> I also second this as the only viable option. Its not only about uvcvideo, but
> any memory imported by a driver doing DMA (which is not also the exporter). That
> includes udmabuf usage. These days, cache artifacts are visible with Intel
> display controllers, and Intel mobile GPU drivers. Note that GStreamer properly
> signal CPU read/write using DMABuf sync ioctl.
> 
> For most Intel laptop user with GStreamer 1.28, these example produce artifacts
> on movement. To me, the solution is to track the cache state according to the
> access signalling (either userspace or driver), and let DMA user/consumer decide
> if a cache flush is needed. There is a obvious challenge in keeping this state
> coherent whenever there is multiple consumer, of if some broken application do
> concurrent write. Result for the last will always be undefined, but the dmabuf
> CPU cache state should not be undefined.
> 

For a persistently mapped attachment, where would the transition to
device access happen? 

dma_buf_map_attachment() may only run once, while the importer can
submit the buffer many times. Would this need a new per-attachment
operation before each submission, or can an existing event be used?

I tested that distinction with one persistent V3D attachment on my Pi
400 and Pi 500+:

- If end_cpu_access() only recorded dirty state, with no sync before
  submission, V3D read stale data in all 64 frames on both boards.

- Synchronizing the attachment immediately before submission produced
  64/64 matching frames on both boards.

This only covers V3D, but it seems that a dirty bit still needs a
device-side use event. Is that the model you had in mind?

Thanks,
Karl

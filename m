Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641406;
	b=V/M5s9Cdv+MPLFLFe3mqrTa/wk3GuWI6o/plH6JIwidXiVnM6zaVQV0/pyZtfLpzOoYE
	 qf7/7gFmqKDNchq96j/KeOenvoQBqvhArTbff7bhdD6g5LM7WarVm5cejpbys+Qr5ca9/
	 IV7vlKO1SVQbIx6RX37pGkiDmTYlkdBBfCGkpK5NCkwZ1x5ut6x+l0pT81mOw00tzzg2m
	 b92K51HAWeCr7rMQuQMjtjhM2+TLMdVr8AL+1Mc6KltaybFqldYpadYX5f04NTXtpJJiz
	 PBGn/PgoR0Fvb0UwGu1jbOgJTzDFpw8EV8FSxUOJk01782ueF2kCuIiBBXiVHuzXg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=4zpbVCWKZmceTwhBAX7y3KNuUyer4M902oUozSRjXxE=;
	b=FvfJteOkLyExlJlRpk7XTjzyssevsSpt++0XLSeCD5hnyX1PvHvHMc5Jy3YYR4/kqoZh
	 Asa9/SE7DNwflrjDYww1Ft0+MdbXImg+gNAAfJ9a9NbTYkEbMfwswIqM+WSP9QjCNYuDA
	 mVUDSBpFgyL78j1zBHVBmniShWNEuSfj4t7NVQ4REFsyS9rW3Nt2PUVeAtx/i6jSMbH4N
	 XFpUN9rAZrNRr+q6FoDkp2O16WuWmMa4dhWYj/B4SA+xhwJ5kciyHOWsQenO51nf/cBUn
	 cqz/Dt322O3Rh9W/FDZAo8b2zb0HhyZRm0GDoh6xKeEkJuPrSpuObuakZWhZRrun+FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE9606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20568c8c0so2167485e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641399; x=1793246199; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zpbVCWKZmceTwhBAX7y3KNuUyer4M902oUozSRjXxE=;
        b=PjDfxDYaeeH1mCabakxNUf/Je0GJPuMfok6BtPBW1A8VCVt8YKjYOh2NFo2XPeWCLS
         fd2r07Tb+0P6MQQNs3BNA+u/U6aQTn+VdQYjs/h52reNJQsHmuoaDE851CCi93meSCl8
         dO4goZTu+N1qj5mBFdKz1FlYgx8n6cML5oCcgjBwOH8wxxFcAfJmY9MlKSa46l1nhu9I
         eLgTr4Kax+08eA1obSMUTEelGyuNabD0NP1si49LdDmk/20QrxYuM6eAWcLGfrQ8SIHD
         C/0NbSkAV03lr5XghNHhjtutCF3rSjot8jum6HU0j/y6zP3zh6tOgdUBTGnvK+YOarBk
         Rdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641399; x=1793246199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4zpbVCWKZmceTwhBAX7y3KNuUyer4M902oUozSRjXxE=;
        b=IQHJOgVaiwolnipv9xUmGCbbIBaUJnFjMY5oFHvBl0VjU1VMfhK95/I77Vfb8UST8a
         MK+xH10KCy2g03zrc5d2OO5RDTZ0omq27T4LUW2p3yzWH5fIKeOb07vxOaZ1SH8WAB+k
         /6bZPrUvXbM+l71k6IpTsxIevxPtpQkX8m2Lf4ld36mbrK8CejI3xLGvF9hN5znF8NqW
         bELNlpOHnhWcwQDr4Cg8ywhf4uQBc+E+5UQFhPm5EPQppgPcJjK4cbjU5qUWXw30TVUC
         4FdFqQmtT2sheTHv0TtRav2iqqWcuDb0IjQ/3WVB09nNn65PB+v5++jGT5sZZTwivtRb
         O8dA==
X-Forwarded-Encrypted: i=1; AKwUvByHGMF3VpMOKxxoBe1nAcWa2JkEw9zg320sCR3RqD5eLSwT/efQcGMg90CRBkPdzBVO7SuVwNDyQyBEWmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ37+idL6l/92Oz/3etCTYLkMP43Op7KaXOGYxlwxmyrC0q/mv
	uiPczivTmMZI4snaZEoPrtoXCWHy+Qa7seiKGdvaNov+f5wMYyZG4VY6
X-Gm-Gg: AYBFou3b+wGMY5qyR5bmo6d7FZkafkUfgZ3REPDc019TdbY8eCtOOdaDWasNwH+kOAY
	8Sg1y2aHxrSSp8bEzi3u+B/nKsC7yj+IWxce/zs8KAzGYujekA6eNeQHswbkz1AzFcSHb3tv3h6
	qQqruCa/c8SaENcRbrulD0SG8iJro5WXD2fRpgMd7wx5yl/FXZdRLxn8HqCZYWEwuzCDba/duh/
	YW93s8SvbwJHiRY0jGRJUda/klz935YWWa/VBakIeO2NlkJLFdXiMSkjyiCOaa4+v4nn9E1C1l1
	aMtdTZonpjqtoAisx+/XamjYjEzfo4jk1WEq5OxS5VNwJbZHK0tR31GI2QQCnkKrRkya7SNEK8a
	zNebKD8HLEkz3zGNNoD7W0PdtQnM8YUPuDdYYUxAq3Ln3mGfbSQzHQUiZvdBeh4zKMVHS0tiTUd
	t3+uTArTspdPnmagWHtPYkPtY7U1sGIlzqX4B48m5ASnHXxfdYwU9SXBLjXY/zob+jDVE3vsuth
	f4b9GU+86Y9Ib/eE3EKxnhcbIEy2Z6Zr9h6uxMRhfWcp7ifwdcNmht7Yz+jp1YU8AQxIY2b3Hu4
	foSVaGMVAVvrYJP2DapZtcjAD2LgPWca5G+Bxa7EHHpKXAWyDpbPdE+PyKPhu02IM2lP4TAyW/H
	PsZrOWTrifQebcHQlMLpCcIGYREfCk33M3GNyBwVTohlmyDjyU1GurFUCrzLtUw==
X-Received: by 2002:a05:600c:609a:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a1fdd64e88mr75312025e9.34.1792641399195;
        Wed, 21 Oct 2026 20:56:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm86914085e9.3.2026.10.21.20.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:56:38 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:56:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
Message-ID: <atmEfHtoW0Ato4P6@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
 <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>

On Thu, Oct 22, 2026 at 01:20:45AM +0100, Tomasz Figa wrote:
> On Mon, Oct 19, 2026 at 4:14 PM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> > Add a queue flag to do so from buf_prepare() through buf_finish(). Use
> > read access for output and write access for capture. Map imports
> > bidirectionally because CPU and device access directions are opposite.
> > Pass the mapping direction to attach_dmabuf() so USERPTR and MMAP keep
> > the queue's normal direction.
> 
> This isn't right. For the regular vb2 mem ops (dma-sg, dma-contig), a
> buffer in the prepared state is expected to be ready for hardware
> usage, meaning only the hardware can access it until the buffer is
> finished. The vmalloc ops are special in a way that CPU is the
> "hardware".

Agreed. vivid can select vb2_dma_contig_memops while patch 4 enables
uses_cpu_access unconditionally.

Automatic handling belongs in vb2_vmalloc_memops. Regular DMA memops
need separate handling.

> > Keep this opt-in because some vb2-vmalloc drivers pass buffers to
> > hardware. End access in process context because DMA-BUF callbacks may
> > sleep.
> 
> That is at least unexpected, but also probably wrong (I haven't
> checked all the drivers) - the vmalloc mem ops are expected to be used
> by drivers that only access the buffer contents from the CPU.

One current exception is AMD ISP4. It combines VB2_DMABUF with
vb2_vmalloc_memops, imports and pins the DMA-BUF through amdgpu, and
passes the resulting GPU address to ISP firmware.

> Putting all the above together, what I think we need is:
>  1) prepare/finish ops in vb2_vmalloc_memops to invoke the
> dma_buf_begin/end_cpu_access() API if the buffer is backed by a
> DMA-buf,
>  2) some vb2 API for drivers using the regular (dma-) memops to invoke
> the dma_buf_begin/end_cpu_access() API for them when they need to
> perform some CPU accesses to the buffers - typically they would do
> that in their vb2_ops::buf_prepare/finish callbacks, but definitelly
> must not after the buffer is already prepared.
> 
> It sounds like this series focuses on uvcvideo and vivid, which likely
> means that 1) alone would be enough to fix the original problem. WDYT?

1) alone would cover the original vmalloc problem.

But today it would also mark the ISP4 hardware interval as CPU access.

The memops finish() callback may also run from vb2_buffer_done() in
atomic context, while dma_buf_end_cpu_access() may sleep.

The callbacks are void, so errors cannot be returned.

Should ISP4 move to different memops, or should CPU access remain
opt-in for vb2-vmalloc queues?

Thanks,
Karl

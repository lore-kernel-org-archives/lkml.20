Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422088;
	b=YyTVf59JvTrrN/rI87jlzF6mnSm1bXfNAJo5gKwq6ixt9GIEda5WtHgWeeX+A8H0wnw2
	 SEbIRvER5qlOn464Pki9p5SAX5Xs5iqKmC3sOtWMJ8tvXJ0r2dc19LR1LKCWxIhXXro8c
	 3PqEsmNK4+gBBYDdal1zkpC4rieokFGsdy05pHoSet4nX0xbQE5tQ4VxfM2IyCX5D/t0u
	 qZ3pm9o57T2MbLo+z8mATsmLz7M2KpnPGc9ht8FyW2BtFtvleq8KZbZk7fknrrXpy3xkp
	 MdTM1Ht0sfN7Chh/eI0TK4Wt9Hr/Ji1vok4upJhJ8YKl+TY9yHITEBxe9sT4f1jCsWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422088;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2txHb71qwN4Vlv4lifQhXaMRb4VO8n2LuTNEafph6Pg=;
	b=LF7mRQKVldWcTgNhNNwEz6a8iyeDSrfbxqq35kLFIa6/5S26phqDmPsYph19mEjwdNdU
	 V0wH9sqcuCjDQTuc3h69i78JMqkctYshfZTtOijxUB1qPULoJyDW4KOPUO+Kd0o0bTR3u
	 sOQdH/+MCSFYs9lxDBlM8H3fxwPlYx4nrOsH5Aa8/M3Kg5dBL95/4MTaDx5FFf2kS3VqS
	 hLsPeRjDGRlWeMvW1VekAWodd6ob6eZsPtf6k4di9J3psZLLVCbUokIw3IGLFISciZGmK
	 C74m8joD1yhXBkno9oiCNXJx8tOY7b9u9pagGdEc+dhdPYo6JaUGzKI2R3oQPzWbYAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=vqdRDotk;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522D2607AF12;
	Mon, 19 Oct 2026 15:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 522D2607AF12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=vqdRDotk
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4275934;
	Mon, 19 Oct 2026 16:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792421952;
	bh=YEerZUk3r1qUv/X8ek3hLZ9PJHMLtuoRbzXgWyPdUIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vqdRDotkAQPatcMe80g2g6+DCpg6VKKiZ30h+Kte86zyK6qwLEahCX/KbEL5KuhON
	 kiZAElIkNgcl40vBJ9jmdoJq7/3oAzIKo58yCoik8TbWfKHrXztAt32lLfPmbaut0a
	 4Jzvy/gKHefsQNQ2KXTgX/JPBIwyPBzXiWuJJP/8=
Date: Mon, 19 Oct 2026 18:01:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-media@vger.kernel.org,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <20261019150116.GA3705@killaraus.ideasonboard.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <20261019124433.GU595565@killaraus.ideasonboard.com>
 <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>
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
In-Reply-To: <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>

On Mon, Oct 19, 2026 at 04:48:13PM +0200, Christian König wrote:
> On 10/19/26 14:44, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 09:14:07AM +0200, Karl Mehltretter wrote:
> >> UVC and vivid access imported DMA-BUFs with the CPU without cache
> >> synchronization. On a Pi 400, captured data remained in the CPU cache
> >> while physical RAM was stale.
> >>
> >> Add an opt-in queue flag to bracket CPU access from buf_prepare() through
> >> buf_finish(). The allocator cannot imply CPU use because some vb2-vmalloc
> >> drivers pass buffers to hardware. Patch 1 balances finish operations in
> >> VIDIOC_REMOVE_BUFS so removing prepared buffers closes this interval.
> > 
> > This seems completely wrong.
> 
> It looks a bit questionable from 1000 miles above, but I might be wrong.
> 
> Let me iterate the rules here:
> 
> Accessing imported DMA-buf with the CPU from userspace should only be
> possible by using the dma_buf_mmap() interface and that includes the
> DMA_BUF_IOCTL_SYNC IOCTL to flush buffers dirtied by the CPU. If that
> is not done this way then that would be a *major* security issue, but
> I guess that this isn't the issue here.
> 
> What the drivers do more likely is that they use the vmap interface to
> access the DMA-buf with the CPU inside the kernel. Correct?

This patch series introduces a big penalty in the common case where a
userspace application consumes the frame with the CPU. There should be
no cache invalidation in that case.

> In this case dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
> should be called to properly frame that access.
> 
> That seems to be added in patch #2, but I absolutely can't judge if
> that is correct or not since at the same time you speak about userptr
> access and the code really looks a bit like spaghetti. 
> 
> >> This follows the per-queue flag proposed here:
> >> https://lists.openwall.net/linux-kernel/2024/06/20/236
> >>
> >> Based on Linux 7.3. Tests cover the same code on these earlier bases:
> >>
> >> - Pi 400, 7.3-rc4, all four patches: eight 640x480 YUYV frames per run,
> >>   imported CMA DMA-BUFs with a DRM device mapping:
> >>
> >>   Path                          Runs   Stale frames
> >>   UVC, vb2-vmalloc               12        0/96
> >>   vivid, vb2-vmalloc             12        0/96
> >>   vivid, vb2-dma-contig          12        0/96
> >>
> >>   All six lifecycle cases passed with both vivid allocators. Read-only
> >>   output USERPTR passed. The test added no warnings or failed CPU-access
> >>   callbacks. A control without the DRM mapping found 4/16 stale frames.
> >>
> >> - SAM9X75 (ARMv5), 6.18 backport of all four patches: the baseline
> >>   PREPARE_BUF/REMOVE_BUFS imbalance was fixed. USERPTR and six lifecycle
> >>   cases passed. All 128 vivid and 96 UVC frames matched RAM, with 100/100
> >>   begin/end calls. The baseline was already coherent.
> >>
> >> - BeagleV Ahead (RISC-V), 7.3-rc7, patches 1, 2 and 4: read-only USERPTR,
> >>   six traced lifecycle cases and 60 repeats passed with balanced callbacks
> >>   and no kernel diagnostics. A vendor 5.10 backport of patches 2 and 3
> >>   captured 96 UVC frames without stale data, with 100/100 begin/end calls.
> >>   Its baseline was already coherent.
> >>
> >> Karl Mehltretter (4):
> >>   media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
> >>   media: videobuf2: add opt-in DMA-BUF CPU access
> >>   media: uvcvideo: synchronize imported DMA-BUFs for CPU access
> >>   media: vivid: synchronize imported DMA-BUFs for CPU access
> >>
> >>  .../media/common/videobuf2/videobuf2-core.c   | 96 ++++++++++++++++++-
> >>  .../common/videobuf2/videobuf2-dma-contig.c   |  5 +-
> >>  .../media/common/videobuf2/videobuf2-dma-sg.c |  5 +-
> >>  .../common/videobuf2/videobuf2-vmalloc.c      |  5 +-
> >>  drivers/media/test-drivers/vivid/vivid-core.c |  1 +
> >>  drivers/media/usb/uvc/uvc_queue.c             |  1 +
> >>  include/media/videobuf2-core.h                | 12 ++-
> >>  7 files changed, 116 insertions(+), 9 deletions(-)
> >>
> >>
> >> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222

-- 
Regards,

Laurent Pinchart

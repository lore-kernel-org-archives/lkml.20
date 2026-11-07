Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049199;
	b=0S6P5lzTYMwK0hIjOJXJfr1DPw1yykMbRkV6jm2L5+wQbwRL4dOnTLQPi5t9/vBmCy8V
	 atVWgsU0r7S7WCDS0QDFjqhiaDyKs5l5owcHz+Io24WahXb1RJNrjeN6g8mfylAUAKp3s
	 SugzI99jZ+u4I4vZEqTU/I4nIsXl+KDKyBou8ohIpFOi5liQwlhFZfd8deEti8NXpIaxU
	 tY+0Gn2EMAKjKnVPhYnfHSH7CItP5bgzr7/KlNffLts3oKfgkxTh2ipjCBfDlEii1/QhW
	 WdGW3cDYwKM6MwK38EY1nqGFrSj0fbzH9Nw8UqA7XyQ/diZpofA/ouhNwQw0TvuEzZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049199;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Oc4jjD8XQSC2/fee27mZvC70iUwrZPsGol2lwE8De0Q=;
	b=goonYOqzUKMDWbC6METXB0ChDXIVIskdtEzPve+QaLhhm9S498VuEzmtGr4ffCGygMm1
	 svEbTzgx3fAzxD3NX7Zy2Xa/9xt6ja+BQ/PPo07b/qY7GyBfOW2nVhlprjnqYJibC7k1n
	 moHpW32RJgGNT20OxtB7O/t8w6DLsGXpAVGH5vlVvMVytB1aKrbf9xiEFf3IapZQxAk+J
	 rP1ya0yRZvZunFQ6iD/RFjow3L362d0YIVpK9Mk18byhKcU+eU+sGGMG1okHGYSPrYbU7
	 MVKewF4HmPH5/SyH44SNldDj9BLMmw5nzQIBFrE7Yo9KxvCQA60NTqYeXvtjobVkddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=wGel0Pqc;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB08606D803;
	Sat,  7 Nov 2026 10:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB08606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=wGel0Pqc
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4203EC14;
	Sat,  7 Nov 2026 11:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794049048;
	bh=j+h2K+Hb5Cv2MefIVwTunwXi7NhuqCo+7EeZpAlrKXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wGel0Pqc9wogfYLkIWvCWYNBcfKnlwz/12QrYbBRqM/q/lkKG9sovWnku8VZMjSDF
	 yHM9aH+Ag55miR72fxIpH22uACsSXkA1x8k6nLQa7Jy7A6EoknoYnRKWOQfYnNW8zb
	 c/mXHaHtwAUn6AOPohE7aQDZ/LEQerUreLVAQBFg=
Date: Sat, 7 Nov 2026 12:59:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <20261107105946.GA96745@killaraus.ideasonboard.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261107104703.44111-1-kmehltretter@gmail.com>

Hi Karl,

We discussed in v1 how this is not the right approach. Why are you
posting a v2 without addressing that ? You need to go back to the design
table.

On Sat, Nov 07, 2026 at 11:47:00AM +0100, Karl Mehltretter wrote:
> uvcvideo and vivid (when using vb2-vmalloc) access imported DMA-BUFs
> through a kernel vmap without cache synchronization. When a non-coherent
> importer such as V3D maps the same DMA-BUF persistently, captured data
> remains in the CPU cache while physical RAM holds stale bytes.
> 
> Add an opt-in uses_cpu_access queue flag for vb2-vmalloc queues to
> bracket the interval from buf_prepare() through buf_finish() with
> dma_buf_begin_cpu_access() and dma_buf_end_cpu_access(). Keep this
> opt-in because some vb2-vmalloc drivers pass imported buffers to
> hardware, and end CPU access in process context because DMA-BUF
> callbacks may sleep.
> 
> This follows the per-queue flag proposed here:
> https://lore.kernel.org/r/CAAFQd5Am5jBev5P1HmsdeHoJfROZat3bi1W=UsN7wpVqw-XUQQ@mail.gmail.com/
> 
> Based on Linux 7.4-rc1 with prerequisite patch "media: videobuf2: finish
> prepared buffers in VIDIOC_REMOVE_BUFS":
> https://lore.kernel.org/r/20261026071735.37220-1-kmehltretter@gmail.com/
> 
> Changes in v2:
> - Split patch 1 of v1 into the standalone VIDIOC_REMOVE_BUFS patch above
>   and use its __vb2_buf_cancel() helper so queue cancellation and
>   VIDIOC_REMOVE_BUFS share the finish path (Tomasz).
> - Scope uses_cpu_access to vb2-vmalloc queues and drop the attach_dmabuf
>   dma_dir parameter from vb2_mem_ops, videobuf2-dma-contig,
>   videobuf2-dma-sg and videobuf2-vmalloc (Tomasz).
> - Enable uses_cpu_access in vivid only when vivid uses
>   vb2_vmalloc_memops (Tomasz).
> 
> Link to v1:
>   https://lore.kernel.org/r/cover.1792392288.git.kmehltretter@gmail.com/
> 
> Testing:
> 
> - Raspberry Pi 500+ (6.18.34+rpt-rpi-2712, aarch64, 16 KiB pages,
>   Sunplus UVC camera 1bcf:2701 and Broadcom V3D 7.1 GPU), backport of
>   the prerequisite patch plus patches 1 and 2: eight 640x480 YUYV frames
>   (614,400 B) captured into DMA-BUFs pre-seeded with 0xA5 and imported
>   into persistent EGL_LINUX_DMA_BUF_EXT textures before VIDIOC_STREAMON,
>   then copied by V3D 7.1 immediately after VIDIOC_DQBUF:
> 
>   Heap                        Baseline stale      Patched v2 stale
>   /dev/dma_heap/linux,cma     8/8 (329,890 B)        0/8 (0 B)
>   /dev/dma_heap/system        8/8 (509,818 B)        0/8 (0 B)
> 
> - QEMU virt (arm64, Linux 7.4-rc1 with the prerequisite patch and
>   patches 1-3, VIDEO_ADV_DEBUG=y, DEBUG_ATOMIC_SLEEP=y): six vivid
>   lifecycle cases (stream, streamoff-queued, prepare-reqbufs0,
>   prepare-remove, close-streaming, replace-dmabuf) across single-planar
>   and multi-planar queues with kprobe counters on
>   dma_buf_begin_cpu_access() and dma_buf_end_cpu_access():
> 
>   Queue                        begin/end calls   Unbalanced   Warnings
>   vivid vb2-vmalloc (SP)           34 / 34            0           0
>   vivid vb2-vmalloc (MP)           34 / 34            0           0
>   vivid vb2-dma-contig (SP)         0 / 0             0           0
>   vivid vb2-dma-contig (MP)         0 / 0             0           0
>   20x prepare-remove (vmalloc)     20 / 20            0           0
> 
> Assisted by an LLM for code changes, test harnesses and commit message
> drafting.
> 
> Karl Mehltretter (3):
>   media: videobuf2: add opt-in DMA-BUF CPU access
>   media: uvcvideo: synchronize imported DMA-BUFs for CPU access
>   media: vivid: synchronize imported DMA-BUFs for CPU access
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 76 +++++++++++++++++++
>  drivers/media/test-drivers/vivid/vivid-core.c |  4 +-
>  drivers/media/usb/uvc/uvc_queue.c             |  1 +
>  include/media/videobuf2-core.h                |  5 ++
>  4 files changed, 85 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> prerequisite-patch-id: aa99d5c3c27082cbe003ed94a195e3de415777c9
> -- 
> 2.39.5 (Apple Git-154)

-- 
Regards,

Laurent Pinchart

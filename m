Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480351;
	b=H2riEpiqkn+Zu13sNh0ySGRc50cZj5QFodhYh/OFW98mp+BnNe3iX7cm1pe045cQ7872
	 L9tkEdCpdilq51L9OHhpGTMKjH4vZ6ZWlICwK4pVvc5cBPVtx2ccuIVQh9wIbkKmDYwTr
	 q7gTu4yywRfryEx1A+JACfRq3Kr/9AAC4AGBhvcMIe/JzrsATKKkrRzfx13I0nf/02EwO
	 S4SdWIkIiBLZD/9Szl6gcbEQz9oifJCY8zs499AMAIeqlecpBn8mt1xyB3xKBYxHvoK7P
	 2pvApwLk+oAuoMXxvLwVbsAUGJpDMaSUTydmOn5SBrm+xOZ6Za3rY2V3G4ldIuU6Ywg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480351;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=vE5h/yx8/zL5y/9bVhY/d/nCK5S2dR4yjgKbW3Cj/RU=;
	b=mtjelxkDtT3Qnb97nNhJsJ8K3YPTwM9pc96Qy1Vv7CUkY+x3e4stcCebWcHujuT63Bws
	 ynWJB1vLD3U6pu7IZM+VnjdEXHlkyPIDK//KRIAsV8JEkUUwbcOxvY39Qlc1cde2Akb0P
	 L3vOBkV+ZEnzfIbbzTspIo+Mb1dmlejJN1VLuuJlw1w2fGuMgjRPOeJmFQmf6P3UUXyi6
	 ulQrlkkLZTvsMwyfyqjzBt1sLquo1xB98vHluTC6t61kPY0Ld5C+z3c7tcznUKVx4bYxN
	 fZiv3Vk/Vq7CvZ8kM6PvUDVFilAzOhYOdROPn8WDdjIVKPJx1nQ4xe1vLzAd9GcBIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=XyeeDSbE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50329606A31A;
	Sat, 31 Oct 2026 20:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50329606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=XyeeDSbE
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998CCC1;
	Sat, 31 Oct 2026 21:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793480205;
	bh=hZ6wxHe7flnyW2Otc3yTvX00TNNSJqtOeZppvOl9ZFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyeeDSbEiS26R5eqV58/jMD244ohGGgum/nf7blVlok/MLKMG5eXdVvY1c0NQ7mui
	 ecYh+Dqs1woNhEpGahqnRZL38/Ove2snK4DcPW6nQLBPw3LkWCVQrF9WSULHE9UGey
	 +3eq6SRjTgZsiBDAFbxmmfgsruYyQXP46msFWY9o=
Message-ID: <30c65bce25544fc867abfa5abdadf9fc@killaraus.ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Samarth Narang <samarth.colleges@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] media: xilinx: dma - stop_streaming does not wait for a
 running DMA completion callback
Date: Sat, 31 Oct 2026 22:58:34 +0200
In-Reply-To: <20261031202653.4110846-1-samarth.colleges@gmail.com>
References:  <20261031202653.4110846-1-samarth.colleges@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello,

This is an automated reply.

You have sent a patch or bug report that appears to have been generated
by an LLM. The commit message, code and/or problem description show
little to no real understanding of the issue and changes being proposed.

Such patches or reports require a large amount of work to handle. They
rely on maintainers to propose - and often even implement - a proper
design. The probability that the author will learn from the experience
to improve their future contributions is close to zero.

As a result, to make good use of maintainer time and keep the kernel
development process sustainable, your contribution has been rejected.

If you believe the change you proposed is important, take time to study
the problem, learn, and develop a solution without AI assistance.
Answering this e-mail or generating a new version of a patch by feeding
this reply to an LLM will only result in your e-mails being ignored.

Please note that if your patch attempted to address an important
problem, maintainers or other contributors can submit and merge a
similar or entirely different fix without crediting you.

Your contributions to the Linux kernel will be welcome if you genuinely
desire to invest your time and learn.

Thank you,

Laurent's mail bot

On Sat, 31 Oct 2026 20:26:53 +0000, Samarth Narang <samarth.colleges@gmail.co=
m> wrote:
> Hi,
>=20
> I think xvip_dma_stop_streaming() can race with an in-progress DMA
> completion callback, potentially causing a buffer to be returned twice
> or accessed after it has been released. The line numbers below refer to
> mainline at 36aad21d50d1.
>=20
> In drivers/media/platform/xilinx/xilinx-dma.c, xvip_dma_stop_streaming()
> calls dmaengine_terminate_all() (line 442) before taking queued_lock and
> returning the buffers on queued_bufs with VB2_BUF_STATE_ERROR (lines
> 449-454). Meanwhile, xvip_dma_complete() takes the same lock, removes
> the completed buffer from the list, and then calls vb2_buffer_done()
> with VB2_BUF_STATE_DONE after releasing the lock (lines 283-296).
>=20
> The Xilinx DMA provider invokes completion callbacks from a tasklet
> after releasing the channel lock. Although xilinx_dma_terminate_all()
> halts the channel and frees its descriptor lists, it does not wait for
> a callback that is already running. That synchronization is handled by
> xilinx_dma_synchronize(), which calls tasklet_kill()
> (drivers/dma/xilinx/xilinx_dma.c, lines 2739-2743), but is not invoked
> by dmaengine_terminate_all().
>=20
> If a completion callback is already running when streaming is stopped,
> the two paths can race over the same buffer. If stop_streaming()
> acquires queued_lock first, it may remove the buffer and return it with
> VB2_BUF_STATE_ERROR before the callback attempts to remove the same list
> entry and return it again with VB2_BUF_STATE_DONE. Even when the
> callback removes the entry first, it may still be using the buffer after
> stop_streaming() returns, at which point videobuf2 may release it. This
> is a callback synchronization issue rather than an outstanding hardware
> DMA transfer, since the engine itself has already been halted.
>=20
> Since stop_streaming() can sleep, I believe dmaengine_terminate_sync()
> would address the race, following the approach used for stm32-dcmi in
> ab32b2c3636b ("media: stm32-dcmi: remove deprecated
> dmaengine_terminate_all()"):
>=20
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -439,7 +439,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *v=
q)
>  	xvip_pipeline_set_stream(pipe, false);
> =20
>  	/* Stop and reset the DMA engine. */
> -	dmaengine_terminate_all(dma->dma);
> +	dmaengine_terminate_sync(dma->dma);
> =20
>  	/* Cleanup the pipeline and mark it as being stopped. */
>  	xvip_pipeline_cleanup(pipe);
>=20
> There is also a related question about the error path in
> xvip_dma_start_streaming() (lines 422-427), which returns previously
> queued buffers with VB2_BUF_STATE_QUEUED without terminating the DMA
> channel. As far as I can tell, their descriptors remain pending and
> could be issued by a subsequent dma_async_issue_pending(). Is that the
> intended behavior?
>=20
> This issue was identified by a research static analyzer for DMA
> lifecycle ordering and subsequently checked against the client and
> provider implementations. I have not reproduced it on hardware, as I do
> not have access to a Xilinx video pipeline and QEMU does not emulate the
> relevant VDMA or video IP. The proposed change has been compile-tested
> on arm64 with W=3D1.
>=20
> If someone with suitable hardware can confirm the race or test the
> change, I would be happy to submit it as a proper patch.
>=20
> Thanks,
> Samarth
>=20
>=20

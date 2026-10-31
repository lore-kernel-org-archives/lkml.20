Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478420;
	b=ocbXSPGFb6tF5tO1PXrZskF4KaYTMEIMzBN8peEzjIrvfHE3EafJqClTPvUkLm+/wwtV
	 6ZUL6SuccsvKtN6HB47jveQ9/qIdkGTKFxIF7RnE4lkwQjfrfkCUYbAJOKkXM7OcNAurB
	 JyzMIQZiKi/hWJxRyVyCjWTpq1U8I0dZVJBfR030h3ORslzES8vujFmLCh9zUEMRodlM1
	 Dm2eEymgIkYeSVpqeAtFt03gLXpgQs0rOuTez+4Dm9ALhxuZpOp/umLoTrYWk9KgdhRto
	 A0NvKZ4hqfyqIz63dBaYa5WhXlTFM8VN1Bv5K1jwjQI6YnpNEun3+xljeIOC0qlhU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
	b=A9TeXF4pRYUWZXYhCnKPigyOmKM0PN2exs2UkQvjJRLAZGyzhbF1elF3idr7SVHiu/kw
	 EA/psxWB2kdIjDm/ruY4mrY8xt6ibMV1AMgTqkgZZqzpcWt7XbYdxnjLEl+UdddwmFSDm
	 LL3iyFRJTucCJfuqFSB8sPFtF4xj9td88DG7yOg5FtnU94oYgqL3MTS95XZ05vlHIGJ/3
	 L/oPGStkh+6KFuZfNKSEI744uDVfvFxOJp4PRNsXEo7+wwICmDO8ekYd9l4WXl208MpN6
	 QFjsGQw9meL/UCYEsacOdInsseeJXoGC8Tw+Po0bbOi7tuWk9n/mAJLMiOa7WmmIlxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpQhYkHc;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E8C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpQhYkHc
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so2343450c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793478419; x=1794083219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=YpQhYkHcvMezUVrsCJt+POW0qMKRK2IAyrGI8CMaeBiXmpObZI3xUHi4lKo2KtdmwX
         Tt69uwKDvF65tSkbhPHPDlw8pJOdZFcQ6RVtFugWe1yEVQay0q7jsaR6r4xzhSyLg03i
         U8/R15JE96xUTIe90uGpZgytXZSOwBnP2vwnnM67frdWYhSkk8Tm4icqmZQsBJEJrjOV
         7wCxSKOYzCC7JUrHeGhzYpFp1OMLxCyrWbOokdYYZbwBSLKl5tHncIGdtFEBa1njncot
         V5Uegr2DxxB/JEEdd+Qj21Hzq/YLnuF/NAQ442GngY0dr6IpumVkEhTMxviTOaE3M9W+
         wDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478419; x=1794083219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=Ary8b8u9I6lAc7kbY3PPCptiD99p7vd0rJDac/q3HeDvbukH48ZLnm91DmWg6kvQFl
         xCofqcXZzZBkpAG1cuRGJ0DW6TS3QNeQsXdPAg1sHoE/a/8y8bGf3w5GH0RU9as9Y9mB
         bVZj9MYOztlqz10dS2qExch7yAamVmdlhdyIjDO79RC3AJx99+BEWDRmz7BNa1WURC4c
         kn0j230AECgTTEdpRbrdX2f/2usKcLyH+DtuxXx2Ew2fLT2W13/NgzRVqDogGvXli8bv
         NwrAvGGmOxFJ3yg3q3FC20BjUETtnSqxxGN8IXBr4KzTcC6Tlbpjg8k0deUFpfNkTEeD
         r4yg==
X-Forwarded-Encrypted: i=1; AKwUvBzdMYMCRlZaWgrauCz024n28UHOPxysNg3yvUdQIsXCK9C4S7OT46sb3jWTgrsWgERu2jjrCSmpmfCk7As=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzczhlG+VZLb+LBvYLx2hXgKV1RS1A7B1vPNc/tBfarNbFHFLU
	WgffxTQtbOTFYE1NR5fk4QEkeogcgqeDZKRmRo6iE44CcuTaVVz5o8Hc
X-Gm-Gg: AYBFou2JUOmNmWyzAPOxQ2Dx9sZnbjJhJVoIHww/YxBPAHPObNi57IKaPD9VWRetaih
	vpR6i96qiLA3M2JLMD8d0yGneLWFYloZzY2fJQcBWKRzjw+gutWhLyFDJZHf1sf+gWOqMPj78fd
	EDOv8ns99TxYopTSsASeDk7jtR8ztIblTuu35LrjwFNtXpzMp4HkG8kn6bPiJ8ujtoruaPjrad4
	UXzI+Oiui5GgBd+QKLMD1k5wc/99OwKc+DIVxUhzGGPVpumw5sSUo0wCSTSgsnExCfqE44qsglW
	fmzBh5DhIIJiz3hc602R5cho0/gRQShHURW2SIVNd+fqxFOd7QwCDNTLTJqIoAtoCkcYfSeIN60
	QhCRgZFD/mnIw8v1KCJ9jeyDhtVAGw1eWfD/myMVrON1DW5ddXYlooEH05qRErUky1QDey8abY0
	u07PI12rqIRlbUfnXtvmr94Qtg8aTOEQ49wKlxC5eWTw9GLJHztMRN08MMtUbYaTwHOIciLrtBt
	odav9QbTHgLDrCN5JuzNIdRlsLvV0ihT1xJU0E3c15MHQz+VWNRdICbLtrvRbhZpG+3FRiF3mLc
	iPogMyg2NhVdUUl5KvD7YIkXI0QNWL0X06gDMGj7mvh6swd3aLJuB86X6XTq+kUeknmicKfAdCP
	T5aXQ5vVFXUwwatR5mLJe29fUFKv5ps9f2hdsden3zMlUKOrJmv2qkt8b3rHoFgbEXHerJIdsRj
	IVHlmm1alDZnWfHEQ=
X-Received: by 2002:a05:7022:3f0a:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1ac56c9fffamr9537679c88.6.1793478419246;
        Sat, 31 Oct 2026 13:26:59 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm1639998c88.9.2026.10.31.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:26:58 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] media: xilinx: dma - stop_streaming does not wait for a running DMA completion callback
Date: Sat, 31 Oct 2026 20:26:53 +0000
Message-Id: <20261031202653.4110846-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I think xvip_dma_stop_streaming() can race with an in-progress DMA
completion callback, potentially causing a buffer to be returned twice
or accessed after it has been released. The line numbers below refer to
mainline at 36aad21d50d1.

In drivers/media/platform/xilinx/xilinx-dma.c, xvip_dma_stop_streaming()
calls dmaengine_terminate_all() (line 442) before taking queued_lock and
returning the buffers on queued_bufs with VB2_BUF_STATE_ERROR (lines
449-454). Meanwhile, xvip_dma_complete() takes the same lock, removes
the completed buffer from the list, and then calls vb2_buffer_done()
with VB2_BUF_STATE_DONE after releasing the lock (lines 283-296).

The Xilinx DMA provider invokes completion callbacks from a tasklet
after releasing the channel lock. Although xilinx_dma_terminate_all()
halts the channel and frees its descriptor lists, it does not wait for
a callback that is already running. That synchronization is handled by
xilinx_dma_synchronize(), which calls tasklet_kill()
(drivers/dma/xilinx/xilinx_dma.c, lines 2739-2743), but is not invoked
by dmaengine_terminate_all().

If a completion callback is already running when streaming is stopped,
the two paths can race over the same buffer. If stop_streaming()
acquires queued_lock first, it may remove the buffer and return it with
VB2_BUF_STATE_ERROR before the callback attempts to remove the same list
entry and return it again with VB2_BUF_STATE_DONE. Even when the
callback removes the entry first, it may still be using the buffer after
stop_streaming() returns, at which point videobuf2 may release it. This
is a callback synchronization issue rather than an outstanding hardware
DMA transfer, since the engine itself has already been halted.

Since stop_streaming() can sleep, I believe dmaengine_terminate_sync()
would address the race, following the approach used for stm32-dcmi in
ab32b2c3636b ("media: stm32-dcmi: remove deprecated
dmaengine_terminate_all()"):

--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -439,7 +439,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 	xvip_pipeline_set_stream(pipe, false);
 
 	/* Stop and reset the DMA engine. */
-	dmaengine_terminate_all(dma->dma);
+	dmaengine_terminate_sync(dma->dma);
 
 	/* Cleanup the pipeline and mark it as being stopped. */
 	xvip_pipeline_cleanup(pipe);

There is also a related question about the error path in
xvip_dma_start_streaming() (lines 422-427), which returns previously
queued buffers with VB2_BUF_STATE_QUEUED without terminating the DMA
channel. As far as I can tell, their descriptors remain pending and
could be issued by a subsequent dma_async_issue_pending(). Is that the
intended behavior?

This issue was identified by a research static analyzer for DMA
lifecycle ordering and subsequently checked against the client and
provider implementations. I have not reproduced it on hardware, as I do
not have access to a Xilinx video pipeline and QEMU does not emulate the
relevant VDMA or video IP. The proposed change has been compile-tested
on arm64 with W=1.

If someone with suitable hardware can confirm the race or test the
change, I would be happy to submit it as a proper patch.

Thanks,
Samarth

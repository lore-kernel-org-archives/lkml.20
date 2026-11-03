Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716267;
	b=CRd21PBxOQ9RgDatZ5kLiRb1won/vKua5FIpz1R58XlZDcDHWMLyNzNgBVAspHWQz9XZ
	 fVSu2ogWRHk/hRsaqIhvhM1odcvE2wrwXlw6kteQfpGpuqYL2PB+iKpecchPvQVWiHJ8J
	 BypZSPnKBx3Y6pr6vwQo2hZrAfrouQDMXIWUC71I5xHSDDnM/ihm5QByfzqleZdrZi1ow
	 8SybKb3VHFDqJN4fahpO1r1uohVo2gZba3RKD+IIJbl1wueDbt0LKef6i9fClSslUdjPP
	 wJfFEGAG7C+Sb+5uXLNCH2hiK8ivMTziEb3uNaBtzsTu8ko8PfBDwvCWZBV9VECYGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
	b=RrgYEVaXIQS8HobQLcd5oz+4+s+Rde3IqNs3NNtUCCc/dxQUxqs2SHYjyNsS1aExbSIG
	 JbSuIWDbQ7EwE5o8d34pblSOLiCxSUzYqB2sJWmq8IqP6gZUI4pGXH0x2fRuVx7lIrAhi
	 Cv6S8YlrxeK7ogOvfYK1gtv85+r/kFtG7D8FF7rg1nUVp3CZ9i2o8kodXYiHrpf5OjoDx
	 ZcRD6kRfNTmeNyW2EExDvM99NCP/Dafb8iwa6wMgwP4cuX5PZ2M9UFpp6Jr7qzW6pu3O5
	 WGb5OUEwAUk9DZY1cqGtf80zd9tthM+jZQOZ7VPcr46b7636Xpwl13gX54dCKogaKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JAL5xEbx;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26F606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF26F606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JAL5xEbx
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so8730431c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716266; x=1794321066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
        b=JAL5xEbxeRyI5iZfq2c75QvgWSvM8A+hwAkPoB5Ef0uYyHxKF51D+EkIcYAiVT42GW
         O8+rFQnzDXYUm2OXJlerdC3iicYR4aSaSaHH3Ep/VgS3dutNQteQPI38N9cTs923fA4D
         BIryhyqdfWTScigh6MyLKL1CJS2d6DQawQgkmWOyqgp69tkPhN8FiEZNW53On/G87OWp
         kqGTqlIrju9gHXn+A4kicd+uohnWUkqFnZgHPqVrRm/AudeUaSqo5Vxq/cHqmboyto3O
         deySONUwD/jokWH+7+DxV4OSMbR/tJKnNpueSZ3h16f9pmnrEaRKiRgNtstEGOao5RnI
         wqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716266; x=1794321066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
        b=OFkRYmabUKk4QlhelHbo7euB0panjR84baBD+BK3IkPUK8a8+o+QFtLwZiIiXWaBgV
         z0oF1Rc4mzMO7ZucapudPUMwJAbPDPqEJyNR6QHoLtsFHAEQ76hBXgor1zx1nUSvdIAQ
         xZs1HkIEwn5tH5z4Njqy8D2alqtmPBvg7DkRr4g2DzPYayLJXJjiw1ygXhp9hxKBjP2b
         YGp9zu4fKDKxq0Im2aGLUPfPPSEHVtjgtzH+0+YT1TY4Yas/D0/vwgzz3He+Nf35HVmm
         EiGnE/ePZBqDm+E4NaLitmMQH97GfEhalnYHthWIOeaoRaFsNQqADjRFLLF0XSaNj9uV
         T7xw==
X-Forwarded-Encrypted: i=1; AKwUvBwyNmaIFABr12HexuxzhtaRaLB3akounFBcDwzGdfQYccsqFr+P4EQySpPptxBemD6+rs0pCEZ1KIw5BE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8VfFFK9HGMoeF/9XfHLRZMt1eYz8MjcXEaRtDPeag45jTmcFV
	jxDgz2ILh6pAkuVMBEinVhp40Qj539wcyDhmYa7ruavmkBvm11QdCGc0J8tV/bghVNE=
X-Gm-Gg: AYBFou1d+bZ7acvpHg3mNziXS/Q+EkyoZlI+MXrlTRFrtlk+JN3b3zrx5DGhBxogneP
	GGIDkk+Fb3/bJUREFYaTA3rOTjqf5qiBYSvkK20LSf698cJew6IUlWqtcHoWt+v54S01sXaP7IQ
	Y8TIn1oVIX+0Z+Z2VAMhwhfkdb775+6XkHDaiIMrSu5sNxc43M7C3ev3MpNJCWkRFjGJbTulX9v
	WjUFRWrbnrLm77mDnLNEoDOXObnxaWo1vaOlzFHPtli6+TDSKzfeTTXV0NX0IxS7wQUXy3ZkYtq
	hfKHv9R2U3robWm60Z2o3MhvC3soCLq4p63llvjQv2aXJ8hGnGWz1xv/NnISOU56Cbg3WPV1Scc
	IRRIzFsUAkPi82cKix0Bjb71MzCfVejLgz6HlxkRTOJBYBSKNjVuNKVPEBuiWgoxKKSZGMyX00k
	rXCwcOI8DPfd+9ecUdrrCe/kyymL6rdwDFgyBuBFI0GJ2118v/BEXVxMxEvRI9LGTFCoHeiLKjx
	kQ2k6fQu518EWaWSnIWaIIpmxFcrkX5Es6aL37Q3M7ljLFXZg9MttPYgusZCxxIQDbOz18mAQSh
	GUr2Ac2eEEW+RwEXrMmzANi09YAGTmDBbB0Jmnh0wmLooPLELySWYWtE6OZ6STay9GwmEOBpMu0
	9+FZCMVrppG67
X-Received: by 2002:a05:7022:c88:b0:194:3a84:e67a with SMTP id a92af1059eb24-1ac5d0da7e6mr18645854c88.41.1793716265860;
        Tue, 03 Nov 2026 06:31:05 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:05 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Eugenio Perez <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Ming Lei <ming.lei@redhat.com>, 
 Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261103-virtblk_sync_quiesce-v3-1-f40233f9bdd9@oss.qualcomm.com>
References: <20261103-virtblk_sync_quiesce-v3-1-f40233f9bdd9@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Message-Id: <179371626469.3691261.7199603294029974156.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:04 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 18:32:21 +0800, Cong Zhang wrote:
> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
> while the flag is clear. It can then be preempted before it gets a
> request. At that time, it has no queue usage reference, so
> blk_mq_freeze_queue() does not wait for it.
> 
> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
> dispatcher can run again, use its old flag check, get the new request,
> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
> reset the device, delete the virtqueues, and free vblk->vqs. The old
> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
> kernel can crash.
> 
> [...]

Applied, thanks!

[1/1] virtio_blk: use synchronous quiesce in virtblk_freeze_priv()
      commit: 6c6dec7883f8eb10b326bc9d109a4990c885d949

Best regards,
-- 
Jens Axboe




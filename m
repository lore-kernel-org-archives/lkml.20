Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD433D9549
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274191; cv=none; b=UV93OHdLNlaVo/vhLHFkG6MkWEJzK+fEHOKT47bSm2xV1i4VRSJ5FDUdCjoHueCsGIiihTfO4UP1tL8T7osH2rtuehHVugCNEoYuPcNiJr1IwC5eRiHoKGoXjlYOVmALlbkS6z9PCBhwLM1SPeUGlId/AczwljwckqPaOU1eGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274191; c=relaxed/simple;
	bh=enBsXciepZa00b2yjc+JYOC6Y1UvYHKp+PIvstbTzf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XG5EaNG54Sv0kUizv3qI5BThS3iSPdCKpTqZk4Hd1vpQ4XP4Dwb/m2mRB0ogkp7zfq8/H7ekx/UueF+c3x7ABV+LjanjfvNNR9OptbjaxNTsjiDDL/zAtRsulmK29jIpKNGCqoV3kkaibFvBv27YOv0ipxgbsPEhbvqgjjvnqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9mW/Yl3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9mW/Yl3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so3079435ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274184; x=1791878984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlNumo0XDQS2lJkteQBjfN8Fb96oMehV3mMd0MRgQKQ=;
        b=n9mW/Yl3uXDzDNaBInoUjSI+qLDsjc9SM6uhCI+efamOB/eCP19SGfps5hhQKMZzmi
         phO5sWwXbWCV4tRy5erFqLp6NCdlAifP+XBLAcjBX8d6q3v9DzstQrQzNrHaKAE5K7hW
         5+XRm4E7+6Uul9uXxL37Dp3YYp43w5ybDG4iir6y7kQYs2HE8aJjKRdb8mT6X3JsYpU4
         QQxUGNwPoItbgfpn/NrP9w5U4y7HG96bsUaBk6Ojftlnt05oRkRunbAm6VnGXxAJJXj7
         95zxWJ7emaZvLpBvLvhsGp25dZIXgOhbV5+ieiUGqHDUoDrPVvC4FGC3qDiNh27nfNlH
         oaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274184; x=1791878984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlNumo0XDQS2lJkteQBjfN8Fb96oMehV3mMd0MRgQKQ=;
        b=SLa9vPKGziz3oe3B9cryHYGngSv45BFTE7hGRSIC+NLD7WYE9vv4Kk1X4cQ7d4Xjvg
         3OOvhtY7nAgyxMoJZbCQn24v/Ypy4OXU6d/Yry8N5o0KVgRE5hhUKGblz6FFo3/fV0DC
         DW5jt9FEPHOZdGyfZoBn4VCJj5GBi5Rf5bKd7+7BPZSxoWs02rQ4jqkKzmOV8hYNvkp4
         M9LKOBj6WlqWzxQCsysDw5Y4nMZJLvQn4n70jvIjVW26NCtXitEm5gaKh7cqsxwY3mmP
         jXCyqSr84Cuyho3XCUsPHMJUKhS7jSMHLNQ0xdhQ9gHbpMW1ZNaFASPlqrPY7ERisKG1
         QOrg==
X-Forwarded-Encrypted: i=1; AKwUvBwHdrIKfP0qap+R2N7doFzQI8QK84TKIN6kiwfga5kGUCkgd4RSNlDXseUs9Eio/pj4pbEHPgR/wIgWBH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZfHmL9i6gSo1Hb4fukoTKqdolwhQmh/hf9cHyMnXugqEVV0rh
	e58+sgQ5iwI6S66TR1/3wcmqfT7Rcr9dPbZlLqMUdL16OnRvSGtl3CB6
X-Gm-Gg: AYBFou08SS4TyNMlRHQqTaE2Sxx+0zIQBePCinNzFzBCWFhNMX5iBxJk4LxpknjHeMY
	quA3AIJ1eCTyXDQDYCsbSu0e6b5Blut6RnD9VyRaAJ41tfJBVjGHZoZAzGvU4kr7+vGuAAl4daV
	8sqbJ9xGBZLF8sQguwUb0HqrpV8A9t9xbyROStuaP7aeOJynmLqglXH8xFbtvA1T3V2FP4TI1jP
	PHqvp5FH6o69lcVI3I1GsVnX86B9fFzSdrYIRBFQx8aRgOfNsUWP3BNvsTxI7WVdOAFQuEqNFqj
	WNum1yErFyQ/GEVDMIgMiTpIBn4XxM/3CfyuxYNtgN1c35nt5q1CRg48XsJtjHhdkysUfSBwJHW
	Zfsbmp+k6GQqoK8/h+9vlV5shH9GWzrdNusl/J2yc7pB2F7nDeXf9lL8cBih2se3BakSW2n8vAA
	KWObRd22JFhr9Bm5D5DwvFdBQM68zpclKBRq+nF622ShXxAJnRq3uis//zdXa2kwvI7cnNIDeqt
	wrxm+dAlrITyMNYED2Vd5vLcFFclT/ruErIbqSCjZ4spwawSHHYJ1eKaIb6PSKSqk5hcOZaM7xp
	G+ybfgsCPrzhJdAKY/uhVsNiBbvMDf/8NHwXGSQPKgvi3YthwPjzuxIKNg==
X-Received: by 2002:a17:903:19e6:b0:2e5:dc5a:c795 with SMTP id d9443c01a7336-2e5dc5aca22mr5127565ad.36.1791274183691;
        Tue, 06 Oct 2026 01:09:43 -0700 (PDT)
Received: from 0xiviel.ip (122-63-128-121.mobile.spark.co.nz. [122.63.128.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ef4dbasm18597775ad.71.2026.10.06.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:09:43 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: yidong.zhang@amd.com,
	quic_jhugo@quicinc.com,
	karol.wachowski@linux.intel.com,
	max.zhen@amd.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: sonal.santan@amd.com,
	mario.limonciello@amd.com,
	wendy.liang@amd.com
Subject: Re: [PATCH V2 14/20] accel/amdxdna: Implement AIE4 command packet building and submission
Date: Tue,  6 Oct 2026 20:12:45 +1300
Message-ID: <20261006071245.197376-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006042230.547807-15-yidong.zhang@amd.com>
References: <20261006042230.547807-15-yidong.zhang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 09:22:24PM -0700, David Zhang wrote:

> +/* Job timeout detection (TDR) will guarantee the fence signalling */
> +static void job_worker(struct work_struct *work)
> +{
> +	struct amdxdna_hwctx_priv *priv =
> +		container_of(work, struct amdxdna_hwctx_priv, job_work);
> +	struct amdxdna_hwctx *hwctx = priv->hwctx;
> +	struct amdxdna_sched_job *job;
> +
> +	while ((job = peek_running_job(hwctx))) {
> +		wait_till_seq_completed(hwctx, job->seq);
> +		if (get_read_index(hwctx) > job->seq) {
> +			dequeue_running_job(hwctx, job);
> +			/* Abort partially submitted jobs; complete fully submitted ones. */
> +			if (job->aie4_job_state != AIE4_JOB_STATE_SUBMITTED)
> +				job_abort(job);
> +			else
> +				job_complete(job);

> +static void job_done(struct amdxdna_sched_job *job)
> +{
> +	job->aie4_job_state = AIE4_JOB_STATE_DONE;
> +	dma_fence_signal(job->fence);
> +	/* Release submitter mm reference taken at submit. */
> +	mmput_async(job->mm);
> +	kref_put(&job->refcnt, aie4_job_release);
> +}

The get_read_index(hwctx) > job->seq test here reads a value userspace can write, and this patch is the first to let it release resources rather than just end a wait.

priv->umq_read_index = &qhdr->read_index is already in drm-misc-next (drivers/accel/amdxdna/aie4_ctx.c:212 at 34e9ab018249), but there its only consumer was check_cmd_done() from aie4_cmd_wait() and aie4_vf_ops had no .cmd_submit, so forging it only ended your own wait early. Here it decides dma_fence_signal(), mmput_async() and the BO reference drops in aie4_job_release().

The queue is userspace's own BO: hwctx->umq_bo_hdl is args->umq_bo from CREATE_HWCTX (drivers/accel/amdxdna/amdxdna_ctx.c:252) and is mmappable read-write (drivers/accel/amdxdna/amdxdna_gem.c:1409), so the submitter shares the pages the driver vmaps. valid_queue_index() bounds it only against the kernel copy priv->write_index, so any value in [write_index - 32, write_index] passes and one store retires every outstanding job. Nothing else is consulted: cert_comp_isr() (drivers/accel/amdxdna/aie4_pci.c:114) only calls wake_up_all(), and aie4 has no per-job mailbox handler.

I may be overstating the impact. I found no kernel memory corruption: no driver allocation's free is gated on a job fence, and the queue BO reference drops in aie4_hwctx_fini(), after hwctx_stop() has done the synchronous aie4_msg_destroy_context(). User pages look covered, since SVA is the default and the core invalidates device TLBs on every mm invalidation (drivers/iommu/iommu-sva.c:341). What is left is cross-process integrity: job->out_fence sits in every argument BO's reservation as DMA_RESV_USAGE_WRITE and those export as dma-buf (drivers/accel/amdxdna/amdxdna_gem.c:680), so an importer is told the NPU is done when it is not. I cannot tell from source whether CERT keeps executing packets it already fetched once the host moves read_index past them; if it stops, this is self inflicted only. You have the hardware.

Would a driver owned completion word work, device mapped but not user mapped? Or could CERT report the count in a register or mailbox message the ISR reads?

Separately: abo->mem.map_invalid is set in the MMU notifier (drivers/accel/amdxdna/amdxdna_gem.c:247) and at mmap time for imported BOs (drivers/accel/amdxdna/amdxdna_gem.c:505), but cleared only in aie2_populate_range() (drivers/accel/amdxdna/aie2_ctx.c:1145), static and called only from aie2_cmd_submit(). On aie4 it is never cleared, so aie4_cmd_submit() returns -EINVAL for that BO's remaining life. An imported dma-buf argument BO that userspace mmapped starts with the flag set and can never be submitted.

Eva Crystal (0xiviel)
XSource Security
https://xsourcesec.com

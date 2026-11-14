Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670598;
	b=LwHYgY/72O6pZCD5XmEDAH30jABMvRh5SH+Adqv0Wzrnm+C2E1dbDd81xrCP36CfD6pw
	 yjkswIIvaNW+yXBn8dvJ3+Q7EHMsJ4bgfGGI/SKtZ/jm6BUM0v4o20ua5p3y/oPGSVOma
	 2qkcUeY+J6QAl80rbw1SVZvNRwLoUb5FLviauaDJI/QKIRXzs1nRWYvl/Rnq4BwLxddSh
	 3+tFSo1pvGt8v6qog0LkAhdxURiFrhBxy0SvbceLhCyoX30dBVvhMjmAGIQWNA72J7ZLO
	 oaWh9jBBci6WTOluEO42JCEh+chEFl0BhQrIkPBsslIJ3fxI2qt+AmHg9Z/aA6Ht0bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
	b=wHwvGU8obVhDTlya55pzTMK3V222MliuKANMuShg87EhVIxevUzmxwl2ZnnEFz2Aza4f
	 AlwEIK4CVeqEVVGIHwdrr6CuWWAuwFnIvkXgrEbTKGorcaCJF3RmO5M0UwqdBysRoXZ2F
	 26CODwU0kE6UmbEUJlvOdi+ChmV7okBhtem75JJxzr9CNSCqTHRfPcfaSPrubxZW3y2+l
	 8tuOuD8zJlKhY6WH7FzGUxB9C5Jf6+eFilN5AazZ6+H6SEs8yJeuQLOY89FxgjabMsa3e
	 ODXBXcqdJ5LoXWK5ASwB9iLCG9ZXJLPIMhBr7jGoMFakIA6IT+fCz6/517HoyvGJrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLaBAw7w;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6A606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLaBAw7w
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso224691eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670597; x=1795275397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
        b=kLaBAw7wyQvWZ1O6H9Z8EVRT4c99eFtSlk56PDSgX/V6PzrRUop9EQDiwhc82HP0Ro
         vZjCaqh3rTP6wYrvWhgrfd1ai4cSFfSfR0e6sPGVmiS+4OMduJvG/HxiCXWz9Ynwxty4
         eXB0yDpJR/j8cHEcV/ihE5tg2mMIDcso6aprXMWAhQGuS4FTxJvWCIeflnTdJ63ZhHNw
         KUgN5CTvm54ELruJCnCxb89I3myrjv/UoP91i5EWajaojOjSS1X8aryBt0VcXgWfsdnj
         yocOp9imlaUMah/UTOksDTx6uWjPD1ClSeF9qf4+8I8L3ALSaUM8Qwv2f5ulRnPcVybA
         BqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670597; x=1795275397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
        b=w/y0s2zPtpPGB74TqMni3wsgi+9j0hbVulQW7YNSidW3ETO0KChJgqvQCTGytvkH5J
         6taLBc+Xb9e/iF7nOUY6ivyiYSfLl9vIJGEHJhikudKrCHvMAy0BmXZzj0Y7ajr3yxLv
         G8CFbKEz4MLUO/V1CCzNo5OnYBh2UpWTV2Wqn1MtnSkFLOJTIW0Eyzp3xTn4t0t7PU2E
         60g3qQ4eGeZoKIbgoIAspefjw+E19eUxvjfzVgtUIhthsu40c67zP9AeZZe+oI2DyWrR
         oh2zSre1Qu+nPvMirUT2RXC0JbSQiC13YUlo2JlmbXx7bZYHD9lhBxWEx+DfABwrVie+
         TDnw==
X-Forwarded-Encrypted: i=1; AL+hErGJt/ka4MOqtbiWyd6s7elKsXqDSmaRLkFCgOpLmJ4cEsbBCSd+Z5rMfGLHZRlqzR+LvCc5Lzt9ZTziHGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w0bkCJFLE7bByk9ckcDlYGDIoMgjaf+iai8yh7cM9mYUoFTPM
	De/ibHBkMCqKm59Y5XWmihmpbm0Ts90YhlP0VnpePPNqMR6Yr8dQNy3L
X-Gm-Gg: AYBFou1jTIub5HpkgOSrpx83tXnEH/OZjQAEURvO2B1DJYmF5YiPlz2F1cqPKnJmv/j
	kmzy1S37X0+sgrOla9TmGizYehZo+smSnlcb9Myp6OaN5By1yPWgyuuRj5bYIAateyZ9nRTFAd/
	RiH7r4kJU+MW22RKYBUg/RwfFyYQiT9hUdNpXUbq5YVPKiP9PHjQH1OZYLP8fP5sxPLT/g2+dZX
	Tmux7pnp/LztxfNgpu3P/R+CopNKS/uanHKTr7Rv1byoE6c3sM1mB9rOnsBMUFP7yifghRLRuNW
	mBPPKvc6N0IyZLpc/+J+y/TpJOlJBk+WCJLTMI3Pt3cDQNkuP0zkly2WHIjtLq+rUhMIB/4XNFo
	DysUFEqowTFmGXGosK4PadmFFRyyZeZ9bmyVpiC+HFGELuYKqRYQsHWQCWM54kN7Sr9DCJynXvZ
	bLrIiMXLFZT9b224thR3R48yYSRhRQsX5BHapuQd/2Na5YvqVBKxGsWg+OxDZNVGKsTF62YMhAB
	CVan49DU7DvvGPxPjzJ2+t5fiE/DebnMD/AhZAESroepXDSV4CL2nmQfCa8PJZPlgbjn/H5t1MP
	jKVpEVyWA42iqpp+4YaZ/vZnRFuQHvb90+BpqBleiF17rY0hCSBV45OHtbaf7MT/UV6EgfZT3Nn
	gXJA=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr8568423eec.2.1794670596552;
        Sat, 14 Nov 2026 07:36:36 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm17527126eec.0.2026.11.14.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:36:35 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sun, 15 Nov 2026 00:36:22 +0900
Message-ID: <20261114153622.148125-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
References: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
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

On Sat, Nov 14, 2026 at 7:03 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> msm_gem_vm_close() waits on vm->last_fence which will be signaled
> after msm_vma_job_run() returns.

vm->last_fence only collects the fences of GEM_SUBMIT jobs, in
submit_attach_object_fences(). VM_BIND jobs don't add theirs, so
msm_gem_vm_close() waits for a VM_BIND job only if a submit depends
on it.

> My expectation is that if thread A is in midst of a VM_BIND ioctl,
> perhaps not having created/updated last_fence yet, while thread B is
> racing it closing the device fd, that file_operations::release will be
> called after thread A's ioctl call returns.  Is this not the case?

It is the case. (The vm_bind_closed check in patch 2 is only for
MSM_SUBMITQUEUE_CLOSE, which can race with a VM_BIND ioctl on the same
queue in another thread.)

The problem is a job that the ioctl has already pushed and that is
still waiting for its in-fence, e.g. one from another device or
drm_file, when the file is released:

- If the queue was closed with MSM_SUBMITQUEUE_CLOSE first,
  msm_submitqueue_close() no longer sees it, and nothing waits for the
  job. Otherwise drm_sched_entity_flush() waits at most
  MAX_WAIT_SCHED_ENTITY_Q_EMPTY for an exiting task, and kills the
  remaining jobs only on SIGKILL. Either way, the job's reference
  keeps the queue, and so the entity in it, alive.
- msm_gem_vm_close() then calls drm_sched_fini() on vm->sched, which
  frees the run queue that the entity still points to.
- When the in-fence signals, drm_sched_entity_wakeup(), which the
  scheduler registered on it, uses entity->rq->sched;
  drm_sched_entity_kill() leaves that callback in place. A killed job
  is freed then too, and the final put of the queue calls
  drm_sched_entity_destroy(), whose flush reads entity->rq->sched
  again.

Patch 2 destroys a VM_BIND queue's entity when the queue is closed,
by MSM_SUBMITQUEUE_CLOSE or on file close, so always before
msm_gem_vm_close() tears the scheduler down.

This comes from code review (see the note in the patches), and I have
not reproduced it.

v3 is at
https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
and its patch 2 is unchanged from v2.

Separately, Sashiko's review of v3 found an ordering problem that
predates this series: the VM_BIND queues of a VM update the VM's VMAs
at ioctl time, but their pgtable updates are not ordered across
queues, so an unmap can reach the pgtables before the map it undoes.
That does not need a queue to be closed, but v3 patch 1 adds another
way to get there: the unmaps it applies when freeing a killed job are
not ordered against other queues either. (Its other point, that a
killed job's fence signals before those unmaps are applied, I'll
address in v4 as well.)

For v4 I would make a job that unmaps a VMA wait for the job that maps
it. The other way round, a map that overtakes an unmap of the same
range fails or gets undone, which breaks that VM but doesn't leave
freed pages mapped. Ordering all VM_BIND jobs of a VM would be
simpler, but turnip uses one VM_BIND queue per device plus one per
Vulkan queue. Would that be the right direction?

Thanks,
Jiwoo Kim

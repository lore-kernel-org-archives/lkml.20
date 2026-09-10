Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B64E3C3459
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029857; cv=none; b=jCgcCd4k6BIsKw1RbGnffXcTm+QACvQXdDFitGallb+bOFQfhajROzQxt6AX3BAx2aiAcmg4RzlXfrafY22gnFkUh+JpR9YMuiTqmKl7KMCNp8ujc/SQRnXgsO/6QFxYmGPPr22mehPJmnRqVHCvRDsFvNHOtj/GcxHhgIisjVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029857; c=relaxed/simple;
	bh=vhqQ2mEalDcG1ZLq91FWT2EZSbp9RSILCXkqmqs85xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l3KAUX1TADznE1Rq1r7qIXNV+80vbX/aSkSISjFRu2FOYDE21aMQu2x29tu/4SBJT1O4fb9tK24SuGYOtvAwgEWWYcy4Sj5vDp8rs1WwW5Bh1FjhQPLDmoITa28T6o2TUi3WwVg70asHLT6v7VUdixWcw/vdFqw/i6W9uaS3sys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YppxNDi7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YppxNDi7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8557c3f270eso4524724b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789029856; x=1789634656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTyYRl2YZ/oM02ctlIcPWPHMCgn8HGs1uC6kTHGWSeM=;
        b=YppxNDi7nLBFDAgdyiyAjdPRdqVHBCJFvbbQTKzlpPn24Dkb39g5NNP2WQzdzCsVIt
         UHrStN7MHeJOuqnzlDa+JG0/E+7mNBCG787EoizGM/CsFqTnPVLboZKjBFMGjewuJE0k
         iebkhPlz2N98hJmQ3AxZLVOkHN3ZmhkyXrLmizg51XPrZSRuGvX/nQdIdvVGqw+TKryF
         Azg2w8ceHQrWLKpMGNtgMOQRrwBkdsX70Q/TjTAMWEaEH2IS86/wYGIsjbjCwu7QAm8n
         vZikJxJyLFPMqTCdjJNwJW4nvlCeEK4Vz54f7/fPDpPdbXvtdiouZkKFnT7UU5W9d5q2
         MPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029856; x=1789634656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTyYRl2YZ/oM02ctlIcPWPHMCgn8HGs1uC6kTHGWSeM=;
        b=OgKPSBVCdiJtD1tmGu0uOl2rf7QiuXoNv0I8FQBezDw0TLD5BEHG3dRPQn11PZ/G2l
         Te/PP7R15qpk2qlDZIKaEnbz5B3gzx/OT732R1HuYF3KYQfWNQ6FsFE4R3iep2gLxupu
         EzZ4X4XBjjLax95YUDG9EJXaTmXl5LxiMf+yNCP3PQH5HoFO7DHOcs9DFW+hSYSN27rq
         FlsH272tdAsLqN1tGQiCwKNR2Vd4G6dCwp0kTTvKzmLTJTVJFINYR1quKe3YP1w5M2GI
         EdzWZYJKtllOtMiGlBx9YLkcuqRCAaR6bSYZQaQEJX4tiS6fppcB+76AcsTlTSL3UJkq
         dNZw==
X-Forwarded-Encrypted: i=1; AKwUvBxYsQ+YGaXmYiCHVMTRyCIs1TXtDSNMfTPIDCcTqs/MncSHjyEKxpvFGGbotB363c0lU1oN2rrfKqsVNHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++klzk6li3y7FQ96Mqvq70hcTJylo49YJfTdZLF8QziLf5JDoQLm
	BDn8ymb1nNxsa3r/H4XAl1LQf20TsicVfUDIsnTCP9BZUZKPy1aAjgE=
X-Gm-Gg: AYBFou1hvCaj1jVpuj5py8rxYHpyrZTyLjHsLXNoDyYuiIvTF7X9BQz5M5YYHg1Kucf
	IZrAsfHy8I8xlH8eLugdQmiAKTuNcld8CZm+7qveH4sG+4sD2o3DzvC19cBe+x/N9yQleGuERTI
	POFLIkdJqL4rxsDFMTW3ReV6PDi9bmuyh1h4MPW1ShvbTqW5q/zrjUFsZwahcUFWYOWC7hP1Fju
	mG06Hv0L01iJvbrkxWAIPiYJqm0tSIoQTKiqsGrdHxLUf0H3MpOixO7fDXGLg+YoQnuJDtufV3B
	Mh+94XJVF/13GLal7Mgia6GKJrRCPZt1Tj1FdWfA1tYLzRY+cmQkT1vTJZxlTuIpXWElyU0itIr
	fDItE6uZLaFyghNduKjMSbbEPJMPUNlM6ICgH5gHl3VGYgKOktPSXbR19f6DSDumWSBetlDzar5
	wvmEn1jDfj2YKRO4HIdal+EJxp0u0rUP3tHLaHfry9EqtGLkXscXLwKzuNAvFeTZph4GIOl0shh
	XrJ3AZP+Q/QPVJ1fIJgv8hBHQ==
X-Received: by 2002:a05:6a00:181c:b0:85f:b00b:8760 with SMTP id d2e1a72fcca58-86168f83f7amr53037833b3a.5.1789029855475;
        Thu, 10 Sep 2026 01:44:15 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153728c37sm7968329b3a.46.2026.09.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:44:15 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	phasta@kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Philipp Stanner <phasta@mailbox.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: drm/sched: run queues freed before the TDR that drm_sched_fini() waits for
Date: Thu, 10 Sep 2026 17:44:08 +0900
Message-ID: <20260910084408.703333-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com> <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org> <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/10/26 09:32, Christian König wrote:
> Amdgpu shouldn't do that any more.

Correct, and I should have checked before writing it - 182bdd59be41
("drm/amdgpu: deprecate guilty handling") removed it. The callers left are
etnaviv, lima, panfrost and v3d. v3d is the one I should have named.

> That was an extremely ugly hack applied long long time ago because amdgpu
> was broken at that time and didn't waited for
> drm_sched_entity_flush()/drm_sched_entity_fini() before calling
> drm_sched_fini().

Understood, I am dropping that half of the argument.

> No it doesn't. You quoted the wrong code, this is what really matters:
>
>         drm_sched_wqueue_stop(sched);
>
>         for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
>                 kfree(sched->sched_rq[i]);

I am not sure I follow this one. If the point is that
drm_sched_wqueue_stop() has already quiesced the users of the run queues
by the time the loop runs, I cannot find where it covers the timeout work:

	WRITE_ONCE(sched->pause_submit, true);
	cancel_work_sync(&sched->work_run_job);
	cancel_work_sync(&sched->work_free_job);

work_tdr is queued on sched->timeout_wq and is only canceled by the
cancel_delayed_work_sync() below the loop, so a timeout handler can still
be running while the run queues are freed. Is there something else that
rules that out? And if I have misread your point, please elaborate.

On how I got there: the KUnit case never signals the hardware fence, which
is what keeps the handler inside timedout_job() while drm_sched_fini() runs.
That breaks the rule that all run_job() fences are signaled before
drm_sched_fini(), so a correct driver should not reach this, and I have no
reproducer that does not cheat that way. The same caveat is in the patch.

I am writing up the patch Philipp asked for. The only change is moving the
kfree loop down beside kfree(sched->sched_rq); no new code.

Regards,
Donggeun

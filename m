Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE339022A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132699; cv=pass; b=bpPBkE6sZyjUpfev10e0yfE9W07BuEnJTebvZj4gz444XW2zrPBAXPnyGAPudX5Yx8QnCrWKyuJNNice9xyygL1H/3nKA8av980sAmcsQTD8KlvdJpNu3xViJKWyHwgLrwOrvs7E5W3Bz5+j/qOBnIuk5/s4RgECd4AFbzqac4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132699; c=relaxed/simple;
	bh=K4LaHWFmEK3IYVvGCmtsW+XE/AM4kN+3jt1Lhu0vGrQ=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZZi9waGZVZjSrODqKlTBsPVapA4uDTEDKcrVgz3avv3ztyIYFFVTFXxhdQq/qWRXf0YfUzGaUjTTvA/3UhZVHnTudqPDIZFsbwxmjqn3eua2qWJvJzPxtQphw5yHs91aIQ9BO6UfQuptJ7N0ylOt1EKUY26hXqW7dnVIbzpQC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HqO+Dv/U; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HqO+Dv/U"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so113251cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789132697; cv=none;
        d=google.com; s=arc-20260327;
        b=m0HKpk3D26AngbC5kxIgGAx0A24BHAITrYKmmyYgD7eKQ8ROrfcuduOW4DgTXytoHV
         o30BJ1I9W+CQi1fhNeOLAOSaxkkCNhggnLbLra98E/TmTRBG8StoM4nM1eqU9QWHBUcI
         b7rqvjrlUyXDWn/AqlialWRiodPacTFUawO/Hqit/a1TlVZdX/XHrjFxclPQETO9z7/3
         8xF1rgUNWANQ/ghI8W4THUIeuWyWoaiq0QD1m8UoLGgSihIsxXFhdU11LCQFufHjHOZI
         Gc4CSiZYjE0tekCKiPvsYaXQfcDWXMlOKvKiLN1JuH9QPw0J2ukj3aiaqzjq6leL3pJT
         KKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=cSM57NSb2bqH4CibrYZpRofl0NWuwtByEycwX3Z2gtA=;
        fh=t+XOuLfv0sjdf6C4DSpx+MTfSrr9JN8TIneiPMBfNgw=;
        b=n0ftIrVVDCWmOmJWW+ftJpaYn4/C9uNdtLmF+TvPkClvz5aLByhH82NL5pvB4SMk6p
         sZtO+XVcSKw0rUKIARCQyk6bQU7jH7CLyXGVNmiK2NMdEpOmxrbCnb0h9vd6ztkDjGzD
         4sBP/n0To8DrIYTuZayKLO370S69172MvV6tij+2ZNm3mEp5Tk9uF2ZP7iI4IfDbG9fr
         MlXV3USyarzQhun3WO8CgiPV6HziJ9FL+u/fvQO73KjDmb295dEyues6a78QN76YhNaS
         dIQZ3iKiJF54ykkiimoqGrmCqavAXNXYRmZ1ZppdQhX93OT1wjDDdBUY7ff8mlKqMdsX
         cJpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789132697; x=1789737497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSM57NSb2bqH4CibrYZpRofl0NWuwtByEycwX3Z2gtA=;
        b=HqO+Dv/UK5ONBLE0xNDZoqih5IRTWBMPeA/A1xYwGeCwlzZvTjz6Ja8KbWLkyPo/5f
         fiHeqrhPw/Mmgn4O4NbY/iO0OWslSb2Gp6uGLpSRIlt8F+ebitAxOSHliTR6tNpQwvK4
         hFHkGopexZcdbRJYFtUDlxVk4Q71QmB+7tdNBIs6g995Eg1KGUXIB/5z4jz5xlyKh46P
         UOlO/ZdFJm6UVGKbIWYS2N4EMatpIP4NIWdz/yaV2LWR3eZVhVkvxH4jxWNj/t9qoQmR
         ZQLs5w8q/AJ6qvHbiegukw4EBduFbnDvxlxLakt9eMuhV3POqVFrwcXNcb8V5HVyG+aZ
         bycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132697; x=1789737497;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cSM57NSb2bqH4CibrYZpRofl0NWuwtByEycwX3Z2gtA=;
        b=Qe/L8FFFh5VWXJiJjPSJ+lUI+afYQRPxiNi3XgHLfli93AUVy+jn/nPkEp8Tktwl4I
         CcDRcwIv2yC7vK/ZMG4SSF6Faly9KSfv3zaEXYS6yHFIAORdhNFJVbtJRqLNGz+WBghY
         YUS4F3MlcL8vCtvGGHLb2eC41z90pKJcwEVD6hgGyrqh6v/S6bjEosYfxGVm4XJLvN88
         nmQxf9RVk83i6leUrPFnDZHs5KbLZo2EujqvwJCm52D2HAuO5Anjio/5e0zz0CL4gQd2
         ehZ/4aeavENFHBHUeR+O4ypk640zgi7CVxkp7uQPRstb9IuK++1+ZTrdESeiIXrUKVj3
         utaw==
X-Forwarded-Encrypted: i=1; AKwUvBze28eg4daNQMZGl8N42XZoLVzVVnDCFXgISlmMAWsN0cPPI1o39N8YS+PISVbpPh62kaL2/jcPp1rVYag=@vger.kernel.org
X-Gm-Message-State: AFuF++k+A2/RcRif7LlPgpXeUnEMwdlE8uMfqfZunl9nG7eCMQUlXFSl
	0bmC3XebnzcZVK6Muc7paS/XDAMGROkK+EE9aplmrLzQp/qKQFS4IEBFolrPtVfRn2PvG5GRg02
	8aDZVsVvvfYtPkryR33iZ/EUFoMz9BhX+VHkAslCK
X-Gm-Gg: AYBFou1GGCF79TQAJOGCLCJvMxu8VtKePiiwzzilsMliHSShoW28BYS0lez/szxjoNr
	2PPkq5qM+WQH0pXGWz3+5u1hxfXbofkGbM1kRR41trax21TsjUHAs5QimJPfzDuAAnnGlVXnTxk
	LSPZrIHBJnsOx3TG182RASxmamyqxJVuubI4yb8hTllV/rBqVJgYcS4S6kQ1NWETRkfUtEDlR6p
	HtnlxbLyw3Mj6hGCfnxQF/0a7rL6Z3PpxxxwljFHAcprMn7rRGAxHxZdE6p3LTwwgPJSzBPQtVZ
	CeAm7hHatj3KlNzpGvLhZ8BSrZxassvOiicD6UjHtoz7DWYN/F5VJ5DikJpCi66489LnKiQD6pg
	Off2JcIRNGeSO8zeHzQ==
X-Received: by 2002:a05:622a:999:b0:530:5120:19da with SMTP id
 d75a77b69052e-530c93581c6mr17607741cf.2.1789132693409; Fri, 11 Sep 2026
 06:18:13 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 08:18:12 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 08:16:57 -0500
In-Reply-To: <6f78c4bd-a70b-402d-abfd-599091b67674@acm.org>
References: <CAE14pdef2u=Eo7M9NGdABzsjy2o2SO=Z-U_BbRn9n45nJJR+wg@mail.gmail.com>
 <6f78c4bd-a70b-402d-abfd-599091b67674@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Fri, 11 Sep 2026 08:18:12 -0500
X-Gm-Features: AcwNN1UmqJQwItU9X_dh_8-vmqHmW7HvbyT2cnBdNolC9xFwWq_P473Pus4ih3Q
Message-ID: <CAE14pddGDqiYaaHeTd2JEK_938EY+2DCUwZ8pwFF=p7U4ibx7Q@mail.gmail.com>
Subject: Re: [PATCH] scsi: core: Set BLK_FEAT_SKIP_TAGSET_QUIESCE on pseudo
 SCSI devices
To: Bart Van Assche <bvanassche@acm.org>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: hare@suse.de, john.g.garry@oracle.com, hch@lst.de, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sep 2026, Bart Van Assche wrote:
> Has it been considered to remove the blk_mq_unquiesce_tagset()
> call from ufshcd_err_handling_unprepare() and to change the
> blk_mq_quiesce_tagset() call in ufshcd_err_handling_prepare() into
> blk_mq_wait_quiesce_done()?

I tested that on next-20260824. It clears the NOP OUT deadlock.

However, switching to wait-only means no request queue is ever marked
with QUEUE_FLAG_QUIESCED during error recovery.

blk_mq_wait_quiesce_done() is only a drain, not a barrier; its
kernel-doc explicitly notes that it expects the driver to have set the
quiesce flag beforehand on the target queues. Without QUEUE_FLAG_QUIESCED,
the block layer dispatch path remains wide open. In testing with
background direct I/O under a non-fatal error, wait-only allowed 27
commands to dispatch to the controller during prepare, whereas
quiescing kept dispatches at 0.

Prior to commit 2a36646012fc ("scsi: ufs: core: Simplify
ufshcd_err_handling_prepare()"), the prepare path explicitly blocked
new dispatches via ufshcd_scsi_block_requests() alongside
blk_mq_wait_quiesce_done(). Dropping quiesce entirely therefore leaves
regular LUNs completely unguarded during recovery.

Quiescing logical units individually via shost_for_each_device()
resolves this: it preserves the block-layer quiesce contract and
pre-existing protection on storage queues, while cleanly leaving
pseudo_sdev unquiesced for NOP OUT.

On the SCSI core patch, your point holds: ufshcd_pause_command_processing()
and clock scaling also need pseudo_sdev quiesced, so a queue-level flag
is the wrong abstraction. Please consider that patch withdrawn.

I posted that patch at:

  https://lore.kernel.org/linux-scsi/20260902082306.2299159-1-stanleyjhu@google.com/

If this direction looks good to you, I will respin v2 with the Link: tag
fixed and the commit message updated with the above rationale.

Thanks,
Stanley

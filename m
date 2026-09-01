Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404B2DF144
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265463; cv=pass; b=JiokofveuPhB96zVuQ538b9jLcTWfzNbM461zdwRkndjC0PTVLaPR7kQt1GSpHI/oOdQT5Q5xsIhlBh2IzIbJycr4R3qXJFkzLma7ti1e22RNhuoO8jdZd72rAztwx+7lbWOVbwgzWHrVYhbpDlh2XUTx+I/nY91LcofRyaq3Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265463; c=relaxed/simple;
	bh=JN/t2FkFifvzscJ/Ssx2FsFd82QoZZqcQMljAzuGXQE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kqiwFmNMUEV/GjjHVIFXxt3uEi8hGgYM06vmWrs7ViJT0cY0GQmppVj1rKZqxpTmHD2ozhwiKm6I+Mrgauduz9pp3RUuoeZdVQCB088ySq0Im4qyFt0/BJRYEFqutUIvdxwtDOrr43gnEs1BBzw75hxN+hOkJ5omddhiKyJKEuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=al3u9SC+; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="al3u9SC+"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c01c79467so321321cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788265460; cv=none;
        d=google.com; s=arc-20260327;
        b=BMJ7Z/ilRnCZbPw4AyEimtdZID/f6fUpvgSO4WP+uccbvF5bwGbXxww8h332uptwgt
         7jG+AiC22VxQlmVlx6Utw5YseHVCIBzIjWf8DbPwhxyqmIhe2so4fr3UzUqz2kNFHLP5
         x2aKVP2+kXjftJJfsWGZI0g+R/MtAXbJVKHovhT60OmkFIFGVHcFXgZ4gmmgmtu3J0DC
         Eoz8kPV3L0TGZ1gzj7KgfejcEoVfHWBsQfqDyes752BnZdPHYOAUQ4gAY02OzIX12gBr
         WBvWu5OO5sd3xnrOYQ8267HJcYmd/U0/sWsZPH2USKl130qns/EZvwSj1Pk3Siw5V+P2
         iDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d8In7MroUMENUyC3EqegCPVqWB6peac9BWZUcxLxuQE=;
        fh=jxdptnONmLp59hvwQiVaMTyg4P1Ay4PboSU36hhQTHU=;
        b=I0AR50tCqWgqNN1DqrMaRdCpluLqrBHexR52QnZDVf29fg7Jxqph/TeHLHRnPghNF5
         1zUaV3n4niU6EaS3DDQ3j+H3yFsX3KW54NwmziGa229iZwbOiXlUAhybeqlJX1d9fzMT
         j6iXhcMpRPjhd/LTt2mkvXfTrNIrxKtai3ONrypmkR1/UjtulZwshvuOvX2yxuP2mzWw
         JKynJ0RLBs8NzlWdQt2WDglGVoIAYIkXPsl3jVec3ZrfKwfnWwxF+Toc46MLOymnonfJ
         utPNYPMC8gBCwApvEOp/08PxG0jjNgb8wn7HoZ3omfpH5ggNIEaZJSX8KTL+d/qUqtMc
         /Rdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788265460; x=1788870260; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8In7MroUMENUyC3EqegCPVqWB6peac9BWZUcxLxuQE=;
        b=al3u9SC+yuRQBfSNQSz01ezypQ5ADgSAfC57clea99WnxmJ4feIEdNexexeiBBRH/T
         QQ8/aNLEbQr6t/dczffCxIijBqWMm4yk/xoqhhHunKKDIE9WzzIyYn5aDiy3QGnI+doh
         JtDn+dP203VaKRCRDG/Ln4VbtpPWJGpo+wEDVlq2UXVgkBwgFGZtp6pnzeHCHQsAC8bq
         GHNBoJjJZCimCnrTW5LveUA3atjJ7CnK3r9DwFvMV8mALhdSD1YXY628R057bAPgllc5
         0VRowAf/gqF99GCTcGddbAtBGZHrlBg6av/6iwRmyHzWT6uyQkDVesBxfb0HeZ571Z50
         wl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265460; x=1788870260;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d8In7MroUMENUyC3EqegCPVqWB6peac9BWZUcxLxuQE=;
        b=jMdwFMJ6ClMTgneq5R6F/1r0B5/L+vNWCnWtepWuf6DSKlfdzTn3M40Xd18EXNITCO
         AVsfZFqZjFj+cuHIKZLQJJr4EX+ZcsSwXDvLtZdX7TeI7kyz7y7lrEb3u3G8Dg35ha2w
         T1hEDy2TfKDzYT01nzdd1SjJm0nxeXOw8O7LVzUkfD3mtRyb6ORzNHbBNJGkaBlSrInV
         ib1k8S1R/wu0iU7OyUzF1W14jcRtVdADrlfgBn5X41lsJs1SwLcz9fWUISkp1ZVMWDlL
         yoMnAYwehw/jD58RcoRWgYrDtCIL7lHDdOHc6hukljoKPI97InCWlrBQc5F8tmz7EE1Z
         f53w==
X-Forwarded-Encrypted: i=1; AHgh+RrndiMZ8Ye2RyuaBQJE4IlP05zvAU9q+7//j2cLtdW9sUg/VLQsIB0Ei6KJdhmaprVg2P9o19YUUuCOUFs=@vger.kernel.org
X-Gm-Message-State: AFuF++mg3/pGTvRFDc3oS/dbmL1T2PPB5XcZ5Hz5lfbf/Ml0N8YiKNg1
	3qb1rCT84gA1Ak7zX5bCNd2FJprRuQTqNUsBk5FJgZPzCuE1/09OgtijpoGH/sMZq4j+dSZsWrc
	9s7ZTQprKgGD6rcJtjeAUD8lbTmsLZj9IfcvQ5bPa
X-Gm-Gg: AR+sD13e/NabBVzphAarN66nqSUH2An7nBDJu8MVKY56wwAyEOxlaQI5T0I8JpNOM8k
	R3EqVOLe/bUHQ1d9Q67tjLq2bjsAh9dtoyhQqF4vGOaMmPjDojzydyCSvZipsH8EBUj30vaHsZj
	P3Cy94azju8IdwRg5sx1b+/h3kRV7V3FO6YRJsxFk4Lqh5WAzTRLvzEsNqjI1IUjfQm9hj8F0Cb
	SBNxkSLFO8xh7Pl40eLlDd+coOTm2rX8BlFQyIaVc41Kmr9jbzk6+ob4CCc7HxbGEM/HIC/O2ZY
	etxFXbAHSwfryaIJ3rN7AVHrt1et9M0c678ThSPtC9Ps
X-Received: by 2002:a05:622a:1a8f:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-53024b7b7d5mr15608241cf.0.1788265459654; Tue, 01 Sep 2026
 05:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Tue, 1 Sep 2026 20:23:43 +0800
X-Gm-Features: AcwNN1WE8g6tSRs53V9lxDRCC9ypyaxRDWe_obKQX3VLlFgTm5cLh0_k_iVI3WQ
Message-ID: <CAE14pdef2u=Eo7M9NGdABzsjy2o2SO=Z-U_BbRn9n45nJJR+wg@mail.gmail.com>
Subject: [PATCH] scsi: core: Set BLK_FEAT_SKIP_TAGSET_QUIESCE on pseudo SCSI devices
To: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, hare@suse.de, john.g.garry@oracle.com, hch@lst.de, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit d630fbf6fc8c ("scsi: core: Support allocating a pseudo SCSI
device") introduced pseudo SCSI devices to allocate and dispatch
internal SCSI commands (such as device management commands) via
scsi_get_internal_cmd(). Subsequently, commit 08b12cda6c44 ("scsi: ufs:
core: Switch to scsi_get_internal_cmd()") switched UFS internal commands
to use this mechanism.

However, pseudo SCSI devices share the host tagset (&shost->tag_set)
with regular LUNs. During error recovery or host reset, drivers
typically quiesce the host tagset via
blk_mq_quiesce_tagset(&shost->tag_set) to freeze user block I/O.
Because pseudo_sdev->request_queue belongs to shost->tag_set,
blk_mq_quiesce_tagset() marks it QUEUE_FLAG_QUIESCED as well.

When error handling then attempts to issue internal commands to recover
or verify the device (e.g. ufshcd_verify_dev_init() issuing a NOP OUT
UPIU), blk_execute_rq() inserts the request into the request_queue of
pseudo_sdev. Because the queue is quiesced, blk_mq_run_hw_queue() skips
running the queue, and blk_execute_rq() blocks indefinitely waiting for
completion. Since blk_mq_unquiesce_tagset() is only invoked after error
recovery finishes, this results in an unrecoverable circular wait
deadlock.

Resolve this by setting BLK_FEAT_SKIP_TAGSET_QUIESCE in struct
queue_limits when allocating a pseudo SCSI device in scsi_alloc_sdev().
Passing this feature directly into blk_mq_alloc_queue() conforms to the
Block Layer's atomic queue limits initialization model and mirrors
NVMe's canonical pattern for its internal connect_q in
drivers/nvme/host/core.c. This ensures that blk_mq_quiesce_tagset()
ignores the pseudo device's request queue, allowing internal commands to
be dispatched while user I/O remains quiesced.

Fixes: d630fbf6fc8c ("scsi: core: Support allocating a pseudo SCSI device")
Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/scsi/scsi_scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 3b82e80e807a..eb48866ed0dc 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -336,6 +336,8 @@ static struct scsi_device *scsi_alloc_sdev(struct
scsi_target *starget,
        sdev->sg_reserved_size = INT_MAX;

        scsi_init_limits(shost, &lim);
+       if (scsi_device_is_pseudo_dev(sdev))
+               lim.features |= BLK_FEAT_SKIP_TAGSET_QUIESCE;
        q = blk_mq_alloc_queue(&sdev->host->tag_set, &lim, sdev);
        if (IS_ERR(q)) {
                /* release fn is set up in scsi_sysfs_device_initialise, so
--
2.43.0

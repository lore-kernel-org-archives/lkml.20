Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19448B368
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519621; cv=none; b=d7voTKLklGmHp92yaVpui5mEJCU9f3cHfwJTPp9llbA6GaRuiAcEtvzfnLM8dEKWXOpcuclwYorMQaeRVE2tYfuF6KtPSa40ieGrpE231UNe0si007IFBKbEidn0WOI+sqQumjLudxWTpEallOB5FPEz0Ic7HrPPrf/ZOL4/Nt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519621; c=relaxed/simple;
	bh=F6qhUBtu5YspPWJwLVz7Ug0cYXURMIPFcnHqC5icyQg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GHDLJm6tQ2oOMGRexzWRyNsgiVG668LkHH+Pnlheoj5sM2ImLcc0XwvU+lVKUWdW+V2Z8+SzScm9vlU3owzB6yUcd/0artgw+59c1J/N4LaiI8S2RYQ4da01fxcA8rr/N1WcJRI+lHy8tgJnAZK6YdDiW4I7bi2CwFdzLrF4hOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I37p6kx+; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I37p6kx+"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1322957a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788519619; x=1789124419; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhJXG+jI+lGIJtzjn1qpUhBX4B4g6+5Q4kRtY0eVfw4=;
        b=I37p6kx+uAU1oRZcwE/ZfJpOBLRLJHNbpiYQHlEfQueQxDE3imzRvPlJFAMhjunIsL
         MHBTSgjDDANaVmzdiABNLK7tKopP3Y0dGWCwY/Kd+t8OIEwIWgNtbAo8Wq3uCm0I8QNK
         uyetWmAr+TMZzSP1oNLJHdvT9zhfdPS9UJ/zQXMlOLFHeF29jFPc7CzB/VykktKBqXGx
         0e1z5eef6eA0lRw0a/k5RTuM8jic4sOXBBRMyoPScKl0xtTFee27WKQOVAe111YCp0Ov
         4V91kKHmDy3BHMGJXacHyppByUpCzTMqoKAqKuCL0QMDL7oSAGnphcqcoAp2FgCQ7xmJ
         4r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519619; x=1789124419;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhJXG+jI+lGIJtzjn1qpUhBX4B4g6+5Q4kRtY0eVfw4=;
        b=P0N56BXYidtEavmaF8ERfNpM0+XwQuXBbj3tfqWXDcGoOLggvWn/zZxsRFAfgljP12
         Y5CgRsKtP0QwtVT1d55yiVgAjStzC1dcjPOLeMFaJzlADAV5cuzLbc3wt4Ls1yUnDfPz
         zNS2fSkyZh4S8z99xLbOWQJp65pOKB22MMR3W4EpG7eqr0DTfvhRkTB4Or2QtA6waHQe
         31+7vC/xZpZhXin9BzFGBI+7MDSrukfSTj0VmjcO4sFcF30EN2Kjxtah0in1Y2Z+FMUN
         Nvnn0Xjm9sX3w/3u0EDVa5sC+Qdw78VTIz6c90w8PUFeQ1O+K4VB+ge2B/OrQywTXBBI
         efhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0guGcorlqFJ1qK1Wk9kP0Mp5QUKXyFY1DHfidy5J2zDgtAj5PN/kZ2a2+GcBvPMUAbhubIRvST7jOwqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lOKz9EzzASRSUyAenDLIS4/XKE+XydETHHSzHAT+FdPRpONuSZ
	Q6CUfxxlrS2UC75aIf+AstY30AZOE5XLrW25svsao90riL72PorDAXu8aFMJE1QvzfkYJM0gW7R
	nYpx+4fJ+MxMJfSgUlt1uew==
X-Received: from pgcv11.prod.google.com ([2002:a05:6a02:530b:b0:c9a:ffcc:19c8])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:db90:b0:3d3:ad3c:49a9 with SMTP id adf61e73a8af0-3da3a1c8619mr8248441637.23.1788519618942;
 Fri, 04 Sep 2026 04:00:18 -0700 (PDT)
Date: Fri,  4 Sep 2026 19:00:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904110017.3444852-1-stanleyjhu@google.com>
Subject: [PATCH 0/2] scsi: ufs: rpmb: Fix device lifetime UAF and unregistered
 bus regression
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-scsi@vger.kernel.org
Cc: Brian Kao <powenkao@google.com>, Bean Huo <beanhuo@micron.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes two architectural defects in the UFS OP-TEE RPMB
driver: a use-after-free (UAF) during controller unbind or shutdown, and
an unregistered bus rejection by the driver core.

Patch 1: Decouple RPMB device lifecycle from devres
- Problem: struct ufs_rpmb_dev embeds a struct device but was allocated
  via devres tied to the parent controller. When the controller unbinds,
  devres prematurely frees the structure while external references
  remain, causing a UAF Oops on SLUB-poisoned memory
  (0x006b6b6b6b6b6b9c). Additionally, in-flight I/O lacks transport
  pinning to the underlying SCSI device.
- Solution: Transition to a reference-counted device lifecycle, pin the
  underlying SCSI device and host hierarchy during probe, and enforce
  proper subsystem unregistration and offline state validation.

Patch 2: Register and unregister ufs_rpmb_bus_type
- Problem: The driver assigns devices to ufs_rpmb_bus_type without
  registering the bus with the driver core, causing device_register()
  to fail with -EINVAL during probe.
- Solution: Register the bus during UFS core initialization and
  unregister it on exit, using IS_REACHABLE(CONFIG_RPMB) to provide clean
  fallback stubs and prevent modular build breakages.

Verification:
- QEMU ARM64 with virtual UFS 4.0 PCI controller:
  * Verified /sys/bus/ufs_rpmb registration and successful device probe.
  * Verified probe, unbind, and shutdown complete without leaks or Oops.
- checkpatch.pl: 0 errors, 0 warnings across all patches.

Stanley Jhu (2):
  scsi: ufs: rpmb: Decouple device lifecycle from devres to avoid UAF
  scsi: ufs: rpmb: Register and unregister ufs_rpmb_bus_type

 drivers/ufs/core/ufs-rpmb.c    | 96 ++++++++++++++++++++------------
 drivers/ufs/core/ufshcd-priv.h | 11 ++++-
 drivers/ufs/core/ufshcd.c      | 16 ++++++-
 3 files changed, 84 insertions(+), 39 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


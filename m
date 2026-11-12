Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444078;
	b=sqOxWTBt3nMM17h+NQXglmZwS4nw3FMnHGWYiVBaNpBDlIEwamRR19z3cYLhcU3Bw2At
	 DlZ4dm8bROE13mugxJ2k/yEVspCN7oIMi6M8ZCO/i1zI125FLGt5qRfOlVl6y0Dz2r0Se
	 uSzhI1rKL/9+a4brUM39Qkc6Y9ECWVg1kZL3cmOcOnQwr+92oA2xfIXNefzM76FQkka/f
	 FPIhFwwiqPRJNdC+Ie2gWf9baSyqgK4Qo1gDv3BCmzZaCXt1YTyDi6v7OxHpSW0bN2/Kf
	 UVnF1y3dxqH2QmE2594dcTyavxXEeDp/eD2pB/gSyIsCiWJD/qtR4QmaJuaFKdXuSPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bJizSOfwaFLzrVg6LUbmeOKVBfUrTfo1+AD+ywf1vgo=;
	b=zfV+6Zk67Iy6OeLvekT8NfSXNLjoOjRSak9Jej0wLU0IgrFpBApg0QLOBbO2wjsfWuZb
	 PiK+FME0670GrYf41y15kTFkW8BFCW+Tkswl4RNRdODbk0dkSRTwTqjr2vwJnGGw26Qxl
	 QjwblNb9DjQPN9GKnHkEQvHhBYWM9CaoMJMpg5HPhaP4dhHS6MhVlHaFYm7WoWT+SqKOE
	 8ZUb0T5bDtkIkWfl6ulfVUFPOSoao4mi76VLlTzIilUNA/s0aSSu4jHUWYoal+o4E+YHr
	 6fUnL8Jdjp9Nx4YNrw0jnc7RyhkprdogOVemrm8EHPCoD/WcZ1T5C2LiSRL6+h9f15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e2s32/Lj";
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE88E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e2s32/Lj
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-860e65f42a5so2658532a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794444077; x=1795048877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJizSOfwaFLzrVg6LUbmeOKVBfUrTfo1+AD+ywf1vgo=;
        b=e2s32/LjJqSd4QF3avEKUsJ+6Dlb8TnWobQs+/yXGGC3sKqLbaPGdFa27kdYhjD1nj
         A24CjvAOTc0LMhLUDqSVR8DMwcwxEnuQ18QIYln9FF+P4mCkXyyz58fpVkoPXpjJQyQZ
         vDKIiM3r7rs7xFpS8imbPrS3k+IVVMYvVLCdJY6oxFAzmRq+MLyQ6cyGsDdOEEVgfDHT
         UwmqvpsE/nfShXwZ3DLMQY18/G30m+lqAFQhtWHSNvpUg7gezqz1ZcZzRTDfWMn3PHMW
         atNI3QauFSvM22voOw0GDxVystX8phe46NtCMToTqgp3vuwNBITJJJeHOarPOCi/0npx
         L5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444077; x=1795048877;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJizSOfwaFLzrVg6LUbmeOKVBfUrTfo1+AD+ywf1vgo=;
        b=qZJu+YyoUH5FY/Ib8Jcd7bbjWhfA5kGXoXhl5eSDktdsCZ9pkH6K2WTCKKgMqVq/Nd
         0RGwIqKtMc1Jy8BUUjfMBmBcH1hISq44YUhTZ/SCE9n9mgpPFmj4RG3JoTDvOVl0v2YU
         XIEQ6vIqTcGwK5oz/yWVdfZtSAb/zy267A391En47oxzGkostqewwvpCvKQvlm4cYB4Y
         JrdbdCCA/hCLAO7lVIHIlepT2Ej/lflnLZIsS1X1GVyfUj89ciEv7P9xl/1hUTqrHX7f
         iR2gwOKRxHQkhBkzDMRuIu5rGVvKP1aV73icnPq31DmM/RwjPXqmYgbVe/kLmErRRTzM
         5o3g==
X-Forwarded-Encrypted: i=1; AL+hErHSZw5RUtF1w7vdx/fYCHtc/w+33NPUIr5TuWnYF36lSsWw3VnaRqyADGdmPnF72nOPWhRDHYiJbn6Q2Ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ss0C3c11pjmALG9nsQ/mwhZO1+e2e9rV8UieyTvtymxAshnlo
	X31ZcLWoObOephq5FTd2sDSpkgRO3lny5YQSgTAzi/vACSOnJZKpZRdtXXcYnnYJ+Xhnm+pSlLW
	ODTHT5UNINH5aOzWZyJQoiQ==
X-Received: from iocy14.prod.google.com ([2002:a5d:96ee:0:b0:9c7:75ad:5e83])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c234:b0:4e7:3fd7:2752 with SMTP id 5614622812f47-56b96ff79c6mr4110185b6e.54.1794444076488;
 Wed, 11 Nov 2026 16:41:16 -0800 (PST)
Date: Thu, 12 Nov 2026 08:41:09 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112004112.3059801-1-stanleyjhu@google.com>
Subject: [PATCH v6 0/3] rpmb: Fix request serialisation and teardown races
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, Jens Wiklander <jenswi@kernel.org>, linux-scsi@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@sandisk.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@iokpp.de>, 
	Bean Huo <beanhuo@micron.com>, Alexey Charkov <alchark@flipper.net>, 
	Can Guo <can.guo@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Shyam Saini <shyamsaini@linux.microsoft.com>, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jens, Martin,

Patch 1/3 serializes requests and provider unregistration in
drivers/misc/rpmb-core.c. Patches 2/3 and 3/3 fix UFS RPMB device
lifetime and drop the unregistered bus in drivers/ufs/core/ufs-rpmb.c so
regions register again after commit 36f35b8df697 ("driver core: reject
devices with unregistered buses").

Patches 2/3 and 3/3 depend on 1/3 at runtime to avoid a use-after-free
on host unbind. Jens, if 1/3 looks good to you, could you give an
Acked-by so Martin can take all three patches in order through the SCSI
tree?

Changes since v5:
- Rebase onto mkp/scsi.git for-next.
- 1/3: clear descr.route_frames under rdev->lock instead of dead flag.
- 2/3: pin sdev_gendev via get_device(), drop Bean's tag on 1/3, 2/3.
- v5: https://lore.kernel.org/r/20260914144910.931518-1-stanleyjhu@google.com

Stanley Jhu (3):
  rpmb: core: Guard frame requests and teardown with mutex
  scsi: ufs: rpmb: Decouple device lifecycle from devres to avoid UAF
  scsi: ufs: rpmb: Drop the unregistered ufs_rpmb bus

 drivers/misc/rpmb-core.c    | 20 ++++++++-
 drivers/ufs/core/ufs-rpmb.c | 84 +++++++++++++++++++------------------
 include/linux/rpmb.h        |  3 ++
 3 files changed, 65 insertions(+), 42 deletions(-)


base-commit: 0fc91e802801819a0c51d30b6eecac63ab4f85d2
-- 
2.56.0.567.gdb80ae8cd5-goog


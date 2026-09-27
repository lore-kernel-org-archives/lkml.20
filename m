Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F012AD3C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497640; cv=none; b=DEoMxtU/qX1NkzJ9Oc4tGCa6VFb8qSUGHuSPCGYUlUSzgaxHS5nEyX9x66aihQvlqcqrmwqc8MuRj/YBZlgaJkvkuoHLVcF87ujK1p7yQCkJ5GtVHz/kXuNQY9pt+aM5fi6nU7NgCiKVZNrLS2cjOcd7z8zEnDuFwa+MbDZS5SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497640; c=relaxed/simple;
	bh=S4GYa4Gz84vaUmwdPf7Rfm6H6lVVSdtqfNSO0ctAnwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F/5GSI2TkJKx+H1v2hzyq4/PoMMj1KQyQFzLaf7l/AjXpeTemQpvOvGAX2TtQDAnHUYgJsGFcA1JqFoYqjrIkus8WHg5eRFKxZ94xkNnfL6xMBx1waURZXMy7KJ7h8ixgkFZQjKuo11NLdgkoWEz2JgjpDvo5h1Xx2oHW6FjUps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heaZAvsZ; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heaZAvsZ"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1deaso374332a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497639; x=1791102439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XuEMzYsQmuqvuSw703l+7WHrOcEGXR3Wzqv/Y5f5zrQ=;
        b=heaZAvsZnNdUG894DtYkubEbuimw9Bb0qYKimcFyR/4QWQWcWyO0zVwrOu2ZXJXgzx
         KyjuuxN2Ycv+7H8kAHIuAE0Mj/MlHxa/nO0xMuhT2rCAjVlhC4HBuCEqSOL7A/aUqva+
         23IScYWyqyInQ/wuJc3fg5N7XtTYJNQjgHNpyJxVChGqay6Gn1sAPXoRUfEvhvBpytbj
         PyFUuTeu4AOxUVmKwWtubAbvhKc8ae8EEpqGchGvCotQ6sXh3t1uiQ5S0fF0YS3gK8FC
         XKMZnrdabHsAvtSOxYgaMkr3wY9EqsJjrz4FU7puP64vtPdVUJpHEs3dvW9HtRjziOqv
         Dd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497639; x=1791102439;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuEMzYsQmuqvuSw703l+7WHrOcEGXR3Wzqv/Y5f5zrQ=;
        b=LimFunntrI9xCWTsrOSpLFB6YLrJbW8O6z9rcihIIHC01pQd3czDPPWIUDZXS2baKr
         bdQ1oDuUdOo1VmzOWx6RdZbhHak2hQyxrkzz5IktYRroSWtD+pDTUw/NhlgQGYKQgMuq
         NqqiPpYjx2x81O5CQga2glaeXl2Ux4Iv3+SUkyxfcyH5GN9ak6j2MnBjKCFZolYMrxgn
         IE+gfs4JUiucxmkEEu4P5syYM/ZZmNh5Kuf97vc1xSyvV8FUO7wPp9VyVfYBqYYyWJ7c
         YJTL/hjWZ+l2JQtFazHXjjTRIZIjXCadFYcHHNaJO2WyxJdSRhu60pWIbfTqYKOsNSlv
         ADhg==
X-Forwarded-Encrypted: i=1; AKwUvBzFQZGMkv4HgQPJFJ7ELEqRFabAeTK/GwzgpTYny8eUxUt2YrpNALOh8CE3JQafgmtIYmVlDSTIX0tR3F8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiV1B+Yk2d++Q2cqGGWG39PnDyip+jqJMTPqHYnCTrtdOhzm/V
	X5d+uZweCh5ax/PHSWkCDb99GSXbthIXtK63eU4dwgBAaX2HvHW+GEMo
X-Gm-Gg: AYBFou22NNLwP1wm1qNrK+kFR1ZnETQpSlqIzxDHw9FH/clQ+umt+lgAatHc6moUpe0
	Xy/0cg6vEH9gVONExPNpf5ouQFimKzTZs+14ES7Fz0L+vdF1I+1dNs5HTodlyuQ7dsih0cxiPHw
	Rx6ndvOSRLINtK74Ni8JTdEBgSBuKL4mV502tVZ3tBAarYym9wetYvB871OJZSIM1WDFJUevavl
	iXoIJ7VRLwBWjtXTtZcdhMMHDb0nhhiMgerz7cs5Iqkv4Ybs1Z3rnKlWDbrDPzQ9ALV2J3VTAdt
	1NfhtLEGqgzN7FzYU9/56gVkXJy4qc3mf02SB4sUgpfaB8QTV/7rQlBZyF6X6FQpVssxWLVLx5H
	mEYYc8vv83cXDVDUxTxVxWxDV9/8FFjZ9tx/riFDIZRCeQJhI8gofnoGnfmx6s5nLB553Qeyoam
	CkImZkSSRwguCq/IONiCa+5q/X45b+ZOFFtkrSlT8PDsex7mZKk6uSG26Bexl7WVw=
X-Received: by 2002:a17:90b:17c3:b0:3a0:bfaf:2ae with SMTP id 98e67ed59e1d1-3a0bfaf039bmr5225656a91.43.1790497638614;
        Sun, 27 Sep 2026 01:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a2b1e4d5basm1921496a91.9.2026.09.27.01.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:27:17 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH 0/3] drm/imagination: Fix pre-existing bugs flagged by
 Sashiko's review of a VM_BIND series
Date: Sun, 27 Sep 2026 17:25:52 +0900
Message-Id: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDTuGoC/zWM3Q6CMAyFX4X02sa5KKCvYrxYR5WaMEmLhITw7
 m4a7853/lYwVmGDS7WC8iwmr5ThsKsg9iE9GKXLDN752p19g+OseJeFDQMeXdvUXUtE/gR5MSp
 /ozy43n5sb3pynMpFaVAwRtKQYl+sTgccxOL+LzDxMsG2fQCJVMD0mAAAAA==
X-Change-ID: 20260927-pvr-fixes-a-40876d8bbb25
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

These three patches fix pre-existing bugs in this driver that a VM_BIND
series depends on. They address what Sashiko, an automated review tool,
flagged while reviewing that series (see Link below).

tests/imagination/pvr_vm_map.c, sent separately to igt-dev (see Link
below) and not yet merged, reproduces all three bugs and shows they are
fixed by these patches.

Link: https://lore.kernel.org/all/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com/ # VM_BIND series Sashiko reviewed
Link: https://lore.kernel.org/all/20260926152341.783867-1-gye976@gmail.com/ # IGT reproducer (not yet merged)
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Gyeyoung Baek (3):
      drm/imagination: Fix reference and vm_bo handling in remap()
      drm/imagination: Fix pvr_mmu_map_sgl() overwriting its own error
      drm/imagination: Size page table preallocation by device address

 drivers/gpu/drm/imagination/pvr_mmu.c | 29 +++++++++++++++--------------
 drivers/gpu/drm/imagination/pvr_mmu.h |  3 ++-
 drivers/gpu/drm/imagination/pvr_vm.c  | 13 +++++++------
 3 files changed, 24 insertions(+), 21 deletions(-)
---
base-commit: 98c7fc4219b93f953ee85c07fb6c8256046aba73
change-id: 20260927-pvr-fixes-a-40876d8bbb25

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>


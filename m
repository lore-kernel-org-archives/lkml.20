Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC213890E4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385415; cv=none; b=dVBcJHonDhkwyfniSnXQJYF+A/oGq3HjqcLJdTnbXfkeZ/uK5Keo1BlOvQXzpstyhSdIdh5LS20PedMZ8nfzRjV5o3nCTbURk5RirwgNtkbipohFlw/d0C2z5gcOu7HLSjHXiYEii5jVBx8qU9xojlnEwViHMVzrJ0ZXBEdXiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385415; c=relaxed/simple;
	bh=JntwnoI6GK6tXhhT9RaDbnTD2jalYeSIF9/YzYT+0/4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MY93tdV/+LYtDLGoyWB7tGPpiNW5hTWbXOPGvhYTMLfX713yV4pO1TmOsfTeKLJSCTmlKgOjuzwe5qGeSItotZFvATHDn3UAXy26OjzXnZEFs/wAOyWCF3XVKxOHBRMt6FSgOA3/RxiHnE5cSBNLoi9o38LZk5IAivS8BZij6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hw36NPtQ; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hw36NPtQ"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so57689245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385408; x=1791990208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yw5onK9ABSjXC7tgDTQ0zX53Fggmc7w4C6cYr6DSCw=;
        b=Hw36NPtQh0uqepLlV2WMDV8YURrFXVOokGnvmYj0QtD6sHSjHMAR1RFSb1LZZ8heSQ
         bNoB7GrRQGMif99a9UIDnMfdtC1avYTqCo0HNTeuefc9Tyqt8AghPxwxteZp03kRWWgy
         LF6438IsemR5saq5g9vKDeJH8n1i4Unqz+xVPP+6wtmi1T5lEf63Ib3xmOuHGJ7bHL0W
         UY6mEaUmIaqGsRc+BWQ9GEkHarnqyzrnKn0T17kYidovKm3CMDCQiqUob5xTVRk/8eX+
         iZj0LYruI5T4+oOsK5yivXnP8mD8x71167Qunh+utz7yDAUqVc2RYzgF6fkaUXjJXm75
         KOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385408; x=1791990208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yw5onK9ABSjXC7tgDTQ0zX53Fggmc7w4C6cYr6DSCw=;
        b=mXrGMTStJzhyLyAk7JSWx8OPImSKf3yvnXBbGqFYh44PgBB0bnBDiULfCXC3J0T0JV
         y52C5UTPwYObHQUFxJKkq0yO3yMGrNFK50beIrYKI7Ce+8y53OGnQNGuROMYoILkUMEw
         x6KltmS2LEGovCrSc6OZZri8U0vvOPcT8XYhi563GzvKvUm+6haPbphBnqLjjPp46SNp
         FM9GIjjOvLqUx7BZsp4Y4T1GwZtBbakY6jgrrV3ducP9uvbU8yDeDbDLLU5xA70R+1Mi
         3IrQ7SMB1g6Q2KNGJxmrXg4SrS3yktcrOjJTbhFmw+aIOtArzKjJrfKIJpumr4pYUZ1/
         qKvg==
X-Forwarded-Encrypted: i=1; AKwUvByMk3vGDfm0PTyw+2PyUI5DJDC2dT4E0SGO1LBZdPE2y5XEB/jQ4dVVLyIm6WgyczFEJqYI4w7wLtlXU90=@vger.kernel.org
X-Gm-Message-State: AFuF++lpvfekDl/qC9jBgk/aBS1i6EGor2RFCwkPyMsquts1u+A15Zte
	CZfp91Zw6cf84a5aGYA9v5lD36F7sSpFnBVjw/wqug9j0XJY99fRQevJgF0Ron7NGc65LdhFL9M
	dbLXG1KkAk1qxOCW8IndXOA==
X-Received: from wmjk10.prod.google.com ([2002:a7b:c30a:0:b0:4a0:14fa:aba6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0e:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a180648fdbmr40128625e9.19.1791385407774;
 Wed, 07 Oct 2026 08:03:27 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-1-vdonnefort@google.com>
Subject: [PATCH 0/5] drivers/virt: pkvm: Protected VMs with PAGE_SIZE smaller
 than the hypervisor granule
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series allows a protected VM to boot with a hypervisor whose
protection granule is larger than the guest's PAGE_SIZE (e.g. a 4K guest
on a 16K host).

This is best-effort: non-granule-aligned sharing requests are rejected.
In practice this works because only the swiotlb is shared with the host,
which is allocated early and large enough to be aligned with the
granule.

Tested with a 4K protected guest on both upstream and android17-6.18 16K
hosts (with MMIO guard auto-enrollment forced).

Fuad Tabba (1):
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MEM_SHARE

Vincent Donnefort (4):
  drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
  drivers/virt: pkvm: Make pkvm_granule __ro_after_init
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MMIO_GUARD
  drivers/virt: pkvm: Allow granule larger than PAGE_SIZE

 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 102 +++++++++++-------
 1 file changed, 63 insertions(+), 39 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


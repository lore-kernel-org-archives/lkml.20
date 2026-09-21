Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF049503F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993436; cv=none; b=nDeHqZZ9zCGoQkGP78hswBDPYgrDk07+YIP/xn67K8jhxVVu3yJSAiTqFczhuDkHk2kJaDK9KFwLA9sQ03yHTmwt0MbG8WAnKMBZP3FX+roqJ3rsYTs1RyovgdQbTnMavTaLVEuFmgM6CtXuLad05sNUmoSpOEdbnh1LsIYsHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993436; c=relaxed/simple;
	bh=T3FwPjlvnscQHR8jx5/rkQBZvadbHM0UeyhMOsIsDU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGqjO8zh5FagPlOOKDCjMS606cN2+fQMTCJ491aLwKtLj9y4fgjNbnMYspGrQr6o/gLGjnS512AewkKaC4nYjrDmJxX/nYMAIL1IvlJUhzQ56yhqnxmrIbaw866Ujw564OzMaX8lCTidvX5sKmNZV0qXrWt/In+Dw7MBxhUfAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Amhr/CNQ; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Amhr/CNQ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso3830016a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993432; x=1790598232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JE3HCQjPuIhn0lobZGGXaWXmcnd2kPkISnJT/NhU4vk=;
        b=Amhr/CNQGrSpEEWqX041ZVx/vyi1+48y2+h2e1kp1NDJjnlO8zbiFcy/jUrzdHQ93l
         dZCjK6jfoCM6dF9+LGmh1e7l14RFhj+lLd71q7Z6EhhUY5rg6JiyujkCM1DfGv2tqtPY
         dYp6u/RIDl4g8PXX8PE7rEvUT/mYl/+1b0+f7iyIinN/ddbvFsInY1I8y58qdfQuvl/K
         54HZEygdF4Iqzr/wJRg2/Rs0uhgHbykR96bKLnlCxqHSK6U1u+Lpz4kYUpmo30P8e8JK
         WwU1+QWeSPBbPXRdAzoignh+BD55ldtyOrcn8LCnS2xgbrmIv0TeZKGnvXkk8FogxjBZ
         O2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993432; x=1790598232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JE3HCQjPuIhn0lobZGGXaWXmcnd2kPkISnJT/NhU4vk=;
        b=Ph0b0oZmo2Rj5XBiFjlX3RzIrz0eqwGkNzAb477LTrdIgLQwumwq/P0Gb0i9qkw9A0
         t2CHSayCT85/28w1a4WNSMvrRtA3nMwUxxSOFNO7sSsuvlwjIVvvgdoYccroxdB1Fwwo
         yu4ZqnM9eor17kXpzQtR8a0L0La4ipYyr0gkLVB5uet0BZ8EVWiLhboBnfJqj/QUZdJ9
         qUoQOTt+CwvAo761HRw26/6sLTzFQYozEBrGk6XvV/vu76a/jzzyY4IFvyU94OSoxA5+
         /if39BJTalEXVy2qN3bTojXuI55Nqpuv9QJd3r3ryTqDGrlvVt81Y9qf2j8B9+pbP3i+
         K9tA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0XxYLQnT9mf4WaHvxkRK4CAQC5+qPmz/9VzWVywYhkgv54vhO22/IeXkDXH/z4S4nQqzPoSllqfDCSI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYyFZi1aj/9YqMG4mTaKnHQWekec9ML3uDmxMc2nzhiegtu9aK
	2mgFP9DfL7tNHhzpxA8Jz+K5XpQvYTcMMhML/E0zrrLV86VQpPjJ4yf4
X-Gm-Gg: AYBFou14Tffmh/ZNiQLPRue2knLXgebJo/2pnbmCgAwvSpcr79aX0KSGi/smSHyvmPv
	wgBfOiVBue9kmMrMkRTEOsymZDUcIPxvouBCtelmJ3BkT2Sy264m/i8q00sLh5hDETj9pFtrDi4
	L6L4iOWzxcEvuz3gXm2VcWedqqRUUl+QIESb4uQbf1MvtGJT9Vzir3xSqJE6hYE9yHbSdJTTh0i
	MbwSRepaLP4Kct8duYeEHLmPVSSMuwX9mlSVyI+njZ/TurD/2UXwKn17y5nXO4k6CiDLzIlhmys
	5N9/rqfpoQkIMerA8RpbQ7i1nrP3rNlQ18Vh5Po6oZlZqxVX8J1nHZEIlh6qLBjZYsDSNwlzAQG
	cPKxGawiKdnl+jiriyxo810TPSL3JHj6gG+upuZpuQo7sB+YYhvJWpu+q+H375i0abwGqjMawcl
	v5wxnZTInmkZ2eJZsE80c256VhEDfU3jhVYsZtru/wp9/ZTs/qcZqXSvIOCifK8WwazOJed9z/0
	TEUJA==
X-Received: by 2002:a05:6402:52c3:b0:6a9:cae9:471 with SMTP id 4fb4d7f45d1cf-6aa5478b9dcmr7776900a12.21.1789993432123;
        Mon, 21 Sep 2026 05:23:52 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:51 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex@shazbot.org,
	eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	ioana.ciornei@nxp.com,
	nipun.gupta@amd.com,
	nikhil.agarwal@amd.com
Subject: [PATCH 6/7] vfio/cdx: keep logical vm_pgoff in MMIO region mmap
Date: Mon, 21 Sep 2026 15:23:33 +0300
Message-ID: <20260921122334.2099-7-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921122334.2099-1-suruurism@gmail.com>
References: <20260921122334.2099-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_cdx_mmap_mmio() overwrites vma->vm_pgoff with the physical frame
number of the MMIO region and passes it to io_remap_pfn_range().  The
VMA is inserted into the device file's mapping->i_mmap interval tree
keyed by vm_pgoff, which VFIO expects to be the logical file offset:
the core links every device mmap to the device inode's i_mapping
precisely so that unmap_mapping_range() can revoke all mappings
associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to io_remap_pfn_range() explicitly.

This is defensive hygiene: none of vfio-platform, vfio/fsl-mc and
vfio/cdx call unmap_mapping_range() today, so no reachable
stale-mapping issue exists.  Keeping vm_pgoff logical preserves the
VFIO core contract for any future revocation path.

Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -257,6 +257,6 @@
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
 	vma->vm_page_prot = pgprot_device(vma->vm_page_prot);

-	return io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return io_remap_pfn_range(vma, vma->vm_start,
+				  (region.addr >> PAGE_SHIFT) + pgoff,
 				  size, vma->vm_page_prot);
 }

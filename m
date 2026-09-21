Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81FD49B5D8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993438; cv=none; b=tZpIRdLM1nGA2Z3yB3q0h+8zOr/xjTm0y+XcI7EJsAaFAzM8mF4j1qFkN5vlm4M7guzHhMIWtfxSkQ+SWo6qN/WZQTTWaumhuzwABpKg/zhJ/iLsIGryfxp7xPLgqSl3C9zKZ54x7dIn832MRc4ZLkqQpj8T1zu/Sc36sYPgSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993438; c=relaxed/simple;
	bh=d0Pu1ilCGL9vvnrLmpOv5p3mO1EXNOEK6StG7zB1nxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6hfklCBksASPrDXOOr3Nlos8jqa7LSgQX+S7yodDZtJcQON+3BahsTMVOt1y573hDnwYIbuKbCNZ1uoTxT2Vv9qPGYrEocYtyB9PBkm40zHI2Ya8Ptnbfk9KQWAHrweCqk75yXHh3gMnX9LGOv45tePL8rmeMTGozhKTFUk07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXpEEn8r; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXpEEn8r"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so4628992a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993434; x=1790598234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVmp8Yn2ZqAd40ufyn15a/l8ROXyGaSQFj5xPJK5IVE=;
        b=gXpEEn8rRNYPRn+XfHK/fG4sTzoa2B3Us6LYka+CBpL3E9PmW85myaeSY1EUB5dMBC
         QEKTLAtC8xPzpjKkY7H/keaGieMQTG+0J+xETxU1UiunS5QxQRnQ3+2kmqK3+5WoAKgR
         cEGmZLvxof7PPdIR/fkhy0IJP2ljAiC2nMItJAg0HxXW4+Av0atrRA/OESSTjabuAa91
         2ER+Yo+ebtZpzzViZOTyNDw1FKo4AE0kEcVLUEhOyxIz3DDyQw6zu5EPODy56EvaUBWq
         SEAMEzLaAFPTuiZ2z+8G2u8Cy9u4TE3NSiAbeNH0n5plKu3iKmcu3r+LmtJ05EVBcqgB
         tBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993434; x=1790598234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVmp8Yn2ZqAd40ufyn15a/l8ROXyGaSQFj5xPJK5IVE=;
        b=sJXJDnNSoQ6QPQkPeWf7PwCewI0eNAd1j6HVJELwriL1uVWqW4ohjCEAt2Zw6j2ohP
         72+zZ07ROWtTtxSwWUydAnm7eUAZTGn/XL1qtyNV9O0neffZVHV0EqqA66YhQNMSf2IT
         kshZ22Rd1iv4zknTIsPNzK69WhQQmkCYiotFR0AMAVP8jl8fQqUvTiYs5t1u2CD3qI2b
         oHR1o3DaI80Xq7OPkFKO8L0ehB3JxBc+Mf0Ac/BTRYLtiabRfo/JZambkFKx/UFluSsZ
         G7V13vjC8f7KdaxcO3qyJy09p1FYd7Okb2pRotRlU0Iqt0yQ9DYDsGHgI6TiRSplcuMN
         I3gg==
X-Forwarded-Encrypted: i=1; AKwUvBwopxSOSc/lJNHuEUS5HezrhFN1PHfO+E1nTzXm6fIc8LqYbrrOncbqplZitdsIsHAlb197KiCJTs3oySg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPvG1HGD4Hnp/6morFQtdLj/Z0HlC/lCQALzdelT81FAqsTMej
	oikwFWaB9G/FyIw7VfEsqIvXoTQVejU+F52iAmmNiwwjLcLbRHg/txOZ
X-Gm-Gg: AYBFou2LczxicnYpkHWDeRgdKf/fHBu6cu4DylSt6hDlBPhYQ1wqaO8C0FxBG4zr0XM
	NKwiRU7o6z5v851r3zltfKvKo0fdIdujzcI3VQMBvqhi/Ss5e1L76jZ7gI0IR0o/0ZCTGSUfj0i
	5n1OKafxSuhsdAA76DzEcwpSU5jCOF7JShKmUAAx6VgaDiMjz6TA7uhSwU11MjARDuwlqdFSdco
	t3hZY3Fj6wZ0E4UCyrjZ+mOhK53YKEG72pusXXB3yY5xKYq+RwWtaieejYuf8jOixpn3AyBb4Y/
	a8rEGEgzp+e8+Imxtq7amCdChs5lLfmjvzQvqjoiSfoLMOA+NIEkjOHAyiD1YY5e/XuYNQpHxqh
	iuoRd4L4NIH8vYusJUgULbENuPhqcy1wY6PaiUHHx+4rtIRzq1tMa7t66YKcUwCEr+f1E/wTDLN
	Nn6BK+ZfCZpRDRMHLkbXu1AibR130syNshncdgDw9BFSGdLrUh6BjM2U+60SELYiCNTtwDdfLRD
	E6JTg==
X-Received: by 2002:a05:6402:3785:b0:6a7:ee56:814d with SMTP id 4fb4d7f45d1cf-6aa5798162fmr8755777a12.27.1789993434148;
        Mon, 21 Sep 2026 05:23:54 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:53 -0700 (PDT)
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
Subject: [PATCH 7/7] vfio/cdx: reject non-shared MMIO mmaps
Date: Mon, 21 Sep 2026 15:23:34 +0300
Message-ID: <20260921122334.2099-8-suruurism@gmail.com>
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

vfio_cdx_mmap() accepts MAP_PRIVATE mappings.  A non-shared mapping
with VM_MAYWRITE is a COW mapping, and remap_pfn_range()'s COW special
case in get_remap_pgoff() then overwrites vma->vm_pgoff with the
physical frame number:

	if (is_cow) {
		if (addr != vm_start || end != vm_end)
			return -EINVAL;
		*vm_pgoff_p = pfn;
	}

The VMA is inserted into the device file's mapping->i_mmap interval
tree keyed by vm_pgoff, which VFIO expects to be the logical file
offset: the core links every device mmap to the device inode's
i_mapping precisely so that unmap_mapping_range() can revoke all
mappings associated with a device (see vfio_device_cdev_open()).

A raw PFN in vm_pgoff lands the interval tree entry in the wrong
coordinate space, so unmap_mapping_range() cannot find the VMA and a
stale MMIO mapping survives any revocation attempt.  Without this
check, a MAP_PRIVATE mapping reintroduces that corruption even with
the logical-vm_pgoff fix in place.

Require VM_SHARED as vfio-pci, vfio/fsl-mc and vfio/platform already
do.  This is defensive hygiene: vfio-cdx does not call
unmap_mapping_range() today, so no reachable stale-mapping issue
exists.

Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index b31ed4be7bdc1..6d208db0896d6 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -271,6 +271,9 @@ static int vfio_cdx_mmap(struct vfio_device *core_vdev,

 	index = vma->vm_pgoff >> (VFIO_CDX_OFFSET_SHIFT - PAGE_SHIFT);

+	if (!(vma->vm_flags & VM_SHARED))
+		return -EINVAL;
+
 	if (index >= cdx_dev->res_count)
 		return -EINVAL;


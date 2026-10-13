Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CD4F7CCC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893992; cv=none; b=SNLpRhHn32DQ1MVs/Bjv0A3M45zwH9y3A3w4sihTTY/OGAqL6Jcb5rhrHWgrR9RcNdsoSrpx5O5hG9+E28I87brG35Bbsvt37vkBoItxwpsaQPlLz9E2KdIFaTp/9AO0soTqgN81m7hDFHmlF2bFNF0esVtmAUweI0axRMdN6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893992; c=relaxed/simple;
	bh=y4qpe0tgvGpYrTTX2TUZf8EY0t68Wbod8QGn65cyHK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfu4QL69wXbRpurfxDpkEqYKT4JcQZQwEWDXQFzNKKeVCO0dlxsuPGvjsuLLghIkSFMgdMGTp6EPM8haJiO9WMZ1Dj1D/iVpBHqzZoOXWB9r2dz0v/t5xXRctd6cTbh4cB/Ph8YmsFushTFgmxgFVrDvHK6I/EehZH+gDZAqGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b=XNOLQOZP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b="XNOLQOZP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2322574f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1791893990; x=1792498790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OLEATEFg9EwTB6dtGbWTtK5m6qNSnDgXdqZaAx1bWM=;
        b=XNOLQOZPtNf+Mgtv8IK8+inINR58QT7DHa+G43QJHwrwdH9fbjJojJCXa7EQvqN3y8
         AdRrFoUl5huQfx1+/2z8iQBnIm1gPnS0YqtSS7nqbFp7z5NoTva6/lms1htPugSJ9T3d
         JIN2d1SnnAcay0rmsEqSvC/3+DkLljp0jxH72nNUNoPHVVjaNlWFc6Wwzv4W62JIEvFB
         ca5O0d9JvXKtqQjlP9sPwJKwEyOvcTClBNOmMtBTKdxcLJrRTQJO1mvThqoZF+7aowjC
         3t3mI/umRlnPtaJWJi/iyFrrAAInIJNuw/5eks9cejlFCD1OX2VbOzs3HrI12gBxpofe
         kYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791893990; x=1792498790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OLEATEFg9EwTB6dtGbWTtK5m6qNSnDgXdqZaAx1bWM=;
        b=pO8y0RLqjElrOE88u2airme8PxveJ1H/JAx6BpYpyCjOJK3MZTrIh04I5DvgdUx1XH
         RA1ThS7G2aVS7jkUIE33SAqSqv7kTDtv2nuURDMz1SGcd/Yg6Vsmg+Z2Yqua0ZfC51/+
         XOnWfbC9T/nzlwo+2Ku8pBcDD6kL+U8MSGYPnlG3Cw21Zo5E4MGo2x9+jznSGDhG3m/I
         5Ufuff+p1S4FcWcv/Iz0BgRs6esMsgv1Xdi7VC6PcUk4IjbmnY1GgbYSrcj9BE6B6hHl
         Im3HlgccIdEhzyx/9dCyFTpRdyHHD86jPvUxITCXdkakztl+l4bZsXJqppBjgY9RTWZa
         lvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGy8nV6Wt5LpVg8wIPH9pFVrHKh+cHErykrBxo5w6Kpz69Hcs1kvf/kEwNHX4bBk8Pmq0spbXTWfN2vBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKfCj46bDs0TQGmC/3EXRtQ4BwFQA1HPdj/qVbkB8pt55L7UCu
	nAVNq3yg7Cff3L9Kdo/xNdgQsQ00g61gO7IzdZ0mzskpRIMJHOUBQ1iVo3ziYyHERjY=
X-Gm-Gg: AYBFou0iLWEoQWwpaOMEy2j2IO5qzZcjGqFFH6qyxAj/pZWi42T3faY2QjDFa1kr2VV
	bW6QKPzG/u/+aPmOIZYKLFLQhdAys9/UBmtZlu/WxbAJFeR3+QY29pyOLiIPjHqXvZ7hhh7VYbL
	We9gALEhO+nmZrHOs2KBpLMdBHilcNyTQbrI3kEigLYcUizsBAre9sFIsTAJXpmuKD2UKO/9Bqo
	VmurtWeYSrMSHZBD8BAayfSuxtshluLltRW+W5pMcZB1WmHMW8LuVor709K3o9n1NXEMkUjBI6m
	aT0sQ6cEWn5jhGHCHVaYrKwyh8HxCgwUzLyehMbRK5uWgHwal1rQPuF3M/8+loepnhA170q8rzu
	cJD5Nnb4VY1a9IZa93DciTrmQK1mUovijE3WHHHE+SCy0ojsZM0N8AXM/1AYKpWaIfAldeEdh8Y
	Qf8vdt7mI87f3ULP4Sgcef0g79djGJ8Bl5Syxtvii1mfwqonMzg3/oMt00jsmDLHdaQUjy+7MY
X-Received: by 2002:a5d:44cd:0:b0:488:89e4:c3af with SMTP id ffacd0b85a97d-48dbaae4869mr18341163f8f.45.1791893988877;
        Tue, 13 Oct 2026 05:19:48 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:26c8::3dd:3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm4806155f8f.50.2026.10.13.05.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:19:48 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Ankit Soni <Ankit.Soni@amd.com>,
	Baoquan He <bhe@redhat.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v2 0/2] iommu/amd: Fix device table setup in kdump kernels
Date: Tue, 13 Oct 2026 13:19:42 +0100
Message-ID: <20261013121944.4060097-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

An AMD kdump kernel booted with crashkernel=512M,high and
crashkernel=0,low fails to allocate its device table because there's no
memory below 4G. IOMMU init fails and, on our systems with an Intel
E810 NIC, the ice driver's TX queues time out, so the dump never gets
sent.

Since commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump"), a
kdump kernel normally reuses the previous kernel's table. Patch 1
programs the new table if reuse fails. Patch 2 drops GFP_DMA32 for
kdump kernels. Normal kernels still allocate below 4G, because that's
what the kdump kernel checks before reusing the table.

On an AMD EPYC system with an E810 NIC, the kdump kernel without these
patches failed the order-9 GFP_DMA32 allocation and its TX queues timed
out. With these patches, the kdump kernel reused the old device table
and the dump was written over the network. The reuse-failure path in
patch 1 was found by code inspection, not exercised by this test.

---
Changes in v2:
- Explain the split base-register write and DMA32 requirement in patch 2.
- Limit patch 2's stable backports to 6.18.x and later, which contain
  38e5f33ee359.
- Add Ashish Kalra's and Ankit Soni's Reviewed-by tags to both patches,
  and Vasant Hegde's Reviewed-by tag to patch 1.
- No code changes from v1.

v1: https://lore.kernel.org/r/20261002133143.3628181-1-matt@readmodwrite.com

Matt Fleming (2):
  iommu/amd: Program device table when kdump reuse fails
  iommu/amd: Don't allocate kdump device table from DMA32

 drivers/iommu/amd/init.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0


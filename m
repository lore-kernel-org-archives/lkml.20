Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56E3264DD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240188; cv=none; b=ZZY/aL5U6UL17T9/AFwORP9hKRhyBsEnGLf+onRTp9W4u0aNU4Tr7pOlyTrO8b6Ipl49oG7Z/uaymA5C5ffF/lRt+vvFjopBZeFlKthHIubWuebQl3ZiNRRqIsLSMt/QxHaYaeVJFnRwhipUPQ0FFukYHV5qqn/ru5XqTt9YveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240188; c=relaxed/simple;
	bh=H4Hye3lEwum8JrGKKwmVp17OxeoL2fynOKi0O96y8bs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=R64DnqtEqDRl2NRd8BqNGDr/j5ls3E1toMI+WMH+wCw9cKB3465GVGyOTS89wpETYq46eJO73JJ4Ql8Lhg74/qEYgZeruI8R0IAS6RVstE9EEmWWE00GsRqyc28RFqJXQszf6aoXFdsPBgGNQsvhNcznCepcQPqv9fHebl8WluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DRW6/YMl; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DRW6/YMl"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4870142f030so1345396f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240185; x=1790844985; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7LSd8Ovvvgudslzcc9mvhRx3yyqB59TfcDqoB3H0gGE=;
        b=DRW6/YMlJ0Vs7Ie3X0m3aLfCoLjlnEWEdMjW/Wfm0PoZ2/7Dw5fb6neMEsiu70SGJq
         BTkxTvFCtrWoUtYkdbs/X7fJZP52fiVYU2FnqH+jWsDeVdAjhZhZ8EFAEwcQWFjZ1GSN
         oL6nYjfrhSw0jpzl4+iTMdNpxlwYqODdnt4jGOo9C4NdXsHOgTXKMcltSMmywOMk01CR
         0QDMIWDGe4T1vF1UpR8MgnsRofLtw3nnSUOeRFvI83faUwmzpuuHJHCFd22/65OteVPj
         PxUq1uHWk9R8WHIFCbJ6/grfqEy9NdRHrne+879MKFwTzMLmIv9rou99ImURVP9w/DHS
         NbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240185; x=1790844985;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LSd8Ovvvgudslzcc9mvhRx3yyqB59TfcDqoB3H0gGE=;
        b=YM5rijHtwEvtkUjvgXTU2PQV/rL4kudHDc11NjY6g8hUMh4Kol/4+730aRuQYhTD4I
         6timadRJvRYEJplcSVs+2IjnmNbLLbbNkM6zphwHCgboRtCQpIufpErKuiT48jWFLCwd
         pC3dXLtN3cYqiFX8eqXTkGWxJO/nD56XLrK1IV735j54ulwHR9jS6q4l84Z0E3Wiags8
         oQc94hHzByk1AFd5AXtgRf2vuqXMSDGm7XUvJQP2gQg7XGmCehdIvTOyn4DW9CYN2Rni
         2uQNAcMHB5AoIbcBMYT4eJ9faz799cdJORoccd2RlBYKQf1Ec6jZ18eafbbahziafbYk
         oRGg==
X-Gm-Message-State: AFuF++kc3nLwPI87EQbSIXOtxS6Lqpu5ceoX5cNP3+8AQHfa95Qo0Akn
	Ay7bYPP6ga9dnI8O+plUaKiGDxxayWQHrXfixlDGnRPprgZKAo949vv3CkZY0SvXsQdoKaGk+bb
	yhcpU2I1KxK0bbkoZ3tykz2qFGlKZNm97bWNP0fTtYM/ujyWdlkHKbSLP32d0tGpItUfvhBOt8v
	L9SHzXX6pW9JikqE3fZmsBQMaM9NnKfGcf/eNwgNCAPBn8rCX+abAS294=
X-Received: from wrhm8.prod.google.com ([2002:a05:6000:1808:b0:487:2121:9f6c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41ee:b0:487:221f:65b8 with SMTP id ffacd0b85a97d-4887177530cmr2877325f8f.50.1790240184346;
 Thu, 24 Sep 2026 01:56:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-1-smostafa@google.com>
Subject: [PATCH v2 0/5] iommu/arm-smmu-v3: Fixes reported by Sashiko
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

While running sashiko locally on the pKVM SMMUv3 driver patches, it
reported some pre-existing issues in the SMMUv3 driver (the RB tree
corruption and a missing NULL check) and given that this is not the
first time a pre-existing issue appears in the driver from sashiko,
I went ahead and passed the whole driver to Sashiko which reported a
dozen of other issues(except the last one in this series), I included
fixes for bugs I believe are true or worth fixing (others were mostly
missing NULL checks or bizarre HW/FW configs I don't think are needed).

I also sorted the patches based on severity from the most critical to
the least, so it is easier to apply a prefix if some bugs are too
theoretical

Changes in v2:
v1: https://lore.kernel.org/all/20260828125409.1921538-1-smostafa@google.com/
- Drop patches 2 and 3 as they are fixed by other patches on the list
- Collect Rbs

Mostafa Saleh (5):
  iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
  iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
  iommu/arm-smmu-v3-test: Add missing error checks for inv array
  iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
  iommu/arm-smmu-v3-test: Fix UBSAN error

 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 19 ++++++++++++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  6 ++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


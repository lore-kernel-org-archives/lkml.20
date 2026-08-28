Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB2328243
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921657; cv=none; b=ZDSYUzeHHYaqu+cpD1+TOlY+N0zJY/ph7zYjNcFdjJNvTI+ijsKQkbO4VpjA7EdZIvU3027j1yxIE1GxY6V9nLv1l3y6/Bl0ORcuAsr3iDFEXc/o3oc2urJuig/kk4lFOk//drpp5TyX+dVuRPWedpkc8yKhKRYLDch15Ui1Csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921657; c=relaxed/simple;
	bh=3LghuCz6pycXbnP85DgU8ufPyn28FgBL9yBgmwQvaVk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p3tBUAoD3HLEtus+lRmLZjZ9BXwej2v7oU/NU6p54ynYNF7YWUipeHsE8/EKBIFtxPxeva77e6qyp061OdPyoNA13KxfZjEhDbekN+9vnZyvhuCiOa63978kPZafKtL/IDM1e6jfdhWUEQpGBCll+9Jk1ILgQrbuYK5CExpaxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ub1RXiRC; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ub1RXiRC"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e8a59be6so95415f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921654; x=1788526454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRGIXLcHuELZx1Qe/K3lDAq7MZx3TuN6UHTja/wh6Zo=;
        b=ub1RXiRCDc9dsbje7rfc5tri3LFnz4mnK1mYA9eGRMGx7cl40oIejN5+O/6mOjhc0Y
         CSs1yAIYndIW9do904Z0ZucI/3anE4PmV7oEKn7bi2XAoePfqcKC7pDAFPex0/X5b3h+
         HWlkdLnnaLHIOkRkuNfXDqlkrg4HNA7PzXWhaP+kM60NyyCNb/p7AqQf8wygCDvVf7jR
         XEJSrxNL2EjXg1/IJY7pmr6ssRr817wVGGDFzge/rub9B2vLF09/EMLxi5XzqkTCzDfU
         m0eP95BPEQLkxx6x8Sh2/TvC+kyGM+0LR+daJbkYzSBwqD+av5VywFpX9IItkkAp4aUr
         7lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921654; x=1788526454;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRGIXLcHuELZx1Qe/K3lDAq7MZx3TuN6UHTja/wh6Zo=;
        b=mofej5oh0BXc6ZrJQ19HLLvTMBk6aHofoPmkIOTZOfU0xyhVc+4nA1ISFWtjNc38SW
         RGJf0H2Zw6drS9JOpDAD0NRUhzBC1Vgj3OPdCmMB9gf7V6GXuJpMjM79xfHP2RNuHAsR
         Ynj7Z7y8H8DVVA9cO3EP+mBifeuoSmeBJXnwm5YncI9V855p7RSdzLsMmn86E7gwht2T
         ILwQHYICMeIRwYoVRVBHL8djqN6apON3Ee6b7LmCTf1L67aEd6SjVRtM3laHgIp5AGgf
         z1BnryMDToaEFJO7Ik9jz3HzGpMfI5eALV4Q2XT6ohWxc3hhNfeUHvRsoESUr4nHD7le
         68uw==
X-Gm-Message-State: AFuF++kn9ImL9VRcj50/2ZoJF+5rAa5lbtepIFdGkQFqmuDdmIScvQwB
	pOZWkzJVT/w3FmhWMhSoKHi4TkM2EuWkphUmLMZs+0b9lEFdPF67V1QucZNcaeg57EDHBTO2Loh
	AZGkaxVT2M9HApB435cyvRkdbETOFZLiK9/lzs3nFa1qoyU/HsvKdhQdjqo+wLpFjESZX+xXsL0
	LCXaEwl+r51g+NMFsECzt01DZgjh7md8b5Yai8gBSTJTCfRY6w8LBFNco=
X-Received: from wmsm23.prod.google.com ([2002:a05:600c:3b17:b0:495:6261:8954])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b21:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49b91c3f643mr99111705e9.8.1787921654019;
 Fri, 28 Aug 2026 05:54:14 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-1-smostafa@google.com>
Subject: [PATCH 0/7] iommu/arm-smmu-v3: Fixes reported by Sashiko
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While running sashiko locally on the pKVM SMMUv3 driver patches, it
reported some pre-existing issues in the SMMUv3 driver (the RB tree
corruption and a missing NULL check) and given that this is not the
first time a pre-existing issue appears in the driver from sashiko,
I went ahead and passed the whole driver to Sashiko which reported a
dozen of other issues(except the last one in this series), I included
fixes for bugs I believe are true or worth fixing (others were mostly
missing NULL checks or bizarre HW/FW configs I don=E2=80=99t think are need=
ed).

I also sorted the patches based on severity from the most critical to
the least, so it is easier to apply a prefix if some bugs are too
theoretical

Mostafa Saleh (7):
  iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
  iommu/arm-smmu-v3: Prevent rbtree corruption from duplicate streams
  iommu/arm-smmu-v3-iommufd: Fix error path in
    arm_vsmmu_cache_invalidate()
  iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
  iommu/arm-smmu-v3-test: Add missing error checks for inv array
  iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
  iommu/arm-smmu-v3-test: Fix UBSAN error

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 12 +++++-----
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 19 +++++++++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 22 ++++++++++++++-----
 3 files changed, 39 insertions(+), 14 deletions(-)

--=20
2.55.0.897.gb25b4bd76c-goog


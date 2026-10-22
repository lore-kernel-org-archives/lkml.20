Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674769;
	b=RKv6L9PCNsxDfyQLMJAo3VgXavQQ/yLe+sCfwSGo2FvdPCX84PJIA1vVPh+7GNwmztDP
	 8df2mOTk3jKezIIM4eAonThQaBTt2SXTdDeSCDeZ71lZ9A2n2ePvsg4fAXjuhytcz/VnX
	 drGH8aWXZu35GutCgJ4xfp7JfT+E9euBJRP2ArrUuhiCLFD2+YawtdXVHzFI2Z0kwNrTd
	 F438AinTayC+dE/JzdjycupSyBnEGc7KN7a/dZTYdffPqho68iEKTIpeNkRMgp0chrazy
	 BpXg9byVFCj+EIi6ScC4Coos0p42nsx9fgKC60T8lUvgRBO/0JBHaIF/TNq1YX6MoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
	b=lYujOMnXseYqgub8r7v3LQVfqQRdQRdN7vrCIJLdcYWHgbhUsd7S8E/UZ3/U6cGN2S+x
	 mBTC+AKbBrVTIwDuErc/VR4oDi0SCimF+fpP+H6ACQfBKsXBq+j1wMNKbbjPZoe9jt+N9
	 ym5IYISiyeMzCLsyhUD0+1od7cyOStMAyE31iNE+wreZOveDz7mIcYFAuMmob1VRThhG0
	 hlflw0h9tuQGglnHWlhKS1fuge5nFYZHyVYfQcl9liUrzdBNjfF1DRUNCoQHratK8SrXt
	 uAl7THzvL65VKB2OEbW/pkzIE8d6ky6inopbQ2P907vufl99OG06dsGvo+zIFnbkXHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxXoZ8Xw;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B442606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B442606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxXoZ8Xw
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f488ba6e90so387637b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674768; x=1793279568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=KxXoZ8Xwh7KC2aQALTuewMxWvaHNn6UmnLWRXkdyerqGZENDMu+EfBR6edkfMvKdgc
         kVxgq6n7IYfs19f7pP0x0wxd2WAJThGvfW4qbYt113uERGax1qPT1YyNMcY+gzKmyTzQ
         KM/6ahsIzcVF/Z+Z9bh08ezu7HaC4vIcStgj5Y8ayIq4J5XRVIyAAGQXZPO9rlfrBAWs
         jziHTij+XebNr+CLXAIQx4oEZSpzH51xVQdB576N1VmKF117KmzHs6qV1gwuiUOFz6fY
         b2Yno05KXnSn46h+3DYEoRlJSWrtEGC88CJTLtlmbUwYy81ZsDIgt92VFny5a13vjJ35
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674768; x=1793279568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=Hn7I5rLHor+ZnRMIlKnv0xiWQOYa/OAUpDddnOGn8EmKSLsGsNlSPYb4rZBZMI5pkD
         3eDUfQq0+m0jfdjknNpd2OpifwgNBxPxjZQVSvThujt/9d91v+IwNwbLSpr+3hENd8Aj
         tFXMs4WDOonsIniZo3f+4fSGxsjZ36cInT4ziwVStSrFQSp1ZxS07i3FBdLENtyKFmdv
         63YtgrcuCtG3hWfdOHohDk+wd1ChuMxTqoD23pnwwXXAK1P6CG2PCFmL/fLFojnW7oQO
         254hRHUSlVMhL98M35k51JSFtYJS7J5w0o+AEnLemY1EGnVSr6HhGQf3BcwRJC63Ztug
         Wx4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLpE5G5XZMx6kdfIGzs3i2RSGF5hV/wQCGIu9yJfuvoozT+QJQCFhB3+IPgqqLmFYtJfxzjAJ/BFRgAEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL18vD0X0xMRnpTHdRAr3mYu7DWJhWaWgL40E7FnH4RseFo0KIS
	Yuw88d/AmKpapqLflDwVvlAZD7Df40cudUXWdsfJ65VlTjHhb86fP+h7Gxdg2FET
X-Gm-Gg: AYBFou0MzQMIk9J+7dTwN0cLnv2AdKoRopswIMhGNs64t75rffijcbNlPODmLhzSUjm
	UCaaUfuugtSrjKcPBswkpbhEQLlchgx9zZS4CpXSu8PFtIdvmNZZI+UFS0HxPJBnOCoL2kY8Jso
	xQGr89WDaksME3Ie3GQAOqhSwFCohE12xb+WTwIfQlvWmH1pHSNcrnKpFIXQ1foAEzvEmnku0JC
	QknP5oTw/DuTDQtelItIdF2Iql1Kti51E8JVrNobwPbiO+XfxE9FciWtcZoU89FIBI/kbGv6akU
	w5XkicbkPfKslDYb7/gj4K0i6JXTtgrwn2feYF+cbikPZjzY6J9JsUObHAEr1k4OLmOnmOcfD2R
	aIyPsKR9KoCQuRUnNvkDpRwSfhzjozX42aPvwelAvFcW4qGMmXrWVN0GLA1KusT1jQ+R2xlPgBH
	f3vlqF/kTOY5goq85jNqa1KPQIhPfDeQMbrQMNLsjBcgasDDRuOPsZoM++P/b12FEtgVSCF7wwz
	9hN50Jycsg5FrPq0ZnDSarVaA+5BUv5FvvMEb1HPKfRQqly4FtD8oAnaipyOzfyZNMDewISTiFq
	H+FZPkhSDvqlQ10NdIvH78HC1sey12ko5OEYLA==
X-Received: by 2002:a05:6808:30a6:b0:4b9:a88b:888e with SMTP id 5614622812f47-5535be9e63cmr3845871b6e.36.1792674768107;
        Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b6da2902sm4259863b6e.11.2026.10.22.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:12:46 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 0/2] iommu: Propagate iova_bitmap_set() errors through read_and_clear_dirty
Date: Thu, 22 Oct 2026 06:10:13 -0700
Message-ID: <20261022131015.3281745-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up series on a6ec38d74c08 ("iommufd/iova_bitmap: Fail
GET_DIRTY_BITMAP when a bitmap page cannot be pinned"), which keeps the
first iova_bitmap_set() error in the iova_bitmap so the ioctl fails. As
Jason suggested, this series propagates the error up the call chain
instead.

Patch 1 makes iova_bitmap_set() and iommu_dirty_bitmap_record() return
an error, and makes the iommupt and io-pgtable-arm dirty walkers stop on
it before clearing the IOPTE. We only clear the dirty bit after it has
been recorded in the user bitmap, which prevents a failed
GET_DIRTY_BITMAP from losing the dirty state of the IOPTEs. This should
also address the case Andrea raised for the -EPROTO path: with this
series, an entry that did not fit stays dirty for the retry.

Patch 2 adds a corresponding selftest. It fails on the current for-next
and passes with patch 1.

Tested on x86_64 in a 2 vCPU QEMU/KVM guest with the iommufd selftest
(mock iommupt domain, CONFIG_DEBUG_GENERIC_PT=y): the new test is the
only change in outcome, with no WARN in dmesg.

Samarth Narang (2):
  iommu: Return iova_bitmap_set() errors from read_and_clear_dirty
  iommufd/selftest: Test GET_DIRTY_BITMAP with an unpinnable bitmap page

 drivers/iommu/generic_pt/iommu_pt.h     | 29 +++++++++-----
 drivers/iommu/io-pgtable-arm.c          |  5 ++-
 drivers/iommu/iommufd/iova_bitmap.c     | 18 ++++++---
 include/linux/iommu.h                   | 27 ++++++++-----
 include/linux/iova_bitmap.h             |  9 +++--
 tools/testing/selftests/iommu/iommufd.c | 50 +++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 28 deletions(-)


base-commit: 04bcf84613346b973a8cc0c59238b6b5bc902688
-- 
2.53.0


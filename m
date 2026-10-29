Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296377;
	b=SzWE4Oz3EOuQXIEOWJudMQpXGNgDyEZj+lfRIcEI4DMBPzOZFBKFGeXhYkqeAK+GgiTF
	 uAd72JPNarNPPsAN5fVVrakeyZNro5cvGHOqWCLA7ZIzm05g3lQig6cUOrKKaF8h36sGm
	 caoTsKAShhtj+vSEaNnFErKaHhreRb1jRyNAOa250kv29AUKj24guA0PKMLSGRyLn//I8
	 rYKmQhY7CRDMptxFCm8UdpvOcJo2+X5J73njUvDR+dnxWs1TtPyi9yeD4bcku4PzUBWcJ
	 SogUkXpoBY9YW6r9P5eSeTdddnN/3OfL9kzm08gewDU+EDcy8hFzpHJoqAVL4SJlayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296377;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=V7BTev0WvCIE8h6eACl3FNzYopQ4CdXZtkVISOrxWo4=;
	b=w7cwcVyrtc3G2EwDevprcemdxi6/DRM2Mr1xJQ93oe/g9zoaKJqKrJ0QuUeR57Ki1MrM
	 pCMmy3z+nxP6cYLXfFZD9tH3GH6+Dy9ArRnR0EJJEm6b6b/v9kcXlbBxOgoLsyQ2QWFFN
	 lCVDAxhP9TP7j1zD3C9EBIMJY3OSVqUxJBeGj5MpKkGtrR2dL6/XMdv4r/cedAoMbov1W
	 Zfyy4plY6EPCLfL7IdYayiNkfWJ2DPT44dHI4FEKvgoU9fK3px81rUMQh8ur4gR9Sw0+e
	 mNmdPSE1Ncq4aVnb/ARTd/y2k37DWPTBje6DIcgb9rXZqgxdSU7SND+hobfc73E5UOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u21D0kvR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u21D0kvR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16FC91682;
	Thu, 29 Oct 2026 10:52:52 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C16FC3F59E;
	Thu, 29 Oct 2026 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793296375; bh=MNFLu7TIDuMgXYx4iE9e2hGmnIPJuc4afAnBP3Vqi/M=;
	h=From:To:Cc:Subject:Date:From;
	b=u21D0kvR1fNWXpIClKGGaqeqXHxTgbsSymQisb5BH1b78NUzlwCulVk/KTLyPs7mB
	 ba9oY4769umLVIEO5efHcazaKglIuThMRc7TrB1zRZwb5iJCtdbCP/Xwpf9MAdZCpQ
	 SDWHyjkgka9xfE3Dk5ufmflxBIKikBCi0t/L3euU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/2] KVM: arm64: Dirty logging fixes/cleanups
Date: Thu, 29 Oct 2026 17:52:36 +0000
Message-ID: <20261029175238.3214788-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

These are two fixes/cleanups I found when reading the code. It fixes
dirty logging detection in ring-only mode and updates a stale comment.
Please view the patches for more detail.

* Changes from v1 ([1]):

  - Keep memslot_is_logging() and use kvm_slot_dirty_track_enabled() in
    it. This preserves the RO memslot check.

  - Change patch 2 to updating the stale comment only, the original
    change is obsolete now.

  - Collect Reviewed-by and Tested-by tags from Fuad (thanks!).

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260605153248.2412064-1-weilin.chang@arm.com/

Wei-Lin Chang (2):
  KVM: arm64: Fix dirty logging detection in ring-only mode
  KVM: arm64: Remove stale remark on canonical IPA alignment

 arch/arm64/kvm/mmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0


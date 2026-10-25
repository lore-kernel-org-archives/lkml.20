Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894788;
	b=ySv61wbadGQsl57bsZ1VRD+DKcIj+kJCabtjSnCUqtEOjDgblMwqE1v8Oq3+6s/h9mwh
	 oY5e8VBTM3A4x3ya8iTiZ29kSHvowLkcm1F/Vbt1ZBiu0oeetidYFYObnoJBBo8WZjcuS
	 k3MrjwbTkHtQDOBG6jEU2/MRSt06KXZ3R8bxZ/gqBWtM8R0sg3XRnCiV5bxOUIlN/tCK1
	 S0U4Ck7IrDi/T8ZU3Sk542OPouMCX/7p2qUIk3S/gz4d+aH5Ts2qk3xPX89CGGygiCTeS
	 W1O5QHPhQt6JueE3jjoibWH4c7nRuSyDg00OiwLvxJ0AvQwa9X0dYleZHBBYOh7o+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ul+GW30CyTASrbA0JVXqnRHT26v9kwMzrmnUD+B3Prk=;
	b=cEa9fgBgPqevZtO+NQ1Pg1Yz/NZedq8A3E9zymrfPBjDOCyy8gkAzrp0vVyv65oMJ7ES
	 CNdaTATRBoHXlpsBe8wp0XviI409dr6ZDzuay86BYAYHqlpjyk0HfVPycgGXc2NciZvkN
	 csG4H7g9xerAyJC7DEFs4Zq02mvDOZgAkT9VRtAMYKuuUiqi3OBe56WP7E3UmpHw3jZUB
	 97NZXifyQ4YG3rutlrzbXw9IMG8Fgyn0yfqm110MLgQAJiMcJWq6qsKX8eh67rq8wdmG6
	 wX3k3G8PtiUmer2i1868oiQRlOleyJ1ULNMl/P6+fqJHnm0b4+dTiZXYcBYkde3061A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NfXHQdjM;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB39606BF72
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB39606BF72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NfXHQdjM
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso18095075ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792894786; x=1793499586; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul+GW30CyTASrbA0JVXqnRHT26v9kwMzrmnUD+B3Prk=;
        b=NfXHQdjM10ODHCkWJtLiTPxd9sKZOxgdagkX+he8B7VxBL6oXv56J5WlHAGsd2uQkb
         YeiAQFmW7Lj2+0d29RIHIuNyEJsKh9k978G0IurB2+2PzRPO400OIEKdCmZrJo39zoCa
         D06F4cG+VeeM/r4hrvpQnZxv6bZM11z9FmMLL9yPMR2beZYC1BdHsjiwbt7iCW31GwHv
         UsA+w+g5qJq5s13ZzapXISjPoJnEI5H0IGcGveIt+g3GoKZLuYYU5N2kQICDyW9xIuZn
         zmxEPv+tn+pBSN1Y7EOdMHX+mp/fDcG3IeUvQv3kn5UN5MzXl5dFSb3irsF+lnOnAC5m
         MJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894786; x=1793499586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ul+GW30CyTASrbA0JVXqnRHT26v9kwMzrmnUD+B3Prk=;
        b=0KtXj01eFCT99u0fnTZLkihPB017GCR8AGASHB7obWqHfsmZGBt4ndTvs0pGve2DYr
         aCWu6hw4E7PdZS2ygKWExbVZe2vq2eGv6vsFglpA/ioqfTC6cNJ/43So2DWWQ8tWyJYs
         0dPshmqkL2DFXvOMfDMhvtA+3Lh4FtADlK9g2VI7utBGA2ipATu5XepSMXPoNzQvM26h
         SqUWBB4Btje+iPCSZpLk57Gyi6vrPmApmIHMM7zNAc9MnC6nDLnpJ14z7EZb6IFR+5vd
         JkAZIMTDQdonTr3jU917HLSKQ6cxk4jtdO2v61t6OF9t1YoskF2flb1PM9HaS57HFjnh
         DNRg==
X-Forwarded-Encrypted: i=1; AKwUvBx8RUk1D93kQqf+2FlccI1tUGUnZHaglCHD3Zrr5k2S43V0xBAumkRhs4dBmBFmpkurXFXIUxDnIPnA95g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTMqXeVDvnNclHLoLwSjdTChrOJdJNWdbz/5duLXiTVUwzGYHi
	xIcADMBQdSSAN5f+X0n1BcJOkZq/5lNiLPvZ1qGYQ5oz64GCa5b8zEPBxwjlV+jWRHTaoPGvRf1
	BrcxhTky2A4LJxw==
X-Received: from plfn3.prod.google.com ([2002:a17:902:e543:b0:2e4:ad81:3a9d])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1968:b0:2e9:95c0:7c50 with SMTP id d9443c01a7336-2ea9c95ba36mr23233515ad.71.1792894786219;
 Sat, 24 Oct 2026 19:19:46 -0700 (PDT)
Date: Sun, 25 Oct 2026 02:19:20 +0000
In-Reply-To: <20261025021930.674647-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025021930.674647-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261025021930.674647-10-skhawaja@google.com>
Subject: [PATCH v6 09/18] iommu/vt-d: Combine disable_dmar_iommu() and free_dmar_iommu()
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pranjal Shrivastava <praan@google.com>, Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

Every caller of disable_dmar_iommu() immediately follows it with a call
to free_dmar_iommu(). Combine the two helpers into release_dmar_iommu()
and simplify the teardown and error paths in init_dmars(),
intel_iommu_add(), and dmar_iommu_hotplug().

Also drop the early return when
WARN_ON(!ida_is_empty(&iommu->domain_ida)) triggers so translation is
still disabled before freeing the IOMMU resources.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/intel/iommu.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 23a1da351ddf..35ec2ae0c8d5 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -985,21 +985,17 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
 	raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
 }
 
-static void disable_dmar_iommu(struct intel_iommu *iommu)
+static void release_dmar_iommu(struct intel_iommu *iommu)
 {
 	/*
 	 * All iommu domains must have been detached from the devices,
 	 * hence there should be no domain IDs in use.
 	 */
-	if (WARN_ON(!ida_is_empty(&iommu->domain_ida)))
-		return;
+	WARN_ON(!ida_is_empty(&iommu->domain_ida));
 
 	if (iommu->gcmd & DMA_GCMD_TE)
 		iommu_disable_translation(iommu);
-}
 
-static void free_dmar_iommu(struct intel_iommu *iommu)
-{
 	if (iommu->copied_tables) {
 		bitmap_free(iommu->copied_tables);
 		iommu->copied_tables = NULL;
@@ -1867,10 +1863,8 @@ static int __init init_dmars(void)
 	return 0;
 
 free_iommu:
-	for_each_active_iommu(iommu, drhd) {
-		disable_dmar_iommu(iommu);
-		free_dmar_iommu(iommu);
-	}
+	for_each_active_iommu(iommu, drhd)
+		release_dmar_iommu(iommu);
 
 	return ret;
 }
@@ -2280,12 +2274,12 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	if (ecap_prs(iommu->ecap)) {
 		ret = intel_iommu_enable_prq(iommu);
 		if (ret)
-			goto disable_iommu;
+			goto out;
 	}
 
 	ret = dmar_set_interrupt(iommu);
 	if (ret)
-		goto disable_iommu;
+		goto out;
 
 	iommu_set_root_entry(iommu);
 	iommu_enable_translation(iommu);
@@ -2293,10 +2287,8 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	iommu_disable_protect_mem_regions(iommu);
 	return 0;
 
-disable_iommu:
-	disable_dmar_iommu(iommu);
 out:
-	free_dmar_iommu(iommu);
+	release_dmar_iommu(iommu);
 	return ret;
 }
 
@@ -2310,12 +2302,10 @@ int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert)
 	if (iommu == NULL)
 		return -EINVAL;
 
-	if (insert) {
+	if (insert)
 		ret = intel_iommu_add(dmaru);
-	} else {
-		disable_dmar_iommu(iommu);
-		free_dmar_iommu(iommu);
-	}
+	else
+		release_dmar_iommu(iommu);
 
 	return ret;
 }
-- 
2.56.0.257.gf7497c7d27-goog


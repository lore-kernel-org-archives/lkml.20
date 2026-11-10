Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283723;
	b=cMhWfKYUkL/w/2cEy5OLJG51lJ9do8vQVnBrIDZcLvDNMFjHlutcN8GospZYDL54pfRY
	 o9AJVs9/UHZWm9qjYA12LFIWVcKCvvluc2iEvy8duYiRi/XjHLgXJaVYcfvg/G8zk1V7v
	 1O7CegYgW1K+445MFKyFxR8VrNboLiXqsg/f6bABArl9PgQHR623ErcdYbIwIU5QKX0cZ
	 Q/XQ1NYApYIlYB9ay7mjzKj3VIwKG53BZ76LYk7OwROcAajSwurQjlxH0+bqJJsZMr6Ii
	 9Gk32pjvLguz2pTmmv+EAJUY/xuMDq5rRMOelXlxybrIs1RAkIh/LDwAaSP4eSUMYIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FuJECyUteBIYhk4zt7IpaezKNFcH3wE4eNPgkjkn+yw=;
	b=jrKV2UN0FpWN+/1G9LIjAG5FKCSGl0EH3qCh6NhijVKdcPi1cPnB11Zf/FbM6HQUEVzy
	 rd7ad20txuACAwdEFwxLOIwVdhk8/FDFgnx3iQavpZhr8CRcy5fCZJCiYMQwFBm6m98Mp
	 xljU+TL1717s1+oLk5CFJEbNtOrZJ2kONIJSHohxhxfqTa9sxJMDYM7OOMyFVe/ulLLqT
	 rdA1qJD12bMkF5c5mUYWjEhe1efmVoKasuaJZsckvXferwTTgVosYHMqRcCOjksHftEi7
	 iIDUpl0ZsqxW7818BRkUsAG1kYU8lqrHCHKmE3Er5O25mFg4LzSgX+VB5zgkz0sutAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bPuTVKkb;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AAF60A6F47
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AAF60A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bPuTVKkb
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so1339337a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794283722; x=1794888522; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuJECyUteBIYhk4zt7IpaezKNFcH3wE4eNPgkjkn+yw=;
        b=bPuTVKkbZYnpKl3IShg+yxB1pZv+Kt4aaW8st+LyEzRAbsGZMfb51PKmVr19+xj/2h
         P048pgJraK6Z0yEuCBdIkEq6AiEnCNhf/8gTS4a8WQaVSyP6hCOEVuFYVakRwoH5mWgC
         exCs2jTP55AyYdHrg7qY0mpYosQqDXzWdGQ8U+IcpRnuHBeMa5W93H09XTZAQSVMSxAg
         Y0kn63i2T7fILuEcWiYCNtDlIMzsBAWesfj1gxih+9Y/9W2KrILAIHNMmX7Nvwd5kxiw
         ersOuXHOaRqQsU9GEl9NDpuqlS8uaInI4bz3ZII7HdGPANQ5nh9bCFesc7tziU5XIOdY
         6t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283722; x=1794888522;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuJECyUteBIYhk4zt7IpaezKNFcH3wE4eNPgkjkn+yw=;
        b=a0ttWM5rTbUHRPPUZRsKHdnSu/YICX2lbTBXkN9Rfyn7STTiRiKgWIQSEUIcM0TGas
         q8yTqBiUJn4IcHQv3aRDsJjCT3rlzt5e3bKtIiKxzPX9psICIUEDaKKqBWNLcr7vUz/b
         YvPyk3/rp2BG2/cpKCHWOHLVwBuLIROpfBmu+CKLlfoYEQ+HQPdr6SXR0Hpnq4uLfsTS
         UJRGza5h5xPUegtQTVk9UAGRPjuuCrUvOgSZwBUlxlIc/zcFByn70fe978e9lAaaCphU
         ZcuJt4tdjf9iuXt0ZG0J4P4WlofQFwvwPuO9v2QVNg2kxpniO+UGxDGF5QtQ5ez3U/Di
         /WrQ==
X-Forwarded-Encrypted: i=1; AL+hErHD47vuIRyX3iUPcg5W7ZOphnDzj3SKd18EZ7O8eNgkWyFdAhv6SEtHxbmbOJeatWAe6zRKu1SDFG8Ah58=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mEYZT+776a78hy6cBIBABF6z/IctBQowqwJ6viMQbB4oH+4bv
	V3JOT6zcG5gaTCJN7YUMJRnyFUHdzRie71UblooAB5doOtBY891W+Yu9I5ydeQNL/ODuC1eHdRg
	71z/K3H+XVzmSNw==
X-Received: from pgmn6.prod.google.com ([2002:a63:5c46:0:b0:cdb:91f4:387b])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3b46:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-3f18c1166aemr1076569637.9.1794283721794;
 Mon, 09 Nov 2026 20:08:41 -0800 (PST)
Date: Tue, 10 Nov 2026 04:08:15 +0000
In-Reply-To: <20261110040828.1774343-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110040828.1774343-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110040828.1774343-10-skhawaja@google.com>
Subject: [PATCH v7 09/18] iommu/vt-d: Combine disable_dmar_iommu() and free_dmar_iommu()
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d31d2d5845e6..6c86c155d12b 100644
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
2.56.0.506.g506a7eabc5-goog


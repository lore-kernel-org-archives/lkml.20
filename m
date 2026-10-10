Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3551A9FBD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791592337; cv=none; b=Dnt6ykDlwLpx4hMM1aN5M7XRhHo/Y7wUyz0Wvsr0KMBl2aCO5Z6tItRWM2gXgQJfYK+DkdaHGfzdhomiGprinw7XUyfrsbVfOeRvQjIdPmPMTZcoaxs3wW1Yb9NLEK5j63Wmx9Bl30em7/Zgc4e1n3uOZfTNAMtZIM3OeCyXZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791592337; c=relaxed/simple;
	bh=rLN07pz0rtY/oxuE8PRzQO2e3Vx3LYf6PYVP/TJDLhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKaYew+YlM0haYxsPXFo/o9+xGfIIpK9ChYiYA8XErIxMBL9/Y6sgeuw7VXGdnOJqCZ4iKzHGMdndQ3k6CimRgj8xDLreVGC78eBgHLtd557r3PuISCHZdNkwPC68P+SdRxXY4FjO+h2xotob9KITgis1DupR0qhdWFDwO9gGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4HRspFm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4HRspFm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8623790f8so8125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791592335; x=1792197135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fLJ4uPA87yinr/HUVknlQRSO0lj0b1fzR0OSyBQQLU=;
        b=d4HRspFmx6IwT50XhG4xI5LjUU1DIW6prhwLeCRECaso346u/RwreN4XelpEcQZz5a
         iOJV4gqTkRAvzATeuAtrWMYmb+v9fJfci23ayNLvvCFAWQrNnxMmb1Zc7ma657X3MLcS
         gb61IVQ83qUNGNiNhDaPjKbMU8XyDHsTmlEvXXKavGpiiTBgVh9C50dfiBzZZ2Dn1wfP
         LwW3axlMIyAVFgFsdLeDyOXvNbtUK0Yh3hSlSV80rQD2wXeeEPJ0r9eHy2uv9CJs3Z8f
         C4NdAjuCxoNLPGxAFqv6U3GO1h4ZJVPm/hUM/FfPDa7DceilMcWks4xsbiRSr0tXluYC
         zrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791592335; x=1792197135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fLJ4uPA87yinr/HUVknlQRSO0lj0b1fzR0OSyBQQLU=;
        b=ec4UmKNfT2ok2CwxnilqVcTx05c390Vq7yIp277AiQw+hecl3fgZMfy6XT7KGYAHnL
         tSitV0oqJbCAaIMS0MQHlvcunOY5qe7PtKJ/Xan2Snifw4CxzdE51nv/iR4hOXaNUiRM
         yzeRq1dOzUakWm51wg59SFGooQ1Dvns8iF9o2cMbGcues3pPTcRrtpbkcuD+0xxOA6pm
         lvhy+wlfRkLJaubIgyJ9qe9a+nP0tOG/IUp4/brP+4mBoAWRyMnGMIgOPtoOK6m8g7Bw
         Y+Y+lsZhP096Z2HvRzB9wK75EJBAicpqPkNHOWVORlKwGmrk6QRevP/9lajMPsXRKOtx
         xKkw==
X-Forwarded-Encrypted: i=1; AKwUvBxc8e3pgWnI4RIqejLXBwCJ1ynWwmlsEgdniVc4eUaPo5f9eICCoP0Rxis7mq2CSM5DQ3VtQBZZY6kHghM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIATV7SOpu1oiDQC2aRnSSR3z1DzBvcCbXfzOpJLTbraldChDFC
	1uJt52n4Uhm+iIweVUCMsbADVqeZ9/J+fgpAZUeGwqM3Vc3mwZ6uDJQLDNnbrg8hKQ==
X-Gm-Gg: AYBFou0pteV3R5i3jODGIFAp6d1hfaK3U5GfSoC2/j28h4bXtNzyCuxuvah4AeVViAy
	j63Xj2oOPvtiggS5SQNhqxjnk0RFYL/uTauJHGMIt6fopEgHZdOj3NM18x8MqAET7wimZMTCDJf
	CV09OGm28xwSphbfseE8G8Y0J02eQFq1Kk2BkTycHH84uC+Z34Ysk1LcjIsONwQFkuqqc3vHSIV
	SMGQ0f2OpnQt15tvEHrAxzAruHu/n6YLm3KnfoUvqUQKdYeA8DkcPRj4MgAJxP/tC/0L+HbFlew
	Y10KpdLyxuoDcs378YW9nT6OZ5Xq/VGtILEPOiQuucwHhk+FOlXn4VGYJc3JcDZGxIOxoN7wg/m
	nO2y+GHv3zqSNvBhyKwVUU4eQPfp6JAs0dzZo/ZdcJuP6ACT/CAXCiZqD/Dg2PkPgNjFqpy6TKz
	rXLfHn80xECWNV/PGHR27XkoN9qn9+Ekp4gEv9Clc1UKjywg2nQa+Dmt4WioqqSYTOLDS9XIEgl
	S9uRmQgw0j1GhLN9QYJ4dbPtqBu5yluxO7eLSt1k5jhUL/+uN31AhakdLiX5CwdyJ/mPORnfgzY
	pg==
X-Received: by 2002:a17:903:2341:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e87e33677emr233045ad.15.1791592334437;
        Fri, 09 Oct 2026 17:32:14 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm3661972a91.0.2026.10.09.17.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:32:13 -0700 (PDT)
Date: Sat, 10 Oct 2026 00:32:09 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v5 08/18] iommu/vt-d: Clear unpreserved context entries
 during shutdown
Message-ID: <asmC5Ow_VYtvgGOQ@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-9-skhawaja@google.com>
 <c724012c-13e1-41de-b7e3-1fb08d9b9d8c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c724012c-13e1-41de-b7e3-1fb08d9b9d8c@linux.intel.com>

On Fri, Oct 09, 2026 at 08:43:26AM +0800, Baolu Lu wrote:
>On 9/21/26 08:48, Samiullah Khawaja wrote:
>>During normal shutdown the iommu translation is disabled. Since the root
>>table is preserved during live update, it needs to be cleaned up and the
>>context entries of the unpreserved devices and root entries for the
>>unpreserved context tables need to be cleared.
>>
>>This is required because during kexec reboot and shutdown the devices do
>>not go through the release flow, so there might be stale entries in the
>>root table and context tables. Also note that new unpreserved context
>>tables for unpreserved devices might have been added after preservation,
>>so the root table entries for unpreserved context tables also need to
>>removed.
>>
>>Signed-off-by: Samiullah Khawaja<skhawaja@google.com>
>>---
>>  drivers/iommu/intel/iommu.c      |  15 +++-
>>  drivers/iommu/intel/iommu.h      |   5 ++
>>  drivers/iommu/intel/liveupdate.c | 139 +++++++++++++++++++++++++++++++
>>  3 files changed, 157 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>>index 4bfc2f173010..474c926172c5 100644
>>--- a/drivers/iommu/intel/iommu.c
>>+++ b/drivers/iommu/intel/iommu.c
>>@@ -1852,6 +1852,14 @@ static int iommu_suspend(void *data)
>>  	iommu_flush_all();
>>+	/*
>>+	 * Note that IOMMU suspend doesn't affect live update. The state
>>+	 * preserved during live update is not released and remains valid during
>>+	 * suspend and reused during IOMMU resume.
>>+	 *
>>+	 * Also note deployment of suspend/resume and live updated use case
>>+	 * should be mostly mutually exclusive.
>>+	 */
>>  	for_each_active_iommu(iommu, drhd) {
>>  		iommu_disable_translation(iommu);
>>@@ -2397,8 +2405,11 @@ void intel_iommu_shutdown(void)
>>  		/* Disable PMRs explicitly here. */
>>  		iommu_disable_protect_mem_regions(iommu);
>>-		/* Make sure the IOMMUs are switched off */
>>-		iommu_disable_translation(iommu);
>>+		/* Make sure the IOMMUs are switched off if not preserved. */
>>+		if (iommu_preserved_state(&iommu->iommu))
>>+			clear_unpreserved_context_entries(iommu);
>>+		else
>>+			iommu_disable_translation(iommu);
>>  	}
>>  }
>>diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
>>index 785057236e7c..4feb5bd76b18 100644
>>--- a/drivers/iommu/intel/iommu.h
>>+++ b/drivers/iommu/intel/iommu.h
>>@@ -1307,6 +1307,11 @@ int intel_iommu_preserve(struct iommu_device *iommu,
>>  			 struct iommu_hw_ser *iommu_ser);
>>  void intel_iommu_unpreserve(struct iommu_device *iommu,
>>  			    struct iommu_hw_ser *iommu_ser);
>>+void clear_unpreserved_context_entries(struct intel_iommu *iommu);
>>+#else
>>+static inline void clear_unpreserved_context_entries(struct intel_iommu *iommu)
>>+{
>>+}
>>  #endif
>>  #ifdef CONFIG_INTEL_IOMMU_SVM
>>diff --git a/drivers/iommu/intel/liveupdate.c b/drivers/iommu/intel/liveupdate.c
>>index 0837bb889fed..501dc0e9cc0a 100644
>>--- a/drivers/iommu/intel/liveupdate.c
>>+++ b/drivers/iommu/intel/liveupdate.c
>>@@ -77,6 +77,145 @@ static int preserve_context_table(struct intel_iommu *iommu,
>>  	return 0;
>>  }
>>+static void clear_unpreserved_context_root_entries(struct intel_iommu *iommu,
>>+						   struct iommu_hw_ser *ser)
>>+{
>>+	struct root_entry *root;
>>+	int i;
>>+
>>+	/*
>>+	 * Individual invalidations for each context table removal are not
>>+	 * needed as we issue global invalidations later.
>>+	 */
>>+	for (i = 0; i < ROOT_ENTRY_NR; i++) {
>>+		root = &iommu->root_entry[i];
>>+
>>+		if (!is_context_table_preserved(iommu, ser, i, 0) && (root->lo & 1)) {
>>+			root->lo = 0;
>>+			__iommu_flush_cache(iommu,
>>+					    &root->lo,
>>+					    sizeof(root->lo));
>>+		}
>>+
>>+		if (!sm_supported(iommu))
>>+			continue;
>>+
>>+		if (!is_context_table_preserved(iommu, ser, i, 0x80) && (root->hi & 1)) {
>>+			root->hi = 0;
>>+			__iommu_flush_cache(iommu,
>>+					    &root->hi,
>>+					    sizeof(root->hi));
>>+		}
>>+	}
>>+}
>>+
>>+static void clear_unpreserved_context(struct device_domain_info *info, u8 bus, u8 devfn)
>>+{
>>+	struct context_entry *context;
>>+
>>+	/*
>>+	 * This cleanup is done during shutdown, so it should be fine to only
>>+	 * clear the entries here and issue one global invalidation later to
>>+	 * invalidate all cleared entries.
>>+	 *
>>+	 * Note that the device IOTLB invalidation for unpreserved devices is
>>+	 * skipped this way, but that should not be needed as the devices are
>>+	 * quiesced at this point. This should improve the performance of the
>>+	 * cleanup process and avoids any invalidation timeouts because drivers
>>+	 * might have moved devices to D3 state.
>
>I don't quite follow why device-TLB flushes could be skipped when the
>device is quiesced. Nothing guarantees that an unpreserved device that
>has ATS enabled doesn't carry stale cache entries. It may keep
>translations to memory that the next kernel reuses.

I agree with your assessment, the device-TLB might still have stale
entries. But this assumption is based on the existing kexec reboot
behaviour. That is, during normal shutdown the iommu translation is
disabled but the device-TLB invalidations are not issued either. The
unpreserved devices go through the same flow in the next kernel as they
do after a normal kexec reboot. I will update the comment to add this
detail.
>
>I would suggest at least a global device-TLB flush for ATS-enabled
>unpreserved devices, or is there anything I've overlooked?

This might be tricky as this late during shutdown some devices might
already be in a low power state, and sending them device-TLB
invalidations would cause invalidation timeouts. Even if that doesn't
happen, it will still add to the shutdown time.
>
>>+	 *
>>+	 * The iommu lock is not needed as the context tables are never removed
>>+	 * and the new ones are not added during shutdown.
>>+	 */
>>+	context = iommu_context_addr(info->iommu, bus, devfn, 0);
>>+	if (context) {
>>+		/*
>>+		 * Individual invalidations are not needed as we issue global
>>+		 * invalidations later once all the cleanups are done.
>>+		 */
>>+		context_clear_present(context);
>>+		__iommu_flush_cache(info->iommu, context, sizeof(*context));
>>+		context_clear_entry(context);
>>+		__iommu_flush_cache(info->iommu, context, sizeof(*context));
>>+	}
>>+}
>
>[-snipped-]
>
>Thanks,
>baolu
>

Thanks,
Sami

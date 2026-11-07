Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057287;
	b=aH+8RLSBIJi0bsWm/5JEkpVZ5vCByZtqQOxIsHaTEor09AOZk/oXtAaFwDxCJXoBCFO5
	 XG+8+pQlULNHM0us5iJ5KL0IOUTI8ObSCMQKBuD8cXX9/wHHQGtTNAmdzhnmx9sX2Oczf
	 rKnXF91gsJtx1ICdB+mL5qPVzOpWHl5D6QCREe9DqtIfuThrhJQyYnx9bFshFcZzhJJmV
	 KHcX6AIPx9arhE1dXnO6xmJke06StsN20caqkwDBcwraAcDsMVY3NkL5GA8sVldA/OaQ9
	 LWK/K/4d2K9vEnbT5MGogmUA85ABsxhjQeMslwhK36jMdnANArY4nl1gtnbITRIlCAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057287;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Oe5tXB2jftoFJ092Hy5Qi6HgkiNB7NYIPiHV7mzfpLQ=;
	b=u76TiU0Vhy7HhgPoOmTwbWCfQu6LnWRK1SE1KSHg5VyhE6v7+mASMLvBvTw+REjUlAox
	 82GvI/rqDJXb3IAIRMb206yT5gI5saWar1bOA1UBqLux7YjsgLoMRcho/qYyzZ2WzFnXI
	 Jw7Mla2fwoKSNKjb67TnAmwuUfLiju3Z8gk1Ngy1lRjT/fei0ehV4YVLJzVz6zaQTi9dC
	 d1VKRso5ftZd9+FdCvIJOLUcNjcJneuNivV7cbSRcCIPqj56Y3ON3lQUVLPkixrwB+Mjh
	 8aUtGgU2lxhPDZmRbsKq49MGNTBTefOHqQlsVUTcPPtgg3rBtWdCf3DGDN8GVuHlOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UNtIDXRn;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1C606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF1C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UNtIDXRn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6r+u5+/t9rmLKRKE+pLYilMAZFIRYxNtrYJN5SugYMs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794057284; v=1; x=1794662084;
 b=UNtIDXRnCqeIFejYU1k3WYN5kkpS36B6or3E06/TyDfoj7t/Vjjef07tfOLtWQO26ulMmEwS
 nMD246QwcGOBox8nnaw1x8kdDR4E2IUV9HhuRIH9giDb8A613EtF1/wNn7Qsww9B/BUIS/THcAn
 KTOb7GsEM7N1M3O3otL4zRM8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55edf2a64f55ee4f;
	Sat, 07 Nov 2026 13:14:44 +0000
X-Mizu-Trace-ID: 55edf2a64f55ee4f
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:14:34 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v7 7/7] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <au8kOjsfkFhs1ye7@fedora>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
 <20261030-smmu-shared-sid-ver7-2026-10-26-v7-7-961726ebd6ab@Example.Com>
 <aujbMKormSlNQMOm@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aujbMKormSlNQMOm@nvidia.com>

On Mon, Nov 02, 2026 at 10:49:20AM -0800, Nicolin Chen wrote:
>On Fri, Oct 30, 2026 at 08:09:39PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> With the per-domain CD table, every non-PASID sharer of a SID builds the
>> same normal-domain STE: same S1ContextPtr, S1DSS and S1CDMAX. Disable
>> stall and ATS for shared SIDs as well, so the remaining STE fields are
>> common too, and let any sharer program the STE. This also handles the
>> case where one device's driver attaches before the stream owner's driver:
>> the first attach now installs a valid STE instead of leaving the boot or
>> firmware STE in place.
>> 
>> A release or blocked attach must not abort a shared STE while other
>> sharers remain, otherwise it would break their ongoing DMA. Skip those
>> writes while the SID is shared; the last master (no longer shared) still
>> tears the STE down. This also means removing one device from a shared
>> group no longer leaves the survivors aborted.
>> 
>> Fault events on shared SIDs cannot be attributed to a specific master,
>> so arm_smmu_find_master() returns NULL when the stream's shared_masters
>> list is non-empty.
>> 
>> Disable SVA, PASID, vSMMU nesting, ATS and IOPF/stall for shared-SID
>> masters since all of them require an unambiguous SID-to-device mapping.
>> Reject sharing at insert_master() time if either master has stall enabled,
>> or if the existing master has PASID or ATS enabled.
>> 
>> Introduce arm_smmu_master_stall_enabled() to describe the policy actually
>> programmed into the hardware: a master stalls only if it asked for it and
>> its StreamID is not shared.
>
>Why do we need this? A stall_enabled master shouldn't share its
>SID in the first place.
>
>> Add arm_smmu_is_shared_sid() as an inline helper in arm-smmu-v3.h so that
>
>Use arm_smmu_master_shares_sid or arm_smmu_master_has_shared_sid.
>
>> arm-smmu-v3-sva.c and arm-smmu-v3-iommufd.c can use it without repeating
>> the list_empty() pattern.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
>Please check sashiko findings; all seems valid.
>
>https://sashiko.dev/#/patchset/20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab%40Example.Com

Yeah. I checked them every time. Seems the patchset will be bloating again.

Thanks
Peng

>
>Nicolin
>

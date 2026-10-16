Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F962FD1B3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792111517; cv=none; b=Yo4pkiIo4H3aZxuudESPQb22L4OckESy5d07tu8IVU7ZwCc0Y0DSZmgrTLc16dabwi1ZIJnyemZknw01KmYbL9195249JQBAu2H6Wilg3lnEJoWiNg+YuDVHeqabg0ubFnHg2vbf/xCdFYxqiur4HBHxnHhY/HX/VA88rarf8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792111517; c=relaxed/simple;
	bh=hhjWCjDJiUS4wOBIl2PR4tvUuVgOu2aOIBOkR3X3z/I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jRRLvZXu6y9fwvWOr9lJF7uG3vTaEQIZvVFl7w3qHpZCVuP+RiBxS3Ul86scEPQ/UmtSPhRxlMIO6ZBD7ATzdv/B4xCn9HQVYYYyMvFGv/Us4J8bevp2+39lMT01yNU0jBI6LDvq5luSxcyBZnjrAmH5RYelTSMp0XQK5MxhlIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYl1dmp9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYl1dmp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792111514; x=1823647514;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hhjWCjDJiUS4wOBIl2PR4tvUuVgOu2aOIBOkR3X3z/I=;
  b=hYl1dmp9ztbrNn9V0HqP89g1Kc5zGi83wvyzYf5vG6Pw9I0lamfxrXtj
   3TNSFyqYHVq8J3nbF+fZh+Vy/Fq/5ko5mr/nA5g9h3d0hee9VNHwr/YEM
   q0dfcS/VW5MAiZwE4HUTX+rnxGG3bwLGvYNSQgrnIF+CqNUL3m1E0nkDs
   eAuZhxLTD8dmANsfV7LW/3JPPjywjM8yPyaYbI14CKWsnwQ5OFrq0i2Td
   cIil4EFdgLftNwxNyEGE5mLxJ3iho53P0zfXVwftxVMl1LNZ9pd0evrIC
   Iz4euuKQ7brzBydqTxNvVIk5KS6D/95/ZKsEK3NWXmznkeFOaIFSYQYG1
   w==;
X-CSE-ConnectionGUID: Ggr4nyCrRcKfocT5uYUvZw==
X-CSE-MsgGUID: zhd3ufaNTjaaYxzi5i1AUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="997939"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="997939"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 17:45:13 -0700
X-CSE-ConnectionGUID: amjPhSp9S9+Na2q8ZGGn0g==
X-CSE-MsgGUID: Fk0Ps5F9Q46/zvXp/8hVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1829041"
Received: from unknown (HELO [10.238.0.90]) ([10.238.0.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 17:45:12 -0700
Message-ID: <0ba4e7ba-c412-44ca-837c-13075d745843@linux.intel.com>
Date: Fri, 16 Oct 2026 08:45:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, robin.murphy@arm.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: intel: Apply the device scope length check to
 every device scope walk
To: Shirong Zhao <shxzhaosr@163.com>, dwmw2@infradead.org, joro@8bytes.org,
 will@kernel.org
References: <20261012084102.18-1-shxzhaosr@163.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261012084102.18-1-shxzhaosr@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2026 4:41 PM, Shirong Zhao wrote:
> dmar_walk_remapping_entries() already refuses to step by a zero length:
> 
> 	next = (void *)iter + iter->length;
> 	if (iter->length == 0) {
> 		/* Avoid looping forever on bad ACPI tables */
> 		pr_debug(FW_BUG "Invalid 0-length structure\n");
> 		break;
> 	}
> 
> Five walks over the same DMAR structures do not:
> 
>    dmar_alloc_dev_scope()        - counts namespace/endpoint/bridge scopes
>    dmar_insert_dev_scope()       - attaches a scope to a PCI path
>    dmar_acpi_insert_dev_scope()  - same, by ANDD enumeration id
>    dmar_acpi_dev_scope_init()    - the ANDD entries at the end of the table
>    ir_parse_ioapic_hpet_scope()  - IOAPIC and HPET scopes
> 
> Each advances its cursor by a length read out of the DMAR table, and
> nothing constrains it.  A zero length leaves the cursor where it is and
> the walk never ends; a short one steps through table payload a byte at a
> time, reinterpreting it as scopes.  dmar_alloc_dev_scope() and
> dmar_acpi_dev_scope_init() run on every boot with the IOMMU enabled, and a
> short length in the latter hands andd->device_name to acpi_get_handle().
> 
> Use the check dmar_walk_remapping_entries() already uses.
> 
> Checked against torvalds/linux at HEAD; both files are unmodified there.
> 
> Found by EFSM.R17, which reports a loop whose cursor advances by a step
> memory can supply as zero while the exit condition depends on that cursor.
> Signed-off-by: Shirong Zhao<shxzhaosr@163.com>
> 
> ---
>   drivers/iommu/intel/dmar.c          | 16 ++++++++++++++++
>   drivers/iommu/intel/irq_remapping.c |  5 +++++
>   2 files changed, 21 insertions(+)

A zero length is never valid under the VT-d spec, so such a DMAR table
is a firmware bug.

The existing check in dmar_walk_remapping_entries() already rejects a
zero-length top-level structure before any of these walks run, and I'm
not aware of any shipping platform with a malformed device scope.

Without a real-world report, I'd rather not add more checks for this.
Thanks for looking at this, though.

Thanks,
baolu

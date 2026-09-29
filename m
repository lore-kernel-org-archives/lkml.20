Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59D6516158
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677955; cv=none; b=YkmrwNKnDSRr5nwXaHhU/Qz1IxSkWCCdwETp4DVgZKRzLhB7CpKL8RdRgE29oiMZPkNPTGaEEQQr/ZDcJMkB7u3d7FmxCZhXwIWT0jRzKEWx4spI17Bq3+lv8zgZpLpK3fLlP7VODVVvw1kV8oPe3bK1dSWnKFdaVJ2X1uXe9qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677955; c=relaxed/simple;
	bh=js9bXlbyj/eszFbywRNZ+5CWqy4ezP7Vt4mOODIudcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWQs+A1Kh+MjUrBzglBCREee+AjG/1POLRt1fkYLuA2dekOADgmnFUpwTtGZdA6FT/VtxEKUJGb/8lprViLCaDNjJ7Jm3hq1ffyCamu/jsvqKtEqNDX3AZJCSon+wOP7PddyuYAqX8SVOdsc78796P1MdsN8dhnraDlHZjplaME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xTSyx13V; arc=none smtp.client-ip=95.215.58.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xTSyx13V"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=js9bXlbyj/eszFbywRNZ+5CWqy4ezP7Vt4mOODIudcU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790677936; v=1; x=1791282736;
 b=xTSyx13VzvJZXtuiFHeHgiQvz3kFQeCUaSVrddMY3Afwc/eFB694G0aOP6qcevDGVREBZTiG
 PmD7Lqpw5rHd6IFJIfGJpyZzGoaaiT2a8+E3ULz0E2/44yPL3NdqpxRqG749Zm1i59Psir63pRI
 MhBosulhMCPR5FIG4FRtp+LY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 40555c5847d0afc2;
	Tue, 29 Sep 2026 10:32:16 +0000
X-Mizu-Trace-ID: 40555c5847d0afc2
X-Migadu-Flow: FLOW_OUT
Date: Tue, 29 Sep 2026 18:32:38 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>, tony.luck@intel.com, tglx@kernel.org,
	bp@alien8.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, fenghuay@nvidia.com, babu.moger@amd.com,
	hongyu.ning@intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 3/9] x86/resctrl: Parse ACPI ERDT table and save CACD
 cpumask for RMDD domains
Message-ID: <aruTxheNOvbT8b7d@three-body>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <16e1ac77eb48c5433f16c3a7cefcd4217a19007b.1789705667.git.yu.c.chen@intel.com>
 <60ef81bc-fa71-4bce-a6c6-6e3592617800@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60ef81bc-fa71-4bce-a6c6-6e3592617800@intel.com>

Hi Reinette,

On Mon, Sep 28, 2026 at 02:37:45PM -0700, Reinette Chatre wrote:
> 
> Hi Chenyu,
> 
> In subject, "RMDD" stands for "Resource Management Domain Description" so "RMDD domains"
> reads as "Domain Description domains". How about (another suggestion later):
> 	x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
>

OK, this is more accurate with the duplicated "domains" removed. I will change it.
 	
> On 9/17/26 9:49 PM, Chen Yu wrote:
> > There is one Enhanced RDT (ERDT) ACPI table per platform. Each Resource
> > Management Domain Description (RMDD) sub-table within it describes one resource
> > management domain (RMD), also known as an L3 domain, and carries MMIO base
> > information for monitoring support. The CPU agents within the scope of an RMDD
> > are enumerated by their x2APIC IDs in a nested CPU Agent Collection Description
> > (CACD) sub-table.
> > 
> > Parse the RMDD sub-tables within the ERDT ACPI table and their nested CACD
> > entries to construct per-domain CPU masks.
> 
> Above paragraph can be dropped since it is just duplicate of what follows.
> 

OK.

> > 
> > For each RMDD, parse the associated CACD, map its x2APIC IDs to logical CPUs,
> > and save the resulting CPU mask. Associate every ERDT domain with the CPUs that
> > belong to it to prepare for attaching ERDT data to resctrl monitoring domains.
> 
> The last sentence is the primary motivation for this patch but it feels buried at
> the end. The changelog also understates what this patch does with reader learning
> about many other changes from comments in the patch. Consider an alternative
> changelog below. Please do not just copy and paste but consider how it motivates
> (the "why") this work and how it describes the change on a high level with the
> patch providing the code details.
>

OK, will rewrite this.
 
> 
>   x86/resctrl: Parse ACPI ERDT table and build per-RMD CPU masks
> 
>   Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
>   in order to read hardware monitoring counters on the upcoming MMIO-based
>   path. The kernel discovers this hardware through a single per-platform
>   ERDT ACPI table.
> 
>   Each Resource Management Domain Description (RMDD) sub-table within the
>   ERDT table carries the MMIO base of one resource management domain (RMD) and,
>   when RMDD_FLAG_CPU_L3_DOMAIN is set, identifies the domain as a CPU-scoped
>   L3 monitoring domain. The set of CPUs in the domain is listed by x2APIC ID


Maybe remove "monitoring" since RMDD is for a CPU mask, not specific to whether
the mask is a monitor or control domain.

>   in a nested CPU Agent Collection Description (CACD) sub-table.
> 
>   Walk the ERDT table's RMDD sub-tables in preparation for attaching each
>   ERDT domain to a resctrl L3 monitoring domain. For each CPU-based L3 RMDD,
>   ioremap its control-register region, walk its nested CACD entries,
>   translate each x2APIC ID to a logical CPU, and record the result on the
>   ERDT domain's erdt_domain_info. Record the largest RMID that is valid

I think it is the minimum of the largest RMIDs exposed by each RMD.

>   on every RMDD so a later reader cannot access an RMID that is
>   unsupported on some domain, and require every RMDD to advertise the
>   same set of sub-table types so downstream code can rely on a uniform
>   shape.
> 
> > 
> > Based on original work from Anil S Keshavamurthy.
> 
> This sounds like "Originally-by:" tag per Documentation/process/maintainer-tip.rst ?
>

OK, will add this tag.
 
> > 
> > Suggested-by: Tony Luck <tony.luck@intel.com>
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
> >  arch/x86/kernel/cpu/resctrl/core.c     |  16 +-
> >  arch/x86/kernel/cpu/resctrl/erdt.c     | 265 +++++++++++++++++++++++++
> >  arch/x86/kernel/cpu/resctrl/internal.h |  29 +++
> >  4 files changed, 309 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c
> > 
> > diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
> > index 273ddfa30836..2216ee084832 100644
> > --- a/arch/x86/kernel/cpu/resctrl/Makefile
> > +++ b/arch/x86/kernel/cpu/resctrl/Makefile
> > @@ -2,6 +2,7 @@
> >  obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
> >  obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
> >  obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
> > +obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o
> 
> Please keep the CONFIG_X86_CPU_RESCTRL entries grouped together.
>

OK, will do.
 
> >  obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
> >  
> >  # To allow define_trace.h's recursive include:
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index 55214d6fdc49..54cfdf12dfbb 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -1016,10 +1016,17 @@ static __init void check_quirks(void)
> >  
> >  static __init bool get_rdt_resources(void)
> >  {
> > +	bool succeed;
> 
> Please use "ret" to match style of get_rdt_alloc_resources() and 
> get_rdt_mon_resources().
>

OK, will rename it.
 
> > +
> > +	erdt_init();
> 
> Why does erdt_init() have a return value when it is deliberately ignored?
>

Let me remove its return value and define erdt_init() as void.
 
> >  __exitcall(resctrl_arch_exit);
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > new file mode 100644
> > index 000000000000..0dfe5eda166c
> > --- /dev/null
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -0,0 +1,265 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Enhanced Resource Director Technology (ERDT)
> > + *
> > + * Copyright (C) 2026 Intel Corporation
> > + *
> > + */
> > +
> > +#define pr_fmt(fmt)     "resctrl: " fmt
> 
> The pr_... messages inconsistently also add "ERDT:" prefix. Would adding "ERDT:"
> prefix here help?
>

Yes, this will remove duplicated string in each pr_...
 
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/overflow.h>
> > +#include <linux/resctrl.h>
> > +#include <linux/sizes.h>
> > +
> > +#include <asm/apic.h>
> > +
> > +#include "internal.h"
> > +
> > +static LIST_HEAD(domain_info_list);
> > +
> > +/* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
> > +static bool erdt_enabled;
> > +
> > +#define ERDT_VALID_VERSION		1
> 
> How is "version" different from "revision", which is term used for variable this
> is compared against as well as debug message?
>

Let me rename it to ERDT_VALID_REVISION.
 
> > +#define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
> > +
> > +/* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> > +static u32 valid_subtbl_mask;
> > +
> > +/* Domain ID of the first RMDD that established @valid_subtbl_mask, for diagnostics. */
> > +static u16 first_rmdd_domain_id;
> > +
> > +/*
> > + * The minimal max-rmid of different domains. Using minimal is to avoid the domain with
> 
> If "max-rmid" is intended to refer to the struct member then it should
> be grep friendly "max_rmid".
>

OK, will do.
 
> > + * small rmid accessing an invalid rmid.
> 
> Please use upper case for acronyms.
>

OK, will do.
 
> > + */
> > +static unsigned int erdt_max_rmid;
> > +
> > +unsigned int erdt_get_max_rmid(void)
> > +{
> > +	return erdt_max_rmid;
> > +}
> > +
> > +static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
> > +{
> > +	void __iomem *addr;
> > +	unsigned long size;
> > +
> > +	if (check_mul_overflow(num_pages, SZ_4K, &size))
> > +		return NULL;
> > +
> > +	addr = ioremap(base, size);
> > +	if (!addr)
> > +		pr_warn(FW_BUG "ERDT: Failed to map %s at phys addr %pa (size: %u pages)\n",
> > +			desc, &base, num_pages);
> 
> This series introduces a lot ot pr_warn() messages and it looks to me as though some of them
> could be triggered multiple times? Could you please consider all these instances and use
> appropriate variant based on how frequently it can be triggered? For example, pr_warn_once()
> when the same identical message can be triggered by user, pr_warn_ratelimited() when there
> are different scenarios needing visibility, leaving pr_warn() for when it is really a one-off
> message.
>

OK, will use pr_warn() for the logic during system bootup/initialization, and use pr_warn_once()
for erdt_cpu_valid(), which could be invoked during CPU hotplug triggered by user, and
use pr_warn_once() in erdt_l3_mon_domain_setup(), because it is identical message.
 
> > +
> > +	return addr;
> > +}
> > +
> > +static void erdt_iounmap_domain(struct erdt_domain_info *domain)
> > +{
> > +	for (int i = 0; i < ERDT_MMIO_NUM_TYPES; i++) {
> > +		if (domain->base[i]) {
> > +			iounmap(domain->base[i]);
> > +			domain->base[i] = NULL;
> > +		}
> > +	}
> > +}
> > +
> > +static void cleanup_one_domain(struct erdt_domain_info *d)
> > +{
> > +	erdt_iounmap_domain(d);
> > +	kfree(d);
> > +}
> > +
> > +/*
> > + * Save CACD information for this RMDD:
> > + * convert the X2APIC to CPU and save them in a mask.
> > + */
> > +static __init int cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
> 
> What is the use of cacd_init() making an effort to return errno values
> when caller does not use return code and all related code use bool?
> 

I was thinking of passing the error code up, but we don't need it. I'll change it
to return a bool.

> > +			    struct erdt_domain_info *domain_info)
> > +{
> > +	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
> > +	unsigned int num_ids;
> > +	int cpu;
> > +
> > +	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
> > +		pr_warn(FW_BUG "Invalid x2apicid CACD table\n");
> > +		return -EIO;
> > +	}
> > +
> > +	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
> > +
> > +	for (unsigned int i = 0; i < num_ids; i++) {
> > +		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
> > +		if (cpu < 0) {
> > +			pr_warn(FW_BUG "Unknown x2apicid 0x%x\n", cacd->X2APICIDS[i]);
> > +			return -EIO;
> 
> The Sashiko reported issue looks real to me:
> https://sashiko.dev/#/patchset/cover.1789705667.git.yu.c.chen%40intel.com?part=3
> 
> Were you able to try the example where system limits the number of processors
> via maxcpus= and see if ERDT still works?
>

Yes, this is a valid case, but maxcpus= should be replaced by nr_cpus=.
maxcpus= limits the online CPUs during bootup, and after bootup, those
offline CPUs can still be queried by topo_lookup_cpuid(). While for
nr_cpus=, those offline CPUs are not in the possible CPU mask, they can
not be online after bootup, and they can not be found by
topo_lookup_cpuid() either. If there is an inconsistency between the
possible_cpus_mask and the CPU x2APIC set exposed by CACD, all ERDTs will
be disabled. This is too strong. Let me skip this CPU if it cannot be found
in the possible CPU mask.
 
> > +		}
> > +
> > +		cpumask_set_cpu(cpu, &domain_info->cpu_mask);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
> > +{
> > +	return (void *)rmdd + sizeof(*rmdd);
> > +}
> 
> Could you please drop this function and instead open code this in parse_rmdd_table() to
> match the style of enumerate_erdt_table() that makes the parsing easier to follow?
>

OK, will adjust it.
 
> > +static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> > +{
> > +	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
> > +	struct erdt_domain_info *domain_info;
> > +	struct acpi_subtbl_hdr_16 *subtbl;
> > +	u32 subtbl_mask = 0;
> > +
> > +	if (rmdd->header.length < sizeof(*rmdd)) {
> > +		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
> > +		return false;
> > +	}
> > +
> > +	/* Quietly ignore non-CPU-based L3 domains */
> > +	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
> > +		return true;
> > +
> > +	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
> > +	if (!domain_info)
> > +		return false;
> > +
> > +	domain_info->dom_id = -1;
> 
> Is this "-1" handling contained in this ERDT file? Could it be a named constant to
> make its usage easier to find?
>

It is only used internally in erdt.c, let me define it as
#define ERDT_DOMIAN_ID_UNSET -1

> > +
> > +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> > +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
> > +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> > +		goto cleanup;
> > +
> > +	for (subtbl = rmdd_subtbl(rmdd);
> > +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> > +	     subtbl = next_subtbl(subtbl)) {
> > +		switch (subtbl->type) {
> > +		/* An RMDD table has one or more CACD sub-table(s) */
> > +		case ACPI_ERDT_TYPE_CACD:
> > +			if (cacd_init(subtbl, domain_info))
> > +				goto cleanup;
> > +
> > +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!subtbl_mask)
> > +		goto cleanup;
> > +
> > +	/*
> > +	 * Require all RMDDs to support same set of sub-tables
> > +	 */
> > +	if (!valid_subtbl_mask) {
> > +		valid_subtbl_mask = subtbl_mask;
> > +		first_rmdd_domain_id = rmdd->domain_id;
> > +	} else if (subtbl_mask != valid_subtbl_mask) {
> > +		pr_warn(FW_BUG "RMDD %u sub-table set does not match the first RMDD %u\n",
> > +			rmdd->domain_id, first_rmdd_domain_id);
> > +		goto cleanup;
> > +	}
> > +
> > +	if (!rmdd->max_rmid) {
> > +		pr_warn(FW_BUG "Unreasonable RMDD max_rmid %u\n", rmdd->max_rmid);
> 
> Is argument needed when the value can only be zero?
>

Not needed, let me remove the argument and print 0 directly.
 
> > +}
> > +
> > +int __init erdt_init(void)
> 
> Please place the storage class attribute before the return type.
>

Got it, will do.
 
> > +{
> > +	return acpi_table_parse(ACPI_SIG_ERDT, enumerate_erdt_table);
> > +}
> > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> > index e3cfa0c10e92..156206088372 100644
> > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > @@ -21,6 +21,31 @@
> >  
> >  #define RMID_VAL_UNAVAIL		BIT_ULL(62)
> >  
> > +/*
> > + * Index into erdt_domain_info::base[] for each MMIO region.
> > + * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
> > + */
> > +enum erdt_mmio_type {
> > +	ERDT_MMIO_RMDD_CREG,
> > +	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
> > +};
> > +
> > +#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
> > +
> > +/**
> > + * struct erdt_domain_info - Per-domain ERDT information
> 
> Since resctrl domains can be of different scope, could this highlight that
> it only supports L3 scope? For example, "L3 domain ERDT information"
>

OK, ERDT domain only focus on L3 scope for now, let me use "L3 domain ERDT information"
in the comment.

thanks,
Chenyu 

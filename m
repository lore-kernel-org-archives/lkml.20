Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627069;
	b=jvZ3DEBxaCSsCjf/RTb9bbzuFPHVZ+bpkDbUaorCI4iCcIfGqNW2IcctSDEIP+zi7+zn
	 KUTgaPvXYpjC3meUY1bNFjhb5N/SHhmP83ZP/TsOO7BSAdrHM/mffXoq4q3tbR8BuQy3w
	 NBhC6TNB79fQ4GVptDr3TfVj4qMl8l9GSfJpZT3YEX0ivBu9sYCS1gc+t0WQhHO5NLkQ5
	 ZSNhizUe0CKxNlLJH0xlqUxJjsjZSthZ2D+b7deXATDLk9QzuzjORopN8xBmDuuOIx4m7
	 lQZzj9Bb1G/LtioyTpnUf1xNxNHQiM/CbKhJHF5FQfybTOYV+ad5dOtoJ+qbdLK9Rnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627069;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+2WJrKfe9sQgjM82o5V/Sp96Rgj3CLGWsSuqPxubE3U=;
	b=nyltTVMCPPn6SKab1Z02f+X6DipW/UfXZzVgDY0qpppj8DyDNlcOWG3oADB7kB74EvWh
	 3/Kp2O6CQL2VOxNkLuAvv6ImgCkGtB0tfPwLjYyxISrY4jdbxtM9NOBuiOWIWY13cyMSY
	 x2AFZJXVqNCZn2WLcVhEKb33iBI9nUJtpl13ui83GOqx8LuSayNiRixrAqHkyHDZ4lqo3
	 WsVb3FZOHEXovaG9MNKSOvg7VfZ8pX6WU1o+3v4v5UlnpXLm4aFXV15bB/g8TWiVhMmvH
	 mhC9SNqJuLwkziudp068iagTm4xreJTjxsmVrya7uxAAs0oBGj4DsuG2l/pPVX9WtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJ1Aa3Lf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3981606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJ1Aa3Lf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08EB1F00A18;
	Mon,  2 Nov 2026 13:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627068;
	bh=+2WJrKfe9sQgjM82o5V/Sp96Rgj3CLGWsSuqPxubE3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jJ1Aa3LfLVLGs8MaE04hiKkYBmqVCv120Z3U82f9I47keSDlp68LsgPGncuBIq7xw
	 W140rxTifpR4FfN3Ml/AExOHm1fRtyJh6jPxcVnzuH60behM+clFgIC50Qahk3r4oD
	 NMEHpnXixUzuWmmHnZLPTcJHjKbap7a9NVfJ5zg7+nXq7DojrN5zpMrirVT47Rqysj
	 CP9Td8g7k/pNcEU9iEFHXoEfaV8aJOQ6o2ODqekwZEsPilNTxb9iRQiz2OfyVV9Hqa
	 dLpDhg5Sva+HhYwBlzQg+ON/dQqktshhUxwiLaUp/ly10L1eicMlmIFD/R+mWzjrXx
	 ldbEdEj9d+sjA==
Message-ID: <7a9e1729-96e3-46ab-86c0-f76349fc4a8c@kernel.org>
Date: Mon, 2 Nov 2026 14:44:22 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/11] soc: mediatek: dram-ecc: report an
 uncorrectable error of the previous boot
To: "santino.wang" <santino.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, light.chen@mediatek.com,
 Fred-WY.Chen@mediatek.com, arnab.layek@mediatek.com
References: <20261102092334.138759-1-santino.wang@mediatek.com>
 <20261102092334.138759-11-santino.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261102092334.138759-11-santino.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/11/2026 10:23, santino.wang wrote:
> From: Santino Wang <santino.wang@mediatek.com>
> 
> A fatal uncorrectable error makes the system panic and reset. The
> firmware preserves the error across the reset and UEFI publishes it in
> the ACPI BERT.
> 
> When the module loads, scan the BERT for such a record, log it, emit the
> standard mc_event tracepoint so tools like rasdaemon see it, count it
> in the aggregate counters, and delete the UEFI variable that holds the
> record so it is not reported again.
> 
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/dram-ecc/Kconfig         |  11 +-
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
>  .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 ++++++++++++++++++
>  .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
>  drivers/soc/mediatek/dram-ecc/core/counters.c |  20 ++
>  drivers/soc/mediatek/dram-ecc/core/counters.h |   1 +
>  drivers/soc/mediatek/dram-ecc/core/main.c     |  10 +-
>  7 files changed, 290 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
> 
> diff --git a/drivers/soc/mediatek/dram-ecc/Kconfig b/drivers/soc/mediatek/dram-ecc/Kconfig
> index c015c66635b2..bb46e00f8988 100644
> --- a/drivers/soc/mediatek/dram-ecc/Kconfig
> +++ b/drivers/soc/mediatek/dram-ecc/Kconfig
> @@ -10,7 +10,10 @@ config MTK_DRAM_ECC
>  	depends on HAVE_ARM_SMCCC && ACPI_APEI_GHES
>  	default m
>  	help
> -	  Driver for MediaTek DRAM ECC runtime error handling. It works
> -	  with the secure firmware (ATF), which owns the DRAM controller
> -	  ECC interrupts and reports each corrected or uncorrectable
> -	  error to the OS as an ACPI GHES record.
> +	  Driver for MediaTek DRAM ECC runtime error handling: BERT check
> +	  on boot for the previous boot's UCE record, GHES real-time
> +	  CE/UCE notification from ATF's dramc_ecc_fiq.c (independently
> +	  decoded from the raw ECCERR_INFO0~31/DB0~DB4 dump, mirroring
> +	  ATF's own decode), aggregate EFI-NV counters shared with UEFI
> +	  RasDxe.c, and a sysfs interface for containment policy, storm
> +	  protection, and leaky-bucket tuning (pushed to ATF via SMC).
> diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
> index 1e2764914e9c..8845eab3a67b 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/Makefile
> +++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
>  mtk_dram_ecc-y := \
>  	main.o \
>  	smc.o \
> +	bert_check.o \
>  	ghes_notifier.o \
>  	netlink.o \
>  	trace.o \
> diff --git a/drivers/soc/mediatek/dram-ecc/core/bert_check.c b/drivers/soc/mediatek/dram-ecc/core/bert_check.c
> new file mode 100644
> index 000000000000..bac866ae7198
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/bert_check.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +/*
> + * MTK DRAM ECC BERT check
> + *
> + * On module init, scan the ACPI BERT table for fatal memory error records
> + * left by the previous boot (UCE containment reset). For each fatal CPER
> + * memory error section found, emit a trace_mc_event() directly so rasdaemon
> + * receives the event via the normal ras/mc_event tracefs path - with no
> + * side effects (no EDAC counter bump, no memory_failure(), no notifier chain).
> + * Once a record is reported, the LastUceError EFI variable UEFI built the
> + * BERT from is deleted.
> + *
> + * EFI variable writes can take tens of milliseconds.
> + * The entire check runs in a workqueue so module_init returns immediately.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cper.h>
> +#include <linux/workqueue.h>
> +#include <ras/ras_event.h>
> +#include <acpi/apei.h>
> +#include <acpi/ghes.h>
> +
> +#include "bert_check.h"
> +#include "counters.h"
> +
> +static void bert_check_work_fn(struct work_struct *work);
> +static DECLARE_WORK(bert_check_work, bert_check_work_fn);
> +
> +/* CPER memory error section GUID: a5bc1114-6f64-4ede-b863-3e83ed7c83b1 */
> +static const guid_t cper_mem_guid =
> +	GUID_INIT(0xa5bc1114, 0x6f64, 0x4ede,
> +		  0xb8, 0x63, 0x3e, 0x83, 0xed, 0x7c, 0x83, 0xb1);
> +
> +/* MTK DRAM ECC BERT vendor section: b2c3d4e5-f6a7-48b9-c0d1-e2f3a4b5c6d7 */
> +static const guid_t mtk_dram_ecc_bert_guid =
> +	GUID_INIT(0xb2c3d4e5, 0xf6a7, 0x48b9,
> +		  0xc0, 0xd1, 0xe2, 0xf3, 0xa4, 0xb5, 0xc6, 0xd7);
> +
> +struct mtk_dram_ecc_bert_section {
> +	u32 uce_detected;
> +	u32 channel;
> +	u32 subchannel;
> +	u32 info_low;
> +	u32 info_high;
> +	u32 db0;
> +	u32 db1;
> +	u32 db2;
> +	u32 db3;
> +	u32 db4;
> +	u32 uce_recorded;
> +	u32 from_inline_ecc;
> +	u32 from_ondie_ecc;
> +};
> +
> +/* Returns 1 if this section was a matching DRAM ECC record (emitted an
> + * mc_event), 0 otherwise - so the caller can summarize the scan.
> + */
> +static int mtk_bert_handle_section(struct acpi_hest_generic_data *gdata,
> +				   const struct mtk_dram_ecc_bert_section *vendor)
> +{
> +	struct cper_sec_mem_err *mem;
> +	guid_t *sec_type;
> +	u32 sec_sev;
> +	unsigned long pfn = 0;
> +
> +	sec_type = (guid_t *)gdata->section_type;
> +	if (!guid_equal(sec_type, &cper_mem_guid))
> +		return 0;
> +
> +	sec_sev = gdata->error_severity;
> +	if (sec_sev != CPER_SEV_FATAL && sec_sev != CPER_SEV_RECOVERABLE)
> +		return 0;
> +
> +	/* The MTK vendor section is length-checked; the standard one must be
> +	 * too, or a truncated section with a valid GUID reads past its end.
> +	 */
> +	if (acpi_hest_get_error_length(gdata) < sizeof(struct cper_sec_mem_err)) {
> +		pr_warn("mtk-dram-ecc: BERT memory-error section too short: %d < %zu\n",
> +			acpi_hest_get_error_length(gdata),
> +			sizeof(struct cper_sec_mem_err));
> +		return 0;
> +	}
> +
> +	mem = acpi_hest_get_payload(gdata);
> +	if (mem->validation_bits & CPER_MEM_VALID_PA)
> +		pfn = mem->physical_addr >> PAGE_SHIFT;
> +
> +	pr_info("mtk-dram-ecc: BERT UCE from previous boot (pa=0x%lx)\n",
> +		pfn << PAGE_SHIFT);
> +
> +	trace_mc_event(HW_EVENT_ERR_UNCORRECTED,
> +		       "multi-bit ECC",
> +		       "BERT UCE from previous boot",
> +		       1,       /* error_count */
> +		       0,       /* mc_index */
> +		       -1, -1, -1,
> +		       pfn,
> +		       0,       /* grain_bits */
> +		       0,       /* syndrome */
> +		       "mtk-dram-ecc");
> +
> +	/* Inline ECC detects every UCE, including an on-die one. */
> +	mtk_dram_ecc_agg_uce_inline_inc();
> +	if (vendor->from_ondie_ecc)
> +		mtk_dram_ecc_agg_uce_ondie_inc();
> +	return 1;
> +}
> +
> +static struct mtk_dram_ecc_bert_section *
> +mtk_bert_find_vendor_section(struct acpi_hest_generic_status *estatus)
> +{
> +	struct acpi_hest_generic_data *gdata;
> +	guid_t *sec_type;
> +
> +	apei_estatus_for_each_section(estatus, gdata) {
> +		sec_type = (guid_t *)gdata->section_type;
> +		if (!guid_equal(sec_type, &mtk_dram_ecc_bert_guid))
> +			continue;
> +
> +		if (acpi_hest_get_error_length(gdata) <
> +		    sizeof(struct mtk_dram_ecc_bert_section)) {
> +			pr_warn("mtk-dram-ecc: BERT vendor section does not contain UceRecorded\n");
> +			return NULL;
> +		}
> +
> +		return acpi_hest_get_payload(gdata);
> +	}
> +
> +	return NULL;
> +}
> +
> +static int mtk_bert_handle_estatus(struct acpi_hest_generic_status *estatus)
> +{
> +	struct mtk_dram_ecc_bert_section *vendor;
> +	struct acpi_hest_generic_data *gdata;
> +
> +	vendor = mtk_bert_find_vendor_section(estatus);
> +	if (!vendor || !READ_ONCE(vendor->uce_detected) ||
> +	    READ_ONCE(vendor->uce_recorded))
> +		return 0;
> +
> +	apei_estatus_for_each_section(estatus, gdata) {
> +		if (!mtk_bert_handle_section(gdata, vendor))
> +			continue;
> +
> +		WRITE_ONCE(vendor->uce_recorded, 1);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static void bert_check_work_fn(struct work_struct *work)
> +{
> +	mtk_dram_ecc_bert_check();
> +}
> +
> +void mtk_dram_ecc_bert_check_schedule(void)
> +{
> +	schedule_work(&bert_check_work);
> +}
> +
> +void mtk_dram_ecc_bert_check_cancel(void)
> +{
> +	cancel_work_sync(&bert_check_work);
> +}
> +
> +void mtk_dram_ecc_bert_check(void)
> +{
> +	struct acpi_hest_generic_status *estatus;
> +	struct acpi_table_bert *bert_tab;
> +	unsigned int region_len, remain;
> +	unsigned int fatal = 0;
> +	acpi_status status;
> +	void __iomem *region;
> +	u32 estatus_len;
> +
> +	status = acpi_get_table(ACPI_SIG_BERT, 0,
> +				(struct acpi_table_header **)&bert_tab);
> +	if (status == AE_NOT_FOUND) {
> +		pr_info("mtk-dram-ecc: BERT table not present (no previous-boot record)\n");
> +		return;
> +	}
> +	if (ACPI_FAILURE(status)) {
> +		pr_warn("mtk-dram-ecc: failed to get BERT table\n");
> +		return;
> +	}
> +
> +	region_len = bert_tab->region_length;
> +	if (region_len < sizeof(*estatus))
> +		goto put_table;
> +
> +	region = ioremap_cache(bert_tab->address, region_len);
> +	if (!region) {
> +		pr_warn("mtk-dram-ecc: failed to ioremap BERT region\n");
> +		goto put_table;
> +	}
> +
> +	estatus = (struct acpi_hest_generic_status *)region;
> +	remain = region_len;
> +
> +	while (remain >= sizeof(*estatus)) {
> +		if (estatus->raw_data_length)
> +			estatus_len = estatus->raw_data_offset +
> +				      estatus->raw_data_length;
> +		else
> +			estatus_len = sizeof(*estatus) + estatus->data_length;
> +		if (remain < estatus_len || estatus_len == 0)
> +			break;
> +
> +		if (cper_estatus_check(estatus)) {
> +			pr_warn("mtk-dram-ecc: invalid BERT estatus, stopping\n");
> +			break;
> +		}
> +
> +		fatal += mtk_bert_handle_estatus(estatus);
> +
> +		estatus = (void *)estatus + estatus_len;
> +		remain -= estatus_len;
> +	}
> +
> +	iounmap(region);
> +put_table:
> +	acpi_put_table((struct acpi_table_header *)bert_tab);
> +
> +	/*
> +	 * The BERT UCE is reported now, so drop the LastUceError variable that
> +	 * UEFI RasDxe built it from. Kept when nothing was reported, so the
> +	 * record is not lost if the BERT scan could not process it.
> +	 */
> +	if (fatal)
> +		mtk_dram_ecc_last_uce_clear();
> +
> +	pr_info("mtk-dram-ecc: BERT scan complete: %u fatal DRAM ECC record(s)\n",
> +		fatal);
> +}
> diff --git a/drivers/soc/mediatek/dram-ecc/core/bert_check.h b/drivers/soc/mediatek/dram-ecc/core/bert_check.h
> new file mode 100644
> index 000000000000..a12dd520f6b9
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/bert_check.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#ifndef _MTK_DRAM_ECC_BERT_CHECK_H_
> +#define _MTK_DRAM_ECC_BERT_CHECK_H_
> +
> +void mtk_dram_ecc_bert_check_schedule(void);
> +void mtk_dram_ecc_bert_check_cancel(void);
> +void mtk_dram_ecc_bert_check(void);
> +
> +#endif /* _MTK_DRAM_ECC_BERT_CHECK_H_ */
> diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.c b/drivers/soc/mediatek/dram-ecc/core/counters.c
> index 8e3fd83cf60a..b3c207190855 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/counters.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/counters.c
> @@ -36,6 +36,8 @@ static efi_guid_t mtk_ecc_efi_guid =
>  static efi_char16_t mtk_ce_var_name[]  = L"MtkDramEccCeCount";
>  static efi_char16_t mtk_uce_inline_var_name[] = L"MtkDramEccUceCount_inline";
>  static efi_char16_t mtk_uce_ondie_var_name[]  = L"MtkDramEccUceCount_ondie";
> +/* Written by UEFI RasDxe for the UCE that the BERT carries; same GUID. */
> +static efi_char16_t mtk_last_uce_var_name[] = L"LastUceError";
>  
>  static struct kobject *counters_kobj;
>  static struct kobject *retired_kobj;
> @@ -110,6 +112,24 @@ static void counters_flush_work_fn(struct work_struct *work)
>  		efi_counter_inc(mtk_uce_ondie_var_name, uce_ondie_delta);
>  }
>  
> +/*
> + * UEFI keeps LastUceError until the kernel has processed it, so the UCE is
> + * rebuilt into the BERT on every boot until then. Delete it once the BERT
> + * record has been reported. A zero DataSize deletes the variable.
> + */
> +void mtk_dram_ecc_last_uce_clear(void)
> +{
> +	efi_status_t status;
> +
> +	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
> +		return;
> +
> +	status = efi.set_variable(mtk_last_uce_var_name, &mtk_ecc_efi_guid,
> +				  MTK_ECC_EFI_ATTR, 0, NULL);
> +	if (status != EFI_SUCCESS && status != EFI_NOT_FOUND)
> +		pr_warn("mtk-dram-ecc: delete LastUceError failed: 0x%lx\n", status);
> +}
> +
>  void mtk_dram_ecc_agg_ce_inc(void)
>  {
>  	atomic_inc(&pending_ce_inc);
> diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.h b/drivers/soc/mediatek/dram-ecc/core/counters.h
> index af2e5ea16b90..a818ff398769 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/counters.h
> +++ b/drivers/soc/mediatek/dram-ecc/core/counters.h
> @@ -19,6 +19,7 @@ void mtk_dram_ecc_counters_exit(void);
>  void mtk_dram_ecc_agg_ce_inc(void);
>  void mtk_dram_ecc_agg_uce_inline_inc(void);
>  void mtk_dram_ecc_agg_uce_ondie_inc(void);
> +void mtk_dram_ecc_last_uce_clear(void);
>  void mtk_dram_ecc_record_retired_page(unsigned long pfn,
>  				      enum mtk_dram_ecc_retire_reason reason,
>  				      int memory_failure_ret);
> diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
> index 320631b3a044..0c3bc4d6ef06 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/main.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/main.c
> @@ -12,6 +12,7 @@
>  #include "addresses.h"
>  #include "netlink.h"
>  #include "trace.h"
> +#include "bert_check.h"
>  
>  static struct class *mtk_dram_ecc_class;
>  static struct device *mtk_dram_ecc_dev;
> @@ -63,8 +64,14 @@ static int __init mtk_dram_ecc_init(void)
>  	if (ret)
>  		goto err_addresses;
>  
> +	mtk_dram_ecc_bert_check_schedule();
> +
>  	trace_mtk_dram_ecc_lifecycle(0);
> -	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered)\n");
> +	/* Log the initialization independently of the tracepoints, so the log
> +	 * shows that the module is up, the GHES vendor notifier is registered

What is GHES vendor?

> +	 * and the BERT scan is scheduled.
> +	 */
> +	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered, BERT scan scheduled)\n");

Drop. Why would you driver print always message on every other
non-mediatek machine?


Krzysztof

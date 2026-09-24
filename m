Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3D254AFF;
	Thu, 24 Sep 2026 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213776; cv=none; b=mizoXWXSPjbq34gsERijeDMb7ZIo+agLAeaULTX/ckEFdNnvL2KnSOltFhPMTE8F9lZGHzxbFlrDircHF+dGCbT+Po86XMCNTK3SMMaBZfAdS/uASCKH6HkYLqqNCwRobRt7K8FF+QRJ1Mn8krXTlvVuV/ZKm+NqRW1wBanNxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213776; c=relaxed/simple;
	bh=FCnIlVq5qr3yvSzyRsVrSYZy72DrdOZgU3XSMOIkfcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTdz9km4XEX2H4T5jUMqQAXH5k1mgYvIUVexBCwu0y7h6tJpDmvuuFFyFPc6p9bejsJmD9rcyKNzDhwt52YKuRvsXI6xjjg4L+NCqY1mQ/v0rAUiFkkOboqORg4ZtxSUY9lt3mOYQeEQIvOruNmELbt7G0iLkWCP41kC1txA1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xd6gZ8Np; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xd6gZ8Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790213743;
	bh=8lg/8NVROPsLq9SQUlJ7Qza84oerPlZNSR9NZZFHW34=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xd6gZ8Np1gtwVkyipHb2p4kSKo9G+zbnXZFqhy5jVrmCUHgCIdihp9GoObVMQYnQk
	 fwpFgzx09SvYlX3CvH6i25dFMiCb5K+6RHwwV7VlPcEvQOq+y2QWLX+TJa72WfJ/Pr
	 hb8Kq7sUx8TJv5EcxSpDtKHCfA49HzdDFciY1ppA=
X-QQ-mid: esmtpsz11t1790213741t52c099bd
X-QQ-Originating-IP: /X6ez5xp1h+VSUPPiZ6rSEEGIxEJbjPMe4Up9dUSlbg=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:35:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8236474117218957168
Message-ID: <F0C528282F529674+89fb7412-4858-47c3-b344-c53986aaef10@linux.spacemit.com>
Date: Thu, 24 Sep 2026 09:35:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/14] gtrace: Add perf driver for tracing using perf
 tool
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MusMsqF/YqAwpCEh5N12MTEptfW9q2LCEuBye8W2TBeBUEOpAR2AvBGt
	RMH49CJGOZzEHVj1wrl74ttbS7NBmUV13eNipBJJDohfnEdlyrrbK7pNhhfXW3CVncmgOPQ
	yhEAcKMLRmofNWrcFZjvo+wG4TENNBrpXiqljYn+Y49DMNltGWIsp1IjC4kTqrJCnmVeMqE
	DRQrIAT43oAXKtmdixKXeOq25W5hKicnL9W7Egy6M2xUZ7AtARAJMYr1PWD+gdBeFCtEHNu
	K+GEP71OGhHyPohajxMta6IhKE8jxeVN1/JwdY459HmcHPRpUATlpUXufoYT6PDh0u2Q7Rw
	y6yj8jZ8Frg/nFjGjXQrQWgbEyzYtqnoPyI7a98zNQLH99zomunBTItpOBBqJRIysPwYdvy
	Ds+me7LWbGM/TnQ3jaTLujY3SJbPD+vjsRJarpy5QAQ5VO0mjz9u+nb/X07UPb4DMM/HKQ5
	rKN8RKrZ8MieHeKOehZAwVO6Hnb8dRJNc7zDtelFsmWuxayYC5DF3JQ5RWR1zBC0X5QoyxU
	wCCKhrFDyA69Vf4fMGqBizDWPJOQxkrLacgTLHOh9n5Uquc1UeHhMrLqKziX+b83C3KIgfN
	PT9+DDIkBkO39xGukNcSqOOOelJwPecUZrAaS2y2FQSBv+8dPerTKyHEyewjjPyev5gkxEX
	TJU0+hyg9G/6xVdSzszvBm9oAt2oizGKYClN2y0h3Yh80ECi8lq9Rb2ZY+marLXFatwaUBq
	WtcTKhpN2vHigAO0lhQBd7LZw8UQLAZfkZZt9Ovb5sfcvCKPdCl9INdGeyOKNQKdWKt26A+
	r3dbrche8I1uNGvp4ysdj/xq2iKAjRxUYZy2SFOELfiu83Fe/P1z7tXd7NpcFxcUjb5tCup
	aRJOlf/8xmSijGH9FkgGgwFJ7OdgM9a1ZiHcvvacqGO55xMv531kCOwy/+3SvXTmTqFVg7k
	FNmA3g1qPwVQ6oKfg+/bUe4F5aLpfSJK67Y/iGPnc/xm89+MLXinfGkcl+1Vrwa0mBA27LI
	Au4bzSW5esbu9TU0YqqUWY/vgSpIeh4OfWGYh9suyoqv0sSGaH
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hi Mayuresh,

On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
> PTT drivers. The driver adds 'gtrace' event descriptor which can be used
> by the perf tool to record the trace data. The actual data format depends
> on type of encoder device and optionally the PMU specific trace format
> type.
>
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig       |   1 +
>  drivers/hwtracing/gtrace/Makefile      |   2 +-
>  drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
>  drivers/hwtracing/gtrace/gtrace-perf.c | 347 +++++++++++++++++++++++++
>  include/linux/gtrace.h                 |   3 +
>  5 files changed, 366 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
>
> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
> index de4a3b533591..e5b62d65e2fd 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -3,6 +3,7 @@
>  menuconfig GTRACE
>  	tristate "Generic Hardware Trace Support"
>  	depends on OF
> +	select PERF_EVENTS
>  	help
>  	  This framework provides an architecture-neutral kernel interface
>  	  for hardware trace drivers. It builds a topological view of the
> diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
> index 3e0c68d1b632..aa044fdc787b 100644
> --- a/drivers/hwtracing/gtrace/Makefile
> +++ b/drivers/hwtracing/gtrace/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_GTRACE) += gtrace.o
> -gtrace-y := gtrace-core.o
> +gtrace-y := gtrace-core.o gtrace-perf.o
>  
>  obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
> index 53a3679ba69f..102251f6a5a7 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -714,13 +714,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
>  
>  static int __init gtrace_init(void)
>  {
> +	int ret;
> +
>  	gtrace_init_type_idx();
>  
> -	return bus_register(&gtrace_bustype);
> +	ret = bus_register(&gtrace_bustype);
> +	if (ret)
> +		return ret;
> +
> +	ret = gtrace_perf_init();
> +	if (ret) {
> +		bus_unregister(&gtrace_bustype);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static void __exit gtrace_exit(void)
>  {
> +	gtrace_perf_exit();
>  	bus_unregister(&gtrace_bustype);
>  }
>  
> diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
> new file mode 100644
> index 000000000000..ed9155bbbdb7
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-perf.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/init.h>
> +#include <linux/perf_event.h>
> +#include <linux/vmalloc.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/slab.h>
> +#include <linux/stringhash.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/gtrace.h>
> +
> +#define GTRACE_PMU_NAME "gtrace"
> +static struct pmu gtrace_pmu;
> +static DEFINE_SPINLOCK(perf_buf_lock);
> +
> +/**
> + * struct gtrace_event_data - generic hardware trace perf event data
> + * @work:		Handle to free allocated memory outside IRQ context.
> + * @mask:		Hold the CPU(s) this event was set for.
> + * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
> + * @path:		An array of path, each slot for one CPU.
> + * @buf:		Aux buffer / pages allocated by perf framework.
> + */
> +struct gtrace_event_data {
> +	struct work_struct work;
> +	cpumask_t mask;
> +	cpumask_t aux_hwid_done;
> +	struct gtrace_path * __percpu *path;
> +	struct gtrace_perf_auxbuf buf;
> +};
> +
> +struct gtrace_ctxt {
> +	struct perf_output_handle handle;
> +	struct gtrace_event_data *event_data;
> +};
> +
> +static DEFINE_PER_CPU(struct gtrace_ctxt, gtrace_ctxt);
> +
> +static void *alloc_event_data(int cpu)
> +{
> +	struct gtrace_event_data *event_data;
> +	cpumask_t *mask;
> +
> +	event_data = kzalloc_obj(*event_data);
> +	if (!event_data)
> +		return NULL;
> +
> +	/* Update mask as per selected CPUs */
> +	mask = &event_data->mask;
> +	if (cpu != -1)
> +		cpumask_set_cpu(cpu, mask);
> +	else
> +		cpumask_copy(mask, cpu_present_mask);
> +
> +	event_data->path = alloc_percpu(struct gtrace_path *);
> +	return event_data;
> +}
> +
> +static void gtrace_free_aux(void *data)
> +{
> +	struct gtrace_event_data *event_data = data;
> +
> +	schedule_work(&event_data->work);
> +}
> +
> +static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
> +							int cpu)
> +{
> +	return per_cpu_ptr(data->path, cpu);
> +}
> +
> +static void free_event_data(struct work_struct *work)
> +{
> +	struct gtrace_event_data *event_data;
> +	struct gtrace_path *path;
> +	cpumask_t *mask;
> +	int cpu;
> +
> +	event_data = container_of(work, struct gtrace_event_data, work);
> +	mask = &event_data->mask;
> +	for_each_cpu(cpu, mask) {
> +		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +		gtrace_destroy_path(path);
> +	}
> +	free_percpu(event_data->path);
> +	kfree(event_data);
> +}
> +
> +static void *gtrace_setup_aux(struct perf_event *event, void **pages,
> +			       int nr_pages, bool overwrite)
> +{
> +	struct gtrace_event_data *event_data = NULL;
> +	struct page **pagelist;
> +	int cpu = event->cpu, i;
> +	cpumask_t *mask;
> +
> +	event_data = alloc_event_data(cpu);
> +	if (!event_data)
> +		return NULL;
> +
> +	INIT_WORK(&event_data->work, free_event_data);
> +	mask = &event_data->mask;
> +	/*
> +	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		struct gtrace_component *src;
> +		struct gtrace_path *path;
> +
> +		src = gtrace_cpu_source(cpu);
> +		if (!src)
> +			continue;
> +
> +		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
> +		if (!path)
> +			continue;
> +
> +		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
> +	}
> +
> +	/* If we don't have any CPUs ready for tracing, abort */
> +	cpu = cpumask_first(&event_data->mask);
> +	if (cpu >= nr_cpu_ids)
> +		goto err;
> +
> +	pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
> +	if (!pagelist)
> +		goto err;
> +
> +	for (i = 0; i < nr_pages; i++)
> +		pagelist[i] = virt_to_page(pages[i]);
> +
> +	event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
> +	if (!event_data->buf.base) {
> +		kfree(pagelist);
> +		goto err;
> +	}
> +
> +	event_data->buf.nr_pages = nr_pages;
> +	event_data->buf.length = nr_pages * PAGE_SIZE;
> +	event_data->buf.pos = 0;
> +	return event_data;
> +err:
> +	gtrace_free_aux(event_data);
> +	return NULL;
> +}
> +
> +static void gtrace_event_read(struct perf_event *event)
> +{
> +}
> +
> +static void gtrace_event_destroy(struct perf_event *event)
> +{
> +}
> +
> +static int gtrace_event_init(struct perf_event *event)
> +{
> +	if (event->attr.type != gtrace_pmu.type)
> +		return -EINVAL;
> +
> +	event->destroy = gtrace_event_destroy;
> +	return 0;
> +}
> +
> +static void gtrace_event_start(struct perf_event *event, int flags)
> +{
> +	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct gtrace_event_data *event_data;
> +	int cpu = smp_processor_id();
> +	struct gtrace_path *path;
> +
> +	if (WARN_ON(ctxt->event_data))
> +		goto fail;
> +
> +	/*
> +	 * Deal with the ring buffer API and get a handle on the
> +	 * session's information.
> +	 */
> +	event_data = perf_aux_output_begin(handle, event);
> +	if (!event_data)
> +		goto fail;
> +
> +	if (!cpumask_test_cpu(cpu, &event_data->mask))
> +		goto out;
> +
> +	event_data->buf.pos = handle->head % event_data->buf.length;
> +	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}
> +
> +	if (gtrace_path_start(path)) {
> +		pr_err("Error. Tracing not started\n");
> +		return;
> +	}
> +
> +	/*
> +	 * output cpu / trace ID in perf record, once for the lifetime
> +	 * of the event.
> +	 */
> +	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> +		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> +		perf_report_aux_output_id(event, cpu);
> +	}
> +
> +out:
> +	/* Tell the perf core the event is alive */
> +	event->hw.state = 0;
> +	ctxt->event_data = event_data;
> +	return;
> +fail:
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static void gtrace_event_stop(struct perf_event *event, int mode)
> +{
> +	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct gtrace_event_data *event_data;
> +	int ret, cpu = smp_processor_id();
> +	struct gtrace_path *path;
> +	size_t size;
> +	u64 format;
> +
> +	if (event->hw.state == PERF_HES_STOPPED)
> +		return;
> +
> +	if (handle->event &&
> +	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
> +		return;
> +
> +	event_data = ctxt->event_data;
> +	ctxt->event_data = NULL;
> +
> +	if (WARN_ON(!event_data))
> +		return;
> +
> +	if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		perf_aux_output_end(handle, 0);
> +		return;
> +	}
> +
> +	/* stop tracing */
> +	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}
> +
> +	if (gtrace_path_stop(path)) {
> +		pr_err("Error. Tracing not stopped\n");
> +		return;
> +	}
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +		if (WARN_ON_ONCE(handle->event != event))
> +			return;
> +		spin_lock(&perf_buf_lock);
> +		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
> +		spin_unlock(&perf_buf_lock);
> +		WARN_ON_ONCE(ret);

In order to be compatible with Coresight Sink, I would like to change it like:

```

struct gtrace_component *sink = gtrace_path_sink(path);
spin_lock(&perf_buf_lock);
size = sink->copyto_auxbuf(sink, handle, &event_data->buf);
spin_unlock(&perf_buf_lock);

```

> +		if (READ_ONCE(handle->event)) {
> +			/* Tag the AUX data with the format reported by the sink. */
> +			perf_aux_output_flag(handle, format);
> +			if (size > handle->size) {
> +				size = handle->size;
> +				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +			}

This part should be moved to sink->copyto_ouxbuf() internally.

> +			perf_aux_output_end(handle, size);
> +		} else
> +			WARN_ON(size);
> +	}
> +}
> +
> +static int gtrace_event_add(struct perf_event *event, int mode)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	int ret = 0;
> +
> +	if (mode & PERF_EF_START) {
> +		gtrace_event_start(event, 0);
> +		if (hwc->state & PERF_HES_STOPPED)
> +			ret = -EINVAL;
> +	} else {
> +		hwc->state = PERF_HES_STOPPED;
> +	}
> +
> +	return ret;
> +}
> +
> +static void gtrace_event_del(struct perf_event *event, int mode)
> +{
> +	gtrace_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +PMU_FORMAT_ATTR(event, "config:0-0");
> +
> +static struct attribute *gtrace_pmu_formats_attr[] = {
> +	&format_attr_event.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group gtrace_pmu_format_group = {
> +	.name = "format",
> +	.attrs = gtrace_pmu_formats_attr,
> +};
> +
> +static const struct attribute_group *gtrace_pmu_attr_groups[] = {
> +	&gtrace_pmu_format_group,
> +	NULL,
> +};
> +
> +int __init gtrace_perf_init(void)
> +{
> +	gtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
> +	gtrace_pmu.attr_groups		= gtrace_pmu_attr_groups;
> +	gtrace_pmu.task_ctx_nr		= perf_sw_context;
> +	gtrace_pmu.read		= gtrace_event_read;
> +	gtrace_pmu.event_init		= gtrace_event_init;
> +	gtrace_pmu.setup_aux		= gtrace_setup_aux;
> +	gtrace_pmu.free_aux		= gtrace_free_aux;
> +	gtrace_pmu.start		= gtrace_event_start;
> +	gtrace_pmu.stop		= gtrace_event_stop;
> +	gtrace_pmu.add			= gtrace_event_add;
> +	gtrace_pmu.del			= gtrace_event_del;
> +	gtrace_pmu.module		= THIS_MODULE;
> +
> +	return perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
> +}
> +
> +void __exit gtrace_perf_exit(void)
> +{
> +	perf_pmu_unregister(&gtrace_pmu);
> +}
> diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> index bc82814e2738..439e2f091d4d 100644
> --- a/include/linux/gtrace.h
> +++ b/include/linux/gtrace.h
> @@ -317,4 +317,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
>  		driver_unregister(&gtdrv->driver);
>  }
>  
> +int gtrace_perf_init(void);
> +void gtrace_perf_exit(void);
> +
>  #endif /* __LINUX_GTRACE_H__ */

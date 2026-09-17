Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629154AAC46;
	Thu, 17 Sep 2026 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637414; cv=none; b=szP8UBqoQgomhQhcrKmpiMNizBEFNOj75os94028PBpF7vWe9t2TncBmOyo8mi9ac/vvWoHV2zXW2vxj/KgEKDLEjx99fPEmNqxSrBxgpSvyynzJxL+3SSEVVMXPYdmnOadVyNvdypqZaJWHtxJ171ItoboGL0hZMW+7x/fv3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637414; c=relaxed/simple;
	bh=wmqQKBrHdUJwjDL+VYRkGeFHQFxO/tU/C6grS/MeU48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBv97h1FE5kWdnYl1SS3jOGWBTFCXHT/gVfY+LZpeHbrkYyYYeonYEeGpBOnbito5v62vdynqcfENb9cVv9uDdmNIXMztSgNvG6DdZM4YjZRLt8C0cNrUC4FQ0lpWQQcb1ae6PKKVXyyimI7CWvbI1b/6hsknOqz7oiUD3pp784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=y8FnOiY2; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="y8FnOiY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789637355;
	bh=kh9FyDnReQmtz6IMuEQBtcbP+r397Btkd/rmaYc+gLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=y8FnOiY2RBpzY37JE5y9OgzVnxfAybp55r0tO+PHwFleJucQF+f1DWvdS3Ow2HRy9
	 A+Q5sClgfQmo4rViePByOdHzPltih/JyBoPs+2N1ci1sLLL5VGtEhQOZ/Pa68zt8dB
	 Zke3NjQDB0IdKK63NjVpLrQREAzjUpnBgR+Xa7AM=
X-QQ-mid: zesmtpgz5t1789637353tb8e1e7ef
X-QQ-Originating-IP: C98l85GMVeVm74OzyvqEngGdoJc+3+/o61Zp27O1UR4=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Sep 2026 17:29:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16510952149240529869
Message-ID: <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
Date: Thu, 17 Sep 2026 17:29:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX
 buffer
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M7SN0LSU40tUJ2gKkD7ZcfK2Pbm+XSPpWIIIZnp3fWXvPGlLZbsK9IPb
	jt6fW3eU7YfW8vg3W5BMeTrKHC0MuPN5EYR7jfjoUihxNQBHZf0dEBVlq6Sv/sUsWRgzbpV
	IvKUbSftPw07P84CNrJP+c7BOe6ijILNNd9Nn4nlabSsVV9NETdY9goR6Z7PRqQjrqzDpIb
	JX8HGSuME7f7ld/ED2Nelon0iNs9zkWZI1wZPFeJIDQEn0My3qv0GzRfA1dHdT4f7qBgAee
	eDmttcIziCKP67ZIEdXvRMjU2WjWpm+P+nQya5qwumQMme9hdl1b9VBxiNUVTJFrSrDFHvI
	CuYRcgjAHVDEwOVdt3job0y8PYOZGh7s8iByIz7ZnIliesgndrSJRSlZ5GgEhSHuxed4ZyL
	XE77DBU9unxcatusVnMpbwhgGCwgCU0vCGfX6VKrKq3hZLUoTjqYSH2Lk4sIDihkTRW8Ojo
	yf5FnowVDhAZXLQxws5lhFrMVXPlp97wL8/aDml01XPofHgwqyo55JySFMGI4bgPT40w6fL
	QfVv3Z9VIkFUueBUQUcocxgjHTEiS2nEJZdTW6aqsxX1tN0tKiyKJpxJhJWpU7K5n/62dm8
	JTsq98AULHDmfdKyhB/39EL0d6SrDa3E7YR0F8tLZBhmAg+vpdffK7Hns5AUL2qSU4VCIHf
	ZgAKhgFX2TGyWQ2tZcbQpyDEqj9NCUxg66j6g6J/FpFMsNrWk+zbkkaldx0RSpnF0x9GLZW
	VGMn7UnfqaUC3dkEPvAr2MAGhLPC6B9h1w+Eiab2DRLrqpD7V7wTCzHI/K1Ew6wL9cS5CGE
	zd6U1u1vZczI3gshEMcXQfqa2A+Xq8UinclPObTASd97spM5fJSPRLDlufHf0ICz/xU8ODh
	6yZu02fxUI7qAwP7eJ34EAsfZFTuHKKUH1jBtfckbuPUtn6Z/5CM36YPLp9rpQt0/VMauni
	kFfFBfxvnAedbGS8hh306jcsTi6yefy8mACTuChqKnN922U8gzjYsXVUYIqBjWtOUZPE5KE
	4uRSTekA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:

> From: Anup Patel <anup.patel@oss.qualcomm.com>
>
> The RISC-V trace ramsink will need a mechanism to copy trace data
> into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
> and corresponding trace driver callback copyto_auxbuf() for this
> purpose.
>
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/gtrace-core.c | 22 ++++++++++++++++++++++
>  include/linux/gtrace.h                 | 24 ++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
> index 6ff1b3087947..53a3679ba69f 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_path_stop);
>  
> +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> +			      struct gtrace_perf_auxbuf *buf,
> +			      size_t *bytes_copied, u64 *format)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		gtdrv = to_gtrace_driver(comp->dev.driver);
> +		if (!gtdrv->copyto_auxbuf)
> +			continue;
> +
> +		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);

Is it really necessary to introduce `gtrace_path_copyto_auxbuf`? The buffer copy logic should be
exclusive to the sink component.
A cleaner approach would be to delegate this directly to the sink instance:
```
struct gtrace_component *sink = gtrace_path_sink(path);
size = sink->copyto_auxbuf(sink, &event_data->buf, &format);
```

> +
>  struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
>  				       struct gtrace_component *sink,
>  				       enum gtrace_component_mode mode)
> diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> index 78e2ead3db8e..bc82814e2738 100644
> --- a/include/linux/gtrace.h
> +++ b/include/linux/gtrace.h
> @@ -257,9 +257,30 @@ void gtrace_destroy_path(struct gtrace_path *path);
>  int gtrace_path_start(struct gtrace_path *path);
>  int gtrace_path_stop(struct gtrace_path *path);
>  
> +/**
> + * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
> + * @length:   Size of the AUX buffer.
> + * @nr_pages: Number of pages of the AUX buffer.
> + * @base:     Start address of AUX buffer.
> + * @pos:      Position in the AUX buffer to commit traced data.
> + */
> +struct gtrace_perf_auxbuf {
> +	size_t length;
> +	int nr_pages;
> +	void *base;
> +	long pos;
> +};
> +
> +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> +			      struct gtrace_perf_auxbuf *buf,
> +			      size_t *bytes_copied, u64 *format);
> +
>  /**
>   * struct gtrace_driver - Representation of a trace driver.
>   * @id_table:      Table to match components handled by the driver.
> + * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
> + *                 reports the PMU specific trace format of the copied data
> + *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
>   * @start:         Callback to start tracing.
>   * @stop:          Callback to stop tracing.
>   * @probe:         Driver probe() function.
> @@ -270,6 +291,9 @@ int gtrace_path_stop(struct gtrace_path *path);
>   */
>  struct gtrace_driver {
>  	const struct gtrace_component_id *id_table;
> +	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
> +						 struct gtrace_perf_auxbuf *buf,
> +						 u64 *format);
>  	int			(*start)(struct gtrace_component *comp);
>  	int			(*stop)(struct gtrace_component *comp);
>  	int			(*probe)(struct gtrace_component *comp);

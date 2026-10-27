Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076859;
	b=4FByJMxGv+T59wHFb3BA5Fv+7/G1vJQVJsbL9lj+srmEDCDAaHP/6f+qOt+JTI6lgNqP
	 ZCA3CPCVR5qwxe2Aqrz6EA5aCs3uoEoNP5TqEQpF31MjP9hBtA8j3YO1uYgXew8SSMYBt
	 lLS5+HSE3LIYO/Af+bzTABQGckcl4P0+Q3iKLEWhTIz9g06AdMPL5BVk7+q77DbLBzqx3
	 PaPjRSk0OydwjwxOTo2061O/T++aXvhoRrLKhClr7tvYpridAT/1HOrgTgfMRdlKvrLCK
	 5mxLpyw4eGyET5YizbPuzbJV2FdlHErAVPllrwIWOYWY3g+WnapAtrurn8BMpoR/V5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
	b=0t77OQ9ixP62G9mOBtqZEPtKBemeEd0rP00dMoLdh2GilIZdqQNyu2rj8SKEjAqpzhH8
	 iyIYCDhwtINvZ3e3efQ/IdMoly4HQTLCFuAPFhxcquE/tgDceElJJ5V7ENVZF2we9LJYP
	 Qt6sK1rUvu2TJDC3R7/kZKgbUN90/mLqCS+CLMwrvCKuJhR8+ktAAhPsNRk87Wd0e2x82
	 tZ4f/UvFHLD1twvjUOnZne4X3oRxmjKbfbz2Ml0GPPAAvI3JTs6sNItfwJI79fMH2l7gu
	 iXQ3x+HY+T1zqr1qgjZBIWuDzDT/eTRSkNRnWl/mvu6lCbzOdb1keWyufqa+ZwXKLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Lp21g8nS;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110DC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Lp21g8nS
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1846bc43c28so4196108c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793076858; x=1793681658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=Lp21g8nSCK7QvosLUNREqcWC3uyos4X3oHoczIC1sB36odhuo9n4pCe8YPnmB5icK4
         tsEIkkkfyEBwv5PM3ac/hWzz3VP529DY8lQoffxIHhOKJAqL9qGUxAMBWQHZjNvdR3ux
         ZtJdm/UwhGj7LsKso0qQeY3hEEl7BKYGYoRoxsZkFONNhAHuT+Odt4GSCJIdX3eTluFU
         x38NK/3F6EMLrUDR+VIfwbooyVxHBwTQEzQX1ainRCSz8NV3uKmcTcfSOy4aOGa+1kxB
         I7TSu4L86KZlIVfFKjfHQQsI4OaBE4hFAEtAYLCoV0ZkWr2NNAiHZV+ppCQxuoIFnoTi
         mCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076858; x=1793681658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=SM3+s9yjwSy6TRiEVhwYMS6a2mX0a7Hj/FloQyNMTLuX2DwDfpb4osGXzoc90PvKv5
         KWGhMFMW5ztxT1EQYiQD0YiyOnsVC/ycuQ7iQ9w0U9TuY0y30CP+U//vMt7G+hyp7iHh
         jVg6UsK62w8VuihiHPeBfijHWTLEFS6D2TaO4b1zXKRw/1czXZGZxxTxfHhBTBnH8jaJ
         qaW36b1MmtpuhqgR9et2SsjKKFmiWfhsun3N/kdlowu2JbZDJHv7UYB1VssJei77CEJU
         POncmCePKJQcmLkITkMoewUOjIJqM73Lx9TC2eq/GJudIaVBRhOEv6Z/+kohyMCIZJ08
         OsuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRA2MPthaSc3fME2FBbRxLp5Mb1h5NmvpQYyzxbnbibmAYqtBzTziWUgN3ho2glbRS3vx1AnpGtsFvMvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5g7VoaJazKOyMo/FrWGdgOcO9QG05o+PCwEMDIHSiTFHaqDlx
	7hQ0oQ1M28LiOUWdGD3Q/odO80jjVc6g0VG8iamOf4yBx+CzCtLXO3zvD+t3nL2Wf6U=
X-Gm-Gg: AYBFou2Jkw5vThk2lYpIleXZAQZcb8AgmBJfe4c6MAqxHutK+R2+L+llGopOjtUbSwp
	SEYYuzMjRDmvO3Q3x5CZ5Vve6zLo+oX9nsiqMb5RTV9GqKCpGLxEhpYPRsNZ+DUaaxclwm69Jyb
	/Y8iSfnQhz1FmaakYqzf3HjEaLQxuGpTBUERMbx0niwVzfnWwIjEZbB0hGhqAO4bSQJ4WmMccOx
	GDVK9IY8vp/u3RFFEO68imFJWEGq4l0itljlE/bs7r2f72a5q/YNHeCUTZp2G4dZ+5sUQbxXDKa
	58Cj2coFQwSey8W3y85SPr8N6yYiBanpfmT6q6djClXK3mHEObFvca+y81FWsxUoQbc7g7MqKuN
	7A6dwEKegiyoh/P460eEZ+r8I88LzgTkj8wX/eLv6jJ2236NgbzUdKJhWM70TscEjXEFp21TrzV
	5JTaQ9XFNH0Mpgo1VUb+D+xexcHkZOD6DiDOYBuu7GAdxEhGXMIWtLCqQv1rKJa1xqkvarytr7d
	r3I9Sy0LjO/mZ0cYRrYoClfgdVupNOYCzG3p2ODDxlX+weidk6rbHL7hiXr8fa+VOVukkiSQgmw
	JcwszOjHPGbBVJYhh2XqvjlM7otI25qYJbEJpgrwHnPx9w==
X-Received: by 2002:a05:7023:909:b0:144:eab0:9cbc with SMTP id a92af1059eb24-199376e0835mr15075491c88.37.1793076857722;
        Mon, 26 Oct 2026 21:54:17 -0700 (PDT)
Received: from lliang-1876.localdomain ([136.226.240.173])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm30437451c88.7.2026.10.26.21.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:54:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:54:05 +0800
From: Leo Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Message-ID: <auAubdjHl1V4h16N@lliang-1876.localdomain>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
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
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 10:52:14AM +0530, Mayuresh Chitale wrote:
> From: Anup Patel <anup.patel@oss.qualcomm.com>
> 
> The RISC-V trace components defined by the RISC-V Trace Control Interface
> Specification are memory mapped devices which are organized in a
> graph-like topology and described in the device tree.
> 
> Add the RISC-V platform driver for the gtrace framework. The driver
> parses the RISC-V component topology from the device tree, discovers the
> type and version of each component from its IMPL register, provides the
> RISC-V register level control ops and registers each component with the
> gtrace core.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig            |  15 ++
>  drivers/hwtracing/gtrace/Makefile           |   3 +
>  drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
>  drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
>  drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
>  include/linux/gtrace.h                      |   3 +
>  6 files changed, 454 insertions(+)
>  create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
> 
>
> ...
>
> +
> +/*
> + * Parse the "out-ports" graph of the component's device tree node and allocate

typo: "in-ports"

> + * pdata->inconns.
> + *
> + * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
> + */
> +int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent;
> +	int ret = 0;
> +
> +	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
> +	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
> +				      sizeof(*pdata->inconns), GFP_KERNEL);
> +	if (!pdata->inconns)
> +		ret = -ENOMEM;
> +
> +	of_node_put(parent);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);

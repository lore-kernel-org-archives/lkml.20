Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430EA35DA6E;
	Wed, 23 Sep 2026 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127680; cv=none; b=ekp99Dw852dXzEuyDX2rw6zSMoU82bKYA2pTIoW24Vz504rwp/fRLqi9AGWdjtZLY7iGmCHticzw1zYI8AG8bHPPUS/P7rdyApIungeLMp56GA+bPTxNvp7Ryh1YQRcEqW5hZXh9ZDPPhD+ncMwU4EccZX/DYDd73mp2bq3gE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127680; c=relaxed/simple;
	bh=ktISumbwT0u/xbi8uoGNLbukjIGr3O0cQy0xASU8uHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWrW2Fxr+mbNOg0yqh2O1hG6pQTMj439kQzJ+ihGxgQgoHaXBKmYIx9MfHJ3offuBzBqUyFOrAjecB1zSOdJt/9aqd7JEOBxqf+O4UH4hdEPrlhlkVPdVgPZGQvjWeltZo6TuTjrnhqFtYX9aM6Bx6QNbOCfe/Oy4jQqi10qb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FMx9Y3IO; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FMx9Y3IO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790127558;
	bh=9a1MU2/CDQgQTTa7WOxBZit45Y2o1Lnsh9hi2FH1r94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FMx9Y3IOhlE3RQuT55vdtSKS6UG3B0ps8KAGbU/0rog7M6DO34WvcSbFWA7iOu1Ex
	 P/b2TsERGPSHM16ybZ4zQX2jUfpz4sv370pONi20qOvtT1ggFvjcKvX4TGfBqlg3MQ
	 uFuWJWfs3k8j/5gkzSNb9cVEIrgAJf+NN9u4pl5k=
X-QQ-mid: esmtpsz16t1790127556td68b5a6b
X-QQ-Originating-IP: is8yxHjnwoMn4IwMqRzIakXosdwaURxV7jhMysF5Vas=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 09:39:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18217622928680533914
Message-ID: <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
Date: Wed, 23 Sep 2026 09:39:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
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
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NcfXIs+Ms1qHUenpEwWlnOdc/FbKT+TP1JZJJ4vfin9+3GPDagXABNGJ
	aE7VTJ8FCmkpqhsCE5XmX/JaeOE/h4aDjfyOpNT+kUV67sSpLC8xmXCK5iP4CIqhWB3u1MN
	fNhoj2cy6d+Kq0S2oluYmgypgd3KFWSVy7kxJ+PbGdy8XK+j5kJ55MzbcWRQPJBxmwOVbLV
	gDpFf1xBFOLCB0QSzdWbJY/ZA9+0CyvZuDOjP/TIWUHeQe2knSimhr6VimUmDDEwF1TCNZH
	CQ0viNtoFQoc4ZG/NgsDAGiJPlOI8s9phZ8m5BbJbopyE7xrTNICb2d95W8LHhP99B+uH+i
	62sknYIodKNQAxJ1ksoQrQbM4hk9MElqtla4yIBiHZt5Ys3uWxAfpm0hpilB1PZk3jUJYxp
	n/YehftIeNHPNR8AHglDISUJBMcT/4HdLZYpBA5rzcJ9w9G66DmT/BRwvRFMMxb6Ro9PKFV
	ihAam1DfIV2MSK7/TCJswhud009ihR3jRADTb0DmeLKoWL8r8/c7Efne/My0RyqvNuieDO+
	ZVxnxJMaI9TA9BymeQux2fHZ6JSS7m8e0xRMogWjVpTaBbkhmDn8Iy1siwHObdCTNotv6z3
	gMvpaJidoi7ofddQqO213p8BgWndrul17rLE7nsWvX/+2fIZNkg7o9/OJ+g2gyW3krvnEuL
	jiqEzDCXY1sg2T9e1vcxInE+A/p6qfTKNhr24sDd3GilfK5cKbbfCI4pd0dfo9nMrlvf5Zs
	sn2OmTlUplpPOLj6CLL8bp4iKYt9FMlGrjeNlY1rSHTF0QnI6K59+e1nE2G3dLTvDz3Yuso
	rvHVzeurjNAf0HzB+DEt4+yLzy2jZqvAdbjnOC16XQgfOFCpZKsRju13WdyiSqC2hidI5jE
	aIPgQYxD9D9GvonHfN0oV+eKwZjC1bsoRolQOXSp639noCJGJCVZFypLhJBSm6ll+cfsA7M
	JlQ8MNCLY+zy7V6AO6EGQwhh5jg6//eexHDXxHkRFuRh8i4f9p6Z9suRfbXWWpMNYDsD9uK
	ZQbY1Vjw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0


On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
> +
> +	/* Probe min and max values for start and limit registers */
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	limit_max = (u64)(high) << 32 | low;
> +
> +	/* Set DMA mask based on the maximum allowed limit address */
> +	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> +	if (ret)
> +		return ret;
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end = priv->start + priv->size;
> +	priv->prev_wp = priv->start;
> +	if (priv->end <= start_min || priv->start >= limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> +			 &priv->start, &start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
> +	end = priv->end - priv->mem_acc_width;
> +	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;


Suggest introducing gtrace_read_pair/gtrace_write_pair/gtrace_relaxed_read_pair/gtrace_relaxed_write_pair API,

They should be used frequently.

> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	return 0;
> +}
> +

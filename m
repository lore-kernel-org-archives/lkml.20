Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294D47DF98;
	Wed, 16 Sep 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550274; cv=none; b=b6QzIlyXD8RAXBM9TASaNg/UAnvUM1Hmj6tBXvD4f3bgSDtq7q7fpFx73034Opetp1nbshP7YFRA4BUZBIEi9pre2K9+Hm86DYwpcgo9HgG+xuIhL+3m+YDwDrw1WnCCyWPjQYYk9zZVvT4594EOAa0kHsvUgkfSSkwSy99nk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550274; c=relaxed/simple;
	bh=7SqYTLL/LQu+GVTrCSG2kdGWYFKsSMlVXeHdAYBRRn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTVf4G5bZ6nL1nzKgVn+0eWhalDnKATLBiAolMIPGFjpeOuOLfBQkARQIM/LLUw3aobrAy2K6v+kH5q9LEA7zG6/y69Sqy3lLlEQ+m7/V4TCLHhzbQUVzNkxKI1cp/q/Rn7/nk2n5ApOGAzCSH5R49QdE0CsKc0rbsLLpotcLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kExiv4KF; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kExiv4KF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789550174;
	bh=n25+JxY9MqK5iOVdfugBMvIEqa68PUtGXL1deEL5seM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kExiv4KF+Fy2HutX4CQ6dfnbAq2hSnA4RSHtDFj+niLaiEPeM+Ae7vOjnUoxWNEjs
	 faV6K2pDU8Xe/Gi3X+5R5TyBpt5skqj0Bqfg4jN5DPjpVEsWafdCET0q2xjcRtssvi
	 dKUUE04dODVIgf30DhBY3a6OaWuG06bT9r/KO3MI=
X-QQ-mid: zesmtpgz5t1789550173t40eaadf1
X-QQ-Originating-IP: +RMT9ucGZ2OPfrEZNM3eoZ2h1QPwNAz8lywMTVvEtt4=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 16 Sep 2026 17:16:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8074839530638732710
Message-ID: <67E42B9AD8C47E8D+89af48d1-1b65-4acb-b76c-6c5f205a974f@linux.spacemit.com>
Date: Wed, 16 Sep 2026 17:16:09 +0800
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
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OatzRg8pHEjpLcM8pE+CdWI2rV3k1w7+jxq9Z+OcP/42LTf3hPvCI15B
	kHLrVpoP/9To/53w+HTLPQZRAs2I/SD2pK3/VFhqFdJXPSnMvpGsoYGiVeDQ23dXLtohB4o
	kdervIELR7ZvUAoc7pDepxiQO3Mc65jaO4dS5drJuUtqJt785Q848FfNflZ2BRnGVUxE4fN
	59T1ksSWNrxX5C3zdEXpj0ecwfgiEteuSwQQBhqFuW/QRcmnT5my+8pDn9x2st+cv1X6gkU
	oYwhY5LAfHYVAOE1lOwmpnGECGkkLZLFpWIgyfb6CCRz/828Ry7crT/5coQQZGd+l3d3YGG
	DUc4qSBDU+oLmoXwFd71ff+RuGYCZT8N7i+sglXhjPEUqgsdTh6t1liLDnqtqEorNVVRZDd
	r8i3+j2c+iAxMKBx/WF+SdF0U3aLYntQWy4TrJlQT4yFyUJvnQw/t169iBEtM25ZFxO/c5I
	JVYYGDTYHseP6vSpa7vR0hMPTADrF+KSKqv6Qt1BchR8c7nvUbvuGI7//PwjxxOqpNTNnR4
	PFOM8Mr9Jenm27luErsLzKoeL6QvmnC8mZefbqLGiyZDbzxLxT5nKG+qr2kANVfvvPvDwfC
	0xqafKjj901whKLT0l5+0dgrTlWHj4G5tU1AmHWT2JulcaFMLBEtWp5S0xDeJ2Dff1l2Kvu
	mHwhSSxQPjOp3BTHI64fh9W6g5rQ5hJfw8DUu5q3vAOdemchlFhkJ6bTbq4Z05fNp40TPoc
	HpOL2CDE39QgiCKqV+okSWAPUlC/0GOOM/9k4XHfREWz12YC3D2EI5PSph979RTIJkFBcxl
	rnUftD0AXyTz4Z5s3hl/KanFYRrkXVHkaCeArtk13NOacZSvZySiVWkXkQTmvD00TgRdh6s
	I4RwLIHzC+fuIqocZhoLvZB2A2s5did+IV5AtErcOPwloDgaeieFm9L5SIkyuXgsgm+UUF8
	vipS+lJFE0MvqRC/vMwFE5SVwN0v55srT/L50XrUsACXHxV6aj14Ru/HEnKet4PgKHvpbyo
	eqI8u55V5LldPqES07
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:

> +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    u64 *format)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high;
> +	size_t bytes = 0;
> +	bool wrap;
> +	u64 wp;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	src.base = priv->va;
> +	src.len = priv->size;
> +	wp_low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	wp = (u64)(wp_high) << 32 | wp_low;
> +	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> +	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +	if (wrap) {
> +		gtrace_write32(comp->pdata, lower_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPLOW_OFF);
> +		gtrace_write32(comp->pdata, upper_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur = wp - priv->start;
> +		priv->prev_wp = priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. As a
> +		 * result priv->prev_wp can't be used and the entire buffer must be copied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes = priv->size;
> +	} else {
> +		src.cur =  priv->prev_wp - priv->start;
> +		bytes = wp - priv->prev_wp;
> +		priv->prev_wp = wp;
> +	}
> +
> +	tbuf_to_pbuf_copy(&src, &dst, bytes);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> +	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> +	return bytes;
> +}

If the discovery of trace parameters is delegated to the user-space decoder according to the cover

letter, why are we explicitly setting PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE here? Taking a step back,

the trace format should be determined by the  trTeControl's traceFormat rather than being hardcoded.


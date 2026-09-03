Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CCC3E316B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422737; cv=none; b=LM/KLlb/FxpFCOcItH38BM0CLSrtpynOGGx8fwsBLMkKG6hdyQv9tSGLIHSSKjPQ0x0ZXr76cd/YWt5UQH3hGL37tOFTbdymtSelJW822Old0htXOIjzRWRjv7Sp7h2T5I85IZuLFifda9/GeXhpGPQ0H3/arBa+lRN9hsFqPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422737; c=relaxed/simple;
	bh=GbhEIVGgcDEBp+ENZY3w0EoFcoKRrRGUmUW5cMurLm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sMV6gNgItNSt2rPO++zXj7gvsl0ck3K8e9+6h8InkVRU8iPjSw7qCaAWwBxc3N8tmcL/BVurkI0RVJHBZnmjJVP13/924k1Cp5HfviMQXkdCO8sePeG+btyfAGwU+yfls9LFlrvtrd/ZWn3AIMqwhsrpMsV39M5VxYgJak4oGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tFt04i6A; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tFt04i6A"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2221596;
	Thu,  3 Sep 2026 01:05:29 -0700 (PDT)
Received: from [10.1.39.91] (unknown [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6AC3F673;
	Thu,  3 Sep 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788422732; bh=GbhEIVGgcDEBp+ENZY3w0EoFcoKRrRGUmUW5cMurLm8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tFt04i6AoMjJNvaoAQqUB9pn83HtexiVknPZ1wg+oQbb45v343E9bb/BgZ0NG7+Ps
	 DXrUpyzXL7JI9zHuYSeIB2C8G3ZovA3giV6avKL2jQe+vbHut3ZobXUUiP8gPj4PD/
	 +lpse7I9UyUhIZuyJGzov81respIEq0QcYHnVJDI=
Message-ID: <17c7fd25-9cc6-44c0-8e9a-43fa6f6aa451@arm.com>
Date: Thu, 3 Sep 2026 09:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about quantifying Linux kernel functional growth across
 releases
To: =?UTF-8?B?6ZmI6ZGr?= <isxinchen@gmail.com>, linux-kernel@vger.kernel.org
References: <CAHoDJCR6pTNtp6zbZ7V3ewsmqH38h7O-thjaHEYTE8hAhKjuQA@mail.gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <CAHoDJCR6pTNtp6zbZ7V3ewsmqH38h7O-thjaHEYTE8hAhKjuQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/3/26 06:13, 陈鑫 wrote:
> Hello,
> 
> I am analyzing how the Linux kernel evolves across releases, for
> example 4.19, 5.4, 5.10, 5.15, 6.1, and 6.6.
> 
> I am looking for a technically meaningful and reproducible way to
> quantify changes in the kernel's functional scope over time.
> 
> I understand that there is no well-defined concept of a "number of
> features" in the Linux kernel. One metric I am considering is the
> number of unique Kconfig symbols in each release, since Kconfig
> represents a broad range of configurable kernel capabilities,
> including subsystems, device drivers, architecture support,
> filesystems, networking, security features, and so on.
> 
> For example, I am considering collecting statistics such as:
> 
> * total number of unique Kconfig symbols in each release;
> * number of symbols added and removed between releases;
> * changes grouped by major areas such as drivers, networking,
> filesystems, security, and architecture.
> 
> I would appreciate the community's views on the following questions:
> 
> 1. Is the number of Kconfig symbols a reasonable proxy for comparing
> the functional scope of different kernel releases?
> 

My intuition would be no, many subsystems even try to reduce the number
of Kconfigs (with steady or increasing features), as long as cost is
justifiable.

> 2. What are the main limitations or pitfalls of using Kconfig symbols
> for this purpose?

It'll be vastly dominated by drivers?
Is this really part of 'functional scope'/features?

> 
> 3. Are there other quantitative metrics that kernel developers
> consider more meaningful for describing the growth or evolution of
> kernel capabilities?

Maybe syscalls? sysfs writable knobs?

> 
> 4. Are there existing tools, kernel.org statistics, or
> community-maintained datasets that track this kind of evolution across
> releases?

I'm not aware of a functional scope tracking.

> 
> My intention is not to claim an exact "feature count" for Linux. I am
> trying to identify a metric, or preferably a combination of metrics,
> that is technically defensible, reproducible, and suitable for
> comparing kernel evolution over time.
> 
> Any suggestions, references, or pointers to previous discussions would
> be greatly appreciated.
> 
> Thanks,
> Xin Chen
> 


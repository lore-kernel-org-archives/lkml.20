Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394034;
	b=W9meREC9G+HXRRtvOCmdHOjXx6O21htZp/Z9NXaoI6xVxx4Q/3gDBNwHlDZrNEjLmQ0f
	 CXWMWKCLEsmgQfkF4YScu/fDdfB8QHKbPDHPGHuQ/jqjj7UIsqBIZmq2p1XOs68S4+R94
	 D0H5GqyRQSGyUobEzEkiksX0MG2TMagQXM7O3oTMoQiTkXu9FQ/vnXeLk7gBqaY31mSW9
	 uG7Sp6yArQbv5vcgtmzEVOcPslGyitpZ1onSFRj4a7HhVV6N7a/yqYmx8g+KxnYDqNx7/
	 LFXQ6Dz6WKK6afqeJfs1XUnf4xcjI4NROXNb8EyFl0hlSCcowSKnnA8TwtnmGfkvDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394034;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=E0xIKm+cz73M8abUWu8ny6genyhhbuyvIZwIeMLtpK8=;
	b=0lmnf1KzEuyTHqoY6QIyBqFASy1GqDBfv/D6+3V5K/K/+q0nzocTCXHfx4GuwefVEKwx
	 eXnowxJGUQ+XC9JOzbHUONlTE2jbNuEtCJ40c+Z7IwvCA41Wb25RXPmaYE0rcZftEa3jb
	 aYNVzyvIDskUMUNDOBVowa0g3uWhlwl4pamuSRorzG90hxye5+AbOaE6tj0Qnw8Uv1MSN
	 EhYThbEGEzlRlqMlUGoQfd/oM72EUJVAFibqcWybtz4tiPnWTcQUUOlS6N9mByXT2lj5v
	 B94EcDv7F+9FnnOGPoGq84d6C3GSXFDOavw7u1XW7U0hCQngLOQdSNMTpK0WxR0gmzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tRotdwgW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721B5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tRotdwgW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D52F1576;
	Wed, 11 Nov 2026 02:47:10 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6EB3F632;
	Wed, 11 Nov 2026 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794394033; bh=symzOMU/drdgsQKXYISFLyE59beBdgV5l5c5Zsouk1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRotdwgWhZQjzpx/2Dg9C0eUh3Jk/P7RgPZsmnX+EPG8ebkUZK8sf3ZPt4dJpHN53
	 zsVFPA+0vYtAJKKwnfq7RuVTRTMtmLrNBMQsRA5+IgMRdbJYXLILIwTw2NfOWsdm0a
	 5a8V9T2x08bO5tL3+5IXKeicrUbBltmJyYtnarNg=
Message-ID: <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
Date: Wed, 11 Nov 2026 10:47:10 +0000
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
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> When arm_trbe_update_buffer() handles a pending interrupt that is
> not a wrap event, it discards the buffer by returning zero. The AUX
> output is not marked as truncated, so userspace is not informed of
> the lost trace.
> 
> Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
> the trace loss when closing the AUX output.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 * errors and as such buffer is empty.
>   		 */
>   		if (act != TRBE_FAULT_ACT_WRAP) {
> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);

Do we need this though ? If the buffer has space left, we shouldn't use
TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
needs to re-enable the event.

Cheers
Suzuki

>   			size = 0;
>   			goto done;
>   		}
> 





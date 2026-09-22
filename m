Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD06550DC3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082807; cv=none; b=g9T4DaXic+44aHV2y39LWjwYXNaYw8QEMhpGLe0YhZvS0ogRsk/xg4S4Jx8pmguUjb1MTK0e3rfG7QgjkayMSSsmZxOvPxCcyxpcmyBIniSxsepS6c8o0HAnZz3V6wwlwmKL1KsVWs/BSOddVa5rFY4vHpNDpTz0laF6BG4o3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082807; c=relaxed/simple;
	bh=7ScoP72loie+KDTnxQPNwCK69btdw+khKMf6M0k1bJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNcKvXOJWpt5WH1XEZ5nd1P1D0IYiN5dwXYnBlvMonzkbBJVDAhCSwlvdgBbeqIAQWaX6+GCYYE0D7XxXT/g/OqgC+EDiB0oXoHpY0NLF2pc+qV2gvCe1q7LK++pgjq32ZNDdvRJ5trwZ4Y/GSwNRdvpNnzx6RWLCd0u4Ofl71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GBYP3/qi; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GBYP3/qi"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85e68bdbcc1so30307227b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790082802; x=1790687602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=GBYP3/qiGHlVXy433bYLRW9PjhfS7OKvCDGOjVEmh9d8D8QRFCTG85fy55aM1kNQcc
         4O7+bbcwdWY7dEirIhHHkA/GQVc18SVOFYPn08OapoImcfZBytBY0BpiS9t0AYmXLw3C
         /eVOSXMeweM7ocPjjOJTB9938GX1m+RJdZmU23aZlnzqxc2YRI90NrWkYKGxiMZd+gmz
         4TNuuZ7TbB/Mn7+KY0z6pS9qDGD2n/lPg+kGGYc5DIVLQSZcTY4sPncRj6wU/ubL+OrO
         Jds89XV7bXART5XbrYckJI4rPlETlN7e0LrTvgQS96TEHKrVhTCsab87RLvMinOwDG4V
         YZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082802; x=1790687602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=WWhojK8Xf1IyB9n06Bo65TBrkFKNojG6t11nG8gkCE1QIPeOkBxcrWMttCtI1lYdDB
         7LvWz970sBuep561v96+pAoABSs8yEkwClgg7CF/BX8YUjs9Pk5K6CaOeLkTeq/uU+mN
         AC5uU8pT6Fll9UfgN+ynfLyMSAVnBWPIG5b4+/g9AFG1pof5aBy5GjopAcpV8b04mBwg
         FzuxrM6E9OuYzd6O92cPnzArwu25y+cYwivoGhvsZV9kJCq+Kwm6gHaHrId0RrwaxAy4
         PyKzTF44je0q/D6LKeiActuIfBo915jef0xaudd2nGLfqP0XuQCF2ej8CRo4SSqVF2fr
         0fcA==
X-Forwarded-Encrypted: i=1; AKwUvBzhbUTiLOieHG+3RfOzVt86YLZDuHOcf0QDmRcq25Ux9evu9RO6eAkv0HhvenbnIXiha+37hQNlEhPTToI=@vger.kernel.org
X-Gm-Message-State: AFuF++nIvmUN4icY7rUf/cs/OTIwmRDHIJFTqLCTn6qn5JHL4CTG1c+g
	Ryqn+YJNSJz6QPK5N+4DruEtgU8zR9Pjm6zwHDkIFwWkJSIzpI1Z2g2xLj3v92RVMLI=
X-Gm-Gg: AYBFou2uZBKhMcETiB03Tf6IqZfzEGEmFuiz6k9d159AxVrmdAUblC3dbQdUs/V3cd4
	jdO7Ce3RlJYklnZb9tSJWSNtLXmQ0NnBnHRX7aHlGhqKZdSrC87SqzczpmRVASPezHo/ixln+XN
	VtXZlCrA65/qJUBfK6T5fqFjZ40GDrWjEU/BMpE5W9txarMaNRGL+rqOKe+GTK7Ci0wxpeEJMKq
	TN3TfCH1zjMDpk90q8a9zwLLn2XSBo6Msr0MdXgRJsxlQhyR+3VXskFHfuZsMPmFCItpUigzLPH
	hDOizTu3+5O70Sgc2zUJC/upAV598Ay+YyNevIxJ9iDnrfPlQpHa+tomyeK7KZa0UDDaMdBITNy
	cZ7QgNpZ8et8ZexiIyCOmNasE3IZIatPhC+g7dmYb96NTCq96r70cmEGv0uCAzKP90DlQTh2UY0
	QLBzSW51cY+efqabP6uAsETLXhcFQXd6ytCBnA0f62l+B4FIGwHsG2WtcwIFIAnFH5njCqWC+hU
	+SYk5t3FA==
X-Received: by 2002:a05:690c:d:b0:81d:472c:17a8 with SMTP id 00721157ae682-8972beadba5mr62389717b3.0.1790082801845;
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c25bacffsm5463367b3.24.2026.09.22.06.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Message-ID: <1ac16236-284a-4d01-b68a-4b32d5c5287c@riscstar.com>
Date: Tue, 22 Sep 2026 08:13:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-3-elder@riscstar.com>
 <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:21 PM, Krzysztof Kozlowski wrote:
>> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
>> new file mode 100644
>> index 0000000000000..75732fddd3025
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#ifndef __ClOCK_TOSHIBA_TC9564_H__
>> +#define __ClOCK_TOSHIBA_TC9564_H__
>> +
>> +/* Clock IDs */
>> +
>> +#define CLOCK_MCU		0
>> +#define CLOCK_INTC		1
>> +/* #define CLOCK_PCIE		2 */
>> +/* #define CLOCK_I2C		3 */
> Drop both, and SRAM is number 2. Or enable and implement them.

I forgot to respond to this.  I think you are confused.

SRAM is BAR number 2.  This is defining clock IDs.

And the reason these are commented out is that, while they
do exist, we explicitly do not want anyone to disable either
of these clocks because PCIe uses them.  This clock (and
reset) control is accessed via PCIe.

I do accept that someone might want me to simply omit
these commented-out definitions, and I'd be fine with
that.

But your suggestion wasn't sensible so I wanted to clear
that up before deleting these.

					-Alex

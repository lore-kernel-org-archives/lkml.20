Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E8542EF9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080681; cv=none; b=KEbOigIr1j02VUw06ngtIktZppvPldWqyIgVXKl5qosLugoZSJHc7lhYdy7Gk3+kDPs9c8tZr7H/0EfslocG3puHriGjj1MZxWlLdmGsWuDFy7jzoCPv92TcE6lAEJzd+ulSxpxj+sh86zGbWDXUdhez+eZM+CHEl+58uClYjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080681; c=relaxed/simple;
	bh=H/P/6p4tn/F1HONtpik9rVj8NHKsX7jwfbvX1rYbyC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZKIXPIt+hC0Kcbx0EUn1Czn1YdPL5mwW38YeZZPbk9mnzCcDXXaW6duaJ8oYZdJLbjTzu4XKbPmXr6/F7/vOrcyhCmHCXyM7zPGSbclyI+AvY0wQaoYiCRluZzeWhNKF+EZBH59i9qe2NRYVl4I1BhQ0NrC39bHV/SxGlQu7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FkfWRGaZ; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FkfWRGaZ"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76906adso61524981cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790080676; x=1790685476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=FkfWRGaZwREVIsrqzjVFGBGzPV1U1peitkJIphN7YFqzJ6K67G2ePRscEg1Sldl5Ap
         mZr741X53n5wqw2unVOMRQJqYlVP2vgxX1CgV3LDSH2QHN64dDiK9wTXTx1E1cZFu+iG
         4wIUG+I5m/uwL/t7YZixMmRU4tlLbZYRPWOKO8NrM0aT3wZT+/2JzoF530Xyn4d5GXpA
         GkSb9lmn5d2QL3o6aRABwaKepKcHuIm6Y4Vv/EG+Tr14bqDOiIY+EDphfJE70aeiDUzl
         t0hlGCLOI91vmsUOolLi67nxaV3NokjtYRjiXM+BWRxsqkwJu2YnrJC/MnfJ7CsEDZG1
         ciMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080676; x=1790685476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=bO6RIC0dl36AFBNpDf0He3omBtXXlsYpKF2bx0vu+5ligOPCMs0m9U2McByXJieX25
         LS1s/zfk2m08usciePlk49fEXAMayVGgQxB6GSlhwbr5pzw2IfcVLGSMkOHNZHVFUS8B
         02DbbNRyp8g7IHVVD8xY008PupvpwwcSZ+LPYtTOMOFcOuLAOOwcCcqgxIHG0IHDJEJx
         ZG+HR8CFVUDDXOmEAKx6Zw5QlR4h2qIvVqGWmFuJ/IYBBoC104xwUfElJfi4i1uy8smO
         9KuNVonks6SZY2MzxLatj/ayzL9rEsn6BgwFaflVYM9WFmCTzM7IOHIuajoIUAix23i4
         SgdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCO9B89X0c1VW8BEqeVV/YPZ24g0hUk1we69IDM+Ckvwqu8w/WYXCNGM/duEoz0HBr9GIK9boYx/vxZfU=@vger.kernel.org
X-Gm-Message-State: AFuF++me1EfgxL+PBajypaTeDj8cviikvf7olPRr2NuSFhbaAz35aqxI
	/N2FaLp3oo7WNkc5Yujeqk1dAVohqFdWMpWdiVn1w0XjZhzLG3SycXVUqhDOnfBjpjg=
X-Gm-Gg: AYBFou3v9M8S94zWVWFPu9r2HZ73mFfrvryOnaSvXAq6oQ5qBjeb/ft3YonLoQLRzlS
	Ay6exz4plTD6v3YHH6u0kVSHxMfEw9DDqNMNrktvaTb4DFKEaFETX5ysLHvOCSOM3BpCmsdGm+m
	+cZ6qdjMCtRRznmFLDyhJdL4FaOAqIuV30SIr4O4RYlZgzYcogGmDj6uLGc/4ufgLJrt/JnRYTM
	Idh56p1jbRGHP1dFvapqca8MwghIMgY6n68mBGP4rFBMyrPevyywp8v6ytW912dDbSmeU2eDJ3e
	PfCiSYZmP2kiHz6yzFD+5WoqxSTXzjA3LG7xS5U8YuhgthMB7Q2QnbrDgYioq1CpiiqbLQeI82A
	+xEUTqqZiLD/x+EgGlUii1KG+PuZbgrDQUu9gCXmqdCjtgNh/INDBBni42hQE1oZjVEFIjYZnFH
	GvMqsXhjTZ+AJbi9OORnmRRGItz5kv3PwAz3HmAI3c2FsAxRGzIb1znyvPUu/CEpWspOUXHuAH
X-Received: by 2002:a05:622a:1790:b0:531:190c:85d4 with SMTP id d75a77b69052e-532dd3ccc11mr36804681cf.1.1790080675565;
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18d753fsm11687481cf.13.2026.09.22.05.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Message-ID: <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>
Date: Tue, 22 Sep 2026 07:37:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
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
 <20260918165234.687224-4-elder@riscstar.com> <arA1svdQzaj3VanR@monoceros>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <arA1svdQzaj3VanR@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/26 2:39 PM, Uwe Kleine-König wrote:
> Hello Alex,
> 
> On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
>> +#include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
> 
> Please rely on linux/platform_device.h to provide of_device_id and drop
> including <linux/mod_devicetable.h>. (If you want to go full iwyu,
> include <linux/device-id/of.h> instead.)

In general I would like to "go full iwyu" but have never heard
it expressed that way.  Can you recommend a tool available that
will help me do that?

It looks like "mod_devicetable.h" doesn't help much unless I
need struct_cpu_feature (which I do not), so I'll include "of.h".

>> +static const struct of_device_id tc9564_clk_ids[] = {
>> +	{ .compatible = "toshiba,tc9564-clock" },
>> +	{ },
>> +};
> 
> Drop the trailing comma after the list terminator please.

OK.  Only for the list terminator, right, because nothing
will ever follow it?  Non-empty final initializer is OK
to have a comma as far as you're concerned?

Thanks for your review.

					-Alex

> Best regards
> Uwe


Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258213AB5C7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954422; cv=none; b=R1QGrm012P6Ip6GOs3i1UCQjXyiSPJeKaKoXRGHvkt0PVd3Wh9RoihSLleJoTfFgPW1qbwR5gILznXmNOfX+1TJwLvd5UIBrTCIJfKGmwc2QbEh4GfMHYXM1DM8bWbeY32tY107kNIrjV4+gJdsKi+2Jz9kOQWF/vEnHtDIMKZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954422; c=relaxed/simple;
	bh=94SVdijHsAHHz7+IiLjB2kWR3+z6uPbwoWl/Rtfrsd4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=XqireJDrvNMBDoC8zX7Y/Ovb8QgcBYao//raQLZnuaiGGPzCYtl/221x7bp6kOlMxoTQ4dTWcqJpQAdPwsCh8r4fDJv9QYmNrw2KqCm8WZCorX1OPl+70edx/Qqzv2YmEc0lWlbcr3Y39tDjUarSjFl7yxJ6cYhNSIqUxgGt8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=nM1aNr1X; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="nM1aNr1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=qyk1vUzPyUv2JdSJQ49+NGBwt2bdTTz+hVPctRD8n0g=;
	b=nM1aNr1XrD0EqyCFE32YjNDJqF5DRoXhKGQJGb2vEQbe9tWBeVUyxxfViBvcSQ
	z1cwgzRb/nc2LJ0P3q5C/G66W2swUcu7ymGtsiMnejL1LHh5ClU+caiQAugMkDWD
	rWgOsXlQ8odrL0fihx3N9Xr6q10ytE9MTOhIwLfG6MofQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3XwcAR6FqdgWiAw--.10221S2;
	Wed, 09 Sep 2026 19:46:09 +0800 (CST)
Message-ID: <6AA146E0.4050805@126.com>
Date: Wed, 09 Sep 2026 19:45:36 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
 kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] phy: ti-pipe3: Fix EPROBE_DEFER handling for clock
  resources
References: <20260619030214.1779043-1-zenghongling@kylinos.cn> <20260619030214.1779043-4-zenghongling@kylinos.cn> <m7mr6dgayt7kpibs632cb2bpvwxrj66vmscusqgpn47apcvrpq@di3nclql65bd>
In-Reply-To: <m7mr6dgayt7kpibs632cb2bpvwxrj66vmscusqgpn47apcvrpq@di3nclql65bd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3XwcAR6FqdgWiAw--.10221S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWrGFyfuFyxGF15AF1rCrg_yoW5KrWxpF
	s8G3WYyFyvyrWkGwsxXr1fX3WSyw1xKF4UGrWYgw1rZF13XF1kCFW3Kr4rWFy8CrWkuw4S
	y3WUX3Z0ka4DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4Q6LUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrgHUpWqhRwFmaQAA3c


在 2026年09月09日 15:52, Manivannan Sadhasivam 写道:
> On Fri, Jun 19, 2026 at 11:02:13AM +0800, Hongling Zeng wrote:
>> ti_pipe3_get_clk() has two issues with -EPROBE_DEFER error handling:
>>
>> 1. When devm_clk_get() for sysclk fails, the function returns -EINVAL
>>     instead of propagating the actual error code. This masks -EPROBE_DEFER
>>     to -EINVAL, breaking the probe deferral mechanism and causing permanent
>>     driver initialization failure on systems with non-deterministic probe
>>     ordering.
>>
>> 2. For SATA PHY refclk, the function ignores all errors to support older
>>     DTBs missing the refclk property. However, this incorrectly ignores
>>     -EPROBE_DEFER as well, causing the driver to proceed without waiting
>>     for the clock provider to become available.
>>
>> Fix both issues:
>> - Return PTR_ERR(phy->sys_clk) instead of -EINVAL to propagate all
>>    error codes including -EPROBE_DEFER
>> - Use devm_clk_get_optional() for SATA refclk to handle optional
>>    clocks while propagating -EPROBE_DEFER and other errors
>>
>> Fixes: a70143bbef6b ("drivers: phy: usb3/pipe3: Adapt pipe3 driver to Generic PHY Framework")
>> Fixes: 7f33912d2978 ("phy: ti-pipe3: Fix SATA across suspend/resume")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>>
>> ---
>> Change in v4:
>>   -Merge refclk leak fix and EPROBE_DEFER fix into a single patch
>>   -Use devm_clk_get_optional() for SATA refclk
>>   -Drop manual -ENOENT handling
>>   -Ensure error paths are fully symmetric
>> ---
>> Change in v5:
>>   -Add Fix ignored clock enable return value in init patch
>> ---
>> Change in v6:
>>   -Fix all clock leak paths comprehensively:
>>   -PCIe syscon update failure path
>>   -SATA DPLL lock check path (also fix incorrect return logic)
>>   -SATA errata path in ti_pipe3_exit()
>> ---
>>   drivers/phy/ti/phy-ti-pipe3.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
>> index 2d36fe4c4218..9ec228c2a940 100644
>> --- a/drivers/phy/ti/phy-ti-pipe3.c
>> +++ b/drivers/phy/ti/phy-ti-pipe3.c
>> @@ -608,14 +608,20 @@ static int ti_pipe3_get_clk(struct ti_pipe3 *phy)
>>   	struct clk *clk;
>>   	struct device *dev = phy->dev;
>>   
>> -	phy->refclk = devm_clk_get(dev, "refclk");
>> +	/*
>> +	 * refclk is optional for SATA PHY to support older DTBs, but
>> +	 * required for other modes. Use devm_clk_get_optional() for SATA
>> +	 * which returns NULL for -ENOENT, allowing us to propagate all
>> +	 * other errors including -EPROBE_DEFER.
>> +	 */
>> +	if (phy->mode == PIPE3_MODE_SATA)
>> +		phy->refclk = devm_clk_get_optional(dev, "refclk");
>> +	else
>> +		phy->refclk = devm_clk_get(dev, "refclk");
>> +
>>   	if (IS_ERR(phy->refclk)) {
>>   		dev_err(dev, "unable to get refclk\n");
>> -		/* older DTBs have missing refclk in SATA PHY
>> -		 * so don't bail out in case of SATA PHY.
>> -		 */
>> -		if (phy->mode != PIPE3_MODE_SATA)
>> -			return PTR_ERR(phy->refclk);
>> +		return PTR_ERR(phy->refclk);
> As Sashiko noted, you need to switch to dev_err_probe() here and below to avoid
> printing error during probe deferral.
>
> - Mani
>
Hi Mani,

Thanks for your review and for pointing out the issues.

I have addressed the reported problems in v7, including restoring the
original `return ret` in the SATA PLL-locked path and cleaning up the
clock error paths. The updated v7 patch series has been sent.

I would appreciate it if you could review the new version when you have
time.

Thanks,
Hongling


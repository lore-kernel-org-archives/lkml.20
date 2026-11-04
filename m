Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827339;
	b=lFDHXXObIXqEnUhsOkbiO+rQJvkOdu94PfDWW/zt3Y7dFO9htbGrIfmYtbt5boKgz3/C
	 LCH/enlpOQmWaKPfuV5A3E/UPXGI2G4knGyxSvkIgX1onzeuXeXK0pXtaOBngz5HLLLxG
	 9eMUmfS0jdf/RSoh+hVLS4JPsgHccT6MBb3M76ckVCgF8HJg4ppKWEO+yrD17MLNdfo+q
	 N02XgWjS/8JIlqoTWsiU7FOQNwreijBNIoY0NyWBtKm+Dv4FYsGqxZ/BRQ6X1SR/5PbsV
	 jAYuaqCBHLjCRH7u+DOhaohO3zWDQp0we0oAtpxlsLjPVEAMqC36RmyZ3P5DfvnX07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
	b=RyUIo6a5KGPPc4+o+jKpt1ZsVGriMY9ZwRBTrTq8rciw17DW2s76kR0jY63Z/ghkrEER
	 lv01K1Y/Bk5Du71gJIH9algxtN3yQZG0uIspQcA1Jr1wp+uVyuVqOxTcSGliwAPzzSYNx
	 507sGh/k8aOU9N9905VKqho0/KUcujoM5TB/ndIrxzwWo3//lwHLfRMMGxFcgzSt/IqGM
	 WCM8jhk3FA8D+QmJTrBA35ftegbvsncGyCo+P2oPbuNEEPjoiMDgMEhxHeuShNnVwTGWV
	 OOb/F8lxmVdrG3JkyfI8uIwDkWvQayezPjcU3Cge5vZAubEUtrLJlL/LQMrxh8Lhq1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=scWJOak0;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A15606B2F8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A15606B2F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=scWJOak0
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-49429181ce9so804437fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827338; x=1794432138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
        b=scWJOak0P2SrFj9xsdCllBdXNHB1WYAMqxN0F7JbJbVbBbcZ4s96RIbePsRVS0I649
         wkMLFv8jmjZOPTgBm6qZVGJrLGc32bzLrvxGLNTIdhs/AsCIE7CjicRJmpsMBZJ6uwEf
         o5xXuJXLHZqZ7rYQ+wqM7gFgnJ/Sw5KVvADYj2BYixP+W2QSt1AIGWqSHiTTs9mwaPKF
         lk56Cp+xciR9pa/91imRzqz+XPXMYkk7Er2XSwoLrGGgF8kGOswP6DFydnzOe2sVmMLT
         g1xYE2MF01a9bIm6QzMIbQN6BkqEh/bGUo71fuv+5i6LOPr9yuG1+V75finP0Vt8Ewfz
         Xjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827338; x=1794432138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
        b=gVbrsQhv15HV4B11c8L42dzUUO+L6TRLdL9ZzRXhsIhQ5IwM0obOCpaZZI+oV7/uP0
         ZiQ0mnWqc4nE6r3mEPhAw3K9XAJc8Za4DgLWcRBCwMQU4Wj+MMb+2A6XwhrwPLPHQBfu
         ueds5zR8xdXIvXllNtwZOuwtxVuEDjuC7NDfm8shhBm4uV5DHW4y252YyijzVtytKKQc
         cwyoo83LWx/arps2rBXwP54pcDM/kN9et9/0joQqPi8KudefxLAGDJnFD+kF8U+QXUoE
         yUl2zZeYLTKIDA12mIWquWio+Vb6KHtyQvaAdJtg43S86MMRg4KiUhHIqKfAEYP5BQiO
         cqCA==
X-Forwarded-Encrypted: i=1; AKwUvBxVfuWSdkixFci+1BbcJg7mp+8jZPPUDQJa1sAUtqSSXPu7kFyiITUwla1rIEvJITNwMgNojBDx2pkq+fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qHHA2I9MweVFQl+F9bo+NAOaPAgWXJ6wnrUpzrsRYQFPTnEps
	fwFdbHZLXhr68hzs1/ysuwgIMaX6NRwfnjDvKVIY9JcAcwy7J0FnQini56o6s0LcgLM=
X-Gm-Gg: AYBFou1e2VgB+K2658JupsfS020pXIm9txHKr5Xb9oVkHwu2td+LXTsCh0/noJ/Vegr
	Ee6k8FXcA4ipmk1JCJZyerSaZOU0/KiePyFs2lEvQu7vc/FovHZsapjlSW1TqnSYIUpBhIanrC3
	bwMFNU0+YeyuLN7FzfgQcU8+CDBBz7IvFIud6rGvn/9LRDG9i2/cidc5om9p3cUmRHHQyiIVNvw
	8/1XrgqeCuNeTJA56REN9+wxfz2dipJZ9QH/6NBsqRwyjLqd4/2cA/TYnypyX3MX4kq6JiFj6K9
	wScXohVPJJmYd77tePG561BPkrzS38wQIe/TOVQLwskOZTh7RM25OWWOrJQgSu6z4a+fC11b3sb
	K0QWMztM9mne4lRztXCShZpmI79d9qkVyT2vSky9R28K4KSnZ7F8nV8ua1Qml8zGCajlEsyNaTZ
	YNdSszEKB0IdZEw6+Z3GJ3IPEUOhOmnLhsY2qUpG1D2HMu2qlm0unI4oQvEiVV8+p3tQ3k4TZ4G
	GxdqlWtCeyU4bfd2apmyDAa1FAeH7jBkxgfCzesc/tu903sRfY8zr3ecE7Li35l9b0xLqqjfipE
	Ht4AdIf5IcA+LpjjemiqewSMztbQ
X-Received: by 2002:a05:6870:21e4:b0:48f:e25f:f6b7 with SMTP id 586e51a60fabf-4a9077756c1mr11293865fac.50.1793827337651;
        Wed, 04 Nov 2026 13:22:17 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:17 -0800 (PST)
Message-ID: <975f7923-046c-4180-80ae-6763d9ec7689@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:16 -0600
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
Subject: Re: [PATCH 4/4] reset: toshiba: introduce a TC9564 SoC reset driver
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-5-elder@riscstar.com>
 <783234169f479ba1e8c4dd19896de1cd4755eec1.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <783234169f479ba1e8c4dd19896de1cd4755eec1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 3:49 AM, Philipp Zabel wrote:
> On Di, 2026-11-03 at 18:43 -0600, Alex Elder wrote:
>> Define a new platform driver that manages reset signals implemented by
>> the Toshiba TC9564 SoC.  There are 13 reset signals available, but
>> currently only the resets that are (or will soon be) used are defined
>> to be controllable.
>>
>> Two registers manage the state of the resets.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   MAINTAINERS                  |   7 ++
>>   drivers/reset/Kconfig        |  12 ++++
>>   drivers/reset/Makefile       |   1 +
>>   drivers/reset/reset-tc9564.c | 135 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 155 insertions(+)
>>   create mode 100644 drivers/reset/reset-tc9564.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ee01aed56508d..8389b11fe6e1a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28355,6 +28355,13 @@ F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.ya
>>   F:	drivers/soc/toshiba/tc9564-syscon.c
>>   F:	include/dt-bindings/soc/toshiba,tc9564.h
>>   
>> +TOSHIBA TC9564 RESET DRIVER
>> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	drivers/reset/reset-tc9564.c
>> +
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>>   L:	platform-driver-x86@vger.kernel.org
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index eda9c698a95f3..8c1b08f4eebe6 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -358,6 +358,18 @@ config RESET_SUNXI
>>   	help
>>   	  This enables the reset driver for Allwinner SoCs.
>>   
>> +config RESET_TC9564
>> +	tristate "Toshiba TC9564 reset support"
>> +	depends on SOC_TOSHIBA_TC9564_SYSCON
>> +	select MFD_SYSCON
>> +	default SOC_TOSHIBA_TC9564_SYSCON
>> +	help
>> +	  This enables support for the reset controller embedded in the
>> +	  Toshiba TC9564 SoC.  The state of reset lines is controlled
>> +	  via MMIO to a region managed by a system controller; this
>> +	  ensures access to the region is coordinated between this and
>> +	  the clock and XGMAC (stmmac) drivers.
> 
> Drop the second sentence, explaining driver details to a user that just
> needs to decide whether to enable the driver or not is not helpful.

OK.  I think I originally had something to the effect of
using a regmap to ensure multiple drivers could access
the space safely.  Then someone asked "which drivers" so
I was more explicit.

Anyway, I'll just drop the sentence, as you suggest.  I
will also drop a similar sentence in the clock Kconfig
file description for the COMMON_CLK_TC9564 option.

>>   config RESET_TENSTORRENT_ATLANTIS
>>   	tristate "Tenstorrent atlantis reset driver"
>>   	depends on ARCH_TENSTORRENT || COMPILE_TEST
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 489fafd6bbe3f..6ddded26309ef 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
>>   obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>>   obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>>   obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>> +obj-$(CONFIG_RESET_TC9564) += reset-tc9564.o
>>   obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
>>   obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>>   obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
>> new file mode 100644
>> index 0000000000000..fcd58d5f1962f
>> --- /dev/null
>> +++ b/drivers/reset/reset-tc9564.c
>> @@ -0,0 +1,135 @@
> [...]
>> +static void reset_manage(struct reset_controller_dev *rcdev,
>> +			 unsigned long id, bool assert)
>> +{
>> +	const struct tc9564_reset *reset = &tc9564_reset[id];
>> +	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
>> +	u32 mask = reset->mask;
>> +
>> +	regmap_update_bits(regmap, reset->offset, mask, assert ? mask : 0);
> 
> Just propagating the error value ...
> 
>> +}
>> +
>> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	reset_manage(rcdev, id, true);
>> +
>> +	return 0;
> 
> ... makes this even shorter.

Yes I see what you mean.  Just because we don't *have to* check
for errors doesn't mean we must ignore the return value.

> 
>> +}
>> +
>> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	reset_manage(rcdev, id, false);
>> +
>> +	return 0;
>> +}
>> +
>> +static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	const struct tc9564_reset *reset = &tc9564_reset[id];
>> +	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
>> +	u32 val;
>> +
>> +	regmap_read(regmap, reset->offset, &val);
>> +
>> +	return val & reset->mask ? 1 : 0;
> 
> Consider using regmap_test_bits() here.

I will.

>> +}
>> +
>> +static const struct reset_control_ops reset_control_ops = {
>> +	.assert = reset_assert,
>> +	.deassert = reset_deassert,
>> +	.status = reset_status,
>> +};
>> +
>> +static int tc9564_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct reset_controller_dev *rcdev;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *parent_np;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	parent_np = dev_of_node(dev->parent);
>> +	if (!parent_np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	/* Note: MMIO regmap (no error checking needed when used) */
> 
> I suggest you just add the unneeded error checks and drop this comment.

Yup, agreed.

>> +	regmap = device_node_to_regmap(parent_np);
> 
> Can't you just use "dev_get_regmap(dev->parent, NULL)" ?

I just tried what you suggest, and it returns a null
pointer rather than the desired regmap.

device_node_to_regmap() searches the syscon_list for an
entry that has the provided node pointer, and if found,
returns that system controller's regmap.  That does find
a syscon, and returns its regmap.

of_syscon_register() seems to create a syscon but does
*not* register any device resources (devres) on any device.

So I think when dev_get_regmap() simply scans the parent
device for the latest regmap resource, it finds none.

I'm happy to discuss this further, but for now I will
not be switching over to dev_get_regmap().


Thank you for the quick review.

					-Alex

> regards
> Philipp


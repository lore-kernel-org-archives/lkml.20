Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263860;
	b=lBG28ljti2T/j7N+TlsDdohDR4vm0LmxZq1nxJDl2qM1seiIsEr6/RCRj4W1ND3lK9aY
	 0Vk8mVNCcc/yFJ2qDHElgv3JlkJt0YpfjdjxUiIiUZH9X1QVaPGiL96GVpK/Ru/hHq6+s
	 H9D3L+DIf7Ezf6fDhMaT+t+QdF3xvT71SOfPV9jGVODTkVOPA5o4+/7ATOufM5T4zdxl7
	 paLHWIf1zsppyh2RzhTeC/BdXCLhEI0G3gFG31i0bih32Qy1QjdIg/3fWcpDijAztZeeC
	 iV4pEHp82IsWc4wyXm6cMElHFQ1FUH1BiyrYEzqK3SxK6GNpl9xV2uRhsZ8k6+QkKHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xuxIBLcK2++oC52tS24cdCbvIwRS+urg9+SN33nMZe4=;
	b=MClGKgXd1SftZFmEYm+7hhgcyQAC/FUpyo0AsMKdXywY622Z6xV0i3Gi3e7sgOSrddrJ
	 NBktw7mRPhNJ6fgwzPYqZbF7P3sEyVagWfg3YUha5knqiKAgSAwEYqAWjp6S0K4jku5+X
	 xyOdvDN/8LE1aWZ98pYbpe5uj7VjLcrRC92HDAEWml1aHVSYSMUme2+X8i+cmv/ncVPQp
	 OnHe1cjWS67TBa014HQ6zJzWLs+7Znt4UD4Y9CzBQaSzkasudrttBhtDYAxEzCKP40L5G
	 sMIzOIXWaiWOVXxuo8GnvTbAzRureiRLao9hd/re23n55zocwgznJw/jtr+M3hVBAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=sltVbzrP;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4841A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=sltVbzrP
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8217177c5daso394137a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794263859; x=1794868659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuxIBLcK2++oC52tS24cdCbvIwRS+urg9+SN33nMZe4=;
        b=sltVbzrPcVPBEoocFVmHx6CNRKiWxCtPW+vxDuWArUIQgAgs4QDDNuN5hh4J0R7DIL
         R++YKW9pKJ9Iwvx9TAssugbHOsPA1hZAy8InJibucpWYmxg+Q5JStHYwDymX092qS+Mk
         FKCbdj2PwVo8KbRICaOv16AlHnTJeIi6dMoUu5PCWl/HtjikfDuMbxr5SyzM3+4TO22m
         +Y4lQieYoGn2R6JzjR8GQr64Z0TNPMYFC7Wx8bULN5k0q+gBJ8JDYJzCPE3PLUuPOS8K
         kgIdKXYNYr3zEIceFoyU5aY3Bq3SXzvIJsnSmJHSiOI99IivkcLseNW1I/+ebjdJ8x0W
         MBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263859; x=1794868659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuxIBLcK2++oC52tS24cdCbvIwRS+urg9+SN33nMZe4=;
        b=tucuPgdJr6extJzioT+Xkti9UNpqkkeOMNMoMVhPBhaklpJpQKRemSm118uypBFM5N
         wWuLgrek/sKZwyqT05vlrJBuso6Q+iOysr2wGROOHfrtt71Xq+RmwVrny1YQ4AOnsTdz
         QYIBpwybJWsZcMEN+0LVGUuqL+GYbazAGbnYFeMDtInk9uDckMOY/wNGLtiTecNDWwwY
         JZmzFMJfFvbMkYDTWCyiP1958xBjDDpnYqWHW00TfRwNACFvUv7pKAl4oj7zE/tlNDqh
         qTWVY/OERiC7tyKWvhR7zE4q6v3nA7KdNbXa7O/hcLkM/C4TRRlv7WFnzpdiWfv9+UN+
         0xdA==
X-Forwarded-Encrypted: i=1; AL+hErG0JsC/2i6OOMaDAAejpSIFqVv3HP/6WsqByRm6ouUo7ryfJp2jUlGr03oidZMBjWdjNLvDU1OsnYTAup8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SVLKc5wGyR1KPhvP19t7vordtxyseP7Bc7+2we+WealWb3Fq5
	aIfPg9NR8gGQMpJiUbKmVIB7Szmpa2SbDpOEMJO+lCN/sIcWvOyS0U7JyaRtKYZC2QaukX+8VJ+
	R8z+EXV9hLK8d
X-Gm-Gg: AYBFou04fBLMAf2+RLzG3WZNNB0+fYxR+5IWATPIpG0OZzdvH59EslwMQXQEo+vsM1v
	oO1CFtTiw21y+A2C1gd0m8ye8o9SeDgZOBYjjPAcrUAGwlBjzVCDaSkMAFe2Wtr0brB8dGkxwhZ
	mOOHEL2chUahf136XIvUKIlm8PJtwEqA4NEqeNYubkLDZZ/xT108eLcM4PWzbW5WYRYdEsgSWjj
	GbYltHOj971cXomLNcQLePhyrq7UlYTO2g2nyFODfByJzYruZ0dS9IOEm2nROtckkzZoFUaabOz
	Ta0xu56XFs/kyz4AZ4b29JgSQYxvbRSuGcG0gbUI3XQGBRhMjmc8TfSk6FLO2rFV/IC3ZneFmu5
	FVOEk5Ew1gElaAv4ZpgWxvtWgdY80sK7ZMDYRZQiP+MqvP+VitDXBsUAgINl5LDSZxJLVnnXlqv
	9+9LfyqNWur9ZWzc9cCT3E+jKUi3/UfGFRXnq+mKeA8R9RpUJG4KTfa5Ip+8SOHHWCJDb2dmIU5
	0hxdPeRC2iCZ9aylRJlFSZrX6T+xp6qWbKq6pSMInHtQFdqC71fEevG+Af2VwgKigDykovvG1qJ
	rd+yM0NUSbv6RlvJNR73CA1Hb7sh
X-Received: by 2002:a05:6830:314f:b0:821:94d2:83cd with SMTP id 46e09a7af769-860dc79d674mr715978a34.9.1794263859082;
        Mon, 09 Nov 2026 14:37:39 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbfa983sm492176a34.20.2026.11.09.14.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 14:37:38 -0800 (PST)
Message-ID: <6c3c21e0-e499-4b6b-83b9-b4f63e6c9b7e@riscstar.com>
Date: Mon, 9 Nov 2026 16:37:37 -0600
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
Subject: Re: [PATCH 2/2] irqchip: introduce TC9564 SoC MSIGEN support
To: Thomas Gleixner <tglx@kernel.org>, radu@rendec.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>, p.zabel@pengutronix.de,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-3-elder@riscstar.com> <871p8vvx8x.ffs@fw13>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <871p8vvx8x.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 3:17 PM, Thomas Gleixner wrote:
> On Mon, Oct 12 2026 at 14:02, Alex Elder wrote:
>> +config TC9564_MSIGEN
>> +	tristate "Toshiba TC9564 MSI distributor"
>> +	depends on TC9564_PCI
>> +	depends on GENERIC_IRQ_CHIP
> 
>    s/depends/select/
> 
> Otherwise this relies on some other driver to select GENERIC_IRQ_CHIP...

The reason this uses "depends on" rather than "select" is
to avoid a recursive dependency.

     error: recursive dependency detected!
         symbol GENERIC_IRQ_CHIP is selected by TC9564_MSIGEN
         symbol TC9564_MSIGEN depends on TC9564_PCI
         symbol TC9564_PCI depends on PCI_DYNAMIC_OF_NODES
         symbol PCI_DYNAMIC_OF_NODES depends on OF_IRQ
         symbol OF_IRQ depends on IRQ_DOMAIN
         symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP
     For a resolution refer to Documentation/kbuild/kconfig-language.rst

We already depend on TC9564_PCI (and use it as the default value).

GENERIC_IRQ_CHIP gets selected by IRQ_DOMAIN, which we get from
OF_IRQ, from PCI_DYNAMIC_OF_NODES, from TC9564_PCI.

Should I just drop "depends on GENERIC_IRQ_CHIP"?

> 
>> +/**
>> + * struct tc9564_msigen - Context for MSIGEN IRQ domain
>> + * @ioaddr:	Pointer to mapped MSIGEN memory
>> + * @irq:	IRQ number for MSIGEN
>> + */
>> +struct tc9564_msigen {
>> +	void __iomem *ioaddr;
>> +	unsigned int irq;
> 
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

I'll fix the alignment for these.

>> +};
>> +
>> +#define HWIRQ_COUNT			25
>> +
>> +#define MSI_OUT_EN_OFFSET		0x0000
>> +#define MSI_MASK_CLR_OFFSET		0x000c
>> +#define MSI_MASK_VALUE			BIT(0)
>> +#define MSI_INT_STS_OFFSET		0x0010
>> +
>> +static void tc9564_msigen_irq_handler(struct irq_desc *desc)
>> +{
>> +	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
>> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> +	struct irq_chip_generic *gc;
>> +	unsigned long status;
>> +	unsigned long hwirq;
>> +
>> +	gc = irq_get_domain_generic_chip(irq_domain, 0);
>> +
>> +	chained_irq_enter(chip, desc);
>> +
>> +	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
>> +	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
>> +		generic_handle_domain_irq(irq_domain, hwirq);
> 
> You want to use generic_handle_demux_domain_irq(), which allows you to
> actually implement affinity settings for individual interrupts.

That sounds better, thanks for pointing it out.

>> +	/*
>> +	 * Clear the MSI flag. Most interrupts within TC9564 are level-high
>> +	 * type. If any interrupts are still asserted then clearing this flag
>> +	 * will cause the (edge-triggered) MSI to be regenerated.
>> +	 */
>> +	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
>> +
>> +	chained_irq_exit(chip, desc);
>> +}
>> +static int tc9564_msigen_irq_domain_init(struct irq_domain *irq_domain)
>> +{
>> +	struct tc9564_msigen *msigen = irq_domain->host_data;
>> +
>> +	irq_set_chained_handler_and_data(msigen->irq, tc9564_msigen_irq_handler,
>> +					 irq_domain);
> 
> No line break required. You have 100 characters. All over the place.

OK.  I normally stick with 80 columns but since you prefer 100
I'll adjust the formatting throughout this file to use that.

>> +/* Find the PCI device we're associated with (not necessarily the parent) */
> 
> What does that mean and why is this platform device driver dealing with
> a PCI device in the first place?

We have modeled this chip using PCI endpoint bus, which allows
a PCI endpoint to present a child bus that implements multiple
device functions via each of its BARs (or a single bus can
represent multiple BARs).  Device nodes within a pci-ep-bus
sub-node use a platform device that is matched by compatible
string.

This MSIGEN block collects interrupts from multiple sources
within the chip and translates them into MSIs delivered to
the host.  We know that this block is subordinate to a PCI
device.  If this were a direct child of the PCI device, we
would just look at the parent.  But because the pci-ep-bus
is in there, we need to go to the grandparent.  The code loops
as it travels up rather than assuming it's parent->parent.

(Daniel might have more to say on this--if so he'll chime in.)
> This really wants proper comments explaining this in the source _and_
> the change log of this patch. And no, your sloppy cover letter
> explanation does not cut it at all.

There are several distinct but interrelated drivers and it's
been a bit repetitive to explain some of these things.  I'll
incorporate better big-picture descriptions both in the code
and in the patch headers in the next version.

>> +static struct pci_dev *tc9564_msigen_find_pci_dev(struct device *dev)
> 
>> +static int tc9564_msigen_probe(struct platform_device *pdev)
>> +{
>> +	struct irq_domain_chip_generic_info dgc_info;
> 
> Struct is uninitialized.

You're right, these should have been zeroed.
> 
>> +	struct device *dev = &pdev->dev;
>> +	struct irq_domain *irq_domain;
>> +	struct tc9564_msigen *msigen;
>> +	struct irq_domain_info info;
> 
> Ditto. Look at other drivers how this is done correctly.
> 
>> +	struct reset_control *reset;
>> +	struct pci_dev *pci_dev;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	pci_dev = tc9564_msigen_find_pci_dev(dev);
>> +	if (IS_ERR(pci_dev))
>> +		return dev_err_probe(dev, PTR_ERR(pci_dev),
>> +				     "failed to find PCI device\n");
> 
> See bracket rules in the documentation I linked to or simply get rid of
> that line break. Same all over the place.

So you want brackets around the muti-line body of the if statement.

Switching to 100 column line widths might make this become moot.
In any case, understood.
>> +	dgc_info.name = "tc9564-msigen";
>> +	dgc_info.handler = handle_level_irq;
>> +	dgc_info.irqs_per_chip = HWIRQ_COUNT;
>> +	dgc_info.num_ct = 1;
>> +	dgc_info.init = tc9564_msigen_irq_chip_init;
>> +	dgc_info.exit = tc9564_msigen_irq_chip_exit;
>> +
>> +	info.fwnode = of_fwnode_handle(dev->of_node);
>> +	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
>> +	info.size = HWIRQ_COUNT;
>> +	info.hwirq_max = HWIRQ_COUNT;
>> +	info.ops = &irq_generic_chip_ops;
>> +	info.host_data = msigen;
>> +	info.dgc_info = &dgc_info;
>> +	info.init = tc9564_msigen_irq_domain_init;
>> +	info.exit = tc9564_msigen_irq_domain_exit;
> 
> Both initializations (except for info.host_data) can be done at the
> declaration with a static initialization, which avoids that parts of the
> structs contain random stack content. No?

Yes.

I personally don't prefer initializing structs and unions
where they are defined as stack variable.  But you're right,
they need to get zeroed in that case.

Anyway, I'll do what you suggest.

> Please look through the sashiko comments as well.

Yes I think I responded to all issues in both of them,
indicating how (and whether) I intend to address each.

Thank you for your review.

					-Alex

> 
> Thanks,
> 
>          tglx


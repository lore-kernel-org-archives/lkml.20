Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C5B4B7A35;
	Mon, 21 Sep 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006952; cv=none; b=O51Nd0OMZosWE6KksBFuyJiNitgmYRms0jtoMBooqQpf1ie/u2w1AKZZCPs1MsE5a09HQn07pfinsJG3Ic+GViZ92F9jTLF05crRfToVEDVPzhCGGqI4gJyK4ej5Kl7jmY7maZWbTFCxiEGLQ8N2p0OmRPH0gNVAR29UVvjQpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006952; c=relaxed/simple;
	bh=MW7RFSad0D3ktD3ewhzK8KrndV8NGPJK3xmAQlCQy/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZg5NLQ3Z4DDHrOQotFuERXeEuSL/LXltQ/+AIvtzmzZGzaDNk3LawfBOm/c4WBfFauIx2OoWlo+tt0Fh6LOHHmznoXiEwmclnPj61vYD6zemN8nI7ov6KYiIgdBOaxgnwYxFXI6GvEwcCOyKCPo+XZjXkTrgvecyzQxQdRZfW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmrzuHvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmrzuHvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A51F000FF;
	Mon, 21 Sep 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006950;
	bh=PyHmy8r/O5EX/bAIT+ss5mh6M+tcDcvG0zSQ88r4hQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmrzuHvYZqJIsUvy0vk/EifYiIphyntnEsNvTkBvL32cJTv2+88OaBhoqzXUSEKqX
	 50t3XHwV7ptdlhNrCrV031N+NV8JyBnH9y2GphFXHlbgJOYKMBnCdMl0RQC5RpDeuG
	 iKyc1EMcUlt8K76Na6RURxTKJvIu4J+QeSXJ2L1Loa5Lq66FNoG+wOnDfd4+AKhUmY
	 e/RV7KLSOHPoaAjctJ3MdvWEF0exj1YmVPj4lvpzh5vHirYvz/cymSoRYDbnC5Ub2v
	 vfjGKOqtZHRCTwToJGgGn3d4g/MFdJ77eMdBohC2aH7VkxjjZDPegiRZuY9mei7FB8
	 xAsyfIq9di2hw==
Date: Mon, 21 Sep 2026 17:09:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918141112.2115555-7-andre.przywara@arm.com>

On Fri, Sep 18, 2026 at 04:11:09PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec describes an asynchronous
> notification mechanism, where the platform can notify the host OS about
> newly pending image updates.
> In the absence of the ACPI notification mechanism also a simple
> devicetree node can describe an interrupt.
> 
> Add code to find the respective DT node and register the specified
> interrupt, to trigger the activation if needed.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 7a55b4a6785d8..a23df331ffde9 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -16,6 +16,8 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/nmi.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/psci.h>
>  #include <linux/stop_machine.h>
>  #include <linux/string.h>
> @@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
>  }
>  #endif
>  
> +static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
> +{
> +	int ret;
> +
> +	while (!(ret = activate_pending_image()))
> +		;

Yet again trusting firmware too much!

> +
> +	if (ret != -ENOENT)
> +		pr_warn("notified image activation failed: %d\n", ret);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int lfa_register_dt(struct device *dev)
> +{
> +	struct device_node *np;
> +	unsigned int irq;
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
> +	if (!np)
> +		return -ENODEV;
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	of_node_put(np);
> +	if (!irq)
> +		return -ENODEV;
> +
> +	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
> +					 IRQF_COND_ONESHOT, NULL, NULL);

And where can I find free_irq() ? Yes devm_() can do that for you but how
does that work with races around removal of device for example. I prefer
to have free_irq() at the very beginning of lfa_remove().

> +}
> +
>  static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 };
> @@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  			pr_info("registered LFA ACPI notification\n");
>  		if (err != -ENODEV)
>  			return err;
> +	} else {
> +		err = lfa_register_dt(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA DT notification interrupt\n");
> +		if (err != -ENODEV)
> +			return err;

More code addition with absolutely no error handling 🙁.


>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 

-- 
Regards,
Sudeep

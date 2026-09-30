Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B25208AB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791234; cv=none; b=rmmcYyMIPw3oIXJa7sg5I/Jsw7R9AqKVlfEcUWV4XgeC0QY3gFyWHMc2/MAopS+Uv9ycXyH/ImjwFMJ5334UyMiJGsp+eGaVLJ0jiscVXD5N44q6FmBoIbBANDTgohRG8fTn3lXz7TvdQ8q4v4kAzu97PKBG7mahpxVDaJ87PzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791234; c=relaxed/simple;
	bh=3AIVWfFPOn4MsvIez3k7rRExhVEE8Pa4q3mYgRv+IcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Le1CnzF99H8KlN0HZxKuZwDKQp0m1ozExagMEF6CDKrkdE+u7WJJnwUpEUNBIyrj5HXfJrAM19KS9N5eJ7MQA5bN4p6udu5Ep4QnzAepHYMryfKyPYOBOwV409RIaFd86NkNwKjExPmnok0jdcEBjOi9CeT9bqp+GFL113BcW+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0lQ69ZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0lQ69ZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399611F000FF;
	Wed, 30 Sep 2026 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790791232;
	bh=m/yksmZi4/8K5CoXfwsmRihQ5Y6+rvb/E2mBihR25ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a0lQ69ZA3EF3oZrA8FJp6gvLHNcjv7sa0CYpXDRp5NCIpQAKZINSlmZePxs0Bu/GG
	 ZL+K2zBU5VYOUipLGoPXy7oqxQneSnadQ1rQHA8NOucWYetyMEsqX5Z/4SkamW4nc5
	 1CdVHa1J6L6kTXif3yRviHjfmpYWpcQTuApygeBSOtr/mbYM4/DrinXULausYGEql8
	 7VYFIfty06grTZp9bcWuMRm+v7INjdNAwKWqGrnz2ZsA7i8lRMoOaaqJylR1vEkrSm
	 U0STDXgARwrHn6dT0i++Q62rSNwcyw3yoJ7TPi/rAekH7TvRRK7D6GrcYSdaKfLCnS
	 2PR9tiwtCURkQ==
Message-ID: <36a39658-1345-40dc-8c25-44c3ec5c9750@kernel.org>
Date: Wed, 30 Sep 2026 22:00:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: drop the fwnode links of the dpmacs nodes
To: vjardin@free.fr, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260928-for-upstream-fsl-mc-dpmac-fwnode-links-v1-1-b8976244b38b@free.fr>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260928-for-upstream-fsl-mc-dpmac-fwnode-links-v1-1-b8976244b38b@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/09/2026 à 15:52, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> A DPMAC node under dpmacs/ is never the fwnode of any device:
>    the fsl-mc bus creates dpmac.N objects without one,
>    then dpaa2-mac finds its node in dpmacs/ at connect time.
> 
> fw_devlink therefore attaches the supplier links of those nodes (phys, ...)
> to the nearest ancestor device, the fsl-mc bus, as SYNC_STATE_ONLY proxies.
> 
> device_link_add() refuses such a link once the consumer has probed, and
> fw_devlink logs the refusal as an error.
> 
> On an LX2160A board with 4x25G DPMACs for which phys = <&serdes_1 N>,
> the Serdes PHY binds after the bus and then at every boot it shows:
> 
>    fsl_mc_bus 80c000000.fsl-mc: Failed to create device link (0x180) with supplier 1ea0000.phy for /soc/fsl-mc@80c000000/dpmacs/ethernet@3
> 
> once per port!

If I understand correctly this explains the problem but it doesn't 
explain what this patch does to fix it, allthough the patch subject 
might be the explanation.

I have taken this patch as is to give it a go into linux-next, but 
please feel free to send a new version with a more obvious explanation 
before begining of next week.

Another question below.

> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 5878eafd8d44..0c37b6780c84 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -11,6 +11,7 @@
>   #define pr_fmt(fmt) "fsl-mc: " fmt
>   
>   #include <linux/module.h>
> +#include <linux/fwnode.h>
>   #include <linux/of_device.h>
>   #include <linux/of_address.h>
>   #include <linux/ioport.h>
> @@ -1033,6 +1034,20 @@ static int fsl_mc_firmware_check(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static void fsl_mc_purge_dpmac_fwnode_links(struct device *dev)
> +{
> +	struct device_node *dpmacs, *child;
> +
> +	dpmacs = of_get_child_by_name(dev->of_node, "dpmacs");

Is this name a valid API documented in Documentation/devicetree/bindings/ ?

I'm asking because I have already been challenged by devicetree 
reviewers on a use of undocumentated name.

Christophe

> +	if (!dpmacs)
> +		return;
> +
> +	for_each_child_of_node(dpmacs, child)
> +		fwnode_links_purge(of_fwnode_handle(child));
> +
> +	of_node_put(dpmacs);
> +}
> +
>   /*
>    * fsl_mc_bus_probe - callback invoked when the root MC bus is being
>    * added
> @@ -1134,6 +1149,8 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
>   						&mc->num_translation_ranges);
>   		if (error < 0)
>   			goto error_cleanup_mc_io;
> +
> +		fsl_mc_purge_dpmac_fwnode_links(&pdev->dev);
>   	}
>   
>   	error = dprc_get_container_id(mc_io, 0, &container_id);
> 
> ---
> base-commit: 7b3b0598c00e67f2df85d0b4cd99eaa3be6c9bfd
> change-id: 20260928-for-upstream-fsl-mc-dpmac-fwnode-links-622b8eadb98a
> 
> Best regards,


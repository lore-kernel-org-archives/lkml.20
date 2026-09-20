Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F053DBD76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890163; cv=none; b=tZrGGVXTdXOCFiALJNxJ3sw4F8yGeTw0jMYkd3HO/mwNod33C7KJr74zweT/ifBDMzzLLpmDZ1ppQ2xK9BicGN5NaNxBXThyHgy4IgN9DLZgqpqka6EKCBCDj3RLrA/6o0N5P9a0H/o+YUM3y5EV4X19Z9a/iC3oYRY6CiZM/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890163; c=relaxed/simple;
	bh=XACIHRk7pvR3ne8CI5yYmGZaL8q2kgBI23W8AaJmnmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiEXYyYH1kA4UMDgMqKX9qkFC2XgUUIUsL/D+aMp74N1L8rGwcPVLaFprXvudK/PPfQdhX8lMowk6YfTennFJHBtOi1SE4kyVU1RWwmFMvpFPNw7grY9S1n3HgQdj1m+jrIyC6DWLH/ivaroo+ffhoQ5D/iYpPxI0JWftqzoONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hLqtI2js; arc=none smtp.client-ip=91.218.175.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hLqtI2js"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XACIHRk7pvR3ne8CI5yYmGZaL8q2kgBI23W8AaJmnmw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789890160; v=1; x=1790494960;
 b=hLqtI2jsb1Yi6iEZM0kP6YcXRZ/BParR6qhARgb/niOqQZdg4wc6QnflM31u6EHVwIXc4ayl
 kYHk6jsaJrF5Dabu9dPkmD3+TajvGV92MApTW9Eqj0yvYZjRaevpZ8PREQIlGreSTFbdbfKWMuh
 fidqhWWqbxiQSFU9sSHGV4kA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ff25d7f64fa7a0b;
	Sun, 20 Sep 2026 07:42:39 +0000
X-Mizu-Trace-ID: 6ff25d7f64fa7a0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <327d0a31-7a04-4ec2-b184-c801a95750e9@linux.dev>
Date: Sun, 20 Sep 2026 15:42:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3
 and ITS drivers
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 9/8/26 10:26 PM, Fuad Tabba wrote:
> Hi folks,
> 
> Three fixes to the GICv3 and ITS drivers, from reviewing the GIC series
> floating around and chasing down Sashiko's reports.
> 
> The first releases the partition node that gic_irq_get_fwspec_info()
> takes from of_find_node_by_phandle() and never puts. Sashiko raised it
> on an of/irq patch of mine, and I said a fix was forthcoming [1].
> 
> The second widens the per-device MSI clamp, which truncates to zero when
> GITS_TYPER.ID_bits is at its maximum and then denies every MSI on that
> ITS. I couldn't find an implementation that reports that maximum, so
> this is one value at the edge rather than something anyone is hitting.
> It carries Cc: stable because the commit it fixes was itself
> backported, so drop the tag if you'd rather.
> 
> The third clears vpt_page once its_vpe_teardown() has freed it, so the
> NULL guard holds if teardown runs again on the same vPE.
> 
> Based on Linux 7.3-rc2 (df2908090cda3).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com/
> 
> Fuad Tabba (3):
>   irqchip/gic-v3: Release the partition node in
>     gic_irq_get_fwspec_info()
>   irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
>   irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
> 
>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>  drivers/irqchip/irq-gic-v3.c     | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

All look good to me.  Thanks for the fixes!

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Zenghui

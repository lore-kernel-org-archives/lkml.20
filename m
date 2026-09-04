Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7574CCDC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502831; cv=none; b=LTnjWXy3qdQRr/hoOmA89rNEkg6Ioowt1ANveQWfxY8tgx4HGW6fWAP77xco2+9Askif4T/hRUyl+KGCfgAtgmZZPtBsvzqWzEiTMrd9ZkvJ7ceVqRm97KNw7nkb9TnbL3OSUW5xTbbNlj2OSH66wBe7ZSF4tFPfMaSDL89lcBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502831; c=relaxed/simple;
	bh=MVVcm2i4o5btMcqBbxKftvBKuQlUq5bEuGmV5KbhIoM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NFmdK7rQXMZ1Cv4UgZFdKB8/Uv7LYBwjzDi46tRN7fObjDj29DDvIw8t/AZtmsUgE87HWlQzJhpKt1CJFKBioi2Df3wqh3rmDG+F1zpgQmnn1EKal/j3/VdwnC4SxsLObVC9YHCUUE7MZLave0CIK9gWLJFwXe5aHplBSZXl7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqVYW+sC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqVYW+sC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36D81F00A3D;
	Fri,  4 Sep 2026 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788502830;
	bh=HYQXX/ubjhNNZOYAYl5k62rHvx4JQ1DjgUJm4O6hHhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YqVYW+sC+l6OdjrFcTGjEfcL5V2eIQUQbIJk4XNI7XidD/kMd5oPLzUQPnlg250ss
	 oSouYo7rHBNTR6GO2mqbZS6AvNODpIXPDZsTswCjyNDYiGp4Wre7oaMjF8NNYowS31
	 4N/wy1l/+LDjsonBE6ELUv2IotXElRnySppd9m8jSNwNJ9L23jP39l+8xjatd76ICg
	 VZyR/hsWm4cILMyt9PvobCUKGe2rsrRhPwtGjwXybnAjl2AaOt3mVe7g86XpAXfkri
	 kPfrqkaa0E3FGlCNnDS9TpmMEeGtgctvVK7ratPSsEhVFF7GNrJONIXr6mhV6YETRU
	 JAB6/7FHLvIww==
From: Thomas Gleixner <tglx@kernel.org>
To: yangfeng <yangfeng.lucky@gmail.com>
Cc: radu@rendec.net, linux-kernel@vger.kernel.org, yangfeng
 <yangfeng.lucky@gmail.com>
Subject: Re: [PATCH] irq/debug: implement missing FIXME in print_irq_desc()
In-Reply-To: <20260903131916.61329-1-yangfeng.lucky@gmail.com>
References: <20260903131916.61329-1-yangfeng.lucky@gmail.com>
Date: Fri, 04 Sep 2026 08:20:27 +0200
Message-ID: <87y0dh8rmc.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 03 2026 at 22:19, yangfeng wrote:

The proper prefix is: genirq/debug:

> The original code ___PD(f) left a FIXME, so fix it.

That's really informative.

> The maximum length of a macro is 15, so modify the printk().

And this is just incomprehensible

> Signed-off-by: yangfeng <yangfeng.lucky@gmail.com>

You need to provide your full name not a nickname. See
Documentation/process.

> ---
>  kernel/irq/debug.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/irq/debug.h b/kernel/irq/debug.h
> index 8ccb326d2977..aa233cbeea38 100644
> --- a/kernel/irq/debug.h
> +++ b/kernel/irq/debug.h
> @@ -5,8 +5,7 @@
>  
>  #define ___P(f) if (desc->status_use_accessors & f) printk("%14s set\n", #f)
>  #define ___PS(f) if (desc->istate & f) printk("%14s set\n", #f)
> -/* FIXME */
> -#define ___PD(f) do { } while (0)
> +#define ___PD(f) if (ACCESS_PRIVATE((&(desc->irq_data))->common, state_use_accessors) & f) printk("%14s set\n", #f)

__irqd_to_state() exists for a reason and it's available in
internal.h. The define just needs to be before including debug.h.

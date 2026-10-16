Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4C1C862F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129397; cv=none; b=OmBZMdk+OWpO3zQnmicru3oWxtlDbxjjTfhMX0KYS79DHCXDaqagwGKk5iOPZB7jcJYxIvi6VSmdX5/agxbAUSGyWHrkOiF4KX17KW/h1M3D25d/1TlfIS2ECIDlgw8KoIRu19ggk+lu6xYdGJRu0eQwOQ8MrQ9LB6YtBHp6LkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129397; c=relaxed/simple;
	bh=NEakvsaOGnuVnV0CYglxQUSvVlGwlWIB3RhWn5msuzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb5zolzfMCw365wagGJws5HUQ1vkO0qxcbBvsUsePNARFMfK7q/72olcrQKwIMJehokSH8SLgU1aGxfhGpgw45AX1YEFpMbGv+uHoPxYmFWYJVsJb/tFo+JgClcRaypBPJCZJNkQ+siG45hOc8d2+HRbLpZ7Tt2C/IHLiIFZDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+yNGKcb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+yNGKcb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so14518217eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792129395; x=1792734195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SoitKqT2YG6pddF7f7ztD4Qh7MmMeAXctnSL8wVenKQ=;
        b=a+yNGKcbV7xAHAZsqbeq0Kp2lN9fMoAsp2eeMjUMPYbanavFsJAVdhyFdHTM8V+UGZ
         dG3MmwHPs2E1gzi9mHSbXbaiOt6gwLtHjg2CtqEY6wK0I2zft7wOrsk9nJpbtUaT1DIZ
         3rITIRjfiiFqstxtUYY36WPrr4uuF9y4JUR0ZrZcrwsw15B5PNyugvHceiWL2khpgmgw
         /pEmU3Ojc0Y1ibqgtLqUvCycO93mbQrWNy3vFcVtVQobwSz61I9sa2qE8U48TU+tJbwb
         J/RdqtrsBiVW63yHff2/C5Yr26+4GviRgMROovKSb8RicQWQRhdP/7BwIKUUaM7kkVxc
         l8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129395; x=1792734195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoitKqT2YG6pddF7f7ztD4Qh7MmMeAXctnSL8wVenKQ=;
        b=SMrttGYVSwqNrxs8incXGl8oBRznqkKKw7Cc54L+elaH+tLI+RYSfs0L25V/kGrdZH
         DsoahkTOA4OoXlS8+Paz1q1f372rYzJXpFwRRUk5VOb9RXHhjY91K4wqKMF4HTErmU+d
         jA62C8VBNcG8L9aJyLjCbnMU8FMNbPCQGR13tht4FA9I8sp8va1xSqR8d9T0RBx8me2s
         VuegUbu59jJUZqHT8nFpzxF0Ho5Etg1ghFOPP73HBqKgVUMzzXUcnGs5D/vrsIl35maM
         /cNB2AoRXImxVEbnh4eH9CSKXBJb4fr7TcwQzSnZe54uVI92z6GoTX3TCDG130oWvC81
         A33w==
X-Forwarded-Encrypted: i=1; AKwUvBygLzJNvw/dSmt51/oibXJyQnBDfFE2AlSEfkIMXWib0pI8RXsD8mr7PsAqehWc9cM3XluaPP+/8yadjTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLITEETJPqJiIGyakUMiSeN2ZKRVgLql8oQSyZ0N9xcMEpefmjh
	GToZ1LkW6I9K2GljWs4gxOw+896Cysuft5xgvzMXuHWkml3KMJd0foEBbSmE/KIn83w=
X-Gm-Gg: AYBFou2K4ZqCr77HdCwQs9oTmlBvXp7fbIx9ln8aTyqB82pgjRPaMHuW1j6HhbTutZ9
	YElASCvGzvQ17iRn1Oc15DoteYKzmGRr9ZukV0aSz5fGm3EoUlhkl31rlDbSJSqgmLpyziKFsIr
	H9kIrQaZma5pbv9k0x1+0+oOGv9MylIEkaJsvlTYx44GDbNiqrO8MGVbyole5YMIfXDx3pzruHi
	V4Lu083uuo1A0TQ8YK31fdA2gfgG0naeLPum+tXA5kicOrAsqoVmzmWZjXHQeGOOfNAeCMW4w98
	EY36gwGn4DUQ/IJiAfzYn0567xaB2k0HPNKILIqquM8my5OygSuQYS6q0dC7rbRBXmSeqt41izb
	2qC5XouWYD6t2lDMqDJe2dA5UpzzKdFalMKOoWg3DQw6NLPUNYAWFuaVGfQ8tocpTNMybtMoM03
	X/saS5J4AqwGvxKE2GVpIL3TGhzeh/+20Rcp6OiFdPKUeuuHQCU/JVbj3VHDCnWw+6zQ7/gvrO
X-Received: by 2002:a05:7300:87:b0:360:c266:cddf with SMTP id 5a478bee46e88-360c266d46amr1079687eec.5.1792129394732;
        Thu, 15 Oct 2026 22:43:14 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm5889667eec.24.2026.10.15.22.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:43:13 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:13:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH V2 0/5] cpufreq: loongson3: Fix wrong behaviors on
 multi-node servers
Message-ID: <atG5bnTzhSKljwH9@vireshk-B250M-D3H>
References: <20260828031201.1500767-1-chenhuacai@loongson.cn>
 <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>

On 01-09-26, 16:01, Zhongqiu Han wrote:
> On 8/28/2026 11:11 AM, Huacai Chen wrote:
> > Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
> > nodes in one package and SMC mailboxes are also per-node. However, the
> > current driver has wrong behaviors on multi-node servers, including: id
> > field in smc_message is too narrow, mutex is not per-node, IOCSR read/
> > write can only perform on the current node, etc. This series fix all the
> > above problems.
> > 
> > V1 -> V2:
> > 1. Fix typos and add Fixes tags.
> > 2. Fix loongson3_cpufreq_get() return values.
> > 3. Use nid_to_addrbase() rather than hard code.
> > 4. Guard some code with CONFIG_SMP to avoid build errors.
> > 
> > Hongliang Wang & Huacai Chen (5):
> >    cpufreq: loongson3: Make this drvier depend on MACH_LOONGSON64
> >    cpufreq: loongson3: Adjust the width of id and val in smc_message
> >    cpufreq: loongson3: Replace per-package mutex with per-node
> >    cpufreq: loongson3: Use global physical CPU ID in get/target callbacks
> >    cpufreq: loongson3: Replace IOCSR read/write with MMIO ones
> > 
> > Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/cpufreq/Kconfig             |  1 +
> >   drivers/cpufreq/loongson3_cpufreq.c | 72 ++++++++++++++++++++++++-------------
> >   2 files changed, 48 insertions(+), 25 deletions(-)
> 
> The whole series looks good to me.
> 
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Sorry for the delay.

Applied. Thanks.

-- 
viresh

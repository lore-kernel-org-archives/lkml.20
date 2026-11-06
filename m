Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984735;
	b=IUXX2DgVZ6/pTz/98INwDqBRZj0lR7/JCcOSBedvU1fZKt5oh30JzG149UZ7Ws0I83Rg
	 H2wUNGo9XIB9w/J684Ry/wcvkyYiQIBucnTY9PlU0Ep82LkGtvvQ4zqucSiRJKn06uk/P
	 JwLsIHZLn6LKrP777fwtZ5vzgGHKK0FN9S2miL9NvZJ/fwYKKiNqYhsoWYbpyNutvj7r9
	 VaYOQOmS4xVKRnBl6e9DoIxL5a6eJ3pOKAIQoJFEfCYDyjQVMY6R6+5TIWSb94DiaLq3v
	 2i+RVFGWDrlN86Qut7mwrZCt+LHkzHvE+ymrfy7Fr6HItxlyAiFDhvnPZyok7Gw9W4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=JTlEFod2cjgS0LbAQsWexRzCJ68NZr8rhNXABouJAQw=;
	b=McODVV6NDtEmJ0rwrsb/6Hgl2V66ajgj6yFVTGoRorEK5YcFo3oUX55eJfZDz9C0izTI
	 e2AE+IMD0nTiimbwEtjWHFSJizRoFf5iJZL4TFkLegIz5cLDrkQSb0etqEg5EEJpf0tNv
	 aTcn2bvQ9tmiw6wl7XdlZSOygBoSLMv9Ybv/cyEOwy/StrkPOwxB0xv1N6AqxJsl2Rg25
	 hypC6sbp6MTLQQasuUFSUJaSItqqJ4y6/HdD4+6/tMhuULIAhHa9UVkTWo/gritWQMuST
	 B3t6WZ/CkWAHB6zjW0jhK+GAeQlIb4zSDmhjrpo9SdJzcuJcHFlixYR8CZ7ASnof2bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LhgmYRf9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF925606A337;
	Fri,  6 Nov 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LhgmYRf9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D2E1F008A5;
	Fri,  6 Nov 2026 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984734;
	bh=JTlEFod2cjgS0LbAQsWexRzCJ68NZr8rhNXABouJAQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LhgmYRf9RsD3jkt7XP0j5x6GVceyzZdxPZmBiATz86t4GWKKDfCr1RMuHVQsjnhKD
	 K8hy6v4vBlzaZp8HABomM9YNM5Z2QB91duA/38Ni68uWbp1fKrWiZfq7CMnVN4/DQx
	 4EQEtE84c9EfXGKcRhG88yib2HD5bjNrAgUmxjSfsrUNomwyyRUW6ENDJYFrI7sITI
	 JoLR2yWeFvuJKN+DixGTRz0GQmsFknUviXNyag+oj13tq7yywSBdYxXvj69WU+OaYk
	 2/hJ6Dh6lTz1ItTt+ownJdJdTjfELbifbUKhCJ/qeOOrj+uhKg5rw+Kzb6NkNfnrtH
	 qA8BiWPOgyufQ==
Date: Fri, 6 Nov 2026 09:05:32 -0800
From: Drew Fustini <fustini@kernel.org>
To: Zeng Heng <zengheng@picoheart.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, yang.yicong@picoheart.com,
	geshijian@picoheart.com
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <au4I3E_qcPhIr-Qr@thelio>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
 <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
 <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>

On Thu, Nov 05, 2026 at 04:05:29PM +0800, Zeng Heng wrote:
> Hi Drew,

Hi, thanks for reviewing.

> 在 11/5/26 上午12:35, Drew Fustini 写道:
> 
> ...
> 
> > +/*
> > + * Fill the rdt_resource fields for one picked rid. An rid with no picked
> > + * controller is left untouched so it stays out of resctrl_arch_get_resource().
> > + */
> > +static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
> > +{
> > +	struct rdt_resource *res = &cbqri_res->resctrl_res;
> > +	struct cbqri_controller *ctrl;
> > +
> > +	if (!cbqri_res->nr_ctrls)
> > +		return;
> > +	ctrl = cbqri_res->ctrls[0];
> > +
> > +	switch (res->rid) {
> > +	case RDT_RESOURCE_L2:
> > +	case RDT_RESOURCE_L3:
> > +		res->name = (res->rid == RDT_RESOURCE_L2) ? "L2" : "L3";
> > +		res->schema_fmt = RESCTRL_SCHEMA_BITMAP;
> > +		res->ctrl_scope = (res->rid == RDT_RESOURCE_L2) ?
> > +				    RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
> > +		res->cache.cbm_len = ctrl->cc.ncblks;
> > +		res->cache.shareable_bits = 0;
> > +		res->cache.min_cbm_bits = 1;
> > +		res->cache.arch_has_sparse_bitmasks = false;
> 
> Currently, the driver sets arch_has_sparse_bitmasks to false, causing
> resctrl to require a contiguous bits in cache allocation masks. For
> example, L3:0=3 is accepted, whereas L3:0=11 is rejected because its
> set bits are non-contiguous.
> 
> The default should allow both contiguous and non-contiguous masks,
> provided they satisfy the other mask validity checks. A contiguity
> restriction should only be imposed when a specific hardware
> implementation can't support sparse masks explicitly.
> 
> So I propose enabling sparse cache allocation bitmasks by default.
> Thanks.

Good point, I will change arch_has_sparse_bitmasks to true. The spec
defines cc_block_mask as one bit per capacity block and there's no
contiguity requirement.

> > +		res->cdp_capable = ctrl->cc.supports_alloc_at_code;
> > +		res->alloc_capable = ctrl->alloc_capable;
> > +		INIT_LIST_HEAD(&res->ctrl_domains);
> > +		INIT_LIST_HEAD(&res->mon_domains);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> 
> Apart from this,
> 
> Reviewed-by: Zeng Heng <zengheng@picoheart.com>

Thanks!

Drew

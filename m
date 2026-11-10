Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352670;
	b=lcijpXX4iPwb1s3PmiLRNCDQW7JbxE7zr+/YZETz5FC6nbO+MJ+1Va/luDoPwAGtt6Vd
	 H/rYWBQCcsHdwtOSf/khQIwg+PTRtVckbPzWeskhoGVuCxZakvxxx9XzffC/hJ/wFQRZ0
	 URL4XM5G4PEV1kDzA+eKzQT++WAN2o8Tp4Gl0Ab+/+2GKg8Rj3s9KemH9APzVb351b78r
	 npfK7zd1INW2BL7J0bNYyCIOYFH0AnLKYi+7c0JUG1t1SSEZ3oZJO5Ys772geizvsTKN4
	 d7MfNiiW5ODB1fBIAucMZ7Dle0kEZsPz4amC8V48PkAW1Q9tkC7Sw8dY0LnCbxEdxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352670;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gbmiIYRmaOIY16FesNo5fSYIqv3eyHrsXkU16JRHHC8=;
	b=sNSGPDwBY/Ozu2lOFNE6Om11b9Q3E9fc9pq8EjN7BrAIDqTxlBUK9EcNRds2BpUtMtNO
	 Ri6BqqI5IFn0dohyxcFrLFiDfDEBTM/vuJe62q8Gjn9k+BsH5JtTMaTzlfikmh1+bW5fU
	 N/vObU/JQ+QN33zkQQz4q7NrEYoEqiWsarcRgXjxicEC0GnE0Zz+24yk4QXe60UUqfsEs
	 axrfN3Ah+uyIeXqxG514jkt203knoSJ7/v/efShqhjqObi0bgV1FyrEXgpQ7CncJ8kA2C
	 fKgQGxU4HXVHg3UxtVPvTJEEo9/whPEtajYcv8WXmiqdMicOh7hg2tz0ttBPCqQagCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJS6b8KC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26328606A31C;
	Tue, 10 Nov 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJS6b8KC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F361F0093C;
	Tue, 10 Nov 2026 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352670;
	bh=gbmiIYRmaOIY16FesNo5fSYIqv3eyHrsXkU16JRHHC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJS6b8KC1LJY2RUo9wiF5fL7kLRtABCnBxnzmLOUAlldosxNl2+W+GTjJBDvaRBvm
	 Fu2jpwZwDfWPJ2Hqn4VF1ipfVWnrZzCXNFfVTAjGpVQco5nVz9fomH48P07U7gOa7Y
	 rBitF4k71S7d2mXqcdSux3x4V1b5ZJdWi4ALo3+PHFAcr6ya/VnZyaxd6lTF/6eJsF
	 qfI6EJ+cBIAy9kjD8xtvz7qV+Zsgv9AZwwuA6BYoRf/yZmlEI1gbohNlcix4uQCcYY
	 1FlJW2JOxAPpUPmbEibgKU0ZWnYf5FOSUaMZ43Jyjnk11EMXIN9uy4Uu56EJ+DVAey
	 To4C8xAa7SnNQ==
Date: Tue, 10 Nov 2026 15:17:48 -0800
From: Drew Fustini <fustini@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>,
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
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <avOmHFcy/yFOr9YX@x1>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
 <20261108-dfustini-atl-sc-cbqri-dt-v11-2-33a1bf0cf01c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-2-33a1bf0cf01c@kernel.org>

On Sun, Nov 08, 2026 at 03:20:51PM -0800, Drew Fustini wrote:
> Wire CBQRI capacity controllers into resctrl as the L2 and L3 cache
> resources.
> 
> resctrl exposes a single capacity mask per resource, so when more than
> one capacity controller backs a cache level they must report the same
> number of capacity blocks. The same holds for the other capabilities
> resctrl exposes once per resource. A level whose controllers disagree
> is left unexposed. Other levels are unaffected.
> 
> The set of controllers backing each level is fixed when resctrl is set
> up at late_initcall. Control domains are created in the cpuhp online
> callback and keyed on the onlining CPU's cache id from cacheinfo, so a
> CPU that is offline at probe time still joins its domain once it comes
> online, provided a controller for its cache is in that set.
> 
> A CPU whose cache has no controller, or whose domain cannot be created,
> still comes online. It is left out of that level and a warning is
> logged, since bringing the CPU up matters more than controlling its
> cache traffic. A domain is published on the ctrl_domains RCU list only
> after it is fully initialized and brought online, and removed from the
> list before it is taken offline, following the documented safe
> traversal rules.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Hi Reinette, I still need to get more reviews on this series, but I
wanted to check if your expectation is that all the patches in this
series should be merged through arch/riscv?

Thanks,
Drew

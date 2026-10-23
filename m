Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742849;
	b=x56VS0iElH1D23MXlnlLuEUDUQrgosh9fv8IiV3X7wUvVBHgcyklbE9IwhC+9sDxkPs7
	 wk6TPJHiJVaatMQRZrKU6Yvhl0M935FAgEBtVLILwojpu6E6138LlzMove271PsX/aPVp
	 FW2GM6zEvC33UOGtTvdYQCI64kgdNzga5aQYN9DDe4mqMdIA9o+MfpBKc7bWhRX58yKN/
	 F6+YpuiI6E8jWho2mFPsaBAAkDBYRdnrZNF1S/WiqOArSG1euNgzKRldpd+MGqG9RTDoo
	 xL2i2tjSo6gAg9LPAsSo0xTLzodsrK3EP59fdvdFaxgMVgUX0nJeQJBJxC/5BWbp6kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742849;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=za39DnYI6PwBauvj/wHkuaRj9l0qjUTC+TJamDxPLs0=;
	b=lLCL0ZS8unOFAM7thxk+IXIxDwzfUpQLYv1DeU84JP2G05oMoXr3KtYwMs9FvijW1IZA
	 MH6lpPwKIFeVTjkBKlj86hCQDUBqmJySCvRnW29466rB10CpK0MDyKzDUgBU3e6RAplZE
	 4I8F2HH9iWqNCGF7N3HcAnfEd3qdg1/OrFETP+yoQFOmJdJ9Pvhy5R+mc62Cj18poxXZk
	 jaGV5T3PlLD++4sq9dQRv7LUo+qdecUXaRaca+PSMigxxEaHbY88lCooL8pypWRG9VPms
	 qG7xUwmIJr7frG89xwc8+1olXxRc9is65Aup27uE+92kG5sAbPa90rLow1LgCg0kgnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mt9s1K+o;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46496606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46496606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mt9s1K+o
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=za39DnYI6PwBauvj/wHkuaRj9l0qjUTC+TJamDxPLs0=;
	b=mt9s1K+o4qRSEp5QrutgC9tudTuWbsiKE3Ocpd8TTz5F+zq4shs+gF6+fIxWx5rM7aPdfjIfd
	X9D64y0ore6osqlYEBIEUlZXD3fW01A7oS9r/s0dVXiCobya6vUHuZN6zdHybaoy8NMFAsTqaR5
	l8JYV/tkEsurwUBORztnonI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j9wbl581DzmV8k;
	Fri, 23 Oct 2026 16:07:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DEE1B40586;
	Fri, 23 Oct 2026 16:07:18 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 16:07:18 +0800
Message-ID: <cc73fec1-a8a7-4d44-b935-541aba848fd4@huawei.com>
Date: Fri, 23 Oct 2026 16:07:17 +0800
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
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
To: Reinette Chatre <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<james.morse@arm.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/20 6:07, Reinette Chatre 写道:
> mpam_resctrl_alloc_domain() starts by checking that the resource's
> class has a component whose CPU affinity includes the CPU, and fails the
> domain allocation otherwise. When the resource supports allocation, that
> component also backs the control domain. The check uses an open-coded
> walk of the class's component list, while the same function uses
> find_component() to find the component backing each monitoring event.
> 
> The open-coded walk duplicates find_component(). It also holds the SRCU
> read lock until mpam_resctrl_alloc_domain() returns, which suggests that
> the component needs this protection while the domain is set up.
> 
> The component does not need it. Components are freed only when an MSC
> fails to probe, in which case MPAM is never enabled and no resctrl
> domain is created, or by mpam_disable(), which first removes the CPU
> hotplug callbacks and thereby tears down all resctrl domains. A component
> therefore outlives every domain that refers to it. The SRCU read lock is
> only needed while walking the component list, and find_component() holds
> it for that walk. In addition, mpam_resctrl_alloc_domain() only runs
> from MPAM's CPU hotplug startup callback, which already holds the SRCU
> read lock throughout.
> 
> Replace the open-coded walk with find_component().
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9cec5843e8fa..3d5f90f9f1f3 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1623,21 +1623,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	struct rdt_l3_mon_domain *mon_d;
>  	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
> -	struct mpam_component *comp_iter, *ctrl_comp;
> +	struct mpam_component *ctrl_comp;
>  	struct rdt_resource *r = &res->resctrl_res;
>  
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	ctrl_comp = NULL;
> -	guard(srcu)(&mpam_srcu);
> -	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu)) {
> -		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
> -			ctrl_comp = comp_iter;
> -			break;
> -		}
> -	}

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> -
> +	ctrl_comp = find_component(class, cpu);
>  	/* class has no component for this CPU */
>  	if (WARN_ON_ONCE(!ctrl_comp))
>  		return ERR_PTR(-EINVAL);

-- 
Best regards,
Jinjie


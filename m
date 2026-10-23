Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742834;
	b=mkXZqCK5UhApk08VU+Jck2L/XlEQvuHWUl55pA5ZPsiZ2tOVpLJNabxZHOvKTT/snJ4P
	 WWqYnXLdQuAfLenhiIZCGMINN2B0PN9c1MMd/IWDe9XlabOnpT5P41vt1gErig8gdntvT
	 d1siwh5WOKQXeMWJI432zVzM2JFApnaNr90eGcPC6e6yv+JARG4I6oytrE8dk5gKrjyki
	 GYLnbJx+vavqXtiWOZEEWFyJo6/SSf0pWOGgwKwQ8LYzUSTf6KDWyZN1VIqlX18K2T10k
	 s6PVobyfUJxeClrLUAysrqBj4ykYQxsM25jhrdkyXYtAGoMeLzMNLN+6+7Xx6rlBW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742834;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=za39DnYI6PwBauvj/wHkuaRj9l0qjUTC+TJamDxPLs0=;
	b=aDZ0UfhwT/wm0W7g85YVfk5Xi93cO/jIjeHdhgY6ScZ3oeSs1dL2UadE18v8kmbm2uBD
	 K263//7zqcD3HVegoLOa6Ub1cKn4Jefz+3UQm4sS1W3zTHQIde58y9bLZ9ANe5ZaHgtcK
	 HJoQF6svHlDzc8MVlONk/umCEE92IVrBDN4xfyuNcATaRt8qcZ7yV+52L8rFKcPsGFIpq
	 F3vqo4O5TWbts6NgV9GFVuSwQ61MLuTJaw1GKnWu4ZcM7hiRy8w6tNHuftyP+SBuSkpJB
	 zCstbKZEhK0iIIUzzbJfHT7MZkrUtpaRQGGdMEBbDb8/hxMjO1NmoQVXp/471QBRFhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962F0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=za39DnYI6PwBauvj/wHkuaRj9l0qjUTC+TJamDxPLs0=;
	b=mt9s1K+o4qRSEp5QrutgC9tudTuWbsiKE3Ocpd8TTz5F+zq4shs+gF6+fIxWx5rM7aPdfjIfd
	X9D64y0ore6osqlYEBIEUlZXD3fW01A7oS9r/s0dVXiCobya6vUHuZN6zdHybaoy8NMFAsTqaR5
	l8JYV/tkEsurwUBORztnonI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j9wbQ524jz1K97x
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:06:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E54A34057A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:07:03 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 16:07:03 +0800
Message-ID: <a4655252-e15d-4ee8-811d-b678d3a4bf05@huawei.com>
Date: Fri, 23 Oct 2026 16:07:03 +0800
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
To: <linux-kernel@vger.kernel.org>
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


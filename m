Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156093;
	b=RTnikc8GNFKnnPyMomYp+Qd6s06eVjr1XgUR2oEFUNtzLMH4+toebOTarsZEm3w8/aUm
	 6S9F5VNV2YmW5LWahpK/ypQWHjjIyAVKG3BOrb/Y18x463LldB9ltQwEAbPlPA3N/tg44
	 eZXvkfeyej2UVuuQzmuo1M+m1bfN79KNzBwGbe3jCbN6ubEBsgX+rOie81Uj35AUAOou2
	 PmZ4RRhSecDeuZZB4Siq9t2uhOB7zjV7mz3uzD69rk7w9T6Tm30uAbhjjXg4iZYQIc6iE
	 Pi99n58THS8Vu0RhXb8zHO5NuGS/r1uPj+6ued1g4dDg816MK6wYanyfSTeQIU3Oa0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156093;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3JxJ1mJkAP6YmKqJllwbCK5BL3rqP3akD5+1IOa+bFQ=;
	b=iTzGqlH3EG2X4veJHhrAuKxFQOY/lqElzO5tkRWFrOliBT8sCnITQJqydH7yDNOzF0AJ
	 G/Db4VhEOhxGpqEqeJ3kQNDO4OCMJHFPiNNDmhsfQu3MbTSgCSs1mLa20L1XpaoihG3WU
	 6Cf8jZsmJApvPZuSwLgXnTPXHm8e4C+T+wgIyHGFCPK9uIT0YN8jbaldhQB5jEVEw6NMQ
	 UXZmpyxOSonkuQoP7aIjByqKuqDc3LgK7sTN6W593V7dbKtqr19zUNgpt1dJSmtamxH2I
	 XdkUCHI64ymtKzkxPjXniYF4aquPKPU2NeWk1Gog5VQGG19NExML/Aa5U9TRirlbiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bNhVfT4y;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FADA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bNhVfT4y
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3JxJ1mJkAP6YmKqJllwbCK5BL3rqP3akD5+1IOa+bFQ=;
	b=bNhVfT4y44F46JNCoeHa7HQ9DTkar8M1LnxbRMIh7jithuf9TOZMLVbLUTl/wksEzUTuui4VE
	R8NIFIFQvN63nBQHDaD8dW9ewkumziT3EJ9WlALYFyb0pz8un/QzdgDOh8ldQ8ipUCNTfP3x0r0
	np6BKxqbTzQidblJke+l2Ws=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jDsQw429Tz12LJd;
	Wed, 28 Oct 2026 10:54:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 81296202E6;
	Wed, 28 Oct 2026 10:54:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 10:54:42 +0800
Message-ID: <6a13d463-b37e-45a6-b4f8-b7a28df24df8@huawei.com>
Date: Wed, 28 Oct 2026 10:54:42 +0800
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
Subject: Re: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing
 down a class
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dave.martin@arm.com>, <andre.przywara@arm.com>, Sashiko
	<sashiko-bot@kernel.org>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-13-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260917145617.2202986-13-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/17 22:56, Ben Horgan 写道:
> An MPAM class can back more than one control and more than one
> monitor. mpam_resctrl_teardown_class() iterates through all the controls
> but stops if it finds a match which means classes backing more than one
> class aren't torn down. The same for monitors, in which case the mbwu
> counters will be leaked.
> 
> Stop terminating the loops early.
> 
> As we are already changing mpam_resctrl_teardown_class() remove the
> misleading comment. It doesn't call resctrl_exit() and isn't required to do
> so as the only caller does it first.
> 
> Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v1:
> 
> New patch
> ---
>  drivers/resctrl/mpam_resctrl.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 321741a702fe..9cec5843e8fa 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1943,10 +1943,6 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
>  	mon->mbwu_idx_to_mon = NULL;
>  }
>  
> -/*
> - * The driver is detaching an MSC from this class, if resctrl was using it,
> - * pull on resctrl_exit().
> - */
>  void mpam_resctrl_teardown_class(struct mpam_class *class)
>  {
>  	struct mpam_resctrl_res *res;
> @@ -1957,17 +1953,14 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
>  	might_sleep();
>  
>  	for_each_mpam_resctrl_control(res, rid) {
> -		if (res->class == class) {
> +		if (res->class == class)
>  			res->class = NULL;
> -			break;
> -		}
>  	}
>  	for_each_mpam_resctrl_mon(mon, eventid) {
>  		if (mon->class == class) {
>  			mon->class = NULL;
>  
>  			mpam_resctrl_teardown_mon(mon, class);

My LLM also found this problem.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> -			break;
>  		}
>  	}
>  }

-- 
Best regards,
Jinjie


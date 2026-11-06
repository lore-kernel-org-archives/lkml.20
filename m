Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954144;
	b=1rjglWW546C+DeDL5j3WtWN2TCv58Ts9oS0Y/YLb5ZWMm1d5A8VeLkajQ8IeqGoQ8QoM
	 ULuLWTe78ePXQwBn4ojM8rT4Ct/xnW/EPJcyBxx8ducV7yXHFttU24HhcFlVH4OsDL6Gi
	 Gp90c5D1eQANHAf7HwVX0ZTmQoWM+0jWPVIwELwTobTfyDBJ9FT2nAJsxsk58Ot+1NaqO
	 5ETraOFRravXiMqKIKYMNNSTc5m0bY+LyBvB1XtY1uS1TePribFvNUh1TDlcrDWE3lZFh
	 4hSrLiWKuAekgaruwZdJz4YeYxghVRxw+Hot7lQX+EVlwfqRG+kmUboSwk003wtNDdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954144;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=4OhIx2AoDO+FOC7guiaqcE3vlnq2l6R3lz4OdyJvCPE=;
	b=HJgcDxHKVQ/2wQOCmGNS1xjQ536d665euxUz6rNq5ir55h+6QQpTUAErsvXla5FYfsGo
	 gEk2Yzki3E3VU9+gWRLe6xszVKdPTYV46tH9BodQJ9RD8rnhHrru6Fy6wCH7yaz0YHjrT
	 cvKATBkuB8gBXSVyWvBXRjrU3zuaWeEHEK9EvEKtKNsENqRYISnlvqrWPbGLZUrXXsUyi
	 tLAwvNHzCa6SWGLfGN6mJBGv9KUak88XNOd13QvnGMm4/AxxMOUB8PMoMMkTMZ+b0zp3T
	 E0N+RDFFA+Y71X0Z+A7DENYQ5n5jBozIVJax1rr6ODZ18s9LlTMVMGjJyE3pHT+Km0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Iz9X/SW8";
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EE3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Iz9X/SW8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4OhIx2AoDO+FOC7guiaqcE3vlnq2l6R3lz4OdyJvCPE=;
	b=Iz9X/SW8wJDPXz0+6M0Uit9z4wuo3nyxbBf/RRww9IaaX9NR/i0+qCYBk9jO2AQFaev46W4D1
	T6Cf7EqZouUeIQRQ5Xltx2H4qoFisvxCSAsB2ugkmA9VQ594TSkgqN/URN9zljCUpwXpl+1lilR
	4eqI/AodKGm9uZNSqubuHDc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jLXYc5dv7z1T4M5;
	Fri,  6 Nov 2026 16:35:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ACBD40641;
	Fri,  6 Nov 2026 16:35:39 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 16:35:38 +0800
Message-ID: <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Date: Fri, 6 Nov 2026 16:35:37 +0800
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
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261031025257.1540228-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Ben,

Is this modification okay?

在 2026/10/31 10:52, Jinjie Ruan 写道:
> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
> recorded CDP as enabled, halved the monitor count and turned off the
> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
> two sides out of step and the halved monitor count and the missing MBA
> control are not undone.
> 
> Check the PARTID limit before anything is changed so a failed enable has
> no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> RFC v2 -> v1:
> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>   remains in place.
> - Update the commit message as Ben suggested.
> ---
>  drivers/resctrl/mpam_resctrl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..aa3b3a093857 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (enable)
>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>  
> +	if (enable && mpam_partid_max < 1)
> +		return -EINVAL;
> +
>  	/*
>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>  	 * false on error and unmount.
> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>  
>  	if (enable) {
> -		if (mpam_partid_max < 1)
> -			return -EINVAL;
> -
>  		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>  		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>  	}

-- 
Best regards,
Jinjie


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090159;
	b=4SzWQ2bLsNNTqgovFR38iKI6UwOconK8gXPzdAxaVrE6umIme6AWwhfMUF3WAyuvOFEo
	 xVJSwqN6Agyfj8b5w2egDifstjjZd/6vZiX6nha07J17dVzTVKW3flVlTGQQgMeLikIq6
	 kAqasfF0HrBMhBLUamCZGNed9qme6giIJfokVg1aj0dFEAx7/IVv/A5dmyD/T+Ror+KW4
	 pjbrBK5ExHS+4prFUDKESqifR3lnk8aYMc07oC+56soBDcT5uTyyO8ozviA8bgtLls+Me
	 ub1yhVOAxl6fbHdw+U/fo+Q2QnaDn5NGON+JbxrZVXsoQby9iMXMfd8mNAIy1KT1Oyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090159;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=r8waEYcnEw1hlf3SuPw4jP0Swr2QvkGfUkwHSVOdcsw=;
	b=FXxSZVTCiFHm3+XEwyeij4sV5yHKeC/OIIMBaRJsmy5h/WrinCLgHFYSpcSSysexV3h5
	 Ud2PdvipuCJOdMA/CkBxlueMGXDNNbNDC92p80C3lcLMpEvLvBzRQXLsySvSp722ift9d
	 E2IqpXyLv6KR4tdVM1f1cgs3Luc7fIMgnSns8Bh1rdqXeVb29bOwloo16CIReVreIB8s+
	 tzbV3u6aRWs6M1CUO/VPAD99ccMvUN5LJjGtqZuu/QyyLc4Vi9YemAPcbAxZnz9It/Q8I
	 XutVm7D7Ty6o/rbdYkR5r/Trmv7IOg3Mfg7KzhWX023u3b5pEZ2bq1sXCAq0UcaU+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RQOz9WdJ;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFB8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RQOz9WdJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=r8waEYcnEw1hlf3SuPw4jP0Swr2QvkGfUkwHSVOdcsw=;
	b=RQOz9WdJvH0DYcX6FjYb4KVUl5YwVa4ioOa7JqDq1gaOBB4Fr9LJTYzoafzf8czKB196xV1Mm
	He4MzX/agDJbG4jMGvzgYbeu2L0l89JUuPjJ73JlnrVFG93SNx4G8FGbM58kBOaXmLalUDkxi/I
	Zlbbc1NFo5YMwYFasJZJ6dI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jDP2j4tJnz1K9B8;
	Tue, 27 Oct 2026 16:35:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6723A4057A;
	Tue, 27 Oct 2026 16:35:49 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 16:35:48 +0800
Message-ID: <4b671902-3cee-436c-87fc-55ec1cb14782@huawei.com>
Date: Tue, 27 Oct 2026 16:35:47 +0800
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
Subject: Re: [PATCH v2 5/5] fs/resctrl: Drop unnecessary parameter from
 resctrl_io_alloc_parse_line()
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<ben.horgan@arm.com>, <james.morse@arm.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <bp@alien8.de>, <tglx@linutronix.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <fustini@kernel.org>,
	<fenghuay@nvidia.com>, <peternewman@google.com>, <yu.c.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1791406459.git.reinette.chatre@intel.com>
 <b01d58ebb13c6cadd68c0fb33f469fdb32dcb597.1791406459.git.reinette.chatre@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <b01d58ebb13c6cadd68c0fb33f469fdb32dcb597.1791406459.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/8 5:06, Reinette Chatre 写道:
> resctrl_io_alloc_parse_line() parses a line written to the io_alloc_cbm file.
> It receives both a schema and a pointer to the schema's resource. Its only
> caller looks up the resource from the schema just to pass both.
> 
> Passing the resource separately is redundant and allows a caller to pass a
> resource that does not belong to the schema. parse_line(), which parses lines
> written to the schemata file, already receives only the schema and determines
> the resource from it.
> 
> Pass only the schema to resctrl_io_alloc_parse_line() and have it determine
> the resource itself, matching parse_line() and in preparation for passing
> additional information when supporting multiple controls.
> 
> No functional change.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since RFC v2:
> - Rework changelog.
> 
> Changes since v1:
> - Rework changelog.
> - Add justification for the change. (Ben)
> - Add Ben's Reviewed-by tag.
> ---
>  fs/resctrl/ctrlmondata.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 4562072b8ba6..69123b2a3274 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -955,11 +955,12 @@ int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of, struct seq_file *seq,
>  	return ret;
>  }
>  
> -static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
> -				       struct resctrl_schema *s, u32 closid)
> +static int resctrl_io_alloc_parse_line(char *line, struct resctrl_schema *s,
> +				       u32 closid)
>  {
>  	enum resctrl_conf_type peer_type;
>  	unsigned long dom_id = ULONG_MAX;
> +	struct rdt_resource *r = s->res;
>  	struct rdt_parse_data data;
>  	struct rdt_ctrl_domain *d;
>  	bool update_all = false;
> @@ -1052,7 +1053,7 @@ ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of, char *buf,
>  	io_alloc_closid = resctrl_io_alloc_closid(r);
>  
>  	rdt_staged_configs_clear();
> -	ret = resctrl_io_alloc_parse_line(buf, r, s, io_alloc_closid);
> +	ret = resctrl_io_alloc_parse_line(buf, s, io_alloc_closid);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	if (ret)
>  		goto out_clear_configs;
>  

-- 
Best regards,
Jinjie


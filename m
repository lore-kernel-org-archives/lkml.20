Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7F3090D7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108144; cv=none; b=UZv2YHvPeLOC0uZ2gChHVQnKJ6yEup8whxLfhXYoGx5A+hAwmr5Da4Uz0q549gHiQDGp6Bd9hycQtMMdP06uti32pNGV1euJK8x2eSKJGQ16kCzfPZNvtWPJi49e4ZtsLvXMHAMRULio/hV5tm8BFCTzDxNy6X9fIlVuyJsmOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108144; c=relaxed/simple;
	bh=i80jw/NqIjhMLAn2RHwM4Rqboc1qH4g4wtYcz6C5k1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssDJwajuE0trXcDZlPd/+7Oql7CYMr0/oCTRjghwUZNJ91pZkJQtm3hhcLkqg0fdQv9PwAtpY+g38TDtrckiEvZ1JoLRPcBIKvsS7uosIkOd7zu8NcMLHhwO/QkKBMibavyEvfRdK7ELx51boki5UAN0xbSMwYNlMuFfvr2+WUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsTna/se; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsTna/se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5FB1F000FF;
	Tue, 22 Sep 2026 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790108120;
	bh=N91SVj4dGNfVTdz6Q74wxW7aqp04u+n1h4aV/18PiJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsTna/seF0wuALiN+6PRmgh3vjOoJ0aDpI9t8aPshtRG5IgVSu3I3tri8CiIkSqA2
	 uBpBmh3r1iR1pxLTPybHkvrK5JDf2CR10SwCwDMylpksARQbpKgOEyc08Gouf3IW3Q
	 x37C13iIHpYADmQ82jqWElpXx7rKzpgivlzBQiIElfD4yNTQIagFRthYW4onXT8UeI
	 XwqvbccbrInwp5brVFn0HfzD4kCCAgMFOtDBt4kGi1tk5w3gTOk8dCGM/Mx38ymcZj
	 EvYkQpPdM5h2cYFukO0M7XW1M93hzTFKHDnhnKNHc/VDgFlSiQruKTnlWy8ep3VsT1
	 VnFFO27Pt2UZA==
Date: Tue, 22 Sep 2026 13:15:19 -0700
From: Drew Fustini <fustini@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, Dave.Martin@arm.com, babu.moger@amd.com,
	bp@alien8.de, dave.hansen@linux.intel.com, fenghuay@nvidia.com,
	james.morse@arm.com, linux-kernel@vger.kernel.org,
	peternewman@google.com, tglx@linutronix.de, tony.luck@intel.com,
	x86@kernel.org, yu.c.chen@intel.com
Subject: Re: [RFC PATCH 1/3] fs/resctrl: Add schema_name to struct
 resctrl_ctrl
Message-ID: <arLh15FAVib_554X@gen8>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
 <20260921135702.2874931-2-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921135702.2874931-2-ben.horgan@arm.com>

On Mon, Sep 21, 2026 at 02:57:00PM +0100, Ben Horgan wrote:
> In order to properly align the schema in the schemata and size file the
> maximum of length of all the schema names needs to be
> known. resctrl_resource_ctrl_max_len() makes this calculation but stops
> short of actually constructing and storing the schema names. As the schema
> name is based on the resource name and the schema name with some special
> cases for legacy controls this leads to a lot of conditional formatting
> when displaying the schema name.
> 
> Construct the schema name and save it to struct resctrl when mounting
> resctrl. This makes displaying the schema name easy whilst control of the
> naming stays within resctrl.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  fs/resctrl/ctrlmondata.c | 51 ++++++-----------------------
>  fs/resctrl/rdtgroup.c    | 69 +++++++++++++++++++++++++---------------
>  include/linux/resctrl.h  |  1 +
>  3 files changed, 55 insertions(+), 66 deletions(-)
> 
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
[..]
> @@ -638,18 +608,17 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
>  	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>  		list_for_each_entry(f, &rdt_resource_final_all, list) {
>  			for_each_enabled_ctrl(ctrl, f->res)
> -				seq_printf(s, "%s%s%s:uninitialized\n", f->name,
> -					   resctrl_ctrl_is_default(ctrl) ? "" : "_",
> -					   resctrl_ctrl_is_default(ctrl) ?
> -					    "" : resctrl_ctrl_name_str(ctrl->name));
> +				seq_printf(s, "%*s:uninitialized\n",
> +					   max_name_width, ctrl->schema_name);
>  		}
>  	} else if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
>  		if (!rdtgrp->plr->d) {
>  			rdt_last_cmd_puts("Cache domain offline\n");
>  			ret = -ENODEV;
>  		} else {
> -			seq_printf(s, "%s:%d=%x\n",
> -				   rdtgrp->plr->f->res->name,
> +			ctrl = resctrl_resource_ctrl_get_default(f->res);

I think f is only set in the for loops, so should this be
rdtgrp->plr->f->res instead of f->res?

Thanks,
Drew

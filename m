Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE40213E9C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954160; cv=none; b=YVkTqSoxoswgO1yZA/ZKM/sbaKBcbdHueH33YIS9tFcMW/WwT9GIB3UjHaKnzMSQHtqiiVskxHbm7jvrtHU28L4PCyghX8WUpwocaxKXqbJxb6UcH0jwmsz+oRD3eLXJHhkvNDV2rLTZnp3ymUBxXg0h/l7TbJbeXWctExlcV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954160; c=relaxed/simple;
	bh=iakz7poMJpgb4bw15P/OQM2oL+nxxLe3U5uJbeo3LrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZidSqyfWsDLx7yrDlXVPFBYuWxG5U/AAbAu3YZWD1OdCxnMUoCs4RjJmwHkW427+WRGnPk56FxxUETXtQOynYalvl+O8IEgG5Tv7aozWAIIAVXmyJub/B5DS8ZWHV/Za7rM3V5c7auwEBUcvZoMmHBSG5zEufUT2nMqxQIvO5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=arA/J/WZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="arA/J/WZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D078F143D;
	Fri,  2 Oct 2026 08:15:46 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 244353F85F;
	Fri,  2 Oct 2026 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954150; bh=iakz7poMJpgb4bw15P/OQM2oL+nxxLe3U5uJbeo3LrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=arA/J/WZ+w6g8dMXcS19DNm8BTe1LBTPxqOT6bKORmxHtiqVvudln81TTLXydbblB
	 lu32Vhz8cct+Xq0RSjCx2WromK43ppQ0m3Qh2240HLaN0w2XL6hqrm0MGk3kSlu+Ge
	 sqO+COS3NDCpJoP+s5pMkW4DhWwDwItpeb8LMkx8=
Message-ID: <b0c756ac-7dec-4b9f-a9e4-16c16a890cec@arm.com>
Date: Fri, 2 Oct 2026 16:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] arm_mpam: Initialize all of struct mon_read in
 mpam_restore_mbwu_state()
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-8-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-8-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> m->err and *m->val may be read before initialization in __ris_msmon_read()
> when called from mpam_restore_mbwu_state().
> 
> Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
> the spelling of mbwu in the name.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 62562ce2f9aa..cdc2d9d19e19 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -1672,14 +1672,17 @@ static int mpam_restore_mbwu_state(void *_ris)
>  			continue;
>  		}
>  
> -		mwbu_arg.ris = ris;
> -		mwbu_arg.ctx = &mbwu_state->cfg;
> -		mwbu_arg.type = mpam_msmon_choose_counter(class);
> -		mwbu_arg.val = &val;
> +		val = 0;
> +		mbwu_arg = (struct mon_read) {
> +			.ris = ris,
> +			.ctx = &mbwu_state->cfg,
> +			.type = mpam_msmon_choose_counter(class),
> +			.val = &val,
> +		};
>  
>  		mbwu_state->reset_on_next_read = true;
>  
> -		__ris_msmon_read_locked(&mwbu_arg);
> +		__ris_msmon_read_locked(&mbwu_arg);
>  
>  		mpam_mon_sel_unlock(msc);
>  	}


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

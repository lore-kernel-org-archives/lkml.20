Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6974D318BA6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953272; cv=none; b=txFDoVQCcz/AyHu0vZiMfnM2REaE/DkjalY3toC3Zcrw2iQmSVaXmJjQ7sg/2k6gpdTJgdL1DKUQ3q+BNLgBCSszxxkeCVQl4+rtdPHdpDQgEIkdDkNX0g36SIz5SzNQ3XaB9vZH3ni9GxqeX/woF0V/Bgyv9kGgEFMDzndl/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953272; c=relaxed/simple;
	bh=2Uec7YMLA3YtX9l/GqLdQY9WQiK6dogPMfFk1LOU2Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHu2OPb0z5eESx3L1EJX0fRkXQiysMGuBrgslgtHRK5Mhtk7yBLKTeykxtjSctnu4ZB7zX9cNgPDbwwXnxB6rZ+JUSGpn0jUhTJUi0YMbM0V61h+DB9i0bhX2GURo1VSB0DuqgOKIPFRSvw0hdG9XBCtkHV0fABjvUjl97z7D/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m9ldiA8d; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m9ldiA8d"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F4A497;
	Fri,  2 Oct 2026 08:01:06 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF393F86F;
	Fri,  2 Oct 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953269; bh=2Uec7YMLA3YtX9l/GqLdQY9WQiK6dogPMfFk1LOU2Xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m9ldiA8dmOka54o0DFRxxQZE8JFkOcuXOfyF4BykbrsiuJQiNrpI2xso66KWIPef+
	 HOiX/wkaMjY8waAGXcqEjc9YU2mhPVkfTpuSkRabqjqWfEF+6x2C42amSlQgWLk6ND
	 Ol2Dp/TipodWyE4VKoSS93Mp9RRuLuRkrwClrNu0=
Message-ID: <d54c7220-e47a-4ea0-b494-6efdfb47f61e@arm.com>
Date: Fri, 2 Oct 2026 16:01:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
> field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
> MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
> indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
> counters then there are always 31 bit counters irrespective of whether
> there also long counters.
> 
> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
> counters.

Yes, that bitmap is supposed to be what is present, not what the driver is choosing
to use.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 32bde94dfbc3..e349db525882 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>  					else
>  						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
> -				} else {
> -					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>  				}
> +
> +				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>  			}
>  		}
>  	}


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

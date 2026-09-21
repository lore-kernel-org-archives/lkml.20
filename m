Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA04BA1CE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999694; cv=none; b=dNhQs1frWGkEKEVDqEGMz3qqLTgpcHo2bXwkw78qKX/vat6M/6Te3rvq5jBNH5IE/1RhZSieejEGjOoCWhehOaoL2hrcuZWnAtoct6wh6VN7B6O3/d21Z7do9jgtYv2W0+HXkZE44rk90ef5hhVClSpcEufDU6THob06iaZLnNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999694; c=relaxed/simple;
	bh=HhFQAiv1nysEVqndnw2++GT0K3KYI3QnFbjxKk7BGnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQ/PAchTBBd3dpV2B8QIf9jXNUOv9sjpxl3CissxqirqGWdtcx7utjpyRcW9emdxyDG3YwMLswoc0O62W0fWSo7wui6dTmovwdkVuB37+PQHvrfav2EK1wccynsiQrWpqpT7kSbUVAfmAXlPgKZ2ppFzqaoVe1IerV/7A55qwJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ONycf/k3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ONycf/k3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB2EE176C;
	Mon, 21 Sep 2026 07:08:07 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FB5B3F86C;
	Mon, 21 Sep 2026 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999691; bh=HhFQAiv1nysEVqndnw2++GT0K3KYI3QnFbjxKk7BGnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ONycf/k3/SygxjCd7IHLVXJ6+9Ju0DDi1vrYa7U1nVMkYUJSyhUgJehEGK1Vp22de
	 TdL6XjgnbuveAHzq8T5denRJmxUKlvOl/1RtrHLCjMvaBWulPYcOCWDukRASjuVKaZ
	 yzptvoEUrM1aqoYm2KxlodDIZiV0Yb+xpM1EQcZY=
Message-ID: <c2e84f24-e3bf-4d18-b873-bc17546f4c48@arm.com>
Date: Mon, 21 Sep 2026 15:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Suggestions for cache scalar controls
To: reinette.chatre@intel.com
Cc: Dave.Martin@arm.com, babu.moger@amd.com, bp@alien8.de,
 dave.hansen@linux.intel.com, fenghuay@nvidia.com, fustini@kernel.org,
 james.morse@arm.com, linux-kernel@vger.kernel.org, peternewman@google.com,
 tglx@linutronix.de, tony.luck@intel.com, x86@kernel.org, yu.c.chen@intel.com
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260921135702.2874931-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/09/2026 14:56, Ben Horgan wrote:
> Hi Reinette,
> 
> I'm posting as a reply to your series to try and keep things together.
> These patches should just be taken as suggestions. The first two
> patches make the printing of the schema name simpler while keeping it
> out of the arch code. The last add support for scalar cache controls
> in the size file. I found these sufficient to add support for CMIN/CMAX
> on top of MPAM. I'll post these separately but if makes sense to you
> feel free to incorporate them in your PoC.

I've just put these MPAM changes on a branch here rather than making too much noise on the list.

https://gitlab.arm.com/linux-arm/linux-bh/ mpam_controls_on_generic_schema_poc

Ben

> 
> Thanks,
> 
> Ben
> 
> Ben Horgan (3):
>   fs/resctrl: Add schema_name to struct resctrl_ctrl
>   fs/resctrl: Use correct schema name in bw_validate() last_cmd_status
>     messages
>   fs/resctrl: display size for scalar cache controls
> 
>  fs/resctrl/ctrlmondata.c |  59 ++++++---------------
>  fs/resctrl/internal.h    |   4 +-
>  fs/resctrl/pseudo_lock.c |   2 +-
>  fs/resctrl/rdtgroup.c    | 110 +++++++++++++++++++++++++--------------
>  include/linux/resctrl.h  |   1 +
>  5 files changed, 91 insertions(+), 85 deletions(-)
> 


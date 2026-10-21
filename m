Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574771;
	b=RaiarjKltoeI4ihYXfDQpYjJWw2xRfLJQ1EkEoh5Bw0wxjtrZchpk0cFk1lrArz/RcG/
	 eYE79+ARq3vWHWGz9W9KBSFi02AbyCLYjwS90+cZLDl4HhhccVCh1TJp6n2me/XLbyDcT
	 arGFiJG8s7zfQ1qr3sEuf0C+IFbstlaDyyi6xlhDwuijSby5f3Og5Ikoh0tbflqCu+pSI
	 ucabGnrUlPdfgfwgogVNIFM4W9B+FF3uSdjpRydw84F/l32uxM0Go3UH2lC27ZnlZMD2g
	 mBMpJRN5cQ/dBFtjgY4QM5/VvJ0E4gF6MZSr9nwPhypJ6A3UR/NRu7abQgc7llcsnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574771;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5NSvfLE1NFGHuHhVgj8eEQzJdRfw1ghMvfCC3P4c9eM=;
	b=rP9vpzD/0tqRKQV0GwttMIU71QWOuzmKu1PaU0chQT7PRc08zgpxZSU3gcHa9lYoCydu
	 jeo1Xp5WXdD1FQWGKdLH2iP1t9Epop534EW/OgEUNpuC1gEku+HhcAwzpYBoKdI5A6DtW
	 kiWPT/DZpuNigVP4BpSvW3iQiUEdBtV3yGjUNpgSiXLmXLewrZG4ZbZRaVqzcSUo8uSRp
	 XaxfQJqLdqvmKWUn35nRMKB/sFhiu2s+XVPVYBH9v0dsxm/PXlelBUM4mkufZ3y7Aw6Mq
	 TR78VV6rhryvTW5gFuTCJxIHNwmZqv5fEtZC13Q1Wto52pnZQRXNaUufnk0r7+AkGNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XKrALMtX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0886606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0886606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XKrALMtX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9EB72720;
	Wed, 21 Oct 2026 02:26:05 -0700 (PDT)
Received: from [10.0.153.134] (e142021.arm.com [10.0.153.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B7B3F7D8;
	Wed, 21 Oct 2026 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792574768; bh=RcUVXWcp7EOL+dU9VEwm/n2B8NbJB9AEP0xAsiqiyiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XKrALMtXRKPK2cxv4moI9F8m0dt+nQW5yilJlFHkn6Ye4o+DQQrU+HPJit16Vn40j
	 4i19cfDR5agLapAUD2dyr4YiTVYHLgCOe4VxLNk+tMcIxefyComHcqmnDOQCZIpeH6
	 wsPSHyaDThCb42a86nbRTmJF1Oh12OKbeJIjqhkA=
Message-ID: <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Date: Wed, 21 Oct 2026 10:26:06 +0100
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
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com, ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/20/26 13:48, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.

many thanks for spotting this!

Similar lines were in the last patch version sent out, but as Ben 
mentioned, this somehow conflicted with the other MPAM changes, so it 
got accidentally removed.
The original version always returned -EIO, but we now always use this 
error code inside mpam_fb.c already, so there is no difference, and this 
version here is more future-proof, should we lift the restricted range 
of errors handled in the future. So:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre
> 
> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>   drivers/resctrl/mpam_devices.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..c067b6d57d71 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>   	struct mpam_class *class = ris->vmsc->comp->class;
>   
>   	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> -			return -EIO;
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
> +		if (ret)
> +			return ret;
>   
>   		mbwu_state = &ris->mbwu_state[i];
>   		cfg = &mbwu_state->cfg;
> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>   		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>   		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>   
> -		if (!mbwu_state->enabled) {
> -			mpam_mon_sel_unlock(msc);
> +		if (!mbwu_state->enabled)
>   			continue;
> -		}
>   
>   		val = 0;
>   		mbwu_arg = (struct mon_read) {
> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>   		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>   		if (ret)
>   			return ret;
> -
> -		mpam_mon_sel_unlock(msc);
>   	}
>   
>   	return 0;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad


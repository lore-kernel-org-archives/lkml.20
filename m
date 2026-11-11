Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391934;
	b=NE031NXoIBWKY15WtxfILrSmr4/y0jkhi8VabzdOcacG8Vok76i/Sq8xflvN3JaYXsI+
	 HpOQan74jzYyE4GXm4LGXZIABjz4m1SpEoiqmUs1/myp6GIBAXBMat5qUrd62H2lfBboe
	 o+ye3zNcPcG4SHKjiF5KpjyXJLrS+fn1svmE56bDl7dqmOJChwwqAcY7QcKsP2M2hkBHQ
	 R35KIgozkVpSlD9aKFYRkX/tEgeHXOdhtPt1obASSk3fsYB6z3tliExoBJ1O+wnu7pTw7
	 LkmaMrkEmUxBSwkdzesfS5x91QALo7Uf3N/uqXMLNj6WqcMPvsJksnQT5IhO52TicNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391934;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hHQyFW4WDyn4mLXFARFmt5ZkxCsNrkcbE49/jauLnzk=;
	b=JzvLYuOi8RHTWZHRgDVXEiJi5dtVSXP1twwj20/qr6si69xPoVJF/KdA2ZsxeOq9CLKh
	 Tacp3KcEUEg2kN7pRe68t92XDKKAfxbxaW4jngIKsh3rrjWsajAn9zDU6YwIRORafSoa9
	 BDa2+XdjAxAmCfEPaV2apxGZmFgl4ouWuVVe0cSn+Zul8xJQg/H9nIz/xE0z+rhduMPEj
	 MSryI6DVzauKFSfs0ImgR5ZIjlzg3m+RO9SIjZOwbE8KVx0RRIM/ARUZ4RhCL8cMY7msY
	 Y/oGXiiSwMq0k0Ff7QQrvBoJK5yIjVg4VPzOtT+pS+Xlg4pN2cgkhpPgsvbeYvo2W3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SKfbxBxy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720A0606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SKfbxBxy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A66A1682;
	Wed, 11 Nov 2026 02:12:10 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 339AA3F632;
	Wed, 11 Nov 2026 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794391933; bh=02hMOjcRHLh1WSZk8DvetLfo/4v7NbYRgtGtrXJj1m4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SKfbxBxy9KlJ/v9coxt+xF+bLPOGQiciaSP2nq9M6iGd4NQn/mreA0sY1czlhXuZH
	 ESUDy4+40nyxsnrW/GkF1ex0a9lAYAzzPWKQhXCWkW+dF9ub6GC2fSm9E8gsBVSyGq
	 Mj6s7raFcfMQXLjmDuSE/7QJ+ckJbjARXx/hd7dg=
Message-ID: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
Date: Wed, 11 Nov 2026 10:12:10 +0000
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
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the
 counter value
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 11/11/2026 07:17, Ping Li wrote:
> While checking the driver's overflow handling and NRDY behaviour with
> the design engineering team, the following problem was found in
> __ris_msmon_read_locked():
> 
> __ris_msmon_read_locked() reads the MSMON_CFG_MBWU_CTL overflow status
> bit, clears it, then reads the counter value. The counter value read is
> where the overflow is accounted for, by adding the counter size to the
> per-monitor correction value.
> 
> If the monitor reports NRDY when the counter value is read,
> __ris_msmon_read_locked() returns -EBUSY, and mpam_msmon_read() retries
> after waiting. The overflow status bit was already cleared, so the
> retry reads it as 0, and the overflow is never accounted for. Each
> occurrence silently loses a counter-size increment from the accumulated
> bandwidth count.

I was under the impression that this couldn't happen. Is the a theoretical fix or has this been
observed in practice?

From IHI0099B.d 6.2.2 I_PCDHG regarding MBWU and the NRDY:
"
If 1, then the monitor instance is not ready and the VALUE field does not have an accurate count or
measurement due to recent changes to the monitor settings.
"

Based on this, for MBWU you should only see NRDY set in the MAX_NRDY_USEC after a change of monitor
settings. At such a reset the VALUE is reset to 0. Are you seeing or potentially seeing an overflow
in this window of time?

Looking at 6.2.4 I_RZWDC we have "When an overflow occurs... The overflowed monitor VALUE and NRDY
fields can be reset to zero" but the use of 'can' rather than 'are' renders that statement mostly
useless.

Thanks,

Ben

> 
> The overflow status bit was read before it was cleared, so the overflow
> has already happened. Account for it before attempting to read the
> counter value, as the cleared status bit cannot be re-read.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 27abf60f4d67..5384c9a4a1ad 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1528,6 +1528,16 @@ static void __ris_msmon_read_locked(struct mon_read *m)
>  			return;
>  	}
>  
> +	/*
> +	 * The overflow status bit was read above, before being cleared by
> +	 * software. The overflow has already happened, so account for it
> +	 * even if reading the counter value below fails, as the cleared
> +	 * status bit cannot be re-read.
> +	 */
> +	if (overflow)
> +		ris->mbwu_state[ctx->mon].correction +=
> +			mpam_msmon_overflow_val(m->type, msc);
> +
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
>  		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
> @@ -1569,9 +1579,6 @@ static void __ris_msmon_read_locked(struct mon_read *m)
>  
>  		mbwu_state = &ris->mbwu_state[ctx->mon];
>  
> -		if (overflow)
> -			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
> -
>  		/*
>  		 * Include bandwidth consumed before the last hardware reset and
>  		 * a counter size increment for each overflow.


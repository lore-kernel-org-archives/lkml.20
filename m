Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016986;
	b=evg/hGx5gqjudKDjCZidFZ/sQht6NnpJfLlWU2iIYcwoep/pdVgKaAzLs1MJuO+CxYHM
	 iWeykhh99ybibPO7sRRl4MaIhI5BvzyNafRKz0itBsHrdKfHp7w/TZazEyZjbhtIHP9fL
	 BrULNXBES0e8mFGG2UTaZyN0gfDyaQXUsJqiAkn2W/q5t4q897K38l3B5QBsrzrUwDehV
	 zMDkk3KkcU+pKgMNetbqA6o78BTEPqWkB8bdotDVyNLxoKYiClZzvl40mPXY1CL6iGyRB
	 t96Z5u2JY20W5nOYkUHwMVK23FH7hQPjziTpNt0mnK43Ivn848sztZmH3mPCRa0M5tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016986;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Rg0ETYbEaunw+LkMJf50lkBOkvciZg3rbVHhzrZnfXw=;
	b=OlIQRM5vOLWODaQAoQWx6wg7dh3hTa5W18z9AzjWgkXzJfHtFkrkRuMoaMOJWTnAQ93O
	 LrZsZobKLC4f/GpQKnJebOUABezLN8UfU5/62hfpb6qrsQSNMJquFaQBKPTLOndF8LZK1
	 4KWSMeX1fWe0kSESQov9GyEeN0mrzVWfGQjnl0fNbyImqfZDhmI2xsvGWMR4Kelce901M
	 VLy0bibEoFPjbHKLFVrvvUXs+PCxFXRJdsrB3bCq3//LyZjEAQTcgdsQbTk8Nqbe3xuM7
	 2bzx/rtFTAPpK/FUt6uLebLDmUuzzaIO9MborQyQW03N3tMNoRuxg5f4mn95iFfmJTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5Zoek30;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A27606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A27606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5Zoek30
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC1215A1;
	Mon, 26 Oct 2026 05:16:22 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8593F7B4;
	Mon, 26 Oct 2026 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793016985; bh=Gk4eUsoyed4B957tUYZATCS0kUgqsVIGWKLqcaoh44U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5Zoek30G0L+Q7LsMI3bb6Z9oGY3tyyoKd09cgYLswpa0ALiG2swjoNgL8wLguwgl
	 7/ZeVD+zOKKceSTAYzcRIqvFHgp0kaRz5ICw+2wwpSOZHeGuVYAfovsNExLNL8vFFs
	 Fq/PWI1Wgg+FZId5F0j7Rg822id+Doa49D3Cmlo4=
Message-ID: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
Date: Mon, 26 Oct 2026 12:16:23 +0000
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
Subject: Re: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 22/10/2026 09:57, Ping Li wrote:
> While checking the driver's partid and ris bound checks, after the
> hardware team mistakenly configured PARTID_MAX in an MSC to 16,
> this issue was found: MPAM_MSC_MAX_NUM_RIS is the max number of
> RIS an MSC can have, so a ris_idx of 16 passes the current check,
> and would later be silently truncated to 0 by FIELD_PREP(),
> landing all configuration for that ris on RIS 0.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>

Thanks for the patch. Yin already found the same bug and posted a fix first so I'll go with that one.

https://lore.kernel.org/linux-arm-kernel/20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com/

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>  
>  	lockdep_assert_held(&mpam_list_lock);
>  
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>  		return -EINVAL;
>  
>  	if (test_and_set_bit(ris_idx, &msc->ris_idxs))


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324206;
	b=wECYjavullQrsEXi+rPGSmbpdldxRFTKZjBM9HU5qXZIbR+MsrTiVbgkaS6J/M2KVIMg
	 41tDwvJ9L3nPbA2sNHZvvWQosRl/x7Vcr8s7jK50t+7lPrRDaEc1lUkfSigog5Zb6iEOX
	 XsGxCRCZi0nB+zVfwuOrOMat57e8GJX/vTYur7xh2Ecvqllea6aeC1qE2R53/wWtjyV+c
	 A8Hm6caqz72MEcfCZnWsTLoqfK13BvBHxdpToxUNCxmBZ0wHmH4pPj6fmwPtrX5BsbsHA
	 L54OZNyShZSASGK135mHNbU/lZYR0Q8IQ3OQ3EAx3Ok6aS122ciFuFixdkzp0EfOYAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324206;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+CUnMRhHKdQfCRpByCe4Goi7VLzpKCgXnhT03CuzEEU=;
	b=3MezlAu0BVtF8t77+cAiFYFAQOogxSrTCykFtHOjIJWRM6n2O1Lkqn07L5f7nH0eNR8o
	 pQIzZdqkX7qjCH8LkRp761Dkrqv2pUsdzLeDHnUoAOkbElMcaVVanPJXOpLYeeF9KbKuX
	 FTkXPVs8qKOWXFHNY4cdQ9TbS0uePAk3i/oRdCcGm6y6vEHCRPxy9v/O733xUrk6ND3YG
	 McZF2sB/eThfvZb0D8nuJ2d/M+cnasJd3FNDS5OkzojTeHLIo1U3z2sO1q0PS+cISij83
	 wFSrKdbLYRXZ+/5CylxYO2HHn7b4NkhfJJNq3hyEapURRWQZrAi53Z2S1j7Nxs/r++Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R0LLokSf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p1ENZ077;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317D606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7317D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R0LLokSf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p1ENZ077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794324204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CUnMRhHKdQfCRpByCe4Goi7VLzpKCgXnhT03CuzEEU=;
	b=R0LLokSf9gSVzk8oGQ8D4Nl5ufAqy7h+Y/CO6DVWtiznrickri7FSJzX+P1iiwTnTd80P1
	WwedLPISlix7a/mHnwziDPgIf/N3TmB8UW6ik8s9XUfKfSWGL9EDGnveTqMkPi9sTpxE9E
	RwCdULe17ouuxVG/BL5kvc/7A9LFhH8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-Csigub-VPga-YwFJPzTPtg-1; Tue, 10 Nov 2026 10:23:23 -0500
X-MC-Unique: Csigub-VPga-YwFJPzTPtg-1
X-Mimecast-MFC-AGG-ID: Csigub-VPga-YwFJPzTPtg_1794324202
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso1790249f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794324202; x=1794929002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CUnMRhHKdQfCRpByCe4Goi7VLzpKCgXnhT03CuzEEU=;
        b=p1ENZ077sgFhJhSxMfJbwBCrFISbdCmX42zTLYcnINyqUPvup1Ipj+r/wEiw+z8TZB
         XeaYvb4GYq6mBvVMTbPSn/3vBI8IUTxOxGAzhQffj8j4pDNdumvgZ+lqa0bWYHEO9fqa
         Vy5LsZgeIap695Ox1OlSHQEY1MaDzHfolVu8kNy5wgHXWbJVGlz1HXa+NrbJq7gVQHuO
         LHUp5PSrEAmzqgtW/eZnq1+e6tyZpg//j5elnTYXZa/NguiwaD9PpwBwuRdmtCtcTpC9
         QI8PV4zYCiY8jogcgj26uyNdKefSEl96v0eAwMzultuOZj/1vIYUM4LZ30XiZaDlGbuA
         GjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324202; x=1794929002;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CUnMRhHKdQfCRpByCe4Goi7VLzpKCgXnhT03CuzEEU=;
        b=jQlvTrSML2UCDtXFQ5DErVv4diKtxze0VrJIjXHsE0/hbB1M2LhE3vY0UYAA1C4a11
         xSUJiZq5tyfIHvuWF3KCGGNPkpuebb8oGb1GFlDJ3IOIkU7CUbUY45ooKvidnC3DPfRL
         S2bLs7awSPk8uFjQwBRQ6K/BTY/tNlZGkRsjqDnfHHQttMItln8T1unq5FNgQOTEPNxb
         9Tf0mGSOORf6ipCp2LunVVdMgzl9hAiGqYMcUIGL4hgZq8vw+J8wz3mpSt/e2qbWRYm+
         Hd2zsI0Hf5xH/zpaHTrvTyewui3W6VygwGpYGvDuTgTEGkjqKsi/OpEojVzHOfS6fj9Z
         KOSQ==
X-Forwarded-Encrypted: i=1; AL+hErF7Ofw0BJEgghSO+EuPXZVP7Pj0UKJUa26ZBzIrNcfEZ44IrK1PYeCD/+Rq7dmY5ZlfEe3BQKBuvGnEoP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z87MlN8Khfh6NfPEFGuiIunzetlYYm+d85NiFyTUcdGTCLYnZA6
	Mg0TtZmD/tef42amGjRo7U1oDcCEUfkrYfEFaSZ/jCiTreZtcSpUz/LsJ60sjoH61kN/+bs0ajm
	ZqjF/FDM6HHg8y0bsOP+01y4Y3+SNkAa1SutFP66rFHjSmvCNLUNTK5M+d6yggfufxA==
X-Gm-Gg: AYBFou1NTpB38qIhD3lyI4Vbcm7hnae3WtoBfoqUiY5ZzxBqcwi7nQSfH1MN0S+KJeK
	mstmZy3EjIaKHjsdAZxBmn695o2NNnVsEmOCItF9+Ce4kTpZV4K+EhdvstSXA3M1WokhBHT3yvy
	v7dRB46KO7hTGlLQAZcL9F4L/ntW+7J/hAGxHxx4QfHW0gTbGP+qJG/RGEGiPOQKJwU3XGsGCI+
	ROrCodYrD/35g3AD8RPbwWpNqrwf2RvRYZY8UH7jfBzZ6FIkNwjPEsnu/kaFNcyK79CdMJwhaNd
	qKth37Ov/86IUEf3SJ6KOujtPIaY+jiRr0Zmjf0sF640d1eNzg2rmJwRN4zLBZL7So8A5Btz0S3
	7IiWUGz2rZvDsA+gIYuyd9c9UGLE5NT/0scU=
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr5935814f8f.26.1794324201603;
        Tue, 10 Nov 2026 07:23:21 -0800 (PST)
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr5935745f8f.26.1794324201090;
        Tue, 10 Nov 2026 07:23:21 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm5570076f8f.31.2026.11.10.07.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:23:20 -0800 (PST)
Message-ID: <17d805e7-4f5c-4184-ba53-3d3e2ed36df9@redhat.com>
Date: Tue, 10 Nov 2026 16:23:19 +0100
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
Subject: Re: [PATCH net 2/2] ice: dpll: set the SyncE divider only for the
 port driving the output
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Schmidt <mschmidt@redhat.com>, Jakub Ramaseuski
 <jramaseu@redhat.com>, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org
References: <20261110094350.184185-1-ivecera@redhat.com>
 <20261110094350.184185-3-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261110094350.184185-3-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 10:43 AM, Ivan Vecera wrote:
> R10 holds one divider for each recovered clock output, shared by all
> ports. ice_ptp_link_change() sets it from the link speed of its own port
> even when another port drives the output, and checks the mux only to
> decide whether an error is worth reporting. With ports running at
> different speeds, a link change on one port leaves the output of another
> port with a wrong divider.
> 
> Skip the outputs that the port does not drive, and check the mux under
> cgu_synce_lock, so that another PF cannot select its port in between.
> 
> The check computes the mux value as port % ports_per_phy + 3, while
> ice_tspll_cfg_bypass_mux_e825c() and ice_dpll_rclk_update_e825c() use
> port + 3. With the skip, a port from ports_per_phy up would never update
> the divider, so use port + 3 as they do.
> 
> Tested on GNR-D with dual complex E825. With the RCLK pin of one port
> connected, five down and up cycles of another port of the same complex
> called ice_tspll_cfg_synce_ethdiv_e825c() 20 times without this patch
> and never with it. Five cycles of the port driving the output still
> called it 10 times. Both ports ran at 25 Gb/s, so the divider value did
> not change on this setup.
> 
> Fixes: ad1df4f2d591 ("ice: dpll: Support E825-C SyncE and dynamic pin discovery")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_ptp.c   | 10 +++++++---
>   drivers/net/ethernet/intel/ice/ice_tspll.c |  4 ++--
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
> index 449819cf8c8791..81565bbb692e9a 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
> @@ -1350,6 +1350,7 @@ void ice_ptp_link_change(struct ice_pf *pf, bool linkup)
>   		int pin, err;
>   
>   		mutex_lock(&pf->dplls.lock);
> +		mutex_lock(&pf->adapter->cgu_synce_lock);
>   		for (pin = 0; pin < ICE_SYNCE_CLK_NUM; pin++) {
>   			enum ice_synce_clk clk_pin;
>   			bool active;
> @@ -1368,16 +1369,19 @@ void ice_ptp_link_change(struct ice_pf *pf, bool linkup)
>   				break;
>   			}
>   
> -			mutex_lock(&pf->adapter->cgu_synce_lock);
> +			/* The divider is shared, set it only for our port */
> +			if (!active)
> +				continue;
> +
>   			err = ice_tspll_cfg_synce_ethdiv_e825c(hw, clk_pin);
> -			mutex_unlock(&pf->adapter->cgu_synce_lock);
> -			if (active && err) {
> +			if (err) {
>   				dev_err_once(ice_pf_to_dev(pf),
>   					     "Failed to configure SyncE ETH divider for pin %d, err %d\n",
>   					     pin, err);
>   				break;
>   			}
>   		}
> +		mutex_unlock(&pf->adapter->cgu_synce_lock);
>   		mutex_unlock(&pf->dplls.lock);
>   
>   		if (linkup)
> diff --git a/drivers/net/ethernet/intel/ice/ice_tspll.c b/drivers/net/ethernet/intel/ice/ice_tspll.c
> index b99e02cfe559bd..0bfbea43529523 100644
> --- a/drivers/net/ethernet/intel/ice/ice_tspll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_tspll.c
> @@ -746,6 +746,7 @@ int ice_tspll_init(struct ice_hw *hw)
>    *
>    * Check if given port is selected as recovered clock source for given output.
>    *
> + * Context: Called under pf->dplls.lock and adapter->cgu_synce_lock
>    * Return:
>    * * 0 - success
>    * * negative - error
> @@ -774,8 +775,7 @@ int ice_tspll_bypass_mux_active_e825c(struct ice_hw *hw, u8 port, bool *active,
>   		return -EINVAL;
>   	}
>   
> -	if (active_clk == port % hw->ptp.ports_per_phy +
> -			  ICE_CGU_BYPASS_MUX_OFFSET_E825C)
> +	if (active_clk == port + ICE_CGU_BYPASS_MUX_OFFSET_E825C)
>   		*active = true;
>   	else
>   		*active = false;
Reviewed-by: Petr Oros <poros@redhat.com>


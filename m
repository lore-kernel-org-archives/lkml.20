Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763478;
	b=kuPVFnhRpeXEZ16zDHxVD0Ja0/sOBMyVEbVmiT/OhjVC+HXuFRtsvn7qPlZXfrt5STE2
	 9u7IjgF3yO5nD1rHe/FJMkd/cYuT7hXW/tYNdJJw8UiYwlpCELpPIK1R3wtIRl0j/g45L
	 QgLlvMjXd9zwt82wP7TiVxPAhlWA4XQ5j9DHuKugMEFK1x0pPgr0Go6rWFiqwcq7q5ugu
	 MRQNeBJY1SGBLcIQQLwVfYxlPu+V7t3M+ZfcE/h9RHlHzj0dmgPVdhTyNs4tEEEflHHRF
	 KIUAyO0/SF7dTATsKGcqMehed94hVbOR4jthSX+jq8nfHSeKG7tcTZeb9YAu2QK247g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763478;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CdsOu3OSEsynQJ6rdHJSUQdyHbmYdl9dN4nnm+613fs=;
	b=i+rWFzuDcAF5PEgCUKYwbsVGgSbeDrxcMPbzByuoKhrGL5EnjHfXVEs7pEQrGFWKX5J5
	 192SL/evtmhw8Gv+PbSQc9V54tHXlKbsoPoc6FDQXa4NOBsP7z7v3AAF3nvT7VmYJzkYO
	 ZqgSgMoEBdqXLZLKrOrVQ6sa3fQTZuA/ccYr+7IflQxdoc3WUVH4l4nqAkJFnTMp8IeOn
	 Sy/Dz2kP9jw9Dv1hGeX35bQ0+IKhSZM1NpaYpP1MKl97ZCj257zmy9ADdQGJoEe7fuRpQ
	 VHrAd6I1OduhoM+ZVxQ6YRJlHMbMLx/JKGuIXRNdryQLrv7XpAxAJWiQfgySSQ9GJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P4XJLwbO;
	arc=none smtp.remote-ip=91.218.175.127
Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P4XJLwbO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n/CwR0aupi+SV9gglaQoOTa0JU0PwKkfaExBUVamX4U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792763474; v=1; x=1793368274;
 b=P4XJLwbOe7Nkc3VGr+sPWO9ELMXTjFkVzrP2iBk2r3idn4Kips19yACAacyOCbKNuZ8vnX9O
 yz/am+PXfngvvanvImUSlNEm624i/VXnUNHHrjFYyAfDTU8AlrB/lOdzkJVQW4T6Gh2C6Mv6s6f
 IMXBQxK4siqDC2DehhiOiYaQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9ced7062e363dd41;
	Fri, 23 Oct 2026 13:51:14 +0000
X-Mizu-Trace-ID: 9ced7062e363dd41
X-Migadu-Flow: FLOW_OUT
Message-ID: <45128a4d-d92a-4966-b3a9-668de73d3d90@linux.dev>
Date: Fri, 23 Oct 2026 14:51:09 +0100
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
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpts: fix support for
 PTP_EXTTS_REQUEST2 ioctl
To: James Clark <jjc@jclark.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Chintan Vankar <c-vankar@ti.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020003525.1237742-1-jjc@jclark.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261020003525.1237742-1-jjc@jclark.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2026 01:35, James Clark wrote:
> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
> 
> am65_cpts_extts_enable() ignores the flags, and am65-cpts was not given
> any .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for this
> driver with -EOPNOTSUPP, where before that commit the same requests
> succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.
> 
> Tests on a BeagleY-AI (J722S) show that the CPTS hardware timestamp push
> inputs timestamp just the rising edge. Encode this in
> .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the rising edge then
> succeeds, and one for the falling edge or for both edges fails with
> -EOPNOTSUPP.
> 
> Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_clock_info")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>   drivers/net/ethernet/ti/am65-cpts.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/ti/am65-cpts.c
> index efbf2ef976a..df5659ead72 100644
> --- a/drivers/net/ethernet/ti/am65-cpts.c
> +++ b/drivers/net/ethernet/ti/am65-cpts.c
> @@ -779,6 +779,7 @@ static long am65_cpts_ts_work(struct ptp_clock_info *ptp);
>   static struct ptp_clock_info am65_ptp_info = {
>   	.owner		= THIS_MODULE,
>   	.name		= "CTPS timer",
> +	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
>   	.adjfine	= am65_cpts_ptp_adjfine,
>   	.adjtime	= am65_cpts_ptp_adjtime,
>   	.gettimex64	= am65_cpts_ptp_gettimex,

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

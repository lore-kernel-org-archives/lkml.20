Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.105.120.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704890;
	b=1nALSod/8E3gSokoMwuruMPAWcdou7HRqT5pDtbl/LlfQdGaQo5sj3mDa7YO3CNxmShf
	 PqRkPe6GEgj+NLx+pHwaj8iiMZWpUl/K3YH485kYJ48K0IpE1zupr1Tbx2tT6UTjx1qIj
	 OdHwlKuUFvAQQSfpMkd1xICdkrjJoc1sI0jUk849OOIgq4/LTA7d142xI1s94hv95l0TK
	 vw1qizKqwtzNNUb6lLCn5yx3NYTZ+j/ZmPpj088436J0SFrvy904loerJWnNrpBVN2G7d
	 dcBmNXS7OZMwb7xjBafqFAIky+Ee2UNkFtGnTvdNExXduYB1Tvm0d1Hj4G/DEsm6h9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704890;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vX0qXEOYp/vWA4lRL1YKkRKb9n812WRGoB/BC583hWU=;
	b=2+ylFJhP28VbVnZJLtmf1FhXbnPWe4sJWVz6qqQgIA1zhDWRXJeHrczwPltm4XCcuW0p
	 LcX6XQpH5GWZk0cZqeJf2yrrD4G0fEx4JLz/fT61BUKw3MgLiKwjZzCNcyE9z1Qi+CihZ
	 kSD5tD8zcTXhGXcHiyKX65ESWGjselIKeCw1/GRYQtFT4PZImFGV1xsmL/DkZkEZR35G6
	 X3WwJSAcAdixOhS/jAB15MzTSY74w8yeT1EcBT/EZKMGUNgNyfDCXk3LLaIDSXiAU64Dk
	 5br7O/rCgUC4Uz2qGBPQRPAbDpPGfSjQOlZSZeLt97PCoh4ft29vgi1rgqKVvLn09Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lankhorst.se;
	spf=pass smtp.mailfrom=lankhorst.se;
	dkim=pass header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=jd2xHX5Z;
	arc=none smtp.remote-ip=141.105.120.124
Received: from lankhorst.se (unknown [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1D606A80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F1D606A80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=jd2xHX5Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
	s=default; t=1793704886;
	bh=WsecBn/49e7uFyfqCo1gbvGorAO+WAvATYilIhVU0do=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jd2xHX5ZE2f2SxpSjFFacchwNbUt1xmsp9KsjBIabSum0Nn0NalBpOZd/WdLcp5+f
	 AkqXC4N/LDODtoiDbvHJByML9slvFytsVc5uXdeG1gocaUTPshjsG+OERyEnp5mqwL
	 6M/EhvOB06Gy2ruu9Ub86GuBd2MU7mv8orIAygxNR7Q0vaiAszZrzfz6Zkhfgt2Jfh
	 olYslm687tgXuk2dwbqnWlX1U5/VUewQrxy+3ZqpWVjUevuI9RzzuUJOZYlD5RHtfs
	 kvWCR+cxMPIj4lb3t2VX9oXXdSzpSQxMangaMJwf2iEjc+nlzQ51AkpQezboYhRHvI
	 zIE0JP9atqCwA==
Message-ID: <ec59fe20-1e22-4009-89b9-af5b3d37fcee@lankhorst.se>
Date: Tue, 3 Nov 2026 12:22:22 +0100
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
Subject: Re: [PATCH 2/2] drm/xe/gsc: warn about GSC stolen memory usage on RT
 kernels
To: Junxiao Chang <junxiao.chang@intel.com>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20261104032732.30681-1-junxiao.chang@intel.com>
 <20261104032732.30681-3-junxiao.chang@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20261104032732.30681-3-junxiao.chang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

On 11/4/26 04:27, Junxiao Chang wrote:
> The GSC microcontroller requires stolen memory, which can introduce
> latency spikes and negatively impact real-time performance.
> 
> Print a warning on CONFIG_PREEMPT_RT kernels to inform the user that GSC
> is active and that RT performance can be improved by disabling the GSC
> firmware (e.g., by setting the module parameter xe.gsc_firmware_path="").
> 
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gsc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index aab59dc647fbd..3d06ab6fecbe0 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -427,6 +427,11 @@ int xe_gsc_init(struct xe_gsc *gsc)
>  	else if (ret)
>  		goto out;
>  
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +		xe_gt_warn(gt, "RT performance might be impacted by GSC stolen memory usage\n");
> +		xe_gt_warn(gt, "Consider disabling GSC (xe.gsc_firmware_path=\"\") to improve it\n");
> +	}
Is this a problem on discrete as well, or only on integrated?

Kind regards,
~Maarten Lankhorst> +
>  	ret = xe_gsc_proxy_init(gsc);
>  	if (ret && ret != -ENODEV)
>  		goto out;


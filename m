Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596641;
	b=kyqJteI5Xg3JdamnGB7aUeAhCG52W14tvMFsNfTeaMfl0I5EMPxT2+96MVEy3h9KVO3j
	 2LF9PHDyRR8/bRa5Kz0trkcHzfH48djPKNH3l3w1snc1TKX0/qoIip9DljEJA449dyQYl
	 EZQMWZO2f8+gIb35+vIaGh73jjMM0Y9fAQQvtj+eCBDF9fDSUV1ub1mDF+JEJTxLATcAC
	 IjHbYZ4K+r16nBtJJQ1ufQ+M8NIWqHlZjku9BiHvrr4I+3u0Y+toJjvMkcUy07nyHIgXY
	 Bkla9EzYzxxOtbaWWuWY5B14fKbujvE4fNVKqAAyipRfFMdma1bUSddG7HhMtwSa7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
	b=uobjb+mUoqhzB05y2CPPq4oJADnoGs2i/2ZZXrNWiT3qeRZaRY/ke0chI4D8oy96utE0
	 XesY/B+2vP5ghetva74xEjZCBNdqP/eghSVIVhlJjvsJlmX+vt+cuz0mL66Dpllrobujo
	 4DppfMAZ9PyOFPd0+C9jJSG/P2B7g7wGZ93kA6MOSLzM7KKzyxZhrL3xMIrQwoLE4R7Qz
	 GZs/Ns4oMOReXyu0G8iVsfT+Zk5M59nlrVFII2NAUlOpoOcmCw+JkWi6SJBwfzcm35m/W
	 0h8Pj+yz5oDe5TNhhfKWuuS8lN5lz0DCv4VRCY39SJjJ4rMe6X7iLDWGvQ0rYUljzAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203B606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7203B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso27611256d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596639; x=1795201439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=OBl7H+i6ZwCYqyZENMFkOks9QMvP3Q1O5CrDefd7QEnoWxR7Gzg2PWplPwjprGwO9m
         ONLcl2A+SicRV5yCDWOMiHwCcJzaUmNARnD8racf2rem5cydfXkKMyTLGas/HjHQXhp0
         TTMH+rLW9ObkrPLd+QQ+P9H/NwQsFwau/hQwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596639; x=1795201439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=fjRlMXltVJL/f9h4l1g170vDiJdapi9y78zC9y59nR8KRxKjLkNZtKCUEYk760+WW8
         sUSLE/AFyDVih14mLX6g2aCMZPjz4sYFryeq8Fd1e23i/BQFZ/1ho5FB3Cfqqw0fNci6
         j2xwYgL3yc+qsZk4tohbuOCigWLjHhUCqpLNh8Nqo/8a7sU1872r920OldDW5ldIbBl9
         mz2N2scJkis1PmM/Co/Gj2lPvmZNuA5xLyaMfGNNZ/sMWvq6DktZM+u+83HwUivp4bpu
         ssJzYs8IrEk29HKbgYRuAkuDyFcjSVzevGJhXTFwXDTPFSqBRkLPBIeGNpjlr/OoZ08k
         XmPg==
X-Forwarded-Encrypted: i=1; AL+hErHnyBjuzA5YGJ16iQjBMNaxPqXWJKxP7Vjo4c1kRgFvFbWglT9z+bzfgINXF/IxaMTBM8Th//YoBBOiDIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hzfUZ7habWAfXSkZshHEwVXexKYk2vZEJ6bQI8z9y6YLcbhuT
	y3myKNBEzHYDQlMTkP+8yFrtQJSLHSXyY0BYgQaRTTYFQB5YuwTaYcYduL7r6bL9oA==
X-Gm-Gg: AYBFou2GihB4CAonTfe6WdP1WNiyznaTQt3aPdHGn2Cx9ApEuZu/TsgG3tSeUvYiDUm
	VqG14RvtmVnC1SgzqGbr1TGJM+Y9hlsI05wcsE1RHfFS+EEygh1dcWa2CK/6nDdv0GJeO6RvP2g
	igT5uf0PPO/liaT7f9+GxWIqub4k5T7nYIQZsUNQ3pa+7YqASLLZnr9P/XvW2ZeIRX9d6X7r+7B
	w9FoA7hFq9kMPLH+JX5Wxm1bu/fbtgytGQnwcOwc1adFxEIeJLTRR4w5FI2jp2Vmcb1I7mllCLV
	S2/O8+zPvKRwx3XDRI6LhRm8KheZX7082nKl0AgSTBOsGb3e3fBYAS/MbyQ13MYMOuYaJRi8wy7
	y1bLCUvROY09V6N/Fx0c+CIAaoPAUp4CbvoQ68Xls9SXNFXePXFs0/NzZ8HynhsM1kfK4LXmsHR
	asJKETtozkK/epLz/73Lx0LYAr2PAM2KT4qwXnKI2k+p28inMMouZROt3wjgRouUnJoAFpbFzQP
	GfCyxblf7FHwofvd7Oij8avYwEMhywir+ekSOu6OxfQHLkcsABdPsD0CFdMJcKv6+8C2rrBFZ25
	Ip7GDWzQQLFNfgbNjHZtxk3c
X-Received: by 2002:a05:6214:4409:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91f241ddd3fmr55479136d6.46.1794596639018;
        Fri, 13 Nov 2026 11:03:59 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:56 -0800 (PST)
Message-ID: <1b84bbe8-28b6-4a74-af0c-5b9cfdd8b394@ieee.org>
Date: Fri, 13 Nov 2026 13:03:53 -0600
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
Subject: Re: [PATCH v2 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
> qcom_pas_context_init() and qcom_mdt_pas_load() and
> qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I haven't reviewed the rest of what the PAS library does but
I trust it does the same thing as this did before.  So thanks
again for implementing the non-devm interface.  This looks
good to me.  My ack is already present, but I'll reiterate:

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..0a37741c2285 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> -		goto out_release_firmware;
> -	}
> +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
>   	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	} else {
> -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> -		if (ret)
> -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +		goto out_release_firmware;
>   	}
>   
> -	memunmap(virt);
> +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   


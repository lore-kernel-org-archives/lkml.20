Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96143D9DC5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262339; cv=none; b=XxkR6OfsfH2K0YZFvm7678/vGCyMP6ViJFnKoshDhGOBjz2Rrl+Db2CStRo1PaaHe7Buq11YXfDTKZlidCPNiapn786/Xdhv9t1scRAj+ghS09dixh7HVZ0/CjOXjlgJIa6QdsKamePhOUIiZ4YsfEfYEy6DYt0e+iWpRF9zP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262339; c=relaxed/simple;
	bh=i4/JSD98fkMP4EtaU0o0G/p/k04D/Fo6vmn6XJIipJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/+PIe0hft5nyS4qlPsvHxaM4htLAiAU6fUJGuI4hfj7uBo2qATOx7E9ytOjYX41LUAGfou1XtyBvoKRSZM+bazHzXsOAcTkYtNkvQyONo9kCUCtCkN99bOqdcpfPuJlBZFUK8q2++Rxe9i/GgDHyNAhfwrxWhczLWTyljXqb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KkFI6tqU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KkFI6tqU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9973685e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792262334; x=1792867134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PTaBaJhyHT4J2O0wNH3BcAK19fYP6FDKgZiZPkF2z48=;
        b=KkFI6tqUOnnDXto1fuQ1y5gYrPFUdqEudKpWHcdJCc3Mz4RpTpweBsyHUeSCU4vKWy
         3fZEIpywl739xpOo0/6+ZIQlMBnzOl6BgBZxqcSYZxQIEVpI+VJalX9zRvYHND7fFKqP
         b/MkZl0Da5W/2T1Ogz/b4Gn0403s0l/l83F3LohoGOazWwjijhbwUP9jQpbmQOp/G7yR
         nN8QzqL6Otg9YGKiiPMyG5sDxZxXMBY2w/t9ldPdE12rc9wXI8dhRBUig/rTEvTHXKC9
         CXEhFDkUpjZCMAaVrr5VyvdPYgZtD55Gk/wXzeao2f4UIAa2VT/7mbapsNB04N4engxy
         w/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792262334; x=1792867134;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTaBaJhyHT4J2O0wNH3BcAK19fYP6FDKgZiZPkF2z48=;
        b=n8Gs2pDgihI8PJsvK172SNopuCkMroDL8D6izaEixPncCMjXW5Gf34EbVxneYoOVil
         y9TRaQVMrDsqju7nZTluk1ODpyz35wvZj+HsIV87T9OnN6NX8o9C7bbPd01WBuVCbTSN
         C9hUNn+rUfmqfXPNiX+nbKsU5bhLfpDNCAd773/AaDCIaMXgcUZ+4x/fVHI8Odpw3Kjy
         vuNHxBZ0KmH+5Z/2D/n+CHNjy3f9H5IAvQ+dNsZLU5YobHQNZrityrWxAPAbZ9gfmyu5
         MIT2bHvMOX7+ss/C9HM7xRfSQhPUQYE04d25tQlWI6agQTHjTlolS3SX81VN/b87ePcL
         13qg==
X-Forwarded-Encrypted: i=1; AKwUvByyS2cC+omURdvzH7J5SxXZxvh1NB4nsSLEp2QBqvM96WlGKEveBx/UO+pZRAkiOZU7Vv5AfrUEafKg/Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAcMETVhbeemAm1YuygL3N3yUnxGhO+YQovjZ1iY5HPjOMxOka
	fHPHfJzcdifrMnTWlL79NwP3SImHwjY/NIS8cLs5UPtfc35SaQQ5+9tppUdOwQygcvg=
X-Gm-Gg: AYBFou2zU0aDxZvPvDBsCT4/gGSiWzm36bKLPQovqEoqRlNU2C/ZvxwlL+NI9iL0hO+
	HdWnxuXmdqNS+kvsN7uJlzeySa/r7P2NdLbhpW3A70cQvpz/L9p+O2+sjuDtsPvD+RbnFj+SY9c
	wS3CE9DBAvxgza4qYc9JH/1oh8cis9TgzBesTfA9sLLNIZVnf5B1JW8d3D+bP7clvsb4UstJvw1
	ZUbOZ+xnWnl2VkKVt0NwgzDpXuoWv33nP/9+RQiF98+Rh1hQEd1tvdPIUf/i4Omg6xpFrkvzSJy
	t7HNJnMTDlhO280HHj5OvdKKSliWwvHzF2clzap5/ieYUC2FyyRE9S4WTNp+YFBm+3WBdjupR7C
	/crv8doPDRHCufBiDGNsaEUGwBj0Z9zrYzQUU3cX6/JeitTvdMHazjHUT4CO4osZq38nyRYXVtd
	/kSYjtXVvdi5avH3dRyV1anIy4w3OADsdxFk2zPtiwIHuIZ6aKlRPk4vN+IYK1mcMOga8Fm0eDF
	k+EL9D1G2Sd7L/bmckXqI/0h25rq3BvgA==
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a1d7616bfdmr68137185e9.29.1792262334073;
        Sat, 17 Oct 2026 11:38:54 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm98606395e9.0.2026.10.17.11.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:38:52 -0700 (PDT)
Message-ID: <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
Date: Sat, 17 Oct 2026 21:38:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, xiaoyao.li@intel.com, kevin.tian@intel.com,
 chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-7-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> Introduce support for binding and unbinding the Trust Device Interface
> (TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.
> 
> Executing TDCM_OP_BIND transitions the TDI state to a locked state
> (TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
> to verify this state transition succeeded before finalizing device locking.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   drivers/virt/coco/tdx-guest/connect.c | 75 +++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index 1f52a187b30f..e36515fc43ef 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -159,8 +159,67 @@ static bool tdx_is_dev_teeio_support(struct tdx_devsec *tdevsec)
>   	return !!rsp->is_supported;
>   }
>   

<snip>

> +
>   static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
>   {
> +	u8 state;
>   	int ret;
>   
>   	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>   	if (!tdx_is_dev_teeio_support(tdevsec))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) = tdx_tdi_bind_dev(tdevsec);
> +	if (IS_ERR(tdevsec_bind))
> +		return ERR_CAST(tdevsec_bind);
> +
> +	ret = tdx_tdi_read_state(tdevsec, &state);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (state != TDI_STATE_CONFIG_LOCKED)
> +		return ERR_PTR(-EIO);
> +
> +	retain_and_null_ptr(tdevsec_bind);
> +
>   	return &no_free_ptr(tdevsec)->pci.base_tsm;
>   }
>   
> @@ -181,6 +253,9 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
>   {
>   	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>   
> +	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
> +		return;

<Thinking out loud>

So unlock involves calling TDCM_UNBIND which in turn might fail for any 
number of reasons and yet we have no way of communicating that. So after 
an unlock a TD might want to rebind and issue bind on a device which is 
already bound because prior unbind failed. Is this something we should 
be worried about ?

> +
>   	kfree(tdevsec);
>   }
>   


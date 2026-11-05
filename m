Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867924;
	b=grp5WNRGQnjbA88liO4LNq/2xruhOXUXK0NfANWGys4Je4Lob0NNOXOXcDDBUIsiAxZE
	 tdPrIdXhelsoheLImrZUfCEuGfzgP9AtRQYDXUQjPdKLJ9w+C7wrHdgr7sIFT90zhAESV
	 o+yxU3iK6tZVojMQvqf3LjPsDFnSI0IaUkIVOvpK45Ip8A0jtuD7WczWcJTb6AZ1Un1+U
	 jrfWaN7rZVaTm+Ao5PNANQ4rfA36DE8BFkEZf9IiOGNTK1HuGXl3hH6/DmKCMXZftiCW9
	 /bZmzisQNBogeA6/ozx1KClghSrfyK+iGUkvD9BlTiqzTsg7euss8t5x6khOtBxZ1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0uDYlxqiv0mSLq/hIWs5/UPyDpAbAUOWaGdtWRXlapg=;
	b=nAzgGaZyVv0Q/Ea9X8smf/64548PFZQZLrutzjCSjMOv+RO+lwreEv+yUz4bJx0pnDk8
	 wxcbYBDLmuAMP17V3QqzS/AJcgUCSAbJ41rxg95j1CiCps4lgjOmlkkBFSObnA2wumTnq
	 6FOuXXklc9njKqb360I4RXBo9UvOBNpBAyxP+6yj5KyUS7SzFWFexR647fBEUm9ZfaCUn
	 r4uEzbvr6W4BdUqgOawxfCvhPh4fexh6zJzQvZ+mtSnvMIOMjTq9PiWzUpn9BVquxpmwk
	 jcyG5CLhKt8cFkZNigEu20YIU/XaJRZsUxMEYBtGgmhIJNRYO0+i9m/SPJEae3kvMGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FWVVgyVK;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FWVVgyVK
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso715012a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867924; x=1794472724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uDYlxqiv0mSLq/hIWs5/UPyDpAbAUOWaGdtWRXlapg=;
        b=FWVVgyVKmbpq3jqC7wnZ7iUai+Zd8NmolPxVCvTqr/tCwGrje986AVfcmmjuHx5kY9
         BYpmN6pjKCpnw4Tk6mmnXciTqDymgiYizuynW+9u/PORW+WioUvuMmxVf5fZV//6C1X9
         cOT9dLhj926lES0dSAy+SzUq9DpmZW6MF4K9RMc8YHmwCj2LdU8R0f5dqRK5VhlM5SU3
         4Ry2+4g/eqWu+WFMtsH91dHegXX6Hu08Hj4gjX6saWWNRkIhhGkWbGUTYJQ3g+M41mR6
         ObNhYzgHEHAE6L7Itx7fDzMNLk1ES+KzeMWztLlSF5lGAodehQUB2PQKRmtCb5S+N/Si
         FFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867924; x=1794472724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uDYlxqiv0mSLq/hIWs5/UPyDpAbAUOWaGdtWRXlapg=;
        b=HijWaUhKFEWC7aYF8gCR6EcNfs6cbHQLHukwC4Sdy95w2cKVeEHPTrE21t3qtNIp+u
         SuILTUtZGvynA2UQ+rGmG0CgeuTtNEAcjRIjqbokZF6QnOX9AxK/1cnn4yllpHRt5pWR
         uhccGmXxw2IMnSTTEQ3mZpaiVmAqqZgV+WKW3MqIsoiGDk4tNu4uQo6QC8vgmgy5w6N/
         n//aaid1FgaCuOnKJ0DnxKsXWZsPy5KkV4fopJQlxU7GdEPYIVxWCLxoWqY9stmYV4Hr
         rGHINpSt2ZvfZXMpY0+GiQzusfY3VzYfh1wdmC1nZs0eUbfmADVottesC6yUXCwhv6jd
         Ll6A==
X-Forwarded-Encrypted: i=1; AKwUvBwoAVS5Sqz1QHIIllulK+cDTbJ8lN2p3e74jDKl8l5C3K1pKA9e/ZB4ve25e36PFZ5L4jshe4OjnsSw7oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z98iIzZsCab6QRipzf67CnGIrTswDGboBqY9lHv0IT6G+vsNp/0
	8S0OO+0yJppHMAAsZEDJ/GKBgsQeCdm1gQvVJTqXgJMB9FNUTYF8gYOL
X-Gm-Gg: AYBFou1xGYZuBLsDH36emaCGBYGew6KNncaVv9vu6i1tVRoakh3OjyzAFP+Dj4599du
	MCfHW1mc7ZA8xR+km6Cd46O+NUcL/07ubEUsO5JyfyxbYLxKXlguRYARBC8yQhPEoprOwIi+INZ
	ON783SSh5TOwoFPUH0y1EQ4zOJIGR3lzo9ZbJ4BEmqE7CFhlXf4zRu8rUQG/EALAz8cOJLvi+CE
	eBsQ6nzReqeybh5DEBaW68x7p5auqWc8D8K8XZRaQiyBpCdOohUReW8Q4FVjDyOTgrBW0Kl/saE
	ABfV/l3RjuEV//Gp3itCAWCY55DmOA1NpKSEL7NFD145+lijvEmZqOZWqDZqbPzPlrlTDLpBWfF
	YenGnV+u9TDdmo1Uyj8B+tFoiNDAOvPEpzVjyqkf3o5WW/2amatcnAqJnxCSNBBuo9z/XvwF19C
	IjPnlAXeT6cQfoSGJX6AJY47j+OJyEEqY0uSpseEgFEiUgqQjgo97Jcnz9UwhRmrGHt23dTNPST
	cP9NmqltYBo46+1n8ugbyhRn2jmv0rvO9OEB9NiZ78mJ73ahf+IyWbWBOhMcc45wTCPccQDkyyg
	4b0+ksB6nB+fa6M7U3obzIr5zTep9dLljg==
X-Received: by 2002:a17:90b:4c52:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3ae897ccbfdmr15940958a91.11.1793867923599;
        Thu, 05 Nov 2026 00:38:43 -0800 (PST)
Received: from localhost ([2400:2650:24e0:bf00:cc77:213f:afc3:65e2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm2812294a91.15.2026.11.05.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:38:43 -0800 (PST)
Date: Thu, 5 Nov 2026 17:38:41 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Release GGTT MM if scratch page setup fails
Message-ID: <auxAkaQM1Rri52K9@dell-wzy>
References: <20261103065407.1070225-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103065407.1070225-1-vulab@iscas.ac.cn>

On Tue, Nov 03, 2026 at 06:54:07AM +0000, Wentao Liang wrote:
> intel_vgpu_init_gtt() creates the GGTT MM before allocating the scratch
> page table tree. If scratch page allocation or DMA mapping fails,
> create_scratch_page_tree() releases its own pages, but the GGTT MM and
> its virtual GGTT and host GGTT buffers remain allocated. The caller
> skips intel_vgpu_clean_gtt() when intel_vgpu_init_gtt() fails.
> 
> Drop the GGTT MM reference and clear its pointer before returning the
> scratch page initialization error.
>
> Fixes: 3b6411c2c205 ("drm/i915/gvt: implement scratch page table tree for shadow PPGTT")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 5056a5887b31..17d61548ec05 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2403,6 +2403,7 @@ static int create_scratch_page_tree(struct intel_vgpu *vgpu)
>  int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>  {
>  	struct intel_vgpu_gtt *gtt = &vgpu->gtt;
> +	int ret;
>  
>  	INIT_RADIX_TREE(&gtt->spt_tree, GFP_KERNEL);
>  
> @@ -2420,7 +2421,13 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>  
>  	INIT_LIST_HEAD(&gtt->ggtt_mm->ggtt_mm.partial_pte_list);
>  
> -	return create_scratch_page_tree(vgpu);
> +	ret = create_scratch_page_tree(vgpu);
> +	if (ret) {
> +		intel_vgpu_destroy_mm(gtt->ggtt_mm);
> +		gtt->ggtt_mm = NULL;
> +	}

Better to just call intel_vgpu_destroy_ggtt_mm(vgpu) which is more
aligned as for ggtt mm handling.

The issue you identified with AI tool might make sense, but pls learn
how to work with kernel community first.

> +
> +	return ret;
>  }
>  
>  void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
> -- 
> 2.34.1

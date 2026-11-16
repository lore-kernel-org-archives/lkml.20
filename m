Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828523;
	b=SAUHlqOr7bfqHhOcj9KeewOkeY8nhZO5wKL+IP5B6+fBIAv8vh6Zn1kZilzka76do79U
	 QYWy+QvHJYcIN7WvHuwgRfw874w7/TUvghswvxVu/vzj4Aa1LpDyJLLZxOM155ExRWgr5
	 C2PJekMi9TS/vTnEEVnJAxHuvMDYUQ7Z0n3oGjrVZUFcndm4mvfbLPz4eUl+TyVgp7r3Z
	 aqMn1fSmshOF2mjhd2ccta5VRrZDqjPI53HnxITCYwKAJGV18CaJCZEj/pYjHmRjMll2l
	 E1DbBN7uzDba+tfakMdK6B/S2WvgHjXieqN6fNTfVoNvZK0pCoCwV3yApqjiYAx8GKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
	b=OFlKquBx1w5mjpIn/Tn1wzthmAoaNCQ/EElg7OWNESmLgsc/Q/ntCRDq3ZqEabXF0xyX
	 oW7mDMHEMXkjM4fTBTNx4xxj4EDqE87E4Ccdxjx23NWrRgyQDlVOxEgEwabGDGI4Mg26U
	 jF/Akqt1fustxZzyPfy5QcBxjih2Tjl4Z7XpSGXCmAqa2gH9R9/EpCrFxYwrzoVsc5xTf
	 naUUKL2OWHA/fufkSx+qy92HTRm0hQSDzQ8w/EtHqX0PHD12cWkXkUmj89/75V21ssP2b
	 yB/zpWw6k4Qe9K/47i833ONV/HP4EZMp3HWKm/mCJqG2q/uVNu7vTmCrQTwKq7e2zYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="c9hC4F/N";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A95606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A95606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c9hC4F/N
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10963245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794828521; x=1795433321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=c9hC4F/NSxunMp98Uy5o26LR1MQvaKR9NzHdHBnsHjCptC/4eMfWfcc4Vc8rw1cQL8
         m4BU2M28Y8C5vgchczx9uDMfstCjmuhu2TfJTh34rolCj4oECv7+dvIBcaOORfCkWclT
         zycX8wLPseRJeGK7tiZQoGV+Q0rh/1mP1uyRoTx0UMM6nPm1Fcdc2lRqFOz+5l6brteN
         dQwCeLiEmfSB6E1/52AsWfp6RqJYvEMNA1ltqOuTlD7JYU6MyZjniAyi5MYLfaYjVARv
         2HSswS31FUiU42Z095awEC1TaQMSK/f6zPPT/V9Ew8LP/tXWIs6LM4Xaz85FOIVOtblI
         ASpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828521; x=1795433321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=eVz3WJtX5HzK3gdoQSVuTTd9r2wQ6u1CBRPya6JsHCKd9TvIyYYklAGjf0ppIHDQG3
         lVFpJvlb/TYBaQjpypbQbcEe09R5dJwv5Hc/u9w2JeVbpsJ3iUoT/RDRWYu21xqyO3ps
         /l2ioPdH1e3G6D2krQzQ8lMOv4Hbcpn/0wjc7L8ne8O2vFeFgHISB9WjY7Kk9p3U0yR5
         9gBxQWKzxX6Og88qJAfWJ4q15wkfGRx9hGx6xSwaEQIwlZtAjXSO7NTNwqEkc/CQxFWy
         4KmQIPgA+Z8ZClDfQV+Rm63aTylo1QaO8XuoDrNYF+6/bwgQozRWUzpG4IMXgZzEkWrV
         kspg==
X-Forwarded-Encrypted: i=1; AL+hErGxLyfkvHmONY7sNjhSYhwtUmRA0xQs+FDEsflzPmGjjuXVRwGtjetryzpNSQz627ufbdz5MvjBUc3bWYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rw99M0MML71PuytORZpQBarh30aU9UWAB6eC5GTxxWcUQ85uQ
	nCQUJ5nk4Q6yt7eIzsHhXVYRpDe6A8D5P44vpcx3ZNzmrrUZGFaYL7MHtIQRN7F6jw==
X-Gm-Gg: AYBFou2ufEcdI74hB/pK5O6/UUbyZPfJAZiCLQTl/fEu8W4FatvSS9dwN7WdM9tpqEh
	poZhtv3YPWvgdWSOJd2JPihhr/YwDpol09xUUwQdrONOyq/UmzmQ86P1W2IdEpq8ZrxSLD7cW79
	xKvw2SXNENTyhGyaKRiAjmKtqCc2jZp7auWTwyPuwnKzi0UsQJ6HwMePx3mbGeGEtxRfxLgRBm2
	NYuCHtdtIa6v/85AuxvIwUNI+InGkfJ3JM0lZm4H6rBaDV2v+JmvpNSBlwr5/WCH+rJ6ozeNiOb
	NdxybohyJkMB9gN/nJYTjgqkOsQu47pCmrWD2uTvTqPIdRuF55tdAz8Q6uVqRRupMUXHHl9PLAx
	H0eyc+GBqYEmHf4BaSfH9+0V/HZWTNASNC2AMjqCScFJKKDT4rH67Nx5NC42Onwxhm5Ns2j7mFL
	PKNNtCiuKKIfXb70fY/8rnm69eAvqtB1Yjf7QKDCe+taCNnfjDs19vv3bZGiJ9yxo8bHThAa/6l
	sHwtQGVmNIz9wXI8bwAt6BHBvCCc97KPXKQq+bjsCK11OzrHsnPzJCXgKP1C7iMN1+GZc7Fk5zm
	lyDmuqU9OKylVegCOom/xSFDImSAbBLotrzUdAfL6zxGaV7MjqEcxi/hAs0EAM2PvA==
X-Received: by 2002:a05:600c:5903:b0:4bb:60b3:7ea9 with SMTP id 5b1f17b1804b1-4bb60b38023mr126053495e9.0.1794828520786;
        Mon, 16 Nov 2026 03:28:40 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm21324022f8f.38.2026.11.16.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:28:39 -0800 (PST)
Date: Mon, 16 Nov 2026 11:28:35 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avro44jUWOARFzul@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
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
In-Reply-To: <20261116110549.1863653-1-fuad.tabba@linux.dev>

On Mon, Nov 16, 2026 at 11:05:49AM +0000, Fuad Tabba wrote:
> From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
> 
> On pKVM, set_memory_decrypted() shares pages with the host in place and
> without cache maintenance. The atomic pool, dma-direct and dynamic
> SWIOTLB pools zero their memory only after sharing it, so unless the
> page allocator has zeroed it, the host can read whatever the guest last
> left in it. Zeroing first isn't enough on its own, as the zeroes may not
> have been written back to memory, and a host that maps the pages
> Non-cacheable then reads the old contents.
> 
> Zero the range and clean it to the PoC before sharing it, so that no
> caller can hand the host stale data.
> 
> Fixes: ebc59b120c588 ("drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls")
> Fixes: e62decaf98e7c ("arm64/coco: Add pKVM as a CC platform")
> Link: https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> [fuad: take the pKVM hunk of v10 patch 2 as a standalone fix, add the clean to the PoC]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     This is the pKVM hunk of patch 2 of Aneesh's v10 [1] plus a clean to
>     the PoC, taken on its own because it fixes a bug that has exposed
>     guest memory to the host since v6.12.
>     
>     Based on Linux 7.4-rc3 (aebb727447640).
>     
>     [1] https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> 
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index 26fe9c3f22e36..81d1cd24a2eff 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -9,10 +9,12 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/array_size.h>
> +#include <linux/cacheflush.h>
>  #include <linux/io.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
>  #include <linux/pgtable.h>
> +#include <linux/string.h>
>  
>  #include <asm/hypervisor.h>
>  
> @@ -61,6 +63,15 @@ static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
>  
>  static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
>  {
> +	size_t size = numpages * PAGE_SIZE;
> +
> +	/*
> +	 * The host can read the pages as soon as they are shared, possibly
> +	 * through a Non-cacheable mapping. No caller relies on their contents.
> +	 */
> +	memset((void *)addr, 0, size);

Are we sure we want that? The guest may want to setup memory and then share it.
I am not sure about modifying this API. 

> +	dcache_clean_poc(addr, addr + size);

I believe the hypervisor is already doing the cache maintainance when the page
is mapped back into the host. (see stage2_map_walker_try_leaf())

-- 
Vincent

> +
>  	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
>  				  addr, numpages);
>  }
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> -- 
> 2.47.3
> 

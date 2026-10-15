Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC472D2486
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108538; cv=none; b=gxuUaDHmYPZxfWDuUwhq2mWn8aumTKKKzqmv1h+KeF6unBO4UskisqdY/W9WftWd2J19HgFik4n46M/KYVyxuQtlkL49vd0KPGEA/j1Y/+0RVO3wAhcmHDaAxG5WALW7CLYCwNNn47xuU8oF8LTfoTaT4ahPd02SZ5NwIcQBJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108538; c=relaxed/simple;
	bh=Ehw6rvE7MggWEFaG3dtW8QCrQMJWKzz2aYrhccXAY7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9QUG9oUYSsijRlCXYWkCd9fCQfofpqLjBk2QPdY/ihTa7qFy3RsawOpkR/RvkTviqoHwACfJlp9QvnauT2r85a1i/2l2mP3YcBQHbeiMp8LDhZcViPGL/t50rklX4xq0SlrxqVGc4bqWWlkbK/v89tekHwvf8LQUIfhdtvMYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JX4kG9IP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JX4kG9IP"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53606d2351aso20868921cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108536; x=1792713336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=JX4kG9IPpxFnaT/qmKUdUTIJwuOGRHy/XnkN6Jkbv0qvMDQZ0/dmWgrd5MDhfYdW9v
         bQIjeW4Ox930ZtARhWDdVKZKqjoe/hHPpVx+VPIXd6a5pSio9L6qy4K/UMmmOCfzjTuK
         +vqCqz1AA4atf0KbCuLkc/a0LWYDv++MXH+m1zSPOHfobkvWzsfLHezAIonvyyiafJ/T
         S0O3kMkIWFxkj05sVteHO21NnDHH0TomW04c2V9WXfui+9geuI6TWA0tP1acWJb0+jYw
         C81tCQPho24aCuiA5kSWhXz2RRw2edAiqv/8clRQBU+KmF78q4G1EYkeeQ9GVhOqvFB4
         IsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108536; x=1792713336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=XErPrG+6s8MSIZWJ9wmFTXOpLU8VkN9TzqMc7ckRouSWTK2/8xUc2xPvVp3WSHWY4Y
         2HsdAChnNtghAxzRxocTKxrnCK2rEvgIK4aXqoibMwxOWfqOBfksP2FE+gj6qePpEnXY
         VYOu/tBV/LmCDCLGTJkZSiDFkyuwa2ZY2prRBupX3tTxat3RcUfg5GYAiAd0/van9h7g
         3/SV690ZdtEt7/slTFvxnTE0Cj/SNvA1V7ySzmOvnEPluUjaaKeXZn5tkI94gwDoEejr
         LYcGxDnHOhFPtl0RVXRbzBxzzg3NcbzfPI3GWCIJxu+JCewjUgdQVNcSlGAO3VhmITKh
         BzbQ==
X-Forwarded-Encrypted: i=1; AKwUvByNSW56fJJlj3OL2pWir5UmR4hiZQ820bGIpzcldO5LzYAyoZW8iUpbcKAcHMZgoAcPu2bkrxqAxaVI7fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw42J6SilGLcottVwlIBDcg8H1BYZg2MBfljhn6d9VVWSf5E+5
	Q99UIzcxu+BPAG9aZ3gAD6vMGSQLRZaT171Eha4P14tuoqTbPyl9KTIzqG+49MArPmg=
X-Gm-Gg: AYBFou1emq1iyFt+E8fFzOsOR39ht01GGJlbcovWIsIHDyAhXXwEYX1Q1m6ufs8QXoV
	YCy+RRKa9hpepXLcxymXoQpkc4KJQivTOz0snMQ1Lu/Qmrj2oycR5Qu8QKTVYMOm9ib+i8VOH6r
	WZg9ckbxO3uYywbLXfrpAlvC4ZLP9QbCS8WbMVMAU/chXPuydua3HKkmH1q6XELOTV56lzfz2d2
	+8XXiZaY3BAzUVoyW+6OwOWExh0u/AOIMfBseGzveZadbSsokzzDBoZ9/I/KmC+YPfIjl+SUC1A
	XtR1yD46KADG2Vp8p9Kb9utkqsT16b8J5oevLuazfmQcJQS45cQVaE6DaIc8eUP2pVGnM8wnney
	WGhcg0BQVyan9thhmTERUKLQoi/Zyomsh6OtIEB4f5GelZh+ZAP/JBcHeSxO9TC/DwG0ZBR/ddC
	NzhSUt3/8KsMbP8fyxWkfGY9qeDUpzsVWoJdq8N5nnPGTX5FE067pBy82hQsXe0IeNLJHhVhzNb
	cXA68L0BdnhtW7Gs5luPWjabwgFACsW6pkDZ0w9Vco+d2bGNX8Fp0zn
X-Received: by 2002:a05:622a:251a:b0:532:f124:18dd with SMTP id d75a77b69052e-5359f49891emr329059071cf.11.1792108535894;
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4db4csm8430526d6.16.2026.10.15.16.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVIM-00000000Gew-3ViJ;
	Thu, 15 Oct 2026 20:55:34 -0300
Date: Thu, 15 Oct 2026 20:55:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 07/12] iommufd: Add RISC-V IOMMU hardware info type
Message-ID: <20261015235534.GA14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
 <20261015065232.604503-8-gong.shuai@sanechips.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-8-gong.shuai@sanechips.com.cn>

On Thu, Oct 15, 2026 at 02:52:27PM +0800, Gong Shuai wrote:
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> 
> Add IOMMU_HW_INFO_TYPE_RISCV and struct iommu_hw_info_riscv, which
> reports the RISC-V IOMMU Capabilities register through
> IOMMU_GET_HW_INFO.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> ---
>  include/uapi/linux/iommufd.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 36e6187bb34b..acfef0338cd1 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -716,6 +716,14 @@ struct iommu_hw_info_amd {
>  	__aligned_u64 efr2;
>  };
>  
> +/**
> + * struct iommu_hw_info_riscv - RISC-V IOMMU device info
> + * @capabilities: Value of RISC-V IOMMU Capabilities register
> + */
> +struct iommu_hw_info_riscv {
> +	__u64 capabilities;
> +};
> +

Same here, spec reference.

Also be careful to always use __aligned_u64, check all the patches.

JAson

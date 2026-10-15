Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264349EC40
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108444; cv=none; b=rtwKV7/0SxnJCJq+UqEjVN+IMdRMeebLbPSq1eIvAW8uI+6BSDkVOraPWWKG2YN20dR9gJUDMVddcMnyelsaOKAxT3Y0jgGZts4tRiX8mzmbAqA4fel59WNoAzG3zUPycHmW7K+uSYeh9Lhtis5h66T0oiRSGKHth+xbFjz/1qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108444; c=relaxed/simple;
	bh=O9I7s0SiZTNmPSjPh1Npkb7UZEefmXjtj9RzEUi5lqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuLSKefbp5XfIckJkeT95O+3U2/OF5D4GFwuaa9MHdqcOaeUtZGnqwOylQFfVUvs2hmicibGutn8WDUOIYfxGlK28et7p40XJR+ldjHDVxj+g7NZX0mx779uVjJl5F5eZlN1HlnV4TvNxsqmig8S9wp+7MtEjGnyD+sILyzVXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=O/oYrUTS; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="O/oYrUTS"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cb9e9405fso113449285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108442; x=1792713242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmHIZZgl56SndGmE7ZHoozI3Bjh3H3Lm9ikaXzIGcaI=;
        b=O/oYrUTSbqZbPkKd7/8mCnhpKatAQepktYFKZnsFoTPsmWiH2g4R5Gl0Wv0JVlKrTZ
         QzP4NN5AEovHsZUE//KZ/XSCxux7YkWVMeo0i8byGlBQzEkizYCanW3zTXLae4G6WYT/
         2uKGNu3KOLEWjF1/40qGEbhh76C7NCPVHfURyNG+GHcYufA5XeRSnAXF7IBYLx+hPSKz
         h+MQUyhG1f810fgLQVwNJWCE4Bb5Vp5efgi29i/RPwnw3ddDk/6j0c+rvLo3Plroc8Qh
         et/abuX8df3hd/Hd3tm5NdieeyGgqzlHmG5WergOJBkf9eaNBmk1WCB41MK83ANBuM/7
         cDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108442; x=1792713242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmHIZZgl56SndGmE7ZHoozI3Bjh3H3Lm9ikaXzIGcaI=;
        b=bfh7EOVoCSt0ljxqmonI9hMB+VuA8ABsOtwDCSL2/s3i9vHZdG3k3x5TY8NxBBAyEe
         tPm/dIEBeH1v3oXckJFH1DFS51LNTd1+kSDCUzUZmGo9Usbc112QSmZqsGKyxuD2eHvl
         SslQm17bknRLZWAuomxXwVa8iIbIlViZ8CTHrc5H5NN4B/tzTSodwEVyC1HOCfySfvnI
         H95sqWDpi0Kw0I0j7jdtkQECI3syltnFVGdaon+AuPpq4XRBsC3EsHvMk29qUke0BFwj
         K8wXHuHRz70lZrwOwKZeYQ6jlBfwsJtA5aIxG+/IaKF8ltNm0csQN5xYon0cIKd6Xz92
         XCyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwItyjVYOPbKjtu1ulaZl0i2JE8jOpgxGdaxKkDwfz+80chspk7vzKT9Q8lq+Mx1gnX/Q7mZtobKtLF2L4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIlwoucHVy8KSXSzK5qUk0h+l+qc1COPAsWJDU+3qtsyFLtbBf
	vyttPEuPIc+zYtNAW2vkjLi3XKvIoYcqvxfuKQ4GC6+P6tDYGyU337dgbuU6IXOAlgs=
X-Gm-Gg: AYBFou0OsS+z608/vwWx6EemAinBOewNdlaxZOQ15zsu/aV3WnfJkPlIvphB9s0zgRm
	4AtpFP2zoS0YCTslZ9KsU57OwzAk/j3EjvpVmgrID9OautXWUvAoHKCl265uuFmVT8GyILzp+tG
	3KH8FN2P8r36OzQFf0RTpH2Pu0v/k0IL24XuYAjhuFm55k8lfvv0oeORUIwx8mo7Kti/mDRgQ0s
	E3VRCAeeoxj9Lzw8y2VIO2azGzXhYv89g7fUJ8oXEsrJ2qKO2Z9qFofqMvmkTi9PMBqW39En4wF
	UT0GPGSKP7lLd8FWk58s8v4qiKV+NxVtX6pPk6zNTFT7pvDFOohR7cFtkChUfu69zT1nv1GpEIf
	EWnYgvFn6jv3zMvTI9seqiHeQsZTZXoEaTWPY1rso1xcy7rzY/ZDhhMOaJanlKZHUKAkrgjqSaY
	F+fYcLdypoTslem8IR+mkHF3gOg1+/bdDI78vitIF4AlgEDCT7wvLfTsbS8hfPmIF9DpGypdvlP
	1ZnoMkbOs1ueIWeKDwae1baymoYkZDefb7SZzvHQ28vfbH/bR/yGpwVKpUF58MbfPU=
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr3455302785a.45.1792108442214;
        Thu, 15 Oct 2026 16:54:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a19bb32sm62233685a.33.2026.10.15.16.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:54:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVGq-00000000GRr-1dQk;
	Thu, 15 Oct 2026 20:54:00 -0300
Date: Thu, 15 Oct 2026 20:54:00 -0300
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
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Message-ID: <20261015235400.GZ14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
 <20261015065232.604503-3-gong.shuai@sanechips.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-3-gong.shuai@sanechips.com.cn>

On Thu, Oct 15, 2026 at 02:52:22PM +0800, Gong Shuai wrote:

> +/**
> + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> + * @tc: Guest device context translation control
> + * @iosatp: Guest device context stage-1 root page table pointer
> + */
> +struct iommu_hwpt_riscv {
> +	__aligned_u64 tc;
> +	__aligned_u64 iosatp;
> +};

Like the others you need a spec reference explaining exactly what
these fields are.

Usually it should be the entire guest structure, is it only 16 bytes?

But this looks broadly right otherwise

Jason

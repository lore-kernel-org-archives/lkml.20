Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762549;
	b=U3Erq5aZNv4jBzB8InnVA19NmAhHy8OzcYDpH4X5bisjo01Zwm2c7I6f3Jzzd5Ts+nmK
	 fslC3sISRJSWmJUPsI+obsCwV4A+lwKXOkW03/1MKspkZJ7ElFn4ym446n0o2U0hXm8Mj
	 ZQS6Hia3wLEe/hYxvMIeg9vrgOB8fPwHxBMh9m7y07jwNlmh+sCU5fzciXZIuS41DQE2l
	 3EjxKHMh4IJK4pNXqkFTWlXljOZESDt0p30ae73LAs15HXO7F9hYHLBjmaNMSV//jl34U
	 6Y3+BjXEpc2coHB9h+vJLGmt05QT3g4sbU+HsF7pJXwF0bHhuKkt0x8OZDzcelJd8SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9CmvWQCO9ciSR83HG89op2Z5oG5Iu+ZEx0weEptYBic=;
	b=bATz72peDs/vnp5bUhKwuhqMTjbl42dh8Imm2aDz+9JQmU3K1LANlq35KRuWC0SkupdD
	 Qwjwd7m5IoKgoBewqW2bnyTBZVWglaEtY+ze9Ued86cJaLQFekzOEWAUcsmBkjFq6bWPB
	 4lAo2bxbW4kOCM3h89kk+qfF8YSt6p210NedK/DMJmNi9T75ZzU0TQmOrWV0gGGHhGsY7
	 zACdSu6sgLmPssGUP/HXeCErW1st0cbwf64GNLmWX9R9/q5/s6keAWnelNK+sQdPGrbT7
	 1CkCso/74KwkByuVz0J+TnUgswAW2O1bTc8AvVP4n+CxNg+o208cI0sncx3/7u/OQxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VKWEwwAs;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B228606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B228606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VKWEwwAs
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a707f37eso10352626d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792762548; x=1793367348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CmvWQCO9ciSR83HG89op2Z5oG5Iu+ZEx0weEptYBic=;
        b=VKWEwwAsSU1MuJqT+egyONm50MOgQnDPhzYvHcKfjpS2z3lrdKA23L2Y4ksLr4PX5f
         HqKHUn7hXLXCpW6lnESYR72KgPJn/3hIau7Dxq1H/AbR/XQYQA8DPHtF7cItzL6YTM7J
         /NgtYEz5IXLlm2b5FhGyCSf90rnJnedt9FqED7n4xuywoNVEe3urSGhwT9Vej7JF6rEw
         hD9DggeVvrD0uF2hPYA8CyEb9QDhmy5LE7Lc4iAvKxZ5HoZq1oJQNzMTvh0SGhnffCJ3
         WhdkE/eTPiC15IKV4K/td4wSyDel+6fSL01FMp408dDZbeDc/1bSMx3yJAUNoIv8aed8
         r2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762548; x=1793367348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CmvWQCO9ciSR83HG89op2Z5oG5Iu+ZEx0weEptYBic=;
        b=c4zKIz+xLyIAy2Wjt9ewRCIU4x1hgAkS414bFUsIyuYQ/Zf0RxGUrNLXoNxnhWrPlV
         6afQUa+oBoKT1UhMnF2w+Eg/q53TbjgcSbTHV8vVm8bGc9mrQ/U13Wx1W3fd9MV715lV
         AULl7JgNafAY/yqQXtI19yiJUFI2Lyf/9oh1tdXdg1JrgaT07hebiz7wE00+nr6mCjKe
         Ox0Zgi4psj0CtFKI+djLGYqxqlMZTk065NFJgP+DMRQ7k2oWBtuIWZQmIRIvMPQkYg1O
         oJAkk/hq4tDV8dnAjsywwTyH3y0UeP8ZfZCZPLQpA3zZ39DOpSWT3J5nWVccuupPtylY
         cZVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8BnUtlCazFNjmiGxZilOvpPwDJgMC9MyBGLzSPWFsH2mDw1krd6uHgsOcBRI8CMDFDhOqwyvI1yZMjWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdyXSg0FX3sA80K7MGxhE8nQGTct/sjqoGSJLzhnQIpW+KHyHh
	EP3/K/XhYVXwP+RWYK2cpz+vRdMqpB/AVrLacVPs5IH+tIOQbISoy1tYBMEmaXpSV9U=
X-Gm-Gg: AYBFou2nmmdRKlaXCpGh4rkxc8m8ZJwR5TWQl4/pZck2pTyM9P6WxNBVYZSrwlSgIyL
	1kR7yc0uR2xat5GCruw64sUS0X2DQxydnNJemt0ARqzIDW5q+X2Vu1PGiSfx7/xeV7WwjOZijYx
	VgY7YrIRT2Y2ZjcdU9+C69Ko4LqB/7vM/90Y75xBKPAMN8XihFOu0qaOG0YKKnPSLLTn4ZPKc5x
	Qx12YcNQrg/bC5OK7CAbtNN5+1FmRDgAmt1HhbwMBWNCF8cYGt0zR5SvaOKwIQyjFew4luWw+v7
	CClhvR6IrDiWGaUG0PI0SoKeLcWskdH81yAYlEVP2UId4UeXhMJ2CCjSJ7y1KMpeSW7TQnvJWKP
	x11umVXms9680j49X2QwClhIwzuTNMnUWRszPcD8QUimmZqr8L0sQ2eOURBRYCUuWpdESIVXOa1
	zwKB4CjsaHx1S27s+ZAtlbCoQAX8PAIs11Eu1wr34MJTOVUk/sy9yu+tNcPIpx9vDbJT0PLrUOp
	zBzkudk4bnHptq/3/JG571eFYUSLuKKLVGQ+dMWMuibZR7BtgXobBjTep2UStddwNIzZdy4buNU
	29UUXQ9nQDimbCBa30eaCJ82y+QNhfUqG0+RiMw=
X-Received: by 2002:a05:620a:45a7:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f6f823981mr398926785a.59.1792762547650;
        Fri, 23 Oct 2026 06:35:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b4f603sm17521885a.40.2026.10.23.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:35:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFQw-0000000Gghx-2aEb;
	Fri, 23 Oct 2026 10:35:46 -0300
Date: Fri, 23 Oct 2026 10:35:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB
 invalidation fails
Message-ID: <20261023133546.GK3381610@ziepe.ca>
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
 <20261020053435.1179054-5-oss.patchbox@gmail.com>
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
In-Reply-To: <20261020053435.1179054-5-oss.patchbox@gmail.com>

On Tue, Oct 20, 2026 at 01:34:23AM -0400, Yuho Choi wrote:
> riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
> right after riscv_iommu_iotlb_inval(), which does not report whether the
> invalidation commands could be queued or whether IOFENCE.C completed.
> If either fails, the pages go back to the page allocator while the IOMMU
> may still hold cached entries pointing to them, and whatever their next
> owner writes there can then be walked as page table entries.

Invalidation is not allowed to fail. Drivers always have to free the
pages.

The system is irrecoverably broken if the iommu driver blows up so
much it cannot invalidate.

Jason

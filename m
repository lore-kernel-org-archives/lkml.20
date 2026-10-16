Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9E4EC667
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108811; cv=none; b=ktcOP+NHGu7Wap//C4o3bJOFm1HMOS3RflNg9rC2Jy8bEW927WJ+xodq6+Z2C4AjF0kZs7gSHN5YkKNIhupK9YNwBtp0QY+YSaWJ6Dx0PFpsqpMM+sclBB6HbDgxu2Z50WeMyiy5D/Rgx8pfw9cWn5v91vxSMp4WFjwWESb9iC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108811; c=relaxed/simple;
	bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJEXO09cm4m8+wQsxrjreg0mb+kn/6MM5PVRJkB1E2R+9Vtst3Xxae0cu5jaJsKowSaL9PuEOWQxyb3tsftTPPaNZBBaYcMN5jiiNLj3DeZ/E29J0DzMW9DJO3KdhJuuSGMwS1PBVbcZV0UMiMMF69+28trqtz2o6TIX/KNOW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oeES/4ls; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oeES/4ls"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a707f37eso72684056d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108809; x=1792713609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=oeES/4lsLOyq6iDysQyL1B5xi59UWJQzeHHnLneDcRPAWcIVAeM6vJwv8xnwV4Y6kP
         F3yvNOgN8dKsbw6t3xX2J7hcHZJ3sDKz0+cYxpGrog5avZV1zKm64X4+ubIuuvzelovr
         4QAT7mPUDntexW6b63ykRbtEoYBSjQPAcE85i7diDm8xG1rcUgXyDwKf3AUYoA7WGyKK
         5CGcyacBMCik2W4awvlskERMgndl3J+qFtCSKO9PSuVV0c7M0dTGYFuzJCSH0Ts28yiY
         qqeQW0UbHn426QXsfzBX9viYYFRPjTuCTBxyLXFhSJQLRjYurxzDQ/chGlrLbjJytHTA
         9DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108809; x=1792713609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=BSRcTAgIhBd+27BUkRTjKkq6syB+5w7z+anpjDVXJMgeFtRAnVdWWEb4Kw5KI8KylE
         uAntoD/Cy0n5h5zPRxJNqRWxaIl2i/5rZ/Q7HV9Y5CAMDbhrBGViERZwdziBrVOS6MOU
         PFGfkw6XtjYyJdG3a7H87YTLUDJgCjvZ/uGCkKeJbcRIpEcmZmOOs5oiuY79N1VU38w8
         QV/fdh0mPPTrywmDRZ6je/Z1nOoByNFjVuKMgp/bvqT/FkKYgx4tUc6XWBYW0IA+cQ1+
         tV1e80iA6OaK+hqETHYhiD/7cBRrWD+LnzGEZ7WvGKlqgnwpvkoyMRx3m05LPviExtiT
         fhWA==
X-Forwarded-Encrypted: i=1; AKwUvBzdJwchxR1hDwNUEtDy4eBsSlUayc7/NmZinYOCNRu9+SaiRMIB9phEKdVODt94pR66UN8LJLSW76aLGRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN86pKQzsTaONy/maZ67o7Qazqxxt2LPkUFI+up1Ras+Qf/2Eb
	cxvn9G8rhDiQxtm1yhxAgfslkjH8lXTNRFXzAXpeMfn2mpmjCbspcn+/oMJXXzFOLRU=
X-Gm-Gg: AYBFou1tWu1sPTYG4ynzZKB3o7Ozo2nw/6xOS5ttBORLwwRqictepzSxJ3neXZ7snLB
	6DVzkWFHHTjdcsCTCOnWN3qmaYAGHco1Xufqqn3jyBhU7FZaTrEJU7+Fml2hW3r5G6s3EfCpsRc
	qo/kbDcqpNQ9ZqSQXiJmZwYLaN+Z/+8ONYV4V7Ok5Vkda1BF/enoaV4loS8IovU4MloxK+9dCVx
	/O9uAzBsq6MMSrp5X2EZh7I2YtBrzaYDJoxj0+8bIoP7wbdjKVDf0xWnGolCtuUxaQILJD6holR
	TTBDNzUR14LOwX3gQEH54URazbm+WqYjrCPRF/XXy9aHOvrHu8W89SD4Y6QvOUdwe4d3sOkiPZQ
	OJRe3Hn468qVmEv5cRMkQgdh333VPCrVIVPIrmjkB/PLATLOPVl+3OwnYLB/IWNh1V7CMXK/SlN
	3EMAl0eVLpw0/ki3HXf7V59+t5/yN8qj3rPSuVpO5cue60RwUpI70jBWUagXC4Y/Qdc5vzeYPk9
	5hTqY+kJi5fZLlekFR3YdZUPEROffG39+gyO0NbSA==
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id 6a1803df08f44-91b55793527mr367860846d6.38.1792108808237;
        Thu, 15 Oct 2026 17:00:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bce8918bdsm4228956d6.48.2026.10.15.17.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:00:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVMi-00000000H7g-17qS;
	Thu, 15 Oct 2026 21:00:04 -0300
Date: Thu, 15 Oct 2026 21:00:04 -0300
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
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016000004.GB14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>

On Thu, Oct 15, 2026 at 02:52:20PM +0800, Gong Shuai wrote:
> Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> with its own vIOMMU can own the first stage of a device context while the
> host keeps the second stage, and add the interrupt support. This is an RFC
> and comments on the design are welcome.

The iommufd parts looked reasonable to me

I feel some mild skepticism about all the MSI parts, it would be good
to get more of the interrupt stuff actually landed before posting this
again.

Please try harder on the commit messages, do not use AI to write them
like this. They need to explain why this patch exists and what problem
it is solving not some inscrutible description of what it contains.

You'll need other riscv people to help you with reviewing it.

Jason

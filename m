Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AA4503E8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291168; cv=none; b=JCQxQhiWlOP1KeSmiU06CLNg4rNsSJ0UH/jmA+mDVAj40AREaz6dAE7Kzp+GUAEGkHJkYD/4EskeSgnGyleYYgIP60Nkz88EguTQ34OLmKSWVcW6rDPnogsR3SrUaWa952AAkHhu11LZ2nHeMQNUIyPgl+Z7xjBm1JfWv6SZv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291168; c=relaxed/simple;
	bh=xlKJNWi5b2E8rg/y/va8nUurduBnJnez2GdpmjlIV4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDl8DCZv+Qdc4hltJe0TL5+jPYnjch2O5UVmW5s6DND348RnjdO22Ghg8qim39+a5EvhmIQnx5Rcgg8xFAMXwObN0kPu2eqSvWHn5ZT7vjQ4h6axFg+1uWL5HdSCO6QHkP2sEM+XKWLJ9Ejiw5qG0c6mX/TfB21DKUVblllEVZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HtoXxH58; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HtoXxH58"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c3735125bso130899eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790291165; x=1790895965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=HtoXxH58ig1H6BjmrNduqLi0wKuNdJ0rNX7zZbnurd+YS/VRUtHPubQ++JJm+sZImJ
         qzbbk+baLjnzI/vmuXGrPTlpzw0um8L4fmW3qV0zu3ht4csSLOmirqBKv7j17rOEQil9
         ITDQBwNbmdUqjCLe6m0KwZD0aGfwioXdzmNFcAoxYW0gWPYsA7LAOGS7Dc7rOqH7Qzu9
         LH6t1I/b5aK3Ff9RhDJv9/XQPg9jl5wPBQ5dq/tQhrHVKjZfdoUnc/zuCYDxA3sY0V6V
         lWwVxO6m+dEX02tNZEPCeNbJEtqmx5/I+gK5K8xpEoGfQ5b/k9a1ML8M+3+tzH51rpNP
         msgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790291165; x=1790895965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=rxkevpqSU0gYHKZF0isUo/t6/61QCIlf+WHWLi5dILh86OFRQ0lhhfEf8sFCHRKidH
         GQ4V8O4gRS9/aUx3UweNGtNelQ8f2JD11nwL+5SdNoxLqbky5f/LHZP0/Ke2V7zzcC4E
         xS2hERSQ4khlCfovos/vzHEERwVkF4RVfG8Wu3olvhu0QIVWBuJb2sbX0LKJIuKV91WC
         6/xBs2TfLNwdpjO2fQ2boxgGQnMvHVxZ+IIksH40BOitXLhqzEqPtQgVo+78Ztjon9WU
         GWFSyv5K3lpBU7yTwI+3qDQfX3LOyW8EBlI1liOFb8mj0yuIzwrCAt77MSFtpquNEMjy
         anfA==
X-Forwarded-Encrypted: i=1; AKwUvBwFcBYtmKVXWp9Nut7ZT7kANTr4Zc+NBjeb6jo9KYoqtoeg+3zqGEMpbx4WKZQH9TTO+LPls8s9OpiRzTw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWrp4SNmZa+PeCBXuDBXXS/mTjVLXoN5/+MuCcoqpgqlaX73b2
	wf8RGeifmoAQyy8cOYKsHA7dRccQiuMjIi9alb3X1x2CdMxwJNt5Fv2DCXFrnFfiEaY=
X-Gm-Gg: AYBFou11hefE7cs4iSezEm2+mFrmNUscSNVQUdEjltXwW0NgumFFf/Wu0V895KcSOlV
	wdjQwEE/VfLYQY8NKhvN4fbBJVEvrN3ZSgAGcW4Ywxj6/xacfuK6/DOwqF5CriSODi7d+g+2qgy
	45+QDSqUrfMnHiFs0g0hUI/2chm9hPztaCTDVaD1BmofJ0ms0fBJe4ZXABPk0jsJgxn9DwDXYp1
	DaLiWJi3dCDygOWLFLU/OLvPeyrNMqZ/C8A1B7sP33yAIOpLBpWmwMVsxhEZMFuQVax846o02pB
	Ph1jW7/uUagPxPTwNpHoBrtE+fPXbMi6PioRexTpb1JlPhQT3HjdH+4CvCDsDbGxXXC1QJWhzGL
	Q9CJyMi7rH1eHdIzYlcE0H2qCHO4u4LjT+wYA/U1YDMyL/v05fG1N4Zh8QE3QO9pyc+z685Yym7
	S+2KNoJdl0Jj9rcOEZeaq98l3iGs40IW1tDxOFa/OQmb30
X-Received: by 2002:a05:7301:6406:b0:33e:42d5:1d3 with SMTP id 5a478bee46e88-34000c382e2mr2555669eec.30.1790291164415;
        Thu, 24 Sep 2026 16:06:04 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1480231eec.10.2026.09.24.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:06:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sVu-00000000fXu-3DDy;
	Thu, 24 Sep 2026 20:06:02 -0300
Date: Thu, 24 Sep 2026 20:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
Message-ID: <20260924230602.GE16465@ziepe.ca>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
 <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>

On Fri, Sep 11, 2026 at 09:21:06PM +0000, Peter Griffin wrote:
> The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
> integration where the AxPROT[2] signal is always 1, which makes all
> transactions appear as instructions.
> 
> To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
> unprivilieged writable buffers are treated as Privileged Execute-Never
> (PXN)), as a software workaround we make use of the INSTCFG override
> feature to force all incoming traffic to data.
> 
> To enable this workaround, the "arm,instdata-override" DT property can be
> provided in the device tree entry for the SMMU, similar to how existing
> errata workarounds are handled by this driver.
> 
> Note this is added for "stage-1" and "stage-2" but we intentionally leave
> out "bypass" as nothing is downstream of the SMMU that makes use of the
> Instruction/Data attribute.
> 
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> [peter.griffin: ported to upstream, updated commit message, remove
> feature flag]
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2
>  - Fixup incorrect bracket (Sashiko / Nicolin)
>  - Add more verbose description of the issue (Will/Robin)
>  - Add note about why "bypass" is not required (Nicolin)
>  - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
>  - Move check closer to IDR1_ATTR_TYPES_OVR read
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
>  2 files changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

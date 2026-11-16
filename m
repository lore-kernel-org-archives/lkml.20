Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857424;
	b=m2VSu9MBRFR4AeiYXpFFpkbHSULIcuEcZHhSLwGXc9QwYqaD6BVzcS+kM86ndW6gPGZZ
	 iiMDUx5V+aZHcL8btn9Br5A2R5nmsPO2KpraaaXSfRnuaJwUdMMXfrpr4X4O8jbTDfhaZ
	 01w6v+1EnvfC0+q5mhtHCD0UVpdx9wO3XpaOPpc0Rg5BVsIvwfapghs0Fm8LKelFp71yP
	 ivQEuQS1XCzcpEs7uBY+IY49f9HYcx3GLZpLb7JWTbXIYH4H4rgMZpOQVTPdu6vPN/INf
	 Wpk56rSbQz5ws7QYarH+AJElIaCiMWNDss1JOY9+d+1lE2V4roKQL4EWZgFkTats/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
	b=SDVOajSJcsci2AcZ2M5iBGVCqULlHFGXNT1YHBVMQ0FrY6DMnNArAnCCu8kT2F8waVXV
	 brfa/wqVYic3TbiJvLzpE+lzqtaMP8+4QC2xHorWPvFzdls4IV7ppHynR0qYLb7KfkbWK
	 +ER1TiAUWnOCBeebH1Dllr9Eo+AxavZTUmK6wPCPdin6iXrbK8z6YqXs9hSsdcEsmYEWo
	 DMbJbF9bIOKa3bJPlyuZFwlYYbn1NVG6dA0okSRxlFJr6IguSFZ25K6zhi/btky5LO85W
	 eA5QhH5Aci+qxVw8US1T+gLVAn/PTuWN7NSm9nwgi+5aIFAtRDphIvwubgt83VkOBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBE606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DBE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9496473b511so23634385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=E96WAHkT+sP92lQq8lfU7rpYkYmClz1BkPu1iXTnY8MIB//GemYHc5QdBt1ld40Smy
         acUqrFGAqUxCszfVw+pzy4SnJCfUKiX/A4Q+0gJXedFRj+sYatxoMGnyXMoUK+xgqxjR
         s4wgXwYNtTus15EIP5/qVjorQQoKK/mBth3DTSneehjsfS+0679AFf3GT8wrrI+TLrTG
         S67lGTnC4/NuArZMxsujuqU9DVFtqdgciQWqSBdOrH62D7p7LY8rnKE/kpe2Uczm3HkT
         7VhnHMuAAjm5NWwm6eproW22AIWHmXSjkJumB6jc+PP/hWJaqbaadKSgQjgzEdlnANOm
         VH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=pgT6JZwVVW/PgMQ2vE07klAZQ5GTE5p5qHlGh63DWvNdz5RIAcgsDwWqgmYrjBpPeB
         Q0lJy8ZGKsVzNDUWW4bofReaYKWhn9b1exeVbHJtKzleVUnC7/9DDK7MNx4C0Q8NhbnD
         MU+P8LsYUblerr9TUO0ZKEI8j7APL2fJlq3gLjw1V8CbggPWv7sNWM1ctYK8V7c8m3KB
         x8M+qUZiPQyKLIQkhP9aylSyzP2P+5sQEIDscZHnTNh3cLoQwnIA/onPL3pzqm6KD96d
         nI03ZETG1i1ajH+8FaGJ4u7UTNtUT23WvJEKPsDPiHDADUkkIWRAXDSxqj7ibA2mggRe
         LqFg==
X-Forwarded-Encrypted: i=1; AL+hErE8X30WQDsJFb4OhBHxFDRixRXf4SK/kgH37Td3sTWrAQwJJ+vM6+nItTL++PEm+v4h31ulviO2B9K5cmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QSE2ivVx8h43Gqmh0XKPwNDEBz7650zlHZOM9RzHtPT2aRI+r
	Nmxn3X795zUN1WOJMIe6tvQMCAhWRW1okjt701N58HpwdJDQLZZIlXRWfoa+OZOu/F0=
X-Gm-Gg: AYBFou27inKuMG82/2Sje0eE+1llfh6J1TZAXV6ON0CSJ+9sht6/R8Vkim9Tf9CSzHZ
	Fq9IEvM/SwhAFT+8iisBixuYNj+yxwsXns/QeG0nZsNkr8dWMuIn2D6BlGCq6Z9PrFndaAkZ6wZ
	Gn1wkZcUOBQOTvGJx0kD/4eFg6MZO485bL/8wJX4jGIU70PEeSYWfAlQ+k8iXGeHyXP+gRrOT5U
	p+7m3ollTRkDTq4KoA7l6tFuepbh8cVCmbQuHncsXpD9rgWPh5djrjX25quCCgAFICfhCUHOGBF
	Wof8B41ExbgNcQQsC+rwG+BxKwj2C5ypUnYSGjENXwSMRZwcYLTGdwR6ID1LJUrLCORFFxtI4lD
	hYxfVNZ1odsybPSNXIBQgxfdxlw4tPQY6igbo8SIDJ0sTPhNlEFbBFlyIkeol0kHBKZ/msm/bGI
	+vrT5CA8doqBWF7EUDWP5h6GabBGnPh/GEPyKHdHTib4unFYcqxGxbtq4I/KsYCRAeVMFDA5kMe
	ROodIZ8eL0dq3grZiFVygV/+nohg2sVzEE9n+UIsZudaIGLPIPxKYQav72g7o/BcVrmJuSIr0gQ
	zmOLIg==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
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
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason

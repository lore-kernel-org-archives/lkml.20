Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920411;
	b=F1F4aeLjIBcrdL2g5gtECMq80s1b4yXtagbkQQWvL1AQ4k1ADZHGF16FnmcEaYf0/zuz
	 rRCoajlHteP1qovcxhNZ85SchQwuD0XMg/jpgy6gibqZlEvYXJN81jfGKixoLU5W3zTLI
	 2pXHl2mvVjwwE6iqv2yBU8Chlh66EQNUuluwFCMG4zy1wmCvEiu9DSXvr2LS17Uenkbmb
	 IjP47rz7ylcK81kvy1ka5o6NgRJSrQkJR2NHWw2DXWJNNwekb3SFtlTjTiymBVk3Tp93E
	 rmQOxsxrEjEASQIhomHdOyc43D+kxPAMsdA7/73rPkHU9Cm4GA7C1xA1y4K/UnNPOiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
	b=FjdDQB4/yq1z9S8CuxjPOd6BlI5W1Eb2/lt+PfaMI53FSAgg4RYiFRn4fyqzcU4M1SHv
	 JbYp1bP0OV/8uESCG3sFJB4ITZNbYkpI5jnLLsjxOM2ob/hjQaVnYbOC4YTZ3EucnIk3G
	 EoxVBcWmgKKuSvtDDRkMtLFKZoYWwqL4+xHEX1VPQjshQSAYNoc9qek9M0YxlNCO0V5bp
	 Jw0NZaiQXdQ+4a701qmpvJO0NSpzgL8vtt9sJR/9xGn7XyKAVJcICsLFP2KcjAGfDgsaN
	 NwbkvMNvhOdk9LvTV9WELCK1w0w4rjabHS1JOJL99DBkmP+iVgM9ULcBPerSJtvbG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="f/sG3061";
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A1606A8BF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0A1606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=f/sG3061
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91f11161831so29933956d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794920409; x=1795525209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=f/sG3061BiDtzYbu/u9CMnLL3fCvqZDyjJyMktvEFUz3a2EL7GbMEblMaUGHRCccZb
         amJ1tPmMY5qRz+xDbqHepfli9In09eKumZOL0YVJbC+kk+2Oz9/6s1IvGxQxvC9H1MRM
         4utrNUgF2Ir4qMwPkcDmFSqDiHVbdj6Hw9ZpQ5tcC6UXm/cJzsd9tuHY1yPYuo/jI5UB
         oInfS8kaWsmVfM2HsfGTm5UGLYaBmk9MDvcmBoLxAIOdDKZZR09vjlrn77Yf8d0bgeo6
         KbD8o1R/mXI8WEeK3aorXTXQhIOXV8P3nUOyV2fCi2oPxWeVYClMWVk2QspiPzG92hbS
         d4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920409; x=1795525209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=Y7AqMo/KN8fTlVAwCpLwdghFFzarFTMy/nK5rkQhiOtUClOFn8Gx7Gchldf3t8qpKr
         PPUFINdpcwwKoQ77A8XGLNevcoFb+IxIyhiUPgeGvqBiKxRyNf9B4jo8RmRsSwlaWWbw
         WNoYveThC2+kAsC3rM1CmHS7n7lABLy0AqnH/2wN/76n29skm5Aw37LTzeEeYsP0x/c0
         I2/LgaOuKas1RE+Ky/OvkoMeNMwGdDv2eWqenpga6QuMHDoBN0oH+YCQj9dDBoSBCnNz
         A6yRXaLHn8FrFzSBPkYFz8RRJPpTL7LlsY+p5Wq8jstE2Mr7J87FBbUGA2aXUuo0IOAt
         ClFQ==
X-Forwarded-Encrypted: i=1; AL+hErF9HS9wZOOuHfj1x1D7QEadi8FIpr3AXvgxVvdaFErcNopWbtNwbsRe1iEeU5aOrTmuZaNsed5M0M+KUSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/weDXV73m5AQsR9hlGs6Bb7ML4WWN0u2A37NFwxlvgpw9v+NOG
	sdOc27fw/ZlQhIbUxa+S8zcfmzJgYU9qyqsgbFq62XCDT5HUlnJBLr9GL/hAaZh2Cik=
X-Gm-Gg: AYBFou1h25CWJDPkr9dDPi62tPyIFVhG7DjrV3pMGHKGjw+MA74RSzecKY/yVhoJuWw
	feVW6mTNLu+9O22k6Sx8oG3pNCSpq+PQ1GfU2HfsyybVWzQDxWlZ6EVpcvAMOqYpFSXLkcgpfnn
	Id4LSrVAqpYYa2YE1o3USTh238YVmLnBGMllqcCQzLX8p7OwzhCUqJW3V57kYmBSE26zsaHq88i
	u5sbzQdnP1yLBbgB6VLN/9ZgSuLpB3U4NfqM1Nlt4iGkqXrl2qEnSEpzU2oqJ7OX7rWw9KlXAx1
	63S7o7F10h/0sOAerFUn7E4Z154RQZIVgrB61yMWoimZjy7eS3ZxAmcjLdCilAhpAH19UFdTSI8
	wQ3oMJGkxhaA1NWHZ8jxqiz7iNwua4y7rOM2DwPaJSFmGCkg1vCAk1GtmtHS2UPFgcVr3M+kbTI
	3laSJOjhYKDdmuIPOAZgugpfaTvZehwfodwjLb2h8K5D2EepMFqMrC1Uojyqte1JwV3PuHw5/U0
	xjWt9WMlQSA1tSPv5263TnAIuxhptsGbFc5QhXW8od30pXKdrKA3SzOpxNCBcEEBZwvyM43PHIR
	IcOqXZ3We46+qOha/gThws49U2I=
X-Received: by 2002:a05:620a:a208:b0:949:5c62:e775 with SMTP id af79cd13be357-9495c62ea7emr1501690585a.15.1794920408653;
        Tue, 17 Nov 2026 05:00:08 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803abbsm1067907885a.7.2026.11.17.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTIn7-0000000CJGS-3fNi;
	Tue, 17 Nov 2026 09:00:05 -0400
Date: Tue, 17 Nov 2026 09:00:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117130005.GC2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
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
In-Reply-To: <avwQl18smAW4R6ec@fedora>

On Tue, Nov 17, 2026 at 04:30:15PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
> >On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> >> I used iommu-map for eDMA, but iommu experts rejected it:
> >> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> >> kernel creates is the same kind of DT abuse from over here:"
> >> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> >> 
> >> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> >> "Thanks Jason for context and detailed arguments. Robin did not chime in
> >> yet, but from what I understood the DT-child-node approach will be the
> >> way we should go here.
> >> 
> >> I accept above point of view and I am fine with this, thus Vishnu and
> >> Vikash - please go ahead with DT-child-node solution we had some time ago."
> >> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> >> 
> >> This series adds per-channel DT child node support to fsl-edma and, as a
> >> prerequisite, introduces a proper bus for DMA channel devices.
> >
> >To be fair this is discouraged too, now that I've seen 3-4 people
> >trying to do exactly the same thing I'm not as positive about the
> >DT-child-node hack.
> 
> I may not describe it clear in cover-letter.
> 
> I understand the concern. Let me explain why I believe it is justified here
> rather than a hack.
> 
> On i.MX eDMA each channel has its own interrupt, its own register region,
> and on i.MX8QM even its own power domain. Each channel may also have its
> own Stream ID, or share one when SIDs are scarce. These are genuine
> per-channel hardware resources, not software fiction.
> 
> In dmaengine each channel is already modeled as a channel device (see
> dmaengine_chan_dev()), and this series puts those devices on a real bus
> (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> describes that existing device, so its reg/interrupts/power-domains/iommus
> are attached per channel instead of as index-matched flat lists on the
> controller.

If they are real devices then why can't they come out as platform
devices?

I think you are overstating how independent they are. Many single
devices have per "channel" resources like MMIO and IRQs. That's
totally normal. It doesn't make the sub resources independent devices.

AFAICT what you have here is some HW designer used SID where they
should have used SSID and you are trying to hack DT to make that
usable because Linux does not support a SID as SSID model today.

Again, since this is the 3rd - 4th case like this, it seems like a
popular hardware choice and we should try to do better to make Linux
support if we can.

Jason

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479969;
	b=Ta8Ma1Q0xO2V9UMUigLOrjWSnRv8QNOve41+dCTKkU9xf1OBMY0Z5KlAL62AQk2EJHGH
	 6rzsEuCVZPzfSAwr72wJ5wO3J0z9dlNs+JW4ODtqHZiCArJ3KNaoulKub1aa3WmD5f127
	 nOC2oZxaLCBWK6/x+gLq1kNMBEO+8Uh3U4rdZOlMACKGkiaXLRTpBPhDSAlEucGQNnXjO
	 WHV+MtYTuArEbnHQPqLF6LBp45EL1yk+HqQnBeB6hzmIh1VtltRf1TwmZgSuEHgxftEkS
	 uLSIfMVxcWe3okKLSPfddpihBKy+q3X2ycZaj+pJLnO52aLsCcYVbWrW/dh/SRRC/2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jj+KwhjsJ+azPCQ+Sz77HwA7gwWIyWEvUjsiCGUD9u8=;
	b=Yy2xpTHw7xxOarKajJJKp2/tn/TeG7MQPTaqDHPUbTv6rTeTrQCqFQAS2/tYGb0qRByb
	 +Abue9y3wP7c3tM+pynbCLRBznYAnxd3vVYxSxgu5hHjqa8teXrnkccMRA3iBYCOFFaHi
	 KCQ8caIkEx/bT13qnkIaaJE7floMEQCdf6mFtzPhjpFf5dStPahMVIkCOHLbHXjnRHTh0
	 W2dtYfn7blSADu8cFf0k6VnqeHdisp/SD2hC75Q9DxvgVIikRmIUDQ6LQdBcPeZzq//IP
	 xIIRm2dzzc2LzFTJb+/AZ98jENXn+dRGfagk4R6N0lfY+erAvDvBBsP9eJNsSmVqDLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leoUnOsz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4792C606A321;
	Thu, 12 Nov 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leoUnOsz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECE71F00A06;
	Thu, 12 Nov 2026 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479968;
	bh=jj+KwhjsJ+azPCQ+Sz77HwA7gwWIyWEvUjsiCGUD9u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=leoUnOszVpSJqwsR8md0YdWjHXpHl4M2/n9Z08ff7NloH+4Flaa8LxuaBJkUUb7MV
	 YAXJXa3RpJUht1Czmn3VGmFj0izv8qZDERStGMdyRmxcxpxIE9L00dc2Cy+zzLbCSA
	 9d5lb6ZbcOKpybjUIYfm2y+sSXjgqw8Ej9i4TOT1wIjqMNBgg3xYV1UZjLWWVnEc6l
	 Zrz9lLQvECj/6D9kP19PjPfN8JYS/UvnElx7kdxeGEj4CUPl4Ky5BYiejI/cKcpDiE
	 65gp1sB/1Rkc3rDxdtWwofBgLtMQpWtz+AwvVJh32y/QWqMmenrShvlQmGJUiTOnhj
	 gfat2VCLaBybw==
Date: Thu, 12 Nov 2026 16:09:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-ID: <avWXXVE9WuLUPbn5@parshuram>
References: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
 <avWB6_hSarfdJV5-@parshuram>
 <dcc4d7a7-6408-48c4-8fd3-af96519fbd72@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcc4d7a7-6408-48c4-8fd3-af96519fbd72@oss.qualcomm.com>

On 12-11-26, 14:43, Krishna Kurapati wrote:

> > This fails to build:
> > 
> > drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c: In function ‘eusb2_repeater_exit’:
> > drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:231:24: error: ‘struct eusb2_repeater’ has no member named ‘base’
> > 
> 
> Hi Vinod,
> 
>  When [1] got merged it removed the base pointer. Hence v1 of this patch
> fails with error saying that base is not present. But v2 has been rebased.
> This v1 gives the issue but not v2. I see that you have applied v1. Can you
> revert that and take in v2.
Done

-- 
~Vinod

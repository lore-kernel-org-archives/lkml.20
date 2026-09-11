Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F03CA487;
	Fri, 11 Sep 2026 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111337; cv=none; b=OhC6v0YPy16OAWB0++Gc6+z9X0Q6kAaECemQ3jJGNGpBJij/keeyBZVjGe8AQDuWF9OTGTscUb6knfdGvnjT04PICemkMy4RWTPxm5EL84ecNNRMUqHPQOSZk5W+nH0rNAlA0C9ZkVX1Yh8kcYprFrUD0OfI+oLXnRaSNptEDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111337; c=relaxed/simple;
	bh=GSzeQlze8mk25qilmRgYJmp+Hv2x6iqlsFKSe7tqdbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYiU+kLfh9ZhxjCkgdVsQ5rB+B5WLlBFnZnoqRyvb41YcJl0FveMnlkEJfTMht9YYqtM6r+fl8Y9DvBKZIw9xMvVPe2jG8dfbIEgCDjoUieOU3ngVnoHEyAWqbQYm8IKdUdsONqmtmJy69xmpUeO5A9mhQP3igHV5DejAEkXTSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBfB9ZEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBfB9ZEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016761F000FF;
	Fri, 11 Sep 2026 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111323;
	bh=IhwF+lrZvFWuzKFVCCY0bHX+OUwiXbN1quuZf6B4SrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hBfB9ZEr6afNsMfK/nKM69m/AR9s/tbujMc5F3I350GYEopaPrRXAXlsOP3Z0knjK
	 c5Lj5YG6blzay6u+pCeicE6ga/S6ZATzqU3+5u91Uyti9mQsI51pPlt5pihe14zs53
	 hqoOeFmYaYpMrhQzfAN1MP5+zVKlAz6tw1KbjEIAzFkGvUVe25lkiCytZpc9Qrbr8h
	 JDORobxSDnYTEd/BeiuazJSPqt+QYAunGRj2unQ+9MK0QhJKrf0ZMSoLgh/mRy5eeM
	 fWzzGaQAhfKM+hi0JcSBRH+cdHxzfSrtkKdZISrr+U0Zfc497V5kJ+Q29aMK4tM/FN
	 1JtB4Gtts74Yg==
Date: Fri, 11 Sep 2026 09:21:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] arm64: dts: intel: agilex5: add USB3.1 controller
 node
Message-ID: <20260911-courageous-ninja-gibbon-9f8b0d@quoll>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>

On Wed, Sep 09, 2026 at 01:04:38AM +0800, Adrian Ng Ho Yin wrote:
> Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
> Place it under a simple-bus with a 40-bit dma-ranges window (#address-cells
> = 2) to match the USB DMA address width of the interconnect. Enable it in
> host mode on the SoCDK board.
> 
> ref and suspend both use AGILEX5_USB31_SUSPEND_CLK because they share the
> same hardware clock source on this SoC.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Same comments apply. From 5 revisions ago!

Best regards,
Krzysztof


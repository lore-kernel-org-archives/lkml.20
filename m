Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E64B8280;
	Mon, 28 Sep 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596909; cv=none; b=mXVdC3pPrJPjZ/qDCid2RZup2uBbDkmhHmE4Dkky6SqUnXYMtdXbcQ1x93vTWQrqUTeHDBI31Arat/wjkUm3M5MbFpcit3DFu+bjTTfB1Z2mE37bKLy0x+f73wN1M7Pt43Qw21/n8GSoqqbR1h7mSxvSIPosXNW6omvML0jdPV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596909; c=relaxed/simple;
	bh=NtquoIUVPPcG6J/RUtVN6pPWA9agt77u1FTDFqJhyHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKOVDDQnA1FtqYJn4os2U03LZ429DQjnxKL2kKtfgiwwIyD/Xtq3HYFZiW80I3z9/H2jE46NPnteIzy9n/U/5/330uFmUfP+ITxWfxzOKSJZ1BB1BHZPglylWjB+HvXrt8o5iyGK8T0hwDeHH45bicIu0a5XHonT/k+TroBMURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CZOrgM0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CZOrgM0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F74C1F00898;
	Mon, 28 Sep 2026 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790596907;
	bh=XCxphfmmNLJionjwTpfejETuGwU8B2c0wOq0Nh0p5YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZOrgM0S710Oy5KmMYl8gHqQ9xPKJ7GM/SO7nIw9sLWTqda7McqswDpom81C8AuiU
	 udYR2Hz0fwT9TuUnIFp1au8GaKH1GwE5jKoS241VE3guUdPQ3ch4RFfmxSLXfBIcDk
	 wUK9OnQ/S8p+GkHUSok5Qn+MDvDK8SYvmVd2dqL0=
Date: Mon, 28 Sep 2026 14:01:42 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-kernel@vger.kernel.org, alexs@kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>, linux-doc@vger.kernel.org,
	corbet@lwn.net, si.yanteng@linux.dev, skhan@linuxfoundation.org,
	rdunlap@infradead.org
Subject: Re: [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <2026092803-harmonics-unreeling-0760@gregkh>
References: <CAMnqnYxiXKZOOOCjWEijLaQuBsMELM3q3VKhTqrkd0zX-1zyWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYxiXKZOOOCjWEijLaQuBsMELM3q3VKhTqrkd0zX-1zyWA@mail.gmail.com>

On Mon, Sep 28, 2026 at 11:34:23AM +0200, Jiaming Ouyang wrote:
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
> 
> Changes in v2:
> - Correct the date
> - Correct the layout
> - Add specific details for it's contributors
> ---
>  .../translations/zh_CN/usb/index.rst          |  2 +-
>  Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst

This is different from the last v2 version.

Wait a few days, look at all of the review comments, respin a new
version based on them, and then submit it.  There is no rush here.

thanks,

greg k-h

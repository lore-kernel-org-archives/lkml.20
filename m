Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F390A4FDA73
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018074; cv=none; b=OF/YZQ2BmgpMkC0Dn1/efWNLqchvR73wpXlTaX3XsbWcAWYs2N847K0iQCTGXP1judWQ1PKzGA3vtrxCdCRtCXF/JBxAdPItFpoGPF4o1B9aTPMFqGs6R5l9l/6TfZRzIzo0UzfaDhYfmz1HrbgyNZcDSKA5C0/XT4MhljI5dho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018074; c=relaxed/simple;
	bh=KxntWnzheYe7aq7FJlVwNL37yWxD8kE9gW/pUVxHIi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLRVDLJg2paT6JhsqURzICUNV6ma05xH/Jea6zKP/zspdVLo8gGS+gmVoFivGFF0ogtD7asE2sAEskrG9xM4CKfBLu12q9Gnwl9lk8bLShEvRNxZ0BnLzEwxb2odbS30DNZfnWPh6grUooMIeWiCfdG0qvD3MJiODsozKQlyyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r+nVyD8T; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r+nVyD8T"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00D87C5CD60;
	Mon, 21 Sep 2026 19:15:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 946665FFB2;
	Mon, 21 Sep 2026 19:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F1A8103291F5;
	Mon, 21 Sep 2026 21:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790018064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AUyQaoB+g31JYVWjGmUNzDkSUgjgYJr+8gIoAobc9Aw=;
	b=r+nVyD8TgmkCxNv4rIpNVlgZZJNDA6KIHJIa3FE12rJZI4ulsSURC6KyPM1oG9nvh+hloD
	MRqDRedw86zeTKO34Z3+GTBnpL/HNsGCcWue6rPsjECmrz3DHl0uZScCXFacb8s1cdRk4I
	SDr5OAPnjbvfsZ7nMmQ+vXVWHyK17hgLmKY2YNPaXHqFJcVKiGdXJW7roMB0dfa+Bn8wfO
	dKgal56Q37qbeqfMw4WOeii7E9xoHY6T+o/D+11SrIyj26KGpAgxBAX4+VGT8Y65Xd2aMF
	1VMoBn2bwHJtb3F7Zm+1MCMJ9DJMOYQ/qfTK4MfowyZUCkXUcVp8VjA7C+3BEg==
Date: Mon, 21 Sep 2026 21:14:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Liu Dalin <liudalin@kylinsec.com.cn>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: Re: [PATCH] rtc: dev: zero-initialize struct rtc_wkalrm to prevent
 information leak
Message-ID: <179001804421.244067.9208367947184910735.b4-ty@b4>
References: <B28B7DE18F3A9447+20260827015444.3314227-1-liudalin@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B28B7DE18F3A9447+20260827015444.3314227-1-liudalin@kylinsec.com.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 27 Aug 2026 09:54:44 +0800, Liu Dalin wrote:
> The struct rtc_wkalrm has padding holes after the 'pending' member.
> When returned to userspace via the RTC_WKALRM_RD ioctl, uninitialized
> kernel stack data residing in these holes may be leaked.
> 
> Zero-initialize the struct at declaration to eliminate this information
> leak risk.
> 
> [...]

Applied, thanks!

[1/1] rtc: dev: zero-initialize struct rtc_wkalrm to prevent information leak
      https://git.kernel.org/abelloni/c/0ee5c5d804d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

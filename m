Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025180;
	b=kBfeWXmkOK4Vbf7AazqErAUSweOtwYMqhp4C+ikQJBYGHCVmwxU4Ahn/QotvELEJGiKw
	 VbiKxqu3B64UR0z/+qyEtIu4CbwDsVLdvwR02A5uZKFvd/MBhMzYh83g05iXRn76nrM+B
	 z8528poyo9XqLnf8T1zn5VNA106qgDG0tTvFryckQOQT5gbHPEHo6NtWrz/n7aPlSl13E
	 9V9AkDdnXR3W96ufJV362Zhiqwbnbe2oLFhmDlIoNH/w/rF8IIZzpqUPNApwpiC4ZnStk
	 K/AxhKR4iuUnNGwTtaUtYG0xO/DvuMCItHh4wZAqrKvM0PgFBjAveq3iKbEEDOHrLIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025180;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nxroCo34x7T7RHbBwBwKmhYgc/yKXzxDv+knPgYJzM0=;
	b=1502pgjkrJYS0befu2NJmbK5Fx8a2D2+90G849Y+cS730Hkw3uWOWcX3uZo3UR/PyjOy
	 0xK3qkAxQi/rS18norBaARthb8kcC4s/UAHuns6oeEnobEfFqRQyPv6S6YKO3nuHNh0+N
	 1jXWF4VlR2/38HCI4BNsamNZKjt/ugYPFpfTpqL3RkMv2ugirOS736hrYss7P17KJkXsv
	 M9C07CmfrCbh3PF2Y9klymYttcuMKOMFEQReqbpB++D9YSbDcadrA//DjKzA3RthIr9Qx
	 NsOEI7zFLQzfyo0MnLvsdbgjDV80jiY3P1zRNYuvFgTvdz5FEH2yjwc1/lnnkL8ynbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=u1gWMeOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA14606A31A;
	Mon, 26 Oct 2026 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=u1gWMeOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE9E1F01825;
	Mon, 26 Oct 2026 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793025179;
	bh=nxroCo34x7T7RHbBwBwKmhYgc/yKXzxDv+knPgYJzM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u1gWMeOEqsgX3DQhG8U7QMCDX9HunQk8ti7Iu0jDjOnG4le22ZgEdFhd2uwWaF5No
	 N873UunNnU1ywuEvs2/ydYs0/HC9tsz+Ns8ljipSthjskIh/g98Dpx07rev5FZ2YZQ
	 tiP4Pk2bndB3f+mLz7aUsk+1SKV/nPzl1g7Mecic=
Date: Mon, 26 Oct 2026 15:32:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ohci-spear: check clk_prepare_enable in probe
Message-ID: <2026102645-dinginess-vowed-0d5c@gregkh>
References: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
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
In-Reply-To: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>

On Mon, Oct 26, 2026 at 09:40:19PM +0800, Tang Bin wrote:
> spear_ohci_hcd_drv_probe() ignored the return of
> clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
> and the error path clk_disable_unprepare() would unbalance the count. Check
> the return and bail to err_put_hcd on failure.
> 
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

How was this found and tested?

And no cc: stable?

thanks,

greg k-h

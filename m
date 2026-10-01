Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F3492E57
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855708; cv=none; b=HI7UGFrZXYMiR0TlSeIAdnthq8/rnCO0YcACi0H38QRGfZfyBdeHI6ga/B8S1uDhzBRncAGGfqUPAQHAcTNhFvMh24aOuWAQJNeoNAr5pmf8yiK99BnGDgyHqj9TkDqcCi6VzoidUydN16tMD+w7tUh44NNCVdIjDkzLP+vDCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855708; c=relaxed/simple;
	bh=zqGgsPWslH+XyF1fSs+K+V7+K6orJNqzTw3vegFgIcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ/XidOzKWpbAl/PHVgfDSNLN3wVa4/RhxzTmuyBpVRCPeMT4bBG5hps8lK1Qy4TPFYM3dceoWf7mvptfWXMQGB8MsyGIJo5+BBJx1Y2SO3tg2vTpSJYfu/cMBQoN/hczAsUsdASG5BtD4V3szZi7e5fq9BMFSP+PsN+SEQA01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H+W8+kI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H+W8+kI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561271F00898;
	Thu,  1 Oct 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790855698;
	bh=GEsLFiIUxYu8R6BuLV3oEFWXXEceqtJdGtdaKbBTAT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+W8+kI5NVLa7kbe4thV8SatAVszLSOsuHUKvFy8R2qz5hVpJOogJKCettu/AqzLP
	 +Wv5oA/xVK7i+kpRJI0R1+2Hvdvlxs/fk/Evhb+vplPhOF8n8lF8K+wCCC1q33qD5A
	 B4Ps8EVtksXFwVLUvwJrberG3cqZMUGTjn4m1zyE=
Date: Thu, 1 Oct 2026 13:39:23 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v7.4-rc1
Message-ID: <2026100114-decode-showbiz-7e69@gregkh>
References: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>

On Fri, Sep 25, 2026 at 09:20:59PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v7.4.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 93f51579e7df248780214094418f205253383cc5:
> 
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-7.4-rc1
> 

Now pulled and pushed out, thanks.

greg k-h

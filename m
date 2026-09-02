Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C1403AED;
	Wed,  2 Sep 2026 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341230; cv=none; b=leYvcuCkidbOd77S8ReFwaEy/zO4+Mca2oMcR+ht68OkoZR5BSih1+iljMe6rMhYoMkgjwa81YCN63x1X8b/HQ8LT3Qv5tZzF2l9ISBscwiG6q1HkFKJCQOto5G0fkpDcH4F3AYmUCswjxA8EgtiZiMSSK0JY+6KoOUZecOJhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341230; c=relaxed/simple;
	bh=hAk8AXdrUX705SGAHF4ZcodOwsWhy6DQOrITwq6tj4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL42ddfXO9c4WDTVv7HxcPSBzyEFffKbKvOn/RmLa9U1OLSuygJrOdPUwdmSsZ4qZYOhzqI9IsB+6TI/9RnVLQRLI0W4kdkYb46esbnQPE0jXIVDcIvVeEv2IHmixE/YxtjAT8u030visfg2hcosKYM1MeFpEgFvCjsgESh4SYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oLLwQo0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oLLwQo0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC151F000E9;
	Wed,  2 Sep 2026 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788341228;
	bh=6MAiAELbFFa1ARWRXJ+CGjunCoIg2Wpoq0ZQlvomzbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLLwQo0eGM01bcIA4jtU0XwizcCvV3KKt9oQRj3ZR6YePKEx5OqeXdrtnXwaBpYBX
	 4pk7oRdDSNYl7ZjdslBYzwdxJKTdfio+C5bGjZlOdzCpvmu+D+HSYiECi5SgE5tbeN
	 6EefbyTxRtxbOCLy5aPvvCbk624YcUCLYEr5d2LY=
Date: Wed, 2 Sep 2026 11:25:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Message-ID: <2026090200-mothproof-snowplow-f443@gregkh>
References: <20260807100400.3179625-1-huangwei@kylinos.cn>
 <20260902090541.2134430-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090541.2134430-1-huangwei@kylinos.cn>

On Wed, Sep 02, 2026 at 05:05:41PM +0800, Huang Wei wrote:
> Hi,
> 
> Gentle ping on this one. It's a small debugfs memory leak fix that
> mirrors the equivalent dwc3 fix (commit e6bdf8195b4a ("usb: dwc3: fix
> memory leak of dwc->regset")). Happy to address any feedback or resend
> if needed.

I have 700+ USB patches still to process, it's in the queue...

To help out, please help review other patches!

thanks,

greg k-h

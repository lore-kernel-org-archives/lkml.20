Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789B39099C;
	Mon, 19 Oct 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392256; cv=none; b=q6hVzujbipq5pmCohtM0t+x902FuKTOm1SVCZ75LrzRtpu+/MscQI6lL//Gino0WMLozaPNRMta8sKEtKheVNQxwtCxqKI4g6E/L/aTGyht4c6nN7ULFlnYZVS/pzhKa2fNHsSO2yJM2VbfwgYKR0QbjeEnwC6btgxBmy95SVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392256; c=relaxed/simple;
	bh=uQ6HmiTngG/7R3epDeKohkqkxYCB5on0sMAzdpaZemk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPnkajCC1J0L713JqPNnfGtjda8G7k4VZ8HhDdO5JsbmjJvAiRGqSGY16hutZAmY9bRZjgKM2UuKAX3BgevMhOD+M635W0ovVC8Ya9QeQ6UmGWYZ63f9Eg6LBc/L45TmYY8OhzyiYS3HWr7VlmmJUCes1PnrdfEkZQVZhs+ckC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EG4SBxHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EG4SBxHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EFE1F000C5;
	Mon, 19 Oct 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792392255;
	bh=k9K4fgIBUalxLF7XFwyjKqWv5GFsqDDeWHdGoXGzd44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EG4SBxHCMIYXy5JcJJIS/n8kL56hcZZ2YLlDXxNkLfOYtOyqLyRFAP1ac5znKPda3
	 wieA/gKMOgd4Rli2Z4DSdoE7ycULQ/EJfF+VegUwwLr8iPcbhADJLWA0AvEAIycc+z
	 HY+mHzZ09BXA3jr9SAKri13HKvwGtrW1OEWZwXD8=
Date: Mon, 19 Oct 2026 08:44:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: gadget: configfs: use-after-free of gadget strings
 during bind and under a bound gadget
Message-ID: <2026101913-glimpse-atrophy-b0c2@gregkh>
References: <20261019033415.73542-1-yuz08559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019033415.73542-1-yuz08559@gmail.com>

On Mon, Oct 19, 2026 at 01:34:15PM +1000, Yu Zhang wrote:
> Hi,
> 
> The gadget-side string configfs objects (the strings/<langid> directories
> and the strings beneath them) are created, modified and destroyed with no
> serialization against, and no lifetime coupling to, a bound gadget. This
> gives two use-after-frees, both reproduced on an acm gadget over
> dummy_hcd with KASAN. Both are root/configfs triggered.

Great, if this is a real issue that your systems run into, please submit
a patch to resolve this.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF03B8111;
	Thu, 17 Sep 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633796; cv=none; b=f2xHLZSSlkxgXRXluMJc7X+PPp7yg/PTCHyNOyUdxnHDXbU/kJ6zS3PdBUW56HbOW3ZtB5ayNqCQYRMZ9eBOhfIEW/WZKVUQhn0kZhIv8uGA6wG9qwJYEI48meSBOq/Feb56wu0ZIAbLwVSOEVTvZ3QiHOsHXhn+Pq3iA0gzeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633796; c=relaxed/simple;
	bh=xJrXsH1a9W9FVSpehapLKys00EK2L+9Nj4RTZCDnOEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmEAGIa4pFt91DhVTbYDWke1Vu+ICvPrzZZRTbnGqk1ct0ANnJ4K/zU+ymqJjQ2+QkEDNPN0IN29ZpilDrqG2jFNMk/+ad8Af+nZLHFlc7i/Xx0BC+xksaoTg5y8AxgftUq4SXfjIi/ieGrLCLYEA6ZXZp0wqeGz0HgzpAPAVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aPuMNh+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aPuMNh+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A1C1F000FF;
	Thu, 17 Sep 2026 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789633779;
	bh=ScOG9vqMi1DbEWxfkrLUu+F7Q7WSv4M+ixZsOf7ZX4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aPuMNh+wv6lSp48jL+7I/NhNg26oIFwZO+Ief8ubanUcTAK7EvWvyRiLAYj9uS4A2
	 QdyviGJsaKM40qf4D9Al+79l5CcrXX1mQL5yuaIwrg4YQA27DqeNcacNb2ZclJo/bd
	 cYeEYyf5E9yHxq6OFWQZv/RfxPse/tbw0P6OpybA=
Date: Thu, 17 Sep 2026 09:27:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <2026091739-spousal-linked-2a36@gregkh>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>

On Thu, Sep 17, 2026 at 10:11:03AM +0200, Alban Bedel wrote:
> Use tty_port_register_device_serdev() to allow attaching serdev
> devices to USB serial ports. Also set the ACPI companion device on the
> USB serial device to let the serdev matching work on ACPI systems.

"also" should be a separate patch, right?

And I didn't think that serdev could handle devices going away at any
point in time, when did that change?  How was this all tested and what
ACPI device wants to use this?

thanks,

greg k-h

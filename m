Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CB46DFE7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217676; cv=none; b=n1P54O0wXxjS6vrt3AfY+zRAMYqe84ZrPIGGgpn4ralicpt6N7Zrtv7SZQJsxYZPd6hIj1C0+aQa63S1qUP35/LLQeGmd2NrPbeuAoBdbZc8y8cmDhjTK2HaR7jl9WgskoEGV3wFEM3qFnWNxyDt0kv8cwZ9ePGOIrNbeDgoXtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217676; c=relaxed/simple;
	bh=quY7OopwIWDFMJ7wmxhg1RSsYrL9fK3QNIqEF6HA2e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bm1L+HHH99GHJJOsx9uxjFCk7YAbv+tBXdrPDoXtNKawm+/QI+VCrGDHjskdQfqeHyXoL3O7nd0/LMbgwwBgHP3nGGQRgxcFyjsyik0077gaf+Lw82qpSzBuVQXV9VdOixgE7EzgRr6RVsGvOTYkJnQ3C9TuVooduHC4KHdUW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.b=LU49uSgU; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.b="LU49uSgU"
Received: from [192.168.44.156] (unknown [185.238.219.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2C93E4C2F3FFF2;
	Mon, 05 Oct 2026 18:21:38 +0200 (CEST)
Message-ID: <92e8c6a8-c2ba-4e1f-8ce8-f567636a24ca@molgen.mpg.de>
Date: Mon, 5 Oct 2026 18:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: e1000e: I219-V RX CRC errors on ThinkPad P14s Gen6 Intel;
 disabling K1 restores throughput
To: Christoph Groth <christoph@grothesque.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
References: <87v77ial45.fsf@grothesque.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87v77ial45.fsf@grothesque.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1791217298; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=0qGHbBms60xFPKgi57VodRM5C39Ha2DHXvR/RiFkZ70=; 
	b=LU49uSgUoVsc3WDTzL2dxL3czsr7K4cNRq5e+PHHwy9bWxACFoGFSgYXoNRHi/6zjva5Wn3CTwHl
	2eG5eisngjLiIQrAqU5dUbJbd8/2K4qWe6P8IS1iAoeVSDLarNZhWXoePLl2P2rdDz/1mJeZTLzYJz
	oEhWp/zq4O8+Wg9guO/XjMYTGHxg3a8P6/5qqxFUAxakutbGTinCuEaMoq1PeTnHH1eba1K4K9TOnq
	XjqSDG/NLceqQsrkRZBUd/2I9ej6B2Yp/IC4rBR5yDuR4OZA07AU5hshGuDyl8pRZi4XBiHQjz8vU4
	hxpFJ/oIC7QT0WuUgCNgoLKOxAE2vwjg==

Dear Christoph,


Thank you for your report.

Am 03.10.26 um 16:56 schrieb Christoph Groth:

> I noticed that wired Ethernet throughput from WAN is much lower than
> expected on my new ThinkPad P14s Gen6 Intel.  The culprit seems to be
> CRC errors.  This is with current firmware.  I updated everything one or
> two weeks ago.
> 
> Executing ‘ethtool --set-priv-flags enp0s31f6 disable-k1 on’ works
> around the problem.  There could be a relation to commit 578294b8b60d
> that re-enabled K1 by default.
> 
> See below for a shell session demonstrating the problem by downloading
> data for 30 seconds.  With K1 enabled, the transfer generated 125 CRC
> errors while receiving 156 MiB; with K1 disabled, the error counter
> remained unchanged while receiving 2547 MiB (i.e. a 16-fold faster
> download).  The following has been recorded using a freshly booted
> current Debian testing live system.
> 
> I’ve been observing the same problem with different recent kernel
> versions, different network cables, routers, and networks.  I also had
> the opportunity to reproduce the problem with a second identical
> computer.

[…]

This is a known problem, and patches were sent to net just on October 
1st [1], and accepted. It’d be great if you could take a look, and reply 
there, if these solve the problem for you.


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/20261001222443.3500206-7-anthony.l.nguyen@intel.com/

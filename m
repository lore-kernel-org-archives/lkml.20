Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF7531AF1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868108; cv=none; b=m1alJAfDUTLTXImieF99mRJA6rf3piZsT+NpcbXcZHdLNa9RfYczheUBsopzo3KTvvQK0LHWRsg8a2dvOv82gOt186Ztt8k/Cw2Avg+2jgTonaNKoT/ugYC5/VOB6IZob/aLaHg40zT2hFDxcrI+62lizEXtQ6Z/OsvbEJ5O8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868108; c=relaxed/simple;
	bh=8XRW3UbjMYaweM55zG/PZ8fqqZKSIz2v9IYEhu8HIgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaUpSCBgWMOTIvCRFOB8HdPj0DSIl3hDBtmIctQd7CINmx02qhXumdT9A/I0AOIUn5AFQvNrkk2H+alEi5IjMltacdFYFrw4KHO4y3ynpXPjGcXTah7ymEqPXvprLu3uSRNDtZQJ9TYAfwB8BNvMUKxnj1/Gxxp4YxYZcArEbzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VKM/Ny0s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VKM/Ny0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GwAM
	4gowDitwIjNJMy5rgCy3NbR/ZVKB11i5G+hXKo0=; b=VKM/Ny0sp0jwbctOVNNR
	LJ2QK/N5K//n4QfrObA+Uwbz445zQmBNbjBrbmLJmo5hgV1uJzaBTlNMqfOn4aJK
	HUKUdWlZVKHx1OLVZqyORGJroOpnX6h7YVswxP1UKS8ZNPpO6SRRu/AdzIyYbSTj
	xogWf0dSRxe65CpwiRC7BJi94y5ZaYesxgs3YaSENlVl0C5pKPzHieIewCpp+5YB
	kCA88uDg+Rso3ZREh81BiCjuQcRajKMhik1a+bnkPojzJRjNJkQo1jr1BIZlqmBj
	TWWr2UJhcFaz5FCjLMvr2Os+lz8/je1Ri6Sjo1geUlkNmO+lGlCmRD+W7fXYfJWE
	fg==
Received: (qmail 2754733 invoked from network); 8 Sep 2026 13:48:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2026 13:48:10 +0200
X-UD-Smtp-Session: l3s3148p1@ICQTT/daxsAujnsK
Date: Tue, 8 Sep 2026 13:48:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
Message-ID: <ap_1-gFF7S821xJT@ninjato>
References: <20260906202747.4041389-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>


> - Fixed device lifecycle and concurrency:
>   * Switched to cdev_device_add() and cdev_device_del() with an embedded
>     struct device and a release callback, preventing use-after-free and
>     races on driver unbind/detach (incorporating fix from Oleksandr
>     Shulzhenko).
>   * Cleared i3cdev->i3c under xfer_lock on detach so concurrent/subsequent
>     file operations safely return -ENODEV.

I haven't looked at the code (and won't have the time to do so), but if
the above paragraph had not been present, I would have nacked the series
right away. To say it positive: Kudos for working on these issues!


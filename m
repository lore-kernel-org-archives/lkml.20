Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797158;
	b=1DSwlqHErX+3G1znMMBnACAFH8a8Hi6/ADMwAF1Rc5RwMhZvnlvgdZRMVNEIkuOYabC8
	 eRKF3BQE8bYKfgK4e4Eh9y1/vP122OlSwfNMrx0p55ZJ5pNsdtmz8sOuisbGEDaAhJp2L
	 lqcSdiI7ZRK6Z7nB+9VgFZgRpZ8Q7arj0KIpZd9ZxXRNskzidsny6xf8hmhNvWbgYB0Et
	 Ju+s0cvAVzbJu+R5W7h3XHKRy1lYIU4gx/DDoDTtnXKhqfdTRfFSnZaCgnwxdPbXteHnw
	 c+YV3wOz7klAihKT0FWXoapu9sYAfcYLUdMOM/OVbtcI4RSik7BIT6IaR2MIKJJTSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797158;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A1dik0vFN+ctGNsNwcPOeeTtQ2imRoKPcBHvRrajBpI=;
	b=JKafgzgS8rBasRGiUzqQzvPFRTfvnhi6iRq5zcB8ZbIzqiW7+My5RpHkJ8NALJytzyIF
	 NZesfpsf/rkMoHZHl+aLQFegT66sxjqLuY91RIP0dkojU9NrnNRCl2sgoN430VHPE8Zip
	 6hZ1ygQ1yi0GAUhXkcn0Qf3bdwqYG0pLeA5ht1UsTr9kL8oOpkZT64+BRihGspm6rLavl
	 gOlFO8+06KLAAEp1nCSoNqmd/E/3pFtcicl9LTANH39S1tltYals1jdRbnYOXQd3q58Zs
	 elINSW+ZrrO1EXDMJzc3KmAFwWYY88qiBdGJup46gmX1kx0LGCh62eeNutfXqFKJ8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45872606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933011F00A15;
	Wed,  4 Nov 2026 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793797157;
	bh=A1dik0vFN+ctGNsNwcPOeeTtQ2imRoKPcBHvRrajBpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O9XIJu4aTX1cMv+5DaTDbBPKnHfjgzfrYYfn4K6UwMWL9Oc+hG+CeoFGvqnxOQMhH
	 ipWQNSh9gHepV8+Z5FsL6dNxCko1uNJLM9bzkY5KUQah+gqIDFicEO2PECPmAs4Lvw
	 +o0X8Ta3E0qkVlHIN3LwRHPQVpGjllkH2ewIbX04=
Date: Wed, 4 Nov 2026 13:59:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] comedi: comedi_bond: Fix leak of opened device references
Message-ID: <2026110414-conjuror-squid-2777@gregkh>
References: <20261103173610.89687-1-abbotti@mev.co.uk>
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
In-Reply-To: <20261103173610.89687-1-abbotti@mev.co.uk>

On Tue, Nov 03, 2026 at 05:36:10PM +0000, Ian Abbott wrote:
> bonding_attach() calls do_dev_config() to open other comedi devices
> specified by the user and tries to make use of them as part of the
> 'bonding' device.  If it successfully opens the other device but cannot
> use it (either because it does not any subdevices of a type the
> 'bonding' device can use, or because of some error that occurs while
> dealing with its subdevices) then it is left in the open state and the
> fact that it is open does not get recorded by the 'bonding' device, so
> the reference to the opened device gets lost.  Fix it by closing the
> opened device if it could not be bound to the 'bonding' device.
> 
> To match previous behavior, if the opened device is unsuitable then
> ignore it (after closing it).  The opened devices recorded by the
> 'bonding' device will eventually get closed by bonding_detach() even if
> bonding_attach() returns an error.
> 
> Fixes: 3cf840f65ad5 ("Staging: comedi: add comedi_bond driver")
> Reported-by: Wentao Liang <vulab@iscas.ac.cn>

This is a known bot.  I'll be glad to take this patch if you redo it
from you and that you take the authorship.  As-is, I can't take it from
this fake "author", sorry.

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5839A81B;
	Sun, 20 Sep 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907875; cv=none; b=Qo4+J3LM1LwYrcLUloXc34lNkLi4S4MHmG/Cmi5Oh2qG1PGX7vlZsF6skKT3K6jkVQXqD370/+5lCFCLGXNwoRXWKzJ0aGo9pwrl/Ap3+a64tt3dbCNheilrsAZFSETegpTe06SZ97yKSK1Lw3nhOom0/UX8kjnM+2Fg0gC0dKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907875; c=relaxed/simple;
	bh=35nNFJvTm6+ePCGJIPzqrEvVltPVCMsY28rjpiFDtdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9TpV02PEZl6zSb/kfSiwFSfASr7sT1a+JACPTbfj+bNZ2V/LCaiG2htoPkjpqcWkrQtPMayHo2Jp1pFHuaxeVUor63VUjro7iYJSkh9RCeqkNnfbr7leRKniQx7EWh5QNQsP5Sc2IDslf0bBM/1/4A9ub+WoX+UMnUCDBSC5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AIha8MxI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AIha8MxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F561F000FF;
	Sun, 20 Sep 2026 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789907855;
	bh=vXzep5Y0EBu3LAf+/uT7RDFqqEC/cL583FznQw/7nHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIha8MxIiGm/i+QT+68mRvLq12tizmVVh48EKdEakAsi8ZOV9h3hRsUNIdLFUO+4E
	 +TIimI+HV98ODTqfkiyNKMaX0APjggWCBSPAMtcsFCPOvpq4J16A8z9uJuTTXUmDzP
	 pDBE62r1j8883zZoPz4N34qFv5kceaB+5C7pliqM=
Date: Sun, 20 Sep 2026 14:37:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Omer PALA <palaomer100@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	David Lin <dtwlin@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
Message-ID: <2026092049-ninja-marathon-7c24@gregkh>
References: <20260920094058.9664-1-palaomer100@gmail.com>
 <2026092039-greedily-jailer-80e5@gregkh>
 <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>

On Sun, Sep 20, 2026 at 01:37:00PM +0300, Omer PALA wrote:
> Hi Greg,
> 
> I thought someone (not you) can allow this.
> 
> I want to contribute kernel but i dont know what should i do.
> 
> I wrote 3 devicetree schemas, 2 performance fixes, 2 mutex/spinlock
> fixes and 1 syntax fix.
> 
> All of my work got NAK.
> 
> Can you explain me what should i do?

Try to contribute "normal" coding style cleanups for staging drivers,
ones that you know will be correct (because you can verify them), and
NOT used with any LLM tool.

thanks,

greg k-h

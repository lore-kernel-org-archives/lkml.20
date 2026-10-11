Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB41A073F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791705373; cv=none; b=PosLK/g9Xx3asCFhzsqbocd6WfNIN/aQG6sJFkIlEGaXh+8IEmlmnbFymU+nQ7dM6S3KPekyR48AAAFoN5XK8S4oCiC/cSKLMsDduazS5DT5xJtZdEp62p7POwXuLBhIhS++aicdag6FLx66VOMP2WnhfnrmPuiVHXgW5dH7o1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791705373; c=relaxed/simple;
	bh=NRJwRdZWA8YRiNctHPYM6vHzlC/Ul0sLPZxqUZYpQcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0IaN86b9YkOfZEec71BjHiTnau69tbwSIoSzN5RfpYNlDntnnhCk4lQlk61FM25+0+wnP59YTF5lzdU9CrFA25FHp92xEjkoOjEN5iJnSZ52uTJyQxIQeJcxArCfKBTJlE05G4mLoq14gA6c1pSogAep8RNP6bO4gb07buF7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J2aIo51K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J2aIo51K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518011F0089B;
	Sun, 11 Oct 2026 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791705371;
	bh=dTcUj6U5MDEwnVDDPaCFPBpocrGRuriLGqpfposdZsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J2aIo51Kg2uXbT9y0Wvu5VB3UdFzpgQKZGcnQAK5176H8rI1ht4TqzeL4GeD8d5TK
	 qxmK6sRvlG6lHqZJv83jdsYO7UlsrkewKMwZJEw5/WkdKa8BqBZuFsZ/J4BBvU9MWN
	 ydzx5N3Wfq5T/5VF1JfGGDFO3iaZeHiNONi905hg=
Date: Sun, 11 Oct 2026 09:55:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] SoCFPGA firmware updates for v7.4
Message-ID: <2026101146-blast-proposal-2094@gregkh>
References: <20261008144719.551095-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008144719.551095-1-dinguyen@kernel.org>

On Thu, Oct 08, 2026 at 09:47:19AM -0500, Dinh Nguyen wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_firmware_updates_for_v7.4

Pulled and pushed out, thanks.

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12E4442B1F;
	Fri,  2 Oct 2026 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927756; cv=none; b=sx6iGARrdQjhjyxSyXpr9F2/K+TIwwpqlNZgwHmdGMxbumqXOwztH6Oc7dVxXpNsCK9R9rpcmP4+7wEApPsvWRLG+zJjV7HznyP4jEv1d/XQZz6tUHpU5SNck5lb++uqpI430HX+yai+0hfx3QeuqeETYOKPmFOjSEMvVl/xDOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927756; c=relaxed/simple;
	bh=9zPAF1x7w4b4O/wUuZ7yYfzbblzDXBR8AlFVrlY/a3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+vYD2hpf4P+BXo/DA3VVhK06/ap0qQy10Z5r2Nve5xGuVhb6mxBA/h1budjvozz/kPvkb6VZy9Iu/QLDpPYkrG/72yZVIwD+fZGEBEnOp0qvIzsliEPkSjbFttEe6BzaQqWzvDBT8EtjGxQZTbIXDiaGEGZIliLVlOumCcwS08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RAPRfZY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RAPRfZY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D741F000FF;
	Fri,  2 Oct 2026 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790927754;
	bh=MF9VnqJR9GzmtbMFyFGPlraGF5EnGO22S5qcs3GtAaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RAPRfZY9TJQFcnIJk3BoK4Q4I6EzfZxMPHWOOVE6WmchRlt0e+Y4sPuJGp/HzOULr
	 Ut5LxLk3Bf764kx2VzE4wbL1uk4wB+p4qvXIiGGlGSMXedHyLn+ghrDkPaYI1jEqXB
	 +RfBAR8dViW6IbzjX7SRAXMW0PRisI/0vncIaKMg=
Date: Fri, 2 Oct 2026 09:55:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Message-ID: <2026100229-cilantro-facing-f434@gregkh>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <2026100211-scenic-eligibly-58f5@gregkh>
 <ar9fwqJ04CzzSy4L@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar9fwqJ04CzzSy4L@debian>

On Fri, Oct 02, 2026 at 04:39:46AM -0300, Leonardo Martins Martins wrote:
> > When doing logic refactoring, testing on the real hardware is best.
> 
> Makes sense, so should I be dropping patch 2 where the logic is
> refactored, but still do patch 3 where the inner loop is extracted into
> __phy_tx_power_limit_to_index() to reduce all the indentations?

Yes, that's probably best as it's easiest to "prove" it's correct by
just looking at it.

thanks,

greg k-h

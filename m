Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB6471CF2;
	Sun,  4 Oct 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135216; cv=none; b=YF2v76Y6YdL36FhinEjardFc87b7rbgukUnkNZ2XzMzVf4FwJg+fx9THyu/fyY557L/rMK70Ug4MLmZQkpdrz0rXJ8xsWZ4sbNCjKia8thmajEb7fYSyF5Ki0wp9/lHzeGMqF9I/P7Y2erRAgu5EfdUuInc2dEL9t3nH6l4nRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135216; c=relaxed/simple;
	bh=OAza5qqvLnX1YZlIrWAP0SwiY6qke1NjderQpmqNGsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agfDXixXQ054lCWb/Ktil13Is63tz/pfgFm6HqoJP+Lv2Uz96U2xPoeGo+rBk7aTI5BP+sOOmd0eUDqUfuy8s0UXsiQggv/bRxGDX/L+qzn5xZT9B2NxljXKVK6WYO4rYZyi8iiFdbTtr4PGjFQvMIZuWqiOjQynJe/iD0CFgis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E1k7p7T9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E1k7p7T9"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F26D582A;
	Sun,  4 Oct 2026 19:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791135095;
	bh=OAza5qqvLnX1YZlIrWAP0SwiY6qke1NjderQpmqNGsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1k7p7T98Qj8StwiBIrODijPvUexOKhXyrEC0OqNIXjs46fX+777HqkZofpXien2U
	 b+mVMc/TW7ibtct/zraBttMUMt+XFu6SgMzGUJXsEkd0jt4IAXUnKtM8HHMlXeTeMh
	 TsKkdSf8dNcd9gvXhjmVYWvnM1uBpcTBguT4Fcs4=
Date: Sun, 4 Oct 2026 19:33:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: workflows@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: Hallway BoF at LPC about generative AI for kernel development
Message-ID: <20261004173328.GB533673@killaraus.ideasonboard.com>
References: <20261004172533.GA533673@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004172533.GA533673@killaraus.ideasonboard.com>

And of course the subject line should have read "Hallway BoF at LPC
about generative AI for kernel development". I need to learn to
proof-read the subject too.

On Sun, Oct 04, 2026 at 07:25:35PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> In preparation for the maintainer summit, I have issued a call for
> opinions regarding usage of generative AI for kernel development ([1]).
> Multiple people expressed an interest in discussing this topic face to
> face in Prague during LPC (you are all BCC'ed to this e-mail).
> 
> As this topic is orthogonal to most of the discussions that will take
> place at LPC, I don't expect to find a time that will suit everybody. I
> will try to organize multiple "hallway BoFs" to give as many people as
> possible a chance to join. If you would like to participate in the first
> one, look for me during the Monday morning break at 11:30 in the foyer
> in front of the Club A room. We may continue the discussion into the
> next slot, possibling grabbing a BoF room if available.
> 
> I will relay this annoucement on Mastodon and in the LPC Hallway Track
> matrix room. Please keep an eye on the matrix room on Monday morning, I
> will post updates there in case last minute changes are required.
> 
> [1] https://floss.social/@pinchartl/117320477532952626

-- 
Regards,

Laurent Pinchart

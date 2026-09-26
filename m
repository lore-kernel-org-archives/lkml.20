Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11B29B795;
	Sat, 26 Sep 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433666; cv=none; b=C42vkxZboyfFVcZ7Sk/Tj96fGDdipKIFtdi8YzdEFm2jKuzWzaZ2Bh8rQa19mGirfWbQK0Mnr0aUosDUe9EczAOeJxmrv/YBrM27j5B2hF7hONcVUeFeCHbk57cJNAS+h4MXV6edRWbDjeHp+BDfihby99IUZwvDRzLG9MTUD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433666; c=relaxed/simple;
	bh=E9yMgEo6STLiVrzfsMVu1vPUXzCzM+z5oz0S/J8IlK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMcxigNglrTeU2z6Ea2hK7QJjZ23ZZQVBU/AgHNsSwfC3+/wdFkASHSYR1QrhFkYQnVbcXmJ90MJye3itECVzYfQlhtb1Xyc28bQhUC8vAirzBe8oqTpxyQsv6eMQqPI5iVC9BkMpIeg+lCO6KGGPRIrvX7IYz4sTxNPauFIoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KRG/h3bU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KRG/h3bU"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D413B5;
	Sat, 26 Sep 2026 16:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790433552;
	bh=E9yMgEo6STLiVrzfsMVu1vPUXzCzM+z5oz0S/J8IlK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRG/h3bUkX4dzx7hUD6d5wd88e8sMpED/LDWWwnwO2PE9G0VD8XIbWKad7IEqcK1u
	 M+XDzTyQAJylGTfrVdngChYYWbTuTl7DaBJ14mvbaqVla2OhA63oWdaAAmUaiLUf+9
	 7s45fSeEUIPAk5cflmvjDN9MgKK3wHn7ToHLSjhU=
Date: Sat, 26 Sep 2026 17:40:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <20260926144058.GB764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arfW_sncBRNsyP4L@kekkonen.localdomain>

On Sat, Sep 26, 2026 at 05:30:22PM +0300, Sakari Ailus wrote:
> Hi Rishikesh,
> 
> On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
> > From: Jai Luthra <j-luthra@ti.com>
> > 
> > Some camera sensors now use an expanded CFA pattern to capture near-IR
> > light along with the visible spectrum (R,G,B). This allows capturing
> > light in both low-light and day-light scenarios using the same sensor.
> > 
> > Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
> > here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
> > are the same, but half the B and R pixels are replaced with Ir. Thus
> > instead of having 4 total phases, we now have 8 total phases or
> > re-arrangements of this pattern.
> > 
> > Co-developed-by: Rahul T R <r-ravikumar@ti.com>
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> 
> I think we need to use the common raw mbus and pixel formats for the
> patterns that have IR pixels. See
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

That's right, we shouldn't add new CFA-specific media bus codes. They
just don't scale.

> That's mostly pending on userspace support now.
> 
> Can the sensor output Bayer pattern as well?

-- 
Regards,

Laurent Pinchart

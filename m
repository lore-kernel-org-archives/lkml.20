Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E54CB8C8;
	Fri, 16 Oct 2026 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158529; cv=none; b=A8DrGe/lWjaRdr+Dlsl/S6zBRwD6EUARUv+FzZ607h3IyEoWZN8dysTQkq0j0wRC0p6nzyEpwsiTZgI6fJP8MQFtdrEj+qR3fUOHgBXkyTyJGja3KXU1J2SVc9PeeXii5BmFQvQK/Faj930Z89o7j12/Em5ifDnKofy3ueZJoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158529; c=relaxed/simple;
	bh=7gxo/iT76oZhySouvBbrgt+pR5i7xcFoimOaqQbJ8M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omJanZh+73xVrdiupfecmKl8DAk3EgOL3VLHEuEDxItOgdnHkpw39Zbk79gXfi9y/RUwNDU5Ab+L47w0LOayI1KTnuE41LRHla86w3S37yeK+vKqzrE6Gzr2H316eGqcPsLXs42hae4iDuSmy/6/SrhAdOPQLm1+l5Mu9b4x6BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUgVfdH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUgVfdH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6A1F000C5;
	Fri, 16 Oct 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792158528;
	bh=loFbvd1xN1XfodqPeTILaYkCCxa30uKsn0WRXfEjV1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eUgVfdH7G2DW78S0UHTfZeoclR1Dq+Rnp2VwsqyZ/5nNqJzLJbQhLjOzSEONJtjfQ
	 YUNQF9VBuNb0Luzuhnjm6+XfLhLuY56G1Piadyb71q6XLyZ73I7oQBvg00VDiT5UrJ
	 w0/tPDEb3ipwwiuidg7m9mTiV8pkl0tUin3ez2WGNZ+itsvIXJtkXNA+vB8XvZhEIw
	 VmTo8JSU9j1klI1kzzxVdH9V3ttVJvTLOYOZggFrEOfPmc3ihNLwe2b7sS01p7xGh8
	 pSWhvhlJ36cfGDcFIiEP5Vi5wXLNaLFb20pW1oHxQMZiGF3ZlkDoO59omLdB5lqMR6
	 dn3S9nlxp3TEw==
Date: Fri, 16 Oct 2026 08:48:47 -0500
From: Rob Herring <robh@kernel.org>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com,
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20261016134847.GA1743231-robh@kernel.org>
References: <20261016075918.19345-1-lachlan.michael@sony.com>
 <20261016075918.19345-2-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016075918.19345-2-lachlan.michael@sony.com>

On Fri, Oct 16, 2026 at 04:59:17PM +0900, Lachlan Michael wrote:
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
> over 2 or 4 data lanes.
> 
> Add device tree bindings for the sensor.
> 
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>

Missing Conor's and Laurent's tags. It is your responsibility to add 
them when sending new versions.

Rob

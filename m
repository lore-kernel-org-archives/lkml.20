Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D983822B4;
	Tue, 13 Oct 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876823; cv=none; b=RLi4pDlR2wGzGjPrsixBqJsTXxlCaP+92LyagLqCWC+NB4GNseTBeXLzSgzayhkjB/9AkYN4y1F+X6bUzNwLlxogVuJAJeO0IN6gc05EYOfNn967Kehbu8M6cKz40/CXXmX06nTacZ6gW55DgsbzHZ6JnOCD/GSUvK3RleKQiXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876823; c=relaxed/simple;
	bh=2EXkA8Fu+Cy4V5eADzliUfYzH48QhMCxYHvJVxok4Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYb+1+FzKq18vmBqC3CNSwhIL+UGdbzSSLjN2PN1gSAz3HBAr9N7DVrMNQ9EO7qI3Asmh74QLlqbBKYj5Smln+kReLuzBVSIxIgQvKt26BL5EL3wee7gubEftIZaCsGPLDaHLO/o8nrM6ntG71sCTZLWXtrDC2k8Qr5q3eoDi78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSQonXou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSQonXou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359F61F000FF;
	Tue, 13 Oct 2026 07:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876822;
	bh=MtxkqZsYWfDcUkWU6En+19yAwPMCTyC65/gEd56cH1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSQonXouTURdDmZOEnfAJ1ZwBsMub36mFTvktIKLrkdIawbEF2YMFJ7lt2SvIe0bZ
	 NQ7DEt3hHfFHdJMOIvQJQwwujmwgrktQTbbnnJmHieX9xjcFg4J0mduEl4kzFrTd99
	 iVakr5+3TKmNNeDnt6nOlcQ5WGGUHfGbiJwSRHKZrMqSY1mZsRSgjHf3I+mGmsXeDe
	 7hn7mG/CD/dWMd4SjFJtc1wqaxhI97GIP/ycE/dzwk5LTMNdM4/tkx9cfJ3Q4wwxNK
	 musmcFfdNpeD6WHzlLw2DxhYiYMWPnC7n5EMI30JDKhkmfcLXiuNaUAoAm3Ge3FdsW
	 Nuyf8kDHQwHXA==
Date: Tue, 13 Oct 2026 09:33:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <20261013-artificial-splendid-goat-d078dc@quoll>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
 <20261012064518.3497285-2-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012064518.3497285-2-azuddinadam@gmail.com>

On Mon, Oct 12, 2026 at 02:45:04PM +0800, Adam Azuddin wrote:
> The RA8875 is an SPI-connected TFT display controller by RAiO
> Technology Inc. It supports display resolutions of up to 800x480.
> 
> Add YAML binding schema for the RA8875 controller, along with

So you ignored my feedback.

Not reviewing the rest.

Best regards,
Krzysztof


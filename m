Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE0369D6D;
	Tue,  1 Sep 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271326; cv=none; b=apoSy/0FDNBXaXwVmFnkPuHcRgdKET9zZ3Av+pjD6nR4RGLE+k+cMJM90fSQODl8wtgo8U6dIOLxEjInDZBa2K9D305fEkOSvvfMOqLiYmdD1trQrPEShn0FM3HrWQpakGDMfl/tVDvsyiIRdaLd7tz+1OgLQf8vUb2vUTvZbZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271326; c=relaxed/simple;
	bh=34lPExGVz18wvBMc556aQcu7ShuL89X9depj2VgmbW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wvd2nyYY/uea2rWkEsjrPpiSPTnOFovpj1txGjaPoXAmLLWOwCzL2Lv3TRYmp49y2f7DrXIl0CHDeXmQ+Rq+xETNp+FuDdgCPMCUwX6zNld+rgLzSZ75T+yb7n5pgArpQAFkdeSZkNktAY85Dyf2vLnxJAM9sgTePiJEpw++b6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=URYpN6qX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="URYpN6qX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431E61F000E9;
	Tue,  1 Sep 2026 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788271324;
	bh=dgD87OJ2wvOHNPymPPKpHxI2YUecB3gW52TL+g+CTtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=URYpN6qX9JclLCZcdpfoGXmCu91vzsOPeCh4f33X7PTDZ1XY2D3jiRDQwOG3jT7Vt
	 Li2ZoII8U+xK3n5ogUZIEl01i7KZkO5kQQLFGtgtiRKC0sX3ncxzWDA3Jx7W2Xtky7
	 rnMbno2A7QbpC51+Uq6IxHAdwEZE6Fq75E0ZXQ+Q=
Date: Tue, 1 Sep 2026 16:02:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Marek Vasut <marex@nabladev.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/2] usb: gpio-sbu-mux: add FUSB340 and enable option
 for orientation
Message-ID: <2026090136-whooping-duffel-64a9@gregkh>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>

On Wed, Aug 26, 2026 at 02:16:34PM +0200, Fabrice Gasnier wrote:
> Add a new compatible for FUSB340. Also manage the enable GPIO, when used as
> orientation-switch only.
> It is used on STM32MP25 DK boards, as orientation-switch only for
> USB SuperSpeed lines on the Type-C connector, the enable GPIO being
> connected to the SoC.
> 
> - - - - SoC - - - - - - - - - - board - - - - -
>                         |                 USB-C
> +------+  +----------+  |                   +-+
> |      |--|  USB2PHY |<-----------------HS->|*|
> |      |--|    HS    |<-----------------HS->|*|
> |      |  +----------+  |                   | |
> |      |                |    ________       | |
> + dwc3 |  +----------+  |   /        |<-SS->|*|
> |      |  |          |<--->/         |<-SS->|*|
> |      |--| ComboPHY |<--->  FUSB340 |      | |
> |      |  |    SS    |  |  \  __     |<-SS->|*|
> +------+  +----------+  |   \_en__sw_|<-SS->|*|
>                         |     ^   ^         | |
>           +----------+  |     |   |         ...
>           [   GPIO   ]--------+   |
>           [   GPIO   ]------------+
>           +----------+  |
> - - - - - - - - - - - - - - - - - - - - - - --

Gotta love the ascii art.  Loved it so much, I forced it into the
changelog, can't let that go to waste!

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E084F3EA0;
	Mon, 28 Sep 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623628; cv=none; b=THI4lAyXwMIhV/m6Tt7Ih38+RRPJikpfYexhtrnq2KtCeZCvoAJQYZ47iNpg+4J/ydkC9jViwAHeIhX2ySfwUhV5or6YAFRtKpbwLqOyO+3BG7mKQbcmClHwTIeocoAaVYx4HAneyiJ2tjNgylB1NUWPWh3XGb1xkAeFp+c8qT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623628; c=relaxed/simple;
	bh=Dwg9PmdBa9OnhcGO3thc+vbhTBqGj8fyJxR6pGRJtCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijD9UOZCk0sQP11Sp8yGB7E+rCRQQylqgHO/ItBmn3U48zx7h3Ulm7y9ErPR8hTV/Jt4XVYoI288KP/qiQk9BZismamWUKSzkugkte1bsr/yAxqIb/KkzN+NsMJD7Ak0af5Ps4knrorBxFfppwYeLs+Qy7Bttl5Yuw0CKgGY0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgQ3Wz8E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgQ3Wz8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5801F0089A;
	Mon, 28 Sep 2026 19:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623625;
	bh=fxckD1krKfRtQIKDHO99dwo75wNwJ6oW0NCUPNJVZaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IgQ3Wz8EKMtUK/W4yVTlytp/Xqwe8maY93L7S0yNC4EneYe012MS4aFgYUByF6O8M
	 SvENRqvMZLtVUngcs/b06rTJCDm12JOw63IKH0SsvGRsMk/6NjWM6WOV6aq386Rvn0
	 vEL/ThisUBAyJwQcDL76hDGe/st+qbXfY16BOAFQKuYzqqNhS8FXhY3oOZR93ExoYH
	 6LeQ4sTs6VNNpHFVJ1Uv9JP4DgZN8gG+s/z7VYpoBBVf9w6yEuFBE87JIzE/nvrXgP
	 jorhoraW2JTvhnZPYxKmvqHxCYFpPCc0SmK4Bgi9BVVEiifoC3rhM8Q5s1gl1/SSaS
	 Z74CLvm+NfHQQ==
Date: Mon, 28 Sep 2026 14:27:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: linux-usb@vger.kernel.org, Yaode Fang <Yaode.Fang@ite.com.tw>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jeson Yang <jeson.yang@ite.com.tw>, linux-kernel@vger.kernel.org,
	Amber Kao <amber.kao@ite.com.tw>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ite,it8851: Add IT527x and
 IT885x series support
Message-ID: <179062362317.393924.10049556880529818458.robh@kernel.org>
References: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
 <20260918-ucsi-itepd-it527x-v2-1-7b2d9437cc72@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-ucsi-itepd-it527x-v2-1-7b2d9437cc72@ite.com.tw>


On Fri, 18 Sep 2026 18:03:43 +0800, Amber Kao wrote:
> Add compatible strings for the ITE IT527x series and for the IT8855,
> IT8856 and IT8857. All parts run the same UCSI firmware codebase as the
> IT8851 and are software compatible with it, so they are described as
> fallbacks to "ite,it8851".
> 
> The IT8853, IT8856, IT8857, IT5272 and IT5274 drive two Type-C
> connectors, the other variants drive one.
> 
> Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
> ---
>  .../devicetree/bindings/usb/ite,it8851.yaml        | 49 +++++++++++++++-------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


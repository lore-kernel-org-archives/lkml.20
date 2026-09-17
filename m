Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46349409277;
	Thu, 17 Sep 2026 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684439; cv=none; b=Cl1nOvuBgQsLCYWmKw7gpALdjRlowdKQLRVofTi7OuSqGC91D6FGlGEJxm5xeo2tV7WQNREgXq4jQF2uhNifyO7R6XWw/9F/SIBjNsu7j9S/BtNVIEoMi1jsQQ0IMkSFoC7fGFd7JnO371YrJzrXL1+n9obYtqTz91EN+BAcmE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684439; c=relaxed/simple;
	bh=2G1CPJjM6uhgtZBULO5YltYISxOjafoeCkhP9z7kLeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/Pg1CgR987Gi7zAmBlih2iV33sKgs8t3VzZQ8uoQUU/GILPZxYje/WL0HsNOjtRaBiHOidZZ9w7HVbelWCC4ZZ0tmlIfgh/jjIidCK4oACPmtmqC9+ukC7aA5F3PISm2Qdb+DhKFQ3EyBuqSCMN9U4/sJFLjRFF69C2OAb3CBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Itur1K5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Itur1K5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D8C1F00893;
	Thu, 17 Sep 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684437;
	bh=yumYLHUvW3/1TS23nhuUD9hW8oj7UmGI7exEUoW5L3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Itur1K5DcIonMQiFwCuSHBNC+G+XgkC1by6FAyKs3y5O1/YfSdAXaH9OEQN3hR5AV
	 rvBEyOiDZQYrAyqvbgJPSJWjXECGWbV/YJT5QX4ThTxAmqSbQSxG+j3ggXfuxCu3Pg
	 +e9FkKsonOK5nog+e/qOAxVUbhvfFXxF/2KgcY+oc3ugc0ZjJrcVKUywXno/WfGr/d
	 dM5WesB0jmc2W4QxyudRDtKmUZ+w1unw6lajm/d956LXWI3WssEghNuKZ049iVCWIJ
	 dyxFwqs8sE1zQR3gS3UR+mY4AYP8ahkRcrJ7OSgi4oncb34suUc5a9NHY2zS/bHSJq
	 hacZuzCMFWZAQ==
Date: Thu, 17 Sep 2026 17:33:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, devicetree@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>, linux-usb@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, asahi@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 06/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt ACIO block
Message-ID: <178968443469.4111891.16643051848376045316.robh@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-6-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-6-1f80085f93fb@kernel.org>


On Sun, 06 Sep 2026 20:36:29 +0200, Sven Peter wrote:
> Each Type-C port with USB4/Thunderbolt support on Apple Silicon SoCs
> comes with block called ACIO ("Apple Converged I/O"). It contains a
> Cortex-M3 co-processor, the hardware blocks implementing the USB4 host
> router, the Native Host Interface (NHI) and a DART IOMMU. The
> co-processor exposes the NHI and its DART to the main SoC bus while it
> is running.
> 
> ACIO can only be powered on after the Type-C PHY has been switched to
> USB4/Thunderbolt mode. The Type-C PD controller publishes the negotiated
> mode and cable information through the Type-C class. ACIO finds the
> corresponding Type-C port through the OF graph connection.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../thunderbolt/apple,t8103-usb4-acio.yaml         | 213 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 214 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


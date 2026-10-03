Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1E345EAB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058824; cv=none; b=P26+opSxNWbflGwu8Xr3GrCBeGtNa5cIaYVmWphUp4D/GqAkx0t8U/ls85AvNjbMMB4ARslNKAXHNysvmy7CYGg5HDlLhxdke79HhKOofjwubFpQz1pZ/yZnvutsGzJYHlsN0yA8vfWeBp7wCHso/eQp66okfDgXx3IaVaQLD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058824; c=relaxed/simple;
	bh=ANqohOuZQKE7OgSLJSyZoUmFOAGrl/IrkNBKvXEQLA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+o05xF/U2cMNXw7u1ZGn0qIxDjdgaKA7BGTjEjcjj5imL9yEg+egsNQm4MXLUu0QPlxeum6YVltzVX46bFDYPIcxDm/F1nvxQTCOflr9TgdrdDXpuBgw+WOFG8G1yuZq0MoUkhOLseb1P8iOrJTnM9O8cdy0e5dy8gDu83y8Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CThf2tok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CThf2tok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C391F0089B;
	Sat,  3 Oct 2026 20:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791058823;
	bh=0qBoi4a6oIR++oPs2TdrsPznD5Dh3pxdqqWtp0fkXCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CThf2tokWjK3INJLMbYXps8ipGGerD9euCWoE3Fl4ZBwzib5mTEegaxkpAMPsZsAI
	 u9aWnHbchTrQUzMbjD1p4VRC3PPhvHnUcZkw/3cBuOwWYBxbDb1l2cJnEECM7ldG8a
	 fziV1b1tkyfCCvcDzOry2gR+k8/RJCCJXJXd7KYMCq8KYhyIEU/Mdtcj4gfT0fPnyS
	 HzmwZHCDpombbki1tsw8uhRCopE+CIzF5OkX5mhKUfMtF6aY14PAK3kc7GE1r3Up5E
	 p78Kz8qIVH4SPOqBHaABe56rL6tMQRREoTxAz2WTjPwhVC1g3JpgvgGiqygIAC/2/Z
	 IiXuCLFov6vVQ==
Date: Sat, 3 Oct 2026 22:20:19 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: omap-usb2: add explicit PHY comparator API
Message-ID: <asFjg44FteVbJdj2@parshuram>
References: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>
 <apBdFetctMKBH-iT@vaman>
 <16609718-fc04-4e1e-b63f-e54aafd14eb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16609718-fc04-4e1e-b63f-e54aafd14eb6@gmail.com>

On 31-08-26, 19:14, Ivaylo Dimitrov wrote:
> 
> 
> On 27.08.26 г. 18:51 ч., Vinod Koul wrote:
> > On 22-07-26, 08:36, Ivaylo Dimitrov wrote:
> > > The existing omap_usb2_set_comparator() API locates the OMAP USB2 PHY
> > > instance by calling usb_get_phy(USB_PHY_TYPE_USB2), assuming there is a
> > > single USB2 PHY registered in the system.
> > > 
> > > This assumption no longer holds on systems with multiple USB2 PHY
> > > providers. In such cases, the global lookup may return a different USB2
> > > PHY instance, causing the OMAP driver to perform an invalid container_of()
> > > conversion when accessing its private data.
> > > 
> > > Introduce omap_usb2_set_phy_comparator(), allowing callers to explicitly
> > > specify the OMAP USB2 PHY instance to associate with a phy_companion.
> > > The new helper validates that the supplied USB PHY is an OMAP USB2 PHY
> > > before accessing its private data.
> > 
> > Well the name can cause ambiguity with old API. Second I would like to
> > see users of this API as well
> > 
> 
> Would `omap_usb2_set_comparator_for_phy()` be clearer? Or could you
> suggest a better name?

Yes that would be okay

> Regarding the user of the API, let me provide some background.
> 
> Currently, the cpcap-charger driver uses the old omap_usb2_set_comparator()
> API. On mapphone devices there are two
> USB-PHY devices, phy_omap_usb2 and phy_cpcap_usb. The old API selects
> the first USB2 PHY probed, which is not guaranteed to be the OMAP PHY.
> 
> I have also added DCP detection and extcon support to the CPCAP PHY, and
> I'm working on proper charging current limiting in cpcap-charger. For that,
> the charger driver needs to be able to explicitly select the OMAP
> PHY from DT and register for its PHY events, in order to properly limit
> the current in case of DCP/gadget/OTG connection.
> 
> With the DT configuration, cpcap-charger has the specific PHY instance
> available and can use the new API. For legacy configurations without a
> PHY specified in DT, it will continue to use the existing API.
> 
> The relevant changes are:
> 
> DCP detection/extcon support in the CPCAP PHY:
> https://lkml.org/lkml/2026/7/11/600
> 
> `cpcap-charger` changes (currently out-of-tree):
> https://git.maemo.org/leste-upstream-forks/droid4-linux/commit/0261cbb724d875ee4aa2e5af34caead39e5e47fb
> 
> I initially kept the cpcap-charger change separate since the two
> patches look somewhat unrelated. I also wanted to see whether the
> approach in this patch is acceptable in principle before preparing the
> cpcap-charger changes for upstreaming.
> 
> Would you prefer me to send a series with the $subject patch and the
> cpcap-charger changes, including the required DT schema changes?
> 
> Thanks and regards,
> Ivo
> 

-- 
~Vinod

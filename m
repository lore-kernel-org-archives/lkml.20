Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56E36EA84
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921095; cv=none; b=BVzCf232pIqwYzWxHBm4Wb30X9S6bhS6+0izC4JkfzNwS5aGDMXTXehJlpWAfF1BHa3aIfw28zlnefRrVQsCP1AQGVl6oHTH4SmcqLsBHLxDt82ZWgJaoACRxvXUmgQEy/aZ9vwYm9GG3jogOaX8dNu/dZTj26zEm0OUCRRW09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921095; c=relaxed/simple;
	bh=fLla0NcqXJxXYeTXtzDejWsBIX0dlwW4G3S/gpUuqQM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cIMFEsFznBQartfhWQ28NBSo98ET4BqrZ+2/sxGWFRL1APBleTvDXNpRiZ9kTsVfmYSm7AUQ+hM5r/OdTolE7mE+CPx8xHXR1iZBU7YlBmrk5vidcXtOEpbQn6qM6YGY7fX/0sp3yuAog7tHn5a79ZLJcztqNT1iCFUYGiK48ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oQ1iz12p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XCwsxTnE; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oQ1iz12p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XCwsxTnE"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8F6EA7A00AD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:04:52 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 02:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790921088;
	 x=1791007488; bh=i39lwkD26QOafwsL8guMkB12f61EXloAJUmMOBailVE=; b=
	oQ1iz12pjQOU0bCpo3h/hxksCYoy6CuDaGRQxqQOgmx4A9sNw4o2caQPJ5G76CAV
	qWicef/hdlhOf39rpgBkS3UZn6FKlUDLTxyWhdK9VWhKLSYAbi0mSQK8MiyavarT
	wS1I5mHva7Jk4eqsTbm3r94ol9Utfj5+oWC9wrNyp38UPopeDWn+H/aEF4BE2G1v
	gjM9jsbnyGKwJp3Toiw3z+RUhTlt6VBpccudtPd0YJgwvCOWaspNoz0I0EMARV5j
	hWa6rE7AXpk7WWVMjDW/U9mELumj+O7zbX29E49rg/Al5UoOZGtwCPmkUWIvINeA
	GUaZGGgR5PjQnmYJQyUwUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790921088; x=
	1791007488; bh=i39lwkD26QOafwsL8guMkB12f61EXloAJUmMOBailVE=; b=X
	CwsxTnEX5s71+7KbvakLFPnUVpVx140NjbiDy+VnPEDw6RJVkhJ/23tqzoENS1Vs
	NUnWx9bUVNwgXImrT5LxS8wwdVs9hNrGIkzjLQYCOq5KO+eUqWW7U90sbWObBEHU
	psKGoD2nNAKkHh82o5YWzeCr+n4diQ/qDpBrKrR6UQyIeWh62WWl05XgdJ9q3DzX
	IpdeMEtJ4yZ/hnuJe8m+Wl1Hvg+erU4R9vVRZG1LuLDnxtnNu85VrAWimojbr2EQ
	WygvQJGu8qJVeGLEe0ApOX4f8DsIRvWB+DMJ/oSi6GQzexohivVGyuKe0RLcUdQ7
	X/evK7X1xjZft+HljOObg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790921088; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:pkO/oQuP5JIcfYlqTXAFFI2pJE9ZviPylhJ0G6IWZxoypio
	vA2J5x2tK2ZCC1B695XIANiYulTWgUHMpV/k++LFpp1A4wHydp1vJ6Wof2rI1l6t
	4XlvvdEQtkgYJ+DewZXiR2FaARSXFNpvDLmpc4yIT1BtmfYb2KpdKaYcq1C8aiOg
	vdyKFAK/IbTs3APJNfMpirO+aM7km8PSEytDTa46UybDxrDbzYcg6/24ZkvxSeky
	t2+OsE7baRVRFm6uvsBxmZsFAUiHrXyLoE0fEDhngy/lV5Hi/gAVnwxENYIeANDD
	C7y87Dy8HTGF9L4begaRgsOjKD/mAdS/0MQsVuw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xL52c59U95Bc9cw5cXAA/031rDK6XAUUmnBY7Bb/EoA=:fLla0NcqXJxXYeTXtzDejWsBIX0dlwW4G3S/gpUuqQM=;
X-ME-Sender: <xms:fUm_ak8inAPz2nGMjkfcTp8bpux5DsqVluMb0FYulgufUftbcd4zjw>
    <xme:fUm_anhpsM4qHoipCF-kOVtJkS9ZZx7ij_Ngnk0j4PkpKdC3Bmwlul30rvAOt9x-i
    UAopzBH3vq6HFUi12KphoG8YiWwa6IbQOfOjk4DaJZLX0a-ck3hWc18>
X-ME-Proxy-Cause: dmFkZTGKJ8jKxuPXcUVGrLHHrCtv7bWvJrXoTYbjvkye+gVnkX41CcVwfhX1inzqoMBb93
    Ff1Jb1hjziw2DFZuYofvUhy7TgftS1eWE1ZcmTirjqho72oWZrJHdlMytB5eWKYpZOKFt2
    jKBV1iaKbCENTZ56GanelrA/4063A36awjubEr6q1P1ZyyV9ZfJs8E29GA6kLpiqpuFcU0
    +0Cp5wdZJboKIrgIBxlR0SrWG5SU0CgKidIx5sesLgA38MU03+TBOLOWP+hKLNiJ+1hZHY
    wlD57hTTqoU84KOqSQe+oVSyxj+De1L5NrjqtW3FdZaP483yvHQck+AyrWpEQ/ua8lWHRm
    TMe+rdhX7rnSyK5SxVvn+NqkR3VDsSG7YUsjeF7cFXfiwTN8KN6wMBOGD0Hd+eR00MD01z
    nu4Cua/us6m6ANVSmYLX/KPcoYJVlaRe4EmrUo7JsHR9qhGnramdZI0sovdHlDoPER2pRP
    LCmFHV1kYcCqLq/uBg19JO5fatyvn/kmQoLh17wuQognwsoFW5wugo9W/J4cGkyNEov1WN
    arWmu/YjM8lEiPNYN+Felh3otaUbMK8VuYA1mP4am3iIze82j0AtJPVDcgpFK5bUOgGKLp
    3mVIAvlObXDLr+1GAqyiKJfwEagsuRFxQSx2Fw1aMpYppcS6kvEquClf0Fjw
X-ME-Proxy: <xmx:f0m_amplfyAFUKo6nngPAz5wtBVwUKZfuYYD241vQv5Ymrz_mIS7Vw>
    <xmx:f0m_at_ZAJlFbEAdleoG-6y_W7WHrycjW4ebyy5Ek2dEOarKKn1rnw>
    <xmx:f0m_aiftJIvFA11GVMZleWLtEUffezvTNBtja0ea2Soo-OxQCnVV9A>
    <xmx:f0m_anIi7mzExycHaLVYl24PgsNSWPtTC-xG2N-wxVESSePluDVCeA>
    <xmx:gEm_aiDZ0Rq5i8MmeRzMblGCs3_yA8EhHBBG5Dm3VZIkQ6UrXml7-xXz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CD29532A008A; Fri,  2 Oct 2026 02:04:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AH4vkjSatP-c
Date: Fri, 02 Oct 2026 08:02:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alex Elder" <elder@riscstar.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 "kernel test robot" <lkp@intel.com>
Message-Id: <d8890acd-d854-4f66-8ea9-3b30bde41605@app.fastmail.com>
In-Reply-To: <20261002013306.373689-1-elder@riscstar.com>
References: <20261002013306.373689-1-elder@riscstar.com>
Subject: Re: [PATCH] misc: Kconfig: tc9564: fix a circular dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 03:33, Alex Elder wrote:
> The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
> depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
>
> Simply adding "depends on OF_IRQ" results in a recursive Kconfig
> dependency.
>
> A little experimentation shows that the recursion can be avoided
> when "depends on OF_IRQ" is added by *depending on* rather than
> *selecting* PCI_QUIRKS.

Hi Alex,

This change looks technically correct, but I find the description
misleading as you are not actually fixing a circular dependency
but instead a missing one.

> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 9c5b1e9d672e8..87ea92af81dca 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -571,9 +571,10 @@ config MCHP_LAN966X_PCI
>  config TC9564_PCI
>  	tristate "Toshiba TC9564 PCI function support"
>  	depends on OF
> +	depends on OF_IRQ
>  	depends on PCI
> +	depends on PCI_QUIRKS
>  	select PCI_DYNAMIC_OF_NODES
> -	select PCI_QUIRKS
>  	default m

I would go further here and simplify this to

config TC9564_PCI
 	tristate "Toshiba TC9564 PCI function support"
        depends on PCI && PCI_DYNAMIC_OF_NODES && PCI_QUIRKS

(in either one or three lines)

CONFIG_PCI_DYNAMIC_OF_NODES is a user-visible option, so you
should not select it from a driver.

  Arnd

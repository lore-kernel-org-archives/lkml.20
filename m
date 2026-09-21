Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E7A514766
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026031; cv=none; b=KVAmAujPMu5NzRCbxjfjdf/6LEOWlkXX5Yb0NekpPAeZYOF68TlKqxdSmI1vpllI1RIAaiibh24bEC6Fy5OFmN9M4ljdJbVWwhcQQIRIuY9eDVuwrIxHkzzZlk+5meGo4L8RD6bvmqOarQvJQTnEfHEvSPyrV2xYrEiU4I3aFE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026031; c=relaxed/simple;
	bh=ddYKCadQrRa7WIpr/e1QdzsucgFTLqXaisbp55MBIPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS9sfSNIhWvP8PrC2JICAEWDY+q/b5A+m8Mo5G3b02YZmuDIJk64zDAEHS8DJ4zCaVO4aERjK//04UilAlrt/VnAFQ6rg1N5vNxZwEHK5nl1Z1QNnxWLvLfMCNnwhB0bYWfZNsoYsBaekH3tN69fnlcshZQZ1VfxgtBDGSQ+f5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AmBFndJN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AmBFndJN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B0B81A0F92;
	Mon, 21 Sep 2026 21:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18CE75FFB2;
	Mon, 21 Sep 2026 21:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B478B10328621;
	Mon, 21 Sep 2026 23:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790026026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Q/GyYI2xeCVFBXznT89exHyYCOANPeZxgg+pLy1DnkM=;
	b=AmBFndJN8l2JrpCCRUkheHXZ1WM3r62XQAIg2F56DCx3nhDveEr9Uc7lyf9nT5MEALjMWP
	Wy7GLZkLbeBxBrCFoKVrm9XmvqXARYQgXiqa7JMTDgRbYP0lAY7dqAj05OaTwMddN8Si2m
	+2pxUzKbm5WSD1vhasfEoxOKduso+D3I+r02XxYZdUIFD+Q0G8/hEnANRB480nw09OVxGX
	XIp3nIVawmmqmiIqGgTVxOu4dTBOEKhrhZv1FAqBYXSQZZtZdBnVE3VLbUQSRPfSPvlyyB
	XBTsZAMnywZ/M0KE2ZIuG9/u5jVV2UQet9g+Hy22GGwfNDCgahCumxka7ejSnA==
Date: Mon, 21 Sep 2026 23:27:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 00/17] i3c: Fixes, cleanups and HDR-DDR support
Message-ID: <179002599322.269726.2488163716410715856.b4-ty@b4>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 20 Sep 2026 18:12:30 +0300, Adrian Hunter wrote:
> This series brings a collection of fixes, specification-conformance
> cleanups and feature additions to the I3C core and MIPI I3C HCI driver.
> 
> The first three patches are independent fixes tagged for stable. The
> remaining patches address a mixture of correctness issues in the core
> and HCI driver, improve conformance with the I3C and HCI
> specifications, add support for configurable device NACK retries, and
> finally add HDR-DDR support.
> 
> [...]

Applied, thanks!

[01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
        https://git.kernel.org/i3c/c/35b028b25451
[02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
        https://git.kernel.org/i3c/c/b1a25e8e143e
[03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
        https://git.kernel.org/i3c/c/2bc2b1b89f65
[04/17] i3c: master: Match ACPI targets to the correct bus controller instance
        https://git.kernel.org/i3c/c/25648fb7cebb
[05/17] i3c: master: Remove stale GETSTATUS length check
        https://git.kernel.org/i3c/c/48d7187c98e8
[06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
        https://git.kernel.org/i3c/c/ad869331ac61
[07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
        https://git.kernel.org/i3c/c/dcaabb080e0c
[08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
        https://git.kernel.org/i3c/c/1570265b2257
[09/17] i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
        https://git.kernel.org/i3c/c/5fbd0790af94
[10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
        https://git.kernel.org/i3c/c/ae307311a69e
[11/17] i3c: mipi-i3c-hci: Stop rings gracefully when suspending
        https://git.kernel.org/i3c/c/9796ccba1254
[12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
        https://git.kernel.org/i3c/c/de243c3dd2e5
[13/17] i3c: mipi-i3c-hci: Remove invalid transfer size limit
        https://git.kernel.org/i3c/c/f3bd76ecb075
[14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
        https://git.kernel.org/i3c/c/8fe4a1b93aa9
[15/17] i3c: mipi-i3c-hci: Support configurable device NACK retries
        https://git.kernel.org/i3c/c/b7e849313eba
[16/17] i3c: Restrict HDR modes to those supported by the bus and target
        https://git.kernel.org/i3c/c/b968be9e7193
[17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
        https://git.kernel.org/i3c/c/9b347cbde81c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B412DEA6B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778080; cv=none; b=bDJMldZXgUtnzLksOVHJyaiKZ5gKQIWnxrQCWk32dwcJaGIsfFgKNvb1VFZt5y16yZRQuMTIL+JE8/uycenTCh376gmXYxXE97O2VRo34QJgRSiunSV7E8/+gAyvbAEFFu6AdGQ/yw5jlww703NzqVEGEfofwHwaLG+KbFqYPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778080; c=relaxed/simple;
	bh=Gu/xmoGO2gj/ZaZFT91aLsILgeAWAMbpX/qAJLgknSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+zsPh1ITQlwfBpD9yqYt7BBzbaDR0UiaubC4Q3actcWCoumaiUoHRLqmTIeu1bM3lrlhlNmXEvyghfAe251j6kT69GWo22lXqZJd+TKIatKLwGw5JMppKcUPfJ2uhbnrcfKvK56zpgPNUpDRqP1jMnOxsV2ujvEwxoJqNhMvIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hOSMR72S; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hOSMR72S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73D6A4E410E0;
	Wed, 30 Sep 2026 14:21:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48AB060749;
	Wed, 30 Sep 2026 14:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBE6F10329695;
	Wed, 30 Sep 2026 16:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bz4aEAjIOZ8PfQj3Jib8J+GC/znjg8tbeLTvSSDYMpw=;
	b=hOSMR72SSef0CLaVHSvzYlMFuEvoR9PnDYFJomJtR/0mv2uMNkFyi1ZOPgmrDZPCx6Vzsk
	TlCc/VwiCReo0rwFlpeW3Kq0poM72vrH7riGajHR72EVnuEQ8UvnBg3MeVpDl9ZGW+eJ1X
	cfZM8ixRhte4Dt+gCoxj2xb5gYxoYdSZ4isu/2mFh1reY2gcv7kzkNsgO86Ur7CrRC5vl3
	OI9NoOHGBGpSLLa8pZztQlq27h9NEkM98tRyqS8vYosmjYsQQoRJgddirDRyndSyvAg9AT
	C6dPFgVbmX60jQIuEa20l3e/mSwqgE9iF8IpCIz3jowcf0Mm4FqJzk+zsZUyYg==
Date: Wed, 30 Sep 2026 16:21:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: use named initializers for acpi_device_id
Message-ID: <179077804632.406255.945971316168096884.b4-ty@b4>
References: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 23 Sep 2026 16:47:05 +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: use named initializers for acpi_device_id
      https://git.kernel.org/i3c/c/609611d21b61

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

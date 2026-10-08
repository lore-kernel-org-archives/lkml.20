Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8F44E67A;
	Thu,  8 Oct 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462184; cv=none; b=j1j34WY6IWIc9gvfpPCuyX5OfL7K6QM/CZXbM2JFkqY7/fwS+kwHjx5vTPKvAYbCHKQynd2MU5MX0+bS3ueVYp+vWN+oIvz/CPKZNyFIQ2y2WHEz7aMz3wutck3e5ft6eSa+VRKriz/U6PXrfXK9XCR5fh7E2U8keO5jfehIIRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462184; c=relaxed/simple;
	bh=+41Iy/QAIUWwNRu8dikPLvO5055lp91QF2gtgpikH7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3WLeq8avtsQgNIREBYslYLDjGs7NivAepDPaeH8+jUDxbUCHiMDamQ3VukYYoK/YhZtKgbiVx3PZNxiI7X9Gg2DP7lXgdwdqbFQDwR6rEN2h9PPbEGXV92WiJEF4j7+gxE9fbFTYRrrwUbCE3lJtuD4QWq9JGVKzmiFMVnL7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bpd5JMhB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bpd5JMhB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53D2D4E41181;
	Thu,  8 Oct 2026 12:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22E5A60341;
	Thu,  8 Oct 2026 12:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAC761033026E;
	Thu,  8 Oct 2026 14:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791462169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NRZ2ntUT7ufLsv9s/suJ3Gy+KO8Zklh0QCrhpXXOx9s=;
	b=Bpd5JMhBu8cirohm7Q71zRI1kjM4bE6fdknRM7s34w4IV5Q/iBAZG5VgrLFKbRH2lbJlxZ
	QkhSdj3fiYNoqtc9DPBYloGrEPXbULZJ8eOicY3fiwTgqk/6Guo877sNu8pKhlGXRUXe4+
	uABsq8ut1E5fI/PumW9kOuCA5hYC485eUCsJynSgW8t0H/XRs3aUsnHurdQ4V5+ttpao7H
	Q6khByvkVg/fPxomNaVaemG6sBEq+YRORCfgiTvgxIg0BtO6dZwdqE1tPCnfmQ/ChE/q6Y
	E8WF9Jy1uY8rzuB44e7dyhO0jQ9O1tywEEouACLnV8p60/YnIaQ36b1yNcwAjA==
Date: Thu, 8 Oct 2026 14:22:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i3c: dw: Support Synaptics sl2610 i3c
Message-ID: <179146214847.369159.6401160228330992905.b4-ty@b4>
References: <20261005152425.25319-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 05 Oct 2026 23:24:22 +0800, Jisheng Zhang wrote:
> This is subset of the "arm64: add Synaptics SL261X SoCs and RDK boards"
> series.
> 
> Support the Synaptics SL2610 SoC I3C controller, which is compatible
> with the Synopsys DesignWare I3C.
> 
> Since v1:
>  - collect Reviewed-by tag
>  - use sl2610 instead of sl261x
>  - restrict altera i3c reset to 1
>  - send as a separate series for i3c subsystem
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: dw: support up to two reset lines
      https://git.kernel.org/i3c/c/6931331f48dc
[2/3] i3c: dw: switch to array-based exclusive reset control
      https://git.kernel.org/i3c/c/224e3606711d
[3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
      https://git.kernel.org/i3c/c/fc5eb1b0631a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

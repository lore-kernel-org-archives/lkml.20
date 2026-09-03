Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215A4FDE4A;
	Thu,  3 Sep 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464767; cv=none; b=pwcpojExZs0n2ABrDFt4ilJgeWZPlKkDux995LtWUgsrhO7orlCTBdLkl6JvWLb6LlFWJqOEhWaH/D4kIuJc+IP1axzaGM5JowW9pgK00WAzaWjEOMJi/hQanKWw/L+Crb1HmF+UMBvGx4Ct0hs5OsCZ6QcTeJiAR+ALHeOKSxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464767; c=relaxed/simple;
	bh=yt3VLOBBwuy+nvp951odgPQGWGf1+Q+4ara129mGyTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXuTbY+0iaF/u7GVGyR0q+GRdO/JRHPQ1Tzp/gRTJ7bvJJI/MgV9L44Uz4BFDCsLMC38JWcYuvNEGsKjUaYPmwY2pKRn+4GDZSpK4chzK3+p/l2PoHSwhR1o3I3dehHZl0ldKeDF15Pf74VWiVXPrFj9ji6MmsxUL/tEELu7w2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=r2O6d2Sf; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="r2O6d2Sf"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 534F9C0000E0;
	Thu,  3 Sep 2026 12:45:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 534F9C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464749;
	bh=yt3VLOBBwuy+nvp951odgPQGWGf1+Q+4ara129mGyTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2O6d2Sfl0xbQJ7xDtWxfdaGOG35EsSuR4aaSkZqCXq4nSi49W9mBOvh2xTh4VcKt
	 WgIIUe0GcnPicwUkDQKwA6DMFf99Ra22jBplhdL3qZPAEOyZeK60wzgyc73MEJbqT7
	 SxKhrcKKUoPH94zsC5gN/x7XEURLN7/rouNyY7zU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1B953A9A;
	Thu,  3 Sep 2026 12:45:49 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
Date: Thu,  3 Sep 2026 12:45:48 -0700
Message-ID: <20260903194548.2038308-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de> <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 10 Aug 2026 13:46:33 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
> Stepping and in a c Stepping. The two steppings are not compatible.
> 
> Introduce a new SoC compatible string together with a new board
> compatible string.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

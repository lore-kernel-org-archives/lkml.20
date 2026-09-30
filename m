Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337A4FC8F1;
	Wed, 30 Sep 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778217; cv=none; b=qExXYBYuDTpR200ZKTHEktE7OawQpU9ervbC5xFpJxN8x8655ZERsWF/oM/d1Cv0CIwvcYUM6W5xWqeyRfBAhFjtrF3rU4RZZ325RWKh0PbZWiva0A0CfC1N4NKTKdx2JqB0EAar/biHe9QmCSnFxdCOFQa6PymneCRCGcP4us8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778217; c=relaxed/simple;
	bh=abw2Ak9H06zSs5kFJJWubA/edrBQdUYZ170hxCs4e9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGH0zNlFBswcxGZ44smeLjX3dNYJzzVv9rX7iHM5Alnln94YHURFGdLRHUzk2p6O2rmiHTzHukdxqRjVWoeg6Y9UeNcm55bhor4Xco3IOq1GGDNS4FVFX3CkMl4/eZlP3iWpdzIV58Yl/b7XzIJCzs5L5Ni8dZW2mVuSz4JtTPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QQ/Eq8uz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QQ/Eq8uz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01CA41A106C;
	Wed, 30 Sep 2026 14:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C118D60749;
	Wed, 30 Sep 2026 14:23:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB4281032985F;
	Wed, 30 Sep 2026 16:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tNMw6NTjdJJ4qvs+O1OY9kSbqUjNQiZ3YyQVzxT+H8w=;
	b=QQ/Eq8uzh585JpJaXZ/L5B092QPaVtVG8QFNzjpNW7he9bQzz/Ve186eUQO1GLn0FOHDrg
	Mmqc3pTZYncNf0mWxZAsq2pruquvUFtrh18XcEvJehZDZ01WvP7znOZ4mCuLzjK/M+3eDr
	XE3Lcl0SC+tFfsm6Yd0+Zb8Fl986BKm/rW5lpdg2CuN0F2LQN+ZNtrs6Lp9HocgvXtfDea
	LXdl8BjIGgvWqf5qz6Hhq0Vs2+sE9NK39I9XLbq1gjDMxjmZkHZaZv8dc5MA3jyATR4aKV
	eghGk/fTgRzdeaClX6S90gXglzyykmdPBeypLVHzFOUVvw2NwwFgW1UAcq3tjw==
Date: Wed, 30 Sep 2026 16:23:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, mfd@lists.linux.dev,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: (subset) [PATCH v20 0/8] Add support for NXP P3H2x4x I3C hub
 driver
Message-ID: <179077818367.407330.1583527335918259957.b4-ty@b4>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 22 Sep 2026 16:05:42 +0530, Lakshay Piplani wrote:
> This series adds support for the NXP P3H2x4x family of multi-port I3C
> hub devices, including their on-die regulators and downstream I3C/SMBus
> target ports.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> [...]

Applied, thanks!

[1/8] i3c: master: Add APIs for I3C hub support
      https://git.kernel.org/i3c/c/9d60a0eafae1
[2/8] i3c: master: Add controller-only device operation helpers
      https://git.kernel.org/i3c/c/8d0008260c32
[3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
      https://git.kernel.org/i3c/c/58c018414635
[6/8] i3c: hub: Add support for the I3C interface in the I3C hub
      https://git.kernel.org/i3c/c/b0cfe49a2e3b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

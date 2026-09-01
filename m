Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF146E00B;
	Tue,  1 Sep 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249355; cv=none; b=fsRY4VmB+Nqvu0mMLngejfH6NtiwY2pk6BGgCu4AYHJqbnxSYH8UYSKBDMs7p0n1dQspwKf+aEfl1EXcHFcXDh0j/WhO0QkxA/Ar54uqU1uwbdBl64igbT2oDxQ+N1smMveQ44BfIqhLqTknS3zzeciEDjugPGDjWa5XG6xG1bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249355; c=relaxed/simple;
	bh=VRBA11s/Woxw8KQYoGWlXOHQBUGWbFqIn7furtGwfXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FHEewTjhIX/cBXTE3jGGGfEBxbLAp9a9c810fnmp/iEDoFyk8EWVXCcUgvjYNjoBRuKrhoOpq7xgdtRU3EA05rj1714j/N5f6NEE4u4RWrPOUl5HiEMOdOpQRzrg8kvsfC1MBIGQiXGnTjL2i0moXm1gUP/sIohRtOetPHgLfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4F6AD200FE5;
	Tue, 01 Sep 2026 09:55:49 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Frank Li <Frank.Li@nxp.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Shawn Guo
 <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
In-Reply-To: <20260831182243.GA955466-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
	<20260831182243.GA955466-robh@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Tue, 01 Sep 2026 09:55:47 +0200
Message-ID: <87o6ehjth8.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

On 2026-08-31 at 13:22 -05, Rob Herring <robh@kernel.org> wrote:

> On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> > Add a new board variant for the Skov i.MX8MP based family of boards.
> > 
> > This variant uses a different 7" panel than the existing ones.
> 
> The sashiko issue needs to be addressed.

I'm not 100% sure what would be the correct solution for this case.

Would it be valid when the *.dtso just drop the "skov,imx8mp-skov-revc-touch"?
The generic compatible is not really needed, but the base DTS wouldn't have a compatible otherwise.

Or do I have to change the binding, so that 3 entries are valid for the skov,imx8mp-skov-recv-* and keep the hierarchy (although unused)?

Thanks,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

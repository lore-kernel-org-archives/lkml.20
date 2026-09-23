Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1E4052A3;
	Wed, 23 Sep 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184847; cv=pass; b=AYiqs2LsB9qKGsoxNPgF8biaAPNmP+Pb+3cOy3SE8Q+ohCEiNentQQOauJ5clflCkCuLRY+PsDcv15Lq5UkJFH2DmZIH9BGt/yZHsSKwWmIvhlcjAfLLFVC8F/b7usB0OVTNzLrjW27fAAIJBro3Ks5hlud6Dmg2yoZrxel7jiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184847; c=relaxed/simple;
	bh=DNjgsnyGeTsYcFIs9nGcew1I27uSPBTg/Q/RbgW/T2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCqJ971qy6oTwQPnf+zgWTgUH5qbZP8oDo5gjWVAlcEBGzQzphNAsGT767jlyDeYqbnmJABaeBl5NvK01Lz3s/z1bSm1zn6Gj35MTyzuqt9dBMyLi6XRiZu+JRj3xcEu5l+PunfItNqFjuKhUWeUNmr+P9yxmrNy7ukHBbMye4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=CwMkLaAh; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="CwMkLaAh"
ARC-Seal: i=1; a=rsa-sha256; t=1790184810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TK+mhxWqSQlHReN6zjRE3fAskmD8Vi7nKZ6VQaq20716RDwvlnHRyT/pCITIXg86sKTc9EpnMO3o7KbM9Yd0lfGcRJYbCyQSNSPoEArWwCxdWxdE7q5liGQ4SfYmxSG38wqKXpAvHo/+dU6vMAAJXkO99Q0gxz85cxvYSEcop8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790184810; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nsanluhTpoeM0bPWCnlDUgLBI+hwIJEThPZvWCMVm0A=; 
	b=TbKb47s2NDWK917dpDcHeOCsMXYSlAThLAhCqezjHOMy2c07XphGyOK6WieNc4d0pQtHhUC5wL/4BfhBtooYFUZOrBaFpQVauPgVQi6AoymH0g6kKyS+qdiLAgwoj4ubQfeS0T8BJqUmSQ4h5+d0b3e1DE5BEHC5apL0uHqCWx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790184810;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=nsanluhTpoeM0bPWCnlDUgLBI+hwIJEThPZvWCMVm0A=;
	b=CwMkLaAhi97xQnGSnnqt0hhYccOsCycdzbbdWV5zNxjV2MMcXVRGww4uzq+VHBf0
	7vY8cSRgeGiGP6aoVqR2FRX3sMkFvtqXuAZ88Ar4QXB5P11DLskN4P5a69x9z/78t+X
	NI4/ps41AY6+rOPIIxGy2zn+lzFg0s9ocgCVpD+M=
Received: by smtp.zohomail.com with SMTPS id 1790184808288542.8755653328309;
	Wed, 23 Sep 2026 10:33:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:33:18 +0000
From: Yao Zi <me@ziyao.cc>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>,
	"Yixun Lan" <dlan@kernel.org>,
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add
 USB controller and USB phy support
Message-ID: <arQNUQ92Dx3TOKCR@pie>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.183.46
X-ZohoMailClient: External

On Tue, Sep 22, 2026 at 07:04:34PM +0800, Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> USB A works on otg mode, it isn't configured currently.
> - 4 USB-C Ports
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 44 +++++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi          | 66 +++++++++++++++++++

I think the SoC and board-level changes should be split into separate
patches.

>  2 files changed, 110 insertions(+)

Best regards,
Yao Zi

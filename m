Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696128;
	b=gAzRer2o9KVM4g1EJva8LYbF8nb3swrS8jCISQZgh528O7yT6IeCSz+70krq+pPTM7uB
	 zuCzaJ8o2e7n1+qrAzDWtY2FDsW7Cudecg7iG4FlXXonNoLuUNurtGJqM0Qd0cHfjOY0u
	 H38XL0IGNgN9JYc/952KWngEi6NAVeT+tiONXtGN6zRGJ7bxQgstEDzCxCzecMZjV5pvx
	 DCm2ZZ5gXKaTpSjI92HHcfe0ljVUFic/PWEQyS16fT2VnT/SvSMh7r/bEFevxGOPSbxDY
	 jqardBHUffGwlJlgOt56iYyqplkZpjR2XsoYKnl5232zoG+IcWi+hifglf+KH7oKmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696128;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d+IRbs3FeqA37fXeROEiKyHno8d9zy8yIxQWW2C+tuY=;
	b=JmIKmJR8KnyC42JPEbfmLU7Snkmx4rtboSa3rbx4JcWk5Y7iRKO6h2hb/yZMkwNAceCv
	 /98+11dRCBLrf6jXRDtmG2ZYpsJFtjnF0tmYwyGUZc7TNKi2hQ78wD0pos3C+o1n9ChsI
	 TnoqFHsbPhXeDCeuhfHjbkIl0iizPsid76uZQEIH9RRNXAK+WAQg3hwQ83d/Oj8T93Z91
	 vUeFx1u9EHnoR299j7Vh/JP5oplz+js4emsd9KdJRFzv0hG7JQFhn0T+bRQc+LAUJyOnh
	 3CdcyeYgyLZZTAMqBJ1IrM6qsWShh7yznkjeCg+Bs4BQXLjqo9sfQ+RiPrRaNvzRzQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hMx3kx2u;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DB606A31A;
	Thu, 22 Oct 2026 19:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hMx3kx2u
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2540740E016C;
	Thu, 22 Oct 2026 19:08:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QVTxtbd_px1P; Thu, 22 Oct 2026 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792696120; bh=d+IRbs3FeqA37fXeROEiKyHno8d9zy8yIxQWW2C+tuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMx3kx2u5Yv12yYwRnZIj8ko41SrEY0/Bo24yD1IkaXB3w0Cduv/+/mZALYiTB1c7
	 ljjfmrxGeDxztfA7wvUouPo7jX29EoogFB3E4lCS4jQ8D52zyU62aHlDAlJAs1GO5X
	 Gqyg+Csp7RMyGnOeVI1L0OJodlzLQ52GA0ajToo8k+DBUjpRRzVsi3eMUWjfAQxNwp
	 3LmFfL6H1eDU1EDO9Ixj6jX0p1x/ThQfPKXHEpNgFUAS7Qn20cMOD715Lbw3XO79FH
	 adaQ3dlCrkNZu+IcSTHZW849r7wmXSICNIF2yl9TYCzQTodWgcYqKuJBX9Da/xeyt9
	 DzDAvwtI6/PwCNVaCM4TMMWNNt5jvXQ0yt4AUTbQ+NEeWMwAO8+k9Vx8kguPHk58m0
	 FFlWKMwpgsJQ6J97aAdrFKQcAN0N9Fe5Dbpf1LWhd1gGcpBbP0SreR2Nqj9i/SDHcO
	 vsl9S1wNoXpSLNG8/60rkaFfEQRl6oPrWD2YwB/c4H0lX77G2c6dNVEqTMmS1sirxw
	 y0QmbcRQjNu3D+20Vx9kkvi43ZRkuM08HJvV4Hs5BqhipIVG6y+Z2+nuBkCWqZUxzl
	 Ukr+sL/72S9yWdkXaQBA3XEatB4/zUgEqiORrYh0k+vVOYPPG6qhkuxpYgRIrtxFts
	 3ZcV3/WTjJYy2zQ0cM0Xzm+Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5237B40E029E;
	Thu, 22 Oct 2026 19:08:24 +0000 (UTC)
Date: Thu, 22 Oct 2026 12:08:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Borislav Petkov <bp@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/9] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20261022190821.GAatpfJYsT2fqKhk3T@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <TY2PPF5CB9A1BE6C09C55652B1A6AA68725F2652@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE6C09C55652B1A6AA68725F2652@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>

On Thu, Oct 22, 2026 at 09:52:36AM +0000, Ryan Chen wrote:
> Hello Boris,
> 	Just a gentle ping on this series.
> 	Any feedback would be appreciated.
> 	Please let me know if there is anything I should address or revise.

Lemme give you the spiel since you're new :)

From: Documentation/process/maintainer-tip.rst

Merge window
^^^^^^^^^^^^

Please do not expect large patch series to be handled during the merge
window or even during the week before.  Such patches should be submitted in
mergeable state *at* *least* a week before the merge window opens.
Exceptions are made for bug fixes and *sometimes* for small standalone
drivers for new hardware or minimally invasive patches for hardware
enablement.

During the merge window, the maintainers instead focus on following the
upstream changes, fixing merge window fallout, collecting bug fixes, and
allowing themselves a breath. Please respect that.

The release candidate -rc1 is the starting point for new patches to be
applied which are targeted for the next merge window.

---

While you're waiting, you could read

https://docs.kernel.org/process/submitting-patches.html
https://docs.kernel.org/process/development-process.html

and you could even help out and review some patches yourself. That would be
the most awesome help you could give to folks, and it would be very much
appreciated by maintainers who are drowning in patches.

Thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

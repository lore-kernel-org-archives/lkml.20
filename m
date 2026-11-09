Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266454;
	b=D1stIj8+16H1WHQunv9XaDfgXw4p772yNX2qe6OuY4sdaPIwOcQDHMZKA43r8Cv3vJJl
	 6QMIq/Q2Ev2Mhje83BAcmuc/vp7h4n/t1fXELp3Vzl57neDNPzdwkxB48UdiVyZ4tkuuy
	 tVyM8DhC5BuWkALYHSksevpXPABY+MUG8MPAuMrJYQSecz+/4fiWl63YnC+Gueh1SiHjS
	 1uN74mDdtyh4Km4O8sBSvxtH/lxvfG4R15Wa6UGY0ref1ysX8dTmofH2USqyqqhg29QJc
	 yfl4Eo+1qSjlOmnoY77F1pv8Yp0XyKn9YLeaPbktppUmXa8D1jp5qPZsFMpbaJsJVSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266454;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=kc4oDmW8i9mozpJcU9fAYFRzqCZe3WS8+JFCNRvi5+I=;
	b=cifoA8A1B5GWTvFet5e/Ob0//wFHhIQFm5fc8o4D6kyj9jIYDquwnpiQBKP9sD0SncQg
	 82IxgdtF79XQVr5q5P5ncmkpKvelLBFa5MZYp1QcyxwWcDkInyYEJMf3IgIO5KDq5yjCi
	 eI9/Bn25g3x7r4INwoe+nxxjOHb8TUiDfiyD9G2FxXCn1LR1P0UbXveEryh4/fX5cPRk/
	 p9fTltEvY0PSECZJMvMBod8STLic7vE7v7S4gz/fdxFYwDLQ+lugVLj4oO91EZNqm+foZ
	 hLKLs/TBastJbOQBu4VDMm3Qaq2f2WWmzuDMRsZSsXEQhmtO8z438zCt8EdxNOKpcLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E8btDvfl;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A35606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A35606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E8btDvfl
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id QWq4xYFDGJFmFQYfUx87cg; Mon, 09 Nov 2026 23:20:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYfUxrI8xuJrPQYfUxwZPY; Mon, 09 Nov 2026 23:20:52 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af25554
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=37JH_sIDIT6TzvarxRIA:9 a=CjuIK1q_8ugA:10 a=p49Upr6YYhNo69yxWKUU:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kc4oDmW8i9mozpJcU9fAYFRzqCZe3WS8+JFCNRvi5+I=; b=E8btDvfluYKpR6zkKPcc0jUivp
	kDnYfv6Tc5ZseBCm05ZdMtYPt2NFrHAiK9PxjtDtbgnvq9YDyAYWHlC6VwcR5gSTfWOrlxDG0+oPd
	Kq7sSWrGz+XYvaLgT76Gq/NAQ0mmg9nrqJe0aE9uUfRgBWOXOgtgfm/cRo0Okw0X6bdvNUI6Cv61C
	HUZqW7W7rsJRrXXd4GMfbkHSBxHByB67B/fxLgjK2sGsJhQ+uriqjLe+cIA/sRB0jftWLj2QoNc8g
	9rtTvavHA+wnsfrkQgPv8DZcWABl/0h1E3IN2E/+Skzmvv60BGRfpCCMVvGLrYcdoQlbZ8RIKt7BS
	KYHsVOqA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37146 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYfS-00000000vde-1nZf;
	Tue, 10 Nov 2026 04:50:50 +0530
Date: Mon, 9 Nov 2026 15:20:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 3/7] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Message-ID: <bfb40baf-7f33-4f66-ad80-57bef1d6ef1a@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYfS-00000000vde-1nZf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37146
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 46
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGZ+RYtfsVWQOZcd/UcOoe//0me+t8xOHqg83YfZAfvHVlf912fIOXlD2HYXuYYI6F2fNFDC/TqiCQABI9fAP1qIr22i9jBRaKcJXxg5YtsQGxV/iLtQ
 N4UZ61j95aKVVG3OIJW4kj8T5gkPbQGr4zdzhaWyoXLTXiEIV2r1RFA418P0FerDDFizpECPl7hTgWHYfld720H12sr0WyqPN584wvPXpNASzabYODcg7tiK

On Thu, Oct 01, 2026 at 05:51:57PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> WDTRCR_RSTIRQS is unused, so drop it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter

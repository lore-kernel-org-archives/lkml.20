Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD190220698;
	Fri,  9 Oct 2026 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507184; cv=pass; b=VAGTqRVCWIqmTPrR/0PmLnGnRp8hDUmXKB08bnu1pArZmyNfI+SgIWYXLxVpZyjSOMCZntb4uJ+n2QrHkJqTjtLviNAw54PTp5RE/W0SchydJu6x2H2x8sJPHOwUmTrR9+Px4PB3XApP2hqRTXLAehviGMmx6g04eMA6XpQk5FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507184; c=relaxed/simple;
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=WviI+gC36qTx+1tLhEjaRRUrkig0phye1TVMEIuUkquRQ9K9ikPdaM89GxjzVcNTsgrxFHZydrCezIgp3OzYturbgL3+xEI3hxHNXZ2k6sIZMFjd44Xu+Y0OFTp/OOqeuab5++QMyCIH2udVadE07oyGVRzo7UeNDzG/cRToHZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=Gp0kSxNx; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="Gp0kSxNx"
ARC-Seal: i=1; a=rsa-sha256; t=1791507154; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VEFxDxRU3N6c2y5xEyriWFwc3v1F+9vo5rYzynqQcN581vaKmA6+aJtA+Lt0FPXa9gqU6EUbU22+Lr5hfJvXWJsNX6djwd8Plpem7inpE3V8a17LHyWleeI+eZSrgTI2YGHUkGlGAqBRsxckW8rRoREUGx/b9uOaEGO34vl87oA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791507154; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=; 
	b=IFXBwAh8PFQPPo1birbNlqW8GAJDkrdC2fzsJKLjdv5bgSzWIKw9CYx8VpTSxTONngWPKZA90ttIesY26JLf8nrjz/eXHufJmLHdFGF9kslGDWlAy9xYPkx70DbvWQ1w5MY6SFtqb7WH1eP9q5gCb5sBAhAA3w0KuZI5o58cxl0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791507154;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=;
	b=Gp0kSxNxlSkVAUuTYYBLPw2Jbmll1dOlqhZTGzYnGO3MUsZ3gCaN6PJ+Q6Yfcz+o
	j8I9mxhsWf1iuOx4kkCkClcLmHLB2xDfF2OWB3MXAr6peVNA0MdkWrCaE7FoJaGhGFB
	+wH90u9JGK/JZZmM8L3g8XSuMENSXKNUm6tVzozo=
Received: by smtp.zoho.eu with SMTPS id 179150715145367.99786079727983;
	Fri, 9 Oct 2026 02:52:31 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
In-Reply-To: <sashiko-outbox-164681@kernel.org>
References: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
 <sashiko-outbox-164681@kernel.org>
Date: Fri, 09 Oct 2026 03:52:02 +0300
Message-ID: <1791507122667359270.h64-leds-sashiko@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 00:44 UTC, sashiko-bot@kernel.org wrote:
> The commit message lists a total of 7 LEDs being added (one network, one USB,
> and five SATA error LEDs). However, this code block adds an 8th LED for SATA
> activity on gpio4 RK_PD4.
>
> Was this SATA activity LED intended to be included in this patch, and if so,
> could the commit message be updated to mention it?

Yes, it was. The eighth one is LED5 on the board, "HDD Activity" in the
Kobol wiki [1]; the panel has no such LED. GPIO4_D4 only gates it: the
JMB585 activity outputs light it, and a low GPIO keeps it dark
(schematic, sheet 30). Hence default-state = "on".

[1] https://wiki.kobol.io/helios64/led/

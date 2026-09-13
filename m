Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC91BD9C9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309706; cv=none; b=JIIKImuYTGDqnpGRJyCqkg583639bN0chsyvQmtHfVoaqzy3W9XFYmMGXABxVUzEvHzjEmXf67b+mXFxNB09Y/T0OPo/nRLR//sXFSR0Z02KPJFdKm3KT/PCsejcpMnPdL/AbL/J5fGHGRmmoqnuJhoy4/RlxyRi8L8P0DCnd0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309706; c=relaxed/simple;
	bh=Zj5EWEqAaCDZeeY56pguDf9MrushLq46Zr2FoXK63UM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JLhnAVE8D2XKGFTFoXh73HHFa6W/HUGUY72R6vTIFHtKJKRct/lB+ILRA3NLcSHiL97rhVO7c0XMYv2iybjBs2Oz4XhnyjiRwfoPgpj81sZyxCuM7D2z6MSBWDPC3FuQYEoISLatO8k+/uWrpwukJk559pB6MfD9AXtGVBUmWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=b2nxA8lk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="b2nxA8lk"
DKIM-Signature: a=rsa-sha256; b=b2nxA8lkJz+ylAO3olfTufX8539NJ1KPfrZeno5qK17Rudx6PuyCXEq8FvzfR0y4hN9fQwbf2KVDi1ITRuPav9vQzriJusDTD3jNIYs3p5zVHv2jEPymHaurpTfa1m12UPo/Cyvp06gJ67FeCK+UtXWy/X/AvRU2b1Mh3dBuK9iLAXa3ceAt8a0qIPN3yNmw2p+0iLizCaM60sbwx6tHjznWyzP2ePDEBhaWFsf6vs4wxe74cPF34SAcYMGRuLu7Cc6RFVpEtK3YVKuDnsVnjC2DGSyTCZFXZEmSlnHmFFhubgEnQvBE/vzbXCM/Nz/IdQ7y/Z4OLnY5gOIDuJsHSQ==; s=purelymail1; d=purelymail.com; v=1; bh=Zj5EWEqAaCDZeeY56pguDf9MrushLq46Zr2FoXK63UM=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1692820451;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 13 Sep 2026 14:27:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x5lBH-0000000FW2f-2czl;
	Sun, 13 Sep 2026 16:27:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com> (Marek
	Vasut's message of "Fri, 11 Sep 2026 16:49:59 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
	<874ifwjff2.fsf@dell.be.48ers.dk>
	<fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
Date: Sun, 13 Sep 2026 16:27:43 +0200
Message-ID: <87wlspb50g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

Hi,

 >> > +	chosen {
 >> > +		bootargs = "clk_ignore_unused";
 >> Why?

 > This can be dropped, thanks.

Good.

 >> > +	gpio-line-names =
 >> > +		/* GPIO 0 - 77 */
 >> > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
 >> > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
 >> > +		"", "", "", "", "",
 >> > +		"ifm_device_info_eeprom_wp",
 >> NIT: The dts references a number of other GPIOs, any specific reason
 >> to
 >> only name this one?
 > The legacy userspace tooling used to depend on it, used libgpiod to
 > look up this GPIO by name.

OK, but why not add all the referenced GPIOs if you fill out
gpio-line-names anyway?

-- 
Bye, Peter Korsgaard

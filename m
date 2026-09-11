Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002B3B993A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119588; cv=none; b=Gu5o7a+yA7aipwNBUJbOEWSjN+n0IN4yd/Fcu6Mg6WE6dgMu+sLPn6N6qv4dmQCuRsofAmXQ/okciv5/EXqxP9BESQXqPAiLx9rQ6CJ/mItUrCqg5nthN4jFcLWt+oAZc4uDB/qtRYul1M24z5AIzwVAF/DhBPXpbS/poLPePg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119588; c=relaxed/simple;
	bh=RIReITS/4nOgxYYXqRyKfSmV6SO1lyFscaEQmy52b90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qlg4DeHDqVOiE+X7Zt0hKPnxBl587394XT0bGWF5ldyQTD3a+olcqejX27AYehyGMbygAli0ynhjjJeBHh0PHoIikpUAGy+bCO2FjoePmguC6FbvNm5bzwTz7DBZGQf4xWT1m0NTy9pERbELtONb4aG+ZauTyapWFqrxTspnfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=rL9I2asM; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="rL9I2asM"
DKIM-Signature: a=rsa-sha256; b=rL9I2asM2wzcKZu5x8wP9FpnB9b+1w26/CzgPi5sxemhJjKxJdbWU0GUYwukHJjNWfJT46evQGu71Puuc3FEmDNbc90fM2uxIlFufNKJ9E4cLhV0CWFLg9Q8y4gvUU0ZiKbSS5tTjg6k/wfzFFWmrnByX43uvQGkZCim85B/nEplninSCtR4JyFiwjhj6BJ08o/m941KVBTUcGt5+lAKHEJ/FeVZUD/vIExiFBqstSvly+JXWp5NJDeJFC9ypj9Dn5BuouOqRZ8l9a/64WSrMcdqFeqrDybcQrzjuV4hO3J33G3vpRaxaEy9HBMTFTUxFZqHjjO8dFP6qEVdAhED+g==; s=purelymail1; d=purelymail.com; v=1; bh=RIReITS/4nOgxYYXqRyKfSmV6SO1lyFscaEQmy52b90=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -364201085;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 11 Sep 2026 09:38:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x4xij-0000000ExW4-1mPw;
	Fri, 11 Sep 2026 11:38:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <20260909182641.165383-2-marex@nabladev.com> (Marek Vasut's
	message of "Wed, 9 Sep 2026 20:26:05 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
Date: Fri, 11 Sep 2026 11:38:57 +0200
Message-ID: <874ifwjff2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

 > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
 > The board is populated with four ethernet ports, QSPI NOR,
 > eMMC, UART and USB host interfaces.

 > Signed-off-by: Marek Vasut <marex@nabladev.com>

..

 > +	chosen {
 > +		bootargs = "clk_ignore_unused";

Why?

 > +&gpio {
 > +	status = "okay";
 > +	gpio-line-names =
 > +		/* GPIO 0 - 77 */
 > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
 > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
 > +		"", "", "", "", "",
 > +		"ifm_device_info_eeprom_wp",

NIT: The dts references a number of other GPIOs, any specific reason to
only name this one?

-- 
Bye, Peter Korsgaard

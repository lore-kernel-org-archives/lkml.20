Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CA3803DB;
	Wed,  7 Oct 2026 04:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348919; cv=none; b=d99WNcZLo7ENBo6D1gzfVT/BgrqplVuszZnpLbfJcw1Z2EgO7nHp0XoY/XnH6AhgZ2oMrDQ5C1OK2N2+HMcctxGwoT/cU/vwpxqII3q+tmr04yQBHXSQ/iK6FkF5mgaQ5GZvB/eU4Kzmxg/RD+Ov7Vzkr2/LQ0dxmGXpX7c8icQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348919; c=relaxed/simple;
	bh=3Cz0SimQqCHuxFdDf5kI6yFxOfbA2RzmYpDsSrCuluU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=TM+jbUzuUZONbELgeTvxytK8uPpQqraHa637lZaSvBCYsPKXPmh/WkPV08okKa3wzXuiqvop9ZBJwcmwDwfthY2bikoAwHmqDx21yQZXwxlILOIwsBllG6bNs+ZrRdVFk8o1TXx+fL+7nrgTOOWBFNnfYKbDblpJvQCupB/bR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zYfsStcp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zYfsStcp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E1424E4115B;
	Wed,  7 Oct 2026 04:55:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 333256074B;
	Wed,  7 Oct 2026 04:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB122103309C5;
	Wed,  7 Oct 2026 06:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791348913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/sJd7eH2sLKt1YGQkZySmzpNOTpbHq2cBxqPOa4ucJk=;
	b=zYfsStcp9Zh4SyCT+HGY3e2oISTjIEs7+47PTIugOc9yfx2oJkE/RKyhZFK6Y8DZ7WKiEU
	8ncTh0rlkywUpA1TEXiEqzxPqlz4jIoiNXA33NYoZRwzAQJjWb0brV5Pn/53Dbclo86Ww5
	gVD46lfzhTW4EgcHSAVVHaYe5AhHR4zPLM0773Lva+037t7CisI9bLdL8UvIJu8YWVm9Pk
	Dc3gfmE12gL4Rv/KMXuZE0SAqWN0V6FpiQEPUtjSnrtxpvhB5dg5uqGhVP2K7YCSRmEVnK
	wwHpt0+lUBynO7iiPzynVzoDy0fOqokfHX6L/7W8KUfrdrs1IPw806nSNUVRNQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 06:55:09 +0200
Message-Id: <DLYC6W4J0NRH.3T1EOLT37KM9S@bootlin.com>
To: "Borislav Petkov" <bp@alien8.de>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Tony Luck" <tony.luck@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence
 DDR EDAC
From: "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
 <20261005-paul-v7-3-rc1-edac-v5-1-140a0f124bc0@bootlin.com>
 <20261005184621.GCasPwfaQNE0q6zykP@fat_crate.local>
In-Reply-To: <20261005184621.GCasPwfaQNE0q6zykP@fat_crate.local>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Oct 5, 2026 at 8:46 PM CEST, Borislav Petkov wrote:
> On Mon, Oct 05, 2026 at 02:49:22PM +0200, Paul Louvel wrote:
>> Add the Cadence EDAC dt binding.
>> The memory controller optionally supports ECC SECDED with DDR2/DDR3
>> memory.
>>=20
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com=
>
>> ---
>>  .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 61 +++++++++++++++=
+++++++
>>  MAINTAINERS                                        |  6 +++
>>  2 files changed, 67 insertions(+)
>
> Needs review by DT maintainers if it is going to go through the EDAC tree=
, see
> output of:
>
> ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/edac/

ACK.
For some reason b4 did not included most of the people apart from Rob /
Krzysztof / Wolfram.

--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020548;
	b=mBD8h26TFFZ/may/+ix6Oc/G1D936LHDJBLBxa8FrSiZ/JgMFOUXfY1ds0Agc7z8iEOm
	 hbRLPaM+aNF5F+W0dWrKinUe1VYcX27aYpc4fjJ+mXkW8tOJnXjmEkfMjR21KcM5EkDOD
	 5I3UmWPRaO+4vhVwI7qmFGlFsZXhX7PNQWUJdz19N622bFF4dkWK8selCoLaJjRDLOf5G
	 PA3YXfGiJ+MC6pEq4EvvvTRfBN90cQKP3nHwDUCJfebdvm5AMhcbgRMV/eX9BcAVzJUUN
	 KqE6WuOTU7gbWG9chreY38AmxtYafAocteDIUNo/kFyNZruD6MiYXm5MPInP6LtK6IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020548;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-META:X-MBO-RS-ID;
	bh=FxYdNqfpROYq392tPSh0yDReTEDRrw0x9MOLpsTOSGA=;
	b=tgPq4q/NCeZX1NoxT83gExjjjfs2hNeBAo1JDR1g0G8vjVf8WTCwNUjUKdYVJIqbQg3Z
	 Rrqgr9nhtcuDm2XTcvOIfeY19xSx81i6+ty4kmtPso44cACv0SmhSrOLv6AD1DyokEwkJ
	 NVrlqJw5DPwsyOYTDE+JwAJULvULS2M+2KxBQtVXTx0Sjtg2U2N0m4Sbx62mUPitzGAom
	 D5YP8eFO9+K5wBfX52dFWnK1S7/cJ7mB7tF0HxEf4ijzgiX9uzW/lPldIhVEp9woNH1Xy
	 xZhYxch+IWXC7k3qivEaKYOe2ceSylhDPlm4W7UIvk+oZNBIepne53XvPbC3U292Vrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Uz9kfLfZ;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C823606A327;
	Mon, 26 Oct 2026 13:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C823606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Uz9kfLfZ
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jCvJJ4tHVzKp6c;
	Mon, 26 Oct 2026 14:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793020544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxYdNqfpROYq392tPSh0yDReTEDRrw0x9MOLpsTOSGA=;
	b=Uz9kfLfZAKrqrthcp+DJL6mrV3Ax36bOlD47AFpjxDEDnFw47PCeuZzAAVXd8b6nd1YWx1
	pk6HkYfhCVpLbav4SRneCk4Sq+yNqG29nzEgCt+4akBoAfwnBIZiRunYV8cvRQSZvxn7pv
	nLWdFYRJGL8y00uEiVJvF5KiLlvshMNoXcR9/cebhBiZB4ZtYZtRPTrEERrobylN2N3+Dc
	dpJlMveXqSXqeKsTulmDjlmBpNPHhkMe3lo0Q3pKhkc6cdsKWCGI8QcI0Wu8G9wQizoOOe
	ON8knNH8Al0+dRfFLdzwBUYkfJPR/Ciq4VoAk6HbHmoeDiI96+Vu78fCQG1WTA==
Message-ID: <3bb84dda-7131-4ec5-8cf1-ea848db00930@mailbox.org>
Date: Mon, 26 Oct 2026 14:15:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026063942.3173469-1-den@valinux.co.jp>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20261026063942.3173469-1-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 7ra5n6gbduxnawghewztszp7wiukhrip
X-MBO-RS-ID: 8cc285441a8a79d7ba7

On 10/26/26 7:39 AM, Koichiro Den wrote:
> PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
> Complex (the default) or as an Endpoint. Add an overlay that disables
> the RC node and enables the EP node, to let it work in EP mode.

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

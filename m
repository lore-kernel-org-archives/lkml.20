Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717129;
	b=hYDpTxDRDXQDvuUO7oYb/Gfgkerr+nu0MqBNOYhWq5fYGENxBYJXA9H846o0PAdNC92P
	 hFP10rx7rec29AOXiwmcD0oEg7mHKQN2qFj2R4jj9lN5QB5h+mNbAxUVs9OAKIYugkEv8
	 8QHSCLgfZSjYQLeppqEO+T0Voc7tqFHLzOInkolbZM6F20xGQi/9DrE0qYwPRwiXV3tv/
	 T33l1ymtTNutQYi0qEo4MbdQQPats5pl8fkDJmdvwT+PLi+D7WONz4HsSKKk0VZlLf+vz
	 Ld1eYmaauHEUzQXhi62AsUssFfWr6nJfOkPMtW1uxN2MJgU6TAP4u2q6/ZptfviQ7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717129;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=IeqmoAQ51EHcxIMFfP3UNQnr/92BWPSa9cRe2REwg4M=;
	b=Q2kA8s2dIIO1fbRLybHnKZFEybtXm2x/V5Wtj0+lq/yb26yAGN9R6CTN2yX68f9Ww8mq
	 JziA4OLIJL1p8vKuzLPp1Ekt7jbZseDMwMuRJImtLtXJwZKcXkyG/VU1Xs5CaucregJaM
	 Ia6l98QgNbY0PAB2CEUubKd/UVaTpNnbJFpkklkbe7wMg5gijdyTJma3BT3Iu0vkG1uu7
	 o97B1zsIcqUSYghVM5046Xraqt0MtEeizwpGIK3ktQs0b363MbvEos0d2dX3dO6IQh6gY
	 XdAGNievS2OBn3ymcblov2Gal5j+L0E/qFXm/6VNH975TbnSzesT5HWfI0aLT/bUrpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=f0y4Npcz;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0F606A319;
	Fri, 23 Oct 2026 00:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D0F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=f0y4Npcz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j9l5C6fkSzKnf7;
	Fri, 23 Oct 2026 02:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792717119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IeqmoAQ51EHcxIMFfP3UNQnr/92BWPSa9cRe2REwg4M=;
	b=f0y4NpczSK1DUPiWDvYYzW1lnKHRUWfr8VzjC/CTA6fyq3M/OQ0ocuZNmw8qL6C5JVpREA
	5yZxB3Rh3Ubefmt393LqiWT9m43QXpVNfshy/MZZHYx/v8EfuZHCwDxmOzJyV2qT9pdrfB
	XWKHWvva4SJm7NUtbOs11b9WJ3M0mZWYTI+nNiWnF7QHPyKoOJM7Sz9m9fc9l0rRqciCAF
	HP0PfjYW38ZMl7xdWoxMqT4Zy5DoM1/CD313gu4kcKW36UBTj3JpoyUH+F3zdhQLC4MCBG
	zhKIEPbK1Rw0JZ+/JwvyRE/ZqnbO4vlkxPPCKXfkNT+6WNFrX70KPqUWhGgT+A==
Message-ID: <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
Date: Fri, 23 Oct 2026 02:58:38 +0200
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
Subject: Re: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022082113.3163666-1-den@valinux.co.jp>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20261022082113.3163666-1-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6822d88a6474b0c5ef2
X-MBO-RS-META: by4beyymrwqczrs1npa5h9r99dh6xaid

On 10/22/26 10:21 AM, Koichiro Den wrote:

Hello Den-san,

[...]

> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.

Is this header correct ?

Would it be possible to include a brief "example usage" comment in the 
header ? An example of such a comment is available in e.g. 
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso 
"Example usage:" . If this would be too complicated, then please ignore 
this request.

Thank you for your help !

-- 
Best regards,
Marek Vasut

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015006;
	b=4AdgxaHr2GNBV1b6AVFbTdPpFHaPpp2lkgC/3qsJsUeBMfhfHPX6Lv33glUAQkBuAqDB
	 /aeXrFjFHnqX1fAYlns16VYclkOcprQ3cZ8MuSjY2e4df9c1tjW0F4wDgIeyZlZLx6+9b
	 G3vSXbYkpp2byFJiMrmk7uHcSWS3t4xfjtWIWfi/5oIVZlqRjePo1xxEslidGVNGVvKvK
	 /nXn9oYMgDhIFldQr3zM20r0OFWb5NfdMbc85o02Mg0lP88GIr8yEKzbwQ3NbjLIc5V3w
	 UShNo2Q2L1gqzIwHr93fKpZ2DfSQCbWrsQ98yy8/xAs7OhU3GwunQtYCARXlO7c+b+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015006;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=TB6sn/UOQnuPOej6SF5d8mgi4GN0S1GI9A7uaPPzJd0=;
	b=0crfrTt2I0v96VtP4d6oRs4ESSlVPA4LVnIt/rqjvB89U9Gk9DjOPopokb7vNsJiguzQ
	 sKCgqfy16ZHvEwLK71vthfaX1YQHP9igWGZcKMTROPJRhO7FhrUa+NL2fN7KwZJz4BTs6
	 ou+YFnQGOwaz3VYQQB3TTYWx3m9W1z5XU4uP1qOdxYv1PYQXIb6DKwMpOnt68qfa7kiBM
	 OA0u5hRcHrbkpdOeD31WJmQ0OjhKX0ZhzxTSCPzSVtPXTm6z6RsIW1URsL50JxqpFKe92
	 IWECNuR6FxGBZftH2dEGsklbt0QsGVrIfWIjPmEsaXdksxrj/kff+Kua90KY3cyiNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZZxz8X7m;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479F606A31B;
	Mon, 26 Oct 2026 11:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5479F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZZxz8X7m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TB6sn/UOQnuPOej6SF5d8mgi4GN0S1GI9A7uaPPzJd0=; b=ZZxz8X7mWMciMHa4hyHB52VP/p
	c7Z2OE3CazrXaOpP3QXj4JYBeDF9Aj3nBpgoTPFqI8La/mnJUfTTO2m3pJ3nUukBWjOR5WBwZyK9A
	8nTkwpWzyHViZVhL7klpnuNq5ioBiyugDndsBriPlzPOWUBbMGw8NGM6CxZzDllbhA79EPPFawVt1
	OU3M/+S4n1pNyIZFCe+uxV5Hu5UHkeRy0Gv5k6D6N8Vm2ihWdBV7Y+DTIIqbFZPQ51W23byZEhVuf
	cDwrSKNSCI3sTvc6g4C9QOdX4J72++KS7Lnt+NlJr4KpPwZckGP5qtHCG2ASkK9tSNVrLI9nG530q
	kRCdbvGg==;
From: Heiko Stuebner <heiko@sntech.de>
To: krzk@kernel.org, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: HystericalDragons@proton.me, amadeus@jmu.edu.cn, conor+dt@kernel.org,
 devicetree@vger.kernel.org, hrushirajg23@gmail.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, liujianfeng1994@gmail.com,
 macromorgan@hotmail.com, michael.opdenacker@rootcommit.com, naoki@radxa.com,
 robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Mon, 26 Oct 2026 12:43:10 +0100
Message-ID: <5520293.6fTUFtlzNn@phil>
In-Reply-To: <20261026075915.203854-1-liujianfeng1994@gmail.com>
References:
 <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
 <20261026075915.203854-1-liujianfeng1994@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 26. Oktober 2026, 08:59:14 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Jianfeng Liu:
> Hi Krzysztof,
>=20
> On 2026-10-26  7:08 UTC, Krzysztof Kozlowski wrote:
> >> The ArmSoM Sige7s is an RK3588S-based single-board computer which
> >> shares its hardware design with the CoolPi 4B.
> >
> >How different devices from different vendors can share design?
> >
> >
> >What is exactly is shared and how did you verify that?
>=20
> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
> hardware design from CoolPi and confirmed that no hardware design
> modifications were made for the Sige7s.
>=20
> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
> than being independently designed.

if it's the completely same board, just with a different print on
the board, why does it need an empty devicetree. When it's completely
unchanged, what's speaking against just re-using the original one?


Heiko



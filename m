Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662883;
	b=YcX9GCvtzUOlRqNwG/LkJ+NgnXt4uf3gHh7NmUdWq2JKweJTifu2sPNVWd8k11lZNUiC
	 nJb1Xj4tySawNxbrNA4lfF8YS8D8jsiVDWGI8BGLKUtlf/tLrL+BAbTgc+gfeOH5LtkWm
	 gix9WaclHVvaEueCOfokrl/AlS/8pfVbFz91FvU3f4KLfIt1JsIMc8ajeUNcVNcrhL3p4
	 Ir7Pl8XYNAz0UTQkPipq3PTM4k5gXXo2HcsDmz92fcUyB3yEvQh+kkvJQynhnSCnX2/i5
	 H58oB7lNSyomSP7PPM+GcMvkAFihHZa6tFoQSCSglCo5kznnJqtXiDyy3ye/X60dJLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:
	 In-Reply-To:References;
	bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
	b=xYrcH52mMpDtPenWpXtWeECOCEax6Mx734ykFg5t2p98O32wEyWexSpyBrnvKlAAMepe
	 fAxWia+mxudLHLLsaIAmMGZ+dVU6+iJyYF3lUZDl6cljAcq1MzPaK2x/FEQ/RcdoEae+P
	 tOAppKCgIURc7VANjhJcDKjkH1gsQecvJViZerb1JDNgDalB5WA82q9qQN2vWs71nkHaF
	 8uNe5DgGITewHM0Rx0xgD4jblIa3Igq74fyZL4h/tkzN8vLSqPjasNx/hVbj13sxY5aZn
	 1D+y3I8lBh2jIbwpnWQ/kzHi7dvGUZRzUR+Yg0ck++i+KpcE38wJDJBzKtz9AF0cmIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U;
	arc=none smtp.remote-ip=91.218.175.73
Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92588606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92588606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794662879; v=1; x=1795267679;
 b=wBAQqr1UDyU3stJVqU9DxG5eszmFIcq3qH+qxe9rHQHOh5WReHXL0sIEpiKTocxXHc/h852W
 Lv3v8ViWLsm8tfk8hsFZHv4fR78V47Jh8u7Es8iS50eMsSSsv83DbT+K8PeMZoV4iX9kMV5i5bk
 mE0u9rxlrzjmKBPSHY2Lj8Pw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8b8a5b5b05980967;
	Sat, 14 Nov 2026 13:27:59 +0000
X-Mizu-Trace-ID: 8b8a5b5b05980967
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 13:27:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <4427785e421caa5ceba5b64ceb7c7e4cfdb607ec@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v20 00/15] net: pcs: Introduce support for
 fwnode PCS
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>

Am 14. November 2026 um 11:43 schrieb "Christian Marangi":
>=20
>=20This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
>=20
>=20At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
Hi Christian

Thank you very much for taking care of this!

sorry for html mail (have not found setting to force to text in
linux.dev webmailer - if someone knows it please tell me).

@netdev maintainers:
is this now in shape enough to getting merged? or which part needs to be =
changed?

Some boards (e.g. mt7988a based) are stalled because not having network s=
upport
yet in last 2 LTS kernels due to this part is unclear/missing.

regards Frank

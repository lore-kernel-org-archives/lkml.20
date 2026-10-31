Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793454352;
	b=a31g4GT0B8LFj2ozR4r4n/lsCmL1Sy/PkaIvgkX4bLC1KSURi3ykqdtaKgoE3RSKogP4
	 7TpzoPVkp1m9br7d5UidV8glOG96ZKH1FJOd28qRS88p9xVW0zmDQq7avlQk3LtiyC+DU
	 pjEIqq2X8BO/7pCCf42v9VwRc0zbXxYXslFGDSQbnDZjXMiZtcCq/ErkzqmC0pdiAeLm4
	 sCUL5RBcz+Qf/vodawldxP06QGbtgUYhBZUSwG92W/P1t4w3iOtaF5/HZasowBJBp6h1E
	 aAo+hrJQnEIklHjUoC256CcfkDmN9zMsjeCC7Ux9nlTnBAXYqplNmuNRWAt8r77PiHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454352;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=;
	b=tCSY/HE0YMqtrKZZ5ZadvPZlupZP3FtkOn9vx9tW6xgGVJxkEoVvkWv+dJpAB/jyyOZO
	 awuB++o9vJEN6dZY3hdqoWAcCQVX3ynQSLxD4T2NXZIWy488xG7/1909H9OiyfoULLwaY
	 WzZv02QiB3Ple/B+FKI/uArxtSXK07JVZ2BlH6QY5mJMFHeRcGmyUiEYlZVhHnrNOYuFY
	 Fn3nAwD12DCjSeUcgFtgJ0yZh4WtLrL6LAP05JOi7klFbV0CzdWIS7IT2CeiWWznvAf4e
	 dbSrNF9G82wt9cWgHD/ovKVLapwRdRidt5kBXCTvwMUj7lV+mqEKsZbf2rRBN8zv5XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jzAu9FRJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83475606A31A;
	Sat, 31 Oct 2026 13:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83475606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jzAu9FRJ
ARC-Seal: i=1; a=rsa-sha256; t=1793454313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/xD/GnjIT4Rf3g3eJLjZfk3+Qsa80d2N2y7utHj6RLU3orDPYbpqk0pR7Ywl8RAqUXhJD2PjfB4Mtu1RWr5pkSCkSQ1hc6J4ztFZmAVpvi+ToTASlpEZ/+GJu1WP4RoFEiz6Vrqk/ZKaEmiZNx3zUD83FbLYgzYrH7yQfhbP4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793454313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=; 
	b=WAD9taRwR+ehdUcZuwyq1fHrzlSOTc/eYpAMznpjbfEud4VaX1IA9Zt/4+GBp2H3xHGaTUwT9wF72eKqVhFbowKaxL+WEN3G8bxi+j9rA8JHrbi3B5lXVkyC6pmki18zML6qzbsWUAQ0M1n72S9qUUbY00loeCAWO2fNG6rGIy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jzAu9FRJBaNSJ3AHilw2eWXauQJuC0SSmJh121wg9/CuUKZwl6srQeaaMXIDHfyzNyXmOCkbtSyKyJUSqJfDGHCGOHoBrlEzej4Q1/Ow3g6ZoFAt93aQdii1H8++3yJTzyjthijpIhccsjlCAb8N0K5iRvlMgdCYyVNauKzrbnA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1793454311209756.6514837174597; Sat, 31 Oct 2026 06:45:11 -0700 (PDT)
Date: Sat, 31 Oct 2026 09:45:11 -0400
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <zhentao.guo@amlogic.com>
Cc: <wbieganski@baylibre.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <1a192350728.896283f8650321.6916105559730663215@collabora.com>
In-Reply-To: <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com> <179337024629.131241.9227206619077693683.b4-reply@b4> <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com> <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


Hi Zhentao,

---- Le sam., 31 oct. 2026 00:51:29 -0400 zhentao.guo@amlogic.com a =C3=A9c=
rit ----

> > That reminded me, is that firmware in linux-firmware?
> This firmware is currently not in the repo of linux firmware. Should we
> merge the driver first, and then submit the blob to the firmware repo?



Thus far, we have always required the firmwares to land first, unless a str=
ong justification or valid alternative was proposed.


Nicolas

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916570;
	b=ThpVnCnndn4w+Z2UAzZtHjjqpkFHArIqOCwISmaA3JKdoDZ8RhGZu9e4gjVBTaMEVHhA
	 g18dFbFNvhBptJsO2gvH9ij0pwlRbpCF4pQK1jeN1i2AqSE2LDS5GUO5XsuviKmipPK0K
	 qNqZkEMW3f7W4Xn6KYgnSt7vDM+sSfviepmtLHoPYJiLroBIBhUpHnoYPJfqL/LyT78YX
	 xdanU3aGElGa4DJiR1GXesP0vbAXQMyAN4JfrA+LwUmvbbrT9I2V/GGJ+YebUI80TDZu7
	 iidq9VPW3HXkNubGeBYwyMcCBW42sjXjozmzYBJVquVgAu6EtP8crPe65tED3rp8l6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916570;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7gp/tEK1h0CZZzF3joRMwW+MfGEJpki8fHwQoqeeKfw=;
	b=C7OwFqLC8+b4nyRC9eIfUXEy/XV7nIihR89+X2okl60ejYY0QCrPeK5qdvNlL5RXrJ4g
	 iSUmcaLojnzQ3sOE2qWfFjFwZMSYDf8lcy4wVgw7joVCAyaRxq9IhyywFjNEZx+DrIyAa
	 zu8iutfbK9u40Ur7LKwQQYb66n6qI5+6I3jlGhjxU8RA6qZVk76bFn0v//+fT6aqi+rHW
	 Xu2MAJ9TH/Cde1SF7xjiveGUItdi+B4Jo3JqhMfIcNbpYALv3LHp5G4XUFhP/jOlPaXzf
	 iFll8D3cBZkZ0axuDMh0hZ6dXH6uuJEm0md4lpC5renqaRsAP4AFhd0J/+ZRWA//FrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b="O7F/AtX3";
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0251606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0251606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=O7F/AtX3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794916562; x=1795175762;
	bh=7gp/tEK1h0CZZzF3joRMwW+MfGEJpki8fHwQoqeeKfw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O7F/AtX3l6DPqkI6RguZwNBMfZ8Q78/wqNX5ZpMBIWtPvvD1yed4ILge4ywzG8cPI
	 Lf+lgC64qGvbsf43OvQtAvHvhZsXNTIpYuxklutzWVBR2ckmfbetl/CxYxBeIG870Q
	 kRC/0tii1TIGYeprV3n9wmpYakL+gAb1X2to14AQD5dDrDZJCvoXwUptSno4qcWUDK
	 D3Nj91gHZtEceflE6OFXJxEN3d6M5/Q1Bm5VGKMg4Yq7dUQFRUW7NEsEPn8Yb1djRR
	 BJqc3Hyf0V8h9QaRmeAsaCSgZRxWsB4vb6Vm8IOnL7zusjkjV7bUpKGu/K3jims+7S
	 HwHvoHiSamLAQ==
Date: Tue, 17 Nov 2026 11:55:52 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: Initial support for MediaTek MT8163 SoC
Message-ID: <20261117115545.1983774d@ben-desktop>
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 638059f9793bf86f61db029f1075fb5536fbc904
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Thu, 05 Nov 2026 14:28:45 +0000
"Ben Grisdale via B4 Relay" <devnull+bengris32.protonmail.ch@kernel.org> wr=
ote:

> This series adds basic support for the MediaTek MT8163 SoC.
>=20
> The MT8163 is a 64-bit SoC featuring four ARM Cortex-A53 cores,
> typically found in entry-level tablets and smart displays, such as
> the Amazon Echo and Fire HD devices.

Gentle ping on this patch series, v2 has been sitting for a bit so I
would appreciate your review on them when you have time :)

Best Regards,
Ben Grisdale


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688307;
	b=N+j4Qr5M8V8uiFn0uiYkiNV6v2Qv+IyvUBtAJY94ez4f092VNtBuopkkz3gDZ6MegJxn
	 wkK1t8oWOU0OiiSZKdwaiDaYjbuNTQxGaSzLMWaJoyaRQgkcMVyIndVHW5pVsemkha/E3
	 YQdH0jbDkwHTHEjQLBwvduWwEIBf86/QnnxBnVD+LAbRECVY/UmFAZhHy9uS85ZhwLgTu
	 AqHG80cPn8XanLIL8dpbCQieF5JPIf/GiMnTJqECrsVS1r4un8er4tMU3YMFL/YNlOVeG
	 vvfBA8tmwIbxKNrea1qgMycdY/b9k8ebokAEW3l+OpY51iCXX/GKyRtBFZUIb4o5Q9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688307;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lW8Xt0YJtAlPG22lX4O67YHeXeu7KYiXU4EfIgJSL9o=;
	b=0lmAJon++X5US4nlsS3Qb4S3cQMGDzAIGDJLR2V9A2lky2b0OeYxtkhJ2Blj/DBsPH99
	 309zoW74my93tdCkaxXG859EPulx6QaxoX/g7kOk3kJ5DTyzzyGssvNG8q9YFMFZg+69y
	 6NqQ0ifiPFf1GexC5OBqMwLFDew7R8Ui1HP2y5H06Ga+DxEyNsY/qyxQHHF5dBNRelRXZ
	 Fts0lDN9+Ih7JqwI0vhLqEvx+F9HDDdwIMMn5mj/UpIR2eKYIy69DGJbSmzfj9YnBFJXa
	 Cc3rm09pgR7h1hpGdb+ltAamfDJCBSRuTphpKOPm6BEltN3Fvyc1CwW3gxd8SI2cpVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DZ9qUTSe;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414C606A319;
	Thu, 22 Oct 2026 16:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9414C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DZ9qUTSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lW8Xt0YJtAlPG22lX4O67YHeXeu7KYiXU4EfIgJSL9o=; b=DZ9qUTSeEEseQv/aDXthShbwS2
	DxN0zVjdwjrHbfGwSEJfQmo0ulGFDy4tea/8sHwWaYw5HssITuNYq8q9EcgbKc2eH4Fq/dFKXOtYz
	9QSp+ueNkHrySluyEuw2POGQuJpyOEjGv+jJH+yEL0XJtSKpigzet+6JJ4PGaTmdtghk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJw7K-00CIVE-Az; Thu, 22 Oct 2026 18:58:14 +0200
Date: Thu, 22 Oct 2026 18:58:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Message-ID: <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
References: <20261022025844.150320-1-coiaprant@gmail.com>
 <20261022025844.150320-4-coiaprant@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022025844.150320-4-coiaprant@gmail.com>

> +	sgmii_phy: ethernet-phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x3>;
> +		max-speed = <1000>;

Pointless. SGMII cannot do faster, so there is no need to limit it.

	Andrew

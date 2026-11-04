Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798639;
	b=xlvS3mOYqpCFXbtBvKvmoFO5FJsw7+oJOKpA9NW+bp5LNTzl8Ya58Y57AQ0ZYQBZZ8T4
	 NNm7iMt0so33hTjdc0WNtGKjoPO98dw4JDxCghNdzAtYmLcoUlaNmauQp6dpSCFvaNFN2
	 e6LXtc5L0G45igDSsIezVx/sunPlEcEQwpmXuDwcPSmWtDChurqcdtT2OvXPFBbJ1jUlp
	 jq7T8WovOAiJLT0FC+uUf41p6Lm8rASXmUoe3DFI+DRzPNEJl3XydK6MljicUcOO9KOgw
	 CWKlEtyGM5HXr7RDoBh5r1uoMMLoOej0SU0FuaaKd3w+VQ6QqT5+/dFF+c1+xbp9yTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798639;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9kKsClYkSV6j9g4wIu2ceDVjMDKxVBDVIFPSvVyISHM=;
	b=WmrO/+osg3wYOX/ZaaDnooyu6MQBS2A9qGoVi/6FoFwMDgd+WlgU/j45Ti/pX0cexbBU
	 iX7s1xfhi84rnbNT+PsCf4ZfXDX/uc2C+TqzNppx4G+68edx7xZY2qaqSRfPxtkiQnNMY
	 Y9jthbZfBl9ZF1SMfJmN81TK6f1iucQdKv6cSeVK7/d5qtKegJbZth9k6npwByQ90Cp9Y
	 X2ExYIWn305K7xwzYCqDrUYwZ3axWLABHFusSpwimfNP4FAXzzrSUI+SCoOXc0vWroPS3
	 sQT8Y3DugTEtalTkLsCt+oW5G5BibYKx9JM4oBMyft9Zsc6MZxOv+QtEDe92rQ7PObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAI45QX4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13D606A32D;
	Wed,  4 Nov 2026 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAI45QX4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD91F00A02;
	Wed,  4 Nov 2026 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798639;
	bh=9kKsClYkSV6j9g4wIu2ceDVjMDKxVBDVIFPSvVyISHM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FAI45QX4yCfOOm/wPruuAr++bgb8HAkJ5XDV/XFVrjxggayyF9jCmSkDXpzsT5Ikv
	 LUXwf7ItSagQ0+U3IiOObWdM/v76gs7DlCunMAsbevBQHsCBiQI2TBDlSlzaHEWest
	 avJ611T5ZbhiiZmnFsZtLS+5ZPwB9eQk30fciZXr62b7r8R7ZDTyHw/+IRxze3JpC+
	 iCGVU/kGAuc1eJSprdmMIHEBsWF83CpVojGADG8KihY8qtvQFBhHpWgdvf0FQTrMVa
	 KkKopNTo0PRfCkqP8XQLbG4mEDlnWy56iy0kn5jRGiUVxN+FB/XfxcULbr9/r8CfKZ
	 tfQ8TQZyjAfJQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 988BA260DFAE;
	Wed, 04 Nov 2026 13:23:56 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
From: Mark Brown <broonie@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
 <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:23:55 +0000
Message-Id: <179379863543.2456854.16005010652989263089.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=468; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZthENp19pWMGxtxJS1cIyBw7fS2qfEp0vkEsABCxp44=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeG76Z1fC86Wbuw4jcxTePHj635XHbFN6nF/yczjo03
 2F4OHVhb0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmwvmQkWGLvBRn1JTepq6P
 ZhOOv3q6eqfEnkvnvO/cN2kyXJi7p+MuI8My2T1hpf5evWv+zr18srK2PJH365EYo1WXlkgfO+2
 sepsdAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
> power rail which has to be enabled before any I2C register access is
> attempted. Use devm_regulator_get() to obtain the vcc supply and enable
> it at the start of probe.

> +	ret = regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");

Nothing ever undoes this enable.

-- 
Mark Brown <broonie@kernel.org>

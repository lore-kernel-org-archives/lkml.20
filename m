Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D748AE38;
	Fri,  2 Oct 2026 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943088; cv=none; b=beVLGlSxBPGoTbgC+wEG2FKcgqBT1VaqHpQVN75/xMR0DP36lRTGhC68PffcCH1lgWG/uvAs5Btq7LUKPVF9e0bTccp8EIlLJxJ04dBTbDxgJu5YEYG5EY+7Xu51RJX28upKUEtDj6BFl4HtmDsA2H6OL4vfgWu8YftJm35iqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943088; c=relaxed/simple;
	bh=8CnajTHphcRsdN+e8Lh2LyXxaI5nDMwzYzdgaHTQuPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xh9FPh/MnlsGyQW31GG9PJNRiXBKVfJm+h5/wLXHrri/JgoAWk+cNcDNDH9q5YqelDWxRxh6wFEkS6sWoLm/lgJIfsPCuCnoTsAiQ40g1F+oTfJ7bUkqMQlRxdnHlNFWGDGJYivGyZyQOxU0DUhLQ2NQiJZ8cpBb6BDfUCYHjfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l631GVZ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l631GVZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BA61F000FF;
	Fri,  2 Oct 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790943082;
	bh=o6ui0oKiBzMJAfrel2TETxSHkOkfuhba4E2DdyPd0JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l631GVZ1ztfRmr4G8mB3u2Jx+JaP51Ayb5DBVhqOzL5ySZrQnXP9q7k3HdbgsiL7w
	 xpFwDGQtrN6cnA+AI0j3JEFHLDgCXqh+C+23kqTk8yp1UWTaKpmzitIF7/zI2Ugaf2
	 4Ge54jpmP0gb11ZvRmmxGJg+5bk9WJgdbw7ODePEfO/1TJ49/tzF/kTxr4579BFbHh
	 k9rTdgefjeRnT8FGWgSj3+a4TqrX2q7HkYOa9GVkVV6YSnv8Lu8mRASdv9PcD4lai9
	 geUPYqc5o7V01Ty82sP9TLy48DDVEoHRBsFE2zq+SOUBj+mLUH8aqftKdY/AWI+Tv8
	 hiyIalE98MX1w==
From: Dinh Nguyen <dinguyen@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: (subset) [PATCH v3 0/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri,  2 Oct 2026 07:07:30 -0500
Message-ID: <179094255902.2465190.3935715503708403145.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 12:15:35 +0800, Adrian Ng Ho Yin wrote:
> The Agilex5 SoCDK supports an optional debug daughter card that requires
> a dedicated device tree variant due to differences in peripheral
> connectivity compared to the standard SoCDK configuration.
> 
> When the debug daughter card is fitted:
>   - gpio0 is unrouted and remains disabled; HPS LED is on gpio1 (portb)
>   - gmac2 is replaced by gmac0 for Ethernet connectivity
>   - spi0 is connected to a Microchip 25AA128 16 KByte SPI EEPROM
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: agilex5: add support for debug daughter card
      commit: 01711d9d08123ba6766b44aeaed3954e068f6fce

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>

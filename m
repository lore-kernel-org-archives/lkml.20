Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF041F5E6;
	Sat, 10 Oct 2026 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630875; cv=none; b=bTAyo7GRF10xv03Cvc6ku3804IC/EhexWYUZxc0fjt/E1mOqsFOmcCQiMIqAcLatFgk12A4I8XbcytKzi6CPBom6gvHvuPsF3CkmnU13sX0ud2PDNDy9iPTOiy6DHAhIpUZ64GXgj5aCTIO45SM6gb78DKg+MnfRRplAGrv85iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630875; c=relaxed/simple;
	bh=PMKFO8O9EPvAmTDE0ZDFaz/3SyCndAd/kG1QNXNpqKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/qc7pOQZbfTJVhaovwdCvpQxt5Ub6DYYcz0BIlN9GQiWrlVBmgdGWKvxWqMDKodKN2T1dWQlWLWmDvX7AzYhGqhccF0dF9gjRY0bvpq9qOrHIciUKG3y4f1Kv7uNgUL7ZTH5fNL4pwyjlq0MtvDzlNYpoZSrvQ9SpXO5qXk+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eHpJ7Nei; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eHpJ7Nei"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ksxmdb4yA1kWZOUC249F66a5/hkdvLmy1j/hlKj2+08=; b=eHpJ7Neiep8sLffC/RolmkM650
	NifNLXRHCMbuWXxfrWJhg1p8V46EVUXMonAw0caFg2iUQTwJq91AmfPIVfNMGKKT6JFCXs8odTH2z
	Y9HcG/z0pGSHqUN/MDgiER0MvhWOg5z1bFWZXStpblSwC8VWBFFwpsUrhKj5O5GrZgxuaq/MoDodu
	6HPfuYiqPcHUWo5bogIGOedwnUWfKE0trBMu0UaSVGAZ0Gk6bxGdTSQLTaoviX8eksi7RpYy6ue0O
	+fWdEBTVl+rSOwpqm/MMzT4PPWKakeczs4sYFTNmDR1hDKQeQqDf8t16m/GRikGVkfwpI+0cKDLov
	F9Y1FGpw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64
Date: Sat, 10 Oct 2026 13:14:10 +0200
Message-ID: <179163084342.3536058.13031584006257921159.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006-helios64-fan-tach-v1-1-1c87e72d42b2@iav.lv>
References: <20261006-helios64-fan-tach-v1-1-1c87e72d42b2@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Oct 2026 07:48:58 +0300, Igor Velkov wrote:
> The tachometer outputs of both fan connectors reach the SoC through
> open-drain buffers, on GPIO4_C5 for P7 and GPIO4_C7 for P6, but the fan
> nodes do not describe them. pwm-fan therefore registers no fan1_input.
> 
> Describe each line as the fan's interrupt. The board pulls both lines
> up, so configure the pins without internal bias.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64
      commit: fc411363b8231315e5260662bac5223636321983

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

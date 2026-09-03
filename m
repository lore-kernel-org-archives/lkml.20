Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC594FC8EC;
	Thu,  3 Sep 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456067; cv=none; b=IFZahskv8e0RUkQUFSwApXam/ZEcXyooP+jQpyca1w5r0gOqriWVQHTXkfiFi+KeJ5UhuwYoOGaCqTv/Dw7HSot9BFbIQLzu2Cm/tB7GtipzkY8LxrSnOTW+HflnNkI8GcoK9Z3xoAn2qBUFqmuW2CQe06711MSEQhYF8fvU6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456067; c=relaxed/simple;
	bh=X7kaNJwpg0PqYsmUaoEMLMVVv5vWfkyL5FAMgwIaa9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKCxVNag9EtH9vazh7WP5tHQjPrj1U7+5mjyvITWSobUXke/+qUftbQzhT5DiFuUsisOOROS9FQMP9+hlTzlfHBV6oBTiCpKoD69c7mdXTRmgLIeFmkYjPX/SGsqcylnLiWF8hOIdlKWyo2ePiM8wkpyUHwM6v5v1dWL6k9qtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhNGnFNK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhNGnFNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F6D1F00A3E;
	Thu,  3 Sep 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456065;
	bh=kyTaYmLuCLAQEEmr077mrhIVOGTumtoSrSPeJjIGhXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WhNGnFNKfSjwMnEUfXLSlxB14ux7JwtbyYLBTv0TO4ACN6s9AFuwecFLWGWazbsL5
	 ER/I4eJeBfWwR7h8HOEHdR0DFeST8LeUCJJSXZ545hAQSM6LkgBmHxaWF0BsoncaB/
	 7EZtY36CsATeq22jAVRFiWzkoXuPNxFoQKCwXTMotvB8H1A/NCVXvENhICHu0cdHcH
	 MpNdHfdsN0pw/iqceoO7pBZwMRq2lXsKH1jPxy4BImniKNuxgE1RIRkOFMA69QIIAu
	 n2J29wvatU2n2iSJ08zEC8TK2nmZ94x8k1beH/yOgbJ6W0SOtmZK5Dasa6qHteQzqD
	 z+pe43xQZwlIw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
Date: Thu,  3 Sep 2026 12:20:37 -0500
Message-ID: <178845603565.348193.12611424083377253410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
References: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 18:19:06 +0800, Xilin Wu wrote:
> The SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Add more thermal zones
      commit: e47310db5e7aa53b2a135a86db7cdc308d9af542

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

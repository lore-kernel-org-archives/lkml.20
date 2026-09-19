Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E323515DC;
	Sat, 19 Sep 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800254; cv=none; b=cVp8MvkGQOzlYFs8ijFI4gSjnvFwIu3CxbCkyMifZMLDxPSIGNRliLr8p0Hh0F/iWGG2uoFx4VBKFG7RIUvZfuZL5V4kzl3yLfMbXRqJ3M9bRRm97lWADDrcicRs3Q/dJZj/JVzwkLSvVKVy9Zhc2iiRsnQqgGZxv1efG/tGqu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800254; c=relaxed/simple;
	bh=kzWlhq6aWfd9oDg2LTAb4c2EL0HbfsFoU4R6jrFQY5A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WdtgS/I7/yDoePoQToJWdqOq46ICDM5ichA1pPS7DMXadWcKXShOhF6gptKR/cDOmFmG1VJPc5Y1OBzqexAF7viCBGbzkHwUdPKWAk3OWGsZweY/dvxJJWWSxp9PggkTwDkMfaWaEdGXk4b4drrosEPeb/U7NzKAgaF2jpIvKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2OWPAm4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2OWPAm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587851F000FF;
	Sat, 19 Sep 2026 06:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800253;
	bh=+NF44E/ilbxIzqmKrtLGcEZ0p7032A0tuueyzi7LgW4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=F2OWPAm4S19tf979eebZVGTq7EE+qd4tehDuhg5UhhViEufXnaNjnAsfiNNtqRNcz
	 YpUD2TiYqB5JwSlBAYlUT1LAZ8Ojh2PFy1D/nocPvj9MpgrKgwGS2JEYkxM/XZh47j
	 N+hf/OSKiAkFahlpfQY+rv7si2ljQKlrv15eXz8LKk1DsJQ6NuuaqHbh3sV/MOVU6J
	 Hq4BcFQt/bDb5aflAdXlNRHjS4vAPtZoPIBsFotnkqSvSqwmlsIOqME6UV8f/akoO1
	 5wGWYbshDDB1c9HmF3vHh3rYoiw7oQKYcpCyIkHSbqupgrm8V+aVkx8hpr+c7997XM
	 ppX5If+CJGisA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Replace spaces indentation with tabs
Message-Id: <178980024987.89886.1304993290857665882.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 29 Aug 2026 21:40:55 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: aspeed: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/5b21342479d303b98796ee50a50642843318e92f

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A53340282;
	Sat, 19 Sep 2026 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800248; cv=none; b=pR/UmeVQmHE4CcGzn27VqtubC2UT+BgMQekBOdeqm8ewqYtLtLPauRV5AVuEdKuTokAgb/7tLM/Mq7MDjhFCqNp2mwlwm6APa7Pr6px1kY9tr+K4b1gP9GyOVj8VTNdv17beP26/gOwfZTK7t2bJOXlbreXtZMw8kaZXemAB4wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800248; c=relaxed/simple;
	bh=K2jkx6MPfKJWMB2cl7/gsETU744qEbHHHIUvy73OrIY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HfKQH2LdfkkIYHUciSfc75X0tbAs0aVF/nZnzz0PkzgC1NumcIPfAAZt0pFu9Gj4fsyl4dp2KHNkCGslU2B1bX6W0yUx/yyVjlWCE+rhnXnP5CAwRyxhVSnixgv85QScLtwfI813nPsb+ADvF32ehYF4gRlGlHEjekUN7exkGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOwR4GLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOwR4GLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D751F000FF;
	Sat, 19 Sep 2026 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800246;
	bh=yIHY6mudo00cz0p3T/VlOqrX0X27ow/4zpk1QNBTOCw=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cOwR4GLEQlCxqtaISMmd/sURGaZE+EpbIV1zPB2BMp+X0KaRlm8Mt9mtkru86Yy6B
	 znkFE5DCae4WECtnFVVWMbCJzrEoAaLVsJzGBKYHEiqBdv680uvB+DbIlRYtYr5AET
	 cxPdIOO/3MNNdMAxnAIx7wpo7FlVFoe0vFSqZ7aAMqJEeoHi3JD1u1J2jlBV+bxI8a
	 IvuvHIM1d1yYDsy3QnFR/1np4Y+ubwCXS44OrVlFYZskXA5PH2+iBcqRBUo/G9k0L1
	 dII0AQ1QM2koTJNLlC9mc570it/A0Q5h1L2w0ceXeQyKhbnMV/tfALcNLRyGGQ5a0I
	 6UVfvgtAsLXRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces
 indentation with tabs
Message-Id: <178980024256.89886.4198786322177939827.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 29 Aug 2026 21:41:41 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/2] ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/b1b254357cdacb95d485e5b0604ef2be33f85ce1
[2/2] arm64: dts: actions: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/7445370b89363abb302d4e03af6fa2b599c3ae82

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


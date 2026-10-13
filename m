Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323D3EC2E3;
	Tue, 13 Oct 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900457; cv=none; b=rs17jp+SNgftGGuB1GBXsxz4YYey/twWeayHbtEAKFKy7BM00Z2fGa1gSwKILfQlPOstSVAIVoj0BVMqVuXEXSW0N81dNIXlcYMtf9+rjLma+L+T4tk3kCipFyKmaNIxDeMtMC9pY06irTHq1jc+ogoMxhEkxVpjJ1Q+KLdS8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900457; c=relaxed/simple;
	bh=TFjST6qOQp71YbhkVt/zU2XIY0PuiwgTGy9fYd8o6UE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=en8Y9rUpmJOSOCibGE0YMvs2wjgVvLCW4Z3vwOjvbOvPcz82u8FsEQ8dK48cnZ4f2Km49bcJRLwXfPIb8+mfvHxcVte73h+Mj30nFNZfUcJLzDC7UdzULGk0W+Mr4EDjA4iLRujSSoavi7/A35arirQnvE8L4Hfc98VS+j5d400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JydkQP68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JydkQP68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B32A1F000FF;
	Tue, 13 Oct 2026 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900455;
	bh=1mmQxqe2eOiDfxMlH7DwP9Y+43S/EZrHqcAdhn++fUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JydkQP68j++uBfAoGwcB3Ba8Qy/WqLIdKslceKRqp+Y79zTsfL5tJ+asxsG6nfQ2b
	 YUgBzEMAJLxRyXPyACx609e2Bu7ECI65qpfSVrEsUFh2AEx17EEnUcGdbMn8tgPA7E
	 HxyVaNlZPVHrdCJYhzSF/mIo/XQ92PUyigR+bcpN1eCsWvT7pKDwavzTi6VfYOgiHx
	 ZsbKnMZHdZl5K8oyUtfiV3aSj+QAhI7KQRPMDYikbW/f7QxWvpCTOw1UFkPwbAHUuL
	 /28dVi6A0/aKGi/RBlBfQAFdrFx9bGtqmu9+S4jLLZbelt46p+7U9bLnjBFRkCvJ5u
	 rh9UMw+noquDg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Renner Berthing <kernel@esmil.dk>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921232639.3132083-1-robh@kernel.org>
References: <20260921232639.3132083-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: ti,tps65086: Make
 regulators optional
Message-Id: <179190045401.3946554.16358556662900390646.b4-ty@b4>
Date: Tue, 13 Oct 2026 15:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 21 Sep 2026 18:26:38 -0500, Rob Herring (Arm) wrote:
> The TPS65086 MFD driver adds the regulator child device
> unconditionally, and the regulator driver registers the regulators
> from the parent node even when there is no regulators child node
> containing init data.
> 
> Do not require the regulators container in the binding. Existing
> ZynqMP boards that only describe the PMIC core and GPIO function are
> valid without regulator init data.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: ti,tps65086: Make regulators optional
      commit: b783c46fb685a38d1f5cde57f59e5ed520846ed7

--
Lee Jones [李琼斯]


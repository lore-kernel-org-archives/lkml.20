Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F713B27D8;
	Thu,  1 Oct 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854975; cv=none; b=PxBiCC/+JGIioiMbzYUX3734By5+/j5QboaCNnHEW++ILL0yvhkyVC0zvT5xmNEjDDiXxUKFPq3E8lK8kBRnUCm6ezdf3qUvI+aPZHjl7XTWXB+3TmFBpp9GziwSv3iXHilIt1H7wEenpCdaWD5pPyRocCayPuSsZQ66tnz4n6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854975; c=relaxed/simple;
	bh=/ZEMQHkWmcKgXb9n9tm3zJMbwbpKg2VRquvky9560/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jo7KLBV5HrSUBp4TZwaCW85+/NM3dQ2U6VBifF+t11PcjRpVXFuHV8wVLooWPcGJFQMEKOtIn5PTqaIB+E7izzc5IP1q01ttVSV1SJMxT41IxAZDZ0b4ZACtxZbI9KIinhnTvxROhjs2bUXSaO2scoHopbArgVwdtisGgUTI1VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7bGx+9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7bGx+9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EED1F00898;
	Thu,  1 Oct 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854974;
	bh=ezo9AABzihn8v9w+EzLT2Oqew0alnRrS/G6JzrXB5K0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z7bGx+9YjwQE9mmx5xOfDrWwbuyPcSv80D+JAIMF/rbGp+AAKEwfzI+EPb7nQsdJK
	 pK0KmwY+OHTVp2I1huCwyQFIXyUXy3IbfwBL6c/P089Bn46pBhVyEYJ5Gfcu1jV1Tp
	 Vj0QjTMV7Nwb8S6ea+60PhwGOA1LattBvoasIP7H7WZ13C1P/lk2Ydbhk5jyPA/yzM
	 uttRxmd8TJSFcv9+pQhG+RZrCrHq51nRqfqnuyefDqHLe4qN+xucigLvVBd05DwTRW
	 e2pjwmZJgo089MtmhNI+1kqpYx5e3KGU28SBQWzwq9A6Beg3t/x2///mazUmVJV+Kj
	 aE03LVf3B+8ag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Ridham Khurana <khurana.ridham222@gmail.com>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
 Brigham Campbell <me@brighamcampbell.com>, 
 linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20260921204204.797294-1-khurana.ridham222@gmail.com>
References: <20260921204204.797294-1-khurana.ridham222@gmail.com>
Subject: Re: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing
 MODULE_DEVICE_TABLE()
Message-Id: <179085497050.480978.17953690152528059792.b4-ty@b4>
Date: Thu, 01 Oct 2026 13:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 21 Sep 2026 20:41:47 +0000, Ridham Khurana wrote:
> The driver wires of_omnia_mcu_match into the i2c_driver's
> .of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
> module alias is generated and the module is not autoloaded when the MCU
> is probed from the device tree.
> 
> Found by code inspection. Not tested on the hardware itself; with the
> module built, the alias lookup
> 
> [...]

Applied, thanks!

[1/1] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/soc/soc/c/59797443846bc2451c35816026bbb79d281c9f23

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


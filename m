Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B94A5EC3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529234; cv=none; b=Z9Eqj/ojueJ+6MiVOtR0gOoVVLeeLiVRpkuKe48mPrACBvfPHzk6kUqP/V1YByyx3VnF/jwpFXZLnngBA5h37WhET8QwvTlKoXVHizK/TEG27nZ2fhlBdrjqynba1gMsCoNR/rBa7AGUaV09Gg5JUoSfLYbSRnXunYNY/wKOi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529234; c=relaxed/simple;
	bh=WjYejiIopU1CHC5EgLKo6uCuzsSyxfuSH1U+6K3Xu2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bPMEy/l9rElP0kUU0cWM4aA3Th2Etc03D+F9OqqUppJx/gotBiyNQwegd3CiSTIn/oAwbJyO0oYYC7R4/IGG+jkyFdysStpsI84CPfx91VS/jakY9e+LsfM0pP1blG0kGubC8m+Twt6Jt5+RTdMP/AC0lwUNUwsHiO5ZkD3/xZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxY4r4nf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxY4r4nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E43F1F00A3D;
	Fri,  4 Sep 2026 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529232;
	bh=108ncanAA8Xot4M0Apjvanj2sNmxvWNWsc1V8hX8xZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FxY4r4nfu9ITLvXzw/HIzpRfdiZu1vZ1FrhHYSEY7d9bZlOJqlwMKgmMGk4gN33ta
	 Rq9ETPgK3hDjvsKkk5puV7RS2tOcUamflUzg8xA23rP11BFSseZw/rc1Y0PuTzDQxf
	 rYqjG6E7q6f6aSl/Zoi/MpVvy0BRIwfUA3cmRzQfR6ycIBtN25Qrrhv8EvMxW4uXrA
	 k2z6u4UcGyroeq78o4SUJ34mvoVxX2USuMmkktNLuGEkleEaHymQndeyMMtJsA9Zlv
	 bShCrUgFAUko/VVzu7kMbNmwIzVsRNtuaDAK3yDXFXlwAr0rsdZIf2ugj8yvA7E/R4
	 koJBM+wCbr8ZA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for
 MX25L12833F and MX25L12845G
Message-Id: <178852923038.3340372.16221387405129989849.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 05 Jun 2026 16:48:35 +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> This is v3 of the patch series adding support for Macronix MX25L12833F
> and MX25L12845G, and restoring fallback parameters for MX25L12805D.
> 
> I would like to sincerely apologize for the build errors in v2 reported by
> the kernel test robot. I had made further modifications and fixed the
> issues during my local testing, but I accidentally submitted an older,
> incorrect version of the patches.
> 
> [...]

Applied, thanks!

[1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
      commit: 1dde2faa82fd69a4da5ab7a4635b51773b566d4d
[2/2] mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D
      commit: 01739ccea21b69818dc071096a249e6f84a6b13d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3A1F2B8D;
	Thu,  8 Oct 2026 01:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421875; cv=none; b=e88SnngZynzaRZO1g3v8LUoB49u9tyP3V4atKD0UWtPka8irfNrq1S7nYrXmFfkn+QWbKkAkkmZGcJXO3SsxJvXXSdUonaulmNuXVQLojt6+y5i8IrxHnaNLqRfgTPgom6dll3eOkJnih/XcCSxE0jEI91rTN2YQcp9H0Tc8H6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421875; c=relaxed/simple;
	bh=sOafYSn2voIkyihOleSCF9iQ8q5LE/MsMOCOmfiGcGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUD/Y4HIJa3b6Fhv+zJmESat6GnYd6TCzN+vy1l1fR/LOvs6hr+MBuYF3EDM1MDyHcGhrnUKVHtUSMrFhbWTVYia5C/q9wfP1Ur+Mo4zB3TAZCiHNu7sf2MgMkIrcpGs/ETLt9f5tRNOB6Dvrjln+KzCka9yCUhyDsFS0L/i/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmzEpyfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmzEpyfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD81F000FF;
	Thu,  8 Oct 2026 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791421874;
	bh=T/fObdeULtrpvP3s+VTgNAevGF6wTsfnk3IxmzRX1yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mmzEpyfF8xyE+8gDekWzXECWKry27489yw5MqS9qjDgeZ12FKhkLdvpbE2Z91+J3J
	 CvgIjhpjBr5ruWwDhYmq1JmMV0RJrbsAHsXnXZgEYIPHwUxkHU3YrKfNLVOjefIvBq
	 pepyxfTAb5Lui/iJkpQ2N+kA+tjN1nC+0euG+2HJoDSdsaogD+Kg9oOasA9E9coJxU
	 zcmEtsNgvYMI5I+BOWvxVdvc5jgTxyiLo/Jm82Dt4S5H74b7C6gUwL/iN37nd/gwPG
	 hnwhtXBvFZ1BKdcXV4jHMAXoft0mdXhs7gNsffc6wWhzdCBzDbEhx1WtwCgId6YmKo
	 GoruSNCkm1mTw==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Thu,  8 Oct 2026 01:11:06 +0000
Message-ID: <179142184707.120056.3281782658169373620.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Oct 2026 18:00:00 +0800, Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.

Applied, thanks!

[1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d05c6236496071916e19012cda7149465f15e66e

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796234;
	b=IxMTuQ4RsF8KTGhL1M2lGMpMiGUh4t8iTJA2OCKeGr3FXQOqWIN+xFcIfzXgibAMpWL8
	 V37TQTFkPAGlNcP+SMGJRzBBs7HO/YHDE7PtX1G6ORZl/EjAFnKobVw9t5XtO7kFemrau
	 s67nSKocYQ4NYuvsLJUo70FJrx7jkzzcgVIVMLEvcSworFr1Sdw9GaA3FN6GErOuTGVja
	 Asflue0sSerMqqrtjaSTEMAq10YPaKuCMH1VpVywSGzZfTzx/G08wkPkmo9FvaPtlcD0Q
	 1Qp1jiTEfa/DuurUKq6L1bydgebCk5RvdLO5Tqy8ssEegE2oBX8i0RDXgW/2IxoM/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796234;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DSZ44hi4g8RqJf7UpQMpYycq6ry0bT+HI5JoHAW8nqo=;
	b=OSuUA8YhsEHnwZopehnpUJfGzDBglho+d4tUcA1Cap1BRlHDKEkyWizH3ehRlVyXu6Nb
	 +gf6KEuXp5YKTanzkv3eNWUFxXdqvIEynvYxVrt870/ixiMOuq9I/SEq5dwZrxU7P5gWu
	 HWe8OjYgDQKPEk6wGXc4XG2vz8FKpfSwNswLlc2O2vB1HF6eY5W343+ar/8oaPa1zClb/
	 fWCRK2kWQTSAufhS/VIi2eMn/YC3b3/N60HeZmPyOuuB/CHB26guQUhb07OwMVzS2NCUb
	 XQvuZXlU4ISL0UkWHpScmSxjjU7DCvIr6MggVloSuy/qkivwW6bvgEc+6pkrO9BzQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JQHpOO+m;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF662606A32C;
	Wed,  4 Nov 2026 12:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF662606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JQHpOO+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DSZ44hi4g8RqJf7UpQMpYycq6ry0bT+HI5JoHAW8nqo=; b=JQHpOO+mmu/C3OWcDgsMN7CW9a
	qFPWadM6RubfaSMPpyZB8qMxkT2kHHDSrYfvmI9y+lEO9Ip1pcqW7WdmNLh7dWFMUB6aQHf+SVHMf
	8wwU4hpQ3vldAvFrN87IGp7n8oYZ3X4p1fgqGpMKseIy5HlNySMXf5/DH4HmEgZXjbvqa9e56fAgZ
	S58Dujagf6ZIoEZLG/27WYfusdYLxLeV18uBxGTlVP4mLuoOKBw0qfULzD9zCqkCeEC/VnXh15lQ7
	6F92X6tVCZk6Xk70J1BjW5SedXkmMSKUD/CTXoOTGccfolnw1rgJITXl2w+I2l+E5PnabmpPWm3Rg
	eB4Twoyw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Cole Munz <Munzzyy1@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Alexey Charkov <alchark@flipper.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3576: add cache hierarchy information to CPU nodes
Date: Wed,  4 Nov 2026 13:43:38 +0100
Message-ID: <179379621576.656939.2433506598756603100.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
References: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
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
Content-Transfer-Encoding: 8bit


On Tue, 28 Jul 2026 17:46:14 +0000, Cole Munz wrote:
> The RK3576 CPU nodes carry no cache properties, so cache_setup_of_node()
> fails with -ENOENT on the first CPU. That error propagates out of
> cache_shared_cpu_map_setup(), which discards the topology arm64 had
> already derived from CLIDR, and the boot log gets
> 
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3576: add cache hierarchy information to CPU nodes
      commit: 87fe687cc35a91d2798494791d40be4e00f119fa

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

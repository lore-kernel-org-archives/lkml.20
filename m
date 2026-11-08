Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169319;
	b=du6e+jzoXGYMoP2TbQAWt+AXrda+Vcu7oHkXifbWbPZsiDZHyKbGC5Mc3dTd13fDRl6W
	 rrDq9kRo8/V9zzieqH0adoZmcAZPjQlBqWoA3/9VYpzmijubyxQ46CmdtsDo1O6Oi0nEO
	 uWeP4+40J8GBm3J+PUBSor+CnVgb17+ENGeUYfkyUxIJ2bKMtJVgQ4Y148zQt6yvzzEbD
	 N6U2Onwoxz7h/gc+OdC2JgzGJBBe6QFyRHWn5EkH5Z7EaqhIGKmv79uANz27LZ6cZOVnZ
	 7Wgs9AxlRDrHWT4p6WihcnukrS3tDO7Df0GoGrIaoXbcORToAQzDcv85f85HbHCpw4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169319;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=drp5MuIHZpgXaRWUy+nFQgGDIxOMoiE8kLZT6iuwaNw=;
	b=YKIN9jagrXPFV11m7XfarMUgtwnL8qb5Y0JW84Vjhjj4O8jzVT+VTwqPA3g1PoblnIg9
	 lSl8+/sF29JDFwhlMPwnGl14e/1ie7s4O7XzDInA2L8CMxnhzVlDUn/lxy9mmVE7w3qXu
	 XaR1tWDZhQN43Bw4Mn4PfFRCuNvdKpxhw5mMDPabHFAD8sGPgSBNskZWUKeXf2jZneWTQ
	 rBUCLibAmzr8e2ydHl+zECg2IzayoOhuocDzU43K+zdn5LNnhNRVerXPz2R8UKhktjTHN
	 +Ce8mVf5dhpeTaLfPHOym2TNg6dwiVoDDVpjvKGC4k/zkeesyngxH9l4hydNUNpLrpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REpq5aiu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC215606A320;
	Sun,  8 Nov 2026 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REpq5aiu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252EC1F008A4;
	Sun,  8 Nov 2026 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169318;
	bh=drp5MuIHZpgXaRWUy+nFQgGDIxOMoiE8kLZT6iuwaNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=REpq5aiuHy2YQdvlIjNp9HxLW3w++Y1dKgWlpztrCx47nlSSGMbn9rN5GGU0XvF0u
	 No37nFFbwHETtwIq7djiJgScuTkcWeoZPpt0T41dNhLc3kBzH4Jj65QUqjX7dlwQ+g
	 UqwwUqPZTK8eTaNIb/Brtqd4ccgq0nlYqd5SeRXHzC9tQrtoFU8oAa8/yqvXWox9gJ
	 P4b1IbumKpqPbPDI/hgcOOF9Ku0w7kIcj426FoIuGu6E6uHljM52Akujl/wdsAf38T
	 nGlwaiaVOI/4coFw4wq+HIfDPMyX1Yn4SaJvuwmMt+zup2gO1VOrkZup0OIQ4DG34q
	 hbTORHUrZ1BMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaud Ferraris <aferraris@debian.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm670-google-common: set chassis-type property
Date: Sun,  8 Nov 2026 14:19:16 -0600
Message-ID: <179416929528.628393.737482504530891704.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
References: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
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


On Fri, 30 Oct 2026 22:27:38 +0100, Guido Günther wrote:
> The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
> aware of that by setting the `chassis-type` property.

Applied, thanks!

[1/1] arm64: dts: sdm670-google-common: set chassis-type property
      commit: 7018a35af1e64a346e91f928e3e1bda1729bdbe0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169316;
	b=EI6p5j1QrOYv2y14l1Roby2P4ydKYBf7sNwNt0cOzC1JpidKa1Z+gJKS6NabVasVkwEk
	 3BuCGorwP7XTlfwWBAHV5lWgdeVNCkbM+PkeNXFvSoDhxkUk9ybCOiw8z8WLzBqvu5CuP
	 wbWJroXeFeo/+Ida3l2HgUjAqU8mcXD6cAiThmbt0u9IA4GjUMIigeApcdq0dHAQIL4C4
	 nPGqnjGIwNivTscbU8PYO0b++b+kL9dTvela77jCClS5qlKdqnd8YQWsySRJe5FSs/0L6
	 oYG1DThF2894LEsrJnshS4Itj4LLmWM21nuEF6ey2SEqW9M2pnD8Vp8Hw5dV38uCYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169316;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jXKu8YLNoUh7b6qEbxLCOALRv7kBph05CrvzjeplkL8=;
	b=yQaW3U2XRQwQ9DGBnr51OeG8nIEzqKimAte2UVmQhkW1NK9Ss+bf3RDDSo3fa7SaS22U
	 wKT0P2m3Wnvt6IwmCffcIwBlPhSgeMPP6ZH3+3G27W39oewkhzxwQnMZQ6V8hZjM29hKC
	 Y6r9R7cz3Dtmt8CB2VLUkUGnaUY/UNgZwwqVxzbMTHvFvNf4QdMBygnU6ysL10QdOEggW
	 P03W2v+gQjbVoINm6hNU57ZTkGM4/8MMT4yHfLP2W5cpHyMSfpy/+j+Z4iWU0+EuXo3rq
	 zD29T2Qx1+umwrk9N+x81Uv4WjtdpARJ6ys93gTMID+MaRt5fjoByTh3UggPj/15UvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9RYl3gW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD5606D821;
	Sun,  8 Nov 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9RYl3gW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35761F008A4;
	Sun,  8 Nov 2026 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169315;
	bh=jXKu8YLNoUh7b6qEbxLCOALRv7kBph05CrvzjeplkL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K9RYl3gWMbEurk5+clEdPJL2eIP0c+lEDIEUrVmegTpUJa6vRXOJ9S1mDdWBi9VG7
	 YTb0TIiyemrBsklzjr5mOdM6vCJVK0kCpWWNjuPzplRcoizNYEFVqIh+e8Zwvs3c2B
	 j3I8HxFMs3Q3j25uar7ZJeUfsgZUZKg6ALZgt98eVm2delTB+WFaYS9eXAS/bx1fBf
	 yQ4QzW9/jshCwYALpYhNt38RwZcPAcjm6DmSfqFWxZc5sgOxGCMuQ/pPQUT9eQaRSa
	 4Y08ZFyJxHh6yM/k7phzQ5Ux1dkBrKuUDV3jRj5k6vsLeuKqU/dWRTgCYQ7DR7d8cd
	 8gxmRuxHAZ0Gw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Roman Linev <admin@mswin.me>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	barnabas.czeman@mainlining.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
Date: Sun,  8 Nov 2026 14:19:14 -0600
Message-ID: <179416929229.628393.16390580991068177022.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026174436.305327-1-admin@mswin.me>
References: <20261026174436.305327-1-admin@mswin.me>
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


On Mon, 26 Oct 2026 20:44:36 +0300, Roman Linev wrote:
> reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
> ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
> firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
> ending exactly where camera_mem starts, so the 28 MiB in between belongs to
> firmware and not to the kernel. The dtsi nevertheless leaves that span as
> normal System RAM and hands it to the page allocator.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125: enlarge reserved_mem1
      commit: 0733c22353a775b2b48e13a396ae8434cb17dc7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

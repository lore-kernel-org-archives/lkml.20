Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285304;
	b=ye9gbH9PXJl58tpTsAZ9U/AYh9KfC3eEbuJvy5DZ7p4+JFhS6TnyknTgBtdzpasXpfIO
	 Ai6p43Qa9uYcJbmRsJSDeMrbCvfAOeIQ/eywanhAAWkgL45fAdGC7+hR3Xcsb/7QXr9cY
	 Pl8D72uFu0Y4ON1CvVIAVkvqglKtBSDSi4fpTlNsKotoOg9zOazJ6j9x1m0b1A7/8k5cy
	 HbkZOBuCIbO8gTMbjmaeXLUVrbu/CP/RAbQT4sal977BZUjt9rsyw0jHfw94TuoYrevfk
	 4IwJps6aJngh0AClB3u4n8rSAGElsUN14vnpsszD7NICJzpJe7I/T6ywyvR66hFdFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285304;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9BPNllYsfu2NobtlPrJawffGHZDwHTWu0ls7q78rVUg=;
	b=n7qF56r21EXMqQ7KuV1b8KveljL8PjUHt+up+7JDFQIN7ay4DE6rhrK0ShoWIrTOoawq
	 ijccz1JJKV2yn505BAlYtI92ZZu/WV/MBQWcOqHYAGI5CSzhsZu2/xKwAOpQ1VjAj171Y
	 V8Ge24Svorf/ErOJUlRwY3DR1HoKqAs5nG35tOk1uYoJ6KKpS15v8HkIONDffn8Bg9KUR
	 5dl3D+QNFlROFa8nKuyQQ9Fw/bKbU+RkxllYhKCexHJQIkRv68pgSZ9by5Nm5mX369cJL
	 4RC01/mlD2rtR/IoVMYlRAG1NUm9wgDKa2GF8yPM2/jJeiV18Zg7hVz2+xk/2O/4o/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrV0zLO7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC62606A886;
	Tue, 10 Nov 2026 04:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrV0zLO7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660091F008A1;
	Tue, 10 Nov 2026 04:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285304;
	bh=9BPNllYsfu2NobtlPrJawffGHZDwHTWu0ls7q78rVUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HrV0zLO7hm/R5QkGWmYBkadc0BB7WavKb/gwr+FDGWm/txhRXKSEKhi4eWFlE7+6J
	 T4aRr93BXDdHPikleGBkOwY0MbVXViuF3bnBIKS7KjrIsrj9PcyUGNv5j33CzZGtNv
	 k9ZYdTlxW4pqxW1uZeqBBFowMgr6bpRk3E5ZVufXqsrH3GbCSBGGZFosrjOrOF/W6K
	 U9aECvMyCglYYEdHzhfuYlyhy2mLn7g2/zpkEJpHO3TE8Cm5Va4R6N7sCk3JiDZFTV
	 9jaeu3okbgEELjDwBbCDrJDos0xuyOu0KehtZfUxdwi70n3IXW0XUPj9XANH2RSYdL
	 mSjAy+x8J9yHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Mon,  9 Nov 2026 22:34:45 -0600
Message-ID: <179428529360.1061455.10674194152640910299.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928-rubikpi-next-20260605-v4-1-56ac4da896fd@thundersoft.com>
References: <20260928-rubikpi-next-20260605-v4-1-56ac4da896fd@thundersoft.com>
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


On Mon, 28 Sep 2026 19:49:16 +0800, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. Primary MI2S connects to an ES8316 codec for headset playback
> and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.
> 
> Describe the ES8316 supplies, MCLK, jack detection and audio routing, and
> add the primary and quaternary MI2S links. The 1.8 V and 3.3 V codec
> supplies are both controlled by GPIO117.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
      commit: 562984c2301434b62d9462b9410d47f52bc6796b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

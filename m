Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169428;
	b=C/EUJa7AAJuWV84ZdLXlyPP2qrNLMjOjb4c16VO+almpX4zBKHbKdrTSrRgwX17EOtL4
	 ofzOfP4nQPXjvrSqvFoqudew5ylCXPUlK7MyRXKVIRDs1qn6KIrv0/XjpQY/ZVu6rExjW
	 SN/TEwbPv+3f5SqQp5ufnA/fLFMDLJJOojgoPv27hQgfcnLf1U+YmADkscbnYos/tKB5s
	 6r4Zqei6Aw1mgvHfNxAS8SIqTo8gGjG4fxcwBuRGju8cytEfNhBKCDOeLVCxCY0Ds8kLw
	 JKA1H5xk/fM11+8Qpbo4Fn6Li7w4N8oIy/f9mn/ZXUOjmngkkIdjSqaR7sYAry7Ud0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169428;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pty5Na5czxWmLcr3DhwnruNlYgAYUZ0cOJMqyYF/qPo=;
	b=BYz1T4dSdL9ORPb4PWcc05PemvDXSAbkv35I0Sx9vd88NJ4+3LJXqrdWtAMm4ykGx+5x
	 nm6A0+vhAWtuU8C/d1FRDXEi6MSWRJMyk5tBBWofDHaRhbrDQinMwrMMeRBuHJt74ZISt
	 CwZpVOJPnmw9gxH3nO5zQGOpTWxUgUu8QasHzK/OattMVS6blSIKT2wbkSQDlB/2rMb5+
	 7e9Z08dHmCqwJAwO4umNYjWASGUPAt5ApXqUFxgxYlpNJ9uSYJt7LDGCUJ4lDJAIS7m6v
	 H3/lh7AHdyQgoYNX7I7AcNhIq5+j6gO61uahgOh7z3KTJ1FAj4knM6PI/z4xGVSi+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/AmbXwC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE46083626;
	Sun,  8 Nov 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/AmbXwC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F671F008BC;
	Sun,  8 Nov 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169427;
	bh=pty5Na5czxWmLcr3DhwnruNlYgAYUZ0cOJMqyYF/qPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R/AmbXwCyIf/6qaAWYpld/3ApbmG8zuTbRfCFm11EBFAQJm/vSGNZ/laXtuhHNdWI
	 3SjfQHs/hm+DkZ0ANWGBw+5qLuA72ZYwH16ewqQUlZrj5e5tjytzMA7sDFNF+Nh9D9
	 mJvNprpTPSLWLGmTmyU4bcq4/7l574YIo6b79moele3g+31ZfKHcnCNATYMvVycAxy
	 Htl3em2lNJG8XfkPQp61cZLERAtgLrEcdxiXAFOd9uGQIQp4BuWkPFLfcvh5ex2fsT
	 otnQzuSAztCq7StxpxlLPHBaWJvLKUvAoZTb6sl7UBHyLDDtB/xIUy4pYIVGwOYLWg
	 +OO5uBSWsk1mA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
Date: Sun,  8 Nov 2026 14:20:29 -0600
Message-ID: <179416929563.628393.4268358059417035573.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
References: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 15:40:26 +0100, Krzysztof Kozlowski wrote:
> Several Qualcomm SoC drivers have defaults, so their defconfig entries
> are redundant.  Keep the few options which choose specific choice
> different than the default.

Applied, thanks!

[1/1] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      commit: fc5dca8a2541450d7035f339e35008ca99c001a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

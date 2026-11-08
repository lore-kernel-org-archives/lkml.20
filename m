Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169339;
	b=fMYQjjKJD7+jfsy+0p9vUcrul8+gDJdRnc87rdZxt2/geCYCnZbKtF3bIMrNJIg/+xIN
	 ZRuVvwn02UBngCBYZcgL633o+BPlkTV0LGFhbC7UZOGutyPdegVnRGMpbiL1S5LI0mjJA
	 lrVaib8Xl1ZwKCcr74yC44JRYKF03q5NGsFqMbCVZO5VWmJ6nABIXE8G/MgTblxSc91G9
	 l7+BKstda1b0LjMjN2CUX5ni5E4EE2sXL6n+A2PUgeJ+/TUY4Gl1AUeEUTK8O9RFgObRe
	 ltOMTvEw3YlenYE3/kgG6B9RA1Hmm7tLVZJ1+ZuTkps8pbfbQKoNgyhQUAQenU8z4Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169339;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EoA7ZL64zE/IGgu4V/DOWIYVNExZB67W/0/a1KImPkc=;
	b=XQup4FRN0AZ9rOF48tijWgiwVK5ukHt6mydTkSsIW5Tpkw3IQpO6ltVVx69CnLquIfwd
	 Xh5cGmDj+wmnGfVraVnDsOy+u2xKB/YcFxuc9Q5UwffT11fa1FZQoKbAm3mQ77Z5mByFJ
	 hEC3+f2vM8Ddq2ZPwDbfiewANETQpVDxJ/CuEYAZ4RYzc/MIhhkwHbfD6RBIycjSgp6nz
	 XdXJVdJWIZ8mEQcfh0TlAQPM0eulDucwOp0rLWRad5eN3RPjObHY7kzb+AV3EpyyOOryS
	 6A//xdjFo7fa3yEQ9OeInzNjrfrJDh/xtrBuvEtGNCgixcye9msozG447cUxY4BR05Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQuVy8nE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17508608361D;
	Sun,  8 Nov 2026 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQuVy8nE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC0B1F008A2;
	Sun,  8 Nov 2026 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169338;
	bh=EoA7ZL64zE/IGgu4V/DOWIYVNExZB67W/0/a1KImPkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EQuVy8nEVUT6mIqiMntbGYcZOfQ5gfdLyoxbnawCK66Fv4eNUEEw/GFFxJbAplwDS
	 fG1ULqe5+TVQ0FQixg4Jh0UP2k88G0AHu0AW/EIAYHOZgqzfrqJmVw3dbVz1sHUK1e
	 QSBoYXp3Iicrw5ieDNCl6fFgJoSVSCDZFKo2KOesAoIIgRBBsj5XbugtSvduZ2Tg3s
	 5HQbWODU8GHySb/AdRg0BamwBwVYKEBQW1eHAjib/ebgchjsqMylqLtkMouGp/7uGe
	 23Fi44+CaZNPtf2lvFR49hiHwY1ckuVuxbAdpbR1xxb5u09xAgQngz+lvp+16cqFhJ
	 OaBZFI6BNwL4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Casey Connolly <casey@connolly.tech>,
	David Heidelberg <david@ixit.cz>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Petr Vorel <petr.vorel@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Move panel pins into common
Date: Sun,  8 Nov 2026 14:19:31 -0600
Message-ID: <179416929473.628393.13331818143918670275.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025-pixel-panel-pins-fix-v1-1-7cde6f7ca861@ixit.cz>
References: <20261025-pixel-panel-pins-fix-v1-1-7cde6f7ca861@ixit.cz>
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


On Sun, 25 Oct 2026 23:28:13 +0100, David Heidelberg wrote:
> Both devices share the pinctrl configuration.

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-google: Move panel pins into common
      commit: e46dd13eb856b1fdf998ac64cff656295f738f16

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

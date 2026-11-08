Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169468;
	b=ikrVpZEUl3/LTgzwy5N7Hjkya+eByW//5EL+3BpKFgsHHqpMMS+qzHACdCfCuMckfpED
	 QQVPTHedlJLi6j42UZcNJ4QKz8TfvkxNPMkfgMjiwBB9hEBWuLy168RlZBjDB8NurrTs7
	 MCFOKXH9HoeJGrnlKyuWBEgeGGlpDK9sUzVa1LfFPd+5+/jUYX3DFOXBbgEbDrQ3ifHbJ
	 5a0TpnYK0caWDIIPGVv5Qdepy5984W6vemO1Lyb6zcFmz/goXJgPk5jq11aq1T1iUkuM8
	 TArIvOBHBSeLnI24Mw65Atwq0dlCtXlBO6bVemPAMa9tC//9ip0hH/xjAaPaUNv689w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169468;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1GfSXoiJaYUndgE9kA3m/MkxWtasIDPZT8INP8qmESM=;
	b=cohH4x60vWPZ3xDuUaqGFI3BotHWGSyMKWJ5L6baKvkph7y4peR0F3EQ6UuLzK/1E5CX
	 D4LYFIzvYw8IHUuRPdv8mVOxFerpTbZ/ilTHszaHav34CCZP7/60uyCslh5sindkxb9h3
	 AxCW2fsNLNYvBKN1fnOaFngLGJSybaTbxWg8QEu7eiZ9OQD0urwR34Iitd2teGdqJvU2a
	 1Fzr2vma5nPE+xab7V+tmPY1UVb8HoQEaUCW5MW8+PoAoWOG2oeAru8Zqp+V26+ojRNDr
	 3rANBDKfyyCj4gjXXEXMe0TJ6WZpu/z8FRmuU7W96HNhItYFqum0cMUAtn9SRk3K8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMjjts5D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0FC606E029;
	Sun,  8 Nov 2026 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMjjts5D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37FE1F008A5;
	Sun,  8 Nov 2026 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169468;
	bh=1GfSXoiJaYUndgE9kA3m/MkxWtasIDPZT8INP8qmESM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hMjjts5Djz02kbRi7aiySS1dCnT4LT2Fdl+yP/PUGktZubm+1MVol+Qvxus6ZhpQk
	 dBWU/TjiNIoTO/dxe9J4yiGKMXCJ22P1D3iAqhCZANzx8c8nP5c4mlV1eRHPe8WH6M
	 47Ups5VhgumfLKcYvXSJtzgaTTcZqrV2LnuDAarA6SbvMJATBw2h8cggNrzAfRB1Ae
	 ZQf3P7//rKAwq0VzQWbQEkAYTIpbAox7L2ZKhEXDTxnawwNMmQjGCGPDzSS+5JtsyA
	 dDqQC/GQ0YZ8gK/+9SM+9UVqq77SS+bE9M0z0PyOq/L+dl3PVMVCsC3FY/1s4RfjaV
	 U5aEki75X53UA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
Date: Sun,  8 Nov 2026 14:21:02 -0600
Message-ID: <179416929483.628393.4971242619354444736.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
References: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
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


On Tue, 27 Oct 2026 11:49:31 +0530, Ishu Brar wrote:
> Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
> 765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.
> 
> The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
> (UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
> not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
> display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
> with this bank bit, so add one.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: ubwc: Add SM7250 configuration
      commit: 6622281cbda9faa3e9c325921906e520734491a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

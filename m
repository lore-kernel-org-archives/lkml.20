Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269943;
	b=4kH+jXnwQ9YDjmUjYeEfQZeCeSgslri3yc4mH4pKa6EqS3Nq+/MneU85q2W0x4WXoVUS
	 /ilHyXnMXJUfsLVf6XHkxZFc7LbteHkkSxYdLXI1Nu0zaptkVgCIJCRAbVyo/bJIichrs
	 MB6ngokUjyJFVCCd9SFLWDwZKgxRFLB/36Jf1sQqm7YbLdUsHaplD+v7rjbRcx0x1fpcD
	 cZUt46fOS23MKfUJ6PtcpP6BUA0dUqWptiYPICT8TAaCyblCDWAvrtSgBwtIFLMcVnxXQ
	 Uic8P5gfXX9dIrqK1v/LDwnnVnomXd/qNgGUw7FLxU+gttIkrgJt3LMMeeslmO2un6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269943;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D340QR5pIY14AeGchJexrYYpbRr2AoZb/MZ4YNUL/uE=;
	b=OPJ/6NQ9JwqzDiPpyYd12iWGyvVi9LErs1JfOI5XigXH0eiyx80QEg9gjIsBxUjXian6
	 YsSEJKKREuu4JHM39p3d7teqxN64/I6C/FOWhVY5bLBAATXt1XihFqi3vcqhjmCCR1jZg
	 ENR5E6jDmB9nPvw118XQK2WC3W2EEQMZ/2xQnxt8sHVE0qhJyq5YjpRNewYjuzjHsUtuv
	 JD8ZPPYOTDiEmYvWglgz8BKEYYIEl6X/9u+OBB6/YLedVP0hB2F9eCpONRuU6sosQkqCk
	 PupgCrpetm8oGlIsXHr0eqW5wjdPmCmrtwj7bQY3J88gtzHxd/t/QmQRiabag7d42RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWR0ui3U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9284606A33E;
	Tue, 10 Nov 2026 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWR0ui3U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C8A1F008A7;
	Tue, 10 Nov 2026 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794269942;
	bh=D340QR5pIY14AeGchJexrYYpbRr2AoZb/MZ4YNUL/uE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oWR0ui3UsuipkM4nt5kPePj4b7WnqO5HKzNfHNTVtlXChiiep43oBRJIEYE1x8pPL
	 LAo8wnPvLxlxWAAdCXPpDwUBwWrkBckUhl0YBITLYRzg5m2WlNfNDNCgwugmenxIDu
	 XT4x+31H8H3FpjJX+jzBCXOjNXy+9yTGDYBTfVAUDDynOuaMUAtcDb0IUDcEjB1WUi
	 QttBZO/lomz/8wYi1Vzg4mDtDeHSne55IFV8MIBqm/OrDZiWfnxHtMJM5N5alIbEpJ
	 JSNYeo8RkRqj1HyEHqoNLBANFglTa3EuyxlwSdu3hjsUcTsMawWiuAIv9jB8/y96nA
	 QbLZGq9bC1AXg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
Date: Mon,  9 Nov 2026 18:18:54 -0600
Message-ID: <179426970782.877162.15936105150365282409.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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


On Tue, 27 Oct 2026 17:19:51 +0530, Sivansh Gupta wrote:
> Add initial device tree support for the Mahua QCB. The QCB (Qualcomm
> Compute Board) is a board built on the Qualcomm Mahua SoC. Mahua is a
> 12 core derivative of the Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads,
> power measurements and oscilloscope-based hardware validation.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi 
      commit: 71e1b237de83978ba89576f92c5da892794d67a9
[4/4] arm64: dts: qcom: Add Mahua QCB
      commit: 3b0df46f80ea1ee0111796f6ffc74be3a2873e9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

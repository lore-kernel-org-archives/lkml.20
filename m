Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186775;
	b=w+tR1U902SJN9QAYJ3JhdaXrznomB4OcYtlI2JJa0snyreGsgyKhu8pspr8BrEGfo/6e
	 unopGC5wEjNCX2bn85xxb13pwKovhSn/VYSpoR28TH3sufeGTW7Je94zm3aum9cjq82cq
	 7BaGWviYwvwFQRkLtAB2YRTBiVKBuy/w0vlIglJwgZKYJi0+X/bIsKaQRhmCQsXWX5TpZ
	 mOie5S+UBk6ii0v49Ug0FpgxKstnAsbWGmbop6OaJ0kw41cADy8jFglbwxLP5Ww2/BGaV
	 qpu3OrTHFDq9n3TMMEIeL/QUWoVr4LFD6Yrq3IXWF2GsHWzhRAy4YVH2MB6oiHDYPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186775;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/sE16aGDaCkN/EIpOu3CIs8WvRvo9DtyJnWQtEnGXBQ=;
	b=QgrJwRFBPrYF1EHGQt4C1F6PLyuKl7QWzvgDYdkfmJzMfMVjpgx7NQ2paFjJn3XZYlQz
	 8gKyXgIYqUv2Yon7+VdvVUnH1enq7B/w2hgBQ735LS+FapBQWYLGDNSvXdmJe4rDCJ5p6
	 0hM4OxOV6Ii7PiOrWaXDHnZ+VOqrhnohJucWq4kbEH+ftJfDuzKtZtTdncjHWJ73tcwog
	 R2+BvaFHp3psV6lXjrUMLXGQl8JwZUBzQkm/t82/NjzYuGKI9e3CO8elV+UfVwCA5gqNg
	 88poVG+4gnDJRGuzIOxSKAL+EtugI1ucFXBc69Ppg4Qb4SCfQyONBE6qginkTP/t5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdJwbNPF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0E606A31E;
	Wed, 28 Oct 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdJwbNPF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3591F01825;
	Wed, 28 Oct 2026 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186774;
	bh=/sE16aGDaCkN/EIpOu3CIs8WvRvo9DtyJnWQtEnGXBQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YdJwbNPFKcKbVvIVx9IFYAXcOmOjY1ccSluwasVu8WepyWG8qaWeqwEkUMCHBICyo
	 a2bZeKuP63FutEcEjJ5XsVNV4xqWY2gd4RhcdhA1VQ5SmdJS94b5gRSgoSieLZdIXG
	 d9wvMn/diivuRdWBxgo6q2HJxnQgRr7vp1fEuWEjaS/SSNbrp0zw06bFz6Ntl2XthK
	 eITiOcGjhpQlBLHdHi5nF4t3dL8ew4rSFD8bTmgiLL3P7Frw1rduL+YX868DKWsi4x
	 u2wPJT6NCUk7mElxrLTIplSj3j2xrkY5Sl3J87vhStjG7yU9FL9gI6H8nn1HjWesQP
	 4hnLVRuAdc9Rw==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related
 to the USB block
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jason.pettit@oss.qualcomm.com
In-Reply-To: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
References: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:56:07 +0530
Message-Id: <179318676785.5872.8903659001969511852.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=mani@kernel.org;
 h=from:subject:message-id; bh=PXDcYlRfxhpVoV3buVH6AaRX+9doHJ/a8b5z79Vu5xc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4dvSN2fuAy5c7TedFxYydDa0vs0rXW0E/R1dm
 4gDCH430g+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHb0gAKCRBVnxHm/pHO
 9Ym4B/40HJgdzcY0y1BiwZbFSTw05uZKzx3wjH3V0I7oOt2PdzQbNR/Z4v4zo1q0SaHM8dIGR52
 r1qOPGYnZ3dsxUD7UrKurQyYzY9xTUJHGqD2BHX1DZ7prdwC3wGxAASGyk06BaWSh2xr68s0QNR
 wVnU0eX9cUXpWuBlPLV5bXyF910OKjmtXgKll6gjBSD5tHPtQxv9fIpKs002jBVhi4RgRP/1RCF
 AvgSc8T/AewVjMO2LiyZNNpGLS0jtmz/f5IdwhVsuJyU2vkqSGR4cbSWvCmls74+/zWmZxg1+a0
 AUjFzNiH8h8amWAAyKAIq4lXpl5s5T6dDIrvU2dgVL50k9gn
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-09-30 18:16 -0700, Wesley Cheng wrote:
> The Qualcomm QMP combo PHY has a USB and Displayport block that is
> sourced with different clocks.  In situations where the USB path is not
> utilized, and only Displayport is active, unnecessary clocks are enabled
> and not used.  Split the current clock list into USB specific clocks,
> which will be enabled whenever the USB initialization routine is
> executed.
> 
> In addition, move autonomous mode control specifically when USB is
> active, as its primary purpose is to detect RX detection and LFPS
> signals, which occurs only when USB is active.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Please take a look at the issues pointed out by Sashiko.

- Mani


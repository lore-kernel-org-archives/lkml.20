Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529062;
	b=AE4gwpwCqnkmjFNSq2QAENqWvrugZunS0cgYFVdqzQ6cWcfrfTVCXyUeBXULxlXgaNAH
	 R7EPoz4iKbqdxcYA/CyYqW+FX33r8Qg4qPrqCxaXNaXDstwNJGTCQoyqgtbf6x3+kn56q
	 COfxa69o+B7QgzIEUH+re1hR5hy5ZzfGxK3TTy3MefFgLuNpKNyKfn8S5FIaJdrJq5V+f
	 j39HnA8rFgL1dzRb1Opq25Ao5yE0ks3L1LHczYOYDyY1gS25ZwP+exBYpZdujqDAAzlbA
	 FE0juxn5q48tbh71RyuWdcQOOs1bbgtm9/LoyOBo2oaNV2+pEPz1/6Y1mH7rRZKdlZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529062;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=toJJi+fh6W256+8bc0G/+hEUx0vkCgcTejgATIdl3t0=;
	b=1qM+ItXOVSO+a2SJ6qGHs3V8tfGPyxR4YkRIRV7JSx4LPDlFniJnsCWvibjJoeTtJS0z
	 YXgUtzMPO0sxBN/U5DJljq6PXZz98cqRbBg3qlU5IUR2yIjWF7mBJTYNhE3e/oVsdIAZs
	 6RGfbBF2CnWAZ9UiK2OScc8I/LYdhciP2dmJ7TZpNL396NIopR0t+lyVnvLfHBEg9DAaA
	 e0kwixgmRGtMVmz9E4iKhtmls8FZlduT9nmwwzIIAI+FFOqzmhOrq4Ac4/36JtY53xsy9
	 GPDOhvRVQfMrFLUWKB3atIEHwRRUIQeuzqdeYusGJ1aHssrW+M+R6azkyKlUCtdV7Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJCKx8uU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E0606A324;
	Sun,  1 Nov 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJCKx8uU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146281F000C1;
	Sun,  1 Nov 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793529061;
	bh=toJJi+fh6W256+8bc0G/+hEUx0vkCgcTejgATIdl3t0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NJCKx8uU4/zCUiaBv9m1S1cHLZ0B4J14tQQ0JpO8r5D+SPZPolFD1PDew+i/nWvEp
	 AhubdnoGzDn3nyKonjZO8HW3x7PrLyjOEywTUeDmFo1x4RxAfTM5DwPnjjdcz2h7Me
	 wj+fRZ1X1ICOhtexRS7/jllV5XKK8dgyiPy+QsTr4Rxgm3KAcVTPjqwjG0wcWcPz7M
	 OvXI7DK8NjHYpkIa9zn/dQRsekcFtuR8xtrABZRJJE0Gw5py+MHUlQ/R3kCUz3k3qT
	 rykQwwNgfAP4lf5jY/+WuCaFIBunPiolAr/2J9mb/fq5JSXDftXr8SJqWQI+b4rCfC
	 b53giezSktqlw==
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
Subject: Re: [PATCH v9 2/6] phy: realtek: usb2: introduce read and write
 functions to phy_reg_desc struct
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stanley Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Zavertkin <misha.zavertkin@mail.ru>
In-Reply-To: <20261016180314.31760-3-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-3-adilov@disroot.org>
Date: Sun, 01 Nov 2026 16:00:56 +0530
Message-Id: <179352905617.2955.16793637507628987247.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=736; i=mani@kernel.org;
 h=from:subject:message-id; bh=KbM2L99ljPSnmMAYBOTA/P9ImHZBmY4HMhXrCrYOlic=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xTi3ThHMLGrsjcqmC2Cr5Ik9UsjRTGSryetE
 Zc05tTuZ3KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucU4gAKCRBVnxHm/pHO
 9cOxCACZQEN+puqymiPLWpX07m1evhO+fB1+2BMrP4Df0CwJXHtNRqdb+beHEztLYFpeiZc4eIX
 xa7ayyIfKB/4fOSCQtaeTqg3QBnzNvZl6FJ8ekihwqsRQqtvVGjbhQs0blTbdBHSJ2WZSxiJncA
 3hp/r/nqsU1PIqyaKYL8dPTP1d5NMUCPAjByLclJdjO9PAPlvRRhZG1CZCjX5bYWkyISbkXoETU
 FfvJU3p9yZAOVxONFX+9EmD3n3aHaw/+QHXkxo3TZUF6cyjCItZQEbIL9jvrE0qeg4aLU2jArV2
 9pmARkfBGXD0lKmZZsNG8S8mzULKEMMJs0QYTNZ8yT4tTxu/
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 23:03 +0500, Rustam Adilov wrote:
> RTL9607C is a big endian SoC with little endian USB host controller but
> vstatus register is from big endian memory region and thus existing
> writel doesn't work. It needs either __raw_writel or iowrite32be
> instead.
> 
> To handle this situation, introduce read and write function to the
> phy_reg_desc struct and add a default variation that is going to be
> ponted by the existing rtd_phy_reg_desc.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469004;
	b=4bF9zn2jcf8YaSEuT8u4nhXRkXgj2mPuPLIEZXLWOhnfq6oTr6+iO8svD/Vkwvd6J03e
	 8HaGIdWid7lqS/5bS2Pl4la/9fSng22liegegZuUaDModHcT32DogkrNVeOfruou1r3th
	 psQRYYc8jyCnRJ4HZAyCahwkxY9twKD7vfDW6iUXZ3ufW2E7bJ6N8sFqfDqbLc/JX8r6h
	 6ypnNDOu4HM4FlgEbLnwEoEt1ifWDxJr5/JMomQC4SW9dptvQX39i1jd6DyJ7HOcrS1eM
	 TS5QwTYK0qZ27XZJKSWtUuxSon6kW4ZxAyYtHIDEqBSIdaGgNoAlnLskLtY+7GFnvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469004;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PZDOH2I/gD/+/+PJnN1U4fYXiul/gCpaWgLKpOrV6LY=;
	b=Go9fdu0XPOpbfVB+VDGIAcE+mLiLP8ubzZSSTWHd6D0nTq1J63JQReyZtiRz+3blsWS7
	 zFtflH2yBwqJTSmJhhxvpJXM0bYqjIKacsCQt8wKqgZzhddUwElEkN6AqvU4KYRWThJaC
	 z05/VqtprPzFQCzHoLUOpM4+yQ+RNO8YXSYrOBnz20UruVtSLJVAARKico4wd9S0EgwpG
	 5NiKoDWXMe41g41cLqomrHXKfHtwEvb9MU6uauRkfq9VE0LolxjJgrhZaNfeU5LHJuTph
	 bDZDCgLaVygWAWP66/yI9zsoEqAxXjyaThpEd9Qoq411p1aV6PbQX3Aw/xJ1NV4wRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6yb+OVO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5DC606A31A;
	Sat, 31 Oct 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6yb+OVO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C371F000C1;
	Sat, 31 Oct 2026 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793469003;
	bh=PZDOH2I/gD/+/+PJnN1U4fYXiul/gCpaWgLKpOrV6LY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S6yb+OVOipiX+6nQcx7QI4sIoO/tL9tJvK52pvLEQm34lmvlq1x2Ns7VYzZY5xxWJ
	 ndD1n5qPTHHL+5DYf3AalJqPk0D/H60b77BiGvLOyY2xrKJjTjj6EVSMMbD5spdFNi
	 tUGNN2d8/yBfEDgypZX81rb01igOxAnZQplt2FJgD902xjrnYBjlzm8r2M+PSj1Y84
	 VIFWW4PZpav6YjNcf2pkfM2Ydh27oGa3yZnIqiDl3sKyRFoQT/KAWJP6J97/kBXcwg
	 iWk5G8DGOkbck06Ec1OrKO/sgG6cXpQoOtbYdca0UjBKssTtuDtT9KdSw0nDdDWcNC
	 iO83Vdk2K+1yg==
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
Subject: Re: [PATCH v16 2/2] phy: qcom: add the SGMII SerDes PHY driver for
 SCMI systems
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014-sa8255p-eth-phy-v16-2-6310fac52e85@oss.qualcomm.com>
References: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
 <20261014-sa8255p-eth-phy-v16-2-6310fac52e85@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 23:19:52 +0530
Message-Id: <179346899212.7309.7446579634867562671.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=594; i=mani@kernel.org;
 h=from:subject:message-id; bh=geAUOk0sWOTd5/jSTUmW603SA8XjUN72YS4GODT1CS4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5ipE3qevkG/n+wAfQ1pkqb3XH66VGUXHwCasW
 Oa6Fbu5upiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauYqRAAKCRBVnxHm/pHO
 9aUdCACqT06LXEkRiZ8YOgqJj3sKy0l32BSan0M99zjpbvL1XjLVLvpLlzFXh/8oR1t+TSO8dyt
 Djoax6KryKUMvnVQpzlc0KCzt0j8aTtHaIY+i8oL8zFMye2az6WIBH0XjRWm5LebANi9YsIIYgh
 w5FjE7jCPZ2CCPmWi9OksTafQvvN8X96vUpaGSgcnobJU63EHKUIMwikdmm2ond2J8bf6JrN1ZR
 ZSqBNMbldlgOL6aluoWvoKL7u61nzFdLvyyd7H2VC29RNnk8EaxZIzCY/XjKnPDX+jV1Pxvk3zD
 ysr8CxlWbDwwX5zoOE0p7/LtaoJe6RJkO3Ht/vujoHvqXBVg
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-14 12:01 +0200, Bartosz Golaszewski wrote:
> Implement support for the firmware-managed SGMII/SerDes PHY present on
> Qualcomm platforms. Do this as a separate driver from the HLOS-managed
> variant as they don't share almost any code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I believe the OPP table comes from the SCMI DVFS power domain. It'd be clear if
it was mentioned in the commit message as there is no OPP table defined in the
binding.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



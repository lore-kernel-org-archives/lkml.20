Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468198;
	b=nKrr+rC8OLheVofIAESrY+PHzZgT5sdt2P3kTLi5kHMg4G8GH948zpDhlj3L8plFCV8e
	 X5Y2emJLltLjYdJ5qV1Tj+vQmAzXiDcw3GkYFdu3iKCrtF002tJ4AxBcrAocES7511nLA
	 f2gBUbYNcNkHJzDItlO78aSZCSPK1sVl04XN60oK8RvYmgUiWuM3aTRzVxIJRtLD0m6Yy
	 AUdBnHAf7IZDGRuNv4eCk9BPylqemQYu0/C5GL0VGzFWfkUv/8fBm6/0riD4BIL9k6VBz
	 r1m8EwaXVN37PmUyvNV3+/8oy8DMXKebnjcJHFu0yHe+N8/lS+/PBFP6P8hyxmdxdzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468198;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=A7rYZZhwITcyDhu205txGS/XFBdfhwiSbkwcizPA/fU=;
	b=vgCf075hzwI2V2ad5GPgpxblBuqy73t5eJuzzh6Zi7cyumfcHTYd0YvhE2QofPaBbjf3
	 bME55XKs2x37BAzC6aMy0s+OIvF0z+eQ+0qP3gsCG0gxi92FHanYXIwMqa/Uzk2ewtnR6
	 1GryDRIRAa7KmvWpIjPc7ZiU6i3mpIvNuSZKT16lIcYyVC5N6S4zADAJhN7bDr0ICbS0n
	 qjv11cwevGCessf1IdmpjwpdKDU8KUkqG56HC5F4Z6wVjhQCFA3MRDWqTRRGYVdO8AnvB
	 9fjniRgmy7UZIC1P6OKH+qzFQeM1ZnQw3mOiR14uVkOTk4xXaqMPsvEWNXLFBW4pMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eK/By4OU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01257606A31A;
	Sat, 31 Oct 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK/By4OU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548CD1F000C1;
	Sat, 31 Oct 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793468197;
	bh=A7rYZZhwITcyDhu205txGS/XFBdfhwiSbkwcizPA/fU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eK/By4OU8NQHwhrsUUc27O6LqNU307PvE+OL2tDL5GoLSSEsyROeB+HzE7qG7M+tp
	 WmfP2E5ob3kZ87IWbMlUoOCHNJdyK+aoxoAozDCt5PQBwNu5ZF6DtkXzbxkWnL6D4Z
	 PpvT6tBBynbAzHOah3b6AoPeLgy6ml7rSV3RuCxHq8v01kuvOvDWSSnIsclKBxCPtW
	 sTe5Tt8jfIVmiyd4xsrEBywOZ14Ppa39r6zOf8LTF1G5HxPiV3gSRQZWThYcbgalUC
	 ny3eq/DsQDK0Yt3OL1hBnFgZQFPg9kmvku2dbus+EXFww9RtVY0QSkNsc13JWpKrBj
	 XuqC20JiXCYwg==
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
Subject: Re: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies
 for Glymur
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 23:06:26 +0530
Message-Id: <179346818618.7309.6736144761934692738.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=530; i=mani@kernel.org;
 h=from:subject:message-id; bh=4vJv4VvRn9nmwAnO3sqpule0BEnd6l7ULaD/bgA2Qvo=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGrmJx2gSnyZs2kCHDIM3Mcwo54hnPe/+x8mQ71tx1ewV0vEU
 YkBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJq5icdAAoJEFWfEeb+kc71RE8H/jzK
 mHuwXJFNqIEpPTyTmmPe/GwhYsq4MGS5tjIR2d6zx+muon7RT4D6pAEBb7kQQx1BC8P5UHpwefB
 Hu/YFJS+XhvWuU5r/Jm5jzE+ad9AwRyIQrOlSYyRwVUFG6mXKgs6OHYKi/IzHL0DKYBE2YZ7VeX
 R9U9vLz/B0Gvkv2TOh0L9SzYZV1l89oHi00yw+XoQ3dEiPvcW9GLPDjqkaaaoYu902ttts7IsL1
 geydkwncOjSfzhg/HccSGFg32KO8ZJOGAuOk+ba9OufKKDavKRRaBavwfC5aA5vbxG9ucjuIVZs
 Z3pXjyHEQa7SWpCnjJ6DC4IK4+HxeM4L0gBEn8A=
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-13 03:16 -0700, Qiang Yu wrote:
> The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> two power supplies independent from the PHY's core and qref rails. Add
> support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> glymur_qmp_phy_vreg_l list.
> 
> Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



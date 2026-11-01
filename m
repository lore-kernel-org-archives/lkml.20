Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528886;
	b=dnjCQxLFwVftViUWJBBrS0XNFDWkSdFn1ivtHxGlkz7zdBzZz0rxWmYx2A0n0+qBDLjh
	 QZuRipKVeGLx1Dosjd8lQBkydI01T2TZWuGBNZ3uNmuw/Dq0M5hFD/ojyh2SVSbgYcBk2
	 0CXv/Xkwfr293q9XwbuTc+g/sdHbjKDRM1Rx1tqdg8B3rhSUX85Edbvmfo+f8nWZz8c8Z
	 f+yLsp3dGpi0IHS0qF5o0x9KjbtpR72FYfx0E6C3RhWfKZ5dgX3SnHtoFc5nQoJni+LGA
	 Id3M4S4ycCwOtoqQyPjD5TiiMK9cs+xar0Zf/cVqIv3Ls+RkYGDjSwzi06CIcc2E/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528886;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HLYIqwxJ5WYlJPpWkXyQBNJeKHSfq/1+H4q2iamRMWQ=;
	b=fTqR2vs3DUbYhhm/xSuzmCNBDtgRSsDHJyVv8GSdRBeLRNULyZBIchi+XYYSYiMuLENA
	 FH0cVMCIP1Lr9etiDFSWB19QiYRw6RsceEu0f4BwKHaLMQ4TdXoRtwNiHZu3j8seO3czO
	 +AnsGxYSNtKnlQUGGgrTPT/LwHbpfynpuFgp51eCsciqyBdSSbbAh2xFb5e2yJ9OfaxLC
	 QkXdAW5hjMbSj7RHEdUHcgPxapcx5X4p3deB8sjQiaJ96UOvSn/BVx3cx9shh0lc6gKh2
	 jyDUaEVCdAIkX9pn+XnendlZrTiYuSZXex3+Rb6vakQ5BKRotSmttAlCYgKc8dpWZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXO0MNtU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A872606A324;
	Sun,  1 Nov 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXO0MNtU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26531F000C1;
	Sun,  1 Nov 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793528886;
	bh=HLYIqwxJ5WYlJPpWkXyQBNJeKHSfq/1+H4q2iamRMWQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jXO0MNtUe65SEoyghzmFa/MdwUxIwKj9CveDEeif3oDJNQ+OX+ITWVsT3Tk7FDUDg
	 ujipNkc7UZWU0WAQwTIEn32yFh7m76ZJtVk5AItxgH3k0dXwmJO49//LA4UrdLm59g
	 ZDzpHj3CTv5JydpMPrsI0wQYMR8TjZJPU8YH7/5wabRMdjmDnXhKOFtj3/2LQVSO4G
	 M+8ARwkdiaE6xrFUQW+wlde0e0YOmkR0lud97G8HPjxR2J+K2Iyfp5WMeCEVOBndic
	 +4nizcWdv9CyiApCxHZ0HUYppezrTHKjEMG+p8bAXeoK6MQiwQ/yqS/tGP7dQHLkp6
	 foA1XxUPPT79Q==
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
Subject: Re: [PATCH v9 1/6] phy: realtek: usb2: introduce phy_reg_desc
 struct to the driver
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
In-Reply-To: <20261016180314.31760-2-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-2-adilov@disroot.org>
Date: Sun, 01 Nov 2026 15:58:00 +0530
Message-Id: <179352888089.2955.16034514830661487022.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=mani@kernel.org;
 h=from:subject:message-id; bh=YhsgLzpm5B4kL+Ankc4Htk9KGAusE+s3+PIjBAX7d1M=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xQyKootva6MMYJMdrwgKMExBJDsNC9UePDCM
 pzr2QMBm1GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucUMgAKCRBVnxHm/pHO
 9QUtB/wL/oOxO69Gco7DrLvUW5JXpedgSTfYEBgXIrhy7Ch08zsI4B7rvIziAqcudMKQOrSHjdR
 ZkV3ANEylVV1OX9x5up3sjwRXh2sSx4CqhFYsa4AhZYa+Q1Ti+wWItEjuiBw2ghn9Siv+wB10QU
 xrHZ4OsA4eeN0pMa9MfRZ+IKcVEKdPVqC8k02M20MsnOattzz/3exu26r15sF+YMcaXv5clcijH
 Djb5f2tDbbf9YuuII28PquiFuKas3QzKM+Kc21C7u736s5T2SHjKRpW4RMwslB5hejJ+s55WiRb
 9OOPYFez9IHRYJHXDcBT/fxzzlYBGx00jUdKfvdjCGSBWGEM
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 23:03 +0500, Rustam Adilov wrote:
> In RTL9607C SoC, there are a few differences in usb2 phy compared
> to existing RTD SoCs, like vstatus register is at certain offset
> from the base, busy bit and new_reg_req bit are at different bits
> of the register.
> 
> To avoid duplicating these variables across phy cfg and driver data,
> create a per-SoC struct that would hold them and with that add the
> default rtd_phy_reg_desc to which all RTD SoCs driver data will
> point towards.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



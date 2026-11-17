Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877501;
	b=FN9KNrZSqB4sxpabDNhKsky1AN/PKySvle6KwT0Ip+sH028NwFnkX4YPeWcyYLARzRkr
	 zap46SgylmqG2VnIK/s5cmbwAx/Ic3GhOwsNqqptz9mh8GPJqbaKO1nXpK37iiDJkY5a3
	 wmiWjuOI5TDODxRCkfRu3a9OSEPF43BZVRPqpryXFrWZLcIcLpIj5tm8VF5y/DH4CryQu
	 Jc1+2kmN9TE5XzMXtpgJvcKyLlRPv1653KWMmTQT5J5EBuvSkUhvYrtEx5oeTQQ4mH86c
	 rZAgGL6CP042iBeepzWm6oXk2oCtezJSp7aV9p03ekFLgIWgfmHZFN9P/COQlaHKihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877501;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hv5OpUXJ8Td2azj7EPpFedmZm2rju9Qen34nDnPqcUw=;
	b=fmNsHYMDgK4gyaOsFqsQ1bCInhNc/8gYZlBtyWYD3t9B9nWpXZyW/+8ka40Kopo617/p
	 OQkrXSbSd/mFpMbZLXdK9yC8Odz7kx6F+agCV2OSJQ9Y1UE6vfT5ao0znuR4W145scgax
	 NZcigoyQUrIyvMqMiIrf6ThCnN8H9m5AMpES3s3x55K7t/DOpvRycUaII13b9cdAGS1uN
	 7ix+ZcDv4xra0JRnr8wo2zYufiyQ4uA5ksev6qw4usU6GsKZPaCnQ3pnjQ63QOWOJc1v1
	 w6TS7xh9QPW0klJ4fo5JmpOaEDq9b+nQkR6Vl2xVxFNHe6Ua6a9FbPP4w4HYyNUqdiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtrH4sTg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725E606A31C;
	Tue, 17 Nov 2026 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtrH4sTg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E051F000C4;
	Tue, 17 Nov 2026 01:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877501;
	bh=Hv5OpUXJ8Td2azj7EPpFedmZm2rju9Qen34nDnPqcUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PtrH4sTgKMkzdfXalR+b6g+cFnq7mQG12auM6jrdJkWebxQngRGJxbeK+axtaLrbm
	 CJ9cN+ystSJZbJLVJWAbu9MNfBhrkqnZp7Lr7nx+5dv7x7I9d2JNrgDcjQLrLkEDKM
	 0QmjBR3XHFZcmX+ZBajpcVYdLt3Qzl8bQuYUaKK7n0faIadP7sPdmZ2NLjqq+/wpiO
	 f76IiAAgv9sthHz38mYAaScWm9fv1nZEKJaqXXvw/rteFZqrWQtQUmfWv5yxRTOPSj
	 Yj3GVr8ezFdAK5h926LcZ3+F6Pj3rAipTP61miJCRSK70AfM7Vdnbp99NEBLxg7dK7
	 YKWo8ySkfYkvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Mon, 16 Nov 2026 19:04:40 -0600
Message-ID: <179487749343.432567.13541570711019740603.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
References: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
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


On Fri, 13 Nov 2026 10:38:47 +0100, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.

Applied, thanks!

[1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
      commit: 449044f26c8be9d2bc2450b6446a89de46fd511e
[2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines
      commit: d8005dd04efc687ded8a8cd45964c8738910a34f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

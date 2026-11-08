Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169416;
	b=ftzxd40udlCYPaq0pASK31UyFSXOGZlN0z3uVtHlTsA8HYVfDKt3E6pIk6G9L5S8u7+j
	 Uqk2IrhnKqZM7D18PivI3M/fOvQC0LcZKI+Xer3JDljwNLWr5J828tQazgKyPyElKNt5o
	 O+FT+jifx7XVNE1kE44Fs/qQ4s0VmGAoTo8qPB3zJZcP/LO12zINpKILklLqb/RMa2Zh3
	 iMIskjDsmXWs9/GNdJJRavklXM9auU5zeFCcC8/0D12R7XzAZb7XlFkozbMA6aYl+Fj2w
	 70+bIDV5MNhV0hHeftXOXXo+qtBoaZwNWLHeo6G66+qIbDZ4XKyhcxFLrvK/IRM+eOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169416;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lfQc8iXIa3Ze3No286j125Gsum0OmdmIGicz87DnSqg=;
	b=0s1ox8gq5FAQC55DNIdq/6nyCilCeHXemUHjCZ+KB6XR6jEnL6+5MSnWvpbyGMIrsvnL
	 zXXYZPmzHdeb9UW5v7ObKTEAfoHqDoPMKTYC06DndwZe6gqApcXQOmc4y6A8iYvntTdVa
	 BdelZW/tgn2j6EFBC598UQj7UjU0E5c9oXeVOjPUSA6W9gPZ+V4l7rLysc7XZ7KpSPBcg
	 H1w5ZtiMVimg9lqs7m4ARF9JiFNY5AXl1Ay4I9J/NgdG3SAF/DwT5rcMwX5FbfjIuKXO1
	 wMVOSqNRPmEaMG+P+IR5HcQju2UVNfv0JazATN1NWmQlNh/c+Hwf+Vmjy4yZkuQwrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9+FzKPZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A247607298E;
	Sun,  8 Nov 2026 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9+FzKPZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A85D1F008A4;
	Sun,  8 Nov 2026 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169416;
	bh=lfQc8iXIa3Ze3No286j125Gsum0OmdmIGicz87DnSqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U9+FzKPZ6TBQ8NazibwJOXhJGZKUF67A16k9j4TOdCis92iyRVxdbUs3wZaEujBw0
	 BoI9oRCTl8K153zxua1133lEcfIvd2Yr3pD7rYbOsZA8ofysy4g59RN6/MppBqRwIM
	 xAdcaz35TUmEg8MjdgsM0QrrltnPydY0xGhm7Z3iSVS+z5SNFTJY62vnTrg69MwIU+
	 C7MavKHVncICtpwYheK01AgM5OoVa5V2zKFGCFnME2BZ7V7EsodX15zEz/qlz/UZ4L
	 0xcRJXV8A9ko6B8Vq8Z3JUAipxEmdvlYZ5c3lrqu2x3/ofZM6Ku7AGClvl/2xiigv6
	 HKvUQ4jLG7n6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Mark USB controllers as dma-coherent
Date: Sun,  8 Nov 2026 14:20:20 -0600
Message-ID: <179416929518.628393.10940217407625956966.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
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


On Fri, 30 Oct 2026 00:03:37 +0530, Krishna Kurapati wrote:
> The USB controllers on some platforms are DMA coherent but that property
> is not marked in DT. Fix it up.
> 
> This series has only been compile tested.

Applied, thanks!

[1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA coherent
      commit: 8c777d79260a946b9a7ebbea865d40e49f59b7c0
[2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA coherent
      commit: cab6abc29dcdf59c244050bda3d66aaa2b249292
[3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA coherent
      commit: 81e5244cb994a6d34038fc7aadcace59bfaae455
[4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA coherent
      commit: cd5348659104430cc8372e7bf42127a88d5e69d0
[5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA coherent
      commit: 2e0340fe0d5cb3bb55cae62c3571320aaaec8e68
[6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA coherent
      commit: ceab259867f89a97f12b247a00ed1c306a175575

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EE03EC802;
	Tue, 29 Sep 2026 03:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651808; cv=none; b=tlXCGNvF8l7mE7uwORaXYLkqQBNHAr8uXGAEus1eQPNPZdZX1rV3DX2NYq5RTZ85EtC/FvBYMPxAw2fgWXD+l+6B7+FQLnS6vSX3G975QG3eF0/d6/wsiIBKtGa9kyhXwyHveubnfNo/JdiMTL9D8K9IDz/RebrMnVPkKAq2wk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651808; c=relaxed/simple;
	bh=UVEjJMDIMivrck/Ft9CoYP4oUAv6802A2m2IWriBk6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCQc6XRdwQrvOoKMC3dVWGoQs5PTptXowPebmeHXtroA3JPmsNo5O5H4VfinIQ4sa1SCO8edDjSH/qaBAKgeDpXaFFCkwhB9JUzvfoe1Qi02sutM7S4dXxNxn3C/AmjfyOGaZ2tqPhDkc/RsEjL9nkp4HAZHA0bH3i/Nkl2sbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AS3pRv5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AS3pRv5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B3F1F0089A;
	Tue, 29 Sep 2026 03:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651800;
	bh=JObLTQDXsv/1FdQ+Gl6sGSAa4zNGyKjj1tl9V+Oq6YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AS3pRv5Mb8d2/GJbaYHs3ur81Ar95Fku+K3yLckhdCdAB9RwmKSJkZo24kmEaIGTw
	 WF81JucSFAgg+rc8q2/olAh/kVTycZ48XBKW8ztUkIS0miE02xfrvw6N1gAqliDqAO
	 cU67fD4ogtiH5a2k7cjg9ups7k9SpqeiylWNC3GiGCgj240/bHZMuY3t2tFlWjLJtx
	 PCMEg0dg6kofdoS0D2HOjcQVKoOKwlRevMsNexJTPLPUxRlPMBlSfFIhwgZmSxrYMx
	 k9tyQAnvwMNMGL4UQMIZTS29g7BneLm2QETOyRuBC3om+tmlux1FVOLg+1t5/KYSiy
	 3KGsC6TD+0cLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Hansson <newbyte@postmarketos.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Vitalii Skorkin <nikroksm@mail.ru>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung: add initial device tree for SM7125 Samsung platform
Date: Mon, 28 Sep 2026 22:15:25 -0500
Message-ID: <179065170983.2673486.1587443995547415765.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Sep 2026 15:27:20 +0300, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
> (atoll) platform. This patch series introduces support for SM7125
> Samsung devices with the following components enabled:
> - Framebuffer
> - GPIO keys
> - Hall sensor
> - Vibrator
> - Regulators
> - Reset input
> - Real-time clock
> - SD card
> - UFS
> - USB
> Along with that, SM7125 was affected by a hang when launching SHM
> bridge. A similar issue was reported on a similar chipset:
> https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
> Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      commit: 0f14172198733b780f22d546516ccf8a7ed77733
[2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
      commit: 6320b4c31b70a39a06de27a8019a45632beef32a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

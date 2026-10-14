Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E93C0621;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013526; cv=none; b=SIhXr8S67lo9uhvkW3e3sxeBpOBKEhAtuaag2I1CEAhOuxzceyJPgsyZkZi4tQGeAsa7TEOk0YnHmuoD27tMTGKKlS/SPmoIjiL3FYI8zu9DO90i8xTo4KEcK3MQ4U3dDfkDnI/F8gXdwaCbQXDmiKMcMd1jiosbewHEUxciuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013526; c=relaxed/simple;
	bh=Mb7sbWbMfHESa0aAXF7BdF35M8lFzlOgXSETY1QlwaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pA/n9l54ufgSZDLTOuUEtIPhE2ahDWZ7mSHygr/N6N1G0iQGoqysu05S+VyoMFKCrgb70LABIMMZa+2BDmIVJUdDr6RKp7VWcXiz6ZFw2d7Pt2ydA4Uct67zfAmOYLI5+mzx6rBORjSErOpBniPlELUTB20VcIzHdksfxZVN018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lH4XGLpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lH4XGLpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BE61F000C7;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=sU9N9t+rSJbdzfZ3EGowiDCPXCTLK+Yw+P9GxmRYz1g=;
	h=From:Subject:Date:To:Cc;
	b=lH4XGLptaQqNsFgDjcW/GtR5HeupPmlqTRIhQZ/oK7A517/GBqdkroZNLZ9SGkD4U
	 yZ6ewNhlbTjyttPD3qhRbwdHoHRuVMkAubxgG7zOsz9N9swBy1FYt9czSqi8/Rsah3
	 MFh5eCEG6Xu8KFw8zFwfG18LML4FNGTqDAWFBdMoqaKI1E9mPtRVGsaLU+C1NYwLD2
	 0ucp+hF5Akv951WlgkYh9tX9YaTVbSVQkPF61FfJCzasiPnoKPeClQ790htjXOjfq8
	 8/pQkcAMYI11DoIAqajqoVtxPhp+eYDt9igSb7Xro1UlkJVVFLuimpQ8p6KTKmx4q4
	 /TgRzxDhSeHUA==
Received: by venus (Postfix, from userid 1000)
	id 68603180A50; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/4] Add DP AltMode VDO definitions for DT usage
Date: Wed, 14 Oct 2026 23:31:48 +0200
Message-Id: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q6CMAyF4VchvbbJtggGX8V4UWjBEh1kHcaE8
 O5Oufxycv4NTJKKwbXaIMlbTedY4E8V9A+Ko6ByMQQXGu+8Q16Qnvk1syBnZBk0imEgqqk9d5d
 mqKF8l1SGz797ux+2tZukz78Y7PsXRUYHJnkAAAA=
X-Change-ID: 20261010-dp-altmode-dt-defines-2aa5a94b76f5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Mb7sbWbMfHESa0aAXF7BdF35M8lFzlOgXSETY1QlwaE=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TQGcp6wF8P8bq+yUhm+bV9dkEdDnyOEi6TJ
 0TsUKTp+aaJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00AAKCRDY7tfzyDv6
 mmQWD/0ZLmcrm2qIQ9ZwFK8Gv/BjgvkaCFGmaFJSQFBj0SQj6/lUOFBMauA0MvE6ZijzvCpoyoE
 azqANY5G7eMKlZ106ByVaQQ1BRTBpNc2OzCFXIP5/7bfkHmx1SIAhAI8YLn+ktmIhHgjTQ6GMQ+
 afcbVr0ffREqfRNEJa6bkB6Q0SslaeHR9eHcjmN8gWJnKOFvUKlNxUTrQbABmMD0bJuRYnmajjU
 oFX3d7cknM7xSa9hTRvKBUuv/t8cj4ZdMtEvWD529oYYvzn3oC3SjJMztPh0HIm7L51MRXJlQCq
 oDyMl2yjdXacK0GnPl6ntPpVRuEot3qewQgqjjWoFN4CzmKsHlAQpegNnCqIObc93PDAhIkntAw
 JLhUanvzkKzdAuD1DrEVgQ6JdiCVB4mnu+zZhwx7EI4rzVwtYIV2EUJAkd5zBH4TaqvLT0XIAbU
 7Vev4VT4rdaf/Hw43Wf12nRvMSkwuBwVSbTGgYAXjvCqcZ/Ma9Yf+aJTVRHyzbTqx75p8/F0KFL
 9ezMoyhf1QDnAUjV4jAm0DiYQeOezqEqO8i0B5Fn4OOeu1jc74lnC53M1J1lLyoc3oQCRJuIyZW
 Ny6ZiKJQs1n3IqSnmVi3tVbvGB988CwipdVPqw/M/NkN+pUj9Z5/ZhnjiqcNMqfqHzSPdqAFOO3
 bLviFcfj1uoO8Kg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Make DP AltMode devicetree entries more readable by adding a few
defines. This hopefully helps to correctly describe the supported
DP AltMode when boards are being upstreamed. Apparently right now
all upstream boards with DP AltMode *should* have set their VDO to
0x00001c46, which means that they can output DP1.4 with C, D or E
pin mapping on a receptacle that also has functional USB 2.

The patch series is based on current master.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (4):
      dt-bindings: connector: Add DP AltMode VDO definitions
      arm64: dts: rockchip: Use DP AltMode defines
      arm64: dts: mediatek: Use DP AltMode defines
      arm64: dts: qcom: Use DP AltMode defines

 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  8 ++-
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 10 +++-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  8 ++-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  9 +++-
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  8 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  8 ++-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  8 ++-
 include/dt-bindings/usb/pd.h                       | 58 ++++++++++++++++++++++
 10 files changed, 115 insertions(+), 18 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261010-dp-altmode-dt-defines-2aa5a94b76f5

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


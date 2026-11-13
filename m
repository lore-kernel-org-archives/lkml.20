Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=FmJHsDbXf8823LFfr0oiRcdwqu6Gm9FdouTFxzqVnKNC4oEDcv9VlQj0wfikrjYclr18
	 znYMoQtouoFlKH0Q4qpA4urEX83CeM0j3KjVVIaTqf8WWiIAcQkAWFrd//p428c6ONGGr
	 viwsRn8kom+nbi9DnL4FnNBJ+tgq6DpKWt1jKE4wDgBk+hA3+kubNx93S5zfM7HcGIn5D
	 Ueg3hpGGLXBx45Q0b42viao2JxPU5fSally2ihWGFE2rcKbNJsLDE8552hWZ4t/Y9fkMC
	 kzwLXFEekWtLCuLMKSdjZ+fGCXyPamfQPm8CqKm7ziP47TsmROzICbULZWOvxtTU+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=;
	b=pQd8vy9NdLhEE55C+QTmEUocMuIh3HmQrUeU5wJkNFv5RIwRKLAFi6Gn3cr1jl3uQ+gX
	 p2ga202VYld1UIKq/DSfpSJG6HMsIYst+OJUdXf1t39n+djCxwaIY76Wu3Ewv7ChFdGo8
	 bomk4xyia3z/g1dGxBJjMnx9lTmSUYzE+FuJU0LiqZTtz/DEhLrLR9lMCwj7/znQWoBKd
	 XGze8nG8aUsgnyiGBrEN/CEak9idQB9pkfr1xsRJTEAcdNE6kJGv6l9Ia9e5B0f5ZOf8V
	 ZiDyqjEJ7ENRPzWY+tmITKuiPfIXgbfP2BjJmQtO95pwW8y2cgfhmj//abs4WkAE34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svm3xnWM;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A923606CDE8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A923606CDE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svm3xnWM
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-717028b412bso446491eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588189; x=1795192989; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=;
        b=Svm3xnWM6oVg4F63ED7+W+VO20wpg+uXDuSLtf0+oUnidrGJW17Y8fBd8+EqFWCtnv
         mZQXpp78Iah3LKq7Et0BhZ1prP/2jtLaZYafKtD4TJejsRdhcmGtGoyOCIDN6R1Yr6Jq
         69a9ePhaP074EzjacAlSNTASJFcv6prbfxflZgtG+bAn/PTf4Umf/8xHdgd4FERLF/IK
         Y9rLmLmYTG+5kj1nOpeOfKJtzfCb8moToc7Qp7bmBdMfxklBp0L3s2lta7Y6pWRB1tp+
         LkjfOhWLqTxtspLb4d1EP8S9n0RoeetoLwHxCRSxQTyqzdQ2B8CBztVD/MnAYmaizl8V
         t+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588189; x=1795192989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=;
        b=a7eGhVb3fQ7BjJW82T+tphsLP1cNGl9T3iwgvqA7+e2a6H4aIb1BevY+zPUrzk8b4g
         1fPcgVm4TXinbnkJWFIwoVO5P9rbUrnbAmX3Ee+zvYOJOFQljfEToQfpcvFSdVDtzZH9
         JjG47gro+TlcKZCt+L5IRJIT4s8QOOoC5tA2a97xwo1cg8+X+7q76IhbePjFTTGKD0NO
         H/2peJkHmUGKsAkih9NI2jI7QBMOYKhBEj9jVFZ8cYjaFhdMxoqC64jroDcPK3NhcuPB
         vZmlYsKZC4ssteBbXI00EbftPltycaZ+UlZfmyWhNn0ehJgh7zJAILM4exkSakO+2VmW
         5jAA==
X-Forwarded-Encrypted: i=1; AL+hErEPpBiMB4+WB64bdo0ucsyT+LAUkyMSm+uu7bLF8cEKlq07iGM0hV4bQEPbWD8+W23lv9vgux/7Nx9saps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hdo44Lcs65e1nk27jFZtPpLI2IH38gIqsIziv0+HHNkk58WyC
	uJ2RLOlazKzd09W6dkBf1xwamSuayyCknM1Tk5umr3eInBzwzIUfkhRc
X-Gm-Gg: AYBFou10zk/vqjEE0GFbFjpYrP3YRwpVPdQ4KuqWfxqxAF2X6zqgbhVv2zye2vGUjPA
	FGYf2dP910XHr2fJ6FcmVNxs+e1s7fQLxT3ITT2a8fi1HKqocbRPRsMHxho1203QjzD/XDPAPPz
	DfcFYTtosNJQCHtciexKH81bcn6yA/lCgnOvU4NuK9Yi7AT9QhEs0KZ9mWx9inmXlpo9PAT3vd/
	rRNF/7vQsiYcKh4bHV28btKoLIVZYSuLocfQN7zsP2PFm/7aQOgsTeao/e4GonEQL44xCpnBPgZ
	rCPotISUo1/5slkwOhYGe7t1WbCU/NiTWcf265pIx3ir6PsWrJ1Y6SmitjyFacTRsplyLONIq7R
	xw9HYkO3XTgfjhl/P8NJif+Qu0FhvjSRCDN15EwCQTxxlY9YWyafCLti57ywmQgsEVHaInGiWn8
	EezHChytspFr47LclFyEcUWX0vKKqAmEynVZbvdcSTXjJrfyqamn9IsLYVyc/+E8oQV4Eet2q2N
	uXFoQrOH19sGswZTnpSlstVz9nUm8R0sjXCC4hLt2NZyR4xD80vMN9lcI/kyS8d7XMOyZRcmEvm
	9UzBnTtTvcwyCJi8YntvQvs/X2mCEBaLjFKWlTtWGmwf8UKMmt1g2BM3tRADImq8/qm55xSVzUu
	QeY9VVNYkl6UcmZxv6Jk=
X-Received: by 2002:a05:6820:3382:20b0:70d:a53e:845 with SMTP id 006d021491bc7-71ab4fbc207mr1421060eaf.17.1794588188901;
        Fri, 13 Nov 2026 08:43:08 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:08 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: mediatek: Add the Amazon Fire HD 10
 (2017)
Date: Fri, 13 Nov 2026 10:42:43 -0600
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43QPW7EIBAF4Ksg6iXixwabKveIthhg7EUK9gawt
 dmV7x7ZLlJFSjmv+d6bFy2YIxZqyYtmXGOJ80QtkRdC/Q2mEVkM1BIqudSCy4ZllxdkZcEnW+6
 lZoQUp5FBguc8nXmohQmvjTPCBGUUvRB6zzjExwF9XM8749cSS6xn+MtZsmO8F39iqWrVGwbLA
 4JnLQopOy5b33K7trvmoCDzc0qxWmIa0yJ0ru200E4pzxsYXG+0H/jgAEIfglaDo3uvWyx1zt/
 HP1ZxFDumCyH+O30VjDNjXGN8QDBcvo8J4uebnxO9btv2AwmaHLp0AQAA
X-Change-ID: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=3912;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=WylSHm4dzrdtVgGa+mGeS6ky2xLAeM7GIvqZAq6Kk08=;
 b=nBxkN4N0lqElqm29Lbz4sWMFh/t7ntJ5rI6el+UpB4ylFVvJTBrByCx3qtBoZMZGo8JOaIrDj
 UD1c/lyd9LbC+XyDdVqVaPXff+mVVwFC1EAlVeQuqGMZynvBNWDKrMi
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patch 1 adds the board's compatible, patch 2 the SoC's keypad controller
to mt8173.dtsi, and patch 3 the board, with:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power and volume keys
- CPU frequency scaling and the skin thermistors
- The battery thermistor, on the PMIC AUXADC

The keypad and MT6397 AUXADC bindings are applied for 7.5: the keypad
binding [1] is in input (patches 2 and 3), and the AUXADC binding [2] is
in IIO (patch 3).

The board needs a PSCI 1.0 firmware. The stock BL31 implements PSCI 0.2,
and its CPU_ON never powers on a secondary core, so with this device tree
the stock firmware ends in a watchdog reset loop. On this board it runs
TF-A's mt8173 port as BL31, started from the stock preloader by a small
loader that hands it its parameters, with U-Boot as BL33.

On an upstream kernel the panel also needs the DSI command mode fix [3],
which is reviewed. If the bootloader leaves the display scanning out, as
the stock one does, the board also needs the MediaTek power domain fix
[4]. Without it a probe deferral of the power controller turns the
display's domain off and on again under the live scanout, and the board
hangs.

Tested on the board, booting this device tree on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, checked on top of [1] and [2]; the one
warning, on mmsys's assigned-clocks, comes from mt8173.dtsi, so every
MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/
[5] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Add the board in one patch. The volume keys and the PMIC AUXADC are no
  longer separate patches, and the keypad node comes before the board
  (Krzysztof)
- Don't disable the VPU, the video codecs, and the MDP. They work on this
  board with upstream TF-A and the MDP fix [5]
- Collect Krzysztof's Acked-by on the binding
- Link to v1: https://lore.kernel.org/r/20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com

---
Ryan Brue (3):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: Add MT8173 Amazon suez

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 679 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 691 insertions(+)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


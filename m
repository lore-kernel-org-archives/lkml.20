Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421206;
	b=1faj0/+hFZ0OfMygq79wW0hlkryPDafEhXf3tSnUL61rUl//GihiKoSYAz7o5eCXquk7
	 ouEOWz0STjKc4khsK3VBLQ+jWdvTAnYAwjyNhf0FeVs2i6tzrZSbPneRaIqx87Wr5AZzy
	 fnvXx1XikdidigGjEJb2fMNymiOBiKUYHBtGdqORc9YiSGQQEwSgDCMK6h1h9qovoMYD3
	 GOUcVKiDHF7yUO0a+VwW/R9IFSwcXjHMImq4R3hrwHitCEI17mlGF33faTciE1P4HipOm
	 UTqW7MXcITPKujgQkQfchBb2DNZBbxG7trzfczn19cEim5OKRzg7/v+qn/Do1e1fzEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
	b=SHPFaclU819Bsip+ZOCy2LR4O9dux+Uof5t/JGfyDlSFPtV1+IGGexrqX22ydCVnOC9Q
	 IXVil4BcobFbuAzdM4nvbJ07jI6LCMcsF7MKr78fNaHplhHBG2lQa1BGtOgcEQxOfK15s
	 aHMsc1AL/oN+8nk01BC5E/xljOJKWZPNuQi2rytrc+SKdXO01qcb45h/b3Nqgc1qIyF4u
	 b+RivrgLjsd48SgrrJzvguBO7mVRnZLyOOcWNYh9EZLndpr1SSksx4wlRvNZfXZtRqAJr
	 kzSD7At/iCJLNOk/ZttvikbzThxlprIZxBHx16zxYzPOKOJM4iazQuyABziaoDgsljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWsMVuFW;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64D60A3820
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE64D60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWsMVuFW
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so1582666a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421205; x=1795026005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=RWsMVuFWseUIz3Gso690tUTrCRDyyoMu1Wh5jOE2imrrXjUYIjXiDJJRKRtX5Tbc7D
         oS942KU6f/hLQ98frBPOfLE4ZUvl3tG9+tWYuNnJ6D+GShC4Pd0oJ8/j0FAfzin8goCI
         D/Zttk5j8Ee/d10GBAm2kpkbwj52wgXWv9AsaDgxnvKnm51Xem0d7US09hK+tOa0G6Uz
         /XyMKIBc1ZvKC84t8HRdSFxYQRsESH3iWXWQ08kExdwOzS1etncNvD8N7xZjXZ2m33gq
         mMrMUlV6A+w4DQH35pWx3tQImrKY8pCXoJwP48JiepKDWeMgettGJEgjbmNxHiJAqIH9
         jdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421205; x=1795026005;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=ukrTC77GDGhNVlMKExqCL2PeiT70DdrmWhrmw9Cnpgc5yiZuFuG730Ut50+KL89Ue9
         IFSjsTIchONkhFvoAFK8kUb/jX2Z6NdV+1TQw+0bJ4Ca89QIlnt1L/NkIYdRd1DjQfuu
         nSooq4gEIc4jU9t42rWR4VNxaGwUs5knvGBbsTESkmb+zn2sWKn56gV9IXtC8VA0zd+H
         jpk3BxEI/CIcYfl+MSCQ+eUeYNr4758anK8Vusthq+UdOizczseBrNpmeE5aLa74rlD+
         DLkiN23UI69+8BQd74gFpMuI35IJb6e9+a+3qLLJm09g5OBVyX2+o83ghvLmvxwPENnq
         JotQ==
X-Forwarded-Encrypted: i=1; AL+hErFpM7gbM5L+0cgUXYGmUtCKt2Ec3eTmbw8ajLcDq+Bncnuxcv5kfYDczGMMppB7zaX8jzlLFZeEPe89L1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/huLnOusmUObtugHOn8Ksv17KvBfklJowa9D61sqjpgmvdlvwe
	Cx38gYrz9FNc30VH4Io0CXpXdvR3XF1QT1TDkLmqhXCcNzWIZcs4SMhU
X-Gm-Gg: AYBFou0EwdVBuYSXQwjkmuZO1SuNEca13/1G9WZeswlSuyMIWVYKspkmj+k/fchBZ0D
	up6eAxY0RyNDv7aNrPEqFlQRZAJlD2JNV+NAGDiF6Gmt/U0/87ZZVzKnJXB87DhpyRfjS3zUwPT
	/9y75r4+Dt3KiIGQD2x7dQoHFj2PFodxWfc6PFQPWyiwG62QOXsgN+8B2x/hM1FzVoC2hOvfZHj
	AX9C2cVPksiKe2/t70uH+J9Wqg8E30N5teP7wDHeYFeHPkTkXCIaCYst39QpcOzx6Mhsy5lKdGt
	Hen/MANLYl+7bP5lTG5JEHplHoaV17lPAVRhTryemWwsCUXD98tE76OsYl8JOrNPoh8L+JPMeC+
	pJPKmxl2YukqXl1YuUizby5I4b1MSZKpeo75CsiWHtKq8HjeAC76nID7+A8vL2cL8Ak316Q9co7
	cxsiov433jhZ05P4SUKK20zqSbky8BZdWTys0WnJjb3rHHUSE8sl+ebGuJvN4TRybcKl8TdX8NO
	BGDhRKSpaue/LiDhhy89qe2Zud6movHr2My3IO3vhijnsrwCvpuHn7OUTcdy154LdU7DNlqhouu
	E3nKWFkmpiRiAq5TK4JuZuAY8ixnVsMxGs/Ii5IoIL5uKebTuOjdReZ4TWlgC1ai3iiy5+zhV8p
	0gXcRwzeBKcGZERSxUak=
X-Received: by 2002:a05:6830:230c:b0:821:c75e:5309 with SMTP id 46e09a7af769-860f2824528mr4052098a34.7.1794421199944;
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/5] arm64: dts: mediatek: Add the Amazon Fire HD 10 (2017)
Date: Wed, 11 Nov 2026 12:19:49 -0600
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XNOQ7CMBBA0atYUzPIdhaDr4JSOM4AUzgBL1EUx
 N1RSEFF+X/zXpAoMiWw4gWRZk48jWCFOgjwdzfeCHkAK0BL3Sqpa4x9LISp0IrlkXIkF3i8oQt
 uncb9Dzmh8q3pjTJDZSo4CHhEuvLyhS7d3pGehRPnff44KzZMntVfLOS2Oht0ZXGDx4aU1iepG
 99IOzeb1rtE6KcQOFsxm2ON0Wvo3u8PINOci/AAAAA=
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=3441;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JY/ZMokU8A01a1ECQeqMylLF/hWf9QwtOhovwgrHl/E=;
 b=yxUBcqEPnePvIAwjsS0Wu2SVXsFmjFxaGEtbfTmm8jhed19s+uQENEkUxREo6Yd4B5zk5bx+R
 s/e+p1ybKXTARwhbGECLRC42nkc4NZ+EFC7VSvDb9/DeY9c1U2jbR4I
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patches 1 and 2 add the board with what upstream bindings already describe:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power key
- CPU frequency scaling and the skin thermistors

Patches 3 to 5 add the keypad and the PMIC AUXADC, whose bindings are
applied for 7.5. The keypad binding [1] is in input for 3 and 4, and the
MT6397 AUXADC binding [2] is in IIO for 5.

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

Tested on the board, booting these device trees on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, with patches 3 to 5 checked on top of [1]
and [2]; the one warning, on mmsys's assigned-clocks, comes from
mt8173.dtsi, so every MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (5):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: mt8173-amazon-suez: Enable the volume keys
      arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC AUXADC

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 702 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 714 insertions(+)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


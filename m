Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423859;
	b=ZEdH4wr/pZa17lKd562agoZB+rb3PPmcFNjPvvo9T7WdpNrSgs9EFLwwLTU1NzAdSkai
	 63mKqI37LFl25zY/ssrN93oxtlafQxz98LIi6gn0tKm4B4/S8NUhVmVJcOhJ87HjtQ/Z/
	 U6DevLjq4hUzEjRPs5LILDIprp9WYdIcHSoTEj1lAYme76El1pOB07uYbppSfjwDy4eW2
	 8RzV4bQlmKBnhbCcXs0XWzttnl4dD7lr4WoRo/xqkEz5YA3g900ROHjCoaowstdxsH8oP
	 ejxRL9mExE/966RuCWYN2QRYq7FSHBsmSy3jShXPTxpV6Rv3Q7OElecHpkAh7m5sd3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
	b=A9zda7jEBHeUTyybH8sHUqXJ2bQckFAdEnq/9caYOhpnBvlY5wZKBm+PF2AjfPk1MYf2
	 qJx4YaAQ0p2phNi1rl1G9rNTJJVK1TODFeEz17nfGbnr6i2F28s6aCZ1YYashUhApnhJ+
	 e12XRrhsFccXxg+sgxIZY1FXt6/wH5eVrgVy70tx4toVwBSSUr+lauoWo7fXWCfq3XPqT
	 KG0+Ikjy/EtAw7xFn7JY7wMJamjBKlQXwFXw9PMs4utAcpYIBNUaWVFDdvsXJ+xB/rDtg
	 mP6zSmewUSmNwM9KIpPjxbakqfdvy9SdPBj/w22IJUy7IUIf5TvIeTPZnI6QE0cF9Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw3UQb+T;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A1B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A1B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw3UQb+T
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2605000a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423858; x=1795028658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=cw3UQb+Td18Yt42LSfsmibmep9aQiJUcoH3dq0WgLgPBAzY6WnS99p2o0JLczQlS0J
         zHX8wvqHnMDgBWZmaxHTVtXm0TSAd8xkt5yiqYc2diTvfw9gzgJ+uZVcWbcEOW3KWo82
         HIAUWZTjj9nbTKfzlAKEGw4sUjtPqvx8VqdsDbkaqiITji/YYh4mZbZLh0Mti1oIw4bA
         csAJ7IdE/5C7MP1+SPxTlzwHGD9jkBte1ASIRAyAYODuKOmefK1InKsJQzAIQNJDNWvX
         pgB/bmIijTcWW8enNLiFS6qtlxAnGGOgv6bz29j3bAwZxsJOzZR5RSYibdr7aj9rwnY0
         ktBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423858; x=1795028658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=M7yk/nCvEqoX6UqlRyvYACXJOgvsxsTrgeigjB0NMZSfEzAbFcAc1LQqrg9SjKWQir
         AroN/NszjN97w9WUaJU4zR+AXi4TlGiSQYbVH1a1zXrL8jd5fn7br1mCY0LYWRjo/3bI
         trzdVuM0a4SInXJ3Al36ByOXMf5O+PXjDFbjTJKlU/Z2vWJOqS0E9n/pXJI+MR8bfb6u
         LM3uXSisR4GhiVtmp8cE3+NJxwMjq24hmI/MGPZ9KXVA09MgUI7My6a/hJi86zNsrc+D
         UvhNOwKxUWjUB3IVEoosUqT5zoSRxglAq6H3GxfA4GJ6jkxua84h9h7X9HAkWlNX+fun
         QS6A==
X-Forwarded-Encrypted: i=1; AL+hErE7K4hh7zgWX6UQjb/Cpzhpaqp0XyN/SWf+0srmO8cNvcomTRyGZVJXOV+t8cMQfznYTffiIj01qvca6+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sg3B7M+xF08hWQqjgZAvUabDWOKnxSP1QXHeFbpb5JE07fGm/
	dZuDa0AwoWuuz5The6KuoaZcqPkIkT1Bgz2rkQybhAmZPvwK2nDwriTp
X-Gm-Gg: AYBFou0QTvfYD+h2yZk2NQvTscibwsKmQbVyVJZoZmtlthvhMo9XBw54e2PnovX+tRr
	FS/wJ70W0PC0oPxj9nvFb0wG8PSLC9QqhBFIxKRMxkvVBIYXtLHg5THTrTIaN2LGbDyk1UGV0tA
	xiv9AbwSDgpi5+rBStuMcL/Qv23x1cM1jByhG6dgVfzyAvpBrpKj7aA8wo7lj7nmH10ljXIVvTG
	iSzK1HQIi0yE4NquDIoAoyrC/+Wohw7cwK+GYMdAXdviHq89SWN+8BFpSUU8CoWfR3FPmTOLZvh
	iR6UDGZU5gDjUt7J6VGM5q0bBuCkmCZPuDkMiY85qSxzSxikx9+SjAy9oaBiGxh7eAaNc8Mtp3X
	7orf8LMAFnRkmOc4emK2tJ/iEFqK8r1Xxp8/xIiNXXXPJyzGU7jrEcKC0ogP4fRpaVnLUgcioFR
	cMb9sucmCneaG0UxcC4yCUkjKXY+otuXtZTrj9yT13DH5Wb/UVc265D5OSxfz0tPRggAzGiy2XW
	rLs2fUWhnWjKfzAKR/bZ9L4x/8Aez9/CwA4O84eC3o//GeyEIBc0JzX8ggFgIDQK9j9ck+Z3GIs
	BZ8d5rvhOt69E5SSGFckqSlnIshMhFFfRw==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3092987a91.17.1794423857979;
        Wed, 11 Nov 2026 11:04:17 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Wed, 11 Nov 2026 16:03:56 -0300
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIABy89GoC/x3MOwqAMAwA0KtIZgO2SkGvIg5RUw34o4GiFO9uc
 XzLS6AchBW6IkHgKCrnkWHLAqaVjoVR5mywlXXGVDWODUaLdNEmirLfDs/IYaNHkV0zeTKtm72
 BHFyBvdx/3g/v+wFShYHwbAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3193;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=sVz8tk9YnISmAo/N9+CFSdVkyiddkfKtwMakiw1SLiQ=;
 b=iPp0AI/CNJytJkCqQIgPV7xNs61v8TcBmtBWw+K1Uoo3T28/y54J1tqQNkUc+ZpeI1xvQtBp8
 d7H6Vw5IRyyDwnIc7j+fwu4AJ77hmdeIA+mh1XJ2ufCJZOi1z3BW9NU
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage. Additionally, this series adds
ready-to-use DTBs with HDMI enabled, combining the carrier board device
trees with the common imx-hdmi.dtso.

This series depends on another patch series and should be applied after it:

    - https://lore.kernel.org/imx/20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com/T/#t

    Adds the HDMI overlay common to i.MX SoCs, imx-hdmi.dtso. This is
    necessary to add the HDMI-enabled ready-to-use DTBs, and for the
    patches to apply cleanly.

Changes in v2:
  - Don't add the imx6q-apalis-hdmi.dtso overlay, and instead rely on
    the recently proposed common imx-hdmi.dtso.
  - Include 'tdx' in the display panel overlay names, to make it clear that
    these are Toradex products. Add 'v1' in the Toradex Capacitive Touch
    Display 10.1" LVDS display overlay, to make the product version explicit.
  - Link to v1: https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (7):
      ARM: dts: imx6q-apalis: Add ready-to-use DTBs with HDMI enabled
      ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
      ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile                 | 86 ++++++++++++++++++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso    | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso     | 17 +++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 +++++++++++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 86 ----------------------
 11 files changed, 335 insertions(+), 86 deletions(-)
---
base-commit: c260ba495ecd8dc5639be9a45a70cb56391078a6
change-id: 20261103-b4-v2-apalis-imx6-overlays-e64cfa196df1

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483563;
	b=DSj09/uFOwks/Q6p6vxg/DYXM7b0W0KCdocy/9pSUThzm8QHNyGQvkKhlAJpSZn+oeTv
	 +fpAXPEttsB1AuObz2OBoMsWOAwMlUdQXzxfe+7J3dSYE8GBJpKl32bzMBxvg2h4BHhqa
	 tloQeSAIF9398wRNXLNi+vuay93T2EzQwB0ltcwzQ2YdN9GD5fD2N0xQnRoQuYjN4YmIH
	 F7O2pQ47g2b/w4xA/ZUT4w/OyyKl2nzXMwPczZM3TEA3qNBFNDcP2u7ux0IcbEcNWEqs4
	 1X8bbj2UMFStoXXU5LXMPo1tNX0+nPZQNfjzHfXe4wylRGcqTkSLBINqIeaX3wPp0wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
	b=tlQ/NNLCB91tggeRUkWdcOOXR0fQxjy7zvFJjtBREUIFgSDQK385AnpY89W4PF6RmXdb
	 8vhsJLa2t83+2nfy7h3dclayID/EGtiiqh3pwhIbDFBfICKY03RXO9W90PTH/XymbY8g3
	 /xNzZjwjxAnFnTNtM3bNTaGIeHNMUtOt7o3Ny3sLMp7FRf1YNVQH+DNRbbTZbCidXrVR1
	 14dcllivRHydjJ4aAma6xK4QLa2CMUrJQ+xVXDhlLQLe7vWPL+PjrIUYsW6e1JkeIEsoJ
	 q0mUXDSU8eUELey6cl0KAP36/0lyFiLowf8L0281SMjrZNnqZ0iaq9h4DXcEpCefyog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42943606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42943606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8216010eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483562; x=1795088362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=ZQiQiMkQOMcVGamNhTE25y4QZhUr1Nzg+7k7wGWjxsMBIIbCY6AS57Y8BdbW9DIxFR
         nYAXRq9XpFzD4MQm7ApOAvu89hlhWk0j5OYGoTJUk/JFw7cmlJyCYcqO7jJ7CGUYajRC
         j7cKFW6RwAJGofo6DngGt7TCaSVIrrqiUAlqHVBRInPkWDzFm3Xv4GFEBuTnpGmGe9my
         mO4ylqh2Eh2UsGyqD8obdHISoPOVBNkDEGHNP/Y/W9N04KEzWHFW+JM5zEd3YOnnRq9D
         tPqAzJ6fORiWnvK1oQqaWm9QMsleWIu7ycLWcTvyNy0GiGQBGo0Y3R3S5MTTxK2UTnHu
         SXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483562; x=1795088362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=ms+0wN4PUac7k5oucUAex4NxmGwhwS4KiVR3rMXvzccCvdiYKbKgN41bNi18pgaSQV
         enb1U8gr2saDJ3ZZ/I7fVFu3tBiM28mnfUnTqbZgNUpVxtpnL+k+Bwem5dUcJjv2bsdT
         81t5g1z9/qRrUm9eDwvRu7BEQ2aDVqCaYGEpnKw8wgYKF/E2A0S0cochE/5CUFcae3jF
         af56H2QqyWu9Uv+dJWQLK9pwsHk/o/gR/ciSFVH4hbUu6ZhizVPuBafN+rkbkQSDAx9k
         25SpU4GXfbxq+o3mAsoakL16MD2RlOiY5BK4ud4BX/62uIrzRJMxbDLUthWCokhm/Sg5
         lOrg==
X-Forwarded-Encrypted: i=1; AL+hErFQs5hoOa+bHFo8DFtGpyO551vr9JbklWPDCMFfLh+kbV//mVlRJIhkfi3296pTZjjrMOeBvXHNSGmGN3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TfiHRycofOUMpS8fZwkt+f/sgFOdw+qr9tmrC9e3qYSSi06YQ
	4YWxD3R0BmNhFdJK2EQL/zBTV3J8wMHrIil7MLrKf3wUYvK113nv739k
X-Gm-Gg: AYBFou3ilMgwHLDG4l0V8/FPgRZZFCvuv2/lrDoIyiqysunc1XxgSmSjC/J6arBf1d+
	OR3kffje36CCvhFf7ccxixJ2r3lomeCkeqWD/cHMkB0KqKfGXI+cV4/gJJEoflhHshHboWPRr/q
	YkYTA2YrvWdZU6EMOD4FkD0LEVvJlr0fzg32aXM4dv8UNX+PqzkFm+EyhhrRsO1lJaWzUTcpHe1
	4YvAfTaw+Thvph+NHmwQryjjFElU3ixoSxRbarjpX781pYP0277JLn+w+2VITB3CuthzEUEjFml
	GBlCwmDjTlRqry10sLYOM+oZR3CirbkTyhpZHgZIgnBKmG/uBxItg9KYUWepXBtXUjBIy6i1UCq
	sISvm9Ya0GJU6hBHkRwBs/H/RmVYYxqiW3ftf7y2JmexkOLfVSL2FrRI87KEJx7bI6QJAoAf63/
	ma7GVIE/2iWza2SDzQ97NlWrsTp5BxL1DIPngjnrDz8Rmr+RrOjEDnG6n247JYX6+KLdKjBPI8t
	ydc3mSALHpZjve0tkCXJ3Qrs7VWlux1WSmfvy9DY4MaE3mQr4bxkNGLb9l8vJzE3gjdl7eHtj2F
	uMrnK1vcOw0WzLRyuiByTqaSx9d4FLQUOvLIyKldUmnTum9lFgH2b7Dgn8LnFy4=
X-Received: by 2002:a05:693c:8642:10b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37685c7a32fmr6157941eec.9.1794483562280;
        Thu, 12 Nov 2026 03:39:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm28352798eec.17.2026.11.12.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	balaji.kalkonda@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: kaanapali: Add mode-switch to the USB controller
Date: Thu, 12 Nov 2026 20:39:21 +0900
Message-ID: <20261112113921.1143-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controller as well, so that it
gets the Type-C mode, moves to the UTMI clock first and keeps its USB
2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Depends on:
- "usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes",
  which adds the binding and registers the mux in dwc3-qcom. Without
  it, pmic_glink_altmode defers its probe indefinitely:
  https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
- patch 3 of Balaji Kalkonda's Kaanapali DisplayPort series, which
  makes usb_dp_qmpphy a mode switch:
  https://lore.kernel.org/all/20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com/
- with dwc3-qcom built as a module, Yongxing Mou's "drm/bridge:
  aux-hpd-bridge: replay last HPD status on hpd_enable", or a monitor
  attached at boot is not detected:
  https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Changes in v3:
- Sent on its own, split from the dwc3 series (Krzysztof)
- Subject and message: the controller gets the mode, it does not switch
  anything
- v2: https://lore.kernel.org/all/20261103135057.1682-4-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
prerequisite-patch-id: 0f4b3497a5b65f978f8ee3de20953e111d9a4721
prerequisite-patch-id: c6020a82fa07088ac3e07cc89d3059fff044d39e
-- 
2.43.0


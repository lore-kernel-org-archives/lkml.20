Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81B43BDA6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791123787; cv=none; b=Qh4ZGON459N0bBfPpPOQF8PzFQrTaRPsOj2ehFvcLJkQIXEaI8l7vnv0wn9G+ZrYkJ4Ww2LlmmOunDE279hE6I9hGpDm05pmQoBvszh6XjN+JU896sRU1rtavFlpn5H1CZHDEMQ92WG6FytN/p6SOBvNKBOT49psibTbifPT9pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791123787; c=relaxed/simple;
	bh=D5oJblw1Mk2D0oXCU0ZAWnjEkCSIw80thnwcJYQpFIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NLAlEcWlfBjbXnCpYBGvCXvw3QXQp+oFWe/wINmApJwXCGlha+xUcObMPD674q7MFeP8iSKZPPW074jqx74Zao7lPAPJMZIc+cfpnZP6rLDFWXbiyu0sqCvZswWDq1kmQEH9l2Nfzy70N3HONakiFTwMURWS/qtLgzEU2oZoCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrJoZmMO; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrJoZmMO"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e4a2f00beso175440566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791123783; x=1791728583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=nrJoZmMOp45M0+Bsh4itLHainNHp8yq9lyofsgw2RgO+t9UI8Ip5Lp5TWrizmbNSUq
         MpHyo9tbhuIhqevdbukMXUIbifvHlgmdof1A201V9fI+hv0hgHxvy0Bam/b3JH/MWm/H
         pp73sSpuOHFtgECWUsisvlxGrLQDDbTnz3fXM613jFJGKuz4MkPe+Nz0V+gC5YU9kXVi
         lcfPWIaK/ALejNBzHXISEw3iOPaB/oD8GnRT4U0VgRiL6vnkEO1gYIhKuGin7B0E2KYV
         AjI04+CcTU6Gc4r5fXE1Qowq3MOEh+q56BSNV46zGfQZDAKZmha39JHsjbmAVWzqTJQP
         mXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791123783; x=1791728583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=Me19M9vujmO+K8kOP7mYUVoMVay+5f5I+DRM46ViivhUVxWGbm0Va4ePKAZ7kuoRiC
         SAWvyLHDnA5tzoB/FE996jOoPVmhz3cHUG1cyDCCcSsPlAbKSDh2TGSdgtCSGy8EmeSJ
         Qamzjr6msopk0wTPa1Bb0yywHjRMP34aqXcTnsoBiShST7mP2EXoAc0Qrf+gLFuD0Ywi
         iGAQ/8g4TTulldHgV8VeaFLui9Z9KdL8fEiu8ZIFBBpg46bJF5BQOjeoKQePLE1fhHUG
         JTLQGI7t+gbgjfz8CVOENFu4QsBsAKyGr1eW9SWSQet8Se1GoJu2PcWQ6utYGlVweTDa
         LKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBymEstRtekf/ybgb7BNd21NNDBttNfxFgCcCQJCV+iYuOYcF59JY46ssPfVptlDJ46DkiCk+3cRgt0Bn+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlcF44aCesS+WOi2vyLv/26O0T2bOVawPdX40XiJtsGWauSfeN
	xCNhN5gul68pXEoNPLNYrhtPex3oNTJxo+PLXke/Xvp0U0U/bHBlc1irgmIawEzFyFY=
X-Gm-Gg: AYBFou1WwWQpkTkm7jx70jsfGR/F9u//VgKIEeV36+M5FgHINBnunzAxrrInuMKnSr4
	xokKKznXJtNyhseDgRN31RLAbnpvfJu2fd+3Jd3tieTzyatl1RQzpQo5nD65pKbQaBeyW8rhgNL
	8XRDADwZYp2U8cAhOyQKQgu7UAohdQFZOfa81AfohA6X+gwcvPHsx+EB7aLZ7nIfoAEpXsgufIp
	AJ7tJdHMlXhvi3POWSDxsRPBbC+FNzaRhJnczZtT1p6C65psT+DmtLg1JJyAZY8op0a+jSVjf8w
	aKVznnFhFQsximuE8dlazRnnab610LCToXwy9pgwb3KyDcS0GjLlBbssVHxpbDjTSFnoYSBMuCw
	tYcYdCT7uU8d564zoHNLauuOj0Seutgtq8FsIdn4tnXQqW+CdaPosSvMQIi+yM7zENmECElp1ug
	bOC1sKCm+6vzE2KvAyLK5pARG7iqO16D+JmhwcFow7/RPlA0ze2UFWb1d5qzDlPQ==
X-Received: by 2002:a17:907:980f:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c2e4aac126fmr651934466b.11.1791123782696;
        Sun, 04 Oct 2026 07:23:02 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac5:303d:28c::41:135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd0457bsm294393366b.15.2026.10.04.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:23:01 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wy@wyuan.org
Subject: [PATCH RESEND v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Sun,  4 Oct 2026 16:22:53 +0200
Message-ID: <20261004142255.25723-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jiaming Ouyang <jiamingouyang13@gmail.com>

Translate Documentation/usb/ohci.rst into Chinese Simplified.

The translation covers OHCI driver overview, hardware protocol
differences (OHCI vs UHCI), improvements since 2.4 kernel,
queueable interrupt transfers, and non-PCI support.

Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
---

Changes in v3:
- Correct the docs list in index.rst
---

Sending this resend because last send is broken.
---
 .../translations/zh_CN/usb/index.rst          |  2 +-
 Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst

diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index df99814c6497..c96eacf13e11 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -32,6 +32,7 @@ USB 支持
     chipidea
     dwc3
     ehci
+    ohci
     usbmon
 
 待翻译文档：
@@ -49,7 +50,6 @@ USB 支持
 * mass-storage
 * misc_usbsevseg
 * mtouchusb
-* ohci
 * raw-gadget
 * usbip_protocol
 * usb-serial
diff --git a/Documentation/translations/zh_CN/usb/ohci.rst b/Documentation/translations/zh_CN/usb/ohci.rst
new file mode 100644
index 000000000000..5e36831bf370
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/ohci.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/usb/ohci.rst
+
+:翻译: 欧阳家铭 Jiaming Ouyang <jiamingouyang13@gmail.com>
+
+========
+OHCI驱动
+========
+
+2002年8月23日
+
+“OHCI-HCD”驱动程序是一个USB主机控制器程序（HCD），它源自2.4内核系列中的“usb-ohci”
+驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber <weissg@vienna.at>编写但也获
+得了来自David Brownell <dbrownell@users.sourceforge.net>，Linus Torvalds
+和Gregory P. Smith的支持。
+
+它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能
+注入到硬件中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
+
+自2.4内核以来的更改包括
+
+         - 提高了健壮性; 修复了错误; 减少了开销
+         - 支持更新和简化的usbcore API
+         - 中断传输可以更大，并且可以排队
+         - 通过使用上层“hcd”框架，减少代码量
+         - 支持一些非PCI的OHCI实现
+         - ... 以及更多
+
+“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”
+中也是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢
+失的风险。当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要
+处理，来最大限度的降低这些风险。
+
+- David Brownell
+  <dbrownell@users.sourceforge.net>
+
-- 
2.53.0


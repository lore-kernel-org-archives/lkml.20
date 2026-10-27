Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107309;
	b=D9gc3mQvfo/2bl31xex3BeLvPx6rOmJW6HQHHaq2KsLF/cYrWUnJPe2gjICG5cFuc0t/
	 gtLVVDGKRELhUuQ8R8Pl2+Bq9Z9uXeyTAE8S/Ebue25O6Yju2OPArmFGyX27vyY7KtCtE
	 /Pdzlv2usQl5fYoV/uZD37bUBMd9uMCo0g2Xgh2Fby9DUKiRJ/0kZPpS8j8qmyUl2NQ8B
	 99sR9q14tULWmgJhUUljmzSOpbKj8/GTZvAuPEcKz6b9tHJybREpiA3DLTQdJfAJK3hbE
	 NziB475fHPPMNHnUZAhofIUpvYUQ6XCMmL5mOQwp97FXDPEvMULslj/a5WtpkSaWYuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
	b=DtxSocia+7RoPiiPKdWfiSczqlzmiB7FgOuY/zIKctRESsOKXNQPLut+ucDJ+eEIPhsg
	 fPQX0HeaRJXdepHas5waykfB3dPkP2rQ1WpVsNfrJqZVFo1B4rTz5/wFsOD7V/Ov04wVB
	 mq4gU5f+a/lGhcxc+zJ158lMCeQmGoDiDjTbYFYmOa2BIBdrdMpaMp33vbe6F+GuVLD9Y
	 yNYEnV+bDtj/1rTYoWpopCQIKBPqvTMse7XFmgwPbES3P6YT0RaYTvLuxbFB1141fDeCB
	 Hw+yiCnsW5Ly/xJceVQShmhd7zYimNEBUH48Hq7xuPVcn3KHo1Vgpz4SS7wrRu3CAsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hNzBfPIT;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42975606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42975606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hNzBfPIT
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c498fa2f365so291133766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107308; x=1793712108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=hNzBfPIT6WfFbZkZgUrbg3BtTPPdQT/WlkH8PE2UnqVKBlVwAVv1LHzdXNeV7KEDm6
         TiWKyVH8INlJKvxjThjJE4VPmOXxKt8PvXoDtk4yZbRIU69pZevx6KnpwAN/1oZzPNly
         cbvW+/I1RL0344Xycmmy3X7gui51/h/7iisowu64gUH7dj95hD08cyKRE4AaHX0kmkWU
         H8OeUneO31UxvD9aC5xueLTsHCuqONy6JwjZ+bzcQNN2+JBzie1yvkkzGo0A40M+kdbC
         UC24HBzNHxIO2cgMq26iQpzrYJID0FQr4Fev4dp7o9SnqlNCED4lxME9wwenoR+dGvmD
         Nczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107308; x=1793712108;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=0ZFnDNj6dm7EeSA1K/PjaVIMgFDKx/1GT2vcFaSfK2Jb2ODNdnm3bf8KHlEMkriepH
         I/UfSiT1Nc7Y5d5Cdn7+31k+dDAv34vrUowt30JPoF/EwlBmokVqTeOLrZuKaiWFFeFR
         rADC3VMOBY4jRtkL85GeUFxc77eIVpHB8acasUIiwkJg49y/1B0xhlKY+WYkAApBLnzO
         qxtcU6TMIcrSVRbVaNVo9Sb1RxOLmpAqeA3BWW1CeUMAoDWi3qhAAlcZ2zrIrZNtManL
         7o8uuWit27IqTIGSvL0b8O1apRnSdaBNJBDjUtYMQGbjckK9A0ZCZK8eAUpQjRrNUP0F
         dwDw==
X-Forwarded-Encrypted: i=1; AKwUvBzEZJqAW3d326rqCc+MuN7QG+PakweQhludvOF2jNZ9ouoezBNaR9kHo2RtXbf6Y5o8Afw3QMJc8oBgBxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo9H2cg0UB3cZzgEdheLSZn6wK5Du276UBATeXWCvJT9Zyb6DM
	CbENPYmngUUbePMg+mNmWmk2tKNDW+XKVt2vQZZy7kiQ3N4DX59ZxwF2
X-Gm-Gg: AYBFou2EDI4H/CzeNl3shVpKcbopLuCwVmrl95RczYhycKRnlJfYedbLJ5i2A9q9l6t
	8SwW/pOFtu4lrH69LG1NdcptViDBAj3l1/GP4Ba3DwOjmHRINlQ0VMymfSimR0y6hj7+l/bVWZ4
	fXQe982Qh4wM1or6FlVtiGP07/p71Th65dmybc8IGMFJWYlazEnqFZQtubcGlUXRTv1l7QW50DP
	OawdC3dVp8D8BU9SNRdd+/HLAhKsPCxgRiBvFX4HIP73gFsS46ek2vArpWTnWcZ/Mt4j9Ym2xp1
	wogjmbwqZTlu6f8M8+jPjY/jUmyfss4J3gCnuEHDD5CTI0R6J1n7gfh2IZJ7bbo0BaswPhu9J6t
	knisYTq3V6jpYJBpqUFjnSuOyJKHWRHI0dSLwdJRNebAPtVLhp+k8BfMP8pHSMF3GvmauST8Ti8
	BxSXKbBgHA3tbCzMRYrMhh5JYIjLeit1ara9nuYSIbep85RboL28oAzxBzkTPRFwpd7ZlnK/fWo
	Aqh6CPRveeHgIqSikUj3G1/SNY+mtZptY06fDyrWcLC1Q==
X-Received: by 2002:a17:906:f58f:b0:c40:19dc:a248 with SMTP id a640c23a62f3a-c46bddcdf09mr1054920666b.15.1793107307377;
        Tue, 27 Oct 2026 06:21:47 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac1:1f60:10::41:127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd15sm448714966b.55.2026.10.27.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:21:46 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Tue, 27 Oct 2026 14:21:40 +0100
Message-ID: <20261027132140.16295-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Changes in v4:
- Replaced spelling problem.
- In your cited discussion [1](https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/), I still would like to keep ':翻译:' line.
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
index 000000000000..5f2bc7b41f29
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
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多智能功能
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


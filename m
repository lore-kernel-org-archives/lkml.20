Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010425;
	b=TWOyK7UT7+OeiyLzU7c9vVhXn026K3vAuhs7+Ps7vzaVOqjVNSBbvF4dP84iZawiZGcq
	 2KABoUqlW6DRfabaaijDr+to/k/4JRmNICd5Fcjzs/8JV4FL3QRHrVG0Z+XmS4bokw7G9
	 jPy61C64goZDdU82WOMwjCO+1UpUJ5gLT/kyiG7FkUaV/APKzn0izB6GWrC6s7uhMhj39
	 /v7uTNaW1hAaMJh19AE8wTd0UQiElxwf57ee4pGOBvWrq7vC7pF30APM/nHLumLdDv2ZK
	 Jc2DMPB6ozYY4O96scaew9aDT/VVxIpNHk8Te9/DLtFuVx0c9KEaOIpR2q/69kiHH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010425;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=otalZVWjLLkvOeXJXYnrF0pBbd+DK70KWzAZJaQKjIo=;
	b=Ux/GayxO7cop35x5isaR/F9CPn89X7nJ3Mw0Emi/vGbrLOipiY2cqCbGq1/4F7A7gW8D
	 FEdwNwEtDVWR/fRnJFjApWvYWjz6YguM+CFpn0ZW4sGlwzUhe7Ca8bWLBLTKHCO0VDoHV
	 knXQ3AZz33LKEDC+n6WfxvRg/T3xB/Lr+rbmRJk/bjN9HZG4rlyCYgZACmzr+aL2gfuoB
	 9fuBu11mEPu2SQa30tIltYUHZrKA7cHRLT3VtzGM6D8thH+femyT1F35IHWDj0U9yktLE
	 f4SL9dvcj3nWK3qJevQd3+V4j/3gdZEkCEvo2Xi7xVgNTKsKyH/oGn8cq0YBroLTsyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sYKEDqLf;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5D8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sYKEDqLf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794010416; x=1794615216; i=w_armin@gmx.de;
	bh=otalZVWjLLkvOeXJXYnrF0pBbd+DK70KWzAZJaQKjIo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sYKEDqLfxjtfhndsmEju/b65MiEl5IXBdw1yHT98NNEtQnXC44rFG8ym1mtCxvQm
	 tvJ+PqHDJiRkgoE57woZC96L6LeXIwsmVupd7ubnDk7DNyJu9gAnnnGWHBnSVTWDy
	 J2q28HrbdC0lCPGnmXYyT71sQByVeqgX5lZjnwhYzL2JzlV40V2f+6O2hrpdqIUCq
	 DxxWqmX15tbo1RKAFu9iSHguGUzHUCQhIvY2Ik32Vyw2fVE139LKPj98C4TGybmVe
	 Nu8B/D4LQKv34ziPHzvgYnEXNq4QjkOJCQIlpLM0y7bSv7e3MCURmZkO/eMQCMwmv
	 AFzROPuaq0gVna083g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oG5-1wcLM22bor-00tkPN; Sat, 07
 Nov 2026 01:13:35 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Fix Kconfig issue with CONFIG_ACPI_WMI
Date: Sat,  7 Nov 2026 01:13:05 +0100
Message-ID: <20261107001330.403365-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kz/uweY1EPr/6BTfQRUVjK3nqaJnGS63fS2XPbI0JLXVdvkt8Rf
 UEJ+dOm6as3THH3oJljf9pJLMTwXFyqAC+n9TPX5khokxu35X9NbWF8yyqkgfIXS9n9Hkt1
 pYQbnGGufkNDVk0QT0qT+qKTCDQYkemQsY4oKRCVbn8atRq19L60xm+p+myK8a/NJ3Mhcsa
 6RasLhwxrhPgYJc5inakQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bZ9UqEUu5S4=;cqLhiFrkvppuP54n5xh8KXOjl7D
 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
 6paQiM84iZ7jAFxV3i7vL3e3jdHLTWZ7ZYY5A==

Nouveau uses wmi_evaluate_method() when CONFIG_ACPI_WMI has been
enabled, but this alone does not guarantee that CONFIG_ACPI_WMI
is actually reachable. If CONFIG_ACPI_WMI is m and CONFIG_DRM_NOUVEAU
is y, said function will not be reachable by nouveau, resulting in
a linker error.

Until now this issue was not triggered because on x86
CONFIG_ACPI_WMI is automatically selected by nouveau. However the
ACPI-WMI subsystem has added support for other ACPI-compatible
architectures like Risc V, making it possible for users to trigger
this bug.

Fix this by always selecting ACPI_WMI if ACPI support is enabled
to ensure that nouveau can actually reach wmi_evaluate_method().

Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611070038.qzOOv1De-lkp@in=
tel.com/
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/gpu/drm/nouveau/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kco=
nfig
index 3b5757aed9c8..9c5716738b18 100644
=2D-- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -19,7 +19,7 @@ config DRM_NOUVEAU
 	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
 	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
+	select ACPI_WMI if ACPI
 	select MXM_WMI if ACPI && X86
 	select POWER_SUPPLY
 	# Similar to i915, we need to select ACPI_VIDEO and it's dependencies
=2D-=20
2.56.0


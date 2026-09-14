Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0F3385B9;
	Mon, 14 Sep 2026 03:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355589; cv=none; b=nAScXVMmsxeyAqxACzd0yUq4CRKys1xl6WiOA08jvhEGL2zzQ5zVut9nIUAiqJuLbdXtqfsm4PjtL2vFOA1MjBWEC/ZrrlqHzw4SQ7YQs9dpIOPrGq7WHjBvG3Ngh3uvNqsDPm6hKwaaeOcBvJVc6g6BJ2t67AWYgwm4eJF81/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355589; c=relaxed/simple;
	bh=XqDBQG9I/kQldxTtUTL+ST32GQ6BWJOlxbv1O1OdUso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWCn84OsruAFbhZQlBvEbekgxPG+2ErJlUM85oVhSeSn6063bgzZRN/tw5XBs1+gTv+KVCRvQ9BtsWCtfFYXxGDQUcWMB+cbFHgIczoLA3uInIC2w0mqpOFzt1o9tC4+eznbDjhuDkQP8/4QIWsCD3nvFdGup0hG55CMagSCDvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ui7YEX0E; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dXx9Iapv; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ui7YEX0E";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dXx9Iapv"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hjqwC55rVzKp1n;
	Mon, 14 Sep 2026 05:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789355579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0fI6f3FOiJn+yr/ZG6phPn13meKh+HsNJMQ50OGU9CA=;
	b=Ui7YEX0ELcK69vcBJxavXE1UUg7xcdr5+6Ps9UUGlHGsM19GaD1isy0Iid3/PBE7dz7Vkl
	6z3qRbyLuSvu7KfyeUwg0+/u9bJVybWA/F7HvZp2+ijiP844pWBQihxUFk3IyT2L2bPUKr
	0bAwkseeETVMA9iZu3RRsnvmXLfbqpVuQTupJmJMfH/dasoxrnzzNAAehrfpEfiU65iveZ
	omDQJLaXm8zCy+voei38SUgdMQP4t3lChD5DhWtuxI4PIyLw7GOoQNtKjXTC07ocWx/IFX
	Zoul1GkH9zmW6YsRTGDMlnQfuXgo3KnwjMON065bnXSRHkKfbQBiKJEDwb2s5g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789355578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0fI6f3FOiJn+yr/ZG6phPn13meKh+HsNJMQ50OGU9CA=;
	b=dXx9Iapvp1VemEj5g6FDYviBG5mdjhwEOUxPtyeJnYpyz2HbH3LmUnz6onQlUufaSnRLlS
	kMwsLSJUOYJnBq1wLQ7WLstKmXYDe0WjI1tNcuStQ31Pa6eMCjIk1ebFQYL7OEKkD1uDsl
	2PwlYS7bZMSODeuaGsGgYbhyYVaRaS+IrRnQelq247hv3A0EsDh0KkYj//BBG0UqiJB3du
	zZtdx3+sMS06eIMeyHJMAr9Sx+gWcpkxL/aYvtcrtOgnDlDNSjCu/NebGWRXleQxlo5roY
	3I2+/ZOt2GytP8FjoGdeZkaMJvlcoufL+LZwvqpkIAVwjfAPIOrD/ro80kLxGA==
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware repository
Date: Mon, 14 Sep 2026 05:12:30 +0200
Message-ID: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d480095db436342707e
X-MBO-RS-META: 8zggmroufeborg9d47hyqwrcijnwzmwx

Use the primary mirror of linux-firmware at kernel.org.
No functional change.

Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Rhodes <david.rhodes@cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
---
 Documentation/sound/codecs/cs35l56.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
index b3f8c1c238518..4a246f535d260 100644
--- a/Documentation/sound/codecs/cs35l56.rst
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -50,7 +50,7 @@ DSP. Firmware files are essential to enable the full capabilities of the
 amplifier.
 
 Firmware is distributed in the linux-firmware repository:
-https://gitlab.com/kernel-firmware/linux-firmware.git
+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
 
 On most SoundWire systems the amplifier has a default minimum capability to
 produce audio. However this will be
-- 
2.53.0


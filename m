Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276077;
	b=AYeAbnvru+G4L2zv9dr2tU43qboCeV+F2dd9GYtOFJT0iqpeIHHCz2iAgW+d4yPL76pw
	 5YSipfR8JTwgCCEMpkKyUDamOJLM05xC5nx19CepbKpT0Myu1SJX6iqqahOS06amXZtMD
	 /gbrj0EsnsYCA7dq8TePRMct2o9K9WzAmlAw29f6SepsFYglJdmOEMc4lBSbSM/4aFuC/
	 fOLxLNU6YmRP4M4P7Ne00F3SWd64h4onTngRzB/Y9X0MxZVfX4ZewRJ4AWzMOHa9w/BPj
	 xBvRkJ4nJrFW8t5mzFdO8RVIwN2ERm8+8UWXYyQcFlYJqfcidEBx15+04VBBTZbACxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276077;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLGnmizI0rQhqsNKClm0H53LdDa4BKTqazSRRlghGiU=;
	b=PAZMPMGyCQB6lTRlStwGMqHiyeTqVI0mDroy4t6q8lX2N0BEXAvR5LC7wKlkNeDSlTEI
	 oZhMYuwuZ8K/0xNq5AaF70OWygWhFb6B5Ge44hnARBuOxgUVtJ9jiNW2+7e9sRPBSQkc1
	 YEHiGBt2RojirV18VEccmWtEbKXBohhTIcoaOG1T859fwwE/HyTjfam30d/Pvm8b92CGl
	 RTDxzuzUCZV84Cyjs1ImLjppK+hsVTIDp+5INE75n0YPsja4WPA/aK/pTggoxqazCdHYQ
	 LSzq8Ze2oys5QYngPV7t/GR0HwZuYBlKPhrTCg7t4cl7S14UqnsNKxEjGUw0Sr7l4hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lmVmkvLj;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40B606D3D6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC40B606D3D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lmVmkvLj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v/vwC0I5TFCZ5/5X6X4jA8IEXevOgfqLa3VQQEnVcIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794276075; v=1; x=1794880875;
 b=lmVmkvLjApx4GGs7dvLQOF2VHwi7+wlur+wgw+c1wxNb4pGFJreS1vadQOskHKsR3gkFjXc+
 jp83YEj3alBPCPGmM1jKRHKSY7zgR97W62jQaNlP70rYFG9k9C+uwj/i3ts2P0nHijGVvEVHHAZ
 tcglm8O9LUMB3KTedIUitJo8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e56b48cd3244b6a;
	Tue, 10 Nov 2026 02:01:14 +0000
X-Mizu-Trace-ID: 4e56b48cd3244b6a
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v15 18/18] MAINTAINERS: add maintainer for the ASUS HID driver
Date: Tue, 10 Nov 2026 02:00:36 +0000
Message-ID: <20261110020036.112884-19-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110020036.112884-1-denis.benato@linux.dev>
References: <20261110020036.112884-1-denis.benato@linux.dev>
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

I already maintain the ASUS drivers in platform/x86, know these
devices well, have contributed in reviewing and bugfixing and have a
lot more work pending so I volunteer on helping making this driver
better: give hid-asus.c and its sysfs ABI file a dedicated entry
and list me as its maintainer.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a69da715c58..3dbf491046b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,13 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus-ec-sensors.c
 
+ASUS HID DRIVER
+M:	Denis Benato <denis.benato@linux.dev>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hid-asus
+F:	drivers/hid/hid-asus.c
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-- 
2.47.3


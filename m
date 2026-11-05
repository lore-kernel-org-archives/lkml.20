Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902593;
	b=WHLQj+CUGpWlrHd0Cez142NH8nCCkdyf4FYW//hZOTA21sd+stqAP9BtOkABCShIwD/f
	 3qDj/GYy/c53Jyr5fcTresKH1G1HBTdCiSP5NAX8SsaOOlHTa+j7ljOK0OioRk9BaCwzO
	 hYJmw2lM5gsRsGl6a5q9ahelLmuSw+JzWY4d+P5ICZQRNTIGH4qG97ttB/GUnwitw2Y8D
	 qQynKhxiNBNfYT4zEBdslgLh80wUENwY/D1sei5LglOk1OeQW50Pfze8LdOlpcMc1JV86
	 dkeFB+Gk161vs8mbxx5RMZ3qwpFv++raMi1JEY0oQLWY1/XcokostbEzCOMlkL3Iy0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902593;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=25LrLFOQPRZfbNq+QLI6NZIfZy6L9p/OZJbHMi9B3CY=;
	b=ej+6dyp/Okd1VsFIZJVZKR0mGR197r+8IBEI6cSbVA2fmE/oYcSJiT2s7EtWe85TJ9s4
	 sr1m2d+Z8GxvQPWA1y9tiAWYHnLY2OrTveBZ+zJ/I3yAbRT1rAwnicnfo/Zmtqza/8gJq
	 GijENy7ZFjxgGHAGG09TG3PfgLkpCO/BICldFhS+gse86fCL+59Tyz4kpvtENRcXrmc4e
	 TEJblbbBsf1MRqLJXO37+Zva0DtatkvR9LetbkXIZzSkilKQ+bqkt0MnmQ8XRyA4KMHTT
	 D3PRWGmIy2FDbY3fmvs24x7OUDvevxt8GRlvAPz+zrgZlNdQsiwTR2ij0BKTa1xzdUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vgL3Cukb;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9FA606A31B;
	Thu,  5 Nov 2026 18:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vgL3Cukb
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jL9Vb4cpXzMlH6;
	Thu, 05 Nov 2026 19:16:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793902583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=25LrLFOQPRZfbNq+QLI6NZIfZy6L9p/OZJbHMi9B3CY=;
	b=vgL3CukbEzQMggnsG+sOD+Jj7a0jPVRJ7Fd+bz1oJry3ivVeRygURVQDQY6dY+acm9k27V
	Hs8JUmICwbQTQHSRIoYF0e0x/OFz5Q9LtIInRewsGhOAFHIdYY3F05/+DzPT7H4G7zD4cV
	hgC76iiaCNlEOsiFhPWEpsdbbgiFsKNBJsGj+rie4hAUGrWBVi5oscbYgTiH2uEuoNRA/g
	tWb48k5B9mREa4TG/rKzzwQr+O3wRlFvz4YhF/NlG6Hy1NBjgub6bEES9aJRsFZxqPaou1
	XptSv0itt+NCkM2a1ed/mMiQ2awAIl8mpiuFWyEFlHpCw3qK6zjh1g/BXhGyLA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Add category of subsystem-apis
Date: Thu,  5 Nov 2026 19:15:42 +0100
Message-ID: <20261105181542.3071-2-manuelebnerli@mailbox.org>
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
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: adfs8ii5n9ousa3m85imbam3bdi5khkk
X-MBO-RS-ID: 607f68f14f5b6b5bee1

Add Bus and Communication category to reduce number of items in
'Other subsystems'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index b1ad48bb40..4e886897d3 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -24,6 +24,20 @@ Core subsystems
    timers/index
    locking/index
 
+Bus and Communication interfaces
+--------------------------------
+
+.. toctree::
+   :maxdepth: 1
+
+   i2c/index
+   pcmcia/index
+   spi/index
+   w1/index
+   usb/index
+   PCI/index
+   peci/index
+
 Human interfaces
 ----------------
 
@@ -72,11 +86,7 @@ Other subsystems
    cpu-freq/index
    edac/index
    fpga/index
-   i2c/index
    iio/index
-   pcmcia/index
-   spi/index
-   w1/index
    watchdog/index
    virt/index
    hwmon/index
@@ -84,9 +94,6 @@ Other subsystems
    security/index
    crypto/index
    bpf/index
-   usb/index
-   PCI/index
    misc-devices/index
-   peci/index
    wmi/index
    tee/index
-- 
2.55.0


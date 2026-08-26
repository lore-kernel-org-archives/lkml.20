Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC03F7898
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750653; cv=none; b=Tu/ZzWi1YpJiCkgyaCh+//p+dHfy64CHnCz+hxpU1dg/D0EzpnFNvS/2kYD7DsQ1Ogsg6X3STB9MBxt/n2MdHzB7TgdnAci/WFnxtQODX5jspkrXayEcKWc6mt4MeGhj6RN+27wq0aRHsXCx5Gfgol4oxMJcEJTSyMn6TTHSuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750653; c=relaxed/simple;
	bh=BL86GUv2x4eWRcbpalPAXQx/D9oEM6z1d21vv8etw3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npRIS1fShnXBLL5BF0SCt3oyhBX1VcRmDHS/LgcheWLJEVHzmMEwB6rOQauukqVdu0fIY0tymb26jcLkEh3SO6lX9lsdFPJlQuO1m5HeF85ahv3ejlqMzPrz6ufxlw9Dj+qN5J8rIpT+3GIea8FVWKxHAHf6cqUMqtPrqEZKJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdO20yTv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdO20yTv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e2dab83eso143912666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750650; x=1788355450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=NdO20yTvvO7SLchcNREQFlELTxHXaaZDDcum/ppRjBiBTslwR0uQIDs9Xb44dwlBkh
         rf2kXbC8Vi3ctUU+WvqXhuY/zotbm/kEw27ZQWrMnvAdDlxlTOsck7lZ6ZhKWihHpXDW
         NaHzyqPNJ3HPWFYDDEthJ/cr1UK+NimTnm9PijA/6wTANmVKu07oDqnSULgDXl10uFJw
         E1NLjm147Zg4LGWUF+zt0wWxaS4O1fzRJxqhkAenR6ZQmrY2L2TlKESt5YBR32i3ack7
         8967e8r5yABNtwcq/dMkQXvY4hZt//apPcXYJmIwhC5aRJKy8hq8eHehRP+3CLIkDd3n
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750650; x=1788355450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=T7UvVwj4u+0v7wc18D3bfcCRK35QuebYMnd2v0Dsbqx2oPmP7k3ofBIFx1Z+u15j9x
         zCvDK4EqJTRIsjY+QaoZvU88uvGfw/gsu0stk9v2kmhAEjy57GnjKce0surwaLgMGYUD
         YkH8k3lI2XsvxvTmMOx7+zCEoR6m6lTvXObcQ5zZHSLTSEv5ZIrSVkXWMRn8r/jqkEf1
         uWhp4SlGSh4QlBZ3gweO8glN0IiRKQrCKmrK5wAVkCuLhl+1PVSWKXF8YkNfml7f7RgO
         SwgqKFkD1PPPlmv6SFMD6aDRMzIy1yJtHNyKUZKwWDuwZJHElTxWuzE5yKjUvZBfctMe
         GYLw==
X-Forwarded-Encrypted: i=1; AHgh+RoSkWm22kuyZYtOdO4KGANbltGZiDq2tyeIWF8gJQyelIANQncct5mSSwvANhxZ15br07dh96GV0wq/4Yg=@vger.kernel.org
X-Gm-Message-State: AFuF++k1nQg9ouHfv1w/w95uyMILozFCGp88LS3qAnanQu3qToAUD2tE
	KN79TWwUVxNaonP7ggJNEGmcMp2jdGara73PVrGDSi6o5Ru+RPI63+DU
X-Gm-Gg: AR+sD10CZmjYnAp5odrblVtd5+zcqdwOmiDWiAX1nf8OqVW71WRz0oJKomfJoiJ5L0w
	SUZ1zbY2BL91lFQbZ7jkqqksn3hEwIUZarUiO+x50zjMZATnK7Veog+D6cG081HEyy0KSzhLt/P
	MtBZOLZ57iW9dkUBX/pCdLBNYx455G4lFLjsJgtQMg7pvQhmiRKT38WqP9JeUWKxwwcogf3LuxZ
	WKcOgOiJLpamRuOIfcW6G643fN+ZTVmkLAoujc6YIun4iwNyzF+WS4/rHg0CnUl/PjQCzowTGho
	Cu2eAy0pfdsFst+w2MG9kGijwMdpGTPP+FFsXlpkGVWmN2wbvpHqcacHneGfZe5j24dpVZq28Di
	F261SzZpck282v0YuEwZPFFCCmN2pGgolDjYF7uRjd8A4ipQHQckYjf2KtAXm6JVx7qtGomx+Vn
	9ZHDwDKtCEmSjFivh1kGheeRSaj8M9uhBA9rH2Ea4SDn9cF3yMzRFV7+OYLs2ofSXnh56hA/hL3
	RbjBVHoTSDc2Xi046WYYL73ZWe5pYdtrvGqDmSAesU=
X-Received: by 2002:a17:907:728b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c250bbe0e01mr814991966b.7.1787750649485;
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm648518666b.39.2026.08.26.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 0/2] x86/usb: Add Yoga Book XMM7260 modem power sequencing
Date: Wed, 26 Aug 2026 15:24:01 +0200
Message-ID: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L connects an Intel XMM7260 modem through a
Cherry Trail xHCI SSIC port.  Firmware exposes an INT34D0 ACPI device,
but the modem requires both SSIC controller restoration and an ACPI/PMIC
power sequence before its USB boot function can transition to MBIM.

Add a DMI-scoped xHCI quirk which restores the SSIC vendor state across
setup and resume, followed by a platform driver which performs the
firmware power sequence and coordinates xHCI runtime PM while waiting
for the runtime function.

This is an RFC because live XMM7260-to-MBIM enumeration and suspend/resume
acceptance are not yet complete.  Feedback is particularly requested on
the xHCI/platform-driver split and the ownership of the SSIC sequencing.

Maurizio Casciano (2):
  xhci: Restore SSIC state on the Lenovo Yoga Book
  platform/x86: Add Cherry Trail XMM7260 power driver

 MAINTAINERS                            |   1 +
 drivers/platform/x86/intel/Kconfig     |  16 +
 drivers/platform/x86/intel/Makefile    |   1 +
 drivers/platform/x86/intel/cht_modem.c | 418 +++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c            | 114 ++++++-
 drivers/usb/host/xhci-ring.c           |  31 ++
 drivers/usb/host/xhci.h                |   1 +
 7 files changed, 581 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/intel/cht_modem.c


base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.53.0

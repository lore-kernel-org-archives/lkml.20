Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501E164A8D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253768; cv=none; b=kqld7fGjPv/7ASgSJBTjDHcUvCiXF4V1uTEiwu51Ae8zJZwOvclqRmZcxMXqwI2BugRD63ILMpORS3m7z8DVMeddv7w4l2qsTEfMdy7cTi8is7fGA2oBKXV6FE2HZqEVLiSpZZsqW7Fx2nURjARC2686+YD7nIxmcEWGXfMJ6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253768; c=relaxed/simple;
	bh=wLX5ACO76CYyjqvPrTUiakOoVRgLxi+/VLgc570FxQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7iCE4SpHAmv+tMi7ubbgXeiPwawdHhAJnowRdcRBa65gySAzqgpTl47AdSUOqCikB1TQu/SZu+Txna3UVPLUeNQLrnP/8ptRFB6W1KZcaIVBAa1nHEFV8udKMJ07J8QTVLZgRDp38u2n3ojeZSwPMuQV013WZ6iMAzMqYuIDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giAW6efS; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giAW6efS"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144d60be6b0so991680c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253766; x=1790858566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwZSkoonyIIiM74/8ebCFVKSM2BQQiG3RNHpeccfAIo=;
        b=giAW6efSlTWo/0be2oUH2Rx2a8pOYgAjqskmFa6kYaluzpIK4fLPSMpMKbMrJVNXOq
         Lino9QgrYzLM7tClqz2CMlxNgy+iDmJ+AVktKHlTJwGPQuSpL9dX588tualy9Rp/yWyW
         xYlLwSztK1UF0sEci2HngwapUTHjnyUJaIfzzb7KIQaOHzYMHoL9N8Oi/zA99vfl2Cs2
         iEF690f/01D22xKaPUVvnsRpDIEgw8U9ANCd4FVz6xmqWoTGZlAGTwK47Ylm/K46Va7p
         Q2U27EIXoQ1CspQJ/qlhcmcOoyxlZqnA6ie6v0zPK9aZxqrAvKgTN39hoH8ZsGLejFRi
         v2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253766; x=1790858566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwZSkoonyIIiM74/8ebCFVKSM2BQQiG3RNHpeccfAIo=;
        b=hm0znnOLOMf1hFs9BDPYD+V/uwizwvf7wWsNyt9GKQ1/Ffsma8w2hXYxHQ/DDJEFxR
         hxa442AwIRPI2V1I6L60Spw9upCxjiaBVfGGvfIUSCcWcYs2K6g0ylmfLxr6FS5pJJgY
         D1hW3T+fzO3Ac4F242fi2XXok6vnwZZ6uv0NP/QKoKy868x9/WMwC0sN9VlCuV6UlwvL
         VL//QOQPPUZk+iBRTpCnqe7q3jSJNqvAMwZj4mFdOsrPx59xPx48sBVMc2hDlenK7s84
         8+2rY9PscqmEbflj7dw0GBOEg9Z1dEUmfj3FBcxwtfKa24mHra2trFUdy309ZZ+8yA0N
         OCLg==
X-Forwarded-Encrypted: i=1; AKwUvBx5bcaRw0Y/KCJEB1zwpOFLPZX30RYm6Zck5K6OYvr8pI7PnRSZVMNtYdlOxefq4EoOe4aN2BpnQXf6sIY=@vger.kernel.org
X-Gm-Message-State: AFuF++lCcjB1Oo/d3OzcCRjkh/xmKl2er+ctPaKAEvNHLEMTlDYbfcsP
	3GFuLAU2nJu1m9vj5Ym8Wrlor1bytkEuqYXj7HbVRZXvObRpb+/ts0Un
X-Gm-Gg: AYBFou3cmKlc+WdoG+iUXSjWTypN8OYSjZcVSfVltJ1sx2Ec9O3FK3vYixbGUtUcrTA
	4tIV3WwBZmbxLaXN4tgxbRZkCNh3N6TU4VhGaP42rHd/8Byx+MD+k+C9UW/wSKHU2YlZmKe/QVi
	FmyPiys0C7YYfWRdipQsoVSVe1PI3J//dZt6gO3GBcRKcPnsPYUb5UKlK67VZA2MS7Nt6RvzRLV
	LxkRWKJ/8qsvslRVV30Ixt4TZ1tL2JuvsGqchBDebC6DiSaBEWTVZv7qcA1NXds+bVkNvG0Dh5z
	uY+lVlb0MFAeaMMYVZOBu8eWWU698z/Q2TeY4CvCPuin0oYLAjTc4uPZxFocTbJHiMawO3AMu/a
	GFaA2FPJZ7yKlZUF0CNYBeazwmuE1blhn2ia4sBO9K23Ng8BxfElOQC0ecRhdzgvTF44dMQTv9H
	HqNQfBOAt4/RFXnaedFhFlX0EpY06sP3YBMr0RnNv99sqRfA0QHLMoPaMil3g6sXd5CMe4hT1Mz
	buPIFoM
X-Received: by 2002:a05:701b:4554:20b0:144:ed03:7c31 with SMTP id a92af1059eb24-145040379c7mr1651998c88.10.1790253766240;
        Thu, 24 Sep 2026 05:42:46 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:45 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] PCI/PM: Do not save or restore the config space of an inaccessible device
Date: Thu, 24 Sep 2026 09:42:17 -0300
Message-ID: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a PCI device becomes inaccessible while the system is suspending,
pci_save_state() happily stores 0xFFFFFFFF into all 16 dwords of the
saved config space, and pci_restore_state() writes that back on resume --
to a device that by then *is* responding again.

On a MacBookPro14,3 (Intel Alpine Ridge Thunderbolt 3) this is not
theoretical.  The upstream bridge of the Thunderbolt switch stops
responding during suspend, and on resume the restore leaves it with:

  - the Secondary Bus Reset bit asserted (0xFF contains
    PCI_BRIDGE_CTL_BUS_RESET),
  - primary/secondary/subordinate bus numbers set to ff/ff/ff,
  - the link retrained down from 8 GT/s to 2.5 GT/s.

The visible effect is a 65-second resume while the kernel waits for
devices that can no longer be reached, followed by the removal of both
xHCI controllers: every USB-C port on the machine is gone until reboot.

The series makes the save path refuse to snapshot a device that is not
there, the restore path refuse to write back a snapshot that is all
ones, and teaches one more caller not to mistake an absent device for a
working link.

Patch 1 makes the USB PCI HCD honour the pci_save_state() return value,
which it currently ignores.  It is a fix in its own right --
pci_save_state() can already fail today -- and it is placed first so
that no patch in the series introduces an error condition before its
caller knows how to handle it.

Measured on the affected machine, comparing the same suspend/resume
cycle with and without the series:

  - resume time for the affected bridge: 65 s -> 1 s;
  - the bridge keeps its bus numbers (04/05/79) and its 8 GT/s link,
    with no Secondary Bus Reset asserted;
  - the xHCI behind it survives the cycle: 1 of 2 controllers instead of
    0 of 2, and 4 USB buses instead of 2.

v2 of this work fixes two defects found in review of v1: a
pci_WARN_ONCE() that the first version could trigger in
pci_pm_suspend_noirq(), and a partially written snapshot -- v1 could
leave dev->saved_config_space half updated if the device disappeared
while it was being read.  v2 reads into a temporary buffer and only
commits it after re-checking that the device is still there.  Both were
verified on hardware: the warning count went from 1 and 1 to 0 and 0,
and the per-device resume timings are unchanged to within 0.01%.

Tested on 6.18.49 on the machine described above.  I do not have other
affected hardware, so wider testing of the PCI core changes would be
welcome.

Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAD519DF7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662543; cv=pass; b=kuyIbSrpfbZaC1eVeLM50Pm75MKI0+t8ULrvl1c/mU9ZkteZSvJK0lIFncvqyu/fF18Kq+D2KTumvDvDlupcvaoDfrHw8MFugYCvmHVuqSLXo/VAO4yrH2z24kRQbOUqD374gRy55vcXMRSEi1XNlJLlH89aMgeGgi3sozJRgIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662543; c=relaxed/simple;
	bh=rvD7x46ttJWZaM5cVCvUskJpm2Xz/cV1oMWfQ5BnG+k=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=F7SALGumjl40GH821ZK+QCLR1xe7kcub9+ita9Impwa/WgT2XHTb0WhWXSYu0If8i5uZgsNdaFlgkQ2vLV3Re3vr7D44PRIL5OA1fpauHP/DGtkmmjLSfFlz4aGIZateP70jWytG0U6vHCN5C2H4t3lk5kkuL2lmz8Q2KOk8yp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRo1uyBG; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRo1uyBG"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-671017a4b55so1019702d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789662541; cv=none;
        d=google.com; s=arc-20260327;
        b=jCq/XKmGqMT9A/BxdQDBaFfBNT3APZtZvXfH2DqYu7CfUWcxnVXwwSH7+KjvHgsig4
         bA9pogmC8KGsAxe/AbjxKsr2IXTDCgRN/3BoVVdycwfiOye6cGIvK0MbeDc+t7IewCRO
         p4RwYzOiY7sHM1K10CBNLxhFY4ld/urIOEFzRY6ozdRx/H7HMljR+Jn+TIO/ICJpMGwZ
         bv+hvRHFoHzo1ZPIv3sWxsm73xROhsF+KFiRzy7c8iN6uP5+/WMlYasBD6Q4KKixKBtB
         N9NOh6vo/Tj7/jQ8yzDRALTkGhQns86ZqdhTiBOxus/1ayFqqUI2wiA99wRW7tmx1CgP
         VBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        fh=hhIiv3dZ5RM+vbl9mZEW8fASDEtQeALkjm7AJQpRL1s=;
        b=DkYKs8Gg6gf0kou+LjZAcjBZZ4Jqe2U458GpBdd7k5QGrbVd38PqZ4GceLSby+JMG7
         eLI/VX5N79KUQTlDRObrAM2tiBQ1MRyxp6z8uJnwqaUzF4BGAVK9PTrGDEvKUG5M8lkS
         /wqrOKXyiJPXPTTEe7M25wHsEiXQslJbx9CfrYl7rIUSXWN6sd0zBemKWhNLkP+Hqicu
         t68W88OF6VC9KNd7mREyFHd9iHc/mnNub+xqX8Ti4rUdygC514qQWrxYKGZx1vWxibI0
         aNR4+wcnCpfFnWGw1YIcD/WyU+9eSWVAA1V4RoDjmKmd5ptoXXQe+Vao8Iqp/23o+ZaX
         /f5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789662541; x=1790267341; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        b=pRo1uyBG4AeX0tygq+zALrpaRCOQBcXlUzx0fp5AqjxJ+LBjZODOCE+xAAZGVJIvUl
         fV4EF30C2Z3nBP6VFCKebqcZh8oYrgSekRdrrdL0bT5QTwmdfhqKBLzdcRaXrgoyA4Rr
         09MrHNWOdtaAl01uHJOx+lcxWgbHztrEBY0kPs9Ch5FYB6UMNnrklUutLDllJEzEErzc
         +SPBEa7+jPg5uTX6M1EC0YAQo35K4pTlnSA9XitC1beeCVNO5K7ASaBecNsksHOfy0cc
         ca8gVtg3jsNXA4sK3PH9hCWwLR3Nbx0gVERVsFC8kntpjF5RLdF2ptpxheQuLOuDX4aZ
         X0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662541; x=1790267341;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        b=2m6OahZOTrkOALJFt+XCjOyGTpRouupu5npeNeUbGxDFskfJaRB52f6vRmy44sLWbn
         v9vgGd0+zSjYAe8UB8tleTmDr7r1hnOE2ajZ1WdH1fzbbu08g4GfB3pCnLPQU8kmNw5q
         1fi1ubrnZtf68HDCmeCWI6SP9pZY7oNzT4q/PFWuTgqqtiwgP88obhv+GpJCqNgk/A+k
         2Ni0+Eo0v/ssNLf6wfngqtdQzWSI1mfdPm4iQNoXSU25ftlk6NY8xjjQ7SL/0cyYCRmJ
         +1hBHoMqasCFhHgKxK0EHZigAgSx+tpR5WWBRKrX1gpZiVGqGPbytZ1OgityggBuKMyM
         wBFw==
X-Forwarded-Encrypted: i=1; AKwUvBw30q7ceqytqZD+C3WnraStDVxEZzJuiBNrci0tW+6GQ5QDJA65AqwdvEQhq4O7ftrnFIYGQN75KMndu1k=@vger.kernel.org
X-Gm-Message-State: AFuF++mfgXfzJsuzitWwLdaZ4ZtFWhSKk2QDRLubk/QMYrPm8XU4AVhm
	sdjp0C3BZ0MhJl8J8ripfEwEucPiJcSJdiDrVkPIW/0VbjqnqiBI6OMdObBrPdJMtgWrkJO4I4p
	wfipTGJ+WsvXp1Ro7HAYV0Axtoad2N0IX4g==
X-Gm-Gg: AYBFou3qlocyNdLDvJbuD12mJBD081QiJODkkPrFlD4/7sJrRAac0t2HbMiI4rSM2q0
	nuNA9hm4UmZRNtPpL1e0OoPFqssgly6wVRfg/sJAQNNTBwxLz+C8t9OudF0aeC5nX673n6pZoak
	Nc5sgM21M4nE+vucpETn3lQuN68kxfqosxork4cRi5HhvruhmzjxLh9GX5IpIg0mYVZGjEahzJ3
	02RRWmLg3T07zz+hfCM6CpfjZ4YoTaSK1yHJ5O2PdZtTegE6n/T8LKKovk2bIMp3SMGOs5boWu4
	kA1ieR0yAxld5tk8hi30acrMNh4Cr5gBr+Yf00kWWlBjh4OqNTOxR4kwraOqTYI76NgAcubsFi9
	NLhxvqrvdPuwcYO8neQ==
X-Received: by 2002:a05:690e:428b:20b0:671:5c2e:82a8 with SMTP id
 956f58d0204a3-671632732afmr1767388d50.52.1789662541223; Thu, 17 Sep 2026
 09:29:01 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 09:29:00 -0700
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 09:29:00 -0700
From: alan.hovgaard@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 09:29:00 -0700
X-Gm-Features: AcwNN1V7jOBqK4FdRC1JlcHGnDHEP0gBHD6CVBE-iRa0WkhDx235spPNxiQwXKk
Message-ID: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>
Subject: False-positive missing-firmware warnings for devices not present on
 the machine
To: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello linux-firmware maintainers and Linux kernel maintainers,

I am an Arch Linux user writing about a user-facing warning that
appears on every kernel upgrade. It is driven by MODULE_FIRMWARE
metadata on in-tree modules, then printed by the distro initramfs
generator (mkinitcpio) as:

    WARNING: Possibly missing firmware for module: 'ast'
    WARNING: Possibly missing firmware for module: 'xhci_pci_renesas'
    WARNING: Possibly missing firmware for module: 'qla2xxx'
    WARNING: Possibly missing firmware for module: 'qed'
    WARNING: Possibly missing firmware for module: 'aic94xx'
    WARNING: Possibly missing firmware for module: 'bfa'
    WARNING: Possibly missing firmware for module: 'wd719x'
    WARNING: Possibly missing firmware for module: 'qla1280'

None of that hardware is in this computer. I find it a strange
antipattern to report missing firmware for devices that are not
present. Treating that as a WARNING is, in my view, plain wrong and
misleading. Why on earth is the default to warn about hardware that
is not even in the machine?

Machine: Lenovo Legion Pro 5 16IRX8 (laptop)
GPU:     Intel Raptor Lake-S UHD + NVIDIA GeForce RTX 4070 Max-Q
USB:     Intel 700 Series xHCI
Storage: Samsung NVMe
Ethernet: Realtek RTL8111
Wi-Fi:   Intel CNVi

  Module              What it is                         On this PC
  ------------------  ---------------------------------
------------------------------------------
  ast                 ASPEED BMC/IPMI server graphics    No -- Intel
UHD + RTX 4070
  xhci_pci_renesas    Renesas USB 3.0 xHCI firmware      No -- USB is
Intel 700-series xHCI
  qla2xxx             QLogic Fibre Channel HBA           No
  qed                 QLogic FastLinQ enterprise NIC     No --
ethernet is Realtek RTL8111
  aic94xx             Adaptec SAS/SATA RAID              No
  bfa                 Brocade Fibre Channel HBA          No
  wd719x              Old Western Digital SCSI HBA       No
  qla1280             Old QLogic SCSI HBA                No

None of those modules are loaded. lspci shows no matching devices.

I understand MODULE_FIRMWARE lists every blob a driver might request
for any supported device variant, not "firmware required on this
host." Distros then treat that list as a checklist when they pack
generic storage/USB/GPU modules into an initramfs. The result is
false-positive WARNINGs on ordinary laptops for QLogic Fibre Channel,
Brocade FC, Adaptec RAID, old SCSI cards, ASPEED BMC, and Renesas USB.

A warning should mean something is actually wrong with this machine.
I am asking for this default to change.

On the kernel / firmware-metadata side, that could mean:

  - Distinguishing required vs optional firmware in MODULE_FIRMWARE /
    modinfo, so initramfs generators can stop false-positive warnings
  - Or documenting a stable way for userspace to know that a firmware
    blob is only needed if a given PCI ID is present

I am sending the same request to the Arch mkinitcpio maintainers,
who emit the warning today. I would like the user-visible default to
stop warning about devices that are not in the computer.

Thank you,
Alan Hovgaard
Arch Linux user

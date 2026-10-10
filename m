Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E9234973
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791605143; cv=pass; b=V6Ux1mGKJ0XoAdczfBsoRMVdvb/yu02H0B7pX/e12R4yrwS+3HTyGGAClGMVMJOgMx4mQZwb4YDSRxwU6bLW2TnIZdEForDfDH9uuVExYT5MivyJnXIOqdaYbyxls3WFk8BydcOHvEvM6E0rF5sm58Vcwz72e6B2SK28q7G4FJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791605143; c=relaxed/simple;
	bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeZOW4HwM8Anv73tmalzQEg7717X0cqirf7NWtJCYMTf6O/xRKSB07kU2eAbaFDhZBJ4/ckGCKBBQyrxYgitKDQjiPpRWJZWBigFPqvVrr4q/4L9qCyyjp8TmBs+fAq3O+bt02+0wArVaN0l6wC1VsIwd+MqxfVCcTB3KVvRE5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=amcLJ+3T; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="amcLJ+3T"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac9d666d4eso1961357b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791605140; cv=none;
        d=google.com; s=arc-20260327;
        b=nMkBdJ/VspgTZGuNYiiULbMzDs3Bbq++STaJEsdB9ssJdv2+19QpAJhMlTH9lSEx3s
         GkXbuuv56IzCxF3BoYb9F8arWzJuQdIWh/sKMWoOsZT4Dx2dUXVcY4MC1UmgXuN6Upiu
         8CZeHhx0Dp1atH5TA+5i6u+n7J0hh/R2G+AQJN/KFd1+xcJ4aWBS8pRPMpneKiJJ4R+V
         1uHucjqLjIQCJYqKRQ6Yoe1qc3Io40IYsqba5TbvW21Y/aUhMV/y6Qz8d8qBkgjUtnB2
         woq2/yb/491LLU42lGPS08l87yhbl/gQtprKJDnpd3/p5hyI0a93W42DCVjy9+As41NO
         GWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        fh=vpQze0+yX4d9+uA8w34XyBO7Xbmok/EENbyR141pMfM=;
        b=bHZtIIxYDIuSQQWmWzKzZga5GZuDFxG8ZmxVsl/OKvev7asMpplUfNlZWXhPRDOZNI
         xT01zuU7jnrhW9jPVWlzVo/Rjov4u7VN0xHApuB4Xm9YkEcoUb76P+utq6sN/Qa2znRR
         rBIc0NzNr9b3ObYUi2DN8NiE9gYG9H8aUXUn//2g48TpZwwHECTR7G9y6jdDwnaa88SO
         /mP53yfH0cQ3zWNaFAi4P6/Jzol6C2QK9XJ7/Fs6Se1epMpl6N3x+r0tYFs+/IFrrMl1
         8mNzVLoXIiAUwzIm96aOVv8k9bwKwI5u8D332YpJMgfOe0caYLsOAsDS15dL7jmOeXtp
         drNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791605140; x=1792209940; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        b=amcLJ+3TsZYzxHmrNkG3ej3z4ZadlDx4ZQtXY/Bk6OgrJEmmdfUliUXG9dO12WXgk7
         5DxfWd6+3tmIj7m3KFDjkCVS17zQbMGQvxeohNdGSe4zesRgwNmge8HYSakKVJR/ApgQ
         upU6Qko4UaZGT1lWrr8looGz3zYn0lxA9ShOJTx086WqfupER0f6NfmEFNagetMrSrCh
         RN9NOqSSOB/wyTeM0PaG+x22FWaS+iW1GJ3v71rE7G6acAFU5qEdw6n7j5ht5iLAmW+Y
         dUCbTeNmqpD68oRuLswCqJUFMIjOeZAKzOHqVTB2IRJtkJ1j8OxqQaSwiT8DJZB0Mewd
         Iv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791605140; x=1792209940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        b=rr3F3Z10SRlChSK0nIY1rzPCK+1Bpeb45DqooRlIQ40hOzQlUJWUWdt6RrRRJitwOv
         zkDt6fSl5rhbA4wtDUDNy3zyWLMLljLRtAiVA5xvrT+jASCrc9yzJMVdvlS+0Yte4b7S
         Xn+rXmy2C7xHpEsWO/nIUhLH4ukIhYUlFVuUtpYfqQMBmWRWW3OgCNA9TxwcYeNtyh7Y
         B6iYuimMTU6sx+zKTGaLPXUV1hw+6MJvf7rrNOQqp4fto3tWeHO9LjO1f4EnH6nGDl6W
         MtzYNW6TJAmFbbAYVhVatU0sjcyZ3b2h3lc/cOlAyj2vVFS6gh3RTWfFRVsMZgREw27l
         0ePw==
X-Forwarded-Encrypted: i=1; AKwUvBydvnVp9gjl+4nl5145qWeyyTO116PcMTf9vY2qOFDwZ1dutDWvqpCsePEw3ky8FaAwvvDerwsODlnAbyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFD1Gmf+URgxqCuwZn5sUUNF9KCzeM7CyD94PmdCAHHUmu21Iw
	OmYstgh4FGHm6Dpr6lT7VkOxfs6DMdvePcW1CtvBa0Lc9tK4vQrXE+0pSX7f5wmqG0OHyzbLMSp
	07bgsja7JQiW4crfpk4nFZVe3LPZEmrQFb/3ILs4J
X-Gm-Gg: AYBFou0GA0n1FeXro9Irez0EO6NFOgT5dSCTwnCe25d62BMQpBdyBxGGMBQk3TlrNrD
	1zyKWl7mrt6ud0e0kfmcjbuUMNeZkb7nthqaPDW85vK6zucRXfAutomGktezOZ7LYncQvZ4EOff
	stpl8/UgQaQ32iOcSmpqsH6/wvwzpFEx4ocEUYctu2gwTrdww2iIZ7BvBUbOvkVkpHYPTSLgP2f
	myxXlaiEW/E0DX6JrLhM6FFJGe3YXEPh6hHozoISI81lZGwTD4lP8oPEBB6frgsLQbmbjMw4sNl
	16DMj073U7ErPxcOSS+5p4QJYPFsDGbv+JS9ZvtM4Bs+5fOx/uoDWPCUQk5JeQa/xd0q6KzyEHC
	It/f/0XRMHg==
X-Received: by 2002:a05:690c:6603:b0:8a5:1570:a298 with SMTP id
 00721157ae682-8b07edfeff1mr10928557b3.50.1791605139794; Fri, 09 Oct 2026
 21:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
In-Reply-To: <arZTphXbVF5wagy2@shikoro>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 9 Oct 2026 21:05:28 -0700
X-Gm-Features: AclHuK8ncYY7T7lxEax8iYkxYdBrzXYR56tEd1dK284WrT5YFKeFiVdRZAbEgzk
Message-ID: <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Wolfram and Andy,


Andy:

> I do not know how we end up here. The not-settled yet discussion is in
> thread with aqt_dCazxTDR4cpk@ashevche-desk.local.

There has been some back and forth but I originally uploaded this
patch set using
notifiers for binding looking for comments on the revival of a
potential upstream
i3cdev driver - Meagan had been working on a similar effort with i3cdev
using a different approach for binding and as of right now the bus notifier
approach seems to be more favored, but not approved nor decided on yet.

> But I have a big concern about exposing i3c to user space in the way we have it
> in i2c. Taking into account that i2c is an odd bus and might lead even to HW
> *physical* breakage, I would thing 100 times before making the same mistake
> in i3c. If you ever want to do this, this must not be user visible feature
> (hidden under expert and debug and maybe even more guards for the starter).
>

Just to make sure we're on the same page here about this - is your concern that
we can arbitrarily address any device on the i3c bus at-will as is the case
with i2c-dev?

FWIW, i3cdev as it exists in this patchset does not have as much free reign
over the i3c bus as i2c-dev does over an i2c bus:

1. i3cdev attaches to discrete target devices rather than exposing the
bus as a whole.
This means if I have 5 devices on my electrical bus that are up and operational
and 4 of them have a proper i3c driver to bind to (E.G. mctp-i3c) then
i3cdev will
not touch those devices, only the 5th device without a bound driver and
that would be via the i3cdev instance created specifically for that
device. A matching
kernel driver being found for a device later means i3cdev
automatically detaches itself
and makes way for a compatible client driver to bind.

2. Master controllers are also not a binding option for the driver, so
no free access to
send out arbitrary CCCs, perform bus scans, do DAA work, etc.

CONFIG_I3CDEV defaults to n and only creates root-owned character
devices for unbound targets, though if i3c maintainers prefer adding
"depends on EXPERT" or expanding the Kconfig help text, I am happy to do
that in v6.

Wolfram:

> >> Userspace access to I3C targets is needed for devices that do not have a
> >> kernel driver bound to them, such as targets in ROM/bootloader recovery
> >> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
> >> Trust recovery flows), as well as hardware bring-up and diagnostics.
>
> I don't know anything about these recovery mechanisms and their needs. I
> might have time to look into I3C things after all the conferences in
> Prague, but no promises...

Targets such as Caliptra (Silicon Root of
Trust), SoCs, and accelerators implement the OCP Secure Firmware
Recovery specification over I3C. When a target's runtime firmware is
corrupted, unprovisioned, or fails secure boot, its ROM/bootloader
exposes an I3C target endpoint implementing the OCP Recovery register
interface (PROT_CAP, DEVICE_ID, DEVICE_STATUS, RECOVERY_CTRL,
INDIRECT_FIFO_DATA) over standard I3C private transfers.

Per Section 8.4 of the OCP Secure Firmware Recovery v1.1 spec [1],
because I3C does not have native SMBus-style block transfers, the
recovery protocol emulates them over I3C using framed Private Write
transfers and combined Private Write + Repeated START Private Read
transfers (with PEC) to poll status/reason registers, pull crash logs
from Component Memory Spaces (CMS), stream signed recovery images into
the FIFO, and trigger activation.

The spec defines this same command set across SMBus, USB EP0, and I3C so
that a userspace Recovery Agent on a BMC can drive the recovery,
diagnostic log extraction, and attestation workflow across transports
(using i2c-dev for SMBus, usbfs/libusb for USB EP0, and i3cdev for I3C),
alongside general hardware bring-up and vendor-specific provisioning.

[1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf/

Thanks,
Sam

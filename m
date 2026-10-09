Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE84E77FC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560358; cv=none; b=DUPTPDKro5ajkfFt7lWGtuqKR0b5x6O5NC50XZy1nlD/C5soP6Ek5FaAFYlAwc2joimdPKvD+Inj8PEcSUU0GFAFv3g9mjh7+r9NL4a1ly2lbMVd92PlmoEBeO3VQ+6Qw+VZfIgkD+NX9F98LtLny+0uqQSU7+KGiaxRes5HsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560358; c=relaxed/simple;
	bh=TjffoSVP4U16dnt8mBcrf/Uk0C+Nixv+EuwNTgnHh+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUlWCR6/qX8EyNc6iJUEtZfRM9OJD/8pxTTnimL9CTcrMS/0KzSj58vgt578oePBkMp8spJQjGY5x+GLamIVUEqWliBv1Kga+DwTLHuPu6eqmXc3LajP0WFq0aytbDmsS+u8hqUG9y1oAv8id2+Bc6lVy3FDjieakUEnpInMCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsRnOCbd; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsRnOCbd"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4515191a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560356; x=1792165156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8f77HHpsEH+i+dnyZRMXGpE/YS81V6WgUKKKT/nSTs=;
        b=OsRnOCbdRbeV2F6Sgld2+YODaq1d+Sxxp6QtaufZzSy0p1p/RaYQijJnWydKRzG67R
         Kh6wRa/tgdkRD+M/KdDM7PzPNghRcJVhI0AVuYpoMPL6/W6T/o0d/hTTwfzuWQI4Fp1d
         k+tnJsQzibIK6zlMmBHWK+1PpdCFTmOFJJj0KaUMhj/k2R/hEv+eoYXP/UsY+zp+GSAg
         7ienKE13+dL04vCVrYEE3g5XVxBs2sf055PprSpKpmXrkJGAyYy/IEi34+71BctKnml1
         KHZOw2WE5Wpwu8QccuQRgSkcvDI2GcHdW8DWA4V43vHMN8FCDlwO1o90HF6qgmjNef16
         lhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560356; x=1792165156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8f77HHpsEH+i+dnyZRMXGpE/YS81V6WgUKKKT/nSTs=;
        b=TgecR8CS4DptRkxdYec9sFzjU3pzhdtgag/FCUQtOCLkQOkEWc61/dcNGJst8X6oBo
         +XF1wn74V0ZezuGf1y6qayrEsuvqRBVgyXoLuVofR8Q4RdSeS0hXibjxcrLFbCPmiHm8
         dYBci+gfeKW4NCjkgCOSeSYCoGyHkyxlUkfYqdI0ZRIBIoOLDKgLxrCVgSU3tZ5VJCDo
         z8U48WBBLPCIXrkPk6CFMSM0UOYFmiBuybzG3F+yxDlQXiv+8FTUtwwZruW7SH2CS0Rr
         nZN3BsbpyqfzklXzqIEUsl6DAke1Q+m305uZNVlCPbtnuJPHswLCFlqpyS/bZRjWQGfU
         r/4w==
X-Forwarded-Encrypted: i=1; AKwUvBz+YPhpMIWK6YyWM7wNVbfxU8GtV/uTUzT8E2m6iDCEkdYa0tUwvgMm7RBs2NkAaKlNGPXpSjdPg5z/mU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwqxZ2Gl3xaxUNZoF4z6/6R5z3GwcdsdXRJDmkVWDuAcv86O55
	DNZmCe4tkYSILXTs9WHeU6n4BeJ2xUQJkVbJf6NkyYiA+8nlu/I7iVTu1NnGm0ouXQ8=
X-Gm-Gg: AYBFou3M/P/mgfg7IEobR+3/PnVWjGGV4N+97Ax5zEC9B6zc/YEYWZ2r5vnKxQSAqXR
	znXqkgXDG3NpeTV+BRQ0u+ILtQeSDu7+GzbPB0V+Mgi5T/yssMwCbDIv+zYRiSFk057xjS7rAmV
	11exe3WSzXLpeyoZmmbcZ2C31FGZK115L4ombJ3M5hIHIvl1v7K53M6vGEacQijV+141je768c1
	JpMgKmXbD9YKgnPuYlQXQsegzyym3uQfC7rs7j3c/yGsnx55bAakf+o1NcfrBB9iojcPC3+dz39
	kmVdPw8WxBOoTGjohPthxB4iVkpsUtI06MHBC5uXSSHx3RgCTtpK55K3OfdHRQpf4EU5zXJC5/F
	DNAyzgyhxiY2H784xs2LIGA074BxL7v1psLLbjMJd93EACITDchYzlotPdVOeci/F/NvsApkD/p
	++pH0lL/Dbkma4HAIMgjn601ZIyLf/RF60bHLkhjHo/2aPhzbfXysQAi/JhVMiJR/t7eH79zj0q
	5DaTUg=
X-Received: by 2002:a17:902:ecd1:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2e842e1555dmr20384135ad.42.1791560355778;
        Fri, 09 Oct 2026 08:39:15 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:15 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] hwmon: Introduce uhwmon for userspace implementations
Date: Sat, 10 Oct 2026 00:38:39 +0900
Message-ID: <cover.1791531025.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces uhwmon, a generic hwmon interface connecting
userspace implementations to the kernel. It exposes hwmon sensor and
attribute definitions to userspace through <linux/hwmon.h>, allowing
userspace drivers to create standard hwmon sysfs attributes. uhwmon
forwards reads and writes through /dev/uhwmon. The hwmon core handles
numeric text conversion and newlines for kernel and userspace drivers.
The series also adds kernel documentation explaining the interface and
how to use its UAPI.

In the October 2024 IT87 discussion [1], a read-only hwmon driver
configured from userspace was suggested for chips without datasheets and
for testing new chips. Guenter Roeck said he would need proposal
details, but questioned whether the hwmon sysfs ABI justified new kernel
infrastructure: userspace drivers would still need hardware knowledge
and access. He suggested an API between those drivers and libsensors as
an alternative.

But I see practical value in retaining hwmon: the use case below already
works with unmodified sensors through its existing hwmon interface. A
common bridge can similarly let other daemons expose measurements
without adding a new input path to existing hwmon applications, reducing
duplicated integration work. The idea is conceptually similar to
dummy_hcd with a userspace gadget interface.

uhwmon's goal is to let applications using the standard hwmon interface
access sensors without mainline drivers, without adding per-device
support to userspace libraries or building and loading separate DKMS
modules. In theory, projects such as wireview-hwmon [2] could replace
their device-specific DKMS module with uhwmon and adapt their daemon to
use it. My current use case is bridging the Tapo API [3] to hwmon, using
a TAPO P110M smart plug to measure my system's power draw at the wall in
place of an ACPI power meter. I have tested this setup in an Ubuntu VM,
including live readings, daemon disconnect and recovery, and reboot startup.

[1] https://lkml.iu.edu/2410.2/11841.html
[2] https://github.com/emaspa/wireview-hwmon
[3] https://github.com/mihai-dinculescu/tapo

Jihong Min (5):
  hwmon: Export sensor and attribute definitions to userspace
  hwmon: Expose attribute validation and string helpers
  hwmon: Add a generic interface for userspace implementations
  hwmon: Reject truncated attribute names
  docs: hwmon: Document the uhwmon userspace interface

 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/uhwmon.rst                     | 141 +++++
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 MAINTAINERS                                        |   2 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/hwmon.c                              |  38 +-
 drivers/hwmon/uhwmon.c                             | 641 +++++++++++++++++++++
 include/linux/hwmon.h                              | 356 +-----------
 include/uapi/linux/hwmon.h                         | 372 ++++++++++++
 include/uapi/linux/uhwmon.h                        |  64 ++
 11 files changed, 1267 insertions(+), 359 deletions(-)
 create mode 100644 Documentation/hwmon/uhwmon.rst
 create mode 100644 drivers/hwmon/uhwmon.c
 create mode 100644 include/uapi/linux/hwmon.h
 create mode 100644 include/uapi/linux/uhwmon.h


base-commit: 7b63ef2d55f24519e7e9e5f4d15dbea03f126e40


Sincerely,
Jihong Min

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882582;
	b=lWm97s28Q3PeZDignISst3ZruKVGANETj7iD7XP1lcrLK6OPI+J1qHG5bao4s1HLFDCW
	 JHr6Gl+xX0Di52Ik5KcHT816m4pKAG/8WhAUf9oa7Ts7Po837svPZnuLigytY2niHeaZ5
	 0MRjVAXOD2DbPs2BKfwSiAGqhsoC7DfmKhp7HIdhOy1ai5hV2EJPnbSwZcxXYBujIQY3c
	 hMBUeQFa/i6mZY9t/OfzuUGfH4Z0/e0Dw6fCHJIY+Ds3ND4rwo677ziM9y/yNZj3l1kYs
	 Z9LfLc2wcqggCEmhx5SOxngTJo3rnu/18+YzoYrwC1Dc0FRTA3Ka6+3QCm3eI3wrDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KtdPkxiSZqOwEqjhj02FkI3Op22Kf/c+qdzJcWgt0Y4=;
	b=itrfipfSFuDDCwippx66s/8U7ENpwsP5j85IsbdoxZCw8sCeibfRDyYvd7HGCCqePtRZ
	 Qhz+bxaQtQTEQ5E1PTmdAxY9SroXY30e/iu/YUg9jmsGhypJbxURIaeVy7HwIoj3WWC7v
	 sHqpmAHW95r+m15VwHWOU/g26zRHrVS1IplQMEQkxHVCTNMUyHNl2j/ZVdDIWiR+W9YdA
	 X31fYKPKLabmSbsRle/D+I0tMYdaAr/GH+lSqk9Qa0925B/s6aFJF0t20S+gcjWVuUl1n
	 sy6SchwxUqfeT72mo/ypHL5puv/xBC4SgwtAty9psdieF4p+VkfkAQMUjt3nNjUo+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kV3KU4b1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJG4Rv8S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kV3KU4b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJG4Rv8S
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbMec1637663
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KtdPkxiSZqOwEqjhj02FkI3Op22Kf/c+qdz
	JcWgt0Y4=; b=kV3KU4b1BH3js6u+LxfQy7/nA4zNAxsIo2oDBDDJjKRu543nKTH
	ukB+kmZ0NUnH50baqPtoF4uJWLZ2tbpnQ/0l06LoRCwItMMduJY5y+Vwz17A45xm
	PUN41d1+b7FF/BVWq2tXSgrkvM+weTAd7ibR/i4PqYsn0lt5Y0KV72aO6IHNBUiD
	eUpH64TSjPOH9APONiHInp/9AZB5dQTNTnLGKFhP0nsfiMg1y9t9Mn9NN/S9Msew
	BLW9+KA524sroFucPcv5TT6iOJ/g1SzIL+kGZGjHdGafLqNKjNX3v+hCfRBmqTqg
	35L/U6gHN/jzU1tsK9C9IVND1NNFk3nb8mw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27sy1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so195379685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882580; x=1793487380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtdPkxiSZqOwEqjhj02FkI3Op22Kf/c+qdzJcWgt0Y4=;
        b=TJG4Rv8SQTbY4SwOFYGIfAICdgKIDxbp+Qxjnhd/9IfK8lUZphB+/CGx8XtUqsXdQP
         3GeWjMJIvJrcaiDwWfT8AkIrM3ecXBvrsMc0FpvOOHzMtU/OjZy4XarNdb/fYWjiZwKq
         b2gUAmOjbAcY48H87KYPbtmbjWMDNVl9b2FcZtu1ssfMh0stLaXnn7SIiVS6ttVyExsy
         SuIDVIhDFRMrwgqvXPasKdHdGWgtXmJw10dbLznuEfUfsfC+iumY9eUdJTaOD1TVcmtU
         UE+pqeOpQS4/maZYb25M+tY6V0SIrDtH6IHeEF7kGp3NKy42S+qMMM6Sk1X6WVDvHb8E
         +UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882580; x=1793487380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtdPkxiSZqOwEqjhj02FkI3Op22Kf/c+qdzJcWgt0Y4=;
        b=sncmMDREuXkfK2mjKeAKRVD9MzUL6/jdPDs8SqozymG6bp0Lus2qe0XtejLtMV7PZt
         64eT/amFNA4XDj67T2VHAUtFbMCBtuRsD9CymcXfGpLqF5t0bZkJs2BCLgmmooN5T1ZB
         VFs+YFLsIR3maeGck43Sh96fHI/LmwMiqkEsEv6EnHHndxd1Pkcoz1w3EspFkaYm0opa
         mIMriyDv4hLewxOkyrvRM88Tpqeclp7GHtZ1K0b008HlI6wOAb3pScpEKwP+TEoX1PO4
         o6K2Fgc8RpbhOBUKJnGoQDAHzZISBmMYXmo9a31A1NvLzRikRYv9sT9j+vikCkAY0rX3
         VB4w==
X-Forwarded-Encrypted: i=1; AKwUvBxBWjaQus40CWIZfs+VEfSxAH3dcxvhVzJTkdN+j9CeqqsbNX4jfFO9iqSI9k5ulkJeeZZo+QOYxgxDUoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQJbt3mUtBp+W7wulhy0EAYZ+o2zFv9mrSADgdjCo2YUwTlIG2
	bHtAnXwrie9isKfjQKwFdXz9QQKPyfk6ch76IZnPQQkBamkNt0QbIYjOV94C0ueQpaxerJ53mtS
	nUHi572zZPSry/ZhL1HAOi3rxTwoALBm+1haQh4WswB+yHz9wrppLJqPK2boGjZG9828=
X-Gm-Gg: AYBFou04UQiuARQOItRJMwCEDzssD3+WVZRfn6VCk4W092fx47lOk91/UJ7lHYDbZ6k
	SpCb4zpntB6biDJjOvpntPBnFnoA7FpsqRP3lEJEdoXbKVCmVh9DAdpuPwBFPguRL7yQuZx39z2
	PmofsNNBzSU+nln77X9+/JzTGiU6SbNpdmrVorOZ5ao6voowcALhb0KvRoBn18GXhSXuGqaAz4c
	apDAQyfKp4VlH4sXx2G2egV/P0G1s/Pvo94uw1D/SGqmyj6tgzyK7ooNGOM4NhTitA4SALr6Sv5
	pQzILoXFhW859LZei2YhepAt7xMaBeA36E91yeFPe/0ADj0teFUZ0zDpeQjKHVHHWpVNoUL0SAL
	2X4gJTSgCTR0JhA6ogFEkyFnICSg=
X-Received: by 2002:a05:620a:2909:b0:939:de48:e41f with SMTP id af79cd13be357-940ef8d8c8amr432341685a.31.1792882580099;
        Sat, 24 Oct 2026 15:56:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2909:b0:939:de48:e41f with SMTP id af79cd13be357-940ef8d8c8amr432338085a.31.1792882579489;
        Sat, 24 Oct 2026 15:56:19 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:18 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/4] Make platform profiles firmware independent
Date: Sun, 25 Oct 2026 00:34:25 +0200
Message-ID: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6add3794 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=2DKhwoluTUTBQ7ciJkYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3QbB60NK9lvLd8W5DBMV7FY51HjyifXW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX23+TM0JMbH3k
 rAJ6TqzFcNYGsLUx+noBy7h38oJlRvjLVrGwxeoiEkbsUBqSe6ySXdPbKjf9Dr4Hua8hkDavLNT
 MxAbkL7C/N2TORYFy9v+MRUp2tnQ5oQ=
X-Proofpoint-GUID: 3QbB60NK9lvLd8W5DBMV7FY51HjyifXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfXw236f8li8Hi5
 igC06waI4+g/NxCftyHwBWiVq17B7ejT694W4VGEpOFYaiOuEV5j2raYASvo2JKysad78EjN+ot
 JkPPGVPNnX0JIWY9KK2rQ7uzyXOgRIFHerYu92ANGI1TNIN1XX2e6MHFZJFzXGOEvaA/QDOqml1
 Mu6pOZFp90Z8wPdYvQTVaqvbAVAUs5nnF0Axozo2zcQpby7wygsFnlEhJC6VPCF2a2zp6SOybLH
 Iol1iQARRA3FBPNicCq1NetHqQZrCEA/tD70o/XTv6eT2k+z+Eo5MZ2ZI/5/cqMk9/IrZwV1jpD
 Vy36sJjKB2uIS/deaRBM4dMBOFalnanVzJa9LwV6bPuRdWSOLwkuXDZS1yb3+/Y4H/qbaT8lOSl
 lLvP4PITzZaMY4lFBu/9xjd85w52Xe+wxKUgAvx5YZFqYY5CITbJek/xLxnu72MbsrjjDCzU9L7
 fKm/02fa7pMGecKdxoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240091

Make platform profile selection independent of ACPI firmware.

The provider API already uses struct device, profile enums and callbacks;
it does not require an ACPI handle or firmware node. However, the core is
built under drivers/acpi/, its Kconfig symbol depends implicitly on ACPI,
and initialization fails when ACPI is disabled, preventing non-ACPI
providers from using the existing firmware-independent class interface.

This series moves the core to drivers/platform/profile/ and introduces
CONFIG_PLATFORM_PROFILE, updating all existing provider selectors. It
retains the tristate configuration and platform_profile module name.
Firmware-specific discovery and profile operations remain with providers.
The core can also be selected directly through its Kconfig prompt.

An optional ACPI adapter obtains the legacy sysfs kobject and is linked
into the same module. The generic core contains no ACPI types or symbols
and initializes without ACPI support or with ACPI disabled at boot.
The existing /sys/firmware/acpi/platform_profile and
/sys/firmware/acpi/platform_profile_choices attributes remain available
on active ACPI systems.

CONFIG_PLATFORM_PROFILE_LEGACY controls the backwards-compatible aggregate
sysfs interface. It defaults to enabled to preserve existing userspace.
Disabling it omits the legacy sysfs callbacks and ACPI adapter while
retaining class devices and kernel profile cycling. New userspace should
discover and control individual class devices instead.
The interface is deprecated, with removal intended after the 2028 LTS
kernel once userspace migration is complete. A shared pr_notice_once()
warns on legacy attribute access rather than on merely loading the core.
The default remains enabled while userspace adopts released class-device
support; this series does not claim that ecosystem migration is complete.

The existing firmware-independent interface remains:

  /sys/class/platform-profile/platform-profile-X/name
  /sys/class/platform-profile/platform-profile-X/choices
  /sys/class/platform-profile/platform-profile-X/profile

Non-ACPI userspace controls providers individually through these class
devices. Aggregate selection remains available through the legacy ACPI
attributes, and aggregate profile cycling remains available to kernel
callers. No new sysfs directory or userspace ABI is introduced.

The original first patch, "Separate handler locking from sysfs lifetime",
fixing the handler access race and sysfs teardown locking issue, has been
sent separately as a standalone v3 fix. It is not included in this series.
The base tree used here already contains that fix.

Patch 1 extracts the core and initializes it before built-in consumers.
Patch 2 completes class-device notifications and registration cleanup.
Patch 3 documents firmware-independent profile selection through class
devices. Patch 4 makes the legacy ACPI aggregate sysfs interface optional
and documents its deprecation.

Validation performed during development (before this rebase):

  - ARM64 built-in core with CONFIG_ACPI=n: W=1 build and sparse.
  - x86 modular core with CONFIG_ACPI=y: W=1 object build and sparse.
    Both CONFIG_PLATFORM_PROFILE_LEGACY=y and =n are covered.
  - Full x86 kernel link and QEMU boot with lockdep and list debugging,
    with active ACPI and with acpi=off.
  - Firmware-less providers exercising common and hidden choices,
    profile reads/writes, invalid input, mixed profiles, cycling,
    partial callback failures and POLLPRI on the class and legacy ACPI
    interfaces. With acpi=off, class get/set, notifications and kernel
    cycling are exercised. Both runs check that no new aggregate sysfs
    directory is created.
  - Concurrent sysfs I/O with two persistent providers while a third
    provider is registered and removed 200 times, last-provider attribute
    removal and repeated provider module reloads.
  - QEMU with active ACPI and CONFIG_PLATFORM_PROFILE_LEGACY=n: verify
    the legacy attributes are absent, class get/set and notifications
    work, and kernel cycling and registration/removal stress pass.

The provider API and profile names are unchanged. Aggregate writes retain
their sequential, non-transactional behavior: a failing callback does not
roll back providers already updated.

Changes in v3:
  - Send the original first patch fixing the handler access race and
    sysfs lifetime locking separately as a standalone v3 fix, including
    the requested profile_lock protection comment and Fixes tag.
  - Reduce this series to the four remaining patches and renumber them.
  - Rebase the remaining changes onto the current base, which already
    contains the separately submitted locking fix.

Changes in v2:
  - Add the Fixes tag to patch 1 and explain how the mutex-guard conversion
    reintroduced the teardown deadlock previously fixed in 041142d7d252,
    and how class-device support subsequently extended the affected paths.
  - Drop the proposed /sys/kernel/platform_profile/ aggregate interface
    and its ABI documentation. Use the existing firmware-independent
    /sys/class/platform-profile/platform-profile-X/ devices instead.
  - Preserve aggregate selection through the legacy ACPI attributes and
    retain internal aggregation for kernel profile cycling.
  - Refocus patch 3 on class-device notifications for direct writes and
    restoring aggregate visibility after failed registration.
  - Update the Kconfig help and documentation to describe the existing
    class interface and distinguish it from ACPI aggregate selection.
  - Revalidate class controls and notifications with acpi=off, legacy
    aggregation with ACPI active, and the absence of a new aggregate ABI.
  - Add CONFIG_PLATFORM_PROFILE_LEGACY (default y) to make legacy aggregate
    sysfs code optional, independently of class devices and kernel cycling.
  - Mark the legacy ABI deprecated and describe removal after the 2028 LTS
    kernel, conditional on userspace migration. Emit one shared notice on
    legacy attribute access; retain the enabled default during migration.
  - Move the legacy ACPI ABI documentation from testing/ to obsolete/,
    document the replacement class attributes and update MAINTAINERS.

Changes in v1:
  - Initial series extracting the core from ACPI, separating handler
    locking from sysfs lifetime operations and retaining the legacy ABI.
  - Proposed a firmware-neutral aggregate sysfs interface alongside the
    existing per-provider class devices (removed in v2).

Daniel Lezcano (4):
  platform profile: Extract the core from ACPI
  platform profile: Complete class notifications and registration
    cleanup
  platform profile: Document firmware-independent profile selection
  platform profile: Make legacy ACPI aggregate interface optional

 .../sysfs-platform_profile                    |  12 ++
 .../ABI/testing/sysfs-class-platform-profile  |   2 +-
 .../userspace-api/sysfs-platform_profile.rst  |  55 ++++++--
 MAINTAINERS                                   |   5 +
 drivers/acpi/Kconfig                          |   3 -
 drivers/acpi/Makefile                         |   1 -
 drivers/cpufreq/Kconfig.x86                   |   2 +-
 drivers/platform/Kconfig                      |  35 +++++
 drivers/platform/Makefile                     |   2 +
 drivers/platform/profile/Makefile             |   5 +
 drivers/platform/profile/acpi.c               |  15 +++
 .../profile/core.c}                           | 122 ++++++++++++++----
 drivers/platform/profile/profile.h            |  17 +++
 drivers/platform/surface/Kconfig              |   6 +-
 drivers/platform/x86/Kconfig                  |  10 +-
 drivers/platform/x86/amd/pmf/Kconfig          |   2 +-
 drivers/platform/x86/dell/Kconfig             |   4 +-
 drivers/platform/x86/hp/Kconfig               |   2 +-
 drivers/platform/x86/lenovo/Kconfig           |   6 +-
 drivers/thermal/intel/int340x_thermal/Kconfig |   2 +-
 include/linux/platform_profile.h              |   3 +
 21 files changed, 255 insertions(+), 56 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-platform_profile (70%)
 create mode 100644 drivers/platform/profile/Makefile
 create mode 100644 drivers/platform/profile/acpi.c
 rename drivers/{acpi/platform_profile.c => platform/profile/core.c} (88%)
 create mode 100644 drivers/platform/profile/profile.h


base-commit: 8244dc8f69f0e73cb1789355260b7d68bf5494e7
-- 
2.43.0


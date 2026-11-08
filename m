Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173822;
	b=up/P/jRVTC31iPKvXcgS5JmvF95fv1/14zO+rfAafLLgGWzzUSV4QTJCqXmopd6IQE3l
	 Qe05cavZfo6KyXtlfcnXfbet/71MP5b3E3w4Fbg4IrQ6NnmrN/LY/loPSp9tSHY2bocRS
	 rN4Nim2QhOioxU/H4XUVi2sWDL/emENusQp9HcL2cUlFDpADi4zQUne7SfohquLDdK3zi
	 GtNDDlZmqpIifutASeJfJTvfYVD2IGqdKHSfeqsMG8VpeVbizZt6Ru3fuXTvmfEQBlhxo
	 thtZC1zikhWhf6sKfHH0A0FPduGshM7Q8Y1fLhxAL3lNwSTMJoMBlJ/ptu/UwSJf6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
	b=Nj9GFopkdHwi+mRvbAFlkUS8ntrgH83gZCYMyjae403HVIN36OHwOAKeDqmjYtqzV/AA
	 EBc1g61wMGyKmmp+cNSqBDeyN+tdaL2EScBvk14oFpBFDE11bwlp+P+APbxE3zzlhIAuw
	 UyJBtiP2SU0mXeFWSdbNV7qxYc5EhO2KH//ETLbZ7Z3c1VBTq0US7w7t0nqYW8UkbL+Sf
	 dAVxDtba1LDdwcPKU5jzRWajQIFysNPPN7F5HlN6Uz6dbjcXYTMc49LIG3LWQTliJBB9A
	 jllixxU0ULrYg1dXUQAzLnPfc2qXx7w/kknLe9e6K+4dSyXfk4V/TutY85XWDtdQgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k7fI5pG4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F88606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k7fI5pG4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso1686685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173820; x=1794778620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
        b=k7fI5pG4uo55lbPEW3NEz7FyUKtUQcZKULR/CxTPToc4ALjBs2GlYauuwaNpuePIMI
         uJcnFsRVubheyEiEKN0cMUOGFhJZYTOd/DheiUx/aKyfvkyeW0YMYUUmnuUTEHY1gfIB
         32eLHnMHKclCuN+6UOS0JeBxgeT000I23E3p74SqgSrg81Dsb/gIzNOD/Rs6wOjaOfYJ
         Q7oBqD9H5eGRNvGnfWRlp5zMascAmo6jCT/Kt48TNZFQJtyI/M5jkgSmjWaev24ZO77w
         /1+KPZbHqa8Dp4UualDb8//G/rZUta4WEJFlYb1e1qMVX0jupbcp177VPSeLyQy+iXhc
         jXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173820; x=1794778620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
        b=an5U9CGVGnhvAYxiiq4+RWADM/d1I2/IeTIuskOEGElfN48rxMGR+Rtn3G5jRajORN
         wLgzsT+JewUipi8aombgN2WFO2/Jz91iWcB2TAQPrI5mqoPKTH7iEuGGXTRF4zpLpcoC
         Ozqwn0b178rLSZsz9a6O6bbkJ68qKCp2T2iSPgOQclVprXMn1ejL4ZogLnjNoU2z0quq
         RbQTNt12OJvYItDEriJYfAZ3XEkGLjDeE6NefiXlOLBxd7wclD/jlv86ldmqZkiYv93y
         JHV42hY2SbsI63q91eJWZzr/8f7jexoLTVBoxZSIp3r1eDjoZSpTAPJlybeC/vO1FGQD
         CdXA==
X-Forwarded-Encrypted: i=1; AL+hErE5DJoFyP5myty3/MDL8aSmlcsGJQCZmCfJm/yC4EgJzi8bt44fvd+sikulEY3HGcuHaYL62Hy5bcfuYqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xdy0chM29aRCJP+eNp/RiTa8e4SUqO386E2ZAeYz6do2KQgbV
	1Au+wmfXUiSlKhd9rOcZNA1rrXXcYbQRACqe2uWoPew+M+W2W2Xgfy63
X-Gm-Gg: AYBFou1w+E5ftNRGxEaNyeVO0rXG8TS5zCdmAh43YjMoQmieNkUFkZGlAgDyi0D2rhl
	abeUtp3ptcZQgT+mMGrm3z2qNGQ4NtrucIs1ziyDD4ZCK3o2OXYn0zwTsbCgZW3i5tZsY5Q5ozM
	Jn/6ibynphn6QQDVnt0Lp45bGnldrrAsGA+Fl+oQqC3JAttR+1TALJLMepEP/ZcZjVgH4WcOBRn
	onCYuH4Z6+UxRe/TDaW1mqNQukJQW8vWSoB48wBQUC0SLzSnIFQv2rhR/EhHoUBQ1I983bvS1lB
	tIUsjGuIwQocKISuuHAQtRAUPMJCmT2Or8e4qV/B0GOCI2bbE1U64jJedUNcZXcfr53wQKxwRiy
	3rTBcOw0rDF64gQPtb0FX4h8LW1Mc7FGXuNxxI8v3yDq23k6h4ZkiyC35EA55cZ6ORnmms66wf6
	/jT8Elv+uXDhSo57JOvVsyaqLir89H3Zn8xG7YY+GNCNwc/KA9fkXktFee4brqSiyBAz/246zt5
	q0m9fEEAbtjQmYAmlHAdtKDRFkDCrz3Em9proCtAWNXfA+w3EWCPjxEPQXoS2GT9JRJZo/l7TDl
	Jx+xElYYZzosRjti0wiiOHhhQwWp22G8P/8w1aqk2Pmc8Ch7JLQkxi3fNuwB
X-Received: by 2002:a05:600c:4eca:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4b94d762f98mr43434335e9.1.1794173820341;
        Sun, 08 Nov 2026 13:37:00 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm92178595e9.6.2026.11.08.13.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:36:59 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Sachi King <nakato@nakato.io>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
Subject: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD Surface devices
Date: Sun,  8 Nov 2026 22:36:54 +0100
Message-ID: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a rebase and rework of Sachi King's series from November 2021 [1].
It was reviewed then, the review was never acted on, and the thread went
quiet in March 2022. Sachi has confirmed they are happy for it to be
carried and no longer have the hardware. Both patches keep their original
authorship and sign-offs.

The problem, restated, because Hans asked for this in [1] and never got a
clear answer:

The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 ACPI
device ID as the Intel Surface devices from the 5th generation on. Both
soc_button_array and surfacepro3_button match that ID and tell the groups
apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the OEM
Platform Revision, and treating a returned 0 as proof that the method is
absent. The AMD variants implement that function and legitimately return 0,
so both drivers draw the wrong conclusion, and surfacepro3_button binds
where soc_button_array should.

The sound test is whether the device implements that function at all, which
function 0 of the same _DSM advertises and acpi_check_dsm() reports.

To answer the question of which models are affected, every ACPI dump in
linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, for
UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:

  Model                        fn 0 mask fn 2 advertised
  Surface Book 1               0x03      no
  Surface Book 2               0x0d      yes
  Surface Book 3               0x0f      yes
  Surface Laptop 1             0x05      yes
  Surface Laptop 2             0x05      yes
  Surface Laptop 3 AMD         0x0f      yes
  Surface Laptop 3 Intel       0x0f      yes
  Surface Laptop 4 AMD         0x0f      yes
  Surface Laptop 4 Intel       0x0f      yes
  Surface Laptop 5             0x0f      yes
  Surface Laptop 6             0x0f      yes
  Surface Laptop 7 Qualcomm    0x0f      yes
  Surface Laptop Go 1          0x0f      yes
  Surface Laptop Go 2          0x0f      yes
  Surface Laptop Go 3          0x0f      yes
  Surface Laptop SE            0x0d      yes
  Surface Laptop Studio 1      0x0f      yes
  Surface Laptop Studio 2      0x0f      yes
  Surface Pro 10 Business      0x0f      yes
  Surface Pro 11 Qualcomm      0x0f      yes
  Surface Pro 4                no _DSM   no
  Surface Pro 5                0x0f      yes
  Surface Pro 6                0x0f      yes
  Surface Pro 7                0x0f      yes
  Surface Pro 7 Plus           0x0f      yes
  Surface Pro 8                0x0f      yes
  Surface Pro 9 5G             0x0f      yes
  Surface Pro 9 Intel          0x0f      yes
  Surface Pro X SQ1            0x0f      yes
  Surface Pro X SQ2            0x0f      yes
  Surface Studio 2             0x0d      yes
  Windows Dev Kit 2023         0x0f      yes
Exactly two do not advertise function 2, and they are exactly the two that
need surfacepro3_button:

  - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HID
    and _STA.
  - Surface Book 1: it does carry the _DSM with this UUID, but function 0
    returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function 1
    there is dGPU base attach and detach handling.

Worth noting that v1 said the devices needing surfacepro3_button "do not
have the _DSM". That is not true of the Surface Book 1, and the inaccuracy
is probably why the problem was hard to follow. The commit messages now
describe what is actually tested.

Changes in v2:
 - Dmitry: a returned 0 is no longer treated as invalid. acpi_check_dsm()
   makes the decision, and the revision is still evaluated and dev_dbg()'d
   afterwards, instead of that evaluation being removed.
 - Andy: the dev_dbg() of the OEM Platform Revision is kept, and the new
   comments use kernel comment style.
 - Hans: the commit messages now state which models load which driver and
   what each one's _DSM advertises, and the in-driver comments are
   expanded.
 - Rebased onto v7.4-rc2: surface_button_check_MSHW0040() now takes
   (struct device *, acpi_handle) and the driver has become a platform
   driver.

Not done, and I would welcome guidance. Hans also suggested replacing the
ACPI match with a DMI table plus MODULE_DEVICE_TABLE(dmi, ...), so that
surfacepro3_button stops auto-loading on machines that do not need it. That
is a larger change, independent of this fix, and the survey above suggests
the _DSM test is reliable across the whole range. That may be a good
follow-up if it is still wanted.

On merging: please do not separate the two patches. Both drivers match
MSHW0040 and discriminate only in probe, so with only one of them applied,
which driver claims the device on the AMD variants depends on module load
order. Hans asked for the same arrangement for his own two patch series in
2022, so either tree with an ack from the other would work.

On testing. Tested on a Surface Pro 4, which is the "no _DSM" side of the
check. Its own DSDT agrees with the survey above: the MSHW0040 device
carries only _HID and _STA, with no _DSM at all. With both patches applied,
MSHW0040 still binds surfacepro3_button, soc_button_array still declines,
exactly one input device is registered, and the volume keys still work. No
"OEM Platform Revision" line appears, which is the correct result here: on
this model both drivers return before reaching that evaluation.

That is a regression check, not a confirmation of the fix. On a Pro 4, v1,
v2 and current mainline all take the same path, because the _DSM is simply
absent and acpi_check_dsm() returns false. The Surface Book 1 is the case
that separates them and I do not have one.

Worth knowing, though: the out of tree linux-surface kernel has carried v1
of both patches since 2021-10-05 and still ships them today on its 6.19,
7.2 and 7.3 branches. This logic has therefore been in continuous use on
Surface hardware, including the AMD Laptops it fixes, for about four years.
The Pro 4 above had been running it before this test.

Neither I nor Sachi has an AMD Surface Laptop, so the half this actually
fixes is still untested by us directly. If anyone with an AMD Surface
Laptop 3 or 4 can test it, that would be very welcome.

[1] https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io/
[2] https://github.com/linux-surface/acpidumps

Sachi King (2):
  Input: soc_button_array - support AMD variant Surface devices
  platform/surface: surfacepro3_button: don't load on amd variant

 drivers/input/misc/soc_button_array.c         | 31 ++++++++++---------
 drivers/platform/surface/surfacepro3_button.c | 31 ++++++++++---------
 2 files changed, 34 insertions(+), 28 deletions(-)


base-commit: 8a65162514fbad21a2c58ffed65f42b27e92b163
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808581;
	b=Zn9zdF6NpcdQffI2x6F3E3sQAqIwWSMPQCuNKhUvCKWczHDmH4LMIxHPeyYVyENMnB9o
	 8fBArJSwhKHcxvew+p8sJDDCtMrKuQm7Zm5htdHrUZr7Znt8ZsoVvbCnOCr1vxHekznel
	 1Vy5jXLJh6df4gLkFz1uore9/xpmK06iFI9QcKSOZALWuA4BTWWk1y5tynDIVB3SgA3VU
	 kNkAfBPmpWm/m0ZSlK8px2YwglHu4Jzp7mPapFAy1UBwF0r9sgC176oYrp8lJ8RS9IIXz
	 57HEzLBI+/jEHb5BPKyJQ0HA1G9uhmgpd2w+a9PgG5zCZOaanbhMflCJfaausI01eWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
	b=Dn1vryFj3YsYMt6kPVoOBi1QpJJSd+QbVpbgtZ272cLCptyIDlKazAu/RElymG4PvyB4
	 KJmCKc/2B2EgmibAyJD/v96DVLpmENtAsXPa28yZS25cPMkKKo7ZvP6A8xS4TTW9203VT
	 g9QBGo/4GpEiao8mAdor1HBjVsk6sPT3b5KKyE05APBiSYVl7fkblS3BZ2lBzHuQF8jnm
	 eW7P0fZ1I2sm36vaU8Y5vddG++VTUuhabS2k2IgtJ+GygPXTEAwusBcQXpmayhwS+1Yim
	 53lmrw1oICWjYpXpzub0uoycuBxRlnNC7CvKRcFjc46qzcPjF0MxZxX/+PhUNOt7HwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LASKncoP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D53F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LASKncoP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so7192755e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808579; x=1794413379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=LASKncoPj+DC6eRfOvbvLJRVuD30FXYsGdf91pLHBjrH8tqqVZoeDgSZbQSo2wvvkY
         LW3BbUjIhOSPyvCMOM3iRo8l6s2i5YxVCD2QZi7ZEeJQDIItW8iAuWDIJ3OfQVOxfd/x
         vpbqabnxVDYnaO9daH6hmfSjfHSznyGvI6A6JtdTcRVcQBRWLAcRKtuad9slHsOKT+vq
         m8lr4fd+b+D+KIdnDh4vw3UnWkMgciAcxPSGUrLQfk9PBPDNgU0rW/TMYBkh1cR0n+Wo
         hspP8+/9qDf8Wy4922qY7GTy+8uFyUiYDu1P8I11E17ARYrHP/LPTno61GfWEq0xcm/h
         NhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808579; x=1794413379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=FQ1f8o2ofESVd9L71lLX0HYkM37Sp2J/5KZ2Ix2GiJuutStXAeEzBkRI4GPM1gOlWd
         PfSCQhCurI9tVuO+mJEmZLEWkY4wASQYYZIoAeT67paL6TD0LsyneUahKwe3JY+ZBO8h
         5zsNYZD9Ae61Wj7TKVIvUXikZqdrbUnSrfya5jamxvwvr98Zl47eNQ/AgnTvB69png2z
         wga9pdfc0oNoRDC5nf00HW+mVOctlAasuIbvFesXuvUVg+7Q8p3B8K7+YgzHM3mi3DBe
         ouEb1v91fwFHuP4n8ci0AibIyK0fq6TJLrq34Xy+xloJglHppX+eFoV31+jOOf1GNKf8
         n00w==
X-Forwarded-Encrypted: i=1; AKwUvByuFMUdP+x2k0cmSwTsf4jm3QDKXZdlaOhfJ5WvB5u9icKfaXq8LKnDRCmAF/Ndv6TLKxl157hwPSU75Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F0TMJTFQ0zNV6kaQYdVfByrAYOOP7jMieB3Jsyy4tcMYsapOv
	Mwh806bis8g2G5W+o8Q44SVG9IuwLb01wmE4YhJ6zOtGLgLBJTibA3uGztmBBevrIgE=
X-Gm-Gg: AYBFou0OLFfmEzwVsd3eoeMpU79G3iXkeMkb3qcLJtvL10SbUANfaH3p+B5yIMwrGN1
	D1SHBUkpJUtrfJYH+FBqnQ7VuZtMep5/jTuVmt9ANSY4tT9rWygR6QNubnjmDxcNOaWPOA+8wf9
	BMcGkDKzpGspxRvgGGxf9PFm77PeAybdWv6f0NgHQkjaBqkuSohaJskTwAMj3spyeMZLVZOZM0Y
	zQyUsgNTUM9XXXwYIOtU+SttkH+YUqTZP1MW4NAwGP4QQbDcIKiYlP7oPewTA0c7oXgxtYahgio
	LCoDCzPb6AM4cyWLFdnaUPuDgjP9olx0RuYISvXTh48A3qZYNdciEUa/32JjEVU1L2cX2bjvahq
	j18lqY7K2YzW+fhLmKNgLBXDePfKAwcubMPL49M5SKFbn+5PJpXNCa9hLMC5bIUJjtSojswcpOo
	6tGBHNtCoBDMcrIatRYS0ilSov7f+18v+jO20a6b9E4JiuJzWeXdmP2T+hwdeTJlne9W6v263eo
	NXfkxxrGFH+JXI0s/IZpMnVfa3/FWj63IOR6R1l4oubK7l6CIrFKBevee6iWe0rNTyH2ymqWahS
	jmmu+HsThhE4qfIHOrPfc6HyEugWw/Q1lXc3qRAOhSatRQ==
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr408199185e9.8.1793808579070;
        Wed, 04 Nov 2026 08:09:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/2] mfd: use designated initializers for acpi_device_id
Date: Wed, 04 Nov 2026 16:09:29 +0000
Message-Id: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbUmnJlVceQ/DorQDjMaWtEA0h
 LtbYOHyJe+/v0CiyJTgViwQaebEwWdQpwJsb3xHgl1mUFJplGcpjB1YvFsnjDa2cqj1BRvI+hC
 p5c+eetQHp6l5kh23/Wb0nMYQv/vXjJt3ZFGqf3ZGgcLlL1VVuUzX+9hTF4IbyHcT+9KGcnpBv
 a7rD6JmhzW9AAAA
X-Change-ID: 20261030-acpi-mfd-a6ac9d16671b
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=3284;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=VoE1Fm0xZu0mayKQlGhQQZLIaRumf/QdmutseQMZPwA=;
 b=uybqUEyxjF7iAKy9pKtXAKAQ4dhu98wji8c2TC5h8NLcf/sZMMgMUqqVTNiO6oIJkkWAN26vq
 nWMg9/1QuTnB3bWLAzs8CkPtkkNt8REQo+74FNLy12d6dPmtivfG8A+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v2:
- Split Intel LPSS into its own patch.
- Added a review tag from V1.
- Link to v1: https://patch.msgid.link/20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Zha Qipeng <qipeng.zha@intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-crypto@vger.kernel.org

---
Pawel Zalewski (2):
      mfd: intel-lpss-acpi: Use named initializers for acpi_device_id
      mfd: Use named initializers for acpi_device_id

 drivers/mfd/axp20x-i2c.c              |  2 +-
 drivers/mfd/cs42l43-i2c.c             |  8 ++---
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++++++------------------
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +--
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  4 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +--
 drivers/mfd/kempld-core.c             |  6 ++--
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/upboard-fpga.c            |  6 ++--
 12 files changed, 50 insertions(+), 50 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261030-acpi-mfd-a6ac9d16671b

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


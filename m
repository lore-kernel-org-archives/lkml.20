Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897570;
	b=v1PZbrz05m9w6yXaP8TwsiahwaFARK0JKlqtQcCtl+GpyoO3wksVNbuX8ukeqoUmeaHM
	 ZarRPgmXk7vEqqns4TxW3I3hDW+EcK/mItv8eNCAI2EHPl7Obh7F4iZ7d+Va6wOQseVVe
	 +ad0CDueKCqaPEhQ64tgtZ2sjLYTuDB4Skra7XQlUtnle5FeFnc6PEbozq9bt8EFdOhWm
	 yfpZgBqxEbWOMaHpC/4incJNQhpKBxD4hCpkj5TbmcOVzb/OxrwubQxGgfsuDEDNNt5eI
	 sQXL0eQIOL2wT3I7b25/pIMMkUnpoail12EY3vxgFvhspbSFmjhvhmADvFrClY26drw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
	b=EbWUGpcSlo+AT/TNZ8hB8EQDZZ75OPZBFJhMafR5iETriMvUXk3nyHQ1rZ3lI6XKLaM5
	 JxgFu6/llj4IeN6rs6s6rJYFUgGBxk9TGbMuroeamv8twHxZuA9ajtJlMJn4oqmGsWAEP
	 tToZgQfVEx+xtIqMhIIbWGyiIIM2VSABg+0MiSsvd3FXAvUDGc8LT+wuIYkbDheBP9fRm
	 M0pxgDJebEbkz8CI5jqj8vQU0UPTzhpVU0jAAt+8obRdNCS1nefn6KDlIUwOZn5fzq1fu
	 b9CG65FrRE160SC/WzmDP+V2sSIF2rmbUuGLlyEWaxzPl4KrHl3RvRDT9F6R88dG7Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU7Z1vZm;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA555606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA555606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU7Z1vZm
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so4737659eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897569; x=1793502369; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
        b=gU7Z1vZmR0Iwt5f9u8AMyAazmCJce7TybJvO1MVFdKu/M2D2RLfCdVJppnJ8mmPVWc
         fAoDGXXKyzgXI5v6QqX9KYoSdvQ+wZ2TC/SLtOb4UjoZVDA/LS9HK093prL8iVMyc27v
         ZLnizMbKhu6flpUk283z5hexXNsk++q9ILpRTcIXNEmYJNaGAuXDH6hYc9U0LHOQfnJ8
         hiqvx5s+b1MoD7nZm3LhUejEylFd2QCHniaA6Nlu0SPuB982Mfu26+OY8cgSQCz8bEVf
         0S9+fR6YKaIEiYIHOcc+fFF9YRWshwssk9iY1qnBzY1AeHgYTcqYLsmfXlYFa5gKGqkv
         zm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897569; x=1793502369;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQPs+jEbXBZhr1n+6NKSHLzdxjjdigtdbOq9zqTS+hA=;
        b=pvMTN4uwBLa2EVN4AMadoKcJ5U1ptgBoRJNz2ieHzX6lfEIj61WHmLGssRU0EYrPPb
         ZtDd4VBQvNdj0xKpBwooqrob82jHFPbpN/rx9GeXB8GAZAVf0hjqnny6cp6CvSYzja+/
         ACTH0M+IVc2bthyYBYDbuJaIdrshjICtR+ngbd58taTXlzhFfY7n9X8N2K5ZN4scWoKL
         TtK6Otx2T3OCNgDgLSpG6RNPW2azyc+ZbcuE1gGU3XHYyOdpBEw8G37JpAkiLYbOKWgd
         UmKON6bJyT0mHY3aRYYb2TVq7XFmSWd+p93NZP/BPB9deNgN7NDJ+C4g366azD3w96wD
         tyCw==
X-Forwarded-Encrypted: i=1; AKwUvBxApoCmXDK+3eGJ21V77KkHyJgQpz22pQw77YP2qMfZcc3amtRQ0EnfughjxC+EBsDpeBbF9HmXzSg4S6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzHL3hCtSiJuAHnsK6utyDotLX0ssc5C4/vCnZR8IztyZNNhLX
	g6MFajwQJSjUuUqBrrzwItkaEA7dn7LdPBy8qwKU9sB6p/e58V2jcDYR0SrUIg==
X-Gm-Gg: AYBFou3hHFdWAeNZLnukCpgxJCJ/ZTv2fKNT/oJ4PodryOc8Z9u4KntD+wdkgbfOmP0
	bhrBvz0gm8F3gC00y8R089yo4AMlY/RBEcVim+ARKZRzAgVjgPuErkiZgvWaqYHSBRaINSLL4Vu
	LgFvpWU/BhseBPuOmZaYEildcKQ6S4LAfJUzvDXFSTu0zB7Ak2/cxtrtAiWkM7tjyg7roCRWC6O
	JB9R2W1hlDpYudVsZ2ryFINVSicA4zsbw71cpel9/9cGJ7+rXU1GrkFFy8SM1nKa10eD1c4eqtT
	lms3dSvhWsUz1O5chvwrmc8ol3VGZzyy7WngK1ihlPb9T2+FG1rCc9H7ybzQVt9YdZj/3DIAyTc
	IFjZInznLGXItm/dSZHopRRVUrN29d3Qv7T8TSRN7mKR5pmuZrMK1W8wfiD83dw/wRUQZQYz62b
	+Ty2vpJLNFvzZE41neQj/M8ujSCs2tTuqmav8mFeg6pkpSa/u4qrXTSvrgQtLUU+12snr3bk0j0
	f51Mv57P5FHb4R2jyc+8zOTGtdpAZpvAQZ7dQlRVL1MtQHd3thUvnfE46DGgzGt2C08KrUshH4/
	UPQYryJnFJ8QzZitanY7kotLspJiCi2pPccgtDwvCGc=
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr5185274eec.10.1792897568651;
        Sat, 24 Oct 2026 20:06:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:08 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/31] hwmon: convert i2c_smbus_read_block_data() users to
 pass buffer length
Date: Sat, 24 Oct 2026 20:06:03 -0700
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABty3WoC/yXNTQ7CIBBA4as0s3YSIGLEqxgX/EztqAXDtGrS9
 O5FXX6b9xYQqkwCp26BSi8WLrlB7zqIg89XQk7NYJQ5aGUMDu+xZGQTUcYwC1byCcOjxDsmP3m
 0dh+cdvbolYNWeVbq+fM7nC9/yxxuFKdvFtZ1AwNCuJ6DAAAA
X-Change-ID: 20261022-hwmon-i2c-smbus-read-block-data-554b91958a09
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert all callers of i2c_smbus_read_block_data() across the hwmon
and PMBus subsystems to pass destination buffer sizes, adopting the
4-argument form introduced in commit 68f382641f8c ("i2c: smbus: make
i2c_smbus_read_block_data() safer").

For drivers that used intermediate bounce buffers (lineage-pem, lm93,
and pt5161l), redundant buffer allocations and memcpy() calls are
dropped so data is read directly into target structures.

For drivers performing string comparisons on the read data
(acbel-fsg032, bpa-rs600, ltc4286, max15301, pim4328, and stpddc60),
ensure the destination buffer is explicitly NUL-terminated before
comparison, and pass a length that reserves space for the terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (31):
      hwmon: (lineage-pem) use 4-argument i2c_smbus_read_block_data()
      hwmon: (lm93) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pt5161l) use 4-argument i2c_smbus_read_block_data()
      hwmon: (kb9002) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/acbel-fsg032) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/adm1266) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/aps-379) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/bpa-rs600) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/crps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/d1u74t) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/dps920ab) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/fsp-3y) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ibm-cffps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/inspur-ipsps) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ir35221) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/lt7182s) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ltc4286) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/lx1308) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max15301) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max16601) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/max20730) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/mp5920) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/pim4328) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/pxe1610) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/q54sj108a2) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/stpddc60) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/tps53679) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ucd9000) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/ucd9200) use 4-argument i2c_smbus_read_block_data()
      hwmon: (pmbus/zl6100) use 4-argument i2c_smbus_read_block_data()

 drivers/hwmon/kb9002.c             |  6 ++++--
 drivers/hwmon/lineage-pem.c        | 17 ++++++-----------
 drivers/hwmon/lm93.c               | 12 ++----------
 drivers/hwmon/pmbus/acbel-fsg032.c | 16 +++++++++-------
 drivers/hwmon/pmbus/adm1266.c      | 25 ++++++++++++++++---------
 drivers/hwmon/pmbus/aps-379.c      |  3 ++-
 drivers/hwmon/pmbus/bpa-rs600.c    |  5 +++--
 drivers/hwmon/pmbus/crps.c         |  5 +++--
 drivers/hwmon/pmbus/d1u74t.c       |  8 +++++---
 drivers/hwmon/pmbus/dps920ab.c     |  6 ++++--
 drivers/hwmon/pmbus/fsp-3y.c       |  3 ++-
 drivers/hwmon/pmbus/ibm-cffps.c    |  5 +++--
 drivers/hwmon/pmbus/inspur-ipsps.c |  4 ++--
 drivers/hwmon/pmbus/ir35221.c      |  6 ++++--
 drivers/hwmon/pmbus/lt7182s.c      |  6 ++++--
 drivers/hwmon/pmbus/ltc4286.c      |  8 ++++++--
 drivers/hwmon/pmbus/lx1308.c       |  9 ++++++---
 drivers/hwmon/pmbus/max15301.c     |  4 +++-
 drivers/hwmon/pmbus/max16601.c     |  7 ++++---
 drivers/hwmon/pmbus/max20730.c     |  9 ++++++---
 drivers/hwmon/pmbus/mp5920.c       |  3 ++-
 drivers/hwmon/pmbus/pim4328.c      |  4 +++-
 drivers/hwmon/pmbus/pmbus_core.c   |  3 ++-
 drivers/hwmon/pmbus/pxe1610.c      |  2 +-
 drivers/hwmon/pmbus/q54sj108a2.c   | 27 ++++++++++++++++++---------
 drivers/hwmon/pmbus/stpddc60.c     |  4 +++-
 drivers/hwmon/pmbus/tps53679.c     |  9 ++++++---
 drivers/hwmon/pmbus/ucd9000.c      |  8 +++++---
 drivers/hwmon/pmbus/ucd9200.c      |  4 ++--
 drivers/hwmon/pmbus/zl6100.c       |  2 +-
 drivers/hwmon/pt5161l.c            |  5 ++---
 31 files changed, 139 insertions(+), 96 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-hwmon-i2c-smbus-read-block-data-554b91958a09

Thanks.

-- 
Dmitry


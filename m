Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193968;
	b=XauuDbEqkcqUL/3i4b7lUcFldME1vc4M3t3CeVuTCh3XuaaWPLUmLgaFZMPX+OLws7sN
	 pPjRGEEpwPIerDRAQjV/jKg5++xir6VX/gDHC6nMZ4pL6REdoxgiEPsPOPWKgZ7dZU8lP
	 t18yNk92zS85IVIfVAMTisd7WT/pcIrE7gVW408kW8Yndwz3iFnEF58bkpSc/41r9lNTx
	 ySvk1CRdHonRxr3nIgy5T1IVyv6whDcbwKZ+cf0srfM++U+VBKRFjUrMcJEcnwVXLPges
	 fQIsy0w39wes+mjk86isdGJ4qcYvC1nvh4EDjV1o53EnsXgEnaShnzsCnTt/CrCv4dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DOaHU7ZgVC+P0bPSjaN43IEeRLa3GiPBavjQ4gEWVdI=;
	b=Au1vcJ9jecFlVV0+i1jyyp8SgZydu9EOGQzddRaqBz/lYr9FttzIsDp4U9p4u+pyrvvN
	 gtsfKeOgfGgZGmecAWXPSbIzr7IHlrCAlWfj+0iOhQWJolQssXEj1LpgY81YcBWWHr7TH
	 bf/FXDnFh/JK4pP6U65Y80uNdau4HJhBnIRtoyi1eluppWCCpgY1k4SjmP6yWP05hZrgM
	 tjZqxt5xtgomiwjx9omcj8iUUl8IXOfCvJgurcMRSmlLiETgtZzUw8VNUBgDzpT/BCLrU
	 AlqPboSrQ3BBZLh+mSTVBQdWC1xyXY+EDILvhJE4sIqdcFNhI7cbNf8Dt6WyJgjIGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1vNilsD;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED97606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1vNilsD
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so335190c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193967; x=1793798767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOaHU7ZgVC+P0bPSjaN43IEeRLa3GiPBavjQ4gEWVdI=;
        b=S1vNilsDMh8D8VkeSGojf83TefvqMa+Cwa4mAc5rV8rzmAoGcedPNhm1R+ViVYyNcN
         fPBtLd0g0WO8nTDPUzJztFB4LwDnD7j4TQaGEEMnRRKrXcYFx/1bK9i1V/BOKaLOkSR/
         uFar4HI3i2DzISfBZ4xryYw0bSBFlAIwKXmPJue205kxnjjeQtrReI6MnKQUK5nouI4Q
         H6S3k3+2T/Lw5XxW1z4GU2wrgZZjG1KH0Q9Onem4fIAatf//n1upPzW9hK2Rz/qwdZ88
         IfOsnverutSqNn7O2JesprIPb8exQexAj/QzjLHmuGLhgzSVcBTpoaXh6fsbJ/iUo7Ni
         1R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193967; x=1793798767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOaHU7ZgVC+P0bPSjaN43IEeRLa3GiPBavjQ4gEWVdI=;
        b=LQ7GiNQTekCuLGOw38+juSQInS55ohH9woh25HAGFtcd0Deqk+tpR0SqrZpqSxJWum
         s+C+OO9IpUGII/SIrgaucOWfDHxeOjtrLQ5msukAQxjbQzIzMgX/wSoa+da7Rjq7JjmA
         iC2ngQ1miiGmQfT5hDF5T1riytUBr0Fus+HdNKRYgzCDGudc8YqncuNFMVRqBWOoOk4/
         jIBeGB9SIuacKaqeXfoFxlNZFbtgewzAOaRF7yrhVj2psP2+BYWEOlIhbBqmpNxRbL9A
         9szCmhqPp7czOceFnt8NryVoxpereCtUgPFHum+p4Wo0wRcL/CrR8YZ4amsI1GG6bCkH
         DohA==
X-Forwarded-Encrypted: i=1; AKwUvBys+yDxUsm2AMYFba1h519gI6QfY882ZvfFH45C/8gIUcgS02F3emLlY4KZ+Z4B2O2xqXbLAx9uEd2KQmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp6MvtZS03iDC0JDNfumE03MWAXo8bnJx6bghWeqERdjeSHm7O
	DCZUsf/N0YOQcKGQynbZgspfWl8skN/rL66vOl7JXdxFMoNbGbEKdwzm
X-Gm-Gg: AYBFou09WSibWiQaUd61h09Q1qQpXW1GKcy5xBzEWC04CwDlCtJ8gzEe72URsE8bgxQ
	a1eCYpDuqBkgTTRx6FW44xSSHyUNXc1hcR8BKPD3qiinzffc5FR3uke+39RRt7w2m2/z078fs+E
	+vT0F5o9Gqgm1xtg7gN7b6nq5Fi4FNycfKDqG1ot5HQyPuXBHt5iWsHPgOSyBI5z15TbGruMTXZ
	8na/gzgFhL4LUdv7wBZBd8WyddP1a4vhLAuvrC8udYCzFlorqEZh9Hw7ZL2tE+mo0TSWR3lM0b1
	6vA84klSg7rtVEPqsCOOrB0POxixW7469b5MRjiAouYX0s+ev+9TIyx8eVUAp0HuURy+XU7HpqD
	vrVvnJ4SjjWCZUleMYK3/iIYUd0eRmbqeZqPYrZy/qFL94AU+2L8wo38D+qD/cQfe447DPKEDj1
	qzPLGNGVvGE0xz8SO4abeI2fB3cSFq09u3TLVcf662RLPykyJxGA0RQLiAyrpi06lMuqfl9A//B
	Lqm7f3ym91KbFDm9H64mll8ZcT9bmXRGIs1jSpdjIiHH9rowcQ51fBUA5CbRNQpveQf4GTcMONS
	nbsRxG08wYfcK6/KCwKkHJ32nXLnc90lncG0DbUIcBRvjfs0+GcbIo9vEx+UvrPr5Hf3
X-Received: by 2002:a05:701b:2803:b0:1a7:a79e:224c with SMTP id a92af1059eb24-1a7a7bca75bmr1729249c88.34.1793193966766;
        Wed, 28 Oct 2026 06:26:06 -0700 (PDT)
Received: from toolbx (2607-8700-5500-3d9a-0000-0000-0000-0003.16clouds.com. [2607:8700:5500:3d9a::3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm10708639c88.7.2026.10.28.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:26:06 -0700 (PDT)
From: ZiAo Wang <ziaowang2007@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	ZiAo Wang <ziaowang2007@gmail.com>
Subject: [PATCH 0/3] Add support for Valkyrie USB LCD displays
Date: Wed, 28 Oct 2026 21:25:33 +0800
Message-ID: <20261028132536.375927-1-ziaowang2007@gmail.com>
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

Hi,

This series adds a DRM/KMS driver for Valkyrie USB LCD displays.

Vendor website here:
https://www.my-valkyrie.com

This driver is devloped from scratch via black-box analysis on
vendor software. Currently only supports two variants, I'm sure
there are more variants, but I don't have them.

The devices use a vendor-specific USB protocol. The driver exposes
them as standard DRM outputs and converts XRGB8888 framebuffer data
to UYVY, the only format device accepts.

Patch 1 was authored by Ho Jie Feng and provides the XRGB8888-to-UYVY
conversion helper used by the driver. It was previously posted but
was not merged because it lacked an in-tree user. It is included
here without changes to the original code, with my Signed-off-by
added as the submitter. Ho Jie Feng is CC'd on this series.

Original posting:
https://lore.kernel.org/lkml/20261019154820.68659-2-hjf3108@gmail.com/

Patch 2 prevents the HID subsystem from claiming the display control
interface. Patch 3 adds the Valkyrie DRM driver.

I wish merging this series through the DRM tree, with an Ack
from the HID maintainers for patch 2.

I tested both supported variants on physical hardware using the
Sway compositor and verified that rendering, suspend, and reset
work correctly on all of them.

Thanks,
ZiAo Wang

Ho Jie Feng (1):
  drm/format-helper: Add XRGB8888 to UYVY conversion

ZiAo Wang (2):
  HID: quirks: Ignore Valkyrie USB LCD devices
  drm/tiny: add driver for Valkyrie USB LCD displays

 MAINTAINERS                           |    7 +
 drivers/gpu/drm/drm_format_helper.c   |   73 ++
 drivers/gpu/drm/drm_format_internal.h |   21 +
 drivers/gpu/drm/tiny/Kconfig          |   15 +
 drivers/gpu/drm/tiny/Makefile         |    1 +
 drivers/gpu/drm/tiny/valkyrie-lcd.c   | 1413 +++++++++++++++++++++++++
 drivers/hid/hid-ids.h                 |    3 +
 drivers/hid/hid-quirks.c              |    1 +
 include/drm/drm_format_helper.h       |    4 +
 9 files changed, 1538 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/valkyrie-lcd.c


base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
-- 
2.56.0


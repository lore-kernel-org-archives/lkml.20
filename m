Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD52BDC0F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997290; cv=none; b=c2YUzMgzsHCas9d19gF2lPhxTfGb8x97ZswpGBPet9K7CXOlgPYdno1fE4yV2YLzJfBUJEVn+/cFdHQ5GbWr6enB4M3nyPYixnCauUR0pHgisIzOTAVCqkTD0A+ZGmf3R68t5d/3JW4L89e9NJEG4w6ZbHYmJsCeR7YXiMDjuvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997290; c=relaxed/simple;
	bh=l9tqnFzFrSjN8cXxumhwXJEJ078VRqZiI4KHy0mccoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lto6e2cbP6ZNXh99zuPYKN4NBClgI+3g2BaFIe1w+/WKLnxGY0LUF2zx5UinmZ9UaU7e+IekB8kyStPyVIPUoqN4ofHWCGm9dd1VOG2bSDAya1+Scb/fvygaB3InyIfNdkK+3gHR2VtBvvOeYwlFx/nSmoiXGRrP+ijq7y93yT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2HHUwXU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2HHUwXU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso371049a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787997289; x=1788602089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC0I9ujd++ODGJE/sqEk3NvSSAuaZ1MshchVq7tKt20=;
        b=E2HHUwXUzOOEuH4jge23rKbOvEj3NkiBJSrjK2KkiRC8m2Oph52BG6qNUi3S/3Rjpq
         PdnNVuozclVabXc6Pm2xva8UH41XAovWTbYPbbWvPXFMYbdlfhA3lH/0eLoRwLWzH3dP
         PrcFO3w7LqFtOxn+zSES1LBX8OCGnxQULVnyr6GkI7I6Kzts6BixNWuLHMgzNm06L9Rc
         SasOEwzf6CMb7474fg8a/r+5eZRYV7MZOaNW34UlSqwsc6pebq1EJhEHI301v0UOK7Yq
         N9dvERzwzPpqbWt3a94zrE3SnGvF6kQlYI2vDefiollttAaALtPVYXRdAv6Pclc5QXLw
         iOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997289; x=1788602089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oC0I9ujd++ODGJE/sqEk3NvSSAuaZ1MshchVq7tKt20=;
        b=JOHPcBsk97duU5lyoRYXETvPJe3zS6O/fUPs1llX0PHPVaWshGc73MjEEVtBy8spg1
         JwySH6msm/0oPYAiHvsZRAkNS3j2CC/DSCAey8c56RHNC0sAoaTxNwlLnlYLbNBXh4at
         OevmDkn2xEbgQoROiCbDiZmS2ruIAhmxoYvBR8btTJcodApnZBCTckI52xCyqA6PHLdn
         7NThVx6FeAe1yktWhb1wBZ7mQQSwUVYqm7VG/tMfRlHNnYfBPn0mIDiMAhOedV/Xy9rW
         jeGjPvOzLH0mxFp22B6MvY1Gt31PBDW68lKdkJ2k66Ny557lSDomEe8PZzPNLP/U6CS+
         hTkw==
X-Forwarded-Encrypted: i=1; AKwUvBw4LKDxfMZEn1cGPXYpxY1N0YmTr9EGzGM9m7SHnLFzuW1l0nVvdU+mOesNg6W/2f3eakykuODvbUqtjR0=@vger.kernel.org
X-Gm-Message-State: AFuF++nZwaNhznSoAttb9EcYgE9f07A3DqQ0XAUq31bV9pg0V8usz5yS
	EJdohPgEQc0ND7xR08w864AwawJUblKMx9nIoq6v9N/XmohgFZE1ZHEz
X-Gm-Gg: AYBFou3R/X8B83uFEMicXZpGt2QWCPuYONj+dXt9uLiJRJns/kSfqDjvRgpHWWgDpCY
	ym8R1AiCfm6e16aCTipedOuEuucUEMEBMe/I420v2Zeeu921w08KC8sm5pM5d6gjpSitRZrrzm7
	iyL6rVhu2QNfAAvt00fMOCaV2ju3/NwXtlQbP3E1vhJAhkjxY37sPg8RnkSWftsY9GTpDG861Ah
	TJlHC3H1rysRDZSWSHPuWgArId0+3DNygM66iVPGhm2HMedCV2mvurbRiFFdv2VkogDr7hO3BLk
	rMLSYqMF72M2pWM87nQGawWLOVy+wLbMLwpToau7FCTvM7PDNNbVUolPXZbcPv5tIPJvdiBXd+7
	2FMgzsJxQO2jcJDcUBYW+N0pdWxYQ2UldQNIk3nMSo5WPCZVbFrmJbwwWbzWfdJ7uzViWg98Gbu
	OO0X/j19WSbtIoh0THij8yMbmYO0kK6DCczQeEHuSsXTgFHFCxYCr7f/3vHerojNJFpai3Uflot
	7X5SCEwohfdpF6WR2sbZUbFbI+7B06dug==
X-Received: by 2002:a17:90b:5543:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-398bab83160mr1221956a91.3.1787997288891;
        Sat, 29 Aug 2026 02:54:48 -0700 (PDT)
Received: from cachyos-aura ([2409:40f2:3104:d691:c7eb:3b03:2c8d:127f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783c37sm15775697eec.6.2026.08.29.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:54:48 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: nika@nikableh.moe,
	emmanuel.grumbach@intel.com,
	helgaas@kernel.org,
	markpearson@lenovo.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH wireless 0/2] wifi: iwlwifi: recover the device after it loses power in D3cold
Date: Sat, 29 Aug 2026 15:24:35 +0530
Message-ID: <20260829095437.44716-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On several Meteor Lake laptops the Intel BE200 does not survive a D3cold
transition: the platform's _PR3 power resource genuinely removes the M.2
module's rail, and the card does not restart when the rail and PERST# are
restored. Config space reads 0xffffffff, the link never trains, and the
device stays gone until a reboot.

iwlwifi already has everything needed to recover it. The platform-level
device reset walks _PRR and evaluates _RST, and the vendor _DSM that arms
it is already spoken. The problem is ordering: arming happens from the
removal path, by which point the device no longer answers, and the _DSM is
gated on the firmware reading the device's PCI ID back out of config
space. So arming can never succeed at the one moment it matters.

Patch 1 arms it at probe, while the device still answers. Patch 2 asks for
a product reset when the device is not on the bus after resume, instead of
re-initialising hardware that is not there.

Analysis, register dumps and the discussion this came out of:
Link: https://lore.kernel.org/all/20260829093922.37103-1-navonjohnlukose@gmail.com/

Tested on a Lenovo Yoga Pro 7 14IAH10 (BIOS QGCN35WW), BE200
SUBSYS_00F48086: the card dies in D3cold on every s2idle exactly as
before, and recovers on its own in about 5s, repeatedly, with wifi both
connected and idle at suspend time. With the reset skipped but everything
else identical it stays absent, so the reset is what recovers it rather
than the remove/rescan.

Caveats: one machine and one BIOS, discrete (!integrated) path only - I
have no CNVi hardware, so the integrated arming mask is untested.
Recovery costs ~4.3s of Sleep() inside the platform's _RST, which is
firmware and not something we can shorten.

Tagged for stable: the PLDR path has never worked on platforms with this
_DSM gate, and both changes are small and self-limiting - every _RST
evaluation is already preceded by set_product_reset() setting the mode
that reset wants, so arming at probe cannot alter the behaviour of any
later reset.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Navon John Lukose (2):
  wifi: iwlwifi: pcie: arm the product reset at probe
  wifi: iwlwifi: pcie: request a product reset when the device is gone
    after resume

 drivers/net/wireless/intel/iwlwifi/pcie/drv.c          | 12 ++++++++++++
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c |  5 +++++
 2 files changed, 17 insertions(+)

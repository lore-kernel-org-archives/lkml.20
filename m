Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D3DA5DA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491351; cv=none; b=XlIZae8LID7NJ4J52gV/JIr3d5vedqDu3Y6m4ZJ/77rtPK0VJqmid2VJ4kVJ2GPcmaAlSQQ7ICgoJ5sAu/yKL5ua2nK3TMupyeLcqLjVUlxlMRqX9gOLT/fYZhIv+jncXtmR+ayQdaDTLH3LCAdU+e1mQKqQuA7HAIfUd67uRC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491351; c=relaxed/simple;
	bh=GqNZFFS4eTIb708Eoy/tXQ66KdSn0Lvhue0RwL47s4A=;
	h=From:To:Cc:Subject:Date:Message-ID; b=FaPfmHz9P8RCgEjuGW0KHAH0pTvjqWYv7d3rG2nZDVEV7zzvadH2Ch0W52OqKCM9CWQ061OQcOzKpd/K5ktlckDNRWMGrTbY3ygU1ZHEuj/QR1FimViVUwYYh7lbHfB8mQLpvACXqY3LXbdhMpkKxYsGBoCSn27I7Pb2juVdgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=ESbe4Ntt; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="ESbe4Ntt"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso3892375a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791491348; x=1792096148;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0ZTgl3gzHMxU8rZBcoHFObnSv/9xICBYZH4gzmLfRc=;
        b=xDYCwZDWfq+rHCjL8ZIvQ4e+CVP2OYBWAbSPOPgVR+F/9G0yP7B9F3JAkavREG6S/o
         oGZxXqefklnQEl2buP04uuG0DjJhHe7KVyTp5BpXrsgC/10IxoBQk1bDDK/tp6+CcePJ
         34UWV4NBlDeoKRaYubXVcFGTQGE226gAh+KI5OvMOwKckNnqI2rsXF36cWMUl+4n+pM7
         6mNlfloduKkWy2kKoVKegz2US8LR8OV7u7rWwLru0YXW/O7WtDbYnuHIJCHo3+FuFAW7
         Ofahx5XK+JqnFQqsqIoltOyx7hyQ8/9fh4X5/CLslxMsDGVO6CgMg7pmUhyG7M7HZsHk
         F2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBw4bNreD/oXOM1n6L1MxzV4Y2IwAmcH1cTESAuKqwKUctpFMGot2bJyCwyPhkoBwmY7XqB0U/4sfzLddL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPREF67rQETpUKANHP9mT6m2VfHARafSOs24aSX9D2m5nH9Mou
	3Ko4gF4NlFYDnWP8tCZI/uGBnV4CKVoGlydZ7NgnWnmReB577cOsI7uj39hqFxbIZk5rNMliYuY
	ltHcptIABO6DdXCqVa00oHlSAKIoT9tndcw==
X-Gm-Gg: AYBFou1EY+nEk1+b3t4Q9enSKChrlJH88qlkDRzCbjwPn7HDN6ZCMBR2F4Dt0zyv9OZ
	EYlzRrI3mmd9yInMHVh6qRqrftreZRs7HV8UzWZeTfwDBgLI5hWRcTOqosDC+M1elchQfZx4thE
	ZEPc4TC0KxVoRN0oFqG4i+ZP6/vQBPfGmyXfGF6Ez+4r2OfYDnfpm8IyrX9U6qSJyv3yvoG3FLI
	4A9JQ08kr6YSfcz8D7cMeEpn8BsYOewccbn8wBi4NzLRZ0Yp6VuVBMzUCKZBfnlwvfrad208J9y
	gPsmLoWiexE6gxmh3v0fh2gxeLFVfFDvM434fPW7JJDs45Wx+nUDcV+f77o7+5vHhsKrNo09P7U
	fpnNYZdBFCziDo/LIJcF4Vqjy9UK/WMapcAFYvxCTjP2h2BywOORlJmbHUBM=
X-Received: by 2002:a17:90b:5483:b0:3a8:6424:b1b1 with SMTP id 98e67ed59e1d1-3a8a1ab7705mr5561957a91.33.1791491348558;
        Thu, 08 Oct 2026 13:29:08 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-54-84-120-176.compute-1.amazonaws.com. [54.84.120.176])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab36e34040sm101802a91.7.2026.10.08.13.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:29:08 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1791491347;
	bh=u0ZTgl3gzHMxU8rZBcoHFObnSv/9xICBYZH4gzmLfRc=;
	h=From:To:Cc:Subject:Date:From;
	b=ESbe4NttCxfd+SKabiUWx7Vhpj+uqDMw5OweWOHbqvc+Sfy0zTNfkCmrMF39g5xxp
	 7dbDDMbZhV9cpyECp1X03fk/DimWsomsi54QolxKMZuk0wYS1M8QRVcTLbgfc1QuW1
	 AxYQ0wA2VffZKLWtunS8kn+UbY1NYO6xkv9nZI6q5WJvyohmJqIC3YMqY4TPf4/j3l
	 4/++rYGL+HVLTUZPkq5obVPGtXPf9iqTd8RVWgQMYajQBkzVcxdUpMdvAhaAIUBX09
	 TFk1vo2TZ0/sgquwYniiYxGORbMp1ITjnQ/wMMnDtpSX9S9U5i1vpdnndUWKK681nx
	 wR8EYL7s3uZVg==
Received: from kevmitch-g-eos-trunk-kernel7-2026-09-06.sjc.aristanetworks.com (unknown [10.242.71.193])
	by smtp.aristanetworks.com (Postfix) with ESMTP id D8BACC047B;
	Thu,  8 Oct 2026 20:29:06 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Kevin Mitchell <kevmitch@arista.com>
To: Vasant Hegde <vasant.hegde@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Kevin Mitchell <kevmitch@arista.com>,
	stable@vger.kernel.org,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	iommu@lists.linux.dev (open list:AMD IOMMU (AMD-VI)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/amd: allow identity domain during device release
Date: Thu,  8 Oct 2026 13:25:27 -0700
Message-ID: <20261008202530.14501-2-kevmitch@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

A warning is triggered in amd_iommu_release_device() on removal of a
device with an IOMMU_RESV_DIRECT region. The warning is based on the
false assumption that correct attachment to the release_domain will
always result in a NULL dev_data->domain pointer. For devices with
IOMMU_RESV_DIRECT (and consequently dev->iommu->require_direct), the
release domain is the permanent identity_domain which sets
itself to dev_data->domain on attach.

This behaviour was added in commit e94160488e65 ("iommu: Generic support
for RMRs during device release"). Commit c21b34762e2f ("iommu/amd: Set
release_domain to blocked_domain") caused it to take effect for AMD
IOMMU.

Explicitly allow the identity domain pointer to be set. Keep the warning
for any other non-NULL domain.

The warning was observed for a device with direct mapped region:

/sys/bus/pci/devices/0000:04:00.0/iommu_group/reserved_regions:

  0x00000000fee00000 0x00000000feefffff msi
  0x000000fd00000000 0x000000ffffffffff reserved
  0x0000fffd00000000 0x0000ffffffffffff direct

Upon hotunplug:

[   28.715475] pcieport 0000:00:03.1: pciehp: Slot(0-3): Link Down
[   28.715482] pcieport 0000:00:03.1: pciehp: Slot(0-3): Card not present
[   28.715601] ------------[ cut here ]------------
[   28.715603] WARNING: drivers/iommu/amd/iommu.c:2521 at amd_iommu_release_device+0x5d/0x70, CPU#4: irq/29-pciehp/99
[   28.715657] RIP: 0010:amd_iommu_release_device+0x5d/0x70
[   28.715687] Call Trace:
[   28.715689]  <TASK>
[   28.715694]  iommu_deinit_device+0x84/0x110
[   28.715699]  __iommu_group_remove_device+0xa8/0xd0
[   28.715703]  iommu_bus_notifier+0x48/0x70
[   28.715707]  notifier_call_chain+0x48/0xe0
[   28.715712]  blocking_notifier_call_chain+0x45/0x60
[   28.715716]  bus_notify+0x3b/0x60
[   28.715720]  device_del+0x259/0x3b0
[   28.715730]  pci_remove_bus_device+0x85/0x100
[   28.715735]  pciehp_unconfigure_device+0x9d/0x180
[   28.715743]  __pciehp_disable_slot+0x47/0xe0
[   28.715747]  pciehp_handle_presence_or_link_change+0x80/0x5e0
[   28.715753]  pciehp_ist+0x162/0x290

Fixes: c21b34762e2f ("iommu/amd: Set release_domain to blocked_domain")
Cc: stable@vger.kernel.org
Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
---
 drivers/iommu/amd/iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 56262f6b1f70..770717e36333 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2548,11 +2548,17 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	return iommu_dev;
 }
 
+static struct protection_domain identity_domain;
+
 static void amd_iommu_release_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
 
-	WARN_ON(dev_data->domain);
+	/*
+	 * Devices with direct mapped regions are attached to the
+	 * identity_domain as their release_domain.
+	 */
+	WARN_ON(dev_data->domain && dev_data->domain != &identity_domain);
 
 	/*
 	 * We keep dev_data around for unplugged devices and reuse it when the
@@ -2953,8 +2959,6 @@ static struct iommu_domain blocked_domain = {
 	}
 };
 
-static struct protection_domain identity_domain;
-
 static int amd_iommu_identity_attach(struct iommu_domain *dom, struct device *dev,
 				     struct iommu_domain *old)
 {
-- 
2.51.0


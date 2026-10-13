Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60999542ED2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930274; cv=none; b=VKKRWED9GrjD/5fTBwiz0n7WcKqNynyEWa01pH42h7Hak3EbYk+qf10RneDycj9Ii/67NRjjxNHDaVN2wLyaVmK2o3ywwiZ3AqfBAMD0qlmBxLVC/EufbDTuc/24AEAlEbyBV6L/i6okUIiXZdmN6A9gFy+tCQhevwsqGWYp8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930274; c=relaxed/simple;
	bh=xeG+6zsHNxaofEpn+IDai4QFfLfvoqgpvt7iBrtW77g=;
	h=From:To:Cc:Subject:Date:Message-ID; b=e+XyGiCRE9T0k2QpYshFfsK1jszD3hduv3dCDp22Ffd2U+82ch1tmlHkpTAcqzm5FQlUhhQgqrMm/+HxJjPTxc9C6QD/pTCD/yG2vAV4oAj123Y8LDkdu/7jZO07CJWyVDZlSa9SoEoZDFF0vvpk4CqhyzkbjUjKd6cHt+/daLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=anYWvExi; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="anYWvExi"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1343202a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930273; x=1792535073;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8HIys3aRcsefAWT3Gc8dYRYX6Gou+n6wg9ALuLIQ9c=;
        b=EadMlmt8ea8aqUu+hqtO6JhDhjmM2KyobUnsk2DBaMN7IMWNWAGOCPp7TV6CATFWaB
         dREgsVriM1yDxRKYI2Sl0euxtnQE6D+D5PQom6Mb2fBkOIXKbjM4A0lc/vBdoMqviKLR
         c5Q2CSyRJt5Izc1o/IdTAfyO31xlVlnAqCVUhmMLuGBdyUNBAaO8lSjugcYqeB3/igj/
         amyubpiODNpHxcxZCSocCyzItSPY7Lvzc/sEIzONsmgVJ/p3p4OI8m7ts0OetsNCIfzu
         X4uzhQsNA7+BXZZz9+Rx2hx4XBZMiHwJw55K2Wy/wLgfU9C1GE+Wz5FOrt+pYN2r7TQ7
         hYfg==
X-Forwarded-Encrypted: i=1; AKwUvBznOCvOYB7suxe9dREYvCSd7vN9lv+MRQ0eawaC7PFLXZ6utqkglrLoL6DZAcHLEZx2X3SzTGqHiSPZJp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlj8c4qlnxmOQYOQifv+9ipzp8BJdukZilLahVrpAAOMDvsidO
	6AhK4kyf3V49dCHwQgscWJbjlqMNrtgKwhb+GnUwB6pJAuOZ2tskZy/5EuH37gxOxuQLYkRiuIX
	GWpjkaSf7FxWnX13J/NziQ/SCWDo6C8AYCA==
X-Gm-Gg: AYBFou3W1LFDNHnA4shUflaEoVaYQ5dDrey1Ck90OShG5a3gHiMuFazMs4ELPXER7A1
	FBI52c3YMusZMzxZyZxfwsXhU27COSSrAX2drKpvPLAAkShIY8V4ie7xbv7/3FdkTanNcRxofwl
	xxdnhg+FKif9OqmhtPbgOKJKwwtlcY1s5+Ho+AbK/C9Xr8X0A2TV9XPFeU3+yefEw/34Ug/HpLP
	0gR40cluspJKh1zjpsB5Vt5YIPnNnY5sGljj2FBj16Bh9MKTdFl9B+FgiA/yNs5KOwBwdky8cmt
	Nk5R/s27e9MAHdZ9LJLfYNUuFmf7dgwdvoK7XNltQXSj4aCDgcmYROmtwiu+b/bjIl5MJjmSHMw
	5Td969fxVKOEqep/fjrY4MKc02pPD8PBw6w==
X-Received: by 2002:a17:90b:55cb:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3ac403d6baamr2650387a91.43.1791930272663;
        Tue, 13 Oct 2026 15:24:32 -0700 (PDT)
Received: from smtp.aristanetworks.com (mx1.aristanetworks.com. [74.123.28.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac60b871dcsm512946a91.8.2026.10.13.15.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:24:32 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1791930272;
	bh=v8HIys3aRcsefAWT3Gc8dYRYX6Gou+n6wg9ALuLIQ9c=;
	h=From:To:Cc:Subject:Date:From;
	b=anYWvExiphAvh0hGqgxcgScSUkf2wfl+8awNYR1hJ0YsOZm1BdDx6ZLxGBGKqjnL9
	 mjd5gkRThgJi9cLU14+LxIH5sb3m2tM9WyZireUftn0XOpyfuuslIZaWVU6q3Vd6KF
	 VHU5KgsTlLMxznqW7Lu96PLRPO1RssL28hFbMe7WSgIqFxav0gIMlO7O5FJajcI6tv
	 v6DUkKod++5HSnm3/sPnvVGcZpVgtXfet7Um/eGElUziVgjflYmTtzxaBeiSj5HY7I
	 b7bu3hIV/Nhwb0URjCxztwJvlHvlbV6RXzNSdazSI8h3V8K1UK93lOjmaanQ0p2oyk
	 5/lSvlTPi+E3Q==
Received: from kevmitch-g-eos-trunk-kernel7-2026-10-08.sjc.aristanetworks.com (dhcp-244-140-144.sjc.aristanetworks.com [10.244.140.144])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 15B45100493;
	Tue, 13 Oct 2026 22:24:32 +0000 (UTC)
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
Subject: [PATCH v2] iommu/amd: remove obsolete domain pointer warning on release
Date: Tue, 13 Oct 2026 15:23:56 -0700
Message-ID: <20261013222402.673852-2-kevmitch@arista.com>
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

Remove the warning as it is no longer strictly an error to have a non-NULL
domain pointer. As this leaves amd_iommu_release_device() empty, remove it.

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
Changes in v2:
- Remove the warning alltogether as well as the now-empty
  amd_iommu_release_device()
- Link to v1: https://lore.kernel.org/r/20261008202530.14501-2-kevmitch@arista.com

 drivers/iommu/amd/iommu.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 56262f6b1f70..d07abc342247 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -489,6 +489,10 @@ static void setup_aliases(struct amd_iommu *iommu, struct device *dev)
 	clone_aliases(iommu, dev);
 }
 
+/*
+ * We keep dev_data around for unplugged devices and reuse it when the
+ * device is re-plugged - not doing so would introduce a ton of races.
+ */
 static struct iommu_dev_data *find_dev_data(struct amd_iommu *iommu, u16 devid)
 {
 	struct iommu_dev_data *dev_data;
@@ -2548,18 +2552,6 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	return iommu_dev;
 }
 
-static void amd_iommu_release_device(struct device *dev)
-{
-	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
-
-	WARN_ON(dev_data->domain);
-
-	/*
-	 * We keep dev_data around for unplugged devices and reuse it when the
-	 * device is re-plugged - not doing so would introduce a ton of races.
-	 */
-}
-
 static struct iommu_group *amd_iommu_device_group(struct device *dev)
 {
 	if (dev_is_pci(dev))
@@ -3205,7 +3197,6 @@ const struct iommu_ops amd_iommu_ops = {
 	.domain_alloc_paging_flags = amd_iommu_domain_alloc_paging_flags,
 	.domain_alloc_sva = amd_iommu_domain_alloc_sva,
 	.probe_device = amd_iommu_probe_device,
-	.release_device = amd_iommu_release_device,
 	.device_group = amd_iommu_device_group,
 	.get_resv_regions = amd_iommu_get_resv_regions,
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
-- 
2.51.0


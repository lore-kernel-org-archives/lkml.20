Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CA501291
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982777; cv=none; b=kRMvdmxjMlOJoIHsKi59TSGUA8X1WkbakbCrw3HhmsI2yGiUHnOMFVZ2cUUYybkCaT1xhWDJGjo9prb2qieUAkuSZYvpF20aRtQLgc4wwfC2OiNNESFkiUhon/k3Vw/3WOEoV18yPhoR6XvjMBfV2LIm0dNb5FT9ah5b1uslHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982777; c=relaxed/simple;
	bh=hYpWg6LR7aM2r0rm24GBlRLmn7ycEzlqWb9KqXmtfdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=loxZuUltMyDCcoEUiUUyPqrOrd3Y1dP2AAtB2FD9yODE5K1oAmfQdtA1AWAYznovPDuaODAnQSA9kOWUM3hGI865tvORSlMhRhatyM7ClexmeK7PvPS/wIDeLEskjCJLD1F8CbxhsTy32VlZPZRWIDmbb85dFuW+JeVYYjPm1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iujTBTLp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iujTBTLp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cc1ab5f6cso488504185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982763; x=1792587563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYlhwFkUpCVKjfexAmtqqH1N+XVRono8VvtEAovIlYc=;
        b=iujTBTLp7yOiL3CKRxiHYLvhGw2s5yrwlw480MfKxEi0fVkF3CCGDSvBU1CctZi1v4
         ET8O9WcS8R0Mus+l65hr/HKyyFGM/bnXkz18RMuR0hfO/zHR8f3/sIguMI5FdG71yzE0
         CaMgvkoKyP+ROAZxlyxtSCO7BWWYdR3jVBH9zyf+w32j2rnrj5/KJdSX9hHKULZWUn/3
         cVXTnYMzSAJkshxQJGWOdeyKhcfn1u0cfJ1vhQK0h2NGOAbOWbBAO5Vkv6WKYfMa8QlW
         FoF2W+dRI0/BmLHDMJHA7EOXKhJOgog3znIQhrQfLs5zmLDN/Q6+TCfY1KOBzhCxyxIQ
         V5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982763; x=1792587563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYlhwFkUpCVKjfexAmtqqH1N+XVRono8VvtEAovIlYc=;
        b=OzRYgTaIrlGNlO7LbOY3tnE4JuQ5BFx2FscC1qCaiiNo+qTm8qJGDA4a8H8KRsvR9d
         sxBEKk/O2oeg4zDi8MTOicRIhbLY8wRIlRbi+J+nQDY7kNBIYD/mtIp7hlSUwTM/FdOs
         GYwurBXysS4zvLIVcTcLcT+HuoCI1T38o3CyyZSCfDJj97Q0d4iR0kpWdBjZx4hWR3d1
         69d8uh9cItQmx1FTBKz5RTl/4NUhNYDhAadJEIQFWldjVv6WjjzzUY0erfGWki6O7Ag/
         QNb9c0jLxy1vOSxtHJ34JtuTiUS4/E4XCw/0sQcVt+zoY3kd3u5aH6EJYobzKAS/oyRr
         v53A==
X-Forwarded-Encrypted: i=1; AKwUvBwGry5yQ9pMcKaB2tk2fO7ePSYgIUwXf7YV1an+70e58id4VVsqNSM+BrvBxZkX2MKHC2iJ7PgypFtetfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEP803YDdH4uOr/ohb/tQG2hVXm79B8WfurMAEas0DLH0xM7n+
	UCrOVXgoobmC2NbFJFF2TXj6OWL+LyKPZr8PoSKl+PgDiwVjsIEtgnay
X-Gm-Gg: AYBFou23OCAB2CaObSCWgI7fTWKgQ4qha2zgMLHT+L9uKJeaAR8Gi1s4vzF/0lIcuGB
	LneYscy5xG0e/2g+JR48KlasXoRxLlcIwGAXKDNo/L15BBaTMeCimq/BwRA139+gJifmWvr4XNE
	w/+uvvWcOa/ysftwNsW+iXI/c/ICsiwOx0lqSCTjU1yVwC2e+naq2s6RfnzCu8/8CTwg0GrOEIi
	VkJVUTSdP3iBeOHD0YjdiAltagSVOEgTI4zUrc4EJgwszgM+Whovz0DJgHG0XtKm/q8pK08T1mv
	N3jG7SV8x5qc7tvS0VoZrSmz3TuZCdXfJtZoQnmkh8gST2ryVI1F01mWl6X3PNyNSo6YMMS2/eC
	CRltcL5qGocv9CcbsFe1seYeROJHD7mBCCNbXycsDlnAfSX3l98wWucCco6OFF3llDP6axjiYHN
	kVHEv3/+fTn6RfC0Rw1siSZSKMvJy1fy6rJjq06WVLxDjncLXUEEu4O0Vet17lfL16Zz5zF0CGS
	DPUdPg2kRoy7H828jpYmM763eBajsXMtDDRb8U3wfjxlKN9wZ299+1trkQLYNHOUAGycMbuJg==
X-Received: by 2002:a05:620a:44c1:b0:93e:9927:fd34 with SMTP id af79cd13be357-93ebd2244camr2410037485a.28.1791982763407;
        Wed, 14 Oct 2026 05:59:23 -0700 (PDT)
Received: from DESKTOP-DIIS71I ([178.157.168.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5051333sm484825285a.28.2026.10.14.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:59:22 -0700 (PDT)
From: Rand Deeb <rand.sec96@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: deeb.rand@confident.ru,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	shda@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] ata: libata-core: Ignore forced transfer modes the host does not support
Date: Wed, 14 Oct 2026 15:59:16 +0300
Message-ID: <20261014125916.1975-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libata.force parameter can force a transfer mode (pio0-6, mwdma0-4,
udma0-7) for a port or device. ata_force_xfermask() applies it in
ata_do_set_mode() right after ata_dev_xfermask() has limited the device
masks to what the host supports. It replaces those masks with the forced
mode without checking the host masks, so a mode the controller does not
support is passed to the driver's ->set_piomode() or ->set_dmamode().

Several PATA drivers rely on the host masks to keep the mode number in
range when indexing their timing tables. ata_piix, pata_efar,
pata_it8213, pata_oldpiix, pata_radisys and pata_rdc declare ATA_PIO4
and ATA_MWDMA12_ONLY, index a five-entry PIO timing table with
pio_mode - XFER_PIO_0, and index a three-entry needed_pio[] table with
dma_mode - XFER_MW_DMA_0. Booting with libata.force=pio5, pio6, mwdma3
or mwdma4 makes them read past those tables, use the values read as
further indices into the timing table, and write the result to the
controller's timing registers.

Make ata_force_xfermask() ignore a forced transfer mode that is not in
the port's PIO, MWDMA or UDMA mask, and warn about it. Forcing a mode the
host supports still works as before, including a mode that
ata_dev_xfermask() removed for the device or cable.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 332673257056 ("libata: implement libata.force module parameter")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/ata/libata-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 92233fb25..324aaa81c 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -434,6 +434,7 @@ static void ata_force_link_limits(struct ata_link *link)
  */
 static void ata_force_xfermask(struct ata_device *dev)
 {
+	struct ata_port *ap = dev->link->ap;
 	int devno = dev->link->pmp + dev->devno;
 	int alt_devno = devno;
 	int i;
@@ -458,6 +459,17 @@ static void ata_force_xfermask(struct ata_device *dev)
 
 		ata_unpack_xfermask(fe->param.xfer_mask,
 				    &pio_mask, &mwdma_mask, &udma_mask);
+
+		/* Never force a transfer mode the host does not support */
+		if ((pio_mask & ~ap->pio_mask) ||
+		    (mwdma_mask & ~ap->mwdma_mask) ||
+		    (udma_mask & ~ap->udma_mask)) {
+			ata_dev_warn(dev,
+				     "FORCE: %s not supported by the host, ignored\n",
+				     fe->param.name);
+			return;
+		}
+
 		if (udma_mask)
 			dev->udma_mask = udma_mask;
 		else if (mwdma_mask) {

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.39.5

